Challenge 1

select au.au_id as 'AUTHOR ID',  au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', tl.title as 'TITLE', pub.pub_name as 'PUBLISHER'
from authors as au
inner join titleauthor as ta
on au.au_id=ta.au_id
inner join titles as tl
on ta.title_id=tl.title_id
left join publishers as pub
on tl.pub_id = pub.pub_id

--------------------------------------------------------------------------------------------------------------------------------------------


Challenge 2

select au.au_id as 'AUTHOR ID',  au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', pub.pub_name as 'PUBLISHER',

count(TITLE) as 'TITLE COUNT' 

from authors as au
inner join titleauthor as ta
on au.au_id=ta.au_id
inner join titles as tl
on ta.title_id=tl.title_id
left join publishers as pub
on tl.pub_id = pub.pub_id

group by
au.au_id, au.au_lname, au.au_fname, pub.pub_name;

--------------------------------------------------------------------------------------------------------------------------------------------


Challenge 3

select au.au_id as 'AUTHOR ID',  au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME',

count(sl.qty) as CANTIDAD

from authors as au
inner join titleauthor as ta
on au.au_id=ta.au_id
inner join titles as tl
on ta.title_id=tl.title_id
inner join sales as sl
on tl.title_id = sl.title_id

group by
au.au_id, au.au_lname, au.au_fname

order by
CANTIDAD desc
limit 3;

--------------------------------------------------------------------------------------------------------------------------------------------

Challenge 4

select au.au_id as 'AUTHOR ID',  au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME',

count(sl.qty) as CANTIDAD

from authors as au
inner join titleauthor as ta
on au.au_id=ta.au_id
inner join titles as tl
on ta.title_id=tl.title_id
inner join sales as sl
on tl.title_id = sl.title_id

group by
au.au_id, au.au_lname, au.au_fname

order by
CANTIDAD desc