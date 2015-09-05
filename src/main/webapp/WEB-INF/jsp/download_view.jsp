<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : download
    Revised on : September 5, 2015, 7:57:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="LO">
    <head>
        <title>Informatron Plus</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
        <meta name="HandheldFriendly" content="True" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
        
    <!--plugins-->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" media="screen"  href="bootstrap/css/bootstrap-customize.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/940grid.css" />
        <link rel="stylesheet" type="text/css" href="css/media.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        
    
    <!-- Date Picker -->
        <link href="bootstrap-formhelpers/docs/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        
    <%   
        /*String isession = (String) session.getAttribute("USER");
        String isid = (String) session.getAttribute("icms_id");
        if(isession  == null) 
                response.sendRedirect("login.action");
        */
        
        
    %>
    
    
    
    </head>
    <body ng-controller="loController" data-ng-init="learningObject(${loID})">
   
    <s:url id='url_advance' action='advancesearch'/>
    <s:url id='url_main' action='main'/>
    
        <div id="message" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Error Message</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary">&nbsp;&nbsp;Ok&nbsp;&nbsp;</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                            
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronCMS</a>

                                <div class="account" ng-controller="userController">
                                    <ul class="nav pull-right">
                                        <li class="dropdown" id="usermeter">  
                                        </li> 
                                        <li class="dropdown">
                                            <a data-toggle="dropdown" class="dropdown-toggle font-up header-txt" href="#"><b class="caret"></b> <span><i class="icon-user"></i></span></a>
                                            <ul class="dropdown-menu" id="functions" >
                                                
                                            </ul>
                                        </li>                                   
                                    </ul>
                                </div>
                            </div> 
                        </div>


                    <div class="navbar-inner search-option">
                        <div class="row-fluid">
                            <div class="span10 header-wrap main one-set">
                                <div class="span8"><h5>Download</h5></div>    
                                <div class="span4" ><a href="${url_main}" class="btn-index span9" >BACK TO LEARNING OBJECTS</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div> 
            <br><br>
            <section id="download">
                <div class="span5">
                    <div class="span5 clearfix well" ng-repeat="lo in learningObject">
                        <form class="form-horizontal" action="" method="POST"><!-- download is called here -->
                            <br><br>
                            <fieldset class="span6">

                                <div class="control-group">
                                    <label class="control-label download" for="input01">Filename :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.name}}</p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="input01">Subject :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.subject}}</p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="input01">Date Uploaded :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.dateUpload}}</p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="input01">Downloads :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.downloads}}</p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="input01">Likes :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.likes}}</p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="input01">Description :</label>
                                    <div class="controls">
                                        <p class="download-details">{{lo.description}}</p>
                                    </div>
                                </div>


                            </fieldset>
                        </form>
                        <div class="offset1 download">
                            <form method="post" action="download-specific-lo">
                                <input type="hidden" name="filename" value="{{lo.filepath}}" />
                                <input type="hidden" name="id" value="{{lo.id}}" />
                                <button type="submit" class="btn btn-primary"><i class="icon-download-alt icon-large"></i> Download</button>
                            </form>
                        </div>
                        <br>

                    </div>
                    <br><br>
                    
                    <% if(!"icms_guest".equals((String)session.getAttribute("USER"))) {%>
                    <div class="well span5 no-display" id="like">
                        You have downloaded this learning object.<br>
                        <span id="like-text"></span><br><br>
                        <div id="toLike" class="no-display">
                            <button type="button" class="offset1 btn btn-primary" ng-click="likeLO()"><span class="icon-thumbs-up" style="color: #fff"> </span> Like</button> this learning object.
                        </div>
                        <div id="toUnlike" class="no-display">
                            <button type="button" class="offset1 btn btn-primary" ng-click="unlikeLO()"><span class="icon-thumbs-down" style="color: #fff"> </span> Unlike</button> this learning object.
                        </div>
                    </div>
                    <% } %>
                    
                </div>
                <div class="graph span6">
                    <h4><img src="img/logo2-3.png"> &nbsp;&nbsp;Learning Object Review Instrument</h4>
                    
                    <br>
                    <canvas id="myChart" class="span4" width="100" height="500"></canvas>
                </div>
            </section>
            <div class="clearfix"></div>
            <section>
                <div class="row-fluid" id="comments">
                    
                    <div class="container well">
                        <h4><img src="img/logo2-3.png"> &nbsp;&nbsp;Comments</h4>
                        <div class="span6 div-comment" ng-repeat="com in comments">
                            <img class="user-icon" src="img/icon-user-small-shadow.png">
                            <div class="span8">
                                <h5>{{com.reviewer}}</h5>
                                {{com.comment}} 
                            </div>
                        </div>
                    </div>
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
        <div ng-controller="userController">
            <input type="hidden" id="usertype" value="<%// out.println(isid); %>" />
            
        </div>
        
        <script src="bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-1.9.0.min.js"></script>
    	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    	<script src="js/jquery.ui.touch-punch.min.js"></script>
        
        <!-- chart plugin -->
        <script type="text/javascript" src="js/Chart.min.js"></script>
        <script type="text/javascript" src="js/chartjs-option.js"></script>
        
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/bootstrap-select.js"></script>
    	<script src="js/bootstrap-switch.js"></script>
    	<script src="js/flatui-checkbox.js"></script>
    	<script src="js/flatui-radio.js"></script>
    	<script src="js/jquery.tagsinput.js"></script>
    	<script src="js/jquery.placeholder.js"></script>
    	<script src="js/jquery.stacktable.js"></script>
    	<script src="js/application.js"></script>
        <script src="js/jquery-scripts.js"></script>
        <script src="js/original.js"></script>
        
        
        
        <script src="scripts/angular.min.js"></script>
        <script src="scripts/loController.js"></script>
        <script src="scripts/lo-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        
        
        
        
    </body>
</html>

<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
        var str = getURLParameter("errorMessage");
        //alert(str);
        if(str != null) {
            $('.file-action').append(str);
            $('#message').modal('show');
        }
            //alert(str);
    });
    
    function getURLParameter(name) {
        return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
    }
</script>

