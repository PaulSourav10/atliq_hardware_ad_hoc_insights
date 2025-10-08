-- Codebasics SQL Challenge 
-- Requests: 
-- 1.  Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
-- business in the  APAC  region. 

SELECT DISTINCT
    market
FROM
    dim_customer
WHERE
    customer = 'Atliq Exclusive'
        AND region = 'APAC'
ORDER BY market;

-- 2.  What is the percentage of unique product increase in 2021 vs. 2020? The 
-- final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg 

with a as (
SELECT (
	SELECT 
    COUNT(DISTINCT product_code) AS unique_products_2021
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2021
    ) AS up_2021
    ,    
    (
SELECT 
    COUNT(DISTINCT product_code) AS unique_products_2020
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020) AS up_2020
    )
    
    -- -------------------------------------

SELECT 
    up_2021 AS unique_products_2021,
    up_2020 unique_products_2020,
    round((((up_2021 - up_2020) / up_2020) * 100),2) AS pct_chg
FROM
    a;

-- 3.  Provide a report with all the unique product counts for each  segment  and 
-- sort them in descending order of product counts. The final output contains 
-- 2 fields, 
-- segment 
-- product_count 

select segment,
count(distinct product_code) as product_count
from dim_product
group by segment
order by product_count desc;

-- 4.  Follow-up: Which segment had the most increase in unique products in 
-- 2021 vs 2020? The final output contains these fields, 
-- segment 
-- product_count_2020 
-- product_count_2021 
-- difference 

with a as (
SELECT 
    dp.segment,
    fs.fiscal_year,
    COUNT(DISTINCT fs.product_code) AS up_2020
FROM
    gdb0041.fact_sales_monthly fs
        JOIN
    dim_product dp USING (product_code)
WHERE
    fiscal_year = 2020
GROUP BY dp.segment
    ) ,
   b as (
   SELECT 
    dp.segment,
    fs.fiscal_year,
    COUNT(DISTINCT fs.product_code) AS up_2021
FROM
    gdb0041.fact_sales_monthly fs
        JOIN
    dim_product dp USING (product_code)
WHERE
    fiscal_year = 2021
GROUP BY dp.segment
) ,
c as (
SELECT 
    a.segment,
    up_2020 AS Unique_products_2020,
    up_2021 AS Unique_products_2021
FROM
    a
        JOIN
    b USING (segment)
)
SELECT 
    *, Unique_products_2021 - Unique_products_2020 AS difference
FROM
    c;

-- 5.  Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, 
-- product_code 
-- product 
-- manufacturing_cost 

with a as (
SELECT 
    mc.product_code, p.product,manufacturing_cost
FROM
    gdb0041.fact_manufacturing_cost mc
        JOIN
    dim_product p USING (product_code)
ORDER BY manufacturing_cost DESC
LIMIT 1
), 

b as (
SELECT 
     mc.product_code, p.product,manufacturing_cost
FROM
   fact_manufacturing_cost mc
        JOIN
    dim_product p USING (product_code)
ORDER BY manufacturing_cost
LIMIT 1
)
SELECT 
    *
FROM
    a 
    
UNION ALL

SELECT 
    *
FROM
    b
;

-- 6.  Generate a report which contains the top 5 customers who received an 
-- average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market. The final output contains these fields, 
-- customer_code 
-- customer 
-- average_discount_percentage 

with net_sales_cte as (
SELECT 
    fs.date,
    fs.fiscal_year,
    fs.customer_code,
    dc.customer,
    fs.product_code,
    pd.pre_invoice_discount_pct AS pre_discount,
    market
FROM
    fact_sales_monthly fs
        JOIN
    fact_pre_invoice_deductions pd USING (customer_code , fiscal_year)
        JOIN
    dim_customer dc ON dc.customer_code = fs.customer_code
)
SELECT 
    customer_code,
    customer,
    ROUND(AVG(pre_discount), 4) AS avg_pre_inv_dis_pct
FROM
    net_sales_cte
WHERE
    fiscal_year = 2021 AND market = 'india'
GROUP BY customer_code , customer
ORDER BY avg_pre_inv_dis_pct DESC
LIMIT 5;

-- 7.  Get the complete report of the Gross sales amount for the customer  “Atliq 
-- Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 
-- The final report contains these columns: 
-- Month 
-- Year 
-- Gross sales Amount 

with a as (
SELECT 
    *
FROM
    fact_sales_monthly fs
        JOIN
    fact_gross_price gp USING (product_code , fiscal_year)
),
b as (
SELECT 
    *,
    ROUND((sold_quantity * gross_price), 2) AS gross_price_total
FROM
    a
    join dim_customer using (customer_code)
),
 c as (
SELECT 
    DATE_FORMAT((date), '%M') AS month,
    YEAR(date) year,
    fiscal_year,
    gross_price_total
FROM
    b
WHERE
    customer = 'Atliq Exclusive')
    
  
  SELECT 
    month,
    year,
    CONCAT(ROUND((SUM(gross_price_total) / 1000000), 3),
            ' M') total_GP_mln
FROM
    c
GROUP BY month , year;

-- 8.  In which quarter of 2020, got the maximum total_sold_quantity? The final 
-- output contains these fields sorted by the total_sold_quantity, 
-- Quarter 
-- total_sold_quantity 


with a as(
SELECT 
    date,
    MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) AS fiscal_month,
    sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
ORDER BY date 
),

 b as (
SELECT 
    date,
    CASE
        WHEN fiscal_month IN (1 , 2, 3) THEN 'Q1'
        WHEN fiscal_month IN (4 , 5, 6) THEN 'Q2'
        WHEN fiscal_month IN (7 , 8, 9) THEN 'Q3'
        WHEN fiscal_month IN (10 , 11, 12) THEN 'Q4'
    END AS Quater,
    fiscal_month,
    sold_quantity
FROM
    a
    )
    
SELECT 
    quater, SUM(sold_quantity) AS total_sold_quantity
FROM
    b
GROUP BY quater
ORDER BY total_sold_quantity DESC;

-- 9.  Which channel helped to bring more gross sales in the fiscal year 2021 
-- and the percentage of contribution?  The final output  contains these fields, 
-- channel 
-- gross_sales_mln 
-- percentage 


with a as(
SELECT 
    s.*, gp.gross_price, c.channel
FROM
    gdb0041.fact_sales_monthly s
        JOIN
    fact_gross_price gp USING (product_code , fiscal_year)
        JOIN
    dim_customer c USING (customer_code)
), 
b as (

SELECT 
    *, (sold_quantity * gross_price) AS gross_sales
FROM
    a
     where fiscal_year = 2021 ),
     c as (
       
    select channel,
    round(sum(gross_sales)/1000000,2) as total_gross_sales_mln,
    round(sum(gross_sales)/(select sum(gross_sales) from b) * 100 ,2)as pct_contribution
    from b 
    group by channel)
    
select * from c
order by pct_contribution desc;
    

-- 10.  Get the Top 3 products in each division that have a high 
-- total_sold_quantity in the fiscal_year 2021? The final output contains these 
-- fields, 
-- division 
-- product_code 
-- product 
-- total_sold_quantity 
-- rank_order 



with a as (
SELECT 
    fs.*, p.division,p.product
FROM
    fact_sales_monthly fs
        JOIN
    dim_product p USING (product_code)
WHERE
    fs.fiscal_year = 2021
    )
, b as (
SELECT 
    division,
    product_code,
    product,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    a
GROUP BY division , product_code
),
c as (
  SELECT 
        *,
        DENSE_RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
    FROM b
)

SELECT 
    *
FROM
    c
WHERE
    rank_order < 4;


