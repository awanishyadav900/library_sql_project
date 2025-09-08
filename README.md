# library_sql_project
# 📚 Library Management SQL Project
.📖 Project Overview

This project is a Library Management Database built using SQL. It manages Books, Customers, and Orders, allowing efficient tracking of library data.
The project includes:

.SQL scripts for table creation

CSV datasets (Books, Customers, Orders) for importing sample data

A set of SQL queries ranging from basic to advanced for analysis and reporting

# 🗂️ Database Structure

.The project consists of three main tables:

1.Book

.Book_ID (Primary Key)

.Title

.Author

.Genre

.Published_Year

.Price

.Stock

2.Customer

.Customer_ID (Primary Key)

.Name

.Email

.Phone

.City

.Country

3.Orders

.Order_ID (Primary Key)

.Customer_ID (Foreign Key → Customer)

.Book_ID (Foreign Key → Book)

.Order_Date

.Quantity

.Total_Amount

🔍 Example Queries
# 📌 Basic Queries

1.Retrieve all books in the Fiction genre

2.Find books published after 1950

3.List all customers from Canada

4.Show orders placed in November 2023

5.Retrieve the total stock of books available

6.Find the most expensive book

7.Show customers who ordered more than 1 quantity

8.Retrieve orders where total amount exceeds $20

9.List all unique genres of books

10.Find the book with the lowest stock

11.Calculate total revenue from all orders

# 📌 Advanced Queries

1.Total number of books sold per genre

2.Average price of books in Fantasy genre

3.Customers who placed at least 2 orders

4.Most frequently ordered book

5.Top 3 most expensive Fantasy books

6.Total quantity of books sold by each author

7.Cities where customers who spent over $30 are located

8.Customer who spent the most overall

9.Stock remaining after fulfilling all orders

# 🚀 How to Use

Import the CSV files (Books.csv, Customers.csv, Orders.csv) into your SQL database.

Run the provided SQL script (library sql project.sql) to create tables and execute queries.

Explore and analyze the data using the included SQL queries.

📌 Applications

Library management system demo

SQL learning project for beginners

Practice for database design, joins, and aggregate queries
