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