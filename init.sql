CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    budget INT,
    revenue INT
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

CREATE TABLE UserProfile (
    profile_id INT PRIMARY KEY,
    profile_name VARCHAR(255),
    profile_password VARCHAR(255)
)
