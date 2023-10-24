###############
# CHALLENGE 1
###############


SELECT authors.au_id, au_lname, au_fname, title, pub_name  

FROM authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles
ON titleauthor.title_id = titles.title_id

INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

###############
# CHALLENGE 2
###############

SELECT authors.au_id, au_lname, au_fname, count(titles.title) AS title_count, pub_name 

FROM authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles
ON titleauthor.title_id = titles.title_id

INNER JOIN publishers
ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, au_lname, au_fname, pub_name 
order by title_count desc;



###############
# CHALLENGE 3
###############

(
SELECT authors.au_id, au_lname, au_fname, sum(sales.ord_num) AS total

FROM authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles
ON titleauthor.title_id = titles.title_id

INNER JOIN sales
ON titles.title_id = sales.title_id

GROUP BY authors.au_id, au_lname, au_fname
ORDER BY total DESC

) AS newtab

WHERE newtab.total > 0
LIMIT 3;


###############
# CHALLENGE 4
###############

  
SELECT authors.au_id, au_lname, au_fname, sum(sales.ord_num) AS total

FROM authors

INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id

INNER JOIN titles
ON titleauthor.title_id = titles.title_id

INNER JOIN sales
ON titles.title_id = sales.title_id

GROUP BY authors.au_id, au_lname, au_fname
ORDER BY total DESC;
