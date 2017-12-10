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
    private Set<Subject> subjects;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "studentId", nullable = true)
    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "yearRegistration_subject", joinColumns = { @JoinColumn(name = "yearRegistrationId") }, inverseJoinColumns = { @JoinColumn(name = "subjectId") })
    public Set<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
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
