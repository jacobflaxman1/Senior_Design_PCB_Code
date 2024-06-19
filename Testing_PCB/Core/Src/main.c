/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app_fatfs.h"
#include "i2c.h"
#include "rtc.h"
#include "spi.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <string.h>
#include <stdarg.h> //for va_list var arg functions
#include "icm20948.h"
#include <time.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define RX_BUFFER_SIZE 10  // Define the size of the receive buffer

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
		uint8_t rx_buff[RX_BUFFER_SIZE];
//		uint8_t tx_buff[]={0,1,2,3,4,5,6,7,8,9};
		int status = 0;
		axises data;

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
char RxBuffer[32]; // Buffer to store received data
volatile int timeReceived = 0; // Flag to check if time is received
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
void processTime(char* timeString);
int  waitForUartData(UART_HandleTypeDef *huart);
void UART_SendFixedStringEveryFiveSeconds(UART_HandleTypeDef *huart);
int UART_ReceiveAndPrint(UART_HandleTypeDef *huart);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */



void adjustTimeToPST(struct tm *time_tm, bool isDST) {
    int offset = isDST ? -7 : -8;  // PDT during DST, PST otherwise
    time_tm->tm_hour += offset;  // Adjust hours based on whether DST is in effect

    // Normalize the tm structure
    time_t temp = mktime(time_tm);
    *time_tm = *localtime(&temp);
}

void updateDataAndWriteToSD(void) {

    FIL fil;
    FRESULT fres;
    char readBuf[62];  // Increased buffer size to accommodate date-time and sensor data

    // Fetch current time from RTC
    RTC_TimeTypeDef sTime;
    RTC_DateTypeDef sDate;
    HAL_RTC_GetTime(&hrtc, &sTime, RTC_FORMAT_BCD);
    HAL_RTC_GetDate(&hrtc, &sDate, RTC_FORMAT_BCD);  // This line must be after GetTime

    // Open or create the file for writing
    fres = f_open(&fil, "data.txt", FA_WRITE | FA_OPEN_ALWAYS | FA_OPEN_APPEND);
    if (fres == FR_OK) {

        // Read accelerometer data
        icm20948_accel_read(&data);

        // Convert BCD to binary
        uint8_t hour = (sTime.Hours & 0xF) + ((sTime.Hours >> 4) * 10);
        uint8_t min = (sTime.Minutes & 0xF) + ((sTime.Minutes >> 4) * 10);
        uint8_t sec = (sTime.Seconds & 0xF) + ((sTime.Seconds >> 4) * 10);
        uint8_t year = (sDate.Year & 0xF) + ((sDate.Year >> 4) * 10);
        uint8_t month = (sDate.Month & 0xF) + ((sDate.Month >> 4) * 10);
        uint8_t date = (sDate.Date & 0xF) + ((sDate.Date >> 4) * 10);

        // Format date, time, and accelerometer data into a string
        snprintf(readBuf, sizeof(readBuf), "%04d-%02d-%02d %02d:%02d:%02d - X: %f, Y: %f, Z: %f\r\n",
                 year + 2000, month, date,
                 hour, min, sec,
                 data.x, data.y, data.z);
    }
    else
    {
    	status = -1;
    }

        // Write the formatted string to the file
        UINT bytesWrote;
        fres = f_write(&fil, readBuf, strlen(readBuf), &bytesWrote);
        if (fres == FR_OK) {

            HAL_GPIO_TogglePin(LED_GPIO_Port, LED_Pin);
            HAL_Delay(500);
        }
        else
        {
        	status = -1;
        }

        // Close the file
        f_close(&fil);
}

// Definition of the binary to BCD conversion function
uint8_t BinToBCD(uint8_t bin) {
    return ((bin / 10) << 4) | (bin % 10);
}


void updateRTCFromBuffer(uint8_t *rx_buff) {
    char strTimestamp[13];
    memcpy(strTimestamp, rx_buff, 12);  // Assume rx_buff has at least 12 bytes
    strTimestamp[12] = '\0';

    uint32_t epochTime = strtoul(strTimestamp, NULL, 10);
    time_t now = epochTime;
    struct tm *time_tm = localtime(&now);
    bool dst_active = time_tm->tm_isdst > 0;  // Check if DST is currently active
    adjustTimeToPST(time_tm, dst_active);

    RTC_TimeTypeDef sTime;
    RTC_DateTypeDef sDate;

    // Disable write protection
    __HAL_RTC_WRITEPROTECTION_DISABLE(&hrtc);

    // Clear RSF flag
    __HAL_RTC_CLEAR_FLAG(&hrtc, RTC_FLAG_RSF);

    // Set time
    sTime.Hours = BinToBCD(time_tm->tm_hour);
    sTime.Minutes = BinToBCD(time_tm->tm_min);
    sTime.Seconds = BinToBCD(time_tm->tm_sec);
    sTime.TimeFormat = RTC_HOURFORMAT12_AM;
    if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK) {
    	status = -1;
        // Error handling
    }

    // Set date
    sDate.WeekDay = BinToBCD(time_tm->tm_wday ? time_tm->tm_wday : 7);
    sDate.Month = BinToBCD(time_tm->tm_mon + 1);
    sDate.Date = BinToBCD(time_tm->tm_mday);
    sDate.Year = BinToBCD((time_tm->tm_year + 1900) - 2000);
    if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK) {
        // Error handling
    	status = -1;
    }

    // Wait for RSF flag to be set
//    while(__HAL_RTC_GET_FLAG(&hrtc, RTC_FLAG_RSF) == RESET) {
//        // This loop will wait until the RSF flag is set
//    }

    // Enable write protection
    __HAL_RTC_WRITEPROTECTION_ENABLE(&hrtc);

    // Synchronize RTC
//    HAL_RTC_WaitForSynchro(&hrtc);
}



void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	if (huart->Instance == USART1) {
	        // Assuming that a complete timestamp is always exactly 16 bytes
//	        HAL_UART_Receive_IT(&huart1, rx_buff, 12); // Re-enable UART receive interrupt
	        status = 1;
	        // Now process the buffer to update RTC
	        updateRTCFromBuffer(rx_buff);
	    }
}



/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */
  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */
  HAL_ResumeTick();

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_FATFS_Init();
  MX_SPI1_Init();
  MX_USART1_UART_Init();
  MX_RTC_Init();
  MX_TIM1_Init();
  MX_I2C1_Init();
  /* USER CODE BEGIN 2 */

  HAL_GPIO_WritePin(SD_DAT_2_GPIO_Port, SD_DAT_2_Pin, GPIO_PIN_RESET);
  HAL_GPIO_WritePin(SD_DAT_1_GPIO_Port, SD_DAT_1_Pin, GPIO_PIN_RESET);


  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_0, GPIO_PIN_RESET);

  icm20948_init();
	HAL_GPIO_TogglePin (LED_GPIO_Port, LED_Pin);  // toggle LED
	HAL_Delay(1000);

	//some variables for FatFs
	FATFS FatFs; 	//Fatfs handle
	FRESULT fres; //Result after operations

	//Open the file system
	fres = f_mount(&FatFs, "", 1); //1=mount now
	if (fres != FR_OK) {
//	printf("f_mount error (%i)\r\n", fres);
	}

	else
	{
    	HAL_GPIO_TogglePin (LED_GPIO_Port, LED_Pin);  // toggle LED
    	HAL_Delay(1000);
//    	printf("Success MOuint\n");
	}
	HAL_UART_Receive_IT(&huart1, rx_buff, RX_BUFFER_SIZE);
//

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

 while (1)
 {
	 int isToggledOn = 0;

	 if (status == 1)
	 {
		 if (isToggledOn == 1)
		 {
			 isToggledOn = 0;
		 }
		 updateDataAndWriteToSD();

	 }
	 else if(!isToggledOn && status == -1)
	 {
	    	HAL_GPIO_TogglePin (LED_GPIO_Port, LED_Pin);  // toggle LED
	    	isToggledOn = 0;
	 }
//    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

  }
	// f_mount(NULL, "", 0);

  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_LOW);

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSE|RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = RCC_MSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_6;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure the SYSCLKSource, HCLK, PCLK1 and PCLK2 clocks dividers
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK3|RCC_CLOCKTYPE_HCLK
                              |RCC_CLOCKTYPE_SYSCLK|RCC_CLOCKTYPE_PCLK1
                              |RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_MSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.AHBCLK3Divider = RCC_SYSCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
/* USER CODE BEGIN 4 */




//#ifdef __GNUC__
//#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
//#else
//#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
//#endif
//
//PUTCHAR_PROTOTYPE
//{
//  HAL_UART_Transmit(&huart1, (uint8_t *)&ch, 1, HAL_MAX_DELAY);
//  return ch;
//}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
