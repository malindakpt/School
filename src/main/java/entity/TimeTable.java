package entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by MalindaK on 12/27/2017.
 */

@javax.persistence.Entity
@Table(name = "timeTable", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "timeTableId")})
public class TimeTable extends Entity{
    private int timeTableId;
    private Set<Period> periods;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "timeTableId", unique = true, nullable = false)
    public int getTimeTableId() {
        return timeTableId;
    }
    public void setTimeTableId(int timeTableId) {
        this.timeTableId = timeTableId;
    }

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




    @OneToMany(fetch = FetchType.EAGER, mappedBy = "timeTable")
    public Set<Period> getPeriods() {
        return periods;
    }
    public void setPeriods(Set<Period> periods) {
        this.periods = periods;
    }
}

