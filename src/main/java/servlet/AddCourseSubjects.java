package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.*;
import entityManager.EntityManager;
import util.Helper;
import util.UserRoles;

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

            User user = new Helper().getUser(request);

            if(user!= null && user.getRole()>= UserRoles.TEACHER) {
                String courseId = request.getParameter("courseId");

                String name = request.getParameter("name");
                String[] subjectList = request.getParameterValues("subjectList[]");
                String[] subjectCountList = request.getParameterValues("subjectCountList[]");
                subjectList = subjectList == null ? new String[0] : subjectList;
                Set<SubjectAsign> subjectsAsignSet = new HashSet<SubjectAsign>();
                for (int i = 0; i<subjectList.length; i++) {
                    String sub1 = subjectList[i];
                    int count = Integer.parseInt(subjectCountList[i]);
                    Subject subject = (Subject) EntityManager.getEntity(Subject.class, "subjectId", sub1);
                    SubjectAsign subjectAsign = new SubjectAsign(subject, count, user.getSchool());
                    EntityManager.add(subjectAsign);
                    subjectsAsignSet.add(subjectAsign);
                }

                Course course;
                if (courseId != null) {
                    course = (Course) EntityManager.getEntity(Course.class, "courseId", courseId);
                    course.setSchool(user.getSchool());
                    course.setSubjectAsigns(subjectsAsignSet);
                    EntityManager.update(course);
                } else {
                    int grade = Integer.parseInt(request.getParameter("grade"));
                    course = new Course(name);
                    course.setSchool(user.getSchool());
                    course.setSubjectAsigns(subjectsAsignSet);
//                    course.setGrade(grade);
                    EntityManager.add(course);
                }

            }


        }catch (Exception e){
            e.printStackTrace();
            out.write("NO##Unauthorizes Access");
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
