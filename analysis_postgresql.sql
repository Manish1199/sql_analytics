-- 1. who is the senior most employee based on job title

select *from employee
order by levels desc
limit 1;


-- 2. which county have most invoice.

select count(*) as most,billing_country from Invoice
group by billing_country
order by most desc;

-- 3. what are top 3 values total invoice

select total from invoice
order by total desc
limit 3


-- 4. which city has best customer

select sum(total) as total,billing_city from invoice
group by billing_city
order by total desc

-- 5. who is the best customer? the customer who spent more money will by

select c.first_name,c.last_name,sum(i.total) as invest
from customer c
join invoice i on c.customer_id = i.customer_id
group by c.first_name,c.last_name
order by invest desc
limit 1



-- 6. write a query to return  the email, first name last name and genre of all rock music listenres

select distinct c.email,c.first_name,c.last_name
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line l on i.invoice_id = l.invoice_id
join track t on l.track_id = t.track_id
join genre g on t.genre_id = g.genre_id
where g.name = 'Rock'
order by c.email;

-- or


select distinct c.email,c.first_name,c.last_name
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line l on i.invoice_id = l.invoice_id
where track_id in (
	select track_id from track 
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email



-- 7. lets invite the artist who have written the most rock in our data set 


select count(track.genre_id) as total,artist.name
from artist 
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
group by artist.name
order by total
limit 10;


select * from artist


-- 8.