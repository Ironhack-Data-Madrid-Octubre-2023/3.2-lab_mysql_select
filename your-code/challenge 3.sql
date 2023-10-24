SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    sum(s.qty) AS TOTAL
FROM
authors a
LEFT JOIN titleauthor ta 
ON a.au_id = ta.au_id
LEFT JOIN  sales s
ON ta.title_id=s.title_id
GROUP BY a.au_id
ORDER BY TOTAL desc
LIMIT 3;