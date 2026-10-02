CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    budget INT,
    revenue INT,
    imdb_rating INT,
    studio_id INT FOREIGN KEY REFERENCES Studio,
);

CREATE TABLE CastMember (
    cast_id INT PRIMARY KEY,
    cast_name VARCHAR(255),
    gender INT
);

CREATE TABLE Studio (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255),
    studio_location VARCHAR(255)
);

CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    crew_name VARCHAR(255),
    gender VARCHAR(255)
);

CREATE TABLE User (
    profile_id INT PRIMARY KEY,
    profile_name VARCHAR(255),
    profile_password VARCHAR(255)
);


CREATE TABLE ActsIn (
    cast_id INT,
    movie_id INT,
    credit_id VARCHAR(255),
    character_played VARCHAR(255),
    cast_order INT,
    PRIMARY KEY (cast_id, movie_id, credit_id)
);

CREATE TABLE WorksOn (
    crew_id INT,
    movie_id INT,
    job VARCHAR(255),
    department VARCHAR(255),
    PRIMARY KEY (crew_id, movie_id, job)
);

CREATE TABLE Rates (
    profile_id INT,
    movie_id INT,
    rating INT,
    rates_timestamp INT,
    PRIMARY KEY (profile_id, movie_id)
);