USE FASIH_KI_LIBRARY;
-- Create Books Table
CREATE TABLE Books (
    book_id INT  PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    genre VARCHAR(50)
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT  PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id INT  PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_book
        FOREIGN KEY (book_id) 
        REFERENCES Books(book_id),
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) 
        REFERENCES Members(member_id)
);

-- Insertion into Books Table
INSERT INTO Books (book_id, title, author, published_year, isbn, genre) VALUES
(6, 'shkwa', 'Fasih', 2000, '9780743273564', 'Fiction'),
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '9780743273565', 'Fiction'),
(2, '1984', 'George Orwell', 1949, '9780451524935', 'Dystopian'),
(3, 'To Kill a Mockingbird', 'Harper Lee', 1960, '9780060935467', 'Fiction'),;

-- Insertion into Members Table
INSERT INTO Members (member_id, first_name, last_name, email, join_date) VALUES
(3, 'ali', 'khan', 'john.doe@gmail.com', '2022-01-10'),
(1, 'John', 'Doe', 'john.doe@gmail.com', '2022-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '2023-03-22');

-- Insertion into Loans Table
INSERT INTO Loans (loan_id, book_id, member_id, loan_date, return_date) VALUES
(1, 1, 1, '2023-04-01', '2023-04-15'),
(2, 2, 2, '2023-04-05', NULL);

-- DROP TABLE (& DELETE ALL ROWS IN TABLE)
DROP TABLE Books;

-- UPDATE TABLE (MEMBERS) VALUES

UPDATE Members
SET first_name = 'John', last_name = 'Smith'
WHERE member_id = 1;
-- UPDATE TABLE (BOOKS) VALUES

UPDATE Books
SET author='Maxwell'
WHERE book_id = 2;

-- Deleting records
DELETE FROM Books WHERE book_id = 1;
DELETE FROM Members WHERE member_id = 1;
DELETE FROM Loans WHERE loan_id = 1;

-- Search any records
SELECT * 
FROM Books 
WHERE title = '1984';

SELECT * 
FROM Members
WHERE first_name = 'Jane';







-- Joining Loans with Books to get loan details along with book information
SELECT Loans.loan_id, Books.title, Members.first_name, Members.last_name, Loans.loan_date, Loans.return_date
FROM Loans
INNER JOIN Books ON Loans.book_id = Books.book_id
INNER JOIN Members ON Loans.member_id = Members.member_id;










SELECT *
FROM Books;

SELECT *
FROM Members;

SELECT *
FROM  Loans;








USE FASIH_KI_LIBRARY;

-- Create Login Table
CREATE TABLE Login (
    login_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    CONSTRAINT fk_member_login
        FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

-- Insertion into Login Table
INSERT INTO Login (login_id, member_id, username, password_hash) VALUES
(3, 3, 'alikhan00', 'pasword456' ),
(1, 1, 'johndoe', 'hashedpassword123' ),
(2, 2, 'janesmith', 'hashedpassword456');

ALTER TABLE Login
DROP COLUMN last_login;

SELECT *
FROM Login
WHERE username = 'johndoe';

SELECT *
FROM Members
WHERE member_id = 2;


-- SELECT queries to verify the data
SELECT *
FROM Login;


SELECT L.login_id, M.first_name, M.last_name, L.username, L.password_hash
FROM Login L
INNER JOIN Members M ON L.member_id = M.member_id;
