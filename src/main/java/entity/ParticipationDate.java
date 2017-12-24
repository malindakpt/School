package entity;

import javax.persistence.*;
import java.util.Date;


/**
 * Created by MalindaK on 12/24/2017.
 */

@javax.persistence.Entity
@Table(name = "participationDate", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "participationDateId")})
public class ParticipationDate extends Entity {
    private int participationDateId;
    private Date date;
    private boolean isParticipated;
    private Student student;

    public ParticipationDate(Date date, boolean isParticipated, School school, Student student){
        this.date = date;
        this.isParticipated = isParticipated;
        this.school = school;
        this.student = student;
    }
    public ParticipationDate(){
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
    @Column(name = "participationDateId", unique = true, nullable = false)
    public int getParticipationDateId() {
        return participationDateId;
    }
    public void setParticipationDateId(int participationDateId) {
        this.participationDateId = participationDateId;
    }

    @Column(name = "date", nullable = true, length = 100)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "isParticipated", nullable = true, length = 10)
    public boolean isParticipated() {
        return isParticipated;
    }
    public void setParticipated(boolean participated) {
        isParticipated = participated;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="studentId")
    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }
}
