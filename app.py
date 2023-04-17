from flask import Flask, request, make_response
import mysql.connector

app = Flask(__name__)

@app.route("/registeruser", methods=['POST'])
def registeruser():
    try: 
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        #cursor.execute('')
        content = request.json
        AccountType= content['AccountType'] 
        id = content['id']
        name = content['name']
        password = content['password']
        if AccountType=='Lecturer':
            lid=id
            department = content['department']
            #cursor.execute("INSERT INTO Lecturer(lid,name,password,faculty,department) VALUES(%s,%s,%s,%s,%s)",(lid,name,password,faculty,department))
            cursor.execute(f"INSERT INTO Lectures(LID, password,name, department) VALUES({lid},'{password}','{name}','{department}');")
            #cursor.execute(f"INSERT INTO User(id, name, password) VALUES('{id}', '{name}', '{password}');")
            cnx.commit()
            cursor.close()
            cnx.close()
            return make_response({'success': "Lecturer Added"},201)
        elif AccountType=='Student':
            sid=id
            major = content['major']
            department= content['faculty']
            #cursor.execute("INSERT INTO Lecturer(lid,name,password,major,faculty) VALUES(%s,%s,%s,%s,%s)",(lid,name,password,major,faculty))
            cursor.execute(f"INSERT INTO Students(SID, password, name, major, department) VALUES({sid},'{password}','{name}','{major}','{department}');")
            #cursor.execute(f"INSERT INTO User(id, name, password) VALUES('{id}', '{name}', '{password}');")
            cnx.commit()
            cursor.close()
            cnx.close()
            return make_response({'success': "Student Added"},201)
        elif AccountType=="Admin":
            aid= id
            cursor.execute(f"INSERT INTO Admins(AID, name, password) VALUES({aid},'{name}','{password}');")
            #cursor.execute(f"INSERT INTO User(id, name, password) VALUES('{id}', '{name}', '{password}');")
            cnx.commit()
            cursor.close()
            cnx.close()
            return make_response({'success': "Student Added"},201)
    except Exception as e:
        print(e)
        return make_response({'error': 'An error has occurred'},400)

@app.route("/login", methods=['POST'])
def login():
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        content = request.json
        username = content['username']
        password = content['password']
        cursor.execute(f"SELECT * FROM Lectures WHERE LID = {username} AND password = '{password}';")
        lecturer = cursor.fetchone()
        if lecturer:
            cursor.close()
            cnx.close()
            return make_response({'success': "Login Successful"},200)
        else:
            #cursor.close()
            #cnx.close()
            #return make_response({"error": "Invalid username or password"},401)  
            cursor.execute(f"SELECT * FROM Students WHERE SID = {username} AND password = '{password}';")
            student = cursor.fetchone()
            if student:
                cursor.close()
                cnx.close()
                return make_response({'success': "Login Successful"},200)
            else:
              cursor.execute(f"SELECT * FROM Admin WHERE AID = {username} AND password = '{password}';")
              admin = cursor.fetchone()
              if admin:
                  cursor.close()
                  cnx.close()
                  return make_response({'success': "Login Successful"},200)
              else:
                  cursor.close()
                  cnx.close()
                  return make_response({"error": "Invalid username or password"},401)
    except Exception as e:
        print(e)
        return make_response({"error": "An error has occurred"},400)


@app.route("/createcourse/<aid>", methods=['POST'])
def createCourse(aid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * FROM Admins WHERE AID = {aid};")
        admin = cursor.fetchone()
        if admin:
            content = request.json
            CourseID = content['CourseID']
            Coursename = content['Coursename']
            Semester_Offered = content['Semester_Offered']
            cursor.execute(f"INSERT INTO Courses(CourseID,Coursename,Semester_Offered) VALUES('{CourseID}', '{Coursename}','{Semester_Offered}');")
            cnx.commit()
            cursor.close()
            cnx.close()
            return make_response({'success': "Course Created Successfully"},201)
        else:
            return make_response({"error": "You are not authorized to create a course"},401)
    except Exception as e:
        print(e)
        return make_response({"error": "An error has occurred"},400)
    
@app.route("/assignlecturer/<aid>", methods=['POST'])
def assignlecturer(aid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * FROM Admins WHERE AID = {aid};")
        admin = cursor.fetchone()
        if admin:
            content = request.json
            lid = content['lid']
            cursor.execute(f"SELECT * FROM Lectures WHERE LID = {lid};")
            lecturer = cursor.fetchone()
            if lecturer:
                CourseID = content["CourseID"]
                Coursename=content["Coursename"]
                cursor.execute(f"SELECT * FROM Courses WHERE CourseID = '{CourseID}' AND Coursename = '{Coursename}';")
                course = cursor.fetchone()
                if course:
                    cursor.execute(f"INSERT INTO Manages(LID,CourseID) VALUES ({lid}, '{CourseID}');")
                    cnx.commit()
                    cursor.close()
                    cnx.close()
                    return make_response({'success': f"Lecturer {lid} has been successfully assigned to {Coursename} {CourseID}"},201)
                else:
                    return make_response({"error": "Course does not exist"},400)
            else:
                return make_response({"error": "Lecturer does not exist"},400)
        else:
              return make_response({"error": "You are not authorized to assign a lecturer"},401)
    except Exception as e:
        print(e)
        return make_response({"error": "An error has occurred"},400)

@app.route("/registerStudent", methods=['POST'])
def registerStudent():
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        content = request.json
        sid = content['sid']
        cursor.execute(f"SELECT * FROM Students WHERE SID = {sid};")
        student = cursor.fetchone()
        if student:
              CourseID= content["CourseID"]
              cursor.execute(f"SELECT Coursename FROM Courses WHERE CourseID = '{CourseID}';")
              CourseName = cursor.fetchone()
              if CourseName:
                 grade= content["grade"]
                 cursor.execute(f"INSERT INTO Assigned_to(id, CourseID, grade) VALUES ({sid}, '{CourseID}',{grade});")
                 cnx.commit()
                 cursor.close()
                 cnx.close()
                 return make_response({'success': f"Student {sid} has been successfully registered for {CourseName} {CourseID}"},201)
              else:
                    return make_response({"error": "Course does not exist"},400)
        else:
              return make_response({"error": "Student does not exist"},400)
    except Exception as e:
        print(e)
        return make_response({"error": "An error has occurred"},400)

@app.route("/getcourses", methods=["GET"])
def getCourses():
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute("SELECT * FROM Courses;")
        course_list = []
        for CourseID, Coursename in cursor:
            course = {}
            course['CourseID'] = CourseID
            course['Coursename'] = Coursename
            course_list.append(course)
        
        course_list.sort(key=lambda c: c['CourseID'])
        cursor.close()
        cnx.close()
        return make_response(course_list, 200)
    except Exception as e:
        return make_response({'error': str(e)}, 400)
    
@app.route("/getcourses/<sid>", methods = ['GET'])
def getRegisteredCourses(sid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * Students WHERE SID = {sid};")
        student = cursor.fetchone()
        if student:
          cursor.execute(f"SELECT Courses.CourseID, Courses.Coursename FROM Courses JOIN Assigned_to ON Assigned_to.CourseID = Courses.CourseID WHERE Assigned_to.SID = {sid};")
          course_list = []
          if cursor is not None:
              for CourseID, Coursename in cursor:
                course = {}
                course['CourseID'] = CourseID
                course['Coursename'] = Coursename
                course_list.append(course)
          
              course_list.sort(key=lambda c: c['CourseID'])
              cursor.close()
              cnx.close()
              return make_response(course_list, 200)
          else:
              return make_response({"error": "Student is not registered for any courses"},400)
        else:
            return make_response({"error": "Student does not exist"},400)
    except Exception as e:
        return make_response({'error': str(e)}, 400)

@app.route("/getcourses/<lid>", methods = ['GET'])
def getAssignedCourses(lid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * Lectures WHERE LID={lid};")
        lecturer = cursor.fetchone()
        if lecturer:
          cursor.execute(f"SELECT Courses.CourseID, Courses.Coursename FROM Courses JOIN Manages ON Manages.CourseID = Courses.CourseID WHERE Manages.LID = {lid};")
          course_list = []
          if cursor is not None:
              for CourseID, CourseName in cursor:
                course = {}
                course['CourseID'] = CourseID
                course['CourseName'] = CourseName
                course_list.append(course)
          
              course_list.sort(key=lambda c: c['CourseID'])
              cursor.close()
              cnx.close()
              return make_response(course_list, 200)
          else:
              return make_response({"error": "Lecturer is not assigned to any courses"},400)
        else:
            return make_response({"error": "Lecturer does not exist"},400)
    except Exception as e:
        return make_response({'error': str(e)}, 400)
  
@app.route("/getmembers/<CourseID>", methods=['GET'])
def getMembers(CourseID):
    try: 
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * Course WHERE lid={CourseID};")
        course = cursor.fetchone()
        if course:
            members_list=[]
            cursor.execute(f"SELECT Lectures.LID AS id, Lectures.name AS name FROM Lectures JOIN Manages ON Manages.LID = Lectures.LID WHERE Manages.CourseID = {CourseID};")
            if cursor is not None:
              for id, name in cursor:
                  member={}
                  member['id']= id
                  member['name'] = name
                  member['role']="Lecturer"
                  members_list.append(member)
            
            cursor.execute(f"SELECT Students.SID AS id, Students.name AS name FROM Students JOIN Assigned_to ON Assigned_to.SID = Students.SID WHERE Assigned_to.CourseID = {CourseID};")
            #test this one 
            if cursor is not None:
                for id, name in cursor:
                  member={}
                  member['id']= id
                  member['name'] = name
                  member['role']="Student"
                  members_list.append(member)
            
            members_list.sort(key=lambda c: c['role'])
            cursor.close()
            cnx.close()
            return make_response(members_list, 200)
        else:
            return make_response({"error": "Course does not exist"},400)
    except Exception as e:
        return make_response({'error': str(e)}, 400)
        

@app.route("/createCalendar/<lid>", methods=['POST'])
def createCalendar(lid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * FROM Lectures WHERE LID = {lid};")
        lecturer = cursor.fetchone()
        if lecturer:
            content = request.json
            CourseID= content['CourseID']
            calID = content['calID']
            Event_Name = content['Event_Name']
            StartDate = content['StartDate']
            EndDate = content['EndDate']
            description = content['description']
            cursor.execute(f"SELECT * FROM Course WHERE CourseID = '{CourseID}';")
            course = cursor.fetchone()
            if course:
                cursor.execute(f"INSERT INTO Calendar(CalID, CourseID, Event_Name, StartDate, EndDate, description) VALUES({calID},{CourseID} , '{Event_Name}', '{StartDate}', '{EndDate}', '{description}');")
                cnx.commit()
                cursor.close()
                cnx.close()
                return make_response({'success': "Event Created Successfully"},201)
            else:
                return make_response({'error': "Course does not exist"},400)
        else:
            return make_response({"error": "You are not authorized to create an event"},401)
    except Exception as e:
        print(e)
        return make_response({"error": "An error has occurred"},400)
    

@app.route("/getEvents/<CourseID>", methods=['GET'])
def getEvents(CourseID):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * FROM Course WHERE CourseID={CourseID};")
        course = cursor.fetchone()
        if course:
          cursor.execute(f"SELECT * FROM Calendar WHERE CourseID = {CourseID};")
          events = cursor.fetchall()
          event_list = []
          if events:
             for CourseID, calID, Event_Name, StartDate, EndDate, description in events:
                 event={}
                 event['CourseID'] = CourseID
                 event['calID'] = calID
                 event['Event_Name']= Event_Name
                 event["StartDate"]= StartDate
                 event["EndDate"]= EndDate
                 event["description"]= description
                 event_list.append(event)
          
          event_list.sort(key=lambda c: c['calID'])
          cursor.close()
          cnx.close()
          return make_response(event_list, 200)
        else:
            return make_response({"error": "Course does not exist"},400)
    except Exception as e:
        return make_response({'error': str(e)}, 400)
    

@app.route("/getEvents/<sid>", methods=['GET'])
def getStudentEvents(sid):
    try:
        cnx = mysql.connector.connect(user='project_user', password='password',
                                host='localhost',
                                auth_plugin='mysql_native_password',
                                database='projectdb')
        cursor = cnx.cursor()
        cursor.execute(f"SELECT * FROM Students WHERE SID = {sid};")
        student = cursor.fetchone()
        if student:
          cursor.execute(f"SELECT Calendar.CourseID AS CourseID, Calendar.calID AS CalID, Calendar.Event_Name AS Event_Name, Calendar.StartDate AS StartDate, Calendar.EndDate As EndDate, Calendar.description AS description FROM Calendar JOIN Assigned_to ON Assigned_to.CourseID = Calendar.CourseID WHERE Assigned_to.SID = {sid};")
          event_list = []
          events = cursor.fetchall()
          if events:
             for CourseID, calID, Event_Name, StartDate, EndDate, description in events:
                 event={}
                 event['CourseID'] = CourseID
                 event['calID'] = calID
                 event['Event_Name']= Event_Name
                 event["StartDate"]= StartDate
                 event["EndDate"]= EndDate
                 event["description"]= description
                 event_list.append(event)
          
          event_list.sort(key=lambda c: c['calID'])
          cursor.close()
          cnx.close()
          return make_response(event_list, 200)
        else:
            return make_response({"error": "Course does not exist"},400)
    except Exception as e:
        return make_response({'error': str(e)}, 400)
