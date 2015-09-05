<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : adminmeter_view
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="Admin">
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
    
    <%   /*
        String isid = (String) session.getAttribute("icms_id");
        
        if(session.getAttribute("USER") == null) 
                response.sendRedirect("login.action");
        else if("icms_guest".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_user".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_approveadmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("approveadmin.action");*/
        %>    
    </head>
    <body ng-controller="meteringController">
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
        
        
        <!-- Metering Action -->
        <div id="payCharges" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="metering">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Metering Action</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">
                                    <div>{{setName}}</div>
                                    <div>Amount to pay: Php {{setBalance}}.00</div><br/>
                                    <input type="text" size="20" placeholder="Amount paid" ng-model="userpayment" required/>
                                    <input type="text" size="20" placeholder="O.R. number" ng-model="userreceipt" required/>
                                </label>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="metering.$invalid" type="button" data-dismiss="modal" class="btn btn-primary" ng-click="submitRequest(userpayment, userreceipt)"><i class="icon-plus-sign-alt icon-large default"></i> Submit</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                                <input type="hidden" id="selectedIndex" name="index" value="0"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <s:url id='url_adminhistory' action='adminhistory'/>
        
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
                                <div class="span6"><h5>Metering View</h5></div> 
                                <div class="navbar-search search admin-meter">
                                        <input name="searchName" type="text" placeholder="Search" class="input" ng-model="searchText"/>
                                        <a class="btn-index" ><i class="icon-search"></i> </a>
                                </div>
                                <div class="span3" >
                                    
                                    <a href="${url_adminhistory}" class="btn-index span9" >VIEW HISTORY</a>
                                </div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="content-row">
                    <table class="table table-hover meter-admin">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Amount to pay</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="users in balance | filter:searchText">
                                <td><a href="#payCharges" data-toggle="modal" ng-click="setID(users.userID, users.userName, users.existingBalance)">{{users.userName}}</a></td>
                                <td>{{users.existingBalance}}.00</td>
                            </tr>
                        </tbody>
                    </table>
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

        <script src="scripts/angular.min.js"></script>
        <script src="scripts/adminController.js"></script>
        <script src="scripts/admin-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
    </body>
</html>

<script type="text/javascript">
</script>
