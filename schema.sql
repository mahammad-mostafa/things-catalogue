-- Label table creation
CREATE TABLE Label (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255)
);

-- Genre table creation
CREATE TABLE Genre (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Author table creation
CREATE TABLE Author (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Book table creation
CREATE TABLE Book (
    id INT PRIMARY KEY,
    label_id INT FOREIGN KEY REFERENCES Label(id),
    genre_id INT FOREIGN KEY REFERENCES Genre(id),
    author_id INT FOREIGN KEY REFERENCES Author(id),
    publish DATE,
    archived BOOLEAN,
    publisher DATE,
    cover_state VARCHAR(255)
);

-- Album table creation
CREATE TABLE MusicAlbum (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    label_id INT FOREIGN KEY REFERENCES Label(id),
    genre_id INT FOREIGN KEY REFERENCES Genre(id),
    author_id INT FOREIGN KEY REFERENCES Author(id),
    release_date DATE,
    archived BOOLEAN,
    spotify BOOLEAN,
    last_played_at DATE
);

-- Game table creation
CREATE TABLE Game (
    id INT PRIMARY KEY,
    label_id INT FOREIGN KEY REFERENCES Label(id),
    genre_id INT FOREIGN KEY REFERENCES Genre(id),
    author_id INT FOREIGN KEY REFERENCES Author(id),
    publish DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE
);