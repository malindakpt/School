package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/10/2017.
 */
@javax.persistence.Entity
@Table(name = "yearRegistration", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "yearRegistrationId")})
public class YearRegistration extends Entity {
    private int yearRegistrationId;
    private int year;
    private float fees;
    private Student student;
    private Course course;

    public YearRegistration(){}
    public YearRegistration(int year, Student student, Course course){
        this.year = year;
        this.student = student;
        this.course = course;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "studentId", nullable = true)
    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "courseId", nullable = true)
    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "yearRegistrationId", unique = true, nullable = false)
    public int getYearRegistrationId() {
        return yearRegistrationId;
    }

    public void setYearRegistrationId(int yearRegistrationId) {
        this.yearRegistrationId = yearRegistrationId;
    }

    @Column(name = "year", nullable = true, length = 20)
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    @Column(name = "fees", nullable = true, length = 20)
    public float getFees() {
        return fees;
    }

    public void setFees(float fees) {
        this.fees = fees;
    }
}
