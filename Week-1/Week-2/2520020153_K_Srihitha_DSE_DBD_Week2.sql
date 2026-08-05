-- WEEK 2: JOINS, AGGREGATIONS, TRANSACTIONS AND INDEXING

USE bookflow_db;

SELECT * FROM Books;
SELECT * FROM Members;
-- STEP 2: CREATE LOANS TABLE

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
-- STEP 3: INSERT LOAN RECORDS

INSERT INTO Loans (loan_id, member_id, book_id, loan_date, return_date)
VALUES
(1, 101, 1, '2026-08-01', '2026-08-15'),
(2, 102, 2, '2026-08-02', '2026-08-16'),
(3, 103, 3, '2026-08-03', '2026-08-17');
-- STEP 4: DISPLAY LOAN RECORDS

SELECT * FROM Loans;
-- STEP 5: DISPLAY LOAN DETAILS USING INNER JOIN

SELECT
    Members.full_name,
    Books.title,
    Loans.loan_date,
    Loans.return_date
FROM Loans
INNER JOIN Members
ON Loans.member_id = Members.member_id
INNER JOIN Books
ON Loans.book_id = Books.book_id;
-- STEP 6: COUNT BOOKS BORROWED BY EACH MEMBER

SELECT
    Members.full_name,
    COUNT(Loans.book_id) AS total_books_borrowed
FROM Members
INNER JOIN Loans
ON Members.member_id = Loans.member_id
GROUP BY Members.full_name;
-- STEP 7: TRANSACTION WITH COMMIT

START TRANSACTION;

INSERT INTO Loans (loan_id, member_id, book_id, loan_date, return_date)
VALUES (4, 101, 2, '2026-08-10', '2026-08-24');

COMMIT;

SELECT * FROM Loans;
-- STEP 8: TRANSACTION WITH ROLLBACK

START TRANSACTION;

INSERT INTO Loans (loan_id, member_id, book_id, loan_date, return_date)
VALUES (5, 102, 1, '2026-08-12', '2026-08-26');

ROLLBACK;

SELECT * FROM Loans;
-- STEP 9: CREATE INDEX

CREATE INDEX idx_book_title
ON Books(title);

SHOW INDEX FROM Books;