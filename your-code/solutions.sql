Challenge 1

--- El número de registros de la tabla y titleauthor coinciden

select au.au_id, au.au_lname, au.au_fname, t.title, pu.pub_name

from titleauthor as ti
left join titles as t
on ti.title_id = t.title_id
left join authors as au
on  ti.au_id = au.au_id
left join publishers as pu
on t.pub_id = pu.pub_id;

Challenge 2

select au.au_id, au.au_lname, au.au_fname, pu.pub_name, count(t.title) as total_titles 

from titleauthor as ti
left join titles as t
on ti.title_id = t.title_id
inner join authors as au
on  ti.au_id = au.au_id
left join publishers as pu
on t.pub_id = pu.pub_id
group by au.au_id, au.au_lname, au.au_fname, pu.pub_name
order by total_titles desc;

Challenge 3

select au.au_id, au.au_lname, au.au_fname, sum(s.qty) as total_sales 

from titleauthor as ti
left join titles as t
on ti.title_id = t.title_id
left join authors as au
on  ti.au_id = au.au_id
inner join sales as s
on t.title_id = s.title_id
group by au.au_id, au.au_lname, au.au_fname
order by total_sales desc
limit 3

Challenge 4

select au.au_id, au.au_lname, au.au_fname, coalesce(sum(s.qty),0) as total_sales 

from titleauthor as ti
left join titles as t
on ti.title_id = t.title_id
left join authors as au
on  ti.au_id = au.au_id
left join sales as s
on t.title_id = s.title_id
group by au.au_id, au.au_lname, au.au_fname
order by total_sales desc