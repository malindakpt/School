package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/8/2017.
 */
@javax.persistence.Entity
@Table(name = "student", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "studentId")})
public class Student extends Member {
    private int studentId ;
    private String fatherName;
    private String fatherMobile;
    private String motherName;
    private String motherMobile;
    private String guardinaName;
    private String guardianMobile;
    private ClassRoom classRoom;
    private Set<YearRegistration> yearRegistrations;
    private Set<Assesment> assesments;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "studentId", unique = true, nullable = false)
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "student")
    public Set<Assesment> getAssesments() {
        return assesments;
    }

    public void setAssesments(Set<Assesment> assesments) {
        this.assesments = assesments;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "student")
    public Set<YearRegistration> getYearRegistrations() {
        return yearRegistrations;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "classRoomId", nullable = true)
    public ClassRoom getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }

    public void setYearRegistrations(Set<YearRegistration> yearRegistrations) {
        this.yearRegistrations = yearRegistrations;
    }

    @Column(name = "fatherName", nullable = true, length = 20)
    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }
    @Column(name = "fatherMobile", nullable = true, length = 20)
    public String getFatherMobile() {
        return fatherMobile;
    }

    public void setFatherMobile(String fatherMobile) {
        this.fatherMobile = fatherMobile;
    }
    @Column(name = "motherName", nullable = true, length = 20)
    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }
    @Column(name = "motherMobile", nullable = true, length = 20)
    public String getMotherMobile() {
        return motherMobile;
    }

    public void setMotherMobile(String motherMobile) {
        this.motherMobile = motherMobile;
    }
    @Column(name = "guardianName", nullable = true, length = 20)
    public String getGuardinaName() {
        return guardinaName;
    }

    public void setGuardinaName(String guardinaName) {
        this.guardinaName = guardinaName;
    }
    @Column(name = "guardianMobile", nullable = true, length = 20)
    public String getGuardianMobile() {
        return guardianMobile;
    }

    public void setGuardianMobile(String guardianMobile) {
        this.guardianMobile = guardianMobile;
    }
}
