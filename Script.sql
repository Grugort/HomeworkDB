CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE artist_genres (
    artist_id INT REFERENCES artists(artist_id),
    genre_id INT REFERENCES genres(genre_id) ,
    UNIQUE (artist_id, genre_id)
);


CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL
);


CREATE TABLE album_artists (
    album_id INT REFERENCES albums(album_id) ,
    artist_id INT REFERENCES artists(artist_id) ,
    UNIQUE (album_id, artist_id)
);


CREATE TABLE songs (
    songs_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL REFERENCES albums(album_id)
);


CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL
);


CREATE TABLE compilation_songs (
    compilation_id INT REFERENCES compilations(compilation_id) ,
    songs_id INT REFERENCES songs(songs_id) ,
    UNIQUE (compilation_id, songs_id)
);