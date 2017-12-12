package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import businessLogic.DBLink;
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
import java.text.SimpleDateFormat;

public class AddClassRoom extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            ClassRoom classRoom=new ClassRoom();
            classRoom.setGrade(Integer.parseInt(request.getParameter("grade")));
            classRoom.setBatch(Integer.parseInt(request.getParameter("batch")));
            classRoom.setClassRoomName(request.getParameter("classRoomName"));

            Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", request.getParameter("classTeacher"));
            classRoom.setClassTeacher(teacher);

            EntityManager.add(classRoom);

        }catch (Exception e){
            e.printStackTrace();
            out.print("Unexpected error :"+DBLink.errorMsg);
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
