package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import businessLogic.*;
import entity.Student;
import entityManager.EntityManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.DeferredFileOutputStream;

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

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Student student=new Student();
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
            EntityManager.add(student);

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