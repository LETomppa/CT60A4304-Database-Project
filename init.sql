CREATE TABLE School (
    schoolID INT PRIMARY KEY NOT NULL,
    school_name VARCHAR(50),
);

CREATE TABLE Student (
    studentID INT PRIMARY KEY NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20),
    courseID_FK INT,
        FOREIGN KEY (Course)
        REFERENCES Course (courseID)
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
        FOREIGN KEY (Course)
        REFERENCES Course (courseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

