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
import java.util.HashMap;

//import java.sql.Date;

public class SaveAllocationInventory extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user != null && user.getRole()>= UserRoles.TEACHER) {
                Helper helper = new Helper();
                String inventoryId = request.getParameter("inventoryId");
                String teacherId = request.getParameter("teacherId");
                InventoryItem inventoryItem = (InventoryItem) EntityManager.getEntity(InventoryItem.class, "inventoryId", inventoryId);
                Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
                HashMap<String, String> map = helper.getAllocationMap(inventoryItem.getAllocationMap());

                String dayPeriod = request.getParameter("dayPeriod");
                String desc = teacher.displayName()+"-"+request.getParameter("desc")+":"+teacherId;

                String val = teacherId+"%"+desc;

                map.put(dayPeriod, val);
                String allStr = helper.getAllocationString(map);
                inventoryItem.setAllocationMap(allStr);

                EntityManager.update(inventoryItem);
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
