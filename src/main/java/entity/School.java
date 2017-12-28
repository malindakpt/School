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
        private int periodsPerWeek;
        private String image;

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

        @Column(name = "image", nullable = true, length = 40)
        public String getImage() {
            return image;
        }
        public void setImage(String image) {
            this.image = image;
        }

        @Column(name = "periodsPerWeek", nullable = true, length = 10)
        public int getPeriodsPerWeek() {
             return periodsPerWeek;
        }
        public void setPeriodsPerWeek(int periodsPerWeek) {
            this.periodsPerWeek = periodsPerWeek;
        }
}
