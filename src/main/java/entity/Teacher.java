package entity;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/10/2017.
 */
@javax.persistence.Entity
@Table(name = "teacher", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "teacherId")})
public class Teacher extends Member {

    private int teacherId;
    private String nic;

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

}
