USE LibraryDB;

-- Inserting categories
INSERT INTO Categories
(name) 
VALUES 
	('Fiction'), 
	('Science'), 
	('Technology');

select * from Categories;

-- Inserting authors
INSERT INTO Authors 
(name) 
VALUES 
	('George Orwell'), 
	('Isaac Newton'), 
	('Alan Turing');
    
select * from Authors;

-- Inserting books (some with NULL category_id or published_year)
INSERT INTO Books 
(title, category_id, isbn, published_year)
VALUES 
	('1984', 1, '9780451524935', 1949),
	('Philosophiæ Naturalis Principia Mathematica', 2, '9780140437510', 1687),
	('Computing Machinery and Intelligence', NULL, '9780486284996', NULL);

select * from books;

-- Inserting book-author relationships
INSERT INTO Book_Author 
(book_id, author_id) 
VALUES 
	(1, 1), 
    (2, 2), 
    (3, 3);

select * from book_author;

-- Inserting members (some with NULL email)
INSERT INTO Members 
(name, email, join_date) 
VALUES 
	('Alice', 'alice@example.com', CURRENT_DATE),
	('Bob', NULL, CURRENT_DATE);
    
    select * from members;

-- Inserting loans
INSERT INTO Loans 
(book_id, member_id, loan_date, return_date)
VALUES 
	(1, 1, CURRENT_DATE, NULL),
	(2, 2, '2024-06-01', '2024-06-15');

select * from loans;

-- UPDATE member's email
UPDATE Members 
SET email = 'bob123@example.com' 
WHERE name = 'Bob';

-- DELETE a book with no author (hypothetical)
DELETE FROM Books 
WHERE book_id = 999;

DELETE FROM Books 
WHERE published_year is null;

INSERT INTO Books (title, category_id, isbn, published_year)
VALUES ('Clean Code', '3', '9780132350884', null);

select * from books;

-- Update multiple rows
UPDATE Books 
SET published_year = 1950 
WHERE published_year IS NULL;

-- Insert using SELECT
INSERT INTO Categories 
(name)
SELECT 'History'
WHERE NOT EXISTS (SELECT 1 FROM Categories WHERE name = 'History'); -- prevents duplicate entry

select * from categories;
