# Load necessary libraries
library(readxl)
library(dplyr)
library(openxlsx)

# Define file path
file_path <- "C:/Users/User pc/Documents/NNNGO project/Annual Expenditure Spent.xls"

# Import data from the first sheet (modify sheet name if needed)
data <- read_excel(file_path, sheet = 1)

# Ensure valid column names
colnames(data) <- make.names(colnames(data))  

# Convert relevant numeric columns to include percentages
data_processed <- data %>%
  mutate(across(where(is.numeric), ~ paste0(.x, " (", round((.x / sum(.x, na.rm = TRUE)) * 100, 1), "%)")))

# Print the structured table
print(data_processed, row.names = FALSE)

# Save processed data to a new Excel file
write.xlsx(data_processed, "C:/Users/User pc/Documents/NNNGO project/Annual Expenditure Spent_Processed.xlsx")

