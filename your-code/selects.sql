# Mirar Titles
SELECT *
FROM titles;

# Mirar Authors
SELECT *
from authors;

# Mirar Publishes
SELECT *
FROM publishers;

SELECT *
FROM titleauthor;

# Queremos 3 columnas de authors, authors.au_id, authors.au_lname, authors.au_fname
# Enlazarlo con, titles.title y publishers.pub_name


SELECT authors.au_id, authors.au_fname, authors.au_lname, titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM (authors
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
);

#ME FALTA PONER EL NOMBRE BONITO DE LAS 3 PRIMERAS COLUNAS CON AS



