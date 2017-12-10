package entity;

/**
 * Created by MalindaK on 12/10/2017.
 */
public class StudentClass extends Entity {
    private int batch;
    private String className;
    private int grade;
    private Teacher classTeacher;
    private Student[] students;

    public int getBatch() {
        return batch;
    }

    public void setBatch(int batch) {
        this.batch = batch;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public Teacher getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Teacher classTeacher) {
        this.classTeacher = classTeacher;
    }

    public Student[] getStudents() {
        return students;
    }

    public void setStudents(Student[] students) {
        this.students = students;
    }
}
