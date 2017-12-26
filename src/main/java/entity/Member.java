package entity;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import java.util.Date;

/**
 * Created by MalindaK on 12/8/2017.
 */
@MappedSuperclass
public class Member extends Entity{
    private String firstName;
    private String lastName;
    private String fullName;
    private Date birthday;
    private String address;
    private String phone;
    private String image;

    @Column(name = "firstName", nullable = true, length = 100)
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "lastName", nullable = true, length = 100)
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "fullName", nullable = true, length = 100)
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Column(name = "birthday", nullable = true, length = 100)
    public Date getBirthday() {
        return birthday;
    }
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Column(name = "address", nullable = true, length = 100)
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "phone", nullable = true, length = 100)
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "image", nullable = true, length = 40)
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
}
