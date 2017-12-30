package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.ClassRoom;
import entity.Course;
import entity.Teacher;
import entity.User;
import entityManager.EntityManager;
import org.hibernate.Hibernate;
import org.hibernate.Session;
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

public class ChangeClassRoom extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {

            User user = new Helper().getUser(request);

            if(user != null && user.getRole()>= UserRoles.TEACHER) {
                String courseId = request.getParameter("courseId");
                String classId = request.getParameter("classId");
                String teacherId = request.getParameter("teacherId");

                Session session = EntityManager.createSession();
                ClassRoom classRoom = (ClassRoom) EntityManager.getEntity(session, ClassRoom.class, "classRoomId", classId);
                Teacher teacher = (Teacher) EntityManager.getEntity(session, Teacher.class, "teacherId", teacherId);
                Course course = (Course) EntityManager.getEntity(session, Course.class, "courseId", courseId);
                session.close();

                if (classRoom.getCourses().size() > 0) {
                    classRoom.getCourses().add(course);
                } else {
                    Set<Course> courseSet = new HashSet<Course>();
                    courseSet.add(course);
                    classRoom.setCourses(courseSet);
                }
//                classRoom.setGrade(course.getGrade());
                classRoom.setCurrentCourseId(course.getCourseId());
                classRoom.setClassTeacher(teacher);

            EntityManager.update(classRoom);

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
