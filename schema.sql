-- Author table creation
CREATE TABLE Author (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

-- Game Table creation
CREATE TABLE Game (
    id INT PRIMARY KEY,
    genre VARCHAR(255),
    author VARCHAR(255),
    source VARCHAR(255),
    label VARCHAR(255),
    publish DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE
);
