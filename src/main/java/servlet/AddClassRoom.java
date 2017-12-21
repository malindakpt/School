package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.ClassRoom;
import entity.Student;
import entity.Teacher;
import entity.User;
import entityManager.EntityManager;
import util.Helper;
import util.UserRoles;

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

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole()>= UserRoles.TEACHER) {
                ClassRoom classRoom = new ClassRoom();
                classRoom.setGrade(Integer.parseInt(request.getParameter("grade")));
                classRoom.setBatch(Integer.parseInt(request.getParameter("batch")));
                classRoom.setClassRoomName(request.getParameter("classRoomName"));

                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", request.getParameter("classTeacher"));
                classRoom.setClassTeacher(teacher);


                classRoom.setSchool(user.getSchool());
                EntityManager.add(classRoom);
            }else{
                out.write("NO##Unautherized Access");
            }

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
