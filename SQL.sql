--Data navigation
SELECT *
FROM sales_data_sample
--------------------------------------------------------------------------------------------------------
--The total number of invoices, unique customers, and product categories.??
Select 
  count(ordernumber) as NumberOfInvoices,
  count(DISTINCT customername) AS TotalCustomers,
  count(DISTINCT productline) AS ProductCategories
FROM sales_data_sample
--Outcome: ( Invoices= 2823, TotalCustomers= 92, ProductCategories= 7)
------------------------------------------------------------------------------------------------------
--total customers per country
SELECT count(DISTINCT customername) as NumberOfCustomers, country
from sales_data_sample
group by country
order by NumberOfCustomers DESC
------------------------------------------------------------------------------------------------------
--Total sales per year
SELECT SUM(sales) AS profit, year_id AS year
FROM sales_data_sample
group by year 
order by year ASC
-------------------------------------------------------------------------------------
--Basic summary statistics for key metrics like total sales amount, average order value ??
SELECT 
	SUM(sales) AS TotalSalesAmount,
	ROUND(AVG(sales),1)  AS AverageOrderValue
from sales_data_sample
--Outcome: (TotalsalesAmount= 10032628.85 , AverageOrderValue= 3553.9 )
-------------------------------------------------------------------------------------
-- Most frequently purchased items??
SELECT 	
	productline, 
    count(ordernumber) as NumberOfOrders
from sales_data_sample
group by productline
order by NumberOfOrders DESC
--Outcome: (Classic and Vintage cars)
-----------------------------------------------------------------------------------------------
--Top Customers per Country ranked by the highest sales 
SELECT 
  COUNTRY,
  CUSTOMERNAME,
  SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY country,CUSTOMERNAME
ORDER BY COUNTRY, TotalSales DESC
---------------------------------------------------------------------------------------------------
--Purchase Patterns by Customer Demographic information??
SELECT 
    country,
    DEALSIZE,
    COUNT(ORDERNUMBER) AS TotalOrders,
    SUM(SALES) AS TotalSales
FROM  sales_data_sample
GROUP BY  country, DEALSIZE
ORDER BY TotalSales DESC
-----------------------------------------------------------------------------------------------
--Sales Distribution by Product Line per Country
SELECT 
  COUNTRY,
  PRODUCTLINE,
  SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY COUNTRY, PRODUCTLINE
ORDER BY COUNTRY, TotalSales DESC
------------------------------------------------------------------------------------------------
--Sales Trend by Month and Country
SELECT 
    COUNTRY,
    year_id AS Year,
   month_id AS Month,
    SUM(SALES) AS TotalSales
FROM sales_data_sample
GROUP BY COUNTRY, Year, Month
ORDER BY COUNTRY, Year, Month
-------------------------------------------------------------------------------------------------
--TOP 5 customers by sales for this year "assuming we are in 2005"
select country , customername, year_id , ROUND(sum(sales),1) as Totalsales
from sales_data_sample
where year_id = '2005'
group by customername
order by Totalsales DESC
limit 5
-------------------------------------------------------------------------------------------------
--top customers who make large deal size
select dealsize, customername, COUNT (dealsize) as total
from sales_data_sample
WHERE dealsize= 'Large' AND year_id = '2005'
group by customername 
order BY total DESC
-----------------------------------------------------------------------------------------------------
-- the number of orders that on hold per each customer per year to further investigate 
--behind the reasons and detect shipping issues 
select status, count(status) as total , customername, year_id
from sales_data_sample
where status!= 'Shipped' AND status = 'On Hold'
group by customername 
