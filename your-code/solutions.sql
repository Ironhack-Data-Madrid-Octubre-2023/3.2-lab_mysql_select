-- Challenge 1
select a.au_id as 'Author Id',
		a.au_lname as 'Last Name',
        a.au_fname as 'First Name',
        t.title as 'Title',
        p.pub_name as 'Publisher'
from titleauthor as ta
left join authors as a on ta.au_id=a.au_id
left join titles as t on ta.title_id=t.title_id
left join publishers as p on t.pub_id=p.pub_id;

-- Challenge 2
select a.au_id as 'Author Id',
		a.au_lname as 'Last Name',
        a.au_fname as 'First Name',
        p.pub_name as 'Publisher',
        count(t.title) as 'Title Count'
from titleauthor as ta
left join authors as a on ta.au_id=a.au_id
left join titles as t on ta.title_id=t.title_id
left join publishers as p on t.pub_id=p.pub_id
group by a.au_id, p.pub_name
order by `Title Count` desc;

-- Challenge 3
select a.au_id as 'Author Id',
		a.au_lname as 'Last Name',
        a.au_fname as 'First Name',
        sum(s.qty) as 'Total'
from authors as a
left join titleauthor as ta on a.au_id=ta.au_id
left join titles as t on ta.title_id=t.title_id
left join sales as s on t.title_id=s.title_id
group by a.au_id
order by `Total` desc
limit 3;

-- challenge 4
select a.au_id as 'Author Id',
		a.au_lname as 'Last Name',
        a.au_fname as 'First Name',
        coalesce(sum(s.qty), 0) as 'Total'
from authors as a
left join titleauthor as ta on a.au_id=ta.au_id
left join titles as t on ta.title_id=t.title_id
left join sales as s on t.title_id=s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by `Total` desc
limit 23;


