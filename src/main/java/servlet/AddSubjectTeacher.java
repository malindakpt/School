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
            String id = request.getParameter("subjectId");
            Subject subject=(Subject) EntityManager.getEntity(Subject.class,"subjectId",id);
            String[] teacherList = request.getParameterValues("teacherList[]");
            Set<Teacher> teachers = new HashSet<Teacher>();
            for(String ida : teacherList){
                Teacher teacher=(Teacher) EntityManager.getEntity(Teacher.class,"teacherId",ida);
                teachers.add(teacher);
            }
            subject.setTeachers(teachers);
            EntityManager.update(subject);

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
