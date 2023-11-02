##CHALLENGE 1

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAM',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id;


    ##CHALLENGE 2

        SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title_id) AS 'TOTAL TITLES'
    
    FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY 
    authors.au_id, publishers.pub_name;


    ##CHALLENGE 3

    # PRIMERA PRESENTACION.
    SELECT 
    authors.au_id AS `AUTHOR ID`,
    authors.au_lname AS `LAST NAME`,
    authors.au_fname AS `FIRST NAME`,
    COUNT(titleauthor.title_id) AS `TOTAL`
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY 
    authors.au_id
ORDER BY 
    COUNT(titleauthor.title_id) DESC
LIMIT 3;

    # CORRECCION 2/11/23
     ##CHALLENGE 3
SELECT 
    authors.au_id AS `AUTHOR ID`,
    authors.au_lname AS `LAST NAME`,
    authors.au_fname AS `FIRST NAME`,
    SUM(sales.qty) AS `TOTAL`
FROM 
    authors
JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
JOIN 
    titles ON titleauthor.title_id = titles.title_id
JOIN 
    sales ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    SUM(sales.qty) 


## CHALLENGE 4

# PRIMERA ENTREGA
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COALESCE(COUNT(titleauthor.title_id), 0) AS 'TOTAL'
FROM 
    authors
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
GROUP BY 
    authors.au_id
ORDER BY 
    COALESCE(COUNT(titleauthor.title_id), 0) DESC;


# CORRECCION 2/11/23
## CHALENGE 4

SELECT 
    authors.au_id AS `AUTHOR ID`,
    authors.au_lname AS `LAST NAME`,
    authors.au_fname AS `FIRST NAME`,
    COALESCE(SUM(sales.qty), 0) AS `TOTAL`
FROM 
    authors
LEFT JOIN 
    titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN 
    titles ON titleauthor.title_id = titles.title_id
LEFT JOIN 
    sales ON titles.title_id = sales.title_id
GROUP BY 
    authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 
    COALESCE(SUM(sales.qty), 0) DESC;