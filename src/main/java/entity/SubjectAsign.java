package entity;

import org.hibernate.engine.Cascade;
import sun.util.resources.cldr.sah.CalendarData_sah_RU;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/27/2017.
 */

@javax.persistence.Entity
@Table(name = "subjectAsign", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "subjectAsignId")})
public class SubjectAsign extends Entity {
    private int subjectAsignId;
    private Subject subject;
    private int noOfPeriods;

    public SubjectAsign(Subject subject, int noOfPeriods, School school){
        this.subject = subject;
        this.noOfPeriods = noOfPeriods;
        this.school = school;
    }
    public SubjectAsign(){}

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
    @Column(name = "subjectAsignId", unique = true, nullable = false)
    public int getSubjectAsignId() {
        return subjectAsignId;
    }
    public void setSubjectAsignId(int subjectAsignId) {
        this.subjectAsignId = subjectAsignId;
    }

    @OneToOne(cascade = CascadeType.ALL)
    public Subject getSubject() {
        return subject;
    }
    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @Column(name = "noOfPeriods", nullable = true, length = 20)
    public int getNoOfPeriods() {
        return noOfPeriods;
    }
    public void setNoOfPeriods(int noOfPeriods) {
        this.noOfPeriods = noOfPeriods;
    }
}
