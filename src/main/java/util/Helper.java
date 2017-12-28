package util;

import entity.*;
import entityManager.EntityManager;
import org.hibernate.Hibernate;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by MalindaK on 12/12/2017.
 */
public class Helper {
//    public static boolean contains(String prop,Set<ENt>)
//    public static

    public boolean createTimeTable(School school){
        List<Entity> classRoomList = EntityManager.getEntities(ClassRoom.class, school);
        Set<TimeTable> timeTableSet = new HashSet<TimeTable>();
        int totalPeriods = school.getPeriodsPerWeek();

        for(Entity entity:classRoomList){
            ClassRoom classRoom = (ClassRoom)entity;
            Course currentCourse = getCurrentCourse(classRoom);
            TimeTable timeTable = new TimeTable();

//            Add timetable to set
            timeTableSet.add(timeTable);

            int currentPrtiodCnt = 0;

            for(SubjectAsign subjectAsign: currentCourse.getSubjectAsigns()){

                Teacher teacher = getTeacherForSubjectPeriods(subjectAsign, timeTableSet, school);

                for(int i=0;i<subjectAsign.getNoOfPeriods();i++) {

                    if(++currentPrtiodCnt>totalPeriods){
                        return false;
                    }

                    Period peri = new Period(teacher, subjectAsign.getSubject(), classRoom);
                    timeTable.getPeriods().add(peri);
//                    teacher.getPeriods().add(peri);
                }
            }

        }

        return true;
    }

    private Course getCurrentCourse(ClassRoom classRoom){
        for(Course course: classRoom.getCourses()){
            if(classRoom.getGrade() == course.getGrade()){
                return course;
            }
        }
        return null;
    }
    private Teacher getTeacherForSubjectPeriods(SubjectAsign subjectAsign,Set<TimeTable> timeTableSet, School school){
        Subject subject = subjectAsign.getSubject();
        int periods = subjectAsign.getNoOfPeriods();

        List<Entity> teacherList = EntityManager.getEntities(Teacher.class, school);

        int bestFreeCnt = 0;
        Teacher bestTeacher = null;

        for(Entity entity: teacherList){
            Teacher teacher = (Teacher)entity;

            for(Subject subject1: teacher.getSubjects()){
//                If teacher teaches this subject
                if(subject1.getSubjectId() == subject.getSubjectId()){
                    int freeCnt = getFreePeriodsForTeacher(teacher, timeTableSet);//teacher.getAvailablePeriods() - //teacher.getPeriods().size();
                    if(freeCnt > bestFreeCnt && freeCnt>periods){
                        bestFreeCnt = freeCnt;
                        bestTeacher = teacher;
                    }
                }
            }
        }
        return bestTeacher;
    }

    private int getFreePeriodsForTeacher(Teacher teacher, Set<TimeTable> timeTableSet){
        int total = 0;
        for(TimeTable timeTable: timeTableSet){
            for(Period period : timeTable.getPeriods()){
                if(period.getTeacher().getTeacherId() == teacher.getTeacherId()){
                    total++;
                }
            }
        }
        return teacher.getAvailablePeriods()-total;
    }

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


}
