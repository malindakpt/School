package entity.allocation;

import entity.School;
import entity.Teacher;

import javax.persistence.*;

/**
 * Created by MalindaK on 1/21/2018.
 */
@javax.persistence.Entity
@Table(name = "InventoryItem", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "inventoryId")})
public class InventoryItem  extends entity.Entity {

    private int inventoryId;
    private String name;
    private String description;
    private Teacher owner;
    private Location location;
    private int category;
    private String allocationMap;

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
    @Column(name = "inventoryId", unique = true, nullable = false)
    public int getInventoryId() {
        return inventoryId;
    }
    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }

    @Column(name = "name", nullable = true, length = 100)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "teacherId", nullable = false)
    public Teacher getOwner() {
        return owner;
    }
    public void setOwner(Teacher owner) {
        this.owner = owner;
    }

    @Column(name = "category", nullable = true, length = 20)
    public int getCategory() {
        return category;
    }
    public void setCategory(int category) {
        this.category = category;
    }

    @Column(name = "allocationMap", nullable = true, length = 99999)
    public String getAllocationMap() {
        return allocationMap;
    }
    public void setAllocationMap(String allocationMap) {
        this.allocationMap = allocationMap;
    }

    @Column(name = "description", nullable = true, length = 200)
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "locationId", nullable = false)
    public Location getLocation() {
        return location;
    }
    public void setLocation(Location location) {
        this.location = location;
    }
}
