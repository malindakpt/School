package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.*;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddMarks extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            String[] marksArr = request.getParameterValues("marksArr[]");
            String[] studArr = request.getParameterValues("studArr[]");
            String subjectId = request.getParameter("subjectId");
            String teacherId = request.getParameter("teacherId");
            Date date = formatter.parse(request.getParameter("date"));
            String type = request.getParameter("type");

            Subject subject = (Subject) EntityManager.getEntity(Subject.class, "subjectId", subjectId);
            Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);

            for(int i=0;i<studArr.length; i++){
                Student student= (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
                Assesment assesment = new Assesment(student.getStudentId(),student, subject, teacher, Integer.parseInt(marksArr[i]), date, Integer.parseInt(type));
                EntityManager.add(assesment);
                student.getAssesments().add(assesment);
                EntityManager.update(student);
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
