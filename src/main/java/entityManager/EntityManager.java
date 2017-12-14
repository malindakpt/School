package entityManager;

import AppConfig.HibernateUtil;
import entity.Entity;
import entity.Student;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class EntityManager {
    public static void add(Entity entity){
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();

            session.beginTransaction();
            session.save(entity);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }
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

    public static List<Entity> getEntitySubList(Class entity,String idCol, String id){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));
            entities = query.list();

            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static Entity getEntity(Class entity,String idCol, String id){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));
            entities = query.list();

            tx.commit();
            return entities.get(0);
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    /* Method to  READ all the employees */
    public static List<Entity> getEntities(Class entity){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            entities = session.createQuery("FROM "+entity.getSimpleName()).list();

            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
