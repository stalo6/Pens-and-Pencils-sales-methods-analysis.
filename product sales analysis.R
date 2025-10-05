# loading necessary libraries
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

# loading the dataset
product_sales <- read.csv("C:\\Users\\stalo\\Downloads\\product_sales.csv")
product_sales


# DATA CLEANING AND VALIDATION

# DATA VALIDATION
summary(product_sales)
glimpse(product_sales)

# looking at the structure of the dataset
str(product_sales)

# converting the sales_method character variables to factors
factor_vars <- c("sales_method")
product_sales[factor_vars] <- lapply(product_sales[factor_vars], as.factor)

str(product_sales)

# DATA CLEANING

# ensuring there are only 3 sales methods
product_sales <- product_sales %>%
  mutate(sales_method = case_when(
    sales_method == "email" ~ "Email",
    sales_method == "em + call" ~ "Email + Call",
    TRUE ~ sales_method  
  ))

# Remove rows where revenue is NA
product_sales <- product_sales %>%
  filter(!is.na(revenue))


glimpse(product_sales)

product_sales %>%
count(sales_method)

# bar plot showing the customer count for each sales method
ggplot(product_sales, aes(sales_method, fill = sales_method)) +
  geom_bar() +
  theme_classic()

# histogram showing the overall spread of revenue
ggplot(product_sales, aes(x = revenue)) +
  geom_histogram(binwidth = 10)

# box plots showing the spread of revenue for each sales method
ggplot(product_sales, aes(x = sales_method, y = revenue))  +
  geom_boxplot()

# Create weekly summary by sales method
weekly_revenue <- product_sales %>%
  group_by(week, sales_method) %>%
  summarise(
    avg_revenue = mean(revenue, na.rm = TRUE),
    total_revenue = sum(revenue, na.rm = TRUE),
    total_transactions = n(),
    avg_units_sold = mean(nb_sold, na.rm = TRUE),
    .groups = 'drop'
  )

weekly_revenue

# line plot showing revenue over time for each of the methods
ggplot(weekly_revenue, aes(x = week, y = avg_revenue, color = sales_method)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Revenue Performance Over Product Launch Period",
    subtitle = "Average revenue per transaction by week and sales method",
    x = "Weeks Since Product Launch", 
    y = "Average Revenue",
    color = "Sales Method"
  ) +
  scale_x_continuous(breaks = 1:6, labels = paste("Week", 1:6)) +
  theme_minimal() +
  theme(legend.position = "bottom")
