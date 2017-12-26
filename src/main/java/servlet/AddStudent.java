package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Student;
import entity.User;
import entityManager.EntityManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.DeferredFileOutputStream;
import util.Helper;
import util.UserRoles;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class AddStudent extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                Student student = new Student();
                student.setFirstName(request.getParameter("firstName"));
                student.setLastName(request.getParameter("lastName"));
                student.setFullName(request.getParameter("fullName"));
                student.setBirthday(formatter.parse(request.getParameter("birthday")));
                student.setAddress(request.getParameter("address"));
                student.setPhone(request.getParameter("phone"));
                student.setFatherName(request.getParameter("fatherName"));
                student.setFatherMobile(request.getParameter("fatherMobile"));
                student.setMotherName(request.getParameter("motherName"));
                student.setMotherMobile(request.getParameter("motherMobile"));
                student.setGuardinaName(request.getParameter("guardinaName"));
                student.setGuardianMobile(request.getParameter("guardianMobile"));

                student.setImage(request.getParameter("image"));

                student.setSchool(user.getSchool());
                EntityManager.add(student);

                User user1 = new User();
                user1.setName(student.getFirstName()+" "+student.getLastName());
                user1.setRole(UserRoles.STUDENT);
                user1.setMemberId(student.getStudentId());
                user1.setUserName(UserRoles.STUDENT+student.getStudentId()+"");
                user1.setPassword("1");
                user1.setSchool(user.getSchool());
                EntityManager.add(user1);

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
