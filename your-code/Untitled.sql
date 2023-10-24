select a.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', pb.pub_name as 'PUBLISHER',
count(t.title) as 'TITLES COUNT'
from authors as a
inner join titleauthor as ta
on a.au_id = ta.au_id
inner join titles as t
on ta.title_id = t.title_id
left join publishers as pb
on t.pub_id = pb.pub_id

group by
	a.au_id, a.au_lname, a.au_fname, t.title, pb.pub_name;
