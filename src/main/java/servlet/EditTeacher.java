package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

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

public class EditTeacher extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);
            String teacherId = request.getParameter("teacherId");

            if(user != null && user.getRole() >= UserRoles.TEACHER) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
                teacher.setFirstName(request.getParameter("firstName"));
                teacher.setLastName(request.getParameter("lastName"));
                teacher.setFullName(request.getParameter("fullName"));
                teacher.setBirthday(formatter.parse(request.getParameter("birthday")));
                teacher.setAddress(request.getParameter("address"));
                teacher.setPhone(request.getParameter("phone"));
                teacher.setNic(request.getParameter("nic"));
                teacher.setImage(request.getParameter("image"));
                teacher.setAvailablePeriods(Integer.parseInt(request.getParameter("availablePeriods")));

                //Mandatory
//                teacher.setSchool(user.getSchool());
                EntityManager.update(teacher);
            }else{
                out.write("NO##"+"Unauthorized Access");
            }

        }catch (Exception e){
            out.write("NO##"+e.getMessage());
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
