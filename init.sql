PRAGMA foreign_keys = ON;

CREATE TABLE School (
    schoolID INT PRIMARY KEY NOT NULL,
    school_name VARCHAR(50)
);

CREATE TABLE Field (
    fieldID INT PRIMARY KEY NOT NULL,
    guild_name VARCHAR(50),
    field_name VARCHAR(50)
);

CREATE TABLE Course (
    courseID INT PRIMARY KEY NOT NULL,
    course_name VARCHAR(50),
    max_students int,
    schoolID_FK INT,
    studentID_FK INT,
        FOREIGN KEY (schoolID_FK)
            REFERENCES School (SchoolID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        
        FOREIGN KEY (studentID_FK)
            REFERENCES Student (StudentID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE Student (
    studentID INT PRIMARY KEY NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20),
    courseID_FK INT,
    schoolID_FK INT,
    fieldID_FK INT,
        FOREIGN KEY (courseID_FK)
            REFERENCES Course (courseID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

        FOREIGN KEY (fieldID_FK)
            REFERENCES Field (fieldID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

        FOREIGN KEY (schoolID_FK)
            REFERENCES School (SchoolID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE StudentsInCourses ( --Helpottaa mukavasti tota manytomany linkkaamista , n:m
    courseID_FK INT,
    studentID_FK,
        FOREIGN KEY (courseID_FK)
            REFERENCES Course (courseID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

        FOREIGN KEY (studentID_FK)
            REFERENCES Student (studentID)
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

CREATE TABLE Events (
    event_name VARCHAR(50),
    fieldID_FK INT,
        FOREIGN KEY (fieldID_FK)
            REFERENCES Field (fieldID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

--TESTI