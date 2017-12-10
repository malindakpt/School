package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import businessLogic.DBLink;
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

public class AddTeacher extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Teacher teacher=new Teacher();
            teacher.setFirstName(request.getParameter("firstName"));
            teacher.setLastName(request.getParameter("lastName"));
            teacher.setFullName(request.getParameter("fullName"));
            teacher.setBirthday(formatter.parse(request.getParameter("birthday")));
            teacher.setAddress(request.getParameter("address"));
            teacher.setPhone(request.getParameter("phone"));
            teacher.setNic(request.getParameter("nic"));

            EntityManager.add(teacher);

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
