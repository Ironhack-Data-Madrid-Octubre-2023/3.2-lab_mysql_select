CHALLENGE 1

SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    t.title as TITLE,
    p.pub_name as PUBLISHER
FROM
authors a
INNER JOIN titleauthor ta 
ON a.au_id = ta.au_id
INNER JOIN titles t 
ON ta.title_id = t.title_id
INNER JOIN publishers p 
ON t.pub_id = p.pub_id


CHALLENGE 2

SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COUNT(t.title) AS TITLE,
    p.pub_name AS PUBLISHER
FROM
authors a
INNER JOIN titleauthor ta 
ON a.au_id = ta.au_id
INNER JOIN titles t 
ON ta.title_id = t.title_id
INNER JOIN publishers p 
ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_id;


CHALLENGE 3

SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    sum(s.qty) AS TOTAL
FROM
authors a
LEFT JOIN titleauthor ta 
ON a.au_id = ta.au_id
LEFT JOIN  sales s
ON ta.title_id=s.title_id
GROUP BY a.au_id
ORDER BY TOTAL desc
LIMIT 3;


CHALLENGE 4

SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    sum(s.qty) AS TOTAL
FROM
authors a
LEFT JOIN titleauthor ta 
ON a.au_id = ta.au_id
LEFT JOIN  sales s
ON ta.title_id=s.title_id
GROUP BY a.au_id
ORDER BY TOTAL desc;