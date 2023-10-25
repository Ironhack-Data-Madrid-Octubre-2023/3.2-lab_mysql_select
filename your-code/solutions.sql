##Challenge 1 - Who Have Published What At Where?

# Queremos 3 columnas de authors, authors.au_id, authors.au_lname, authors.au_fname
# Enlazarlo con, titles.title y publishers.pub_name

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, titles.title as `TITLE`, publishers.pub_name as `PUBLISHER`
FROM (authors
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
);

## Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, publishers.pub_name as `PUBLISHER` , COUNT(titles.title) as `TITLE`
FROM (authors
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id)
GROUP BY  authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
ORDER BY COUNT(titles.title) DESC;

## Challenge 3 - Best Selling Authors

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, SUM(titles.ytd_sales) as "TOTAL"
FROM (authors
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id)
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(titles.ytd_sales) DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, COALESCE(SUM(titles.ytd_sales),0) as "TOTAL"
FROM (authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id)
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(titles.ytd_sales);
