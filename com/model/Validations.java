package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.common.User;


public class Validations {
	

	public boolean checkSport(String user) {
    	String encrptPassword="";
        Connection con = null;
        try {
        	System.out.println("entered for login checking");
        	con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            
            System.out.println("select * from sports where (sportName= '"+user.toString() + "')") ;
            ResultSet rs = stmt.executeQuery("select * from sports where (sportName= '"+user.toString() + "')");
            if (rs.next()) {
            	return true;

                
            }
            else{
            	return false;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                }
            }
        }
        return false;
    }

	public int getSportId(String sportName) {
        Connection con = null;

		  try {
	        	System.out.println("entered for login checking");
	        	con = DBConnection.getDBConnection();
	            Statement stmt = con.createStatement();
	            
	            
	            ResultSet rs = stmt.executeQuery("select * from sports where (sportName= '"+sportName.toString() + "')");
	            if (rs.next()) {
	            	
	                return rs.getInt(1);
	                
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	        } finally {
	            if (con != null) {
	                try {
	                    con.close();
	                } catch (SQLException ex) {
	                }
	            }
	        }
		return 0;
	}
	
}
