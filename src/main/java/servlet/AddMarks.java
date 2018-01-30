package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.*;
import entity.examination.Assesment;
import entity.examination.Exam;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

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
            String examId = request.getParameter("examId");
            String teacherId = request.getParameter("teacherId");
            Date date = formatter.parse(request.getParameter("assDate"));

            Subject subject= (Subject) EntityManager.getEntity(Subject.class, "subjectId", subjectId);
            Teacher teacher= (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
            Exam exam= (Exam) EntityManager.getEntity(Exam.class, "examId", examId);

            for(int i=0;i<studArr.length; i++){
                Student student= (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
                Set<Assesment> assesments = student.getAssesments();
                Assesment assesment = new Assesment(student, subject, teacher, Integer.parseInt(marksArr[i]), date);
                assesment.setExam(exam);
                EntityManager.add(assesment);

               if(student.getAssesments().size()>0){
                   assesments.add(assesment);
               }else{
                   Set<Assesment> assesmentSet = new HashSet<Assesment>();
                   assesmentSet.add(assesment);
                   student.setAssesments(assesmentSet);
               }
               EntityManager.update(student);



//
//                Assesment assesment = new Assesment(student.getStudentId(),student, subject, teacher, Integer.parseInt(marksArr[i]), date, Integer.parseInt(type));
//                EntityManager.add(assesment);
//                student.getAssesments().add(assesment);
//                EntityManager.update(student);
            }

//
//            String teacherId = request.getParameter("teacherId");
//
//            String type = request.getParameter("type");
//
//            Subject subject = (Subject) EntityManager.getEntity(Subject.class, "subjectId", subjectId);
//            Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);



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
