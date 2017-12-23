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

public class AddClassStudent extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {

        try {
            User user = new Helper().getUser(request);

            if(user!=null && user.getRole()>= UserRoles.TEACHER) {
                String classRoomId = request.getParameter("classRoom");
                ClassRoom classRoom = (ClassRoom) EntityManager.getEntity(ClassRoom.class, "classRoomId", classRoomId);
                String[] studArr = request.getParameterValues("studArr[]");
                for (int i = 0; i < studArr.length; i++) {
                    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
                    student.setClassRoom(classRoom);
                    EntityManager.update(student);
                }
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
