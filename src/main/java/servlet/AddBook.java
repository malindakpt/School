package servlet; /**
 * Created by MalindaK on 2/21/2016.
 */
// Import required java libraries


import entity.Teacher;
import entity.User;
import entity.allocation.InventoryItem;
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

public class AddBook extends HttpServlet {


    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {

            User user = new Helper().getUser(request);

            if(user!=null && user.getRole() >= UserRoles.TEACHER) {

                Calendar c = Calendar.getInstance();

                Book book = new Book();
                book.setName(request.getParameter("name"));
                book.setCode(request.getParameter("code"));
                book.setAuther(request.getParameter("auther"));
                book.setDescription(request.getParameter("desc"));
                book.setISBN(request.getParameter("isbn"));
                book.setPublisher(request.getParameter("publisher"));
                book.setCategory(Integer.parseInt(request.getParameter("category")));
                book.setAddedDate(c.getTime());

                book.setSchool(user.getSchool());

                EntityManager.add(book);
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
