/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Customer;
import entity.Reservation;
import entity.Room;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.joda.time.DateTime;
import org.joda.time.Days;

/**
 *
 * @author hemalpatel
 */
@Stateless
@TransactionManagement(value=TransactionManagementType.CONTAINER)
public class AdminSessionBean implements AdminSessionBeanRemote, AdminSessionBeanLocal {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    @javax.persistence.PersistenceContext(unitName="BookingSystemNew-ejbPU")
    private EntityManager em ;
    
    @Override
    public List<Date> getReservedDatesForRoom(int roomId)
    {
        Room r = em.find(Room.class, roomId);
        Query query = em.createQuery("SELECT r FROM Reservation r WHERE r.roomId=:roomid AND r.dateOut>=:givendate");
        query.setParameter("roomid", r);
        query.setParameter("givendate", new Date());
        List<Reservation> reservationList = query.getResultList();
        List<Date> dateList = new ArrayList<>();
        
        for(Reservation reservation : reservationList) {
            DateTime dateout = new DateTime(reservation.getDateOut());
            DateTime datein = new DateTime(reservation.getDateIn());
            Days days = Days.daysBetween(datein, dateout);
            dateList.add(datein.toDate());
            for(int i = 1; i <= days.getDays() ; i++)
            {
                dateList.add(datein.plusDays(i).toDate());
            }
        }
        return dateList;
        
    }
    
    @Override
    public List<Room> getAvailableRoomsForDate(Date selectedDate)
    {
        List<Room> rooms = new ArrayList<>();
        Query query = em.createQuery("SELECT r.roomId FROM Reservation r WHERE r.dateOut >= :currentDate AND r.dateIn <= :datein AND r.dateOut >= :dateout");
        query.setParameter("currentDate", new Date());
        query.setParameter("datein", selectedDate);
        query.setParameter("dateout", selectedDate);
        rooms = query.getResultList();
        
        return rooms;
    }
    
    @Override
    public <T> Boolean checkUserCredential(Class<T> userType, String userName, String password)
    {
        Boolean status = false;
        switch(userType.getName())
        {
            case "entity.Customer" :
                status = em.createQuery("SELECT c FROM Customer c WHERE c.name = :username and c.password = :userpassword")
                .setParameter("username", userName)
                .setParameter("userpassword", password)
                .getResultList().size() > 0;
                break;
            case "entity.User":
                status = em.createQuery("SELECT u FROM User u WHERE u.name = :username and u.password = :userpassword")
                .setParameter("username", userName)
                .setParameter("userpassword", password)
                .getResultList().size() > 0;
                break;
            default:
                break;
        }
        return status;
    }
}
