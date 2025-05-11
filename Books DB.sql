-- USE book_shop;
-- CREATE TABLE books 
-- 	(
-- 		book_id INT NOT NULL AUTO_INCREMENT,
-- 		title VARCHAR(100),
-- 		author_fname VARCHAR(100),
-- 		author_lname VARCHAR(100),
-- 		released_year INT,
-- 		stock_quantity INT,
-- 		pages INT,
-- 		PRIMARY KEY(book_id)
-- 	);

-- INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
-- VALUES
-- ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
-- ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
-- ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
-- ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
-- ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
-- ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
-- ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
-- ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
-- ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
-- ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
-- ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
-- ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
-- ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
-- ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
-- ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
-- ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- SELECT upper(REVERSE('Why does my cat look at me with such hatred'));
-- SELECT REPLACE(title,' ','->') AS title FROM books;
-- SELECT  author_lname AS forward,REVERSE( author_lname) AS backward FROM books;
-- SELECT CONCAT(UPPER(author_fname),' ',UPPER( author_lname)) AS full_name_in_caps FROM books; 
-- SELECT title,char_length(title) AS title FROM books;
-- SELECT CONCAT(title,' ','was realeased in',' ',released_year) AS blurb FROM books;
-- SELECT CONCAT(SUBSTR(title,1,10),'...') AS short_title,CONCAT(author_lname,',',author_fname) AS author, CONCAT( stock_quantity,' in stock') AS quantity FROM books;
-- use book_shop;
----  INSERT INTO books
INSERT INTO books
 (title, author_fname, author_lname, released_year, stock_quantity, pages)
 VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
          ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- USE book_shop;
-- SELECT * FROM  books;
-- SELECT DISTINCT title FROM books WHERE title='stories';
-- SELECT title FROM books WHERE title LIKE '%stories%';
-- SELECT title,pages FROM books ORDER BY title,pages DESC LIMIT 1;
-- SELECT CONCAT( title,' - ',released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
-- SELECT title,author_name FROM books WHERE author_lname LIKE '% %';
-- SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity ASC LIMIT 3;
-- SELECT title,author_lname FROM books ORDER BY author_lname,title;
-- SELECT CONCAT ('MY FAVOURITE AUTHOR IS',' ', ucase(author_fname),' ' ,UCASE(author_lname)) AS yell FROM books ORDER BY author_lname;
-- SELECT COUNT(*) FROM books,
-- SELECT COUNT(*), released_year FROM books GROUP BY released_year;
-- SELECT SUM(stock_quantity) FROM books 
-- SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname
-- SELECT CONCAT(author_fname,' ',author_lname) FROM books WHERE pages=(SELECT MAX(pages) FROM book)
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year;
