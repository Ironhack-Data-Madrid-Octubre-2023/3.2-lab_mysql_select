Challenge 1 - Who Have Published What At Where?

SELECT 
  a.au_id AS 'Author ID',
  a.au_lname AS 'Last Name',
  a.au_fname AS 'First Name',
  ti.title AS 'Title',
  p.pub_name AS 'Publisher'
FROM authors AS a
INNER JOIN titleauthor AS t ON a.au_id = t.au_id
INNER JOIN titles AS ti ON t.title_id = ti.title_id
INNER JOIN publishers AS p ON ti.pub_id = p.pub_id;



Challenge 2 - Who Have Published How Many At Where?

SELECT 
  a.au_id AS 'Author ID',
  a.au_lname AS 'Last Name',
  a.au_fname AS 'First Name',
  p.pub_name AS 'Publisher',
  COUNT(COALESCE(ti.title, 1)) AS 'Title Count'
FROM authors AS a
inner JOIN titleauthor AS t ON a.au_id = t.au_id
LEFT JOIN titles AS ti ON t.title_id = ti.title_id
LEFT JOIN publishers AS p ON ti.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY a.au_id;

Challenge 3 - Best Selling Authors

SELECT 
  a.au_id AS 'Author ID',
  a.au_lname AS 'Last Name',
  a.au_fname AS 'First Name',
  SUM(s.qty) AS 'BestSellingAuthors'
FROM authors AS a
LEFT JOIN titleauthor AS t ON a.au_id = t.au_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY BestSellingAuthors DESC
limit 3;

Challenge 4 - Best Selling Authors Ranking

SELECT 
  a.au_id AS 'Author ID',
  a.au_lname AS 'Last Name',
  a.au_fname AS 'First Name',
  COALESCE(SUM(s.qty), 0) AS 'BestSellingAuthors'
FROM authors AS a
LEFT JOIN titleauthor AS t ON a.au_id = t.au_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY 'BestSellingAuthors' DESC;
