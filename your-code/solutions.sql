-- Challenge 1
select a.au_id,a.au_lname,a.au_fname,t.title, pb.pub_name from authors as a
left join titleauthor as ta
on a.au_id= ta.au_id
inner join titles as t
 on ta.title_id = t.title_id
 inner join publishers as pb
 on t.pub_id =pb.pub_id;

-- Challenge 2
select a.au_id, a.au_lname ,a.au_fname, pb.pub_name, count(t.title) from authors as a
left join titleauthor as ta
on a.au_id= ta.au_id
inner join titles as t
 on ta.title_id = t.title_id
 inner join publishers as pb
 on t.pub_id =pb.pub_id
 group by a.au_id, a.au_lname ,a.au_fname, pb.pub_name
 order by count(t.title) desc;

-- Challenge 3
select a.au_id,a.au_lname,a.au_fname, coalesce(sum(sa.qty),0) from authors as a
left join titleauthor as ta
on a.au_id= ta.au_id
left join titles as t
 on ta.title_id = t.title_id
 left join sales as sa
 on t.title_id =sa.title_id
 group by a.au_id,a.au_lname,a.au_fname
 order by sum(sa.qty) desc;

-- Challenge 4
select a.au_id,a.au_lname,a.au_fname, coalesce(sum(sa.qty),0) from authors as a
left join titleauthor as ta
on a.au_id= ta.au_id
left join titles as t
 on ta.title_id = t.title_id
 left join sales as sa
 on t.title_id =sa.title_id
 group by a.au_id,a.au_lname,a.au_fname
 order by sum(sa.qty) desc
 limit 3;
