-- Challenge 1--

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    t.title AS title,
    p.pub_name AS publisher
FROM
    publications.authors AS a
JOIN
    publications.titleauthor AS ta
ON
    a.au_id = ta.au_id
JOIN
    publications.titles AS t
ON
    ta.title_id = t.title_id
JOIN
    publications.publishers AS p
ON
    t.pub_id = p.pub_id;

--Challenge 2--

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    p.pub_name AS publisher,
    COUNT(t.title) AS title_count
FROM
    publications.authors AS a
JOIN
    publications.titleauthor AS ta
ON
    a.au_id = ta.au_id
JOIN
    publications.titles AS t
ON
    ta.title_id = t.title_id
JOIN
    publications.publishers AS p
ON
    t.pub_id = p.pub_id
GROUP BY
    author_id, last_name, first_name, publisher
ORDER BY
    author_id;

--Challenge 3--

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    p.pub_name AS publisher,
    SUM(s.qty) AS total_sales
FROM
    publications.authors AS a
JOIN
    publications.titleauthor AS ta
ON
    a.au_id = ta.au_id
JOIN
    publications.titles AS t
ON
    ta.title_id = t.title_id
JOIN
    publications.publishers AS p
ON
    t.pub_id = p.pub_id
JOIN
    publications.sales AS s
ON
    t.title_id = s.title_id

ORDER BY total_sales DESC
LIMIT 3;

-- Challenge 4--

SELECT
    a.au_id AS author_id,
    a.au_lname AS last_name,
    a.au_fname AS first_name,
    COALESCE(SUM(s.qty), 0) AS total_sales
FROM
    publications.authors AS a
LEFT JOIN
    publications.titleauthor AS ta
ON
    a.au_id = ta.au_id
LEFT JOIN
    publications.titles AS t
ON
    ta.title_id = t.title_id
LEFT JOIN
    publications.sales AS s
ON
    t.title_id = s.title_id
GROUP BY author_id, last_name, first_name
ORDER BY total_sales DESC;
