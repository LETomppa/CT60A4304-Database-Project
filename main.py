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
    whatField = input("What fields students do you want to see? ")
    cur.execute("SELECT * FROM Student WHERE Student.fieldID_FK=?;", (whatField,))
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(i)
    return

def studentCourses():
    cur.execute("SELECT * FROM Student;")
    whatStudent = input("Whos courses do you want to see?")
    cur.execute("SELECT * FROM  WHERE")
    SQLlist = cur.fetchall()
    for i in SQLlist:
        print(i)
    return

def main():
    initializeDB()
    userInput = -1
    while(userInput != "0"):
        print("\nMenu options:")
        print("1: Print fields students")
        print("2: Print students courses") # TÄÄ ON 2XJOIN ELI NÄYTTÄÄ KURSSIN OPETTAJAN
        print("3: Print courses students")
        print("4: Print courses that a professor teaches")
        print("5: Print fields events")
        print("x: Search for one player")
        print("x: Move matchdate")
        print("x: Delete player")
        print("0: Quit")
        userInput = input("What do you want to do? ")
        print(userInput)
        if userInput == "1":
            fieldStudents()
        if userInput == "2":
            studentCourses()
        if userInput == "3":
            pass
        if userInput == "4":
            pass
        if userInput == "5":
            pass
        if userInput == "6":
            pass
        if userInput == "0":
            print("Ending software...")
    db.close()        
    return

main()