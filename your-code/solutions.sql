--- Challenge 1
--- 25 rows

SELECT 
	authors.au_id AS `AUTHOR ID`, 
	au_lname AS `LAST NAME`, 
	au_fname AS `FIRST NAME`, 
	titles.title AS `TITLE`, 
	publishers.pub_name AS `PUBLISHER`
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
	ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id DESC; 

--- Challenge 2
--- 25 rows

SELECT
  authors.au_id AS `AUTHOR ID`,
  au_lname AS `LAST NAME`,
  au_fname AS `FIRST NAME`,
  publishers.pub_name AS `PUBLISHER`,
  COUNT(titleauthor.title_id) AS `TITLE COUNT`
FROM authors
INNER JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
	ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers 
	ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.title_id, authors.au_id, au_lname, au_fname
ORDER BY authors.au_id DESC

--- Challenge 3
--- 3 rows

SELECT
  authors.au_id AS `AUTHOR ID`,
  au_lname AS `LAST NAME`,
  au_fname AS `FIRST NAME`,
  SUM(sales.qty) AS `TOTAL`
FROM authors
LEFT JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
	ON titleauthor.title_id = titles.title_id
LEFT JOIN sales 
	ON titles.title_id = sales.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY `TOTAL` DESC LIMIT 3

--- Challenge 4
--- 23 rows

SELECT
  authors.au_id AS `AUTHOR ID`,
  au_lname AS `LAST NAME`,
  au_fname AS `FIRST NAME`,
  SUM(sales.qty) AS `TOTAL`
FROM authors
LEFT JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
	ON titleauthor.title_id = titles.title_id
LEFT JOIN sales 
	ON titles.title_id = sales.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY `TOTAL` DESC

