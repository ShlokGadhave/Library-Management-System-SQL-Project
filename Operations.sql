-- Project Task
-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher) 
Values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
Select*From Books;

-- Task 2  Update an Existing Member's Address

UPDATE members 
SET member_address ="234 Pune"
WHERE member_id='C102';
Select*From Members;

SET SQL_SAFE_UPDATES = 0; -- To Disable Safety Mode 

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

DELETE FROM issued_status 
WHERE issued_id='IS104';
Select*From issued_status;

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT*FROM issued_status 
WHERE issued_emp_id='E101'; 

-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT isst.issued_emp_id,e.emp_name FROM 
issued_status as isst 
Join 
employees as e 
ON isst.issued_emp_id=e.emp_id
Group By 1,2
Having count(isst.issued_id)>1;

-- 2 method 
SELECT issued_member_id, COUNT(*) AS total_books
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1;

-- CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

Create Table Summary 
AS 
SELECT b.isbn,b.book_title,b.category,b.author,count(isst.issued_emp_id) AS No_of_Books
FROM Books as b 
Join 
issued_status as isst 
ON b.isbn=isst.issued_book_isbn
Group By b.isbn,
b.book_title,
b.category,
b.author ;

Select*From Summary;

-- Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

SELECT * FROM Books 
Where category In ('Fantasy','Fiction','Mystery','History','Horror');

-- Task 8: Find Total Rental Income by Category:

SELECT Category,SUM(rental_price) AS Total_Price 
FROM books 
Group By Category;


-- Task 9. List Members Who Registered in the Last 180 Days:

SELECT member_name,reg_date 
FROM members 
Where reg_date >= DATE('2022-12-31')-Interval 180 Day ;

-- Task 10: List Employees with Their Branch Manager's Name and their branch details

SELECT e.*,b.branch_address,b.contact_no
FROM Employees as e
Join Branch as b 
ON e.branch_id=b.branch_id;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

CREATE TABLE High_Valued_Books 
AS 
SELECT * 
FROM Books 
Where rental_price>7;

Select*From High_Valued_Books;

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT 
    DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;


SELECT * FROM return_status







