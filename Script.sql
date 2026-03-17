CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INTEGER NOT NULL CHECK(release_year > 0)
);

CREATE TABLE track (
    id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES album(id),
    title TEXT NOT NULL,
    duration INTERVAL NOT NULL,
    FOREIGN KEY(album_id) REFERENCES album(id)
);

CREATE TABLE compilation (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL CHECK(year > 0)
);

CREATE TABLE artist_genre (
    artist_id INTEGER REFERENCES artist(id),
    genre_id INTEGER REFERENCES genre(id),
    PRIMARY KEY(artist_id, genre_id)
);

CREATE TABLE album_artist (
    album_id INTEGER REFERENCES album(id),
    artist_id INTEGER REFERENCES artist(id),
    PRIMARY KEY(album_id, artist_id)
);

CREATE TABLE compilation_track (
    compilation_id INTEGER REFERENCES compilation(id),
    track_id INTEGER REFERENCES track(id),
    PRIMARY KEY(compilation_id, track_id)
);