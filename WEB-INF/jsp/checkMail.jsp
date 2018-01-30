<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int year = Calendar.getInstance().get(Calendar.YEAR); request.setAttribute("year", year); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

  <!-- Bootstrap -->
    <script src="js/login/pace.js"></script>
    <link href="css/login/bootstrap.css" rel="stylesheet">
    <link href="css/login/theme.css" rel="stylesheet">
    <link href="css/login/font-awesome.css" rel="stylesheet">
    <link href="css/login/animate.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:700,400|Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
    <link href="css/login/theme-loading-bar.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<style>
		input[type="email"], input[type="password"] {

			background-color : #b7b7b7;
			border:1px solid #ffff00;

		}
		label{
			color:#d7d7d7;
		}
		.lg-btn, .lg-btn:hover{
			background-color:#ffff00;
			color:black;
			 font-weight: 900;
			border:#ffff00;
			border-radius:0px;
			width:100px;
			height:40px;
		}
		#logo{
			z-index:999;
			position:relative;
		}
		
		
	</style>
<script>
$(function () {

    if (localStorage.chkbox && localStorage.chkbox != '') {
        $('#rememberChkBox').attr('checked', 'checked');
        $('#username').val(localStorage.username);
        $('#password').val(localStorage.pass);
    } else {
        $('#rememberChkBox').removeAttr('checked');
        $('#username').val('');
        $('#password').val('');
    }

    $('#rememberChkBox').click(function () {

        if ($('#rememberChkBox').is(':checked')) {
            // save username and password
            localStorage.username = $('#username').val();
            localStorage.pass = $('#password').val();
            localStorage.chkbox = $('#rememberChkBox').val();
        } else {
            localStorage.username = '';
            localStorage.pass = '';
            localStorage.chkbox = '';
        }
    });
});
</script>

       
    </head>
    <body>
                
        
        
        <div class="container" id="container" style="display:none;">
    <header style="z-index:-10;position:relative;">
        <!-- Main comapny header -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#707070; border-bottom:2px solid #ffff00; z-index:0;">
            <div class="container">
                <div class="navbar-header">
                 
                </div>
            </div>
			
        </nav>
		  <section id="logo" class="col-md-12 col-md-offset-5">
		<img src="images/logo.png" height="200" >
	</section>
    </header>
	
    <section id="form" class="animated fadeInDown">
        <div class="container">
            <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel white-alpha-90" >
                    
                    <div class="panel-body" >
                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        
                        <h4 style="color:white">Please check your email for password reset link. If you are registered with us you would have got it by now.</h4>
 
                        
                     						</div>
						
					</div>
					<br><br>
            </div>
        </div>
    </section>
    
</div>
        
        
        
        
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
                    <script type="text/javascript" src="./js/app.js"></script>
                    <script src="js/login/jquery.min.js"></script>
<script src="js/login/bootstrap.min.js"></script>
<script src="js/login/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>

<script>
    Pace.on('hide', function(){
        $("#container").fadeIn('1000');
        $.backstretch([
            "images/bg2.jpg",
            
        ], {duration: 5000, fade: 1000});
    });

</script>

                    
    </body>
</html>