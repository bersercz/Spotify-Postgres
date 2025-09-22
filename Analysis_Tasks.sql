create table spotify (
	artist varchar(255),
	track varchar(255),
	album varchar(255),
	album_type varchar(50),
	danceability float,
	energy float,
	loudness float,
	speechiness float,
	acounticness float,
	instrumentalness float,
	liveness float,
	valence float,
	tempo float,
	duration_min float,
	title varchar(255),
	chanel varchar(255),
	views float,
	likes bigint,
	comments bigint,
	licensed bool,
	official_video bool,
	stream bigint,
	energy_liveness float,
	most_played_on varchar(50)	
);


select * from spotify;


select count(distinct artist) from spotify;


select distinct album_type from spotify;


select max(duration_min) from spotify;


select min(duration_min) from spotify;


select * from spotify
where duration_min = 0;


delete from spotify 
where duration_min = 0;


select distinct chanel from spotify;


-- ---------------
-- Data Analyzing
-- ---------------


-- 1 Retrieve the name of alll the tracks that have more then 1 million streams.


select * from spotify
	where stream > 1000000000;



-- 2 List all albums along with their respective artist.


select 
Distinct album,
artist
from spotify
order by 1;


-- 3 Get the total number of comments for tracks where licensed is True.


select 
 sum(comments)
from spotify
where licensed = 'true';


-- 4 Find all the tracks that belong to the album type single.


select 
track, album_type
from spotify
where album_type ilike 'single';



-- 5 Count the total no of tracks by each artist


select artist, 
	count(*) as total_no_songs 
	from spotify
group by 1
order by 2


-- 6 Calculate the avg daceability of tracks in each album.

select 
	album,
	avg(danceability) as avg_danceability
	from spotify
	group by 1
	order by 2 desc;
	

-- 7 Find the top 5 tracks with the high energy values.


select 
	distinct track,
	max(energy) as max_energy_values
	from spotify
	group by 1
	order by 2 desc
	limit 5;



-- 8 List all tracks along with their views and likes when official_video = True.


select 
	track,
	sum(views) as total_views,
	sum(likes) as total_likes
	from spotify
 	 where official_video = 'true'
	 group by 1


-- 9 For each album, calculate the total views of all associated tracks.

select
	 album, 
	 track,
	sum(views) as total_views
	from spotify
	group by 1,2;
	

-- 10 Count the total names that has been streamed on spotify more than youtube.


select * from 
(select 
	track,
	coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as streamed_on_youtube,
	coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as streamed_on_spotify
	from spotify 
	group by 1) as t1
	where streamed_on_spotify > streamed_on_youtube
	and 
	streamed_on_youtube != 0;



-- 11 Find the top 3 most-viewd tracks for each artist uing window function.


with ranking_artist
as(
select 
	artist,
	track,
	sum(views) as most_views, 
	dense_rank() over(partition by artist order by sum(views) desc) as rank
	from spotify
	group by 1,2
	order by 1,3 desc)
select * from ranking_artist
where rank <= 3


-- 12 Write a query to find the tracks names that has been streamed on spotify more than youtube.


select track from 
(select 
	track,
	coalesce(sum(case when most_played_on = 'Youtube' then stream end),0) as streamed_on_youtube,
	coalesce(sum(case when most_played_on = 'Spotify' then stream end),0) as streamed_on_spotify
	from spotify 
	group by 1) as t2
	where streamed_on_spotify > streamed_on_youtube
	and 
	streamed_on_youtube != 0;


-- 13 Use a with clause to calculate the difference between the highest and lowest energy values for tracks in each album.


with hldiff
as
(select 
	album,
	max(energy) as highest_energy,
	min(energy) as lowest_energy
	from spotify
	group by 1)
select
	album,
	highest_energy - lowest_energy as energy_diff
	from hldiff
	order by 2 desc



-- 14 Find tracks where the energy to liveness score is above the average.


select avg(liveness) from spotify


select 
	track, 
	artist,
	liveness
	from spotify
	where liveness > (select avg(liveness) from spotify)

-- 15 Calculate the cumulative sum of likes for tracking ordered by the number of views, using window functions.


select 
	artist,
	views,
	likes,
	sum(likes) 
	over(partition by artist  
	order by 2
	rows between unbounded preceding and current row) as cumalative_likes
	from spotify
	




-- Query Optimization 
Explain Analyze
select 
	artist,
	track,
	views
	from spotify
	where artist ='Gorillaz'
		and 
		most_played_on = 'Youtube'
	order by stream desc limit 25



create index artist_index on spotify(artist);
