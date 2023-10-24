SELECT 
	a.au_id AS 'AUTHOR ID',
	a.au_lname AS 'LAST NAME',
	a.au_fname AS 'FIRST NAME', 
	COALESCE(SUM(s.qty), 0) AS 'TOTAL'
FROM
    authors a
LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN
    sales s ON ta.title_id = s.title_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname
ORDER BY
    SUM(s.qty) DESC;
