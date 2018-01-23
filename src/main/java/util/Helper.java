package util;

import entity.*;
import entityManager.EntityManager;
import org.hibernate.Hibernate;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by MalindaK on 12/12/2017.
 */
public class Helper {

    // 0-1-2-3#
    // dayId-periodId-userId-desc
    public HashMap<String,String> getAllocationMap(String str) throws Exception {

        HashMap<String,String> map = new HashMap<String, String>();
        if(str == null){
            return  map;
        }
        String[] strArr = str.split("#");

        for(int i = 0;i<strArr.length;i++){
            String[] strArr2 = strArr[i].split("%");
            for(int j=0; j< strArr2.length; j++){
                try{
                    map.put(strArr2[0] + "%" + strArr2[1], strArr2[2] + "%" + strArr2[3]);
                }catch (Exception e){
                    System.out.println("");
                }
            }
        }
        return  map;
    }
    // 0-1-2-3#
    // dayId-periodId-userId-desc
    public String getAllocationString(HashMap<String, String> map){
        String str = "";
        Set<String> keys = map.keySet();
        for(String key : keys){
            str= str+"#"+key+"%"+map.get(key);
        }
        return str;
    }

    public String getDateDifference( Date d1){
//        String dateStart = "01/14/2012 09:29:58";
//        String dateStop = "01/15/2012 10:31:48";
//
//        //HH converts hour in 24 hours format (0-23), day calculation
//        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
//
        Date d2 = Calendar.getInstance().getTime();
//        Date d2 = null;

        try {
//            d1 = format.parse(dateStart);
//            d2 = format.parse(dateStop);

            //in milliseconds
            long diff = d2.getTime() - d1.getTime();

            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);

            System.out.print(diffDays + " days, ");
            System.out.print(diffHours + " hours, ");
            System.out.print(diffMinutes + " minutes, ");
            System.out.print(diffSeconds + " seconds.");
            return diffDays + " days";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error while calculating days";
        }

    }

    public Set<TimeTable> createAllocationTable(School school) throws Exception {
        Set<TimeTable> timeTableSet = new HashSet<TimeTable>();
        List<Entity> classRoomList = EntityManager.getEntities(ClassRoom.class, school);
        if(classRoomList!= null) {

            int totalPeriods = school.getPeriodsPerWeek();

            for (Entity entity : classRoomList) {
                ClassRoom classRoom = (ClassRoom) entity;
                Course currentCourse = getCurrentCourse(classRoom);

                if(currentCourse == null){
                    throw new Exception("No course is assigned to: "+ classRoom.getGrade()+"-"+classRoom.getClassRoomName());
                }
                TimeTable timeTable = new TimeTable(classRoom);

//            Add timetable to set
                timeTableSet.add(timeTable);

                int currentPrtiodCnt = 0;

                for (SubjectAsign subjectAsign : currentCourse.getSubjectAsigns()) {

                    Teacher teacher = getTeacherForSubjectPeriods(subjectAsign, timeTableSet, school);
                    if(teacher == null){
                        throw new Exception("Enough Teachers are not available for: "+subjectAsign.getSubject().getName());
                    }else {
                        for (int i = 0; i < subjectAsign.getNoOfPeriods(); i++) {

                            if (++currentPrtiodCnt > totalPeriods) {
                                break;
                            }

                            Period peri = new Period(teacher, subjectAsign.getSubject(), classRoom);
                            timeTable.getPeriods().add(peri);
//                    teacher.getPeriods().add(peri);
                        }
                    }
                }

            }
        }
        return timeTableSet;
    }

    private Course getCurrentCourse(ClassRoom classRoom){
        for(Course course: classRoom.getCourses()){
            if(classRoom.getCurrentCourseId() == course.getCourseId()){
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

    public HashMap<Integer, HashMap<String,Period>> createTimeTable(Set<TimeTable> allocationTable){
        int periodsPerDay = 8;
        int daysPerWeek = 5;

        HashMap<Integer, HashMap<String,Period>> timeTableListMap = new HashMap<Integer, HashMap<String, Period>>();

        HashMap<String,Boolean> teacherAllocation=new HashMap<String,Boolean>();
        HashMap<String,Period> classAllocation=new HashMap<String,Period>();

        for(TimeTable allocationTable1 : allocationTable){

            boolean allocated=false;

            for(Period period : allocationTable1.getPeriods()){

                for(int s=0;s<periodsPerDay;s++){
                    for(int d=0;d<daysPerWeek;d++){
                        String key = d+"-"+s;

                        String teacherKey = period.getTeacher().getTeacherId()+"-"+ key;
                        String classKey = allocationTable1.getClassRoom().getClassRoomId()+"-"+ key;

                        Boolean teacherAllocated = teacherAllocation.get(teacherKey);
                        Period classAllocationPeriod = classAllocation.get(classKey);

                        if(teacherAllocated == null && classAllocationPeriod == null){
                            classAllocation.put(classKey,period);
                            teacherAllocation.put(teacherKey,true);

                            System.out.println(key+"   "+period.getClassRoom().getGrade()+period.getClassRoom().getClassRoomName()
                            +" "+period.getSubject().getName()+"   "+period.getTeacher().getFirstName());
                            allocated=true;
                            break;
                        }
                    }
                    if(allocated){
                        allocated=false;
                        break;
                    }
                }

            }
            timeTableListMap.put(allocationTable1.getClassRoom().getClassRoomId(), classAllocation);
        }
        return timeTableListMap;
    }

}
