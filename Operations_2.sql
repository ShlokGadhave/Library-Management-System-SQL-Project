-- Task 13: Identify Members with Overdue Books
-- query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.
USE Library;

SELECT m.member_name,
b.book_title,
isst.issued_date,
r.return_date,
DATEDIFF('2024-12-31', isst.issued_date) AS overdue_days
FROM 
issued_status as isst 
JOIN 
members as m 
ON isst.issued_member_id=m.member_id
JOIN books as b 
ON isst.issued_book_isbn=b.isbn
Left Join return_status as r 
ON isst.issued_id=r.issued_id
WHERE r.return_date IS NULL
AND DATEDIFF('2024-12-31', isst.issued_date) > 30;






