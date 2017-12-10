package entity;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/10/2017.
 */

@javax.persistence.Entity
@Table(name = "studSubject", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "studSubjectId")})
public class StudSubject {

    private int studSubjectId;
    private int studentId;
    private Subject subject;
    private Teacher teacher;
    private int year;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "studSubjectId", unique = true, nullable = false)
    public int getStudSubjectId() {
        return studSubjectId;
    }

    public void setStudSubjectId(int studSubjectId) {
        this.studSubjectId = studSubjectId;
    }

    @Column(name = "subject", nullable = true, length = 20)
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @OneToOne
    @JoinColumn(name="studentId")
    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @OneToOne
    @JoinColumn(name="studentId")
    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Column(name = "year", nullable = true, length = 20)
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
}
