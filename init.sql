-- FD: studio_id -> studio_name, studio_location
CREATE TABLE Studio (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255),
    studio_location VARCHAR(255)
);


-- FD: movie_id -> title, budget, revenue, imdb_rating, studio_id
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    budget INT,
    revenue INT,
    imdb_rating INT,
    studio_id INT,
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);




-- FD: worker_id -> worker_name
CREATE TABLE Workers (
    worker_id INT PRIMARY KEY,
    worker_name VARCHAR(255)
);




-- FD: none (only the key, worker_id)
CREATE TABLE CastMember (
    worker_id INT PRIMARY KEY,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);


-- FD: movie_id, cast_order -> worker_id, character_played
CREATE TABLE Role (
    character_played VARCHAR(255),
    cast_order INT,
    worker_id INT,
    movie_id INT,
    FOREIGN KEY (worker_id) REFERENCES CastMember(worker_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);


-- FD: profile_id -> profile_name, profile_password
CREATE TABLE User (
    profile_id INT PRIMARY KEY,
    profile_name VARCHAR(255),
    profile_password VARCHAR(255)
);




-- FD: none (only the key, worker_id + movie_id)
CREATE TABLE WorksOn (
    worker_id INT,
    movie_id INT,
    PRIMARY KEY (worker_id, movie_id),
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);


-- FD: profile_id, movie_id -> rating, rates_timestamp
CREATE TABLE Rates (
    profile_id INT,
    movie_id INT,
    rating INT,
    rates_timestamp INT,
    PRIMARY KEY (profile_id, movie_id),
    FOREIGN KEY (profile_id) REFERENCES User(profile_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    UNIQUE (profile_id)
);
