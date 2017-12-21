package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.ClassRoom;
import entity.Course;
import entityManager.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

public class RegisterStudents extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

//            int year = Integer.parseInt(request.getParameter("year"));
            String courseId = request.getParameter("courseId");
            String classId = request.getParameter("classId");

            ClassRoom classRoom = (ClassRoom) EntityManager.getEntity(ClassRoom.class,"classRoomId",classId);
            Course course = (Course) EntityManager.getEntity(Course.class,"courseId",courseId);

            if(classRoom.getCourses().size()>0){
                classRoom.getCourses().add(course);
            }else{
                Set<Course> courseSet = new HashSet<Course>();
                courseSet.add(course);
                classRoom.setCourses(courseSet);
            }
            classRoom.setGrade(Integer.parseInt(courseId));

            EntityManager.update(classRoom);

//            Course course = (Course) EntityManager.getEntity(Course.class,"courseId",request.getParameter("course"));
//            Set<YearRegistration> yearRegistrations;
//
//            for(int i=0;i<studArr.length; i++){
//                Student student= (Student) EntityManager.getEntity(Student.class, "studentId", studArr[i]);
//                if(student.getYearRegistrations().size()>0){
//                    yearRegistrations = student.getYearRegistrations();
//                }else{
//                    yearRegistrations = new HashSet<YearRegistration>();
//                }
//                YearRegistration yearRegistration = new YearRegistration(year, student, course);
//                EntityManager.add(yearRegistration);
//                yearRegistrations.add(yearRegistration);
//                student.setYearRegistrations(yearRegistrations);
//                EntityManager.update(student);
//            }

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
