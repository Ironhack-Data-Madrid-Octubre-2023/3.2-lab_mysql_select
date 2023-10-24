Challenge 1

select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name

from titleauthor as ta
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id
inner join authors as a
on a.au_id = ta.au_id;

Challenge 2

SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title) AS num_books_published
FROM authors AS a
LEFT JOIN titleauthor AS ta 
ON a.au_id = ta.au_id
LEFT JOIN titles AS t 
ON ta.title_id = t.title_id
INNER JOIN publishers AS p 
ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY num_books_published DESC;
Challenge 3

SELECT a.au_id, a.au_lname, a.au_fname, sum(s.qty) AS num_books_sold
FROM authors AS a
LEFT JOIN titleauthor AS ta 
ON a.au_id = ta.au_id
LEFT JOIN titles AS t 
ON ta.title_id = t.title_id
LEFT JOIN sales AS s 
ON s.title_id = t.title_id
group by au_id, au_lname, au_fname
ORDER BY num_books_sold DESC
limit 3;

Challenge 4

SELECT a.au_id, a.au_lname, a.au_fname, coalesce(sum(s.qty), 0) AS num_books_sold
FROM authors AS a
LEFT JOIN titleauthor AS ta 
ON a.au_id = ta.au_id
LEFT JOIN titles AS t 
ON ta.title_id = t.title_id
LEFT JOIN sales AS s 
ON s.title_id = t.title_id
group by au_id, au_lname, au_fname
ORDER BY num_books_sold DESC;



