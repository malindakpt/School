package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/10/2017.
 */
@javax.persistence.Entity
@Table(name = "teacher", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "teacherId")})
public class Teacher extends Member {

    private int teacherId;
    private String nic;
    private int availablePeriods;
    private Set<ClassRoom> classRooms;
    private Set<Subject> subjects;
//    private Set<Period> periods;

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
    @Column(name = "teacherId", unique = true, nullable = false)
    public int getTeacherId() {
        return teacherId;
    }
    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Column(name = "nic", nullable = true, length = 20)
    public String getNic() {
        return nic;
    }
    public void setNic(String nic) {
        this.nic = nic;
    }

    @OneToMany(mappedBy="classTeacher")
    public Set<ClassRoom> getClassRooms() {
        return classRooms;
    }
    public void setClassRooms(Set<ClassRoom> classRooms) {
        this.classRooms = classRooms;
    }

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "teacher")
    public Set<Subject> getSubjects() {
        return subjects;
    }
    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
    }

//    @OneToMany(mappedBy="classTeacher")
//    public Set<Period> getPeriods() {
//        return periods;
//    }
//    public void setPeriods(Set<Period> periods) {
//        this.periods = periods;
//    }

    @Column(name = "availablePeriods", nullable = true, length = 20)
    public int getAvailablePeriods() {
        return availablePeriods;
    }
    public void setAvailablePeriods(int availablePeriods) {
        this.availablePeriods = availablePeriods;
    }
}
