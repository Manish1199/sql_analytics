-- set 2 Moderate level questions


select artist.artist_id,artist.name,count(album.artist_id) as totalsong
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.a name like 'Rock'
group by artist.artist_id,artist.name
order by totalsong desc
limit 10;

-- 8. return the track?



SELECT name, milliseconds
FROM track
WHERE milliseconds::numeric > (
    SELECT AVG(milliseconds::numeric) AS fulllength
    FROM track
)
ORDER BY milliseconds::numeric DESC;


select * from track


-- Advance level questions ??SET 3


-- 1.  find how much spent money each customer on artist.?

select c.customer_id,c.first_name,c.last_name,artist.name,
sum(l.unit_price*l.quantity) spent
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line l on i.invoice_id=l.invoice_id
join track t on l.track_id = t.track_id
join album a on t.album_id=a.album_id
join artist on a.artist_id = artist.artist_id
group by 1,2,3,4
order by 5 desc


-- 9. we want find out most popular genre for each country/

with cte as(
select genre.name as name,c.country as country,count(l.quantity) as purchase,
Row_number() over (partition by c.country order by count(l.quantity) desc) as rank
from genre 
join track t on t.genre_id=genre.genre_id
join invoice_line l on t.track_id = l.track_id
join invoice i on l.invoice_id = i.invoice_id
join customer c on c.customer_id = i.customer_id 
group by 1,2
order by 2 asc, 3 desc
)
select rank,name,country,purchase from cte
where rank<=1

select genre.name as name,c.country as country,count(l.quantity) as purchase
from genre 
join track t on t.genre_id=genre.genre_id
join invoice_line l on t.track_id = l.track_id
join invoice i on l.invoice_id = i.invoice_id
join customer c on c.customer_id = i.customer_id 
group by 1,2
order by 2 asc, 3 desc




select genre.name as name,c.country as country,count(l.quantity) as purchase,
Row_number() over (partition by c.country order by count(l.quantity)) as rank
from genre 
join track t on t.genre_id=genre.genre_id
join invoice_line l on t.track_id = l.track_id
join invoice i on l.invoice_id = i.invoice_id
join customer c on c.customer_id = i.customer_id 
group by 1,2
order by 2 asc, 3 desc




-- 3. write a query to that determines the customer that has spent the most on music



with Recursive 
	customer_with_country as(
		select c.customer_id,c.first_name,c.last_name,i.billing_country,SUM(i.total) as spend
		from invoice i 
		join customer c on i.customer_id = c.customer_id
		group by 1, 2, 3,4
		order by 1, 5 desc),
	country_max_spending as (
		select billing_country,Max(spend) as Max_Spending
		from customer_with_country cwc
		group by billing_country)
select 	cc.billing_country,cc.spend,cc.first_name,cc.last_name
from customer_with_country cc 
join country_max_spending ms on cc.billing_country = ms.billing_country
order by 2 desc



with cte as (
	select concat(c.first_name,' ',c.last_name) as fullname,i.billing_country as country,sum(i.total) as total_spend,
	row_number() over (partition by i.billing_country order by sum(i.total) desc) as rowno	
	from invoice i 
	join customer c on c.customer_id = i.customer_id
	group by c.first_name,c.last_name,i.billing_country
	order by total_spend desc
)
select  fullname,country,total_spend from cte
where rowno<=1
order by country asc

