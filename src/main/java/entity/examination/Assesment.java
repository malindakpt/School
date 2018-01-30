package entity.examination;

import entity.*;
import entity.examination.Exam;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.Date;
import java.util.Set;

/**
 * Created by MalindaK on 12/12/2017.
 */
@javax.persistence.Entity
@Table(name = "assesment", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "assesmentId")})
public class Assesment extends entity.Entity {
//    Students may have many assesments, But some of them are only for exams. so stuudent have assesments and Some assesments only have exam
    private int assesmentId;
    private int marks;
    private Subject subject;
    private Teacher teacher;
    private Date date;
    private int type;
    private Student student;
    private Exam exam;
    private Set<Lesson> lessons;

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

    public Assesment(){}
    public Assesment(Student student, Subject subject, Teacher teacher, int marks, Date date){
        this.student = student;
        this.subject = subject;
        this.teacher = teacher;
        this.marks = marks;
        this.date = date;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "assesmentId", unique = true, nullable = false)
    public int getAssesmentId() {
        return assesmentId;
    }
    public void setAssesmentId(int assesmentId) {
        this.assesmentId = assesmentId;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "assesment")
    public Set<Lesson> getLessons() {
        return lessons;
    }
    public void setLessons(Set<Lesson> lessons) {
        this.lessons = lessons;
    }

    @ManyToOne(optional = false)
    @JoinColumn(name="studentId")
    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }

    @Column(name = "marks", nullable = true, length = 20)
    public int getMarks() {
        return marks;
    }
    public void setMarks(int marks) {
        this.marks = marks;
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
    @JoinColumn(name="teacherId")
    public Teacher getTeacher() {
        return teacher;
    }
    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    @Column(name = "date", nullable = true, length = 20)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "type", nullable = true, length = 20)
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "examId", nullable = true)
    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }
}
