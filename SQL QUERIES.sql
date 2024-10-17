select * from sales.markets;
select * from sales.transactions;
select * from sales.date;
select * from sales.products;
select * from sales.customers;
select @@hostname;



-- 1) transactions from chennai
select *from sales.transactions 
where market_code="Mark001";

-- 2) transactions in USD
select * from sales.transactions where currency="USD";

-- 4) transactions in  2020 
select date.date from sales.date;

-- 5) no. of distinct products from chennai
select count(distinct(product_code)) from 
sales.transactions where market_code="Mark001";
-- 6) sales on the year 2020
SELECT sales.transactions.*, sales.date.* FROM 
sales.transactions INNER JOIN sales.date ON 
transactions.order_date=date.date where date.year=2020;

-- 7) total transaction in the year 2020

SELECT sum(sales.transactions.sales_amount) 
FROM sales.transactions INNER JOIN sales.date ON 
sales.transactions.order_date=sales.date.date 
WHERE sales.date.year=2020;

-- 8)  customers from  chennai

SELECT sales.customers.* from sales.customers 
INNER JOIN sales.transactions
ON sales.customers.customer_code=sales.transactions.customer_code
INNER JOIN sales.markets
ON sales.transactions.market_code=sales.markets.markets_code
where sales.markets_name="Chennai";

-- 9) number customers who bought brick and mortar

SELECT count(distinct(sales.customers.customer_code)) as customercount
FROM sales.customers INNER JOIN 
sales.transactions ON
sales.transactions.customer_code=sales.customers.customer_code
where sales.customers.customer_type="Brick & Mortar";

-- 10) select the number of international order
SELECT count(distinct(sales.markets.markets_code)) as internationalorders
FROM sales.markets INNER JOIN
sales.transactions ON
 sales.transactions.markets_code=sales.markets.markets_code;
-- WHERE sales.markets.markets_name in ("New York","Paris");
