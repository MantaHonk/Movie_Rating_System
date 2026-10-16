CREATE TABLE Studio (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255),
    studio_location VARCHAR(255)
);

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    budget INT,
    revenue INT,
    imdb_rating INT,
    studio_id INT,
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Workers (
    worker_id INT PRIMARY KEY,
    worker_name VARCHAR(255)
);

CREATE TABLE CastMember (
    worker_id INT PRIMARY KEY,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

CREATE TABLE Role (
    character_played VARCHAR(255),
    cast_order INT,
    worker_id INT,
    movie_id INT,
    FOREIGN KEY (worker_id) REFERENCES CastMember(worker_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
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
    worker_id INT,
    movie_id INT,
    PRIMARY KEY (worker_id, movie_id),
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

CREATE TABLE Rates (
    profile_id INT UNIQUE,
    movie_id INT,
    rating INT,
    rates_timestamp INT,
    PRIMARY KEY (profile_id, movie_id)
);