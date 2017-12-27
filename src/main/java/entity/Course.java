package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/15/2017.
 */
@javax.persistence.Entity
@Table(name = "course", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "courseId")})
public class Course extends Entity {
    private int courseId;
    private int grade;
    private String name;
    private Set<SubjectAsign> subjectAsigns;
    private Set<ClassRoom> classRooms;


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


    public Course(){}
    public Course(String name){
        this.name = name;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "courseId", unique = true, nullable = false)
    public int getCourseId() {
        return courseId;
    }

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "courses")
    public Set<ClassRoom> getClassRooms() {
        return classRooms;
    }
    public void setClassRooms(Set<ClassRoom> classRooms) {
        this.classRooms = classRooms;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }
    @Column(name = "name", nullable = true, length = 30)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//    @JoinTable(name = "course_subject", joinColumns = { @JoinColumn(name = "courseId") }, inverseJoinColumns = { @JoinColumn(name = "subjectId") })
//    public Set<Subject> getSubjects() {
//        return subjects;
//    }
//    public void setSubjects(Set<Subject> subjects) {
//        this.subjects = subjects;
//    }

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "course_subjectAsign", joinColumns = { @JoinColumn(name = "courseId") }, inverseJoinColumns = { @JoinColumn(name = "subjectAsignId") })
    public Set<SubjectAsign> getSubjectAsigns() {
        return subjectAsigns;
    }
    public void setSubjectAsigns(Set<SubjectAsign> subjectAsigns) {
        this.subjectAsigns = subjectAsigns;
    }

    @Column(name = "grade", nullable = true, length = 30)
    public int getGrade() {
        return grade;
    }
    public void setGrade(int grade) {
        this.grade = grade;
    }
}
