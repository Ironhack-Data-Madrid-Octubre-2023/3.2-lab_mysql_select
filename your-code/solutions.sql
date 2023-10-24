-- Challenge 1 - Who Have Published What At Where?

select count(`AUTHOR ID`)
from
(select a.au_id as `AUTHOR ID`,
	   a.au_lname as `LAST NAME`,
       a.au_fname as `FIRST NAME`,
       t.title as TITLES,
       p.pub_name as PUBLISHER
       
		
from authors as a
inner join titleauthor
on a.au_id = titleauthor.au_id
left join titles as t
on t.title_id = titleauthor.title_id
left join publishers as p
on p.pub_id = t.pub_id) as authortitlepublisher
;

SELECT COUNT(AU_ID)
FROM TITLEAUTHOR;

-- LO HE HECHO ASÍ PARA DEMOSTRAR QUE AMBAS COLUMNAS TIENEN 25 RESULTADOS

-- Challenge 2 - Who Have Published How Many At Where?


select `AUTHOR ID`,
	     `LAST NAME`,
       `FIRST NAME`,
        PUBLISHER,
	    count(TITLES) as `TITLE COUNT`
from
(select a.au_id as `AUTHOR ID`,
	      a.au_lname as `LAST NAME`,
        a.au_fname as `FIRST NAME`,
        t.title as TITLES,
        p.pub_name as PUBLISHER
       
		
from authors as a
inner join titleauthor
on a.au_id = titleauthor.au_id
left join titles as t
on t.title_id = titleauthor.title_id
left join publishers as p
on p.pub_id = t.pub_id) as authortitlepublisher

group by `AUTHOR ID`, 'LAST NAME', 'FIRST NAME', PUBLISHER;


-- Challenge 3 - Best Selling Authors

SELECT A.au_id as 'AUTHOR ID',
       A.au_lname as 'LAST NAME',
       A.au_fname as 'FIRST NAME',
       SUM(s.qty) as 'TOTAL'

FROM AUTHORS AS A
left JOIN TITLEAUTHOR AS TA
ON a.au_id = ta.au_id
LEFT JOIN TITLES AS T
ON ta.title_id = t.title_id
LEFT JOIN sales AS s
ON t.title_id = s.title_id

group by A.au_id , A.au_lname, A.au_fname
order by TOTAL desc
limit 3;

-- Challenge 4 - Best Selling Authors Ranking



SELECT A.au_id as 'AUTHOR ID',
       A.au_lname as 'LAST NAME',
       A.au_fname as 'FIRST NAME',
       COALESCE(SUM(s.qty),0) as 'TOTAL'
       

FROM AUTHORS AS A
left JOIN TITLEAUTHOR AS TA
ON a.au_id = ta.au_id
LEFT JOIN TITLES AS T
ON ta.title_id = t.title_id
LEFT JOIN sales AS s
ON t.title_id = s.title_id

group by A.au_id , A.au_lname, A.au_fname
order by TOTAL desc;
