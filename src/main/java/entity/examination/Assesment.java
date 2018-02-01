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
    private int mark1;
    private int mark2;
    private int mark3;
    private int mark4;
    private int mark5;
    private int mark6;
    private int mark7;
    private int mark8;
    private int mark9;
    private int mark10;

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
    public Assesment(Student student, Subject subject, Teacher teacher, int marks, Date date,
                     int mark1, int mark2, int mark3, int mark4, int mark5, int mark6, int mark7, int mark8, int mark9, int mark10, School school
    ){
        this.student = student;
        this.subject = subject;
        this.teacher = teacher;
        this.marks = marks;
        this.date = date;

        this.mark1 = mark1;
        this.mark2 = mark2;
        this.mark3 = mark3;
        this.mark4 = mark4;
        this.mark5 = mark5;
        this.mark6 = mark6;
        this.mark7 = mark7;
        this.mark8 = mark8;
        this.mark9 = mark9;
        this.mark10 = mark10;

        this.school = school;
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

    @Column(name = "mark1", nullable = true, length = 20)
    public int getMark1() {
        return mark1;
    }
    public void setMark1(int mark1) {
        this.mark1 = mark1;
    }

    @Column(name = "mark2", nullable = true, length = 20)
    public int getMark2() {
        return mark2;
    }
    public void setMark2(int mark2) {
        this.mark2 = mark2;
    }

    @Column(name = "mark3", nullable = true, length = 20)
    public int getMark3() {
        return mark3;
    }
    public void setMark3(int mark3) {
        this.mark3 = mark3;
    }

    @Column(name = "mark4", nullable = true, length = 20)
    public int getMark4() {
        return mark4;
    }
    public void setMark4(int mark4) {
        this.mark4 = mark4;
    }

    @Column(name = "mark5", nullable = true, length = 20)
    public int getMark5() {
        return mark5;
    }
    public void setMark5(int mark5) {
        this.mark5 = mark5;
    }

    @Column(name = "mark6", nullable = true, length = 20)
    public int getMark6() {
        return mark6;
    }
    public void setMark6(int mark6) {
        this.mark6 = mark6;
    }

    @Column(name = "mark7", nullable = true, length = 20)
    public int getMark7() {
        return mark7;
    }
    public void setMark7(int mark7) {
        this.mark7 = mark7;
    }

    @Column(name = "mark8", nullable = true, length = 20)
    public int getMark8() {
        return mark8;
    }
    public void setMark8(int mark8) {
        this.mark8 = mark8;
    }

    @Column(name = "mark9", nullable = true, length = 20)
    public int getMark9() {
        return mark9;
    }
    public void setMark9(int mark9) {
        this.mark9 = mark9;
    }

    @Column(name = "mark10", nullable = true, length = 20)
    public int getMark10() {
        return mark10;
    }
    public void setMark10(int mark10) {
        this.mark10 = mark10;
    }
}
