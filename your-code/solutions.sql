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

SELECT au.au_id AS 'AUTHOR ID',
		au.au_lname AS 'LAST NAME',
		au.au_fname AS 'FIRST NAME',
		IFNULL(SUM(tit.ytd_sales),0) AS 'Total Sales'

FROM publications.authors as au
LEFT JOIN titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN titles as tit
ON titau.title_id = tit.title_id

GROUP BY `AUTHOR ID`
ORDER BY `Total Sales` DESC
LIMIT 3;

--- CHALLENGE 4 ---

SELECT au.au_id AS 'AUTHOR ID',
		au.au_lname AS 'LAST NAME',
		au.au_fname AS 'FIRST NAME',
		IFNULL(SUM(tit.ytd_sales),0) AS 'Total Sales'

FROM publications.authors as au
LEFT JOIN titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN titles as tit
ON titau.title_id = tit.title_id

GROUP BY `AUTHOR ID`
ORDER BY `Total Sales` DESC;