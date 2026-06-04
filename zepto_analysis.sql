-- ==========================================================
-- PROJECT: ZEPTO PRODUCT ANALYSIS
-- AUTHOR: Hariom Namdev
-- DATABASE: PostgreSQL
--
-- OBJECTIVE:
-- Analyze product pricing, inventory, discounts,
-- stock availability and revenue potential using SQL.
-- ==========================================================



-- ==========================================================
-- 1. TABLE CREATION
-- ==========================================================

CREATE TABLE product(
    product_id SERIAL PRIMARY KEY, 

    category VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,

    mrp NUMERIC(10,2),
    discountPercent INT,

    availableQuantity INT,

    discountedSellingPrice NUMERIC(10,2),

    weightInGms INT,

    outOfStock BOOLEAN,

    quantity INT
);



-- ==========================================================
-- 2. DATA IMPORT
-- ==========================================================
-- Importing dataset from CSV file

COPY product(
    category,
    name,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice,
    weightInGms,
    outOfStock,
    quantity
)
FROM 'D:\DATA ANALYST\SQL FILES\PROJECTs\ZEPTO\zepto_dataset.csv'
CSV HEADER;



-- ==========================================================
-- 3. DATA CLEANING
-- ==========================================================
-- Converting price columns from paise to rupees

UPDATE product
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;



-- ==========================================================
-- 4. DATA EXPLORATION
-- ==========================================================

-- View complete dataset
SELECT *
FROM product;

-- Verify product IDs and record ordering
SELECT *
FROM product
ORDER BY product_id;
-- BASIC ANALYSIS
-- 1. Display all products whose MRP is greater than ₹1000.
SELECT category,mrp
FROM product
WHERE mrp > 1000
ORDER BY product_id ASC;

-- 2. Find products that are currently out of stock.
SELECT name,mrp
FROM product
WHERE outofstock = TRUE
ORDER BY product_id ASC;

-- 3. Show the top 10 most expensive products based on MRP.
SELECT name,mrp
FROM product
ORDER BY mrp DESC
LIMIT 10;

-- 4. Count the total number of products in each category.
SELECT category, COUNT(name) total_product
	FROM product
GROUP BY category; 

-- 5. Find the average MRP for each category.
SELECT category,AVG(mrp)
	FROM product
GROUP BY category;

-- 6. Display products having a discount greater than 20%.
SELECT name 
FROM product 
WHERE discountpercent > 20;

-- 7. Find the category with the highest number of products.
SELECT category,
COUNT(name) AS high_num 
FROM product 
GROUP BY category
ORDER BY high_num DESC
LIMIT 1;

-- 8. Calculate total inventory quantity available in each category
SELECT category,SUM(availablequantity)
FROM product
GROUP BY category;


-- 9. Calculate the estimated inventory value
--     (discountedSellingPrice × quantity)
--     for each category.
SELECT category,
       SUM(discountedSellingPrice * quantity) AS estimated_inventory_value
FROM product
GROUP BY category;

-- ADVNCE ANALYSIS
-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT
	NAME,
	discountpercent
FROM
	product
ORDER BY
	discountpercent DESC
LIMIT
	10;
	
-- Q2. What are the products with high MRP but out of stock?
SELECT
	name,mrp,outofstock
FROM product
WHERE outofstock = TRUE
ORDER BY mrp DESC;

-- Q3. Calculate estimated revenue for each category.
SELECT category,SUM(discountedsellingprice*quantity)
	AS estimate_revenue
	FROM product
GROUP BY category;

-- Q4. Find all products where MRP is greater than ₹500
--     and discount is less than 10%.
SELECT name,mrp,discountpercent
FROM product
WHERE mrp > 500 AND discountpercent < 10;

-- Q5. Identify the top 5 categories offering the
--     highest average discount percentage.
SELECT category,AVG(discountpercent)
AS avg_discount
FROM product
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g
--     and sort by best value.
SELECT weightingms,discountedsellingprice,
ROUND(discountedsellingprice/weightingms,3) AS per_gram
FROM product
WHERE weightingms > 100
ORDER BY per_gram ASC;

-- Q7. Group the products into categories like
--     Low, Medium, Bulk.
SELECT name,
       weightingms,
       CASE
           WHEN weightingms < 1000 THEN 'LOW'
           WHEN weightingms BETWEEN 1000 AND 4999 THEN 'MEDIUM'
           ELSE 'BULK'
       END AS product_category
FROM product;

-- Q8. What is the total inventory weight per category?
SELECT category,
	SUM(availablequantity*weightingms)
FROM product
GROUP BY Category;

