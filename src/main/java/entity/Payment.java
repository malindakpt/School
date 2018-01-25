package entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by MalindaK on 1/25/2018.
 */
@javax.persistence.Entity
@Table(name = "payment", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "paymentId")})
public class Payment extends Entity{
    private int paymentId;
    private String paymentKey;
    private float amount;
    private int paymentMethod;
    private String description;
    private Date payDate;
    private String referance;
    private int category;
    private Student student;


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
    @Column(name = "paymentId", unique = true, nullable = false)
    public int getPaymentId() {
        return paymentId;
    }
    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    @Column(name = "paymentKey", nullable = false, length = 40)
    public String getPaymentKey() {
        return paymentKey;
    }
    public void setPaymentKey(String paymentKey) {
        this.paymentKey = paymentKey;
    }

    @Column(name = "amount", nullable = false, length = 40)
    public float getAmount() {
        return amount;
    }
    public void setAmount(float amount) {
        this.amount = amount;
    }

    @Column(name = "category", nullable = false, length = 10)
    public int getCategory() {
        return category;
    }
    public void setCategory(int category) {
        this.category = category;
    }

    @Column(name = "paymentMethod", nullable = false, length = 10)
    public int getPaymentMethod() {
        return paymentMethod;
    }
    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Column(name = "description", nullable = false, length = 40)
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "payDate", nullable = false, length = 40)
    public Date getPayDate() {
        return payDate;
    }
    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    @Column(name = "referance", nullable = false, length = 40)
    public String getReferance() {
        return referance;
    }
    public void setReferance(String referance) {
        this.referance = referance;
    }



    @ManyToOne(optional = false)
    @JoinColumn(name="studentId")
    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }
}
