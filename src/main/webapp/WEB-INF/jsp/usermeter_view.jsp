<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : usernmeter_view
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="tableExample">
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
        <link rel="stylesheet" type="text/css" href="css/table-original.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <!--data-table-->
        <style type="text/css" title="currentStyle">
            @import "bootstrap-table/css/demo_page.css";
            @import "bootstrap-table/css/demo_table.css";
        </style>
    <%   
        /*String isid = (String) session.getAttribute("icms_id");
        if(session.getAttribute("USER") == null) 
                response.sendRedirect("login.action");
        else if("icms_guest".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_superadmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("superadmin.action");
        else if("icms_approveadmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("approveadmin.action");
        else if("icms_meteradmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("meteradmin.action");*/
    %> 


    </head>
    <body ng-controller="Ctrl">
    <s:url id='url_userhistory' action='userhistory'/>
    <s:url id='url_main' action='main'/>
    
    
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
                                <div class="span8"><h5>Metering View</h5></div>   
                                
                                <div class="span4" ><a href="${url_main}" class="btn-index span9" >BACK TO LEARNING OBJECTS</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="container">
                    <div class="content-row">
                        
                        
                        
                        <br>
                        <h5>Pending Charges</h5>
                        
                        <table my-table="overrideOptions"
                            aa-data="summary"
                        ao-column-defs="columnDefs" class="dataTable" width="100%"
                            >
                            <thead>
                            <tr>
                                <th>Learning Object</th>
                                <th>Subject</th>
                                <th>Date Downloaded</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </section>
            <br><br>

            <section class="account-info">
                <table class="table table-hover">        
                    <thead>
                        <th></th>
                        <th>Account Information</th>
                        <th>&nbsp;</th>
                    </thead>
                    <tbody ng-repeat="balance in userbalance">
                        <tr>
                            <td></td>
                            <td>Number of Download(s):</td>            
                            <td>{{balance.noDownloads}}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Remaining Savings:</td>            
                            <td>Php {{balance.remainingBalance}}.00</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total Balance:</td>                    
                            <td>Php {{balance.existingBalance}}.00</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Expiry Date:</td>
                            <td>{{balance.expiryDate}}</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Current Date:</td>
                            <td>{{balance.currentDate}}</td>
                        </tr>                
                        <tr>
                            <td></td>
                            <td>
                                <div align="left">
                                    
                                    <input onclick="location.href = '${url_userhistory}';" name="viewHistory" class="btn-index btn-history" type="button" value="View History" />
                                </div>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
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
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/bootstrap-select.js"></script>
    	<script src="js/bootstrap-switch.js"></script>
    	<script src="js/flatui-checkbox.js"></script>
    	<script src="js/flatui-radio.js"></script>
    	<script src="js/jquery.tagsinput.js"></script>
    	<script src="js/jquery.placeholder.js"></script>
    	<script src="js/jquery.stacktable.js"></script>
    	<script src="js/application.js"></script>
        <script src="js/original.js"></script>
    <!-- data-table -->
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        
        <script src="scripts/angular.min.js"></script>
        <script src="scripts/summaryController.js"></script>
        <script src="scripts/summary-service.js"></script>
        <script src="scripts/jquery-scripts.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        
        
    </body>
</html>

