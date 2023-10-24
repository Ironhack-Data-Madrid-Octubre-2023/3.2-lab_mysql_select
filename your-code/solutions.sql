-- CHALLENGE 1--
SELECT 
    au.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    tl.title AS 'TITLE',
    pb.pub_name AS 'PUBLISHER'
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS tlau ON au.au_id = tlau.au_id
        LEFT JOIN
    titles AS tl ON tlau.title_id = tl.title_id
        LEFT JOIN
    publishers AS pb ON tl.pub_id = pb.pub_id;
	
-- CHALLENGE 2--
SELECT 
    au.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
	pb.pub_name AS 'PUBLISHER',
    COUNT(tlau.title_id) AS 'TITLE COUNT'
FROM
    authors AS au
        INNER JOIN
    titleauthor AS tlau ON au.au_id = tlau.au_id
        INNER JOIN
    titles AS tl ON tlau.title_id = tl.title_id
        INNER JOIN
    publishers AS pb ON tl.pub_id = pb.pub_id
GROUP BY pb.pub_id, au.au_id
ORDER BY `TITLE COUNT` DESC;

--CHALLENGE 3--
SELECT 
    au.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    SUM(sl.qty) AS 'TOTAL'
FROM
    authors AS au
        INNER JOIN
    titleauthor AS tlau ON au.au_id = tlau.au_id
        INNER JOIN
    titles AS tl ON tlau.title_id = tl.title_id
        INNER JOIN
    sales AS sl ON tl.title_id = sl.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC
LIMIT 3;

--CHALLENGE 4--
SELECT 
    au.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    COALESCE(SUM(sl.qty), 0) AS 'TOTAL'
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS tlau ON au.au_id = tlau.au_id
        LEFT JOIN
    titles AS tl ON tlau.title_id = tl.title_id
        LEFT JOIN
    sales AS sl ON tl.title_id = sl.title_id
GROUP BY au.au_id
ORDER BY `TOTAL` DESC;