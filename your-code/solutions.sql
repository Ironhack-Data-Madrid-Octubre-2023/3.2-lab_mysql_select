-- Challenge 1. Who have published what at where?

USE publications;

SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, titles.title AS `TITLE`, publishers.pub_name AS `PUBLISHER`
FROM titleauthor
  LEFT JOIN authors ON titleauthor.au_id = authors.au_id
  LEFT JOIN titles  ON titleauthor.title_id = titles.title_id
  LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;
  
-- Challenge 2. Who have published how many at where?

USE publications;

SELECT authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, 
publishers.pub_name AS `PUBLISHER`, 
COUNT(titles.title_id) AS `TITLE COUNT`
FROM titleauthor
  LEFT JOIN authors ON titleauthor.au_id = authors.au_id
  LEFT JOIN titles  ON titleauthor.title_id = titles.title_id
  LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
  GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

-- Challenge 3. Best selling authors

USE publications;

SELECT authors.au_id AS `AUTHOR ID`, 
authors.au_lname AS `LAST NAME`, 
authors.au_fname AS `FIRST NAME`, 
SUM(sales.qty) AS `TOTAL`
FROM titleauthor
  LEFT JOIN authors ON titleauthor.au_id = authors.au_id
  LEFT JOIN titles  ON titleauthor.title_id = titles.title_id
  LEFT JOIN sales ON titles.title_id = sales.title_id
  GROUP BY authors.au_id, authors.au_lname, authors.au_fname
  ORDER BY `TOTAL` DESC
  LIMIT 3;
  
-- Challenge 4. Best selling authors ranking
	USE publications;

	SELECT authors.au_id as `AUTHOR ID`,
		authors.au_lname as `LAST NAME`,
        authors.au_fname as `FIRST NAME`,
        COALESCE(SUM(sales.qty), 0) as `TOTAL`
	FROM authors
	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales ON titles.title_id = sales.title_id
	GROUP BY authors.au_id, authors.au_lname, authors.au_fname
	ORDER BY `TOTAL` DESC;
