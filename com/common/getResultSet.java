package com.common;
import com.common.User;
import com.model.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.*;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class getResultSet {
	public static String getResult(int id, String tablename)
	{
		String name="";
		String[][] ContestType= {{"1","Head-to-Head"},
									{"2","PointsOnly"},
									{"3","Rotisserie"}
								};
		String[][] Sports= {{"1","NFL"},
							{"2","MLB"},
							{"3","NBA"},
							{"4","NHL"}
						};
		String[][] draftType= {{"1","Live Standard Draft"},
				{"2","Autopick Draft"},
				};

		int TypeId =0;
		if (tablename=="ContestType")
		{
			for (int i = 0; i<ContestType.length; i++)
				{
			     	for (int j = 0; j<ContestType[i].length-1; j++)
			     		{
				    	 TypeId = Integer.parseInt(ContestType[i][j]);
					     if (id == TypeId)
					     	{
					    	 name = ContestType[i][j+1];
					     	}
					     }
				} 
			}
		else if (tablename=="Sports")
		{
			for (int i = 0; i<Sports.length; i++)
			{
		     	for (int j = 0; j<Sports[i].length-1; j++)
		     		{
			    	 TypeId = Integer.parseInt(Sports[i][j]);
				     if (id == TypeId)
				     	{
				    	 name = Sports[i][j+1];
				     	}
				     }
			} 
		
		}
		else if (tablename=="DraftType")
		{
			System.out.println("entered DraftType");
        	
			for (int i = 0; i<draftType.length; i++)
			{
		     	for (int j = 0; j<draftType[i].length-1; j++)
		     		{
			    	 TypeId = Integer.parseInt(draftType[i][j]);
				     if (id == TypeId)
				     	{
				    	 name = draftType[i][j+1];
				     	}
				     }
			} 
			System.out.println("name"+name);
        	
		}

		return name;
	}
	public static String getLeagueName(int leagueId)
	{
		String leagueName="";
		Connection con = null;
        try {
        	System.out.println("entered for getting LeagueName");
        	con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from leagues where leagueId="+leagueId);
            if (rs.next()) {
            	leagueName=rs.getString(2);
            }
        }
        catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                }
            }
        }
		return leagueName;
	}
	
	
	
	public static int getNoOfLeagues(int userId)
	{
		int NoOfLeagues=0;
		Connection con = null;
        try {
        	System.out.println("entered for getting no of leagues");
        	con = DBConnection.getDBConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) from leagues where userId="+userId);
            if (rs.next()) {
            	NoOfLeagues=rs.getInt(1);
            }
        }
        catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                }
            }
        }
		return NoOfLeagues;
	}

	}

