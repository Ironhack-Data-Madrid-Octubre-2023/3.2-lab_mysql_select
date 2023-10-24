-- Challenge 1
select authors.au_id as AUTHOR_ID,
	   authors.au_lname as LAST_NAME, 
       authors.au_fname as FIRST_NAME, 
       titles.title as TITLE, 
       publishers.pub_name as PUBLISHER 
    from authors
inner join titleauthor -- para coger el title_id entro a traves del au_id
on authors.au_id = titleauthor.au_id
inner join titles -- luego paso a coger el titulo de la obra a través del title_id
on titleauthor.title_id = titles.title_id
inner join publishers -- luego paso a coger el nombre del publisher vía el pub_id
on titles.pub_id = publishers.pub_id;


