CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    year INTEGER NOT null
);

CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES albums(id),
    name TEXT NOT NULL,
    lenght INTERVAL NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albums(id)
);
  
CREATE TABLE collections (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    year INTEGER NOT NULL 
);

CREATE TABLE artist_genre (
    artist_id INTEGER REFERENCES artists(id),
    genre_id INTEGER REFERENCES genres(id),
    PRIMARY KEY(artist_id, genre_id)
);

CREATE TABLE artist_album (
    album_id INTEGER REFERENCES albums(id),
    artist_id INTEGER REFERENCES artists(id),
    PRIMARY KEY(album_id, artist_id)
);

CREATE TABLE collection_track (
    collection_id INTEGER REFERENCES collections(id),
    track_id INTEGER REFERENCES tracks(id),
    PRIMARY KEY(collection_id, track_id)
);

ALTER TABLE albums ADD CONSTRAINT valid_year CHECK(year >= 1900);
ALTER TABLE collections ADD CONSTRAINT valid_year CHECK(year >= 1900);
ALTER TABLE tracks ALTER COLUMN length TYPE INTEGER USING EXTRACT(EPOCH FROM length)::integer; --Доработка с учётом рекомендаций преподователя
