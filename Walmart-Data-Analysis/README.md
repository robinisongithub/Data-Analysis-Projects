
# Walmart Data Analysis Project Using SQL

This project aims to explore the Walmart Sales data to understand top performing branches and products, sales trend of of different products, customer behaviour. The aims is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.




## About | Data

This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows.

## Columns

- invoice_id
- branch
- city
- customer_type
- gender
- product_line
- unit_price
- quantity
- VAT   tax
- total	The total cost of the purchase
- date	The date on which the purchase was made
- time	The time at which the purchase was made
- payment_method	The mode of payment
- cogs	Cost Of Goods sold
- gross_margin_percentage
- gross_income
- rating

## Analysis

1. Product Analysis
2. Sales Analysis
3. Customer Analysis

## Approach Used

1. Setup a Mysql Server on Proxmox VM (Ubuntu live server).
2. Set up SQL Client on Local Machine and configure the connection.
3. Import the dataset into the database and start querying.

### Data Wrangling
1. Check for Null values.
2. Check for Mis-spelled words.
### Feature Engineering
1. Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

2. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

3. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

### EDA (Exploratory Data Analysis)

## Business Questions.






- How many unique cities does the data have?
- How many unique product lines does the data have?
- What is the most selling product line?
- What is the most selling product line?
- What is the total revenue by month?
- What month had the largest COGS?
- What product line had the largest revenue?
- What is the city with the largest revenue?
- What product line had the largest VAT?
- Which branch sold more products than average product sold?
- What is the most common product line by gender?
- What is the average rating of each product line?
- How many unique customer types does the data have?
- What is the most common customer type?
- Which customer type buys the most?
- What is the gender of most of the customers?
- What is the gender distribution per branch?
- Which time of the day do customers give most ratings?
- Which time of the day do customers give most ratings per branch?
- Which day of the week has the best avg ratings?
- Which day of the week has the best average ratings per branch?
- Number of walmart sales made in each time of the day per weekday ?
- Which of the customer types brings the most revenue?
- Which city has the largest tax/VAT percent?
- Which customer type pays the most in VAT?