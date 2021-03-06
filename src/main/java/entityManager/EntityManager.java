package entityManager;

import AppConfig.HibernateUtil;
import entity.Entity;
import entity.School;
import entity.Student;
import org.hibernate.*;

import java.util.HashMap;
import java.util.List;

/**
 * Created by MalindaK on 12/9/2017.
 */
public class EntityManager {
    public static void add(Entity entity){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            session.beginTransaction();
            session.save(entity);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
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

    public static List<Entity> getEntitySubList(Class entity,String idCol, String key, School school){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :key AND schoolId = :schoolId";
            Query query = session.createQuery(hql);
            query.setParameter("key", Integer.parseInt(key));
            query.setParameter("schoolId", school.getSchoolId());
            entities = query.list();

            tx.commit();
            return entities;
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
//            session.close();
        }
        return null;
    }

    public static Session createSession(){
        return HibernateUtil.getSessionFactory().openSession();
    }

    public static Entity getEntity(Session session, Class entity,String idCol, String id){
        List<Entity> entities;// = new ArrayList<Entity>();
//        Session session = null;
        Transaction tx = null;

        try {
//            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+idCol+"= :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));

            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
//            session.close();
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

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    public static Entity getEntity1(Class entity,String col1, String val1){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static List<Entity> getOrderedFilteredEntities(Class entity, School school, String col1, String val1, String orderedAttr, boolean isAsc){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;
        String order = isAsc ? "asc" : "desc";

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE schoolId = :schoolId AND "+col1+"= :val1 order by "+orderedAttr+" " + order;
//            String hql = "FROM "+entity.getSimpleName()+" WHERE schoolId = :schoolId AND "+col1+"= :val1 AND " +col2+"= :val2 order by "+orderedAttr+" " + order;

            Query query = session.createQuery(hql);
            query.setParameter("schoolId", school.getSchoolId());
            query.setParameter("val1", val1);
//            query.setParameter("val2", val2);
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

    public static Entity getEntity2(Class entity,String col1, String val1, String col2, String val2){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE "+col1+"= :val1 AND " +col2+"= :val2";
            Query query = session.createQuery(hql);
            query.setParameter("val1", val1);
            query.setParameter("val2", val2);
            entities = query.list();

            tx.commit();

            if(entities.size()>0){
                return entities.get(0);
            }else{
                return null;
            }

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
    public static List<Entity> getEntities(Class entity, School school){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE schoolId = :schoolId";
            Query query = session.createQuery(hql);
            query.setParameter("schoolId", school.getSchoolId());
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

    public static List<Entity> getOrderedEntities(Class entity, School school, String orderedAttr, boolean isAsc){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;
        String order = isAsc ? "asc" : "desc";

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM "+entity.getSimpleName()+" WHERE schoolId = :schoolId order by "+orderedAttr+" " + order;
            Query query = session.createQuery(hql);
            query.setParameter("schoolId", school.getSchoolId());
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

    public static List<HashMap> getRankList(int examId, int schoolId){
        List<HashMap> entities;
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String sql = "SELECT studentId,sum(marks) as total FROM assesment WHERE examId= :examId and schoolId= :schoolId  group by studentId order by total desc";//" WHERE examId=1 group by studentId order by total desc";
            SQLQuery query = session.createSQLQuery(sql);
            query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
            query.setParameter("examId", examId);
            query.setParameter("schoolId", schoolId);
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

    public static List<Entity> getExamMarks(int examId, int classId, int subjectId, int schoolId){
        List<Entity> entities;// = new ArrayList<Entity>();
        Session session = null;
        Transaction tx = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            String hql = "FROM Assesment ass WHERE examId = :examId and ass.student.classRoom.classRoomId= :classId and subjectId = :subjectId and ass.school.schoolId = :schoolId";
            Query query = session.createQuery(hql);
            query.setParameter("examId", examId);
            query.setParameter("classId", classId);
            query.setParameter("subjectId", subjectId);
            query.setParameter("schoolId", schoolId);
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

}
