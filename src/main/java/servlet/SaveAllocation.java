package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries

import entity.ParticipationDate;
import entity.Student;
import entity.Teacher;
import entity.User;
import entity.allocation.Location;
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
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

//import java.sql.Date;

public class SaveAllocation extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user != null && user.getRole()>= UserRoles.TEACHER) {
                Helper helper = new Helper();
                String locationId = request.getParameter("locationId");
                String teacherId = request.getParameter("teacherId");
                Location location = (Location) EntityManager.getEntity(Location.class, "locationId", locationId);
                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
                HashMap<String, String> map = helper.getAllocationMap(location.getAllocationMap());

                String dayPeriod = request.getParameter("dayPeriod");
                String desc = teacher.displayName()+"-"+request.getParameter("desc")+":"+teacherId;

                String val = teacherId+"%"+desc;

                map.put(dayPeriod, val);
                String allStr = helper.getAllocationString(map);
                location.setAllocationMap(allStr);

                EntityManager.update(location);
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
