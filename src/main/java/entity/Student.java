package entity;

import javax.persistence.*;
import java.rmi.MarshalException;

/**
 * Created by MalindaK on 12/8/2017.
 */
@javax.persistence.Entity
@Table(name = "student", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "id")})
public class Student extends Member {
    private String fatherName;
    private String fatherMobile;
    private String motherName;
    private String motherMobile;
    private String guardinaName;
    private String guardianMobile;

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
