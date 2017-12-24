package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.*;
import entityManager.EntityManager;
import util.Helper;
import util.UserRoles;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;


//import java.sql.Date;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class MarkAttendance extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user != null && user.getRole()>= UserRoles.TEACHER) {
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                String[] absentStudArr = request.getParameterValues("studArr[]");
                Date date = formatter.parse(request.getParameter("date"));


                for (int i = 0; i < absentStudArr.length; i++) {
                    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", absentStudArr[i]);
                    ParticipationDate participationDate = new ParticipationDate(date, false, user.getSchool(), student);
                    Set<ParticipationDate> absentDates = student.getAbsentDates();

                    EntityManager.add(participationDate);

                    if (student.getAbsentDates().size() > 0) {
                        absentDates.add(participationDate);
                    } else {
                        absentDates = new HashSet<ParticipationDate>();
                        absentDates.add(participationDate);
                        student.setAbsentDates(absentDates);
                    }
                    EntityManager.update(student);
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
