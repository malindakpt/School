package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.ClassRoom;
import entity.Student;
import entity.Teacher;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddClassStudent extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String[] classArr = request.getParameterValues("classArr[]");
            String[] studArr = request.getParameterValues("studArr[]");
            for(int i=0;i<studArr.length; i++){
                Student student= (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
                student.setClassRoom(new ClassRoom(Integer.parseInt(classArr[i])));
                EntityManager.update(student);
            }
//            ClassRoom classRoom=new ClassRoom();
//            classRoom.setGrade(Integer.parseInt(request.getParameter("grade")));
//            classRoom.setBatch(Integer.parseInt(request.getParameter("batch")));
//            classRoom.setClassRoomName(request.getParameter("classRoomName"));
//
//            Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", request.getParameter("classTeacher"));
//            classRoom.setClassTeacher(teacher);
//
//            EntityManager.add(classRoom);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
