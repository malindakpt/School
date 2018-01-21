package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Teacher;
import entity.User;
import entity.allocation.InventoryItem;
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

public class AddInventoryItem extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {

                InventoryItem item = new InventoryItem();
                item.setName(request.getParameter("name"));
                item.setDescription(request.getParameter("description"));
                item.setCategory(Integer.parseInt(request.getParameter("category")));

                item.setSchool(user.getSchool());

                String teacherId = request.getParameter("owner");
                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class,"teacherId", teacherId);
                item.setOwner(teacher);

                String locationId = request.getParameter("locationId");
                Location location = (Location) EntityManager.getEntity(Location.class,"locationId", locationId);
                item.setLocation(location);

                EntityManager.add(item);
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
