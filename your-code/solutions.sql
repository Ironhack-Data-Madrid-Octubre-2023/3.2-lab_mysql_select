-- Challenge 1
select authors.au_id as AUTHOR_ID,
	   authors.au_lname as LAST_NAME, 
       authors.au_fname as FIRST_NAME, 
       titles.title as TITLE, 
       publishers.pub_name as PUBLISHER 
    from authors
inner join titleauthor -- para coger el title_id entro a traves del au_id
on authors.au_id = titleauthor.au_id
inner join titles -- luego paso a coger el titulo de la obra a través del title_id
on titleauthor.title_id = titles.title_id
inner join publishers -- luego paso a coger el nombre del publisher vía el pub_id
on titles.pub_id = publishers.pub_id;


-- Challenge 2
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    p.pub_name AS PUBLISHER,
    COUNT(ta.title_id) AS TITLE_COUNT
FROM
    authors AS a
        INNER JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
        INNER JOIN
    titles AS t ON ta.title_id = t.title_id
        INNER JOIN
    publishers AS p ON t.pub_id = p.pub_id
GROUP BY p.pub_id , a.au_id;


-- Challenge 3
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM
    authors AS a
        LEFT JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
        LEFT JOIN
    sales AS s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
limit 3;


-- Challenge 4
SELECT 
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM
    authors AS a
        LEFT JOIN
    titleauthor AS ta ON a.au_id = ta.au_id
        LEFT JOIN
    sales AS s ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

