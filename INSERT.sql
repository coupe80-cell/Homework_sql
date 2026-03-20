--Задание 1

INSERT INTO artists (name) VALUES
('Артист'),
('Артист 1'),
('Артист 2'),
('Артист 3'),
('Артист 4');

INSERT INTO genres (name) VALUES
('Жанр 1'),
('Жанр 2'),
('Жанр 3');

INSERT INTO albums (name, year) VALUES
('Альбом 1', 1990),
('Альбом 2', 2015),
('Альбом 3', 2025),
('Альбом 4', 2020);

INSERT INTO tracks (album_id, name, length) VALUES
(1, 'Песня 1', '180'),
(1, 'Песня 2', '240'),
(2, 'Песня 3', '210'),
(2, 'Песня 4', '190'),
(3, 'Песня 5', '220'),
(3, 'мой песня', 200),
(3, 'Песня 6', '250');
(4, 'Песня 7', '234'),
(4, 'Песня 8', '250');


INSERT INTO collections(name, year) values
('Сборник 1', 2020),
('Сборник 2', 2021),
('Сборник 3', 1995),
('Сборник 4', 2023);


INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);


INSERT INTO artist_album(album_id, artist_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 1);


INSERT INTO collection_track(collection_id, track_id) values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6);
