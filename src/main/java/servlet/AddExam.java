package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.*;
import entityManager.EntityManager;
import util.Helper;
import util.UserRoles;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddExam extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {
                Exam exam = new Exam();
                exam.setName(request.getParameter("name"));
                exam.setYear(Integer.parseInt(request.getParameter("year")));
                Course course = (Course) EntityManager.getEntity(Course.class, "courseId", request.getParameter("courseId"));
                exam.setCourse(course);

                exam.setSchool(user.getSchool());
                EntityManager.add(exam);
            }else{
                out.write("NO##Unauthorized Access");
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

