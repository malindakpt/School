package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import businessLogic.DBLink;
import entity.Subject;
import entity.Teacher;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

public class AddSubjectTeacher extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {


            String id = request.getParameter("teacherId");
            Teacher teacher=(Teacher) EntityManager.getEntity(Teacher.class,"teacherId",id);
            String[] subList = request.getParameterValues("subList[]");
//            Set<Subject> subjects = new HashSet<Subject>();
            for(String ida : subList){
                Subject subject=(Subject) EntityManager.getEntity(Subject.class,"subjectId",ida);
                Set<Teacher> teachers = subject.getTeachers();
                teachers.add(teacher);
                EntityManager.update(subject);
            }
            String iddd = request.getParameter("teacher");
//            teacher.setFullName(request.getParameter("fullName"));
//            teacher.setBirthday(formatter.parse(request.getParameter("birthday")));
//            teacher.setAddress(request.getParameter("address"));
//            teacher.setPhone(request.getParameter("phone"));
//            teacher.setNic(request.getParameter("nic"));

//            EntityManager.add(teacher);

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
