package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/10/2017.
 */
@javax.persistence.Entity
@Table(name = "classRoom", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "classRoomId")})
public class ClassRoom extends Entity {
    private int classRoomId;
    private int batch;
    private String classRoomName;
    private int grade;
    private boolean isAdmissionClosed; // No need
    private Teacher classTeacher;
    private Set<Course> courses;


    //For Mapping
    private Set<Student> students;

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

    public ClassRoom(int id){
        this.classRoomId = id;
    }
    public ClassRoom(){
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "classRoomId", unique = true, nullable = false)
    public int getClassRoomId() {
        return classRoomId;
    }

    public void setClassRoomId(int classRoomId) {
        this.classRoomId = classRoomId;
    }

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "classRoom_course", joinColumns = { @JoinColumn(name = "classRoomId") }, inverseJoinColumns = { @JoinColumn(name = "courseId") })
    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    @Column(name = "isAdmissionClosed", nullable = true, columnDefinition = "bigint(20) default false" )
    public boolean isAdmissionClosed() {
        return isAdmissionClosed;
    }

    public void setAdmissionClosed(boolean admissionClosed) {
        isAdmissionClosed = admissionClosed;
    }

    @Column(name = "batch", nullable = true, length = 20)
    public int getBatch() {
        return batch;
    }

    public void setBatch(int batch) {
        this.batch = batch;
    }

    @Column(name = "classRoomName", nullable = true, length = 20)
    public String getClassRoomName() {
        return classRoomName;
    }

    public void setClassRoomName(String classRoomName) {
        this.classRoomName = classRoomName;
    }
    @Column(name = "grade", nullable = true, length = 20)
    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "teacherId", nullable = true)
    public Teacher getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Teacher classTeacher) {
        this.classTeacher = classTeacher;
    }

    @OneToMany(mappedBy="classRoom")
    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }
}
