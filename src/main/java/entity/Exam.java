package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/17/2017.
 */

@javax.persistence.Entity
@Table(name = "exam", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "examId")})
public class Exam extends Entity {
    private int examId;
    private int year;
    private String name;
    private Course course;
    private Set<Assesment> assesment;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "examId", unique = true, nullable = false)
    public int getExamId() {
        return examId;
    }
    public void setExamId(int examId) {
        this.examId = examId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "courseId", nullable = false)
    public Course getCourse() {
        return course;
    }
    public void setCourse(Course course) {
        this.course = course;
    }

    @Column(name = "name", nullable = false, length = 40)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "exam")
    public Set<Assesment> getAssesment() {
        return assesment;
    }
    public void setAssesment(Set<Assesment> assesment) {
        this.assesment = assesment;
    }

    @Column(name = "year", nullable = true, length = 10)
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
}
