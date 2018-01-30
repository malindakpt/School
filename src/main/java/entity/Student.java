package entity;

import entity.examination.Assesment;

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
    private Set<ParticipationDate> absentDates;
    private Set<Assesment> assesments;
    private Set<Payment> payments;
    private String lastPayment;

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
    public Set<ParticipationDate> getAbsentDates() {
        return absentDates;
    }
    public void setAbsentDates(Set<ParticipationDate> absentDates) {
        this.absentDates = absentDates;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "student")
    public Set<Payment> getPayments() {
        return payments;
    }
    public void setPayments(Set<Payment> payments) {
        this.payments = payments;
    }

    @Column(name = "lastPayment", nullable = true, length = 20)
    public String getLastPayment() {
        return lastPayment;
    }
    public void setLastPayment(String lastPayment) {
        this.lastPayment = lastPayment;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "classRoomId", nullable = true)
    public ClassRoom getClassRoom() {
        return classRoom;
    }
    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
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
