#A. Find the total and the average sales (display total_sales and avg_sales)

SELECT SUM(SALES), AVG(SALES)
FROM MARKET_FACT;

#B. Display the number of customers in each region in decreasing order of 
#no_of_customers. The result should contain columns Region, no_of_customers

SELECT 
    region,
    COUNT(cust_id) AS no_of_customers
FROM 
    cust_dimen
GROUP BY 
    region
ORDER BY 
    no_of_customers DESC;

#C. Find the region having maximum customers (display the region name and max(no_of_customers)

SELECT Region, max(Cust_id) as max
FROM cust_dimen
GROUP BY Region
ORDER BY max;

# D. Find the number and id of products sold in decreasing order of products sold
#(display product id, no_of_products sold).

SELECT Prod_id, sum(Order_Quantity) AS Solds
FROM market_fact
GROUP BY Prod_id
ORDER BY Solds;

#E. Display the product categories in descending order of profits (display the product
#category wise profits i.e. product_category, profits)?

SELECT P.Product_Category, sum(m.profit) as profit
From Prod_dimen as P
INNER JOIN market_fact as m
ON P.Prod_id=m.Prod_id
GROUP BY P.Product_Category
ORDER BY profit desc;

#F. Display the product category, product sub-category and the profit within each sub-
#category in three columns.

SELECT P.Product_Category, P.Product_Sub_Category, sum(profit) as profit
FROM prod_dimen as P
INNER JOIN market_fact as m
ON P.Prod_id=m.Prod_id
GROUP BY P.Product_Category,P.Product_Sub_Category
ORDER BY Profit;

#G. Find all the customers from Atlantic region who have ever purchased ‘TABLES’
#and the number of tables purchased (display the customer name, no_of_tables purchased)

select Customer_name, sum(order_quantity) as orders
FROM cust_dimen as c, market_fact as m, prod_dimen as p
WHERE c.Cust_id=m.Cust_id
AND   p.Prod_id=m.Prod_id
AND   c.Region="Atlantic"
AND p.Product_Sub_Category="Tables"
GROUP BY Customer_Name;
