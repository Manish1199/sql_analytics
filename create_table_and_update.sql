-- create table customer(
-- 	customer_id int,	
-- 	first_name	varchar(20),
-- 	last_name varchar(20),
-- 	company	varchar(40),
-- 	address	varchar(50),
-- 	city varchar(30),
-- 	state	varchar(40),
-- 	country	varchar(30),
-- 	postal_code	varchar(25),
-- 	phone varchar(30),
-- 	fax	varchar(30),
-- 	email	varchar(35),
-- 	support_rep_id int,
-- 	primary key(customer_id)
-- )

-- alter table customer add constraint fk_key foreign key(support_rep_id) references employee(employee_id);

-- create table media_type(
-- 	media_type_id int,
-- 	name varchar(30),
-- 	primary key (media_type_id)
-- );

-- create table genre(
-- 	genre_id int,
-- 	name varchar(30),
-- 	primary key(genre_id)
-- );

-- create table artist(
-- 	artist_id int,
-- 	name varchar(30),
-- 	primary key(artist_id)
-- );

-- create table album(
-- 	album_id int,
-- 	title varchar(60),
-- 	artist_id int,
-- 	primary key(album_id),
-- 	foreign key(artist_id) references artist(artist_id)
-- );


-- create table playlist(
-- 	playlist_id int,
-- 	name varchar(60),
-- 	primary key(playlist_id)
-- );

-- create table track(
-- 	track_id int,
-- 	name varchar(60),
-- 	album_id int,
-- 	media_type_id int,
-- 	genre_id int,
-- 	composer varchar(50),
-- 	milliseconds varchar(30),
-- 	bytes varchar(30),
-- 	unit_price decimal(10,2),
-- 	primary key(track_id),
-- 	foreign key(album_id) references album(album_id),
-- 	foreign key(media_type_id) references media_type(media_type_id),
-- 	foreign key(genre_id) references genre(genre_id)
-- );



-- create table playlist_track(
-- 	playlist_id int,
-- 	track_id int,
-- 	foreign key(playlist_id) references playlist(playlist_id),
-- 	foreign key(track_id) references track(track_id)
-- );


-- create table Invoice_line(
-- 	invoice_line_id int,
-- 	invoice_id int,
-- 	track_id int,
-- 	unit_price decimal(10,2),
-- 	quantity int,
-- 	primary key(invoice_line_id),
-- 	foreign key(invoice_id) references invoice(invoice_id)
-- );

-- create table invoice(
-- 	invoice_id int,
-- 	customer_id int,
-- 	invoice_date date,
-- 	billing_address varchar(40),
-- 	billing_city varchar(40),
-- 	billing_state varchar(40),
-- 	billing_country varchar(40),
-- 	billing_postal_code varchar(40),
-- 	total decimal(12,2),
-- 	primary key(invoice_id),
-- 	foreign key(customer_id) references customer(customer_id)
-- )



-- create table employee(

-- 	employee_id int,
-- 	last_name varchar(40),
-- 	first_name varchar(40),
-- 	title varchar(40),
-- 	reports_to int,
-- 	levels varchar(10),
-- 	birthdate date,
-- 	hire_date date,
-- 	address varchar(30),
-- 	city varchar(40),
-- 	state varchar(40),
-- 	country varchar(40),
-- 	postal_code varchar(40),
-- 	phone varchar(30),
-- 	fax varchar(30),
-- 	email varchar(40),
-- 	primary key(employee_id),
-- 	foreign key(reports_to) references employee(employee_id)
-- );

-- alter table artist alter column name type varchar(150);

-- alter table track alter column composer type varchar(200);

-- alter table track alter column name type varchar(200);

-- select * from track