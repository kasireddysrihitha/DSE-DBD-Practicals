-- DBSE & DBD WEEK 1 PRACTICAL
-- Name: K. Srihitha
-- Roll No: 2520020153
-- Course Code: 25CS1302E

DROP DATABASE IF EXISTS bookflow_db;
CREATE DATABASE bookflow_db;
USE bookflow_db;
-- STEP 2: CREATE BOOKS TABLE

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    published_year INT CHECK (published_year < 2027)
);
-- STEP 3: INSERT BOOK RECORDS

INSERT INTO Books (book_id, title, isbn, published_year) VALUES
(1, 'The Alchemist', '9780061122415', 1988),
(2, 'Atomic Habits', '9780735211292', 2018),
(3, 'Ikigai', '9780143130727', 2016);
-- STEP 4: DISPLAY BOOK RECORDS

SELECT * FROM Books;
-- STEP 5: CREATE MEMBERS TABLE

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);
-- STEP 6: INSERT MEMBER RECORDS

INSERT INTO Members (member_id, full_name, email) VALUES
(101, 'K. Srihitha', 'srihitha101@gmail.com'),
(102, 'K. Bhavana', 'bhavana102@gmail.com'),
(103, 'A. Akshaya', 'akshaya103@gmail.com');
-- STEP 7: DISPLAY MEMBER RECORDS

SELECT * FROM Members;
-- STEP 8: VERIFY BOOKS TABLE STRUCTURE

DESCRIBE Books;
-- STEP 9: VERIFY MEMBERS TABLE STRUCTURE

DESCRIBE Members;
-- STEP 10: TEST UNIQUE ISBN CONSTRAINT

INSERT INTO Books (book_id, title, isbn, published_year)
VALUES (4, 'The Silent Patient', '9780061122415', 2019);
-- STEP 11: TEST NOT NULL TITLE CONSTRAINT

INSERT INTO Books (book_id, title, isbn, published_year)
VALUES (4, NULL, '9781234567890', 2020);
-- STEP 12: TEST PUBLISHED YEAR CHECK CONSTRAINT

INSERT INTO Books (book_id, title, isbn, published_year)
VALUES (4, 'The Psychology of Money', '9781234567891', 2030);
-- STEP 13: TEST UNIQUE EMAIL CONSTRAINT

INSERT INTO Members (member_id, full_name, email)
VALUES (104, 'K. Srihitha', 'srihitha101@gmail.com');
-- STEP 14: FINAL VERIFICATION

SELECT * FROM Books;
SELECT * FROM Members;