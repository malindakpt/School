package entity.examination;

import entity.Course;
import entity.Entity;
import entity.School;
import entity.Subject;

import javax.persistence.*;

/**
 * Created by MalindaK on 1/27/2018.
 */
@javax.persistence.Entity
@Table(name = "lesson", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "lessonId")})
public class Lesson extends Entity {
    private int lessonId;
    private String name;
    private Subject subject;
    private Course course; // Grade
    private Assesment assesment;

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
    @Column(name = "lessonId", unique = true, nullable = false)
    public int getLessonId() {
        return lessonId;
    }
    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    @Column(name = "name", nullable = true, length = 30)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="subjectId")
    public Subject getSubject() {
        return subject;
    }
    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="courseId")
    public Course getCourse() {
        return course;
    }
    public void setCourse(Course course) {
        this.course = course;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="assesmentId")
    public Assesment getAssesment() {
        return assesment;
    }
    public void setAssesment(Assesment assesment) {
        this.assesment = assesment;
    }
}
