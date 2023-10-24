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
