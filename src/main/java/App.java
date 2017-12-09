import entity.Stock;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import persistence.HibernateUtil;

import java.util.Iterator;
import java.util.List;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class App {
    public static void main( String[] args )
    {
        updateEmployee(1,"KUMARAAAAAAAAAA");
        delete(1);
    }

    public static void addStock(){
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        Stock stock = new Stock();

        stock.setStockCode("111");
        stock.setStockName("Malinda");

        session.save(stock);
        session.getTransaction().commit();
    }

    /* Method to DELETE an employee from the records */
    public static void delete(Integer stockID){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Stock stock = (Stock)session.get(Stock.class, stockID);
            session.delete(stock);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static void updateEmployee(int id, String name ){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Stock stock = (Stock)session.get(Stock.class, id);
            stock.setStockName( name );
            session.update(stock);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    /* Method to  READ all the employees */
    public static void listEmployees(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            List employees = session.createQuery("FROM Stock ").list();
            for (Iterator iterator = employees.iterator(); iterator.hasNext();){
                Stock stock = (Stock) iterator.next();

                System.out.print("First Name: " + stock.getStockCode());
                System.out.print("  Last Name: " + stock.getStockName());
                System.out.println("----------");
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

}
