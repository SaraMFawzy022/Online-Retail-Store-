# Online-Retail-Store-
**Power BI (data visualization)**
Imported CSV file of the cleaned data.
Imported Pivot table created on Python for customer value visualization.

**Normalization**:-

Customers Table Columns:
•	ID (PK)
•	CustomerName
•	Phone
•	AddressLine1
•	City
•	Country
•	ContactLastName
•	ContactFirstName

Products Table Columns:
•	ProductCode (PK)
•	ProductLine
•	MSRP

Orders Table Columns:
•	OrderNumber (PK)
•	OrderDate (FK to Date table)
•	Status
•	CustomerName
•	Customer.ID(FK to Customers table)

sales Table Columns:
•	OrderNumber (PK, FK to Orders table)
•	ProductCode (PK, FK to Products table)
•	QuantityOrdered
•	PriceEach
•	OrderLineNumber
•	Dealsize
•	MSRP

Value table:
•	Count of orders
•	Customer value
•	Customername
•	totalsales

Date Table Columns:
•	Date (PK)
•	Year
•	Month 

-Created the data model relationships:
![image](https://github.com/user-attachments/assets/b8454590-3588-4d1f-b0a3-d005fb791973)

-Created Measures:
Measure: number of customers
Measure: count of orders
Measure: total sales

**Link to dashboard:**
https://drive.google.com/file/d/1KODhysY0ZEqmmBey5gcsexvW03dasIV5/view?usp=sharing
