package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/10/2017.
 */

@javax.persistence.Entity
@Table(name = "subject", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "subjectId")})
public class Subject extends Entity {

    private int subjectId;
    private String name;
    private String code;
    private Set<Teacher> teachers;
    private Set<Assesment> assesments;

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
    @Column(name = "subjectId", unique = true, nullable = false)
    public int getSubjectId() {
        return subjectId;
    }
    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "subject_teacher", joinColumns = { @JoinColumn(name = "subjectId") }, inverseJoinColumns = { @JoinColumn(name = "teacherId") })
    public Set<Teacher> getTeachers() {
        return teachers;
    }
    public void setTeachers(Set<Teacher> teachers) {
        this.teachers = teachers;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "subject")
    public Set<Assesment> getAssesments() {
        return assesments;
    }
    public void setAssesments(Set<Assesment> assesments) {
        this.assesments = assesments;
    }

    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "code", nullable = true, length = 20)
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
}
