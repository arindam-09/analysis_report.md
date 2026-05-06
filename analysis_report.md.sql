-- create database olist_ecommerce;
-- use olist_ecommerce;

-- olist_customers

-- create table olist_customers (
-- customer_id varchar(50) primary key,
-- customer_unique_id varchar(50),
-- customer_zip_code_prefix int,
-- customer_city varchar(100),
-- customer_state varchar(10)
-- );

-- -- olist_geolocation 

-- create table olist_geolocation(
-- geolocation_zip_code_prefix int,
-- geolocation_lat decimal(18,15),
-- geolocation_lng decimal(18,15),
-- geolocation_city varchar(100),
-- geolocation_state varchar(10)
-- );
	
   --  order_items
    
--  create table olist_order_items(
--  order_id varchar(50),
--  order_item_id int,
--  product_id varchar(100),
--  seller_id varchar(100),
--  shipping_limit_date datetime,
--  price decimal(10,2),
--  freight_value decimal (10,2)
--  );
--  
--  
-- USE olist_ecommerce;

-- -- Drop and recreate without PRIMARY KEY constraint
-- DROP TABLE olist_order_payments;

-- CREATE TABLE olist_order_payments (
--     order_id VARCHAR(50),
--     payment_sequential INT,
--     payment_type VARCHAR(30),
--     payment_installments INT,
--     payment_value DECIMAL(10,2)
-- );
DROP TABLE olist_order_reviews;

CREATE TABLE olist_order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title VARCHAR(100),
    review_comment_message TEXT,
    review_creation_date VARCHAR(50),
    review_answer_timestamp VARCHAR(50)
);
--  
--  create table olist_orders(
--  order_id varchar(50) primary key,
--  customer_id varchar(50),
--  order_status varchar(30),
--  order_purchase_timestam datetime,
--  order_approved_at datetime,
--  order_delivered_carrier_date datetime,
--  order_delivered_customer_date datetime,
--  order_estimated_delivery_date datetime
--  );
--  
--  
--  create table olist_products(
--  product_id varchar(50) primary key,
--  product_category_name varchar(100),
--  product_name_lenght int,
--  product_description_lenght int,
--  product_photos_qty int,
--  product_weight_g int,
--  product_length_cm int,
--  product_height_cm int,
--  product_width_cm int
--  );
--  
--  create table olist_sellers(
--  seller_id varchar(50) primary key,
--  seller_zip_code_prefix int,
--  seller_city varchar(100),
--  seller_state varchar(30)
--  );
--  
--  CREATE TABLE product_category_name_translation(
--  product_category_name varchar(100),
--  product_category_name_english varchar(100)
--  );
 
 
 
 -- step 2________________________________________________________________________________________________
 -- USE olist_ecommerce;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv'
-- INTO TABLE olist_customers
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
-- select* from  olist_customers

 -- select * from olist_order_items
-- USE olist_ecommerce;

-- load DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
-- INTO TABLE olist_order_items
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
-- select * from olist_order_items

-- TRUNCATE TABLE olist_order_payments;
-- TRUNCATE TABLE olist_order_reviews;
-- TRUNCATE TABLE olist_order_items;
-- TRUNCATE TABLE olist_orders;
-- TRUNCATE TABLE olist_products;
-- TRUNCATE TABLE olist_sellers;
-- TRUNCATE TABLE olist_customers;
-- TRUNCATE TABLE product_category_name_translation;

-- USE olist_ecommerce;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
-- INTO TABLE olist_order_payments
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
--  select * from olist_order_payments
--  

-- select * from olist_order_reviews

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv'
-- INTO TABLE olist_order_reviews
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS
-- (review_id, order_id, review_score, @dummy1,
-- @dummy2, review_creation_date, review_answer_timestamp);
-- SELECT 'customers' as tbl, COUNT(*) as `rows` FROM olist_customers UNION ALL
-- SELECT 'orders', COUNT(*) FROM olist_orders UNION ALL
-- SELECT 'order_items', COUNT(*) FROM olist_order_items UNION ALL
-- SELECT 'payments', COUNT(*) FROM olist_order_payments UNION ALL
-- SELECT 'products', COUNT(*) FROM olist_products UNION ALL
-- SELECT 'sellers', COUNT(*) FROM olist_sellers;




-- select * from olist_orders

--  ALTER TABLE olist_orders 
--  RENAME COLUMN order_purchase_timestam TO order_purchase_timestamp;


--  TRUNCATE TABLE olist_orders;/

--  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
--  INTO TABLE olist_orders
--  FIELDS TERMINATED BY ','
--  OPTIONALLY ENCLOSED BY '"'
--  LINES TERMINATED BY '\n'
--  IGNORE 1 ROWS
--  (order_id, customer_id, order_status,
--   @purchase, @approved, @carrier, @delivered, @estimated)
--  SET
--  order_purchase_timestamp = NULLIF(@purchase, ''),
--  order_approved_at = NULLIF(@approved, ''),
--  order_delivered_carrier_date = NULLIF(@carrier, ''),
--  order_delivered_customer_date = NULLIF(@delivered, ''),
--  order_estimated_delivery_date = NULLIF(@estimated, '');
-- DESCRIBE olist_orders;
-- select* from olist_orders
























-- TRUNCATE TABLE olist_products;

-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
-- INTO TABLE olist_products
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (product_id, product_category_name,
--  @name_len, @desc_len, @photos, @weight, @length, @height, @width)
-- SET
-- product_name_lenght = NULLIF(@name_len, ''),
-- product_description_lenght = NULLIF(@desc_len, ''),
-- product_photos_qty = NULLIF(@photos, ''),
-- product_weight_g = NULLIF(@weight, ''),
-- product_length_cm = NULLIF(@length, ''),
-- product_height_cm = NULLIF(@height, ''),
-- product_width_cm = NULLIF(@width, '');
--  DESCRIBE olist_products;
select* from olist_products




-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_sellers_dataset.csv'
-- INTO TABLE olist_sellers
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
-- select* from olist_sellers



-- load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product_category_name_translation.csv'
-- into table product_category_name_translation
-- fields terminated by ','
-- enclosed by'"'
-- lines terminated by '\n'
-- ignore 1 rows;

-- select * from product_category_name_translation


-- -- SET FOREIGN_KEY_CHECKS = 0;
-- -- TRUNCATE TABLE olist_order_payments;
-- -- TRUNCATE TABLE olist_order_reviews;
-- -- TRUNCATE TABLE olist_order_items;
-- -- TRUNCATE TABLE olist_orders;
-- -- TRUNCATE TABLE olist_products;
-- -- TRUNCATE TABLE olist_sellers;
-- -- TRUNCATE TABLE olist_customers;
-- -- TRUNCATE TABLE product_category_name_translation;
-- -- SET FOREIGN_KEY_CHECKS = 1;



-- step 3_________________________________________________________________________________________
SELECT 'customers' as tbl, COUNT(*) as `rows` FROM olist_customers UNION ALL
SELECT 'orders', COUNT(*) FROM olist_orders UNION ALL
SELECT 'order_items', COUNT(*) FROM olist_order_items UNION ALL
SELECT 'payments', COUNT(*) FROM olist_order_payments UNION ALL
SELECT 'products', COUNT(*) FROM olist_products UNION ALL
SELECT 'sellers', COUNT(*) FROM olist_sellers;


-- step 4___________________________________________________________________________________________

use olist_ecommerce;
-- Total Revenue & Orders-- 

--   select*from olist_orders
 -- select* from olist_order_items

-- select
-- 	count(distinct o.order_id) as total_orders,
-- 	sum(i.price)as total_revenue,
-- 	round(avg(i.price),2) as avg_order_value
-- from olist_orders o
-- join olist_order_items i on o. order_id = i.order_id
-- where o.order_status = 'delivered';



-- Monthly Revenue Trend-- 
-- select*from olist_orders
-- select
-- date_format(o.order_purchase_timestamp, '%Y-%m')as month,
-- count(distinct o.order_id)as total_orders,
-- round(sum(i.price),2)as revenue
-- from olist_orders o
-- join olist_order_items i on o.order_id=i.order_id
-- where o.order_status='delivered'
-- group by month 
-- order by month

-- Top 10 Product Categories-- 

-- select* from olist_products
-- select*from olist_order_items
-- select*from product_category_name_translation 

-- select
-- t.product_category_name_english as category,
-- count(distinct i.order_id)as total_orders,
-- round(sum(i.price),2)as revenue
-- from olist_order_items i
-- join olist_products p on i.product_id=p.product_id
-- join product_category_name_translation t
-- on p.product_category_name=t.product_category_name
-- group by category
-- order by revenue desc
-- limit 10

 -- Sales by State-- 


-- select*from olist_customers
select
 c.customer_state as state,
 count(distinct o.order_id)as total_orders,
round(sum(i.price),2)as revenue
from olist_orders o
join olist_customers c on o.customer_id = c.customer_id
join olist_order_items i on o.order_id=i.order_id
group by state
order by revenue desc
limit 10;


--  Payment Methods--

-- select*from olist_order_payments

-- select payment_type,
-- count(*)as total_transactions,
-- round(sum(payment_value),2 )as total_value,
-- round(avg(payment_value),2)as avg_value
-- from olist_order_payments
-- group by payment_type
-- order by total_transactions desc;

-- Order Status Breakdown-- 
-- select*from olist_orders

-- select
-- order_status,
-- count(*) as total_orders,
-- round(count(*) *100.0/sum(count(*)) over(),1)as percentage
-- from olist_orders
-- group by order_status
-- order by total_orders desc;
 