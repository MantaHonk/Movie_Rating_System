CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    budget INT,
    revenue INT
);

CREATE TABLE Cast (
    cast_id INT PRIMARY KEY,
    name VARCHAR(255),
    gender INT
);

CREATE TABLE Studio (
    studio_id INT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    name VARCHAR(255),
    gender VARCHAR(255)
)

CREATE TABLE user (
    profile_id INT PRIMARY KEY,
    name VARCHAR(255),
    password VARCHAR(255)
)
