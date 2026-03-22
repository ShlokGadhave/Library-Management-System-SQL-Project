
# 📚 Library Management System – SQL Project

## 📌 Project Overview

This project demonstrates the design and implementation of a **Library Management System using SQL**.
It includes database creation, table relationships, and various SQL operations such as **CRUD operations, joins, aggregations, filtering, and analytical queries**.

The goal of this project is to practice **SQL concepts used in real-world data analysis and database management**.


# 🗄 Database Structure

The project contains the following tables:

| Table         | Description                                       |
| ------------- | ------------------------------------------------- |
| Branch        | Stores branch information and contact details     |
| Employees     | Contains employee information working in branches |
| Members       | Stores library member details                     |
| Books         | Contains book information and rental prices       |
| Issued_Status | Tracks issued books                               |
| Return_Status | Tracks returned books                             |



# ⚙️ Features Implemented

### 1️⃣ Database & Table Creation

* Created a relational database **Library**
* Implemented primary keys and foreign key relationships
* Designed normalized tables for library operations


### 2️⃣ CRUD Operations

* Insert new book records
* Update member details
* Delete issued records

Example:

```sql
INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES ('978-1-60129-456-2','To Kill a Mockingbird','Classic',6.00,'yes','Harper Lee','J.B. Lippincott & Co.');
```



### 3️⃣ Data Retrieval Queries

Examples include:

* Retrieve books issued by a specific employee
* Retrieve books by category
* Find books not yet returned
* List employees with branch details



### 4️⃣ Data Analysis Queries

This project includes analytical SQL queries such as:

✔ Members who issued more than one book
✔ Total rental income by category
✔ Members registered in the last 180 days
✔ Books with rental price above a threshold
✔ Summary table showing total books issued

Example:

```sql
SELECT category, SUM(rental_price) AS total_price
FROM books
GROUP BY category;
```


# 📊 Advanced SQL Concepts Used

* Joins
* Group By
* Having
* Aggregate Functions
* CTAS (Create Table As Select)
* Date Functions
* Filtering with IN clause
* Left Join for missing records



# 📂 Project Files

| File             | Description                                          |
| ---------------- | ---------------------------------------------------- |
| Create_Table.sql | Contains database and table creation queries         |
| Operations.sql   | Contains SQL operations, tasks, and analysis queries |



# 🎯 Learning Outcomes

Through this project I practiced:

* Relational database design
* Writing efficient SQL queries
* Data filtering and aggregation
* Working with joins and relationships
* Creating analytical queries for insights



# 🚀 Tools Used

* MySQL
* SQL




# 📈 Future Improvements

* Add stored procedures
* Implement triggers
* Build dashboards using Power BI
* Perform deeper data analysis



