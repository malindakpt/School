package util;

import entity.ClassRoom;
import entity.Course;
import entity.Subject;
import entity.User;
import entityManager.EntityManager;
import org.hibernate.Hibernate;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

/**
 * Created by MalindaK on 12/12/2017.
 */
public class Helper {
//    public static boolean contains(String prop,Set<ENt>)
//    public static


    public boolean isCourseHaveSubject(Course course, Subject subject){
//        Hibernate.initialize(course);
        for(Subject subject1:course.getSubjects()){
            if(subject1.getSubjectId()==subject.getSubjectId()){
                return true;
            }
        }
        return false;
    }

    public User getUser(HttpServletRequest request ){
        String session = request.getParameter("t56");
        User user = (User) EntityManager.getEntity1(User.class,"sessionId",session);
        return user;
    }


    public Course getCurrentCourse(ClassRoom classRoom){
        for(Course course: classRoom.getCourses()){
            if(course.getCourseId() == classRoom.getGrade()){
                return course;
            }
        }
        return null;
    }

}
