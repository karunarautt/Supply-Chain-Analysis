CREATE DATABASE supply_chain_analysis;
USE supply_chain_analysis;
CREATE TABLE supply_chain_data (
    product_type VARCHAR(50),
    sku VARCHAR(20),
    price DECIMAL(10,2),
    availability INT,
    products_sold INT,
    revenue_generated DECIMAL(12,2),
    customer_demographics VARCHAR(50),
    stock_levels INT,
    lead_times INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers VARCHAR(50),
    shipping_costs DECIMAL(10,2),
    supplier_name VARCHAR(50),
    location VARCHAR(50),
    supplier_lead_time INT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs DECIMAL(10,2),
    inspection_results VARCHAR(30),
    defect_rates DECIMAL(10,4),
    transportation_modes VARCHAR(30),
    routes VARCHAR(30),
    costs DECIMAL(10,2)
);
SELECT *
FROM supply_chain_data
LIMIT 5;

SELECT
    COUNT(*) AS total_rows,
    COUNT(price) AS price_count,
    COUNT(revenue_generated) AS revenue_count,
    COUNT(shipping_costs) AS shipping_cost_count,
    COUNT(defect_rates) AS defect_rate_count
FROM supply_chain_data;

-- total product count
SELECT
    product_type,
    COUNT(*) AS total_products
FROM supply_chain_data
GROUP BY product_type;

-- Total revenue by product type
SELECT
    product_type,
    SUM(revenue_generated) AS total_revenue
FROM supply_chain_data
GROUP BY product_type
ORDER BY total_revenue DESC;

-- Total Revenue by Supplier
SELECT
    supplier_name,
    SUM(revenue_generated) AS total_revenue
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY total_revenue DESC;

-- Average Stock Level by Product Type
SELECT
    product_type,
    ROUND(AVG(stock_levels), 2) AS average_stock
FROM supply_chain_data
GROUP BY product_type
ORDER BY average_stock DESC;

 -- Average Lead Time by Supplier
SELECT
    supplier_name,
    ROUND(AVG(lead_times), 2) AS average_lead_time
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY average_lead_time ASC;

-- Average Manufacturing Cost by Product Type
SELECT
    product_type,
    ROUND(AVG(manufacturing_costs), 2) AS average_manufacturing_cost
FROM supply_chain_data
GROUP BY product_type
ORDER BY average_manufacturing_cost DESC;

-- Average Defect Rate by Product Type
SELECT
    product_type,
    ROUND(AVG(defect_rates), 2) AS average_defect_rate
FROM supply_chain_data
GROUP BY product_type
ORDER BY average_defect_rate DESC;

 -- Total Products Sold by Product Type
SELECT
    product_type,
    SUM(products_sold) AS total_products_sold
FROM supply_chain_data
GROUP BY product_type
ORDER BY total_products_sold DESC;

 -- Total Revenue by Transportation Mode
SELECT
    transportation_modes,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM supply_chain_data
GROUP BY transportation_modes
ORDER BY total_revenue DESC;

-- Average Shipping Cost by Transportation Mode
SELECT
    transportation_modes,
    ROUND(AVG(shipping_costs), 2) AS average_shipping_cost
FROM supply_chain_data
GROUP BY transportation_modes
ORDER BY average_shipping_cost ASC;

-- Average Production Volume by Product Type
SELECT
    product_type,
    ROUND(AVG(production_volumes), 2) AS average_production_volume
FROM supply_chain_data
GROUP BY product_type
ORDER BY average_production_volume DESC;

-- Overall Supply Chain Summary
SELECT
    COUNT(*) AS total_records,
    ROUND(SUM(revenue_generated), 2) AS total_revenue,
    SUM(products_sold) AS total_products_sold,
    ROUND(AVG(stock_levels), 2) AS average_stock_level,
    ROUND(AVG(defect_rates), 2) AS average_defect_rate,
    ROUND(AVG(shipping_costs), 2) AS average_shipping_cost
FROM supply_chain_data;


-- Check column names

DESCRIBE supply_chain_data;





SHOW TABLES;
LOAD DATA LOCAL INFILE 'D:/Documents/Desktop/Supply_Chain_SQL_Project/Data/supply_chain_data.csv'
INTO TABLE supply_chain_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'local_infile';
