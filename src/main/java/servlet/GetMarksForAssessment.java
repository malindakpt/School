package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.Assesment;
import entity.Student;
import entity.Subject;
import entity.Teacher;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

public class GetMarksForAssessment extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String studentId = request.getParameter("studentId");
            String subjectId = request.getParameter("subjectId");
            String regId = request.getParameter("regId");

            Student student = (Student) EntityManager.getEntity(Student.class,"studentId", studentId);
            String marks="";
            for(Assesment assesment :student.getAssesments()){
                if(assesment.getSubject().getSubjectId()==Integer.parseInt(subjectId)){
                    marks = marks +","+assesment.getMarks();
                }
            }
            out.print("23,44,55,33,22,66,55");

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
