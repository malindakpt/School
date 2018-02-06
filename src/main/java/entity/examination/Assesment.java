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
    private String mark1Name;
    private String mark2Name;
    private String mark3Name;
    private String mark4Name;
    private String mark5Name;
    private String mark6Name;
    private String mark7Name;
    private String mark8Name;
    private String mark9Name;
    private String mark10Name;
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
                     int mark1, int mark2, int mark3, int mark4, int mark5, int mark6, int mark7, int mark8, int mark9, int mark10,
                     String mark1Name, String mark2Name, String mark3Name, String mark4Name, String mark5Name, String mark6Name, String mark7Name, String mark8Name, String mark9Name, String mark10Name,School school
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

        this.mark1Name = mark1Name;
        this.mark2Name = mark2Name;
        this.mark3Name = mark3Name;
        this.mark4Name = mark4Name;
        this.mark5Name = mark5Name;
        this.mark6Name = mark6Name;
        this.mark7Name = mark7Name;
        this.mark8Name = mark8Name;
        this.mark9Name = mark9Name;
        this.mark10Name = mark10Name;

        this.school = school;
    }

    public void updateAssesment(Student student, Subject subject, Teacher teacher, int marks, Date date,
                     int mark1, int mark2, int mark3, int mark4, int mark5, int mark6, int mark7, int mark8, int mark9, int mark10,
                     String mark1Name, String mark2Name, String mark3Name, String mark4Name, String mark5Name, String mark6Name, String mark7Name, String mark8Name, String mark9Name, String mark10Name,School school
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

        this.mark1Name = mark1Name;
        this.mark2Name = mark2Name;
        this.mark3Name = mark3Name;
        this.mark4Name = mark4Name;
        this.mark5Name = mark5Name;
        this.mark6Name = mark6Name;
        this.mark7Name = mark7Name;
        this.mark8Name = mark8Name;
        this.mark9Name = mark9Name;
        this.mark10Name = mark10Name;

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

    @Column(name = "mark1Name", nullable = true, length = 20)
    public String getMark1Name() {
        return mark1Name;
    }
    public void setMark1Name(String mark1Name) {
        this.mark1Name = mark1Name;
    }

    @Column(name = "mark2Name", nullable = true, length = 20)
    public String getMark2Name() {
        return mark2Name;
    }
    public void setMark2Name(String mark2Name) {
        this.mark2Name = mark2Name;
    }

    @Column(name = "mark3Name", nullable = true, length = 20)
    public String getMark3Name() {
        return mark3Name;
    }
    public void setMark3Name(String mark3Name) {
        this.mark3Name = mark3Name;
    }

    @Column(name = "mark4Name", nullable = true, length = 20)
    public String getMark4Name() {
        return mark4Name;
    }
    public void setMark4Name(String mark4Name) {
        this.mark4Name = mark4Name;
    }

    @Column(name = "mark5Name", nullable = true, length = 20)
    public String getMark5Name() {
        return mark5Name;
    }
    public void setMark5Name(String mark5Name) {
        this.mark5Name = mark5Name;
    }

    @Column(name = "mark6Name", nullable = true, length = 20)
    public String getMark6Name() {
        return mark6Name;
    }
    public void setMark6Name(String mark6Name) {
        this.mark6Name = mark6Name;
    }

    @Column(name = "mark7Name", nullable = true, length = 20)
    public String getMark7Name() {
        return mark7Name;
    }
    public void setMark7Name(String mark7Name) {
        this.mark7Name = mark7Name;
    }

    @Column(name = "mark8Name", nullable = true, length = 20)
    public String getMark8Name() {
        return mark8Name;
    }
    public void setMark8Name(String mark8Name) {
        this.mark8Name = mark8Name;
    }

    @Column(name = "mark9Name", nullable = true, length = 20)
    public String getMark9Name() {
        return mark9Name;
    }
    public void setMark9Name(String mark9Name) {
        this.mark9Name = mark9Name;
    }

    @Column(name = "mark10Name", nullable = true, length = 20)
    public String getMark10Name() {
        return mark10Name;
    }
    public void setMark10Name(String mark10Name) {
        this.mark10Name = mark10Name;
    }
}
