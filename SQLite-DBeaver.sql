-- Look at albums table
-- take a gander at the ER diagram
select *
from albums;

-- Metallica and Cellos?
select *
from albums 
where title like '%cellos%';

-- What artist does this?
select albums.title, artists.name
from albums 
inner join artists 
using (artistId)
where albums.title like '%cellos%';

-- Dare we look at the track names?
select t.name, t.composer
from tracks t;

select albums.title, artists.name, tracks.name
from albums
inner join tracks
using (albumId)
inner join artists
using (artistId)
where albums.title like '%cellos%';

-- https://youtu.be/55T1Rs8xjNc

-- Is this metal?  classical?  metal-lassical?
-- pull out the genres table
select distinct a.title, g.name
from albums a 
inner join tracks t
using (albumId)
inner join genres g 
using (genreId)
where a.title like '%cellos%';

-- one more exploration
select * from media_types mt;

-- for exploration, what tracks 
-- correspond to a "Purchased AAC audio file"?
select *
from tracks t
inner join media_types mt 
on t.MediaTypeId = mt.MediaTypeId
where mt.MediaTypeId = 4;

-- which genres tend to be this type?
select t.name,t.composer,g.name
from tracks t
inner join media_types mt 
on t.MediaTypeId = mt.MediaTypeId
inner join genres g
on g.GenreId = t.GenreId 
where mt.MediaTypeId = 4;

-- let's pull in the artist name too
select t.name,t.composer,g.name,a2.name
from tracks t
inner join media_types mt 
on t.MediaTypeId = mt.MediaTypeId
inner join genres g
on g.GenreId = t.GenreId 
inner join albums a1
on a1.AlbumId = t.AlbumId 
inner join artists a2 
on a2.ArtistId = a1.ArtistId 
where mt.MediaTypeId = 4;

-- and if we want to get a summary stat 
-- of how many tracks each genre has
-- matching this media type
select g.name,count(*)
from tracks t
inner join media_types mt 
on t.MediaTypeId = mt.MediaTypeId
inner join genres g
on g.GenreId = t.GenreId 
inner join albums a1
on a1.AlbumId = t.AlbumId 
inner join artists a2 
on a2.ArtistId = a1.ArtistId 
where mt.MediaTypeId = 4
group by g.name;

------------
-- Let's investigate with some final exercises
------------


-- Which countries have the most invoices?
-- (and order by decreasing value)


-- How many tracks were purchase in the USA?


-- What is the email and first/last name of people who purchased Classical music?
