-- Challenge 1

select a.au_id as AUTHOR_ID, a.au_lname as Last_Name, a.au_fname as Fist_Name, t.title as Title, pb.pub_name as Publisher

from authors as a
inner join
titleauthor as ta
on a.au_id = ta.au_id
inner join
titles as t
on ta.title_id = t.title_id
left join
publishers as pb
on t.pub_ID = pb.pub_id;

-- Challenge 2

SELECT  a.au_id AS AUTHOR_ID, a.au_lname AS Last_Name, a.au_fname AS First_Name, COUNT(t.title) AS Title_Count, pb.pub_name AS Publisher
FROM 
    authors AS a
INNER JOIN 
    titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN 
    titles AS t ON ta.title_id = t.title_id
LEFT JOIN 
    publishers AS pb ON t.pub_id = pb.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, pb.pub_name;
    
-- Challenge 3
select a.au_id as AUTHOR_ID, a.au_lname as Last_Name, a.au_fname as Fist_Name, count(s.qty) as Cantidad

from authors as a
inner join
titleauthor as ta
on a.au_id = ta.au_id
inner join
titles as t
on ta.title_id = t.title_id
inner join
sales as s
on t.title_id= s.title_id
group by 
a.au_id, a.au_lname, a.au_fname
ORDER BY
    Cantidad DESC
    limit 3;
    
-- Challenge 4 
select a.au_id as AUTHOR_ID, a.au_lname as Last_Name, a.au_fname as Fist_Name, count(s.qty) as Cantidad

from authors as a
left join
titleauthor as ta
on a.au_id = ta.au_id
left join
titles as t
on ta.title_id = t.title_id
left join
sales as s
on t.title_id= s.title_id
group by 
a.au_id, a.au_lname, a.au_fname
ORDER BY
    Cantidad DESC
  
