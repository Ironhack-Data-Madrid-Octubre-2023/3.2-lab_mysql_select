SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id;