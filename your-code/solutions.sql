--- CHALLENGE 1 ---

SELECT pubau.au_id AS 'AUTHOR ID', 
	pubau.au_lname AS 'LAST NAME', 
	pubau.au_fname AS 'FIRST NAME',
    tit.title AS 'TITLE',
    pub.pub_name AS 'PUBLISHER'
    
FROM publications.authors as pubau
LEFT JOIN titleauthor AS titau
ON pubau.au_id = titau.au_id
INNER JOIN titles as tit
ON titau.title_id = tit.title_id
LEFT JOIN publishers as pub
ON tit.pub_id = pub.pub_id;

--- CHALLENGE 2 ---

SELECT pubau.au_id AS 'AUTHOR ID', 
	pubau.au_lname AS 'LAST NAME', 
	pubau.au_fname AS 'FIRST NAME',
    pub.pub_name AS 'PUBLISHER',
    COUNT(tit.title) AS 'TITLE COUNT'
    
FROM publications.authors as pubau
LEFT JOIN titleauthor AS titau
ON pubau.au_id = titau.au_id
INNER JOIN titles as tit
ON titau.title_id = tit.title_id
LEFT JOIN publishers as pub
ON tit.pub_id = pub.pub_id
GROUP BY tit.title

--- CHALLENGE 3 ---

SELECT
    titau.au_id AS 'Author ID',
    pubau.au_lname AS 'Last Name',
    pubau.au_fname AS 'First Name',
    IFNULL(SUM(tit.ytd_sales),0) AS 'Total Titles Sold'
FROM
    publications.authors AS pubau
LEFT JOIN
    titleauthor AS titau ON pubau.au_id = titau.au_id
INNER JOIN
    titles AS tit ON titau.title_id = tit.title_id
LEFT JOIN
    sales AS sls ON tit.title_id = sls.title_id
    
GROUP BY pubau.au_id, pubau.au_lname, pubau.au_fname

ORDER BY `Total Titles Sold` DESC

LIMIT 3;

--- CHALLENGE 4 ---

SELECT au.au_id, au.au_fname, au.au_lname, IFNULL(SUM(tit.ytd_sales),0) AS 'TOTAL SALES'

FROM publications.authors as au
LEFT JOIN titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN titles as tit
ON au.au_id = titau.au_id
GROUP BY au.au_id
ORDER BY `TOTAL SALES` DESC;