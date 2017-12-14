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
    private String name;
    private Set<Subject> subjects;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "courseId", unique = true, nullable = false)
    public int getCourseId() {
        return courseId;
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

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "course")
    public Set<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
    }
}
