import entity.Stock;
import org.hibernate.Session;
import persistence.HibernateUtil;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class App {
    public static void main( String[] args )
    {
        System.out.println("Maven + Hibernate + MySQL");
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        Stock stock = new Stock();

        stock.setStockCode("111");
        stock.setStockName("Malinda");

        session.save(stock);
        session.getTransaction().commit();
    }
}
