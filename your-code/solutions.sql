CHALLENGE 1

SELECT a.au_id as AUTHOR_ID, 
		a.au_lname as LAST_NAME, 
        a.au_fname as FIRST_NAME, 
        t.title as TITLE, 
        p.pub_name as PUBLISHER

FROM authors as a
INNER JOIN titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN titles as t
ON t.title_id = ta.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id;




CHALLENGE 2

SELECT a.au_id as AUTHOR_ID, 
		a.au_lname as LAST_NAME, 
        a.au_fname as FIRST_NAME,
        p.pub_name as PUBLISHER,
        count(TITLE) AS TITLE_COUNT

FROM authors as a
INNER JOIN titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN titles as t
ON t.title_id = ta.title_id
LEFT JOIN publishers as p
ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;




CHALLENGE 3

SELECT a.au_id as AUTHOR_ID, 
		a.au_lname as LAST_NAME, 
        a.au_fname as FIRST_NAME,
        count(s.qty) as TITLE_SALES

FROM authors as a
INNER JOIN titleauthor as ta
ON a.au_id = ta.au_id
INNER JOIN titles as t
ON t.title_id = ta.title_id
INNER JOIN sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY title_sales desc
limit 3;




CHALLENGE 4

SELECT a.au_id as AUTHOR_ID, 
		a.au_lname as LAST_NAME, 
        a.au_fname as FIRST_NAME,
        count(s.qty) as TITLE_SALES

FROM authors as a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN titles as t
ON t.title_id = ta.title_id
LEFT JOIN sales as s
ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY title_sales desc;