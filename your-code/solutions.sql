SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
	titles.title AS TITLE,
    publishers.pub_name AS PUBLISHER
FROM
    authors
		INNER JOIN
	titleauthor ON titleauthor.au_id = authors.au_id
		INNER JOIN
	titles ON titleauthor.title_id = titles.title_id
		INNER JOIN
	publishers ON titles.pub_id = publishers.pub_id;


SELECT
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    publishers.pub_name AS PUBLISHER,
    COUNT(*) AS TITLE_COUNT
FROM
    authors
    INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
    INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    publishers.pub_name
ORDER BY
    authors.au_id,
    publishers.pub_name;
    
    
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COUNT(sales.qty) AS TOTAL
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
		INNER JOIN
	sales  ON titles.title_id = sales.title_id
GROUP BY authors.au_id , authors.au_lname , authors.au_fname
ORDER BY 'TOTAL' desc
LIMIT 3;



SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COUNT(sales.qty) AS TOTAL
FROM
    authors
        LEFT JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id , authors.au_lname , authors.au_fname
ORDER BY 'TOTAL' DESC;