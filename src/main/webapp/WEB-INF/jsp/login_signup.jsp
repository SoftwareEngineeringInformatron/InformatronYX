<%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Informatron Plus</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
        <meta name="HandheldFriendly" content="True" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="pragma" content="no-cache" />
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <!--slider ccs plugin-->
        <link rel="stylesheet" href="css/slider_themes/default/default.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/light/light.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/dark/dark.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/bar/bar.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/nivo-slider.css" type="text/css" media="screen" />
    <!--plugins-->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" media="screen"  href="bootstrap/css/bootstrap-customize.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/940grid.css" />
        <link rel="stylesheet" type="text/css" href="css/media.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <!-- original customized css -->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/media.css" />
        
        <script type="text/javascript">
            onload = function(){
                var e=document.getElementById('refreshed');
                if(e.value == 'no') e.value = 'yes';
                else{e.value =\\\= 'no'; location.href = 'main'; }
            }            
        </script>
            
      <%        
        
      
        if(session.getAttribute("developer") != null || session.getAttribute("reviewer") != null) 
                response.sendRedirect("alllo.action");
        else if("icms_superadmin".equals((String)session.getAttribute("USER"))) 
            response.sendRedirect("superadmin.action");
        else if("icms_user".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_approveadmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("approveadmin.action");
        else if("icms_meteradmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("meteradmin.action");
        %>
    </head>
    <body>
        <input type="hidden" id="refreshed" value="no">
        <%--=session.getAttribute("USER").toString()--%>
        <div class="wrap">
            <section id="authenticate">
                <div class="container">
                    <div class="row-fluid">
                        <div class="span7">
                                <div class="row-fluid">
                                    <div id="wrapper" >
                                        <div class="slider-wrapper theme-default">
                                            <div id="slider_now" class="nivoSlider">
                                                <img src="img/loop.png" data-thumb="img/loop.png" alt="" title="Learning Object Organizer Plus"/>
                                                <img src="img/learningobject.jpg" data-thumb="img/learningobject.jpg" alt="" title="E-Learning Object Player Ex" />
                                                <img src="img/lori.png" data-thumb="img/lori.png" alt="" data-transition="slideInLeft" title="Learning Object Review Instrument"/>
                                                <img src="img/informatron.png" data-thumb="img/informatron.png" alt="" title="InformatronYX Content Management System"/>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                        </div>
                        <div class="span5">
                            <div><a href="#" class="brand header-txt"><i class="icon-download-alt logo"></i> InformatronYX</a></div>
                        <div class="login">
                                <div class="divider"></div>
                                <div class="clearfix"></div>
                                <div class="divider"></div>
                                <s:fielderror fieldName="username" />
                                <input id="username" type="text" size="20" placeholder="Username" title="Username" required>
                                <br><input id="password" type="password" size="20" placeholder="Password" title="Password" required>
                                <div class="divider"></div>
                                <div class="clearfix"></div>
                                <div class="divider"></div>
                                <button id="btn-login" type="submit" class="btn btn-primary" data-dismiss="modal"> Login </button>&nbsp;
                                <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
                                <a href="#" class="a_login"> Sign Up</a>
                            </div>
                         <!-- Old Implementation
                         <form action="login" method="post">
                            <div class="login">
                                <div class="divider"></div>
                                <div class="clearfix"></div>
                                <div class="divider"></div>
                                <s:fielderror fieldName="username" />
                                <input name="username" type="text" size="20" placeholder="Username" title="Username" required>
                                <br><input name="password" type="password" size="20" placeholder="Password" title="Password" required>
                                <div class="divider"></div>
                                <div class="clearfix"></div>
                                <div class="divider"></div>
                                <button type="submit" class="btn btn-primary" data-dismiss="modal"> Login </button>&nbsp;
                                <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
                                <a href="#" class="a_login"> Sign Up</a>
                            </div>
                        </form>
                          -->   
                        <!-- 
                            Old implementation
                        <form action="signup" method="post" >
                            <div class="signup no-display">
                                <label class="file-action">Please fill in the textfields
                                <br><input name="fname" type="text" size="20" placeholder="First Name" title="First Name" required>
                                <br><input name="lname" type="text" size="20" placeholder="Last Name" title="Last Name" required>
                                <s:fielderror fieldName="email" />
                                <input name="email" type="text" size="20" placeholder="Email Address" title="Email Address" required id="email">
                                <br>&nbsp;&nbsp; <span class="error_message_1"></span>
                                <br>&nbsp;&nbsp; <span class="error_message"></span>
                                <s:fielderror fieldName="uname" />
                                <input name="uname" type="text" size="20" placeholder="Username" title="Username" required>
                                <br><input name="pword" id="a_pass" type="password" size="20" placeholder="Password" title="Password" required>
                                <br><input name="conpword" id="a_conpass" type="password" size="20" placeholder="Confirm Password" title="Confirm Password" required>
                                <div class="divider"></div>
                                
                                <button type="submit" class="btn btn-primary" data-dismiss="modal" id="btn-signup"> Sign Up </button>&nbsp;
                                <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
                        </form>
                        -->
                        <div id="signup">
                            <div class="signup no-display">
                                <label class="file-action">Please fill in the textfields
                                <br><input name="fname" id="fname" type="text" size="20" placeholder="First Name" title="First Name" required>
                                <br><input name="lname" id="lname" type="text" size="20" placeholder="Last Name" title="Last Name" required>
                                <s:fielderror fieldName="email" />
                                <input name="email" type="text" size="20" placeholder="Email Address" title="Email Address" required id="email">
                                <br>&nbsp;&nbsp; <span class="error_message_1"></span>
                                <br>&nbsp;&nbsp; <span class="error_message"></span>
                                <s:fielderror fieldName="uname" />
                                <input name="uname" id="uname" type="text" size="20" placeholder="Username" title="Username" required>
                                <br><input name="pword" id="a_pass" type="password" size="20" placeholder="Password" title="Password" required>
                                <br><input name="conpword" id="a_conpass" type="password" size="20" placeholder="Confirm Password" title="Confirm Password" required>
                                <div class="divider"></div>
                                
                                <button class="btn btn-primary" id="btn-signup"> Sign Up </button>&nbsp;
                                <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
                        </div>
                                <a href="#" class="a_signup"> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>

		<section id="content-wrap">
			<div class="container">
				<div class="row-fluid">
					<div class="span5 content">
						<h2>What is <span>InformatronYX?<span></h2>
						<p>InformatronYX is the official content management system for the Learning Objects. We provide all the ready-to-download Learning Objects to our registered users.</p>
                                                <p class="last">Our library of downoadable Learning objects are available to you. It’s just a click away!</p>
						<h5>Sign up now and enjoy what informatron can offer to you!</h5>
					</div>
				
					<figure class="span7 pull-right img">
						<img src="img/informatron.png" alt="Responsive Design, Cross-Platform Viewing"/>
					</figure>
				</div>
				<div class="clearfix" id="before-features" ></div>
			</div>
		</section>

		<div class="clearfix"></div>

		<section id="feature-wrap">
			<div class="container">
				<ul class="row-fluid">
					<li class="span4 feature feature1">
						<h2>Browse</h2>
						<p>Browse Learning Objects and pick what you want to learn.</p>
					</li>

					<li class="span4 feature feature2">
						<h2>Search</h2>
						<p>Search Learning Objects with Quick Search and Advanced Search.</p>
					</li>

					<li class="span4 feature feature3">
						<h2>Download</h2>
						<p>Download the Learning Object of your choice and start learning.</p>
					</li>		
				</ul>
			</div>
		</section>
                <div class="clearfix"></div>
            <footer id="footer-index" class="navbar navbar-inverse navbar-fixed-bottom">
                <div class="container">
                    <div>
                        Copyright &copy;2014 InformatronYX. All rights reserved.
                    </div>
                </div>
            </footer>
        </div>
        <jsp:include page="scripts.jsp" /> 
    </body>
</html>
<script src="site_js/login_signup.js" type="text/javascript"></script>


