package entityManager;

import AppConfig.HibernateUtil;
import entity.Entity;
import entity.Stock;
import entity.Student;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class EntityManager {
    public static void add(Entity entity){
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        session.save(entity);
        session.getTransaction().commit();
    }

    /* Method to DELETE an employee from the records */
    public static void delete(Entity entity, int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Student student = (Student)session.get(Entity.class, id);
            session.delete(student);
            tx.commit();
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public static void update(Entity entity){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.update(entity);
            tx.commit();

        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    /* Method to  READ all the employees */
    public static List<Entity> getEntities(Class entity){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            entities = session.createQuery("FROM "+entity.getSimpleName()).list();
//            for (Iterator iterator = entities.iterator(); iterator.hasNext();){
//                Student student = (Student) iterator.next();
//
//                System.out.print("First Name: " + student.getId());
//                System.out.print("  Last Name: " + student.getFirstName());
//                System.out.println("----------");
//            }
            tx.commit();
            return entities;
        } catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
