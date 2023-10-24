SELECT 
    au.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    tl.title AS 'TITLE',
    pb.pub_name AS 'PUBLISHER'
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS tlau ON au.au_id = tlau.au_id
        LEFT JOIN
    titles AS tl ON tlau.title_id = tl.title_id
        LEFT JOIN
    publishers AS pb ON tl.pub_id = pb.pub_id;