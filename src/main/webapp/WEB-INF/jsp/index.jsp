<%-- 
    Document   : index
    Created on : Aug 22, 2015, 12:12:55 PM
    Author     : Ted Ian Osias
--%>

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
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    
        <!--<link rel="stylesheet" href="css/slider_themes/style-slider.css" type="text/css" media="screen" />-->
        
        
    </head>
    <body>
        <div class="wrapIt">
            <header id="header-wrap">
                <div class="container">
                    <div class="navbar navbar-inverse navbar-fixed-top">
                        <div class="navbar-inner head">
                            <div class="container">
                                <div class="row-fluid">
                                    <div class="span12 header-wrap">
                                        <!--.btn-navbar is used as the toggle for collapsed navbar content -->
                                            <a class="btn btn-navbar index" data-toggle="collapse" data-target=".nav-collapse">
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                             </a>

                                             <a href="#" class="brand header-txt"><i class="icon-download-alt logo"></i> InformatronYX</a>

                                             <!-- Everything you want hidden at 940px or less, place within here -->
                                             <div class="nav-collapse collapse index">
                                                <ul class="nav pull-right index">
                                                    <li class="sign-up"><a class="btn index btn-index" href="login_signup?action=signup">Sign Up</a></li>
                                                    <li class="sign-up"><a class="btn index btn-index" href="login_signup?action=login">Login</a></li>
                                                </ul>				                   
                                            </div>
                                     </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div class="clearfix"></div>
            <section id="slide">
                <div class="row-fluid">
                    <div id="wrapper" >
                        <div class="slider-wrapper theme-default">
                            <div id="slider_now" class="nivoSlider">
                                <img src="img/toystory.jpg" data-thumb="img/toystory.jpg" alt="" />
                                <img src="img/up.jpg" data-thumb="img/up.jpg" alt=""><!-- title="This is an example of a caption" -->
                                <img src="img/walle.jpg" data-thumb="img/walle.jpg" alt="" data-transition="slideInLeft" />
                                <img src="img/nemo.jpg" data-thumb="img/nemo.jpg" alt="" title="#htmlcaption" />

                            </div>
                            <div id="htmlcaption" class="nivo-html-caption">
                                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>. 
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <div class="clearfix"></div>

            <!--<section id="feature">
                <div class="container">
                    <div class="span8">
                        <div class="row-fluid">
                            <div class="feature-caption">
                                <h1>Informatron Plus</h1>
                                <h3>Learning at its best.</h3>
                                <p>Discover a whole new eLearning experience. Play games, watch videos, listen to audio files and view interactive presentations from a wide library of educational Learning Objects.</p>
                                <h2>What is Informatron?</h2>
                                <p>Informatron Plus is the official content management system for the Learning Objects. We provide all the ready-to-download Learning Objects to our registered users.</p>
                                <p class="last">Our library of downoadable Learning objects are available to you. It’s just a click away!</p>

                                <ul class="features-ul">
                                <li><h3>Features</h3></li>
                                <li><span class="icon-ok"></span> Browse</li>
                                <li><span class="icon-ok"></span> Search</li>
                                <li><span class="icon-ok"></span> Download</li>
                            </ul>
                            </div>
                        </div>
                    </div>
                    <div class="span3 feature-img">
                        <div class="row-fluid">
                            <div class="feature-action" >
                                <div class="effect2" ><img src="img/feature-1.jpg" class="browse"></div>
                                <div class="feature-txt">
                                    <h3><span class="icon-hand-up"></span> Browse</h3>
                                    <p>Browse Learning Objects and pick what you want to learn.</p>
                                </div>
                            </div>
                            <div class="feature-action">
                                <div class="effect2" ><img src="img/feature-2.jpg" class="search"></div>
                                <div class="feature-txt">
                                    <h3><span class="icon-search"></span> Search</h3>
                                    <p>Search Learning Objects with Quick Search and Advanced Search.</p>
                                </div>
                            </div>
                            <div class="feature-action" >
                                <div class="effect2" ><img src="img/feature-3.jpg" class="download"></div>
                                <div class="feature-txt">
                                    <h3><span class="icon-download"></span> Download</h3>
                                    <p>Download the Learning Object of your choice and start learning.</p>
                                </div>
                            </div>
                            
                    </div>
                </div>
            </section>-->
            <div class="clearfix"></div>
            <section>
                <div class="row-fluid">
                    <div class="feature">
                        <div class="span7">
                            <div class="span8 feature-caption">
                                <h3><span class="icon-hand-up"></span> Browse</h3>
                                <p>Browse Learning Objects and pick what you want to learn.</p>
                            </div>
                        </div>
                        <div class="span5 feature-img">
                            <img src="img/feature-1.jpg" class="browse">
                        </div>
                    </div>
                    <div class="feature">
                        <div class="span7">
                            <div class="span8 feature-caption">
                                <h3><span class="icon-search"></span> Search</h3>
                                <p>Search Learning Objects with Quick Search and Advanced Search.</p>
                            </div>
                        </div>
                        <div class="span5 feature-img">
                            <img src="img/feature-2.jpg" class="search">
                        </div>
                    </div>
                    <div class="feature">
                        <div class="span7">
                            <div class="span8 feature-caption">
                                <h3><span class="icon-download"></span> Download</h3>
                                <p>Download the Learning Object of your choice and start learning.</p>
                            </div>
                        </div>
                        <div class="span5 feature-img">
                            <img src="img/feature-3.jpg" class="download">
                        </div>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>
            <section class="footer-top">
                <div class="container">
                    <div class="row-fluid">
                        <article class="span6 footer-article">
                            <a class="btn index btn-index" href="#responsive_signUpLight" data-toggle="modal">
                                Sign Up for CCS. It's Free!
                            </a>
                        </article>
                        <article class="span6 footer-article">
                            <span><b>Contact Us :</b> informatronyx@gmail.com</span>
                        </article>
                    </div>  
                </div>  
            </section>
            <div class="clearfix"></div>
            <footer id="footer-index">
                <div class="container">
                    <div>
                        Copyright &copy;2014 InformatronYX. All rights reserved.
                    </div>
                </div>
            </footer>
        </div>
       <jsp:include page="includes/scripts.jsp" /> 
    </body>
</html>
<script src= "site_js/index.js" type="text/javascript"></script>
