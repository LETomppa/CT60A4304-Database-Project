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
    phone_number VARCHAR(20) CHECK (LENGTH(phone_number) >= 8), 
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

insert into Field (fieldID, guild_name, field_name) values ('028466', 'Aether', 'International Programs');
insert into Field (fieldID, guild_name, field_name) values ('022577', 'Armatuuri', 'Energy Technology');
insert into Field (fieldID, guild_name, field_name) values ('022732', 'Cluster', 'Computer Science');
insert into Field (fieldID, guild_name, field_name) values ('028933', 'Enklaavi', 'Business');
insert into Field (fieldID, guild_name, field_name) values ('023704', 'Kaplaaki', 'Industrial Engineering and Management');
insert into Field (fieldID, guild_name, field_name) values ('028201', 'KeTeK', 'Chemical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('023400', 'KRK', 'Mechanical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('023359', 'Lateksii', 'Computational Engineaering');
insert into Field (fieldID, guild_name, field_name) values ('027366', 'Pelletti', 'Environmental Engineering');
insert into Field (fieldID, guild_name, field_name) values ('029357', 'Satky', 'Electrical Engineering');
insert into Field (fieldID, guild_name, field_name) values ('021647', 'Tesseract', 'Technology and Engineering Science');
insert into Field (fieldID, guild_name, field_name) values ('022632', 'ESN', 'International Exchange');

insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000010', 'lwhaley0@army.mil', 'Lorrin', 'Whaley', '1990-05-15', '028466');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('001295', 'gledstone1@dyndns.org', 'Gabie', 'Ledstone', '1987-11-30', '023704');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000513', 'tnotley2@marketwatch.com', 'Torie', 'Notley', '2001-08-22', '028466');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000671', 'lcornewell3@intel.com', 'Leigh', 'Cornewell', '1975-03-10', '028466');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('006747', 'mrames4@wordpress.com', 'Mac', 'Rames', '1999-09-05', '022577');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('005781', 'nsanches5@china.com.cn', 'Nissy', 'Sanches', '1990-05-15', '022577');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('001906', 'fsprade6@dailymotion.com', 'Ferguson', 'Sprade', '1987-11-30', '022732');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('001160', 'rsnowsill7@sphinn.com', 'Ross', 'Snowsill', '2001-08-22', '023704');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('006065', 'lbelone8@gov.uk', 'Leandra', 'Belone', '1975-03-10', '022732');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('009356', 'cgreenhill9@dedecms.com', 'Cindi', 'Greenhill', '1999-09-05', '028933');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('008413', 'dgrubeya@gravatar.com', 'Daisie', 'Grubey', '1990-05-15', '028933');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('006150', 'hmorpheyb@constantcontact.com', 'Hussein', 'Morphey', '1987-11-30', '028201');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('004622', 'pbarrandc@flavors.me', 'Piggy', 'Barrand', '2001-08-22', '028201');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('005546', 'enuccitellid@go.com', 'Esdras', 'Nuccitelli', '1975-03-10', '023400');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000784', 'gbergstrame@webeden.co.uk', 'Gloria', 'Bergstram', '1999-09-05', '023400');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('005383', 'rbondsf@behance.net', 'Ryan', 'Bonds', '1990-05-15', '023400');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000999', 'khelderg@booking.com', 'Kippie', 'Helder', '1987-11-30', '023359');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('007863', 'jemesh@google.co.uk', 'Jessalyn', 'Emes', '2001-08-22', '023359');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('000553', 'tpashbeei@virginia.edu', 'Twila', 'Pashbee', '1975-03-10', '023359');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('005587', 'smccuskerj@i2i.jp', 'Skipton', 'McCusker', '1999-09-05', '027366');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('005688', 'corrickk@squidoo.com', 'Coriss', 'Orrick', '1990-05-15', '027366');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('003589', 'mpilll@about.com', 'Miquela', 'Pill', '1987-11-30', '029357');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('008809', 'aheightonm@cbsnews.com', 'Austen', 'Heighton', '2001-08-22', '021647');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('002029', 'iseebrightn@tripadvisor.com', 'Inga', 'Seebright', '1975-03-10', '021647');
insert into Student (studentID, email, first_name, last_name, birthday, fieldID_FK) values ('001898', 'maleksico@foxnews.com', 'Micheil', 'Aleksic', '1999-09-05', '022632');

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

insert into Course (courseID, course_name) values ('30000', 'The Art of Underwater Basket Weaving');
insert into Course (courseID, course_name) values ('30001', 'Advanced Sock Puppetry');
insert into Course (courseID, course_name) values ('30002', 'Extreme Cheese Tasting 101');
insert into Course (courseID, course_name) values ('30003', 'Ninja Techniques for Everyday Life');
insert into Course (courseID, course_name) values ('30004', 'The Science of Wombat Communication');
insert into Course (courseID, course_name) values ('30005', 'Unicorn Riding for Beginners');
insert into Course (courseID, course_name) values ('30006', 'Zombie Survival Strategies');
insert into Course (courseID, course_name) values ('30007', 'The History of Clowns in Modern Society');
insert into Course (courseID, course_name) values ('30008', 'Alien Abduction Studies');
insert into Course (courseID, course_name) values ('30009', 'The Philosophy of Bacon');
insert into Course (courseID, course_name) values ('30010', 'Intro to Time Travel');
insert into Course (courseID, course_name) values ('30011', 'The Psychology of Internet Memes');

insert into Events (event_name, fieldID_FK) values ('The Great Banana Peel Slip-Off', '028466');
insert into Events (event_name, fieldID_FK) values ('The Epic Pillow Fight Championship', '028466');
insert into Events (event_name, fieldID_FK) values ('The Silly Sock Puppet Showdown', '022577');
insert into Events (event_name, fieldID_FK) values ('The Hilarious Chicken Dance-Off', '022732');
insert into Events (event_name, fieldID_FK) values ('The Wacky Water Balloon Bonanza', '022732');
insert into Events (event_name, fieldID_FK) values ('The Ridiculous Rubber Chicken Relay', '028933');
insert into Events (event_name, fieldID_FK) values ('The Laugh-Out-Loud Lip Sync Battle', '023704');
insert into Events (event_name, fieldID_FK) values ('The Crazy Clown Car Race', '028201');
insert into Events (event_name, fieldID_FK) values ('The Outrageous Pie in the Face Extravaganza', '023400');
insert into Events (event_name, fieldID_FK) values ('The Zany Tickle Torture Tournament', '023359');
insert into Events (event_name, fieldID_FK) values ('The Whimsical Whoopee Cushion Concert', '027366');
insert into Events (event_name, fieldID_FK) values ('The Goofy Gummy Bear Juggling Contest', '029357');
insert into Events (event_name, fieldID_FK) values ('The Absurd Antics of the Silly String Show', '021647');
insert into Events (event_name, fieldID_FK) values ('The Side-Splitting Slapstick Comedy Hour', '022632');
insert into Events (event_name, fieldID_FK) values ('The Nutty Noodle Nunchuck Challenge', '022632');
insert into Events (event_name, fieldID_FK) values ('The Chuckle-Worthy Three-Legged Race', '028466');
insert into Events (event_name, fieldID_FK) values ('The Quirky Jello Wrestling Match', '028933');
insert into Events (event_name, fieldID_FK) values ('The Wacky Sock Puppet Show', '028466');
insert into Events (event_name, fieldID_FK) values ('The Giggly Hula Hoop Showdown', '022732');
insert into Events (event_name, fieldID_FK) values ('The Wacky Sock Puppet Show', '023704');
insert into Events (event_name, fieldID_FK) values ('The Great Banana Slip-Up', '028933');
insert into Events (event_name, fieldID_FK) values ('The Absurd Marshmallow Fight', '028201');
insert into Events (event_name, fieldID_FK) values ('The Wacky Sock Puppet Show', '029357');
insert into Events (event_name, fieldID_FK) values ('The Zany Water Balloon War', '022632');
insert into Events (event_name, fieldID_FK) values ('The Chuckle-Worthy Three-Legged Race', '028466');
insert into Events (event_name, fieldID_FK) values ('The Hysterical Rubber Chicken Relay', '023400');
insert into Events (event_name, fieldID_FK) values ('The Outrageous Costume Party', '023359');
insert into Events (event_name, fieldID_FK) values ('The Laugh-Out-Loud Paper Airplane Contest', '023400');
insert into Events (event_name, fieldID_FK) values ('The Goofy Lip Sync Battle', '028466');
insert into Events (event_name, fieldID_FK) values ('The Silly Balloon Animal Parade', '028466');
insert into Events (event_name, fieldID_FK) values ('The Outrageous Costume Party', '028933');
insert into Events (event_name, fieldID_FK) values ('The Laughable Karaoke Disaster', '022632');
insert into Events (event_name, fieldID_FK) values ('The Wacky Sock Puppet Show', '027366');
insert into Events (event_name, fieldID_FK) values ('The Loony Tug-of-War', '027366');
insert into Events (event_name, fieldID_FK) values ('The Giggly Hula Hoop Showdown', '029357');
insert into Events (event_name, fieldID_FK) values ('The Hysterical Rubber Chicken Relay', '023400');
insert into Events (event_name, fieldID_FK) values ('The Bizarre Talent Show', '028201');
insert into Events (event_name, fieldID_FK) values ('The Outrageous Costume Party', '027366');
insert into Events (event_name, fieldID_FK) values ('The Absurd Marshmallow Fight', '029357');
insert into Events (event_name, fieldID_FK) values ('The Chuckle-Worthy Three-Legged Race', '022732');

INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030000', '000010', '019068');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030000', '001295');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030001', '000010', '010145');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030001', '001295');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030001', '000513');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030001', '000671');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030001', '006747');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030001', '005781');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030002', '000010', '012816');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030002', '001295');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030002', '001906');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030002', '001160');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030002', '006065');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030003', '009356', '012346');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030003', '000513');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030004', '008413', '016597');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030004', '006150');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030004', '004622');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030005', '005546', '012796');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030005', '000784');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030006', '005383', '012834');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030006', '000513');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030007', '000999', '017126');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030007', '007863');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030008', '000553', '012428');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030008', '005587');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030009', '005688', '018326');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030010', '003589', '019068');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030010', '008809');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030010', '002029');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES ('030011', '001898', '010145');
INSERT INTO CourseInformation (courseID_FK ,studentID_FK) VALUES ('030011', '000999');

