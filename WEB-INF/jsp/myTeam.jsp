<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="org.springframework.stereotype.Service"%>
<%@page import="com.model.DBConnection"%>
<%@page import="com.common.getResultSet"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
 


<%
int userId= (int)session.getAttribute("Id");
System.out.println("UserId in Dashboard"+userId);
Connection con = null;
ResultSet rs = null;
ResultSet rs2 = null;
try {
    con = DBConnection.getDBConnection();
    Statement stmt = con.createStatement();
     rs = stmt.executeQuery("select * from leagues where userid = " + userId);
     
   
} catch (SQLException | ClassNotFoundException ex) {
    ex.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
  <head>
  <title>My Team</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

  </head>

  <body>

    <h1>Fantasy Basketball Year</h1>
    <br />
<form method="post" action="./myteam">
	
    <div class="container">
      <h2>Team Name</h2>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Logo</th>
            <th>My Name</th>
            <th>Record</th>
            <th>Points/Week</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><img src="teamLogo.jpg" class="rounded" alt="MyTeamLogo"></td>
            <td>My Name</td>
            <td>W-L-T</td>
            <td>POINTS/WEEKS</td>
          </tr>
        </tbody>
      </table>
    </div>
    
    

    <br />
	<% if(rs.next()) { %>
    <div class="container">
      <h2>League Draft Info</h2>
      <p>Your league's draft is scheduled for</p>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
          </tr>
        </thead>
        <tbody>
        	<%
	rs.beforeFirst();
	String dateOutput = "";
 	 while(rs.next()) 
		{
		 System.out.println("entered resultset");		
		 	String pattern = "yyyy-MM-dd";
		 	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		 	Date date = simpleDateFormat.parse(rs.getString(6));
			
		%>
		
          <tr>
            <td><%= date %></td>
            <td><%=rs.getString(7) %></td>
          </tr>
          
          <% } %>
        </tbody>
      </table>
    </div>
    
    <% } %>
    <br />

	<!-- Team Roster -->
    <div class="container">
      <h4>Your team will include the following roster positions:</h4>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>PG</th>
            <th>SG</th>
            <th>G</th>
            <th>SF</th>
            <th>PF</th>
            <th>F</th>
            <th>C</th>
            <th>Util</th>
            <th>BN</th>
            <th>IL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>1</td>
            <td>1</td>
            <td>1</td>
            <td>1</td>
            <td>1</td>
            <td>2</td>
            <td>2</td>
            <td>3</td>
            <td>2</td>
          </tr>
        </tbody>
      </table>
    </div>

</form>
  </body>




<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>


</html>
