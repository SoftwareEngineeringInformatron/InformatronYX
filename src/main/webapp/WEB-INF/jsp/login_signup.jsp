<%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="login_signup">
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
        
            

    </head>
    <body ng-controller="login_signupController">
        <input type="hidden" id="refreshed" value="no">
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
                                                <img src="img/informatron.png" data-thumb="img/informatron.png" alt="" title="Informatron Content Management System"/>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                        </div>
                        <div class="span5">
                            <div><a href="#" class="brand header-txt"><i class="icon-download-alt logo"></i> InformatronPlus</a></div>
                            <form class="form form-control">
                                <div class="login">
                                    <div class="divider"></div>
                                    <div class="clearfix"></div>
                                    <div class="divider"></div>
                                    <input ng-model="userInfo.username" name="username" type="text" size="20" placeholder="Username" title="Username" required>
                                    <br><input ng-model="userInfo.password" name="password" type="password" size="20" placeholder="Password" title="Password" required>
                                    <div class="divider"></div>
                                    <div class="clearfix"></div>
                                    <div class="divider"></div>
                                    <button ng-click="login()" type="submit" class="btn btn-primary" data-dismiss="modal"> Login </button>&nbsp;
                                    <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
                                    <a href="#" class="a_login"> Sign Up</a>
                                </div>
                            </form>
                            <div class="signup no-display">
                                <label class="file-action">Please fill in the textfields
                                <br><input ng-model="userInfo.firstName" name="fname" type="text" size="20" placeholder="First Name" title="First Name" required>
                                <br><input ng-model="userInfo.lastName" name="lname" type="text" size="20" placeholder="Last Name" title="Last Name" required>
                                <input ng-model="userInfo.email" name="email" type="text" size="20" placeholder="Email Address" title="Email Address" required id="email">
                                <br>&nbsp;&nbsp; <span class="error_message_1"></span>
                                <br>&nbsp;&nbsp; <span class="error_message"></span>
                                <input ng-model="userInfo.username" name="uname" type="text" size="20" placeholder="Username" title="Username" required>
                                <br><input ng-model="userInfo.password" name="pword" id="a_pass" type="password" size="20" placeholder="Password" title="Password" required>
                                <br><input ng-model="confirmPassword" name="conpword" id="a_conpass" type="password" size="20" placeholder="Confirm Password" title="Confirm Password" required>
                                <div class="divider"></div>
                                <button ng-click="signup()" type="submit" class="btn btn-primary" data-dismiss="modal" id="btn-signup"> Sign Up </button>&nbsp;
                                <button type="reset" class="btn btn-cancel" data-dismiss="modal"> Clear </button>&nbsp;&nbsp;&nbsp;
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
						<h2>What is <span>InformatronPlus?<span></h2>
						<p>Informatron Plus is the official content management system for the Learning Objects. We provide all the ready-to-download Learning Objects to our registered users.</p>
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
                        Copyright &copy;2014 Informatron Plus. All rights reserved.
                    </div>
                </div>
            </footer>
        </div>

        <jsp:include page="includes/scripts.jsp" />
        <!--
        <script src="bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-1.9.0.min.js"></script>
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="js/jquery.stacktable.js"></script>
        <script src="js/application.js"></script>
        <script src="js/original.js"></script>-->
        
        <!-- slider js plugin -->
        <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
        
        

        
    </body>
</html>
<script src="js/angular.js"> </script> 
<script src="site_js/ngStorage.js" type="text/javascript"></script>
<script src="site_js/page/login_signup.js" type="text/javascript"></script>
<script src="site_js/services/userService.js" type="text/javascript"></script>



