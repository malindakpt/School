package entity;

import javax.persistence.*;

/**
 * Created by MalindaK on 12/19/2017.
 */

@javax.persistence.Entity
@Table(name = "school", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "schoolId")})
public class School extends Entity {

        private int schoolId;
        private String name;

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name = "schoolId", unique = true, nullable = false)
        public int getSchoolId() {
            return schoolId;
        }

        public void setSchoolId(int schoolId) {
            this.schoolId = schoolId;
        }

        @Column(name = "name", nullable = true, length = 40)
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
}