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

    public static boolean contains(Set<Teacher> teachers, Teacher teacher){
        for(Teacher teach : teachers){
            if(teacher.getTeacherId() == teach.getTeacherId()){
                return true;
            }
        }
        return false;
    }


}
