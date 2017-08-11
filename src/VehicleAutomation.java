/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author hp
 */
public class VehicleAutomation {

    /**
     * @param args the command line arguments
     */
public static void main(String args[])  {
     System.out.print("p");
try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
               
            }
        } catch (Exception ex) {
         JOptionPane.showMessageDialog(null, ""+ex.getMessage()); 
        }
        
        Connection myconnection;

String path="jdbc:mysql://localhost:3306/vehicle_automation";
String username="root";
String password="";

try
{
myconnection=DriverManager.getConnection(path, username, password);
try
{
String a="select * from usertable";
PreparedStatement mystatement=myconnection.prepareStatement(a);

ResultSet myresult=mystatement.executeQuery(); 

if(myresult.next())
{

    login obj=new login();
    obj.setVisible(true);
}
        else

{
    JOptionPane.showMessageDialog(null,"Running software first time,Create admin First");
    Createadmin obj=new Createadmin();
    obj.setVisible(true);
}
}

catch(Exception e)
{
JOptionPane.showMessageDialog(null, "Error in query " + e.getMessage());
}
finally
{
myconnection.close();
}

}
catch(Exception e)
{
JOptionPane.showMessageDialog(null, "Error in Connection " + e.getMessage());
}

}
}