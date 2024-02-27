CREATE TABLE School (
    schoolID INT PRIMARY KEY NOT NULL,
    school_name VARCHAR(50)
);

CREATE TABLE Field (
    fieldID INT PRIMARY KEY NOT NULL,
    guild_name VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE Student (
    studentID INT PRIMARY KEY NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20),
    courseID_FK INT,
        FOREIGN KEY (courseID_FK)
        REFERENCES Course (courseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    fieldID_FK INT,
        FOREIGN KEY (fieldID_FK)
        REFERENCES Field (fieldID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    schoolID_FK INT,
        FOREIGN KEY (schoolID_FK)
        REFERENCES School (SchoolID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Professor (
    staffID INT PRIMARY KEY NOT NULL,
    phone_number INT,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20),
    courseID_FK INT,
        FOREIGN KEY (courseID_FK)
        REFERENCES Course (courseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

