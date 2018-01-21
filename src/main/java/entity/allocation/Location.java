package entity.allocation;

import entity.*;

import javax.persistence.*;
import javax.persistence.Entity;

/**
 * Created by MalindaK on 1/21/2018.
 */

@javax.persistence.Entity
@Table(name = "Location", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "locationId")})
public class Location  extends entity.Entity {
    private int locationId;
    private String name;
    private String description;
    private Teacher owner;
    private String allocationMap;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "locationId", unique = true, nullable = false)
    public int getLocationId() {
        return locationId;
    }
    public void setLocationId(int locationId) {
        this.locationId = locationId;
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


    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "description", nullable = true, length = 50)
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "teacherId", nullable = false)
    public Teacher getOwner() {
        return owner;
    }
    public void setOwner(Teacher owner) {
        this.owner = owner;
    }

    @Column(name = "allocationMap", nullable = true, length = 9999)
    public String getAllocationMap() {
        return allocationMap;
    }
    public void setAllocationMap(String allocationMap) {
        this.allocationMap = allocationMap;
    }
}
