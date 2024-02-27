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



def main():
    initializeDB()
    userInput = -1
    while(userInput != "0"):
        print("\nMenu options:")
        print("1: Print Players")
        print("2: Print Ranking")
        print("3: Print Matches")
        print("4: Search for one player")
        print("5: Move matchdate")
        print("6: Delete player")
        print("0: Quit")
        userInput = input("What do you want to do? ")
        print(userInput)
        if userInput == "1":
            pass
        if userInput == "2":
            pass
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