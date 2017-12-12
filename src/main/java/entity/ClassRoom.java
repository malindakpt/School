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
    private Teacher classTeacher;
    private Set<Student> students;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "classRoomId", unique = true, nullable = false)
    public int getClassRoomId() {
        return classRoomId;
    }

    public void setClassRoomId(int classRoomId) {
        this.classRoomId = classRoomId;
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
