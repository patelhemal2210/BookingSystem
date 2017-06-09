/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Reservation;
import entity.Room;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

/**
 *
 * @author hemalpatel
 */
@Stateless
@TransactionManagement(value=TransactionManagementType.CONTAINER)
public class EntityAccessorBean implements EntityAccessorBeanRemote, EntityAccessorBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    @javax.persistence.PersistenceContext(unitName="BookingSystemNew-ejbPU")
    private EntityManager em ;
    
    @Override
    public <T> T find(Class<T> type, int id)
    {
        return em.find(type, id);
    }
    
    @Override
    public <T> List<T> getAll(Class<T> type) {
        /*String q = "SELECT c FROM " + type.getSimpleName() + " c";
        //System.out.println(q);
        Query query = em.createQuery(q);
        return query.getResultList();*/
        return em.createQuery("SELECT c FROM " + type.getSimpleName() + " c").getResultList();
    }

    @Override
    public <T> void insert(T obj) {
       em.persist(obj); 
    }
    
    @Override
    public <T> void update(T obj) {
       em.merge(obj);
    }
    
    @Override
    public <T> void delete(Class<T> type, int id) {
        //em.remove(em.contains(obj) ? obj : em.merge(obj));
        T temp = em.find(type, id);
        if(temp != null)
            em.remove(temp);
    }
    
    @Override
    public <T, S> T namedQuery(String namedQuery,String parameterName, S parameterValue)
    {
        T object;
        try
        {
            object = (T) em.createNamedQuery(namedQuery).setParameter(parameterName, parameterValue).getSingleResult();
        }
        catch(NoResultException ex)
        {
            object = null;
        }
        return object;
    }
}
