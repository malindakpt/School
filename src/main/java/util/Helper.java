package util;

import entity.*;
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
        for(SubjectAsign subjectAsign:course.getSubjectAsigns()){
            if(subjectAsign.getSubject().getSubjectId()==subject.getSubjectId()){
                return true;
            }
        }
        return false;
    }

    public int getNoOfPeriodsForClurseSubject(Course course, Subject subject){
        for(SubjectAsign subjectAsign:course.getSubjectAsigns()){
            if(subjectAsign.getSubject().getSubjectId()==subject.getSubjectId()){
                return subjectAsign.getNoOfPeriods();
            }
        }
        return 0;
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
