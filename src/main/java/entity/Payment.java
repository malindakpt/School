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
    private String key;
    private float amount;
    private int paymentMethod;
    private String desc;
    private Date date;
    private String ref;
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

    @Column(name = "key", nullable = false, length = 40)
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
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

    @Column(name = "desc", nullable = false, length = 40)
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Column(name = "date", nullable = false, length = 40)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "ref", nullable = false, length = 40)
    public String getRef() {
        return ref;
    }
    public void setRef(String ref) {
        this.ref = ref;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "studentId", nullable = false)
    public Student getStudent() {
        return student;
    }
    public void setStudent(Student student) {
        this.student = student;
    }
}
