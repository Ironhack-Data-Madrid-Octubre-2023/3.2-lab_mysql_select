--CHALLENGE 1:
select authors.au_id as "AUTHOR ID", au_fname as "FIRST NAME", au_lname as "LAST NAME", title as "TITLE", pub_name as "PUBLISHER"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on publishers.pub_id=titles.pub_id

--CHALLENGE 2:
select authors.au_id as "AUTHOR ID", au_fname as "FIRST NAME", au_lname as "LAST NAME", pub_name as "PUBLISHER",
count(distinct(title)) as "TITLE COUNT"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on publishers.pub_id=titles.pub_id
group by authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name;

--CHALLENGE 3:
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME" , sum(ytd_sales) as "TOTAL"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on publishers.pub_id=titles.pub_id
group by authors.au_id, au_lname, au_fname
order by sum(ytd_sales) desc
LIMIT 3;

--CHALLENGE 4:
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME" , IFNULL(SUM(ytd_sales), 0) as "TOTAL"
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on publishers.pub_id=titles.pub_id
group by authors.au_id, au_lname, au_fname
order by sum(ytd_sales) desc
LIMIT 23;