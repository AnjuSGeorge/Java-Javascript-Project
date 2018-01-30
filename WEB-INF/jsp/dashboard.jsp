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
try {
    con = DBConnection.getDBConnection();
    Statement stmt = con.createStatement();
     rs = stmt.executeQuery("select * from leagues where userid = " + userId);
   
} catch (SQLException | ClassNotFoundException ex) {
    ex.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dashboard Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link rel="icon" href="images/favicon.ico">
  <!-- Bootstrap v4.0.0-beta -->
	<link rel="stylesheet" href="assets/vendor_components/bootstrap/dist/css/bootstrap.css">
	
	<!-- font awesome -->
	<link rel="stylesheet" href="assets/vendor_components/font-awesome/css/font-awesome.css">
	
	<!-- ionicons -->
	<link rel="stylesheet" href="assets/vendor_components/Ionicons/css/ionicons.css">
	
	<!-- theme style -->
	<link rel="stylesheet" href="css/master_style.css">
	
	<!-- maximum_admin skins. choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="css/skins/_all-skins.css">
	
	<!-- morris chart -->
	<link rel="stylesheet" href="assets/vendor_components/morris.js/morris.css">
	
	<!-- jvectormap -->
	<link rel="stylesheet" href="assets/vendor_components/jvectormap/jquery-jvectormap.css">
	
	<!-- date picker -->
	<link rel="stylesheet" href="assets/vendor_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css">
	
	<!-- daterange picker -->
	<link rel="stylesheet" href="assets/vendor_components/bootstrap-daterangepicker/daterangepicker.css">
	
	<!-- bootstrap wysihtml5 - text editor -->
	<link rel="stylesheet" href="assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.css">
	

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

     
  
</head>
<body  class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
<header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">DL</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Draft</b> League</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
           <a href="logout.html" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="fa fa-power-off"></i></a>

          </li>
          <!-- Messages: style can be found in dropdown.less-->
         
          
          <!-- Tasks: style can be found in dropdown.less -->
          
         
        </ul>
      </div>
    </nav>
  </header>


 <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="image">
          <img src="<%=session.getAttribute("pic")%>" class="rounded-circle" alt="<%=session.getAttribute("name")%>">
        </div>
        <div class="info">
          <p><%=session.getAttribute("name")%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li>
          <a href="dashboard.html">
            Dashboard            
          </a>
         
        </li>
         <li>
          <a href="AccountSettings.html">
            Account Settings
          </a>
         
        </li>
     
     <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Create New League</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="createLeague/NFL"><i class="fa fa-circle-o"></i>NFL</a></li>
            <li><a href="createLeague/NBA"><i class="fa fa-circle-o"></i>NBA</a></li>
            <li><a href="createLeague/MLB"><i class="fa fa-circle-o"></i>MLB</a></li>
            <li><a href="createLeague/NHL"><i class="fa fa-circle-o"></i>NHL</a></li>
          </ul>
        </li>
        
     
     
      </ul>
    </section>
    <!-- /.sidebar -->
    <div class="sidebar-footer">
		<!-- item-->
		<a href="" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i class="fa fa-cog fa-spin"></i></a>
		<!-- item-->
		<a href="" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="fa fa-envelope"></i></a>
		<!-- item-->
		<a href="logout.html" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="fa fa-power-off"></i></a>
	</div>
  </aside>

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h3>
        Dashboard
        <small>Control panel</small>
       </h3>
   
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
         <li class="breadcrumb-item active"><a href="dashboard.html"><i class="fa fa-dashboard"></i>Dashboard</a></li>
            </ol>
    

     

</section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-6 col-xl-3">
          <!-- small box -->
          <div class="small-box bg-blue">
            <div class="inner">
              <h3><%=getResultSet.getNoOfLeagues(userId)%></h3>

              <p>Leagues</p>
            </div>
            <div class="icon">
              <i class="fa fa-shopping-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-6 col-xl-3">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>67<sup style="font-size: 20px">%</sup></h3>

              <p>Sales Rate</p>
            </div>
            <div class="icon">
              <i class="fa fa-bar-chart"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-6 col-xl-3">
          <!-- small box -->
          <div class="small-box bg-purple">
            <div class="inner">
              <h3>78</h3>

              <p>User Registrations</p>
            </div>
            <div class="icon">
              <i class="fa fa-user-plus"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-6 col-xl-3">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>New Visitors</p>
            </div>
            <div class="icon">
              <i class="fa fa-pie-chart"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      
         

          <!-- TO DO List -->
     
        </section>

        <div class="row" style="margin-left:10px;">
          
          
          
    <% if(rs.next()) 
	{
    	String ContName="";
    	String SprtName="";
    	String LogoName="";
    	String LogoPic = "";
    	rs.beforeFirst();
		
	 	 while(rs.next()) 
			{
			 System.out.println("entered resultset");
			
			
		%>     
                
        <div class="col-md-4 col-lg-4">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title" style ="color:blue"> <a href="./sendInvite?LeagueId=<%=rs.getString(1)%>"> <%=rs.getString(2)%> </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<h1 id="dd-<%=rs.getString(2)%>"></h1>
              <%  
              ContName=getResultSet.getResult(Integer.parseInt(rs.getString(3)), "ContestType");
          	 SprtName=getResultSet.getResult(Integer.parseInt(rs.getString(5)), "Sports");
          	if ((ContName=="Head-to-Head") && (SprtName == "NFL"))
          	{
          		LogoName="HeadToHead NFL";
          		LogoPic= "images/SportType/HEADNFL.png";
          	}
          	else if ((ContName=="Head-to-Head") && (SprtName == "MLB"))
          	{
          		LogoName="HeadToHead MLB";
          		LogoPic= "images/SportType/HEADMLB.png";
          	}
          	else if ((ContName=="Head-to-Head") && (SprtName == "NBA"))
          	{
          		LogoName="HeadToHead NBA";
          		LogoPic= "images/SportType/HEADNBA.png";
          	}
        	else if ((ContName=="Head-to-Head") && (SprtName == "NHL"))
          	{
          		LogoName="HeadToHead NHL";
          		LogoPic= "images/SportType/HEADNHL.png";
          	}
        	else if ((ContName=="PointsOnly") && (SprtName == "NFL"))
          	{
          		LogoName="PointsOnly NFL";
          		LogoPic= "images/SportType/NFLPTP.png";
          	}
          	else if ((ContName=="PointsOnly") && (SprtName == "MLB"))
          	{
          		LogoName="PointsOnly MLB";
          		LogoPic= "images/SportType/MLBPTP.png";
          	}
          	else if ((ContName=="PointsOnly") && (SprtName == "NBA"))
          	{
          		LogoName="PointsOnly NBA";
          		LogoPic= "images/SportType/NBAPTP.png";
          	}
        	else if ((ContName=="PointsOnly") && (SprtName == "NHL"))
          	{
          		LogoName="PointsOnly NHL";
          		LogoPic= "images/SportType/NHLPTP.png";
          	}
        	else if ((ContName=="Rotisserie") && (SprtName == "NFL"))
          	{
          		LogoName="Rotisserie NFL";
          		LogoPic= "images/SportType/ROTNFL.png";
          	}
          	else if ((ContName=="Rotisserie") && (SprtName == "MLB"))
          	{
          		LogoName="Rotisserie MLB";
          		LogoPic= "images/SportType/ROTMLB.png";
          	}
          	else if ((ContName=="Rotisserie") && (SprtName == "NBA"))
          	{
          		LogoName="Rotisserie NBA";
          		LogoPic= "images/SportType/ROTNBA.png";
          	}
        	else if ((ContName=="Rotisserie") && (SprtName == "NHL"))
          	{
          		LogoName="Rotisserie NHL";
          		LogoPic= "images/SportType/ROTNHL.png";
          	}
          
        	 %>
        	 
            <p> <img src="<%=LogoPic%>"; height=130px; width = 130px></p>
            		<p><%=rs.getString(6)%></p>
					<p><%=getResultSet.getResult(Integer.parseInt(rs.getString(7)), "DraftType")%></p>
					</a>

             

              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <%}
	}
        %>

	
</div>
        
       
      </div>
     




</div>
 <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
      <b>Version</b> 1.2.1
    </div>Copyright &copy; 2017 <a href="https://www.multipurposethemes.com/">Multi-Purpose Themes</a>. All Rights Reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Admin Birthday</h4>

                <p>Will be July 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Jhone Updated His Profile</h4>

                <p>New Email : jhone_doe@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Disha Joined Mailing List</h4>

                <p>disha@demo.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Code Change</h4>

                <p>Execution time 15 Days</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Web Design
                <span class="label label-danger pull-right">40%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 40%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Data
                <span class="label label-success pull-right">75%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 75%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Order Process
                <span class="label label-warning pull-right">89%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 89%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Development 
                <span class="label label-primary pull-right">72%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 72%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="report_panel" class="chk-col-grey" >
			<label for="report_panel" class="control-sidebar-subheading ">Report panel usage</label>

            <p>
              general settings information
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="allow_mail" class="chk-col-grey" >
			<label for="allow_mail" class="control-sidebar-subheading ">Mail redirect</label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="expose_author" class="chk-col-grey" >
			<label for="expose_author" class="control-sidebar-subheading ">Expose author name</label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <input type="checkbox" id="show_me_online" class="chk-col-grey" >
			<label for="show_me_online" class="control-sidebar-subheading ">Show me as online</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <input type="checkbox" id="off_notifications" class="chk-col-grey" >
			<label for="off_notifications" class="control-sidebar-subheading ">Turn off notifications</label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">              
              <a href="javascript:void(0)" class="text-red margin-r-5"><i class="fa fa-trash-o"></i></a>
              Delete chat history
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
   <div class="control-sidebar-bg"></div>
  

  

<!-- ./wrapper -->
  	
	 
	  
	<!-- jQuery 3 -->
	<script src="assets/vendor_components/jquery/dist/jquery.js"></script>
	
	<!-- jQuery UI 1.11.4 -->
	<script src="assets/vendor_components/jquery-ui/jquery-ui.js"></script>
	
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	</script>
	
	<!-- popper -->
	<script src="assets/vendor_components/popper/dist/popper.min.js"></script>
	
	<!-- Bootstrap v4.0.0-beta -->
	<script src="assets/vendor_components/bootstrap/dist/js/bootstrap.js"></script>
	
	<!-- Morris.js charts -->
	<script src="assets/vendor_components/raphael/raphael.js"></script>
	<script src="assets/vendor_components/morris.js/morris.js"></script>
	
	<!-- Sparkline -->
	<script src="assets/vendor_components/jquery-sparkline/dist/jquery.sparkline.js"></script>
	
	<!-- jvectormap -->
	<script src="assets/vendor_plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>	
	<script src="assets/vendor_plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	
	<!-- jQuery Knob Chart -->
	<script src="assets/vendor_components/jquery-knob/js/jquery.knob.js"></script>
	
	<!-- daterangepicker -->
	<script src="assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<!-- datepicker -->
	<script src="assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	
	<!-- Bootstrap WYSIHTML5 -->
	<script src="assets/vendor_plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.js"></script>
	
	<!-- Slimscroll -->
	<script src="assets/vendor_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	
	<!-- FastClick -->
	<script src="assets/vendor_components/fastclick/lib/fastclick.js"></script>
	
	<!-- maximum_admin App -->
	<script src="js/template.js"></script>
	
	<!-- maximum_admin dashboard demo (This is only for demo purposes) -->
	<script src="js/pages/dashboard.js"></script>
	
	<!-- maximum_admin for demo purposes -->
	<script src="js/demo.js"></script>

	

</body>
</html>