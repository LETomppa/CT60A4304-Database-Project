PRAGMA foreign_keys = ON;

CREATE TABLE School (
    schoolID VARCHAR(50) PRIMARY KEY NOT NULL UNIQUE,
    school_name VARCHAR(50)
);

CREATE TABLE Field (
    fieldID VARCHAR(50) PRIMARY KEY NOT NULL,
    guild_name VARCHAR(50),
    field_name VARCHAR(50)
);

CREATE TABLE Course (
    courseID VARCHAR(50) PRIMARY KEY,
    course_name VARCHAR(50),
    max_students int DEFAULT 500,
    schoolID_FK VARCHAR(50),
        FOREIGN KEY (schoolID_FK)
            REFERENCES School (SchoolID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE CourseInformation (
    courseID_FK VARCHAR(50),
    studentID_FK VARCHAR(50),
    staffID_FK VARCHAR(50),
    FOREIGN KEY (courseID_FK)
            REFERENCES Course (courseID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    
    FOREIGN KEY (studentID_FK)
            REFERENCES Student (studentID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    FOREIGN KEY (staffID_FK)
            REFERENCES Professor (staffID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE Student (
    studentID VARCHAR(50) PRIMARY KEY NOT NULL,
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20),
    schoolID_FK VARCHAR(50),
    fieldID_FK VARCHAR(50),
        FOREIGN KEY (fieldID_FK)
            REFERENCES Field (fieldID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

        FOREIGN KEY (schoolID_FK)
            REFERENCES School (SchoolID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE Professor (
    staffID VARCHAR(50) PRIMARY KEY NOT NULL,
    phone_number VARCHAR(20) CHECK (length(phone_number) >= 8), 
    email VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthday VARCHAR(20)
);

CREATE TABLE Events (
    event_name VARCHAR(50),
    fieldID_FK VARCHAR(50),
        FOREIGN KEY (fieldID_FK)
            REFERENCES Field (fieldID)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


--INSERTING DATA
insert into School (schoolID, school_name) values ('SCHOOL123', 'LUT University');

insert into Student (studentID, email, first_name, last_name, birthday) values ('000010', 'lwhaley0@army.mil', 'Lorrin', 'Whaley', '1990-05-15');
insert into Student (studentID, email, first_name, last_name, birthday) values ('001295', 'gledstone1@dyndns.org', 'Gabie', 'Ledstone', '1987-11-30');
insert into Student (studentID, email, first_name, last_name, birthday) values ('000513', 'tnotley2@marketwatch.com', 'Torie', 'Notley', '2001-08-22');
insert into Student (studentID, email, first_name, last_name, birthday) values ('000671', 'lcornewell3@intel.com', 'Leigh', 'Cornewell', '1975-03-10');
insert into Student (studentID, email, first_name, last_name, birthday) values ('006747', 'mrames4@wordpress.com', 'Mac', 'Rames', '1999-09-05');
insert into Student (studentID, email, first_name, last_name, birthday) values ('005781', 'nsanches5@china.com.cn', 'Nissy', 'Sanches', '1990-05-15');
insert into Student (studentID, email, first_name, last_name, birthday) values ('001906', 'fsprade6@dailymotion.com', 'Ferguson', 'Sprade', '1987-11-30');
insert into Student (studentID, email, first_name, last_name, birthday) values ('001160', 'rsnowsill7@sphinn.com', 'Ross', 'Snowsill', '2001-08-22');
insert into Student (studentID, email, first_name, last_name, birthday) values ('006065', 'lbelone8@gov.uk', 'Leandra', 'Belone', '1975-03-10');
insert into Student (studentID, email, first_name, last_name, birthday) values ('009356', 'cgreenhill9@dedecms.com', 'Cindi', 'Greenhill', '1999-09-05');
insert into Student (studentID, email, first_name, last_name, birthday) values ('008413', 'dgrubeya@gravatar.com', 'Daisie', 'Grubey', '1990-05-15');
insert into Student (studentID, email, first_name, last_name, birthday) values ('006150', 'hmorpheyb@constantcontact.com', 'Hussein', 'Morphey', '1987-11-30');
insert into Student (studentID, email, first_name, last_name, birthday) values ('004622', 'pbarrandc@flavors.me', 'Piggy', 'Barrand', '2001-08-22');
insert into Student (studentID, email, first_name, last_name, birthday) values ('005546', 'enuccitellid@go.com', 'Esdras', 'Nuccitelli', '1975-03-10');
insert into Student (studentID, email, first_name, last_name, birthday) values ('000784', 'gbergstrame@webeden.co.uk', 'Gloria', 'Bergstram', '1999-09-05');
insert into Student (studentID, email, first_name, last_name, birthday) values ('005383', 'rbondsf@behance.net', 'Ryan', 'Bonds', '1990-05-15');
insert into Student (studentID, email, first_name, last_name, birthday) values ('000999', 'khelderg@booking.com', 'Kippie', 'Helder', '1987-11-30');
insert into Student (studentID, email, first_name, last_name, birthday) values ('007863', 'jemesh@google.co.uk', 'Jessalyn', 'Emes', '2001-08-22');
insert into Student (studentID, email, first_name, last_name, birthday) values ('000553', 'tpashbeei@virginia.edu', 'Twila', 'Pashbee', '1975-03-10');
insert into Student (studentID, email, first_name, last_name, birthday) values ('005587', 'smccuskerj@i2i.jp', 'Skipton', 'McCusker', '1999-09-05');
insert into Student (studentID, email, first_name, last_name, birthday) values ('005688', 'corrickk@squidoo.com', 'Coriss', 'Orrick', '1990-05-15');
insert into Student (studentID, email, first_name, last_name, birthday) values ('003589', 'mpilll@about.com', 'Miquela', 'Pill', '1987-11-30');
insert into Student (studentID, email, first_name, last_name, birthday) values ('008809', 'aheightonm@cbsnews.com', 'Austen', 'Heighton', '2001-08-22');
insert into Student (studentID, email, first_name, last_name, birthday) values ('002029', 'iseebrightn@tripadvisor.com', 'Inga', 'Seebright', '1975-03-10');
insert into Student (studentID, email, first_name, last_name, birthday) values ('001898', 'maleksico@foxnews.com', 'Micheil', 'Aleksic', '1999-09-05');

insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('019068', '3585926932', 'fberthomier0@tiny.cc', 'Fayth', 'Berthomier', '1/6/1965');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('010145', '3588363311', 'dblazey1@discovery.com', 'Diandra', 'Blazey', '3/30/1970');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('012816', '3581892243', 'hraffeorty2@clickbank.net', 'Herta', 'Raffeorty', '4/4/1974');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('012346', '3582432141', 'mzarfati3@wp.com', 'Mohandas', 'Zarfati', '3/14/1985');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('016597', '3589964033', 'dcardinale4@meetup.com', 'Dawn', 'Cardinale', '8/30/1973');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('012796', '3583653186', 'nhaylett5@weibo.com', 'Norah', 'Haylett', '8/10/1979');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('012834', '3588356281', 'ggewer6@businessweek.com', 'Garwin', 'Gewer', '4/1/1970');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('017126', '3587000983', 'hvarnals7@oracle.com', 'Hamid', 'Varnals', '12/18/1964');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('012428', '3584715697', 'smicheau8@aol.com', 'Sissie', 'Micheau', '6/7/1966');
insert into Professor (staffID, phone_number, email, first_name, last_name, birthday) values ('018326', '3584768579', 'csimko9@imdb.com', 'Caitrin', 'Simko', '3/24/1966');

insert into Field (fieldID, guild_name, field_name) values ('028466', 'Aether', 'International Programs');
insert into Field (fieldID, guild_name, field_name) values ('022577', 'Armatuuri', 'Energy Technology');
insert into Field (fieldID, guild_name, field_name) values ('022732', 'Cluster', 'Computer Science');
insert into Field (fieldID, guild_name, field_name) values ('028933', 'Enklaavi', 'Business');
insert into Field (fieldID, guild_name, field_name) values ('023704', 'Kaplaaki', 'Industrial Engineering and Management');
insert into Field (fieldID, guild_name, field_name) values ('028201', 'KeTeK', 'Chemical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('023400', 'KRK', 'Mechanical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('023359', 'Lateksii', 'Computational Engineaering');
insert into Field (fieldID, guild_name, field_name) values ('027366', 'Pelletti', 'Environmental Engineering');
insert into Field (fieldID, guild_name, field_name) values ('029357', 'Sätky', 'Electrical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('021647', 'Tesseract', 'Technology and Engineering Science');
insert into Field (fieldID, guild_name, field_name) values ('022632', 'ESN', 'International Exchange');

insert into Course (courseID, course_name) values ('030000', 'The Art of Underwater Basket Weaving');
insert into Course (courseID, course_name) values ('030001', 'Advanced Sock Puppetry');
insert into Course (courseID, course_name) values ('030002', 'Extreme Cheese Tasting 101');
insert into Course (courseID, course_name) values ('030003', 'Ninja Techniques for Everyday Life');
insert into Course (courseID, course_name) values ('030004', 'The Science of Wombat Communication');
insert into Course (courseID, course_name) values ('030005', 'Unicorn Riding for Beginners');
insert into Course (courseID, course_name) values ('030006', 'Zombie Survival Strategies');
insert into Course (courseID, course_name) values ('030007', 'The History of Clowns in Modern Society');
insert into Course (courseID, course_name) values ('030008', 'Alien Abduction Studies');
insert into Course (courseID, course_name) values ('030009', 'The Philosophy of Bacon');
insert into Course (courseID, course_name) values ('030010', 'Intro to Time Travel');
insert into Course (courseID, course_name) values ('030011', 'The Psychology of Internet Memes');

insert into Events (event_name) values ('The Great Banana Peel Slip-Off');
insert into Events (event_name) values ('The Epic Pillow Fight Championship');
insert into Events (event_name) values ('The Silly Sock Puppet Showdown');
insert into Events (event_name) values ('The Hilarious Chicken Dance-Off');
insert into Events (event_name) values ('The Wacky Water Balloon Bonanza');
insert into Events (event_name) values ('The Ridiculous Rubber Chicken Relay');
insert into Events (event_name) values ('The Laugh-Out-Loud Lip Sync Battle');
insert into Events (event_name) values ('The Crazy Clown Car Race');
insert into Events (event_name) values ('The Outrageous Pie in the Face Extravaganza');
insert into Events (event_name) values ('The Zany Tickle Torture Tournament');
insert into Events (event_name) values ('The Whimsical Whoopee Cushion Concert');
insert into Events (event_name) values ('The Goofy Gummy Bear Juggling Contest');
insert into Events (event_name) values ('The Absurd Antics of the Silly String Show');
insert into Events (event_name) values ('The Side-Splitting Slapstick Comedy Hour');
insert into Events (event_name) values ('The Nutty Noodle Nunchuck Challenge');

INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030000', '000010', '019068');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030000', '001295', '019068');