package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Payment;
import entity.Student;
import entity.User;
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

public class AddPayment extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {

                Calendar c = Calendar.getInstance();
                String studId = request.getParameter("studId");
             //   Student student = (Student) EntityManager.getEntity(Student.class,"studentId", studId);
                Student student = new Student();
                student.setStudentId(1);
                Payment payment = new Payment();
                payment.setStudent(student);
                payment.setKey(request.getParameter("year")+ "-" +request.getParameter("term"));
                payment.setCategory(Integer.parseInt(request.getParameter("cat")));
                payment.setAmount(Integer.parseInt(request.getParameter("amount")));
                payment.setPaymentMethod(Integer.parseInt(request.getParameter("payMethod")));
                payment.setRef(request.getParameter("ref"));
                payment.setDesc(request.getParameter("desc"));
                payment.setDate(c.getTime());

                payment.setSchool(user.getSchool());

                EntityManager.add(payment);
            }else{
                out.write("NO##Unauthorized Access");
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
