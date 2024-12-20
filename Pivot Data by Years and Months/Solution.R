# Complete the 'pivot_data_by_years_and_months' function below.

#' Pivot data frame by years and months based on orders from input 'csv' file
#' @param df_orders Data frame data from 'csv' file
#' @return Data frame with pivoted data
pivot_data_by_years_and_months <- function(df_orders) {
  
  # Convert the date column to Date type
  # The input may not have quotes around the date, so we ensure it parses correctly
  # If the date is in a format like 2019-01-04 without quotes, this should still parse correctly.
  df_orders$date <- as.Date(df_orders$date, format="%Y-%m-%d")
  
  # Extract year and month
  df_orders$year <- as.numeric(format(df_orders$date, "%Y"))
  df_orders$month_num <- as.numeric(format(df_orders$date, "%m"))
  
  # Create a month abbreviation column
  df_orders$month_abb <- format(df_orders$date, "%b")
  
  # Aggregate by year and month abbreviation to get sum of revenue
  agg_data <- aggregate(df_orders$revenue, 
                        by = list(Year=df_orders$year, Month=df_orders$month_abb), 
                        FUN=sum, na.rm=TRUE)
  
  # Rename the aggregated column
  names(agg_data)[3] <- "revenue_sum"
  
  # Get distinct months in ascending order of their numeric month
  month_order <- unique(df_orders[, c("month_abb", "month_num")])
  month_order <- month_order[order(month_order$month_num), ]
  
  # Ensure all combinations of Year and Month are present (fill missing with 0)
  all_combos <- expand.grid(Year=unique(agg_data$Year), Month=month_order$month_abb, 
                            stringsAsFactors = FALSE)
  full_data <- merge(all_combos, agg_data, by=c("Year","Month"), all.x=TRUE)
  full_data$revenue_sum[is.na(full_data$revenue_sum)] <- 0
  
  # Reshape to wide format
  pivot <- reshape(full_data, 
                   idvar = "Year", 
                   timevar = "Month", 
                   direction = "wide")
  
  # Sort columns according to month_order
  month_cols <- paste0("revenue_sum.", month_order$month_abb)
  pivot <- pivot[, c("Year", month_cols)]
  
  # Rename columns: Year -> "Year", revenue_sum.Jan -> "Jan", etc.
  colnames(pivot) <- c("Year", month_order$month_abb)
  
  # Ensure columns are numeric
  for (m in month_order$month_abb) {
    pivot[[m]] <- as.numeric(round(pivot[[m]]))
  }
  
  # Compute the mean row
  # Compute means only for numeric columns (months)
  mean_values <- sapply(month_order$month_abb, function(m) {
    vals <- pivot[[m]]
    round(mean(vals))
  })
  
  # Create mean row data frame
  mean_df <- data.frame(Year="Mean", t(mean_values), stringsAsFactors = FALSE)
  colnames(mean_df) <- c("Year", month_order$month_abb)
  
  # Ensure mean row month columns are numeric
  for (m in month_order$month_abb) {
    mean_df[[m]] <- as.numeric(mean_df[[m]])
  }
  
  # Combine pivot and mean row
  final_df <- rbind(pivot, mean_df)
  
  # Year should remain character so "Mean" displays correctly
  final_df$Year <- as.character(final_df$Year)
  
  return(final_df)
}

# DO NOT CHANGE THIS CODE

# Open connection
fptr <- file(Sys.getenv("OUTPUT_PATH"))
open(fptr, open = "w")

# Read input 'csv' file
df_input <- read.csv("/dev/stdin", stringsAsFactors = FALSE)

# Process result data set
df_output <- pivot_data_by_years_and_months(df_input)

# Save results as 'csv' file 
write.csv(df_output, fptr, row.names = FALSE, quote=FALSE)

# Close connection
close(fptr)
