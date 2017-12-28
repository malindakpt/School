package entity;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/27/2017.
 */

@javax.persistence.Entity
@Table(name = "period", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "periodId")})
public class Period extends Entity{
    private int periodId;
    private Teacher teacher;
    private Subject subject;
    private ClassRoom classRoom;
    private TimeTable timeTable;

    public Period(){}
    public Period(Teacher teacher, Subject subject, ClassRoom classRoom){
        this.teacher = teacher;
        this.subject = subject;
        this.classRoom = classRoom;
    }

    // School Mapping start
    private School school;
    @ManyToOne(optional = false)
    @JoinColumn(name="schoolId")
    public School getSchool() {
        return school;
    }
    public void setSchool(School school) {
        this.school = school;
    }
    // School Mapping end


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "periodId", unique = true, nullable = false)
    public int getPeriodId() {
        return periodId;
    }
    public void setPeriodId(int periodId) {
        this.periodId = periodId;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="teacherId")
    public Teacher getTeacher() {
        return teacher;
    }
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="subjectId")
    public Subject getSubject() {
        return subject;
    }
    public void setSubject(Subject subject){
        this.subject = subject;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="classRoomId")
    public ClassRoom getClassRoom() {
        return classRoom;
    }
    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }

    @ManyToOne
    @JoinColumn(name="timeTableId", nullable=false)
    public TimeTable getTimeTable() {
        return timeTable;
    }
    public void setTimeTable(TimeTable timeTable) {
        this.timeTable = timeTable;
    }
}
