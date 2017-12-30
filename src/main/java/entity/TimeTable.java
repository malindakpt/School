package entity;

import javax.persistence.*;
import java.util.HashSet;
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
    private ClassRoom classRoom;

    public TimeTable(){
        this.periods = new HashSet<Period>();
    }
    public TimeTable(ClassRoom classRoom){
        this.classRoom = classRoom;
        this.periods = new HashSet<Period>();
    }

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

    @OneToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    public ClassRoom getClassRoom() {
        return classRoom;
    }
    public void setClassRoom(ClassRoom classRoom) {
        this.classRoom = classRoom;
    }
}

