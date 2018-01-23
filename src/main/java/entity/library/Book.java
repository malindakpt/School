package entity.library;

import entity.*;
import entity.Entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by MalindaK on 1/21/2018.
 */
@javax.persistence.Entity
@Table(name = "Book", catalog = "school", uniqueConstraints = {
        @UniqueConstraint(columnNames = "bookId")})
public class Book extends Entity {

    private int bookId;
    private String code;
    private String ISBN;
    private String name;
    private String auther;
    private String description;
    private String publisher;
    private int category;
    private boolean isIssued;

    private Date addedDate;
    private Student borrowedBy;
    private Date burrowedDate;

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
    @Column(name = "bookId", unique = true, nullable = false)
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    @Column(name = "category", nullable = true, length = 10)
    public int getCategory() {
        return category;
    }
    public void setCategory(int category) {
        this.category = category;
    }

    @Column(name = "code", nullable = true, length = 100)
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    @Column(name = "ISBN", nullable = true, length = 100)
    public String getISBN() {
        return ISBN;
    }
    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    @Column(name = "name", nullable = true, length = 100)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "auther", nullable = true, length = 100)
    public String getAuther() {
        return auther;
    }
    public void setAuther(String auther) {
        this.auther = auther;
    }

    @Column(name = "description", nullable = true, length = 100)
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "isIssued", nullable = true, length = 10)
    public boolean isIssued() {
        return isIssued;
    }
    public void setIssued(boolean issued) {
        isIssued = issued;
    }

    @Column(name = "publisher", nullable = true, length = 100)
    public String getPublisher() {
        return publisher;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    @Column(name = "addedDate", nullable = true, length = 100)
    public Date getAddedDate() {
        return addedDate;
    }
    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "studentId", nullable = true)
    public Student getBorrowedBy() {
        return borrowedBy;
    }
    public void setBorrowedBy(Student borrowedBy) {
        this.borrowedBy = borrowedBy;
    }

    @Column(name = "burrowedDate", nullable = true, length = 100)
    public Date getBurrowedDate() {
        return burrowedDate;
    }
    public void setBurrowedDate(Date burrowedDate) {
        this.burrowedDate = burrowedDate;
    }
}
