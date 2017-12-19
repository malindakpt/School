package entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by MalindaK on 12/12/2017.
 */
@javax.persistence.Entity
@Table(name = "assesment", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "assesmentId")})
public class Assesment extends Entity{
//    Students may have many assesments, But some of them are only for exams. so stoudent have assesments and Some assesments only have exam
    private int assesmentId;
    private int marks;
    private Subject subject;
    private Teacher teacher;
    private Date date;
    private int type;
    private Student student;
    private Exam exam;

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
