# Complete the 'calculate_average_temperature' function below.

#' Calculate average temperature from different data sources
#' @param df_data File with data about temperature observations
#' @return df_result Data table with average temperature sorted by years and months
calculate_average_temperature <- function(df_data) {
  
  # Ensure source and temperature are numeric
  df_data$source <- as.numeric(df_data$source)
  df_data$temperature <- as.numeric(df_data$temperature)
  
  # Function to parse date in multiple formats
  parse_date <- function(x) {
    # Try "%Y-%m-%d %H:%M:%S CET"
    dt <- as.POSIXct(x, format="%Y-%m-%d %H:%M:%S CET", tz="UTC")
    if(!is.na(dt)) return(as.Date(dt))
    
    # Try "%d-%m-%Y"
    dt <- as.Date(x, format="%d-%m-%Y")
    if(!is.na(dt)) return(dt)
    
    # Try "%Y-%m-%d"
    dt <- as.Date(x, format="%Y-%m-%d")
    if(!is.na(dt)) return(dt)
    
    # Try "%Y %d-%m"
    dt <- as.Date(x, format="%Y %d-%m")
    if(!is.na(dt)) return(dt)
    
    # If all attempts fail, return NA
    return(NA)
  }
  
  # Parse the date column
  parsed_dates <- sapply(df_data$date, parse_date)
  
  # Ensure parsed_dates is a Date vector
  parsed_dates <- as.Date(parsed_dates, origin = "1970-01-01")
  
  # Remove rows where date parsing failed
  df_data <- df_data[!is.na(parsed_dates), ]
  df_data$date_parsed <- parsed_dates[!is.na(parsed_dates)]
  
  # Extract year and month as numeric
  df_data$year <- as.numeric(format(df_data$date_parsed, "%Y"))
  df_data$month <- as.numeric(format(df_data$date_parsed, "%m"))
  
  # Aggregate the mean temperature by source, year, and month
  agg_data <- aggregate(df_data$temperature, 
                        by = list(source=df_data$source, 
                                  year=df_data$year, 
                                  month=df_data$month), 
                        FUN=mean, na.rm=TRUE)
  
  # Rename the aggregated column and round to 2 decimal places
  names(agg_data)[4] <- "temperature_mean"
  agg_data$temperature_mean <- round(agg_data$temperature_mean, 2)
  
  # Convert grouping columns to numeric to avoid factor issues
  agg_data$source <- as.numeric(as.character(agg_data$source))
  agg_data$year <- as.numeric(as.character(agg_data$year))
  agg_data$month <- as.numeric(as.character(agg_data$month))
  
  # Sort results by source, year, month
  agg_data <- agg_data[order(agg_data$source, agg_data$year, agg_data$month), ]
  
  return(agg_data)
}

# Tail

# DO NOT CHANGE THIS CODE

# Open connection
fptr <- file(Sys.getenv("OUTPUT_PATH"))
open(fptr, open = "w")

# Read input 'csv' file
df_input <- read.csv("/dev/stdin", stringsAsFactors = FALSE)

# Process result data set
df_output <- calculate_average_temperature(df_input)

# Save results as 'csv' file 
write.csv(df_output, fptr, row.names = FALSE)

# Close connection
close(fptr)
