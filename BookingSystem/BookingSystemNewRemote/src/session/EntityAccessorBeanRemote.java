/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author hemalpatel
 */
@Remote
public interface EntityAccessorBeanRemote {
    <T> T find(Class<T> type, int id);
    <T> List<T> getAll(Class<T> type);
    <T> void insert(T obj);
    <T> void update(T obj);
    <T> void delete(Class<T> type, int id);
    <T, S> T namedQuery(String namedQuery,String parameterName, S parameterValue);
}
