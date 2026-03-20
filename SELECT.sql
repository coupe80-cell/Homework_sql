--Задание 2

SELECT name AS трек, lenght AS продолжительность
FROM tracks
ORDER BY lenght DESC
LIMIT 1;

SELECT name AS трек
FROM tracks
WHERE lenght >= 210;


SELECT name AS сборник
FROM collections
WHERE year BETWEEN 2018 AND 2020;


SELECT name AS трек
FROM tracks
WHERE lenght >= 210;


SELECT name AS сборник
FROM collections
WHERE year BETWEEN 2018 AND 2020;


SELECT name AS трек
FROM tracks
WHERE LOWER(name) ILIKE '% мой %'
  OR LOWER(name) ILIKE 'мой %' 
  OR LOWER(name) ILIKE '% мой'
  OR LOWER(name) = 'мой'
  OR LOWER(name) ILIKE '% my %'  
  OR LOWER(name) ILIKE 'my %'
  OR LOWER(name) ILIKE '% my'
  OR LOWER(name) = 'my';


--Задание3

SELECT g.name AS жанр, COUNT(a.id) AS количество_исполнителей
FROM genres g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
LEFT JOIN artists a ON ag.artist_id = a.id
GROUP BY g.name;


SELECT COUNT(t.id) AS количество_треков
FROM tracks t
JOIN albums al ON t.album_id = al.id
WHERE al.year IN (2019, 2020);


SELECT al.name AS альбом, AVG(t.lenght) AS средняя_продолжительность
FROM tracks t
JOIN albums al ON t.album_id = al.id
GROUP BY al.name;


SELECT DISTINCT a.name AS исполнитель
FROM artists a
WHERE a.id NOT IN (
    SELECT aa.artist_id
    FROM artist_album aa
    JOIN albums alb ON aa.album_id = alb.id
    WHERE alb.year = 2020
);


SELECT c.name AS сборник
FROM collections c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN tracks tr ON ct.track_id = tr.id
JOIN artist_album aa ON tr.album_id = aa.album_id
JOIN artists a ON aa.artist_id = a.id
WHERE a.name = 'Артист 4';
