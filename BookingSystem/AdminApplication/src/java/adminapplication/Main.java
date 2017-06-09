/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminapplication;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.swing.JOptionPane;
import session.AdminSessionBeanRemote;
import session.EntityAccessorBeanRemote;

/**
 *
 * @author Hemal Patel
 */
public class Main {

    static EntityAccessorBeanRemote entityAccessorSession;
    static AdminSessionBeanRemote adminSession;
    static List<String> floorList = new ArrayList<String>()
    {{
    add("1");
    add("2");
    add("3");
    add("4");
    add("5");
    add("6");
    add("7");
    add("8");
    add("9");
    add("10");
    }};
    
    static List<String> capacityList = new ArrayList<String>()
    {{
    add("1");
    add("2");
    add("3");
    add("4");
    add("6");
    add("8");
    add("10");
    add("12");
    add("15");
    }};
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        InitialContext ic;
        try {
            //Get the session bean using look up
            ic = new InitialContext();
            Object o = ic.lookup(EntityAccessorBeanRemote.class.getName());
            entityAccessorSession = (EntityAccessorBeanRemote) o;
            
            Object ob = ic.lookup(AdminSessionBeanRemote.class.getName());
            adminSession = (AdminSessionBeanRemote) ob;
            
            //prompt the log-in dialog box 
            new LogInFrame().setVisible(true);
            
        } catch (NamingException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }   
    }
}
