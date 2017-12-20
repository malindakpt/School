package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Course;
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

public class AddCourseSubjects extends HttpServlet {

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            String courseId = request.getParameter("courseId");
            String name = request.getParameter("name");
            String[] subjectList = request.getParameterValues("subjectList[]");
            subjectList = subjectList == null ? new String[0] : subjectList;
            Set<Subject> subjects = new HashSet<Subject>();
            for(String sub1 : subjectList){
                Subject subject=(Subject) EntityManager.getEntity(Subject.class,"subjectId",sub1);
                subjects.add(subject);
            }

            Course course;
            if(courseId != null){
                course = (Course) EntityManager.getEntity(Course.class,"courseId",courseId);
                course.setSubjects(subjects);
                EntityManager.update(course);
            }else {
                course = new Course(name);
                course.setSubjects(subjects);
                EntityManager.add(course);
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
