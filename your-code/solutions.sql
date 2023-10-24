#Challenge 1 - Who Have Published What At Where?
select	ta.au_id,
		a.au_lname , 
		a.au_fname ,
        t.title ,
		pb.pub_name

from titleauthor as ta
left join authors as a on ta.au_id= a.au_id 
left join titles as t on ta.title_id=t.title_id
left join publishers as pb on t.pub_id=pb.pub_id;

#Challenge 2 - Who Have Published How Many At Where?
select	ta.au_id as 'AUTHOR ID',
		a.au_lname as 'LAST NAME' , 
		a.au_fname as 'FIRST NAME',
        pb.pub_name as 'PUBLISHER', 
        COUNT(t.title) AS 'Title_counts'

from titleauthor as ta
left join authors as a on ta.au_id= a.au_id 
left join titles as t on ta.title_id=t.title_id
left join publishers as pb on t.pub_id=pb.pub_id
group by 
ta.au_id,
		a.au_lname , 
		a.au_fname ,
        pb.pub_name
order by Title_counts desc;

#Challenge 3 - Best Selling Authors
select	ta.au_id as 'AUTHOR ID',
		a.au_lname as 'LAST NAME' , 
		a.au_fname as 'FIRST NAME',
        pb.pub_name as 'PUBLISHER', 
        t.title as 'TITLE',
        sum(sl.qty) as 'Total sales'

from titleauthor as ta
left join authors as a on ta.au_id= a.au_id 
left join titles as t on ta.title_id=t.title_id
left join publishers as pb on t.pub_id=pb.pub_id
left join sales as sl on sl.title_id=t.title_id
group by 
ta.au_id,
t.title,
a.au_lname , 
		a.au_fname ,
        pb.pub_name
order by `Total sales` desc
limit 3;

#Challenge 4 - Best Selling Authors Ranking
select	ta.au_id as 'AUTHOR ID',
		a.au_lname as 'LAST NAME' , 
		a.au_fname as 'FIRST NAME',
        pb.pub_name as 'PUBLISHER', 
        t.title as 'TITLE',
        COALESCE(SUM(sl.qty), 0) AS 'Total sales'

from titleauthor as ta
left join authors as a on ta.au_id= a.au_id 
left join titles as t on ta.title_id=t.title_id
left join publishers as pb on t.pub_id=pb.pub_id
left join sales as sl on sl.title_id=t.title_id
group by 
ta.au_id,
t.title,
a.au_lname , 
		a.au_fname ,
        pb.pub_name
order by `Total sales` desc;