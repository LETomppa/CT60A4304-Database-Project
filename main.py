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
    fieldID = input("Enter the ID of the field: ")
    field_exists = False
    for field in SQLlist:
        if int(field[0]) == int(fieldID):
            field_exists = True
            break
    if field_exists:
        SQLlist.clear()
        cur.execute("SELECT * FROM Student WHERE Student.fieldID_FK=?;", (fieldID,))
        SQLlist = cur.fetchall()
        for i in SQLlist:
            print(str(i[2]) + ", " + i[3] + ", " + i[1] + ", " + i[4])
    else:
        print("Field not found.")
    return

def studentCourses():
    cur.execute("SELECT * FROM Student;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[2] + " " + i[3])
    print( )
    studentID = input("Enter the ID of the student: ")
    student_exists = False
    for student in SQLlist:
        if int(student[0]) == int(studentID):
            student_exists = True
            break
    if student_exists:
        SQLlist.clear()
        cur.execute("""SELECT S.first_name || ' ' ||  S.last_name AS "'Student'", 
                    C.course_name AS "'Course'" 
                        FROM Student S 
                        JOIN CourseInformation CI ON S.studentID = CI.studentID_FK
                        JOIN Course C ON CI.courseID_FK = C.courseID 
                        WHERE S.studentID=? """, (studentID,))
        SQLlist = cur.fetchall()
        print( )
        print(SQLlist[0][0]+":")
        for i in SQLlist:
            print(i[1])
    else:
        print("Student not found.")
    return

def courseInformation():
    cur.execute("SELECT * FROM Course;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[1])
    print( )
    courseID = input("Enter the ID of the course: ")
    course_exists = False
    for course in SQLlist:
        if int(course[0]) == int(courseID):
            course_exists = True
            break
    if course_exists:
        SQLlist.clear()
        cur.execute("""
        SELECT
            C.course_name AS 'Course',
            S.first_name || ' ' ||  S.last_name AS 'Student',
            P.first_name || ' ' ||  P.last_name AS 'Professor'
                FROM Course C
                JOIN CourseInformation CI ON CI.courseID_FK = C.courseID
                JOIN Student S ON S.studentID = CI.studentID_FK
                LEFT JOIN Professor P ON P.staffID = CI.staffID_FK
                WHERE C.courseID =?""", (courseID,))
        SQLlist = cur.fetchall()
        print("Course:")
        print(SQLlist[0][0])
        print()
        print("Professor:")
        print(SQLlist[0][2])
        print()
        print("Students:")
        for i in SQLlist:
            print(str(i[1]))
    else:
        print("Course not found.")
    return

def professorCourses():
    cur.execute("SELECT * FROM Professor;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[3] + " " + i[4])
    print( )
    professorID = input("Enter the ID of the professor: ")
    professor_exists = False
    for professor in SQLlist:
        if int(professor[0]) == int(professorID):
            professor_exists = True
            break
    if professor_exists:
        SQLlist.clear()
        cur.execute("""SELECT P.first_name || ' ' ||  P.last_name AS 'Professor', 
                    C.course_name AS 'Course' 
                        FROM Professor P 
                        JOIN CourseInformation CI ON P.staffID = CI.staffID_FK
                        JOIN Course C ON CI.courseID_FK = C.courseID 
                        WHERE P.staffID=?""", (professorID,))
        SQLlist = cur.fetchall()
        print( )
        print(SQLlist[0][0]+":")
        for i in SQLlist:
            print(i[1])
    else:
        print("Professor not found.")
    return

def fieldEvents():
    cur.execute("SELECT * FROM Field;")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(str(i[0]) + ", " + i[1] + " " + i[2])
    print()
    fieldID = input("Enter the ID of the field: ")
    field_exists = False
    for field in SQLlist:
        if int(field[0]) == int(fieldID):
            field_exists = True
            break
    if field_exists:
        SQLlist.clear()
        cur.execute("""SELECT E.event_name AS 'Event',  
                        FROM Events E
                        WHERE E.fieldID_FK=?""", (fieldID,))
        SQLlist = cur.fetchall()
        print( )
        for i in SQLlist:
            print(i[1])
    else:
        print("Field not found.")
    return

def addCourse():
    course_name = input("Enter the course name: ")
    cur.execute("SELECT * FROM Course;")
    existingIDs = cur.fetchall()
    for id in existingIDs:
        course_id = int(id[0])
    course_id += 1
    course_id = "0" + str(course_id)
    cur.execute("SELECT * FROM Professor")
    professors = cur.fetchall()
    for professor in professors:
        print(professor[0] + ", " + professor[3] + " " + professor[4])
    professorID = input("Enter the ID of the professor you want to assign to the course: ")
    professor_found = False
    for professor in professors:
        if int(professor[0]) == int(professorID):
            professor_found = True
    print()
    cur.execute("SELECT * FROM Student")
    students = cur.fetchall()
    for student in students:
        print(student[0] + ", " + student[2] + " " + student[3])
    studentID = input("Enter the ID of the student you want to add to the course: ")
    student_found = False
    for student in students:
        if int(student[0]) == int(studentID):
            student_found = True
    if student_found and professor_found:
        cur.execute("INSERT INTO Course (courseID, course_name) VALUES (?, ?);", (course_id, course_name,))
        print("Course " + course_name + " added.")
        cur.execute("INSERT INTO CourseInformation (courseID_FK ,studentID_FK, staffID_FK) VALUES (?, ?, ?);", (course_id, studentID, professorID,))
        print()
        print("Data inserted.")
    else:
        print("Student or professor not found. Course not added.")

def modifyCourse():
    cur.execute("SELECT * FROM Course;")
    courses = cur.fetchall()
    for course in courses:
        print(str(course[0]) + ", " + course[1])
    print()
    courseID = input("Enter ID of the course: ")
    course_exists = False
    for course in courses:
        if int(course[0]) == int(courseID):
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
    courseID = input("Enter ID of the course: ")
    course_exists = False
    for course in courses:
        if int(course[0]) == int(courseID):
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
        print("3: Print course information")
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
            professorCourses()
        if userInput == "5":
            fieldEvents()
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