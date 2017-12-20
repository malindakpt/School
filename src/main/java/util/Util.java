package util;

import entity.Course;
import entity.Subject;

/**
 * Created by MalindaK on 12/12/2017.
 */
public class Util {
//    public static boolean contains(String prop,Set<ENt>)
//    public static


    public static boolean isCourseHaveSubject(Course course, Subject subject){
        for(Subject subject1:course.getSubjects()){
            if(subject1.getSubjectId()==subject.getSubjectId()){
                return true;
            }
        }
        return false;
    }
}
