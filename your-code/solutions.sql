CHALLENGE 1

select 
a.au_id as "AUTHOR ID",
a.au_lname as "LAST NAME",
a.au_fname as "FIRST NAME",
t.title as "TITLE",
p.pub_name as "PUBLISHER"
from authors a
inner join titleauthor ta ON a.au_id = ta.au_id
inner join titles t ON ta.title_id = t.title_id
inner join publishers p ON t.pub_id = p.pub_id;


CHALLENGE 2

select
a.au_id as "AUTHOR ID",
a.au_lname as "LAST NAME",
a.au_fname as "FIRST NAME",
p.pub_name as "PUBLISHER",
COUNT(t.title_id) as "TITLE COUNT"

from authors a

inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id

group by a.au_id, p.pub_name;




CHALLENGE 3

select 
a.au_id as "AUTHOR ID",
a.au_lname as "LAST NAME",
a.au_fname as "FIRST NAME",
SUM(s.qty) as "TOTAL"

from authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id

group by a.au_id, a.au_lname, a.au_fname

order by TOTAL desc
limit 3;



CHALLENGE 4

select
    a.au_id as "AUTHOR ID",
    a.au_lname as "LAST NAME",
    a.au_fname as "FIRST NAME",
    COALESCE(SUM(s.qty), 0) AS "TOTAL"
from
    authors a
    left join titleauthor ta on a.au_id = ta.au_id
    left join titles t on ta.title_id = t.title_id
    left join sales s on t.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by TOTAL desc;


