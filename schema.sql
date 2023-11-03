-- Author table creation
CREATE TABLE Author (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Game Table creation
CREATE TABLE Game (
    id INT PRIMARY KEY,
    genre_id INT FOREIGN KEY REFERENCES Genre(id),
    author_id INT FOREIGN KEY REFERENCES Author(id),
    label_id INT FOREIGN KEY REFERENCES Label(id),
    publish DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE
);

-- Album Taable Creation
CREATE TABLE MusicAlbum (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    genre_id INT FOREIGN KEY REFERENCES Genre(id),
    author_id INT FOREIGN KEY REFERENCES Author(id),
    label_id INT FOREIGN KEY REFERENCES Label(id),
    release_date DATE,
    archived BOOLEAN,
    spotify BOOLEAN,
    last_played_at DATE
);

-- GENRE TABLE CREATION
CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
