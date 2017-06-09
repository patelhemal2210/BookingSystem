/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entity.Room;
import java.util.Date;
import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author hemalpatel
 */
@Remote
public interface AdminSessionBeanRemote {
    List<Date> getReservedDatesForRoom(int roomId);
    List<Room> getAvailableRoomsForDate(Date selectedDate);
    <T> Boolean checkUserCredential(Class<T> userType, String userName, String password);
}
