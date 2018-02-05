package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.*;
import entity.examination.Assesment;
import entity.examination.Exam;
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
import java.util.*;

public class AddMarks extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                String[] marksArr = request.getParameterValues("marksArr[]");
                String[] studArr = request.getParameterValues("studArr[]");
                String[] q1Arr = request.getParameterValues("q1Arr[]");
                String[] q2Arr = request.getParameterValues("q2Arr[]");
                String[] q3Arr = request.getParameterValues("q3Arr[]");
                String[] q4Arr = request.getParameterValues("q4Arr[]");
                String[] q5Arr = request.getParameterValues("q5Arr[]");
                String[] q6Arr = request.getParameterValues("q6Arr[]");
                String[] q7Arr = request.getParameterValues("q7Arr[]");
                String[] q8Arr = request.getParameterValues("q8Arr[]");
                String[] q9Arr = request.getParameterValues("q9Arr[]");
                String[] q10Arr = request.getParameterValues("q10Arr[]");

                String subjectId = request.getParameter("subjectId");
                String examId = request.getParameter("examId");
                String teacherId = request.getParameter("teacherId");
//                Date date = formatter.parse(request.getParameter("assDate"));

                Subject subject = (Subject) EntityManager.getEntity(Subject.class, "subjectId", subjectId);
                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
                Exam exam = (Exam) EntityManager.getEntity(Exam.class, "examId", examId);

                for (int i = 0; i < studArr.length; i++) {
                    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
                    Set<Assesment> assesments = student.getAssesments();
                    Assesment assesment = new Assesment(student, subject, teacher, Integer.parseInt(marksArr[i]), null,
                            Integer.parseInt(q1Arr[i]),
                            Integer.parseInt(q2Arr[i]),
                            Integer.parseInt(q3Arr[i]),
                            Integer.parseInt(q4Arr[i]),
                            Integer.parseInt(q5Arr[i]),
                            Integer.parseInt(q6Arr[i]),
                            Integer.parseInt(q7Arr[i]),
                            Integer.parseInt(q8Arr[i]),
                            Integer.parseInt(q9Arr[i]),
                            Integer.parseInt(q10Arr[i]),
                            user.getSchool()
                    );
                    assesment.setExam(exam);
                    EntityManager.add(assesment);

                    if (student.getAssesments().size() > 0) {
                        assesments.add(assesment);
                    } else {
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
            }else{
                out.write("NO##Unauthorized Access");
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
