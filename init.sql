CREATE TABLE School (
    school_name VARCHAR(50),
);

CREATE TABLE Student (
    studentID INT PRIMARY KEY NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(10),
    phone_number VARCHAR(20),
);

CREATE TABLE Field (
    fieldID INT PRIMARY KEY NOT NULL,
    guild_name VARCHAR(50),
    name VARCHAR(50),
);