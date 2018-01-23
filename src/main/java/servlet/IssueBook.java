package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.Student;
import entity.Teacher;
import entity.User;
import entity.allocation.Location;
import entity.library.Book;
import entityManager.EntityManager;
import util.Helper;
import util.UserRoles;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;

//import java.sql.Date;

public class IssueBook extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user != null && user.getRole()>= UserRoles.TEACHER) {
                Helper helper = new Helper();
                Calendar c = Calendar.getInstance();
                String bookId = request.getParameter("bookId");
                String isReturn = request.getParameter("isReturn");
                Book book = (Book) EntityManager.getEntity(Book.class, "bookId", bookId);

                if (isReturn == null ){
                    String studentId = request.getParameter("studentId");
                    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studentId);

                    book.setBorrowedBy(student);
                    book.setBurrowedDate(c.getTime());
                    book.setIssued(true);
                    EntityManager.update(book);
                }else {
//                    String studentId = request.getParameter("studentId");
//                    Book book = (Book) EntityManager.getEntity(Book.class, "bookId", bookId);
//                    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studentId);

                    book.setIssued(false);

                    EntityManager.update(book);
                }

            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        throw new ServletException("GET method used with " +
                getClass( ).getName( )+": POST method required.");
    }


}
