import sqlite3
db = sqlite3.connect('students.db')
cur = db.cursor()
def initializeDB():
    try:
        f = open("sqlcommands.sql", "r")
        commandstring = ""
        for line in f.readlines():
            commandstring+=line
        cur.executescript(commandstring)
        f.close()
    except sqlite3.OperationalError:
        print("Database exists, skip initialization")
    except:
        print("No SQL file to be used for initialization") 
    
    try:
        f = open("init.sql", "r")
        initcommandstring = ""
        for line in f.readlines():
            initcommandstring+=line
        cur.executescript(initcommandstring)
    except sqlite3.Error as er:
        print(f"Error during additional initialization: {er.args}")

def fieldStudents():
    cur.execute("SELECT * FROM Field;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[1] + ", " + i[2])
    print( )
    SQLlist.clear()
    whatField = input("What fields students do you want to see? ")
    cur.execute("SELECT * FROM Student WHERE Student.fieldID_FK=?;", (whatField,))
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[2]) + ", " + i[3] + ", " + i[1] + ", " + i[4])
    return

def studentCourses():
    cur.execute("SELECT * FROM Student;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[2] + " " + i[3])
    print( )
    SQLlist.clear()
    whatStudent = input("Whos courses do you want to see? ")
    cur.execute("""SELECT S.first_name || ' ' ||  S.last_name AS "'Student'", 
                GROUP_CONCAT(C.course_name, " ") AS "'Course'" 
                    FROM Student S 
                    JOIN CourseInformation CI ON S.studentID = CI.studentID_FK
                    JOIN Course C ON CI.courseID_FK = C.courseID 
                    WHERE S.studentID=? GROUP BY 'Student'""", (whatStudent,))
    SQLlist = cur.fetchall()
    print( )
    print(SQLlist[0][0]+":")
    for i in SQLlist:
        print(i[1])
    return

def courseInformation():
    cur.execute("SELECT * FROM Course;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(i)
    print( )
    SQLlist.clear()
    whatCourse = input("Which courses information do you want to see?")
    cur.execute("""
    SELECT
        C.course_name AS 'Course',
        GROUP_CONCAT(S.first_name || ' ' ||  S.last_name, ', ') AS 'Student',
        P.first_name || ' ' ||  P.last_name AS 'Professor'
            FROM Course C
            JOIN CourseInformation CI ON CI.courseID_FK = C.courseID
            JOIN Student S ON S.studentID = CI.studentID_FK
            JOIN Professor P ON P.staffID = CI.staffID_FK
            WHERE C.courseID =?
            GROUP BY 'C.course_name'""", (whatCourse,))
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[1] + "," + i[2])
    return

def addCourse():
    course_name = input("Enter the course name: ")
    cur.execute("SELECT * FROM Course;")
    existingIDs = cur.fetchall()
    for id in existingIDs:
        course_id = id[0]
    course_id += 1
    cur.execute("INSERT INTO Course (courseID, course_name) VALUES (?, ?);", (course_id, course_name,))
    print("Course " + course_name + " added.")

def modifyCourse():
    cur.execute("SELECT * FROM Course;")
    courses = cur.fetchall()
    for course in courses:
        print(str(course[0]) + ", " + course[1])
    print()
    courseID = input("Enter ID of the course you want to modify: ")
    course_exists = False
    for course in courses:
        if course[0] == int(courseID):
            course_exists = True
            break
    if course_exists:
        newName = input("Enter new name for course: ")
        cur.execute("UPDATE Course SET course_name=? WHERE courseID=?", (newName, courseID,))
        print("Course modified.")
    else: 
        print("Course not found.")

def deleteCourse():
    cur.execute("SELECT * FROM Course;")
    courses = cur.fetchall()
    for course in courses:
        print(str(course[0]) + ", " + course[1])
    print()
    courseID = input("Enter ID of the course you want to delete: ")
    course_exists = False
    for course in courses:
        if course[0] == int(courseID):
            course_exists = True
            break
    if course_exists:
        cur.execute("DELETE FROM Course WHERE courseID=?", (courseID,))
        print("Course deleted.")
    else:
        print("Course not found.")

def main():
    initializeDB()
    userInput = -1
    while(userInput != "0"):
        print("\nMenu options:")
        print("1: Print fields students")
        print("2: Print students courses")
        print("3: Print course information") #TÄÄ ON SE JOINX2
        print("4: Print courses that a professor teaches")
        print("5: Print fields events")
        print("6: Add course")
        print("7: Modify course")
        print("8: Delete course")
        print("0: Quit")
        userInput = input("What do you want to do? ")
        print(userInput)
        if userInput == "1":
            fieldStudents()
        if userInput == "2":
            studentCourses()
        if userInput == "3":
            courseInformation()
        if userInput == "4":
            pass
        if userInput == "5":
            pass
        if userInput == "6":
            addCourse()
        if userInput == "7":
            modifyCourse()
        if userInput == "8":
            deleteCourse()
        if userInput == "0":
            print("Ending software...")
    db.close()        
    return

main()