# Load necessary libraries
library(readxl)
library(dplyr)
library(tidyr)
library(openxlsx)

# Define file path
file_path <- "C:/Users/User pc/Documents/NNNGO project/Annual Expenditure Spent_Processed.xlsx"

# Read the Excel file
data <- read_excel(file_path, sheet = 1)

# Inspect the first few rows
head(data)

# Identify rows that contain percentages (assuming they alternate)
freq_rows <- seq(1, nrow(data), by = 2)   # Frequency rows
percent_rows <- seq(2, nrow(data), by = 2) # Percentage rows

# Extract frequency and percentage data
freq_data <- data[freq_rows, ]
percent_data <- data[percent_rows, ]

# Rename percentage columns to indicate they contain percentages
colnames(percent_data)[2:ncol(percent_data)] <- paste0(colnames(percent_data)[2:ncol(percent_data)], "_percent")

# Combine frequency and percentage data side by side
data_processed <- bind_cols(freq_data, percent_data[,-1])

# Save the restructured data to a new Excel file
output_path <- "C:/Users/User pc/Documents/NNNGO project/Annual Expenditure Spent_Reshaped.xlsx"
write.xlsx(data_processed, output_path)

# Print success message and display first few rows
print("Data successfully reshaped! Percentages are now in columns beside frequencies.")
head(data_processed)
