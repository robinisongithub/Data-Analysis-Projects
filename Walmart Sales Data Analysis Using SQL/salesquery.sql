
select * from walmartsales limit 5;

use projectdata;
describe walmartsales;

select * from walmartsales limit 5;

-- --------------------------------------------------------------------
-- ---------------------------- Generic ------------------------------
-- --------------------------------------------------------------------
-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM walmartsales;

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM walmartsales;

-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------

-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM walmartsales;


-- What is the most selling product line
SELECT
	SUM(quantity) as qty,
    product_line
FROM walmartsales
GROUP BY product_line
ORDER BY qty DESC;

-- What is the most selling product line
SELECT
	SUM(quantity) as qty,
    product_line
FROM walmartsales
GROUP BY product_line
ORDER BY qty DESC;

-- What is the total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM walmartsales
GROUP BY month_name 
ORDER BY total_revenue;


-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM walmartsales
GROUP BY month_name 
ORDER BY cogs;


-- What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM walmartsales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM walmartsales
GROUP BY city, branch 
ORDER BY total_revenue;


-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(Tax) as avg_tax
FROM walmartsales
GROUP BY product_line
ORDER BY avg_tax DESC;


-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average walmartsales

SELECT 
	AVG(quantity) AS avg_qnty
FROM walmartsales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM walmartsales
GROUP BY product_line;


-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM walmartsales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmartsales);


-- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM walmartsales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM walmartsales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?
SELECT
	DISTINCT ctype
FROM walmartsales;



-- What is the most common customer type?
SELECT
	ctype,
	count(*) as count
FROM walmartsales
GROUP BY ctype
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT
	ctype,
    COUNT(*)
FROM walmartsales
GROUP BY ctype;


-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM walmartsales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM walmartsales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;
-- Gender per branch is more or less the same hence, I don't think has
-- an effect of the walmartsales per branch and other factors.

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM walmartsales
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Looks like time of the day does not really affect the rating, its
-- more or less the same rating each time of the day.alter


-- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM walmartsales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Branch A and C are doing well in ratings, branch B needs to do a 
-- little more to get better ratings.


-- Which day of the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM walmartsales
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings
-- why is that the case, how many walmart sales are made on these days?



-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_walmartsales
FROM walmartsales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_walmartsales DESC;


-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- ---------------------------- walmartsales ---------------------------------
-- --------------------------------------------------------------------

-- Number of walmart sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_walmartsales
FROM walmartsales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_walmartsales DESC;
-- Evenings experience most walmartsales, the stores are 
-- filled during the evening hours

-- Which of the customer types brings the most revenue?
SELECT
	ctype,
	SUM(total) AS total_revenue
FROM walmartsales
GROUP BY ctype
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(Tax), 2) AS avg_Tax
FROM walmartsales
GROUP BY city 
ORDER BY avg_Tax DESC;

-- Which customer type pays the most in VAT?
SELECT
	ctype,
	AVG(Tax) AS total_tax
FROM walmartsales
GROUP BY ctype
ORDER BY total_tax;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
