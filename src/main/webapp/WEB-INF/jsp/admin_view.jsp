<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : admin_view
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
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/940grid.css" />
    <!-- original customized css -->
        <link rel="stylesheet" type="text/css" href="css/media.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        
        
        <!--data-table-->
        <style type="text/css" title="currentStyle">
            @import "bootstrap-table/css/demo_page.css";
            @import "bootstrap-table/css/demo_table.css";
        </style>

    <!-- Modal -->
        <link href="bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        
    <%   
        /*String isid = (String) session.getAttribute("icms_id");
        
        if(session.getAttribute("USER") == null) 
                response.sendRedirect("login.action");
        else if("icms_guest".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_user".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_meteradmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("meteradmin.action");*/
    %>    
    </head>
    <body ng-controller="adminController">
        <s:url id='url_main' action='main'/>
        
        <!-- New User MASS Action -->
        <div id="newUserMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected account request(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" 
                                    class="btn btn-primary" ng-click="acceptUsers()">
                                <i class="icon-plus-sign-alt icon-large default"></i> 
                                Accept
                            </button>
                            <button type="button" data-dismiss="modal" 
                                    class="btn btn-primary" ng-click="declineUsers()">
                                <i class="icon-minus-sign-alt icon-large default"></i> 
                                Decline
                            </button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"> 
                                Cancel
                            </button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- all user mass action -->
        <div id="allAccountMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">File Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with selected account(s)?</label>
                        </div>
                    </div>
                </div>
                <% 
                if("icms_superadmin".equals((String)session.getAttribute("USER"))) { %>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#promoteActions" data-toggle="modal" data-dismiss="modal"><i class="icon-arrow-up icon-large default"></i> Promote User(s)</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
                <% } %>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockUsers('all-account')"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
        <!-- Promote users -->
        <div id="promoteActions" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="functiontype">
                                    <option value="1">Approval functions</option>
                                    <option value="2">Metering functions</option>
                                    <option value="3">Super Administrator</option>
                                </select>
                            </label>

                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="promoteUsers(functiontype)"><i class="icon-plus-sign-alt icon-large default"></i> Promote Now</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
                
        <!-- Block Account Action for Inactive Accounts -->
        <div id="inactiveMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this expired account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockUsers('inactive-account')"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unblock Account Action for Blocked Accounts-->
        <div id="blockMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this blocked account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockUsers()"><i class="icon-check icon-large default"></i> Unblock Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
                
                
                
                
                
                
                
        <!-- Admin Actions -->
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
        

        <!-- Promote -->
        <div id="promoteAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="functiontype">
                                    <option value="1">Approval functions</option>
                                    <option value="2">Metering functions</option>
                                    <option value="3">Super Administrator</option>
                                </select>
                            </label>

                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="promoteUser(functiontype)"><i class="icon-plus-sign-alt icon-large default"></i> Promote Now</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- All Account Action -->
        <div id="allAccountAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">File Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this user account?</label>
                        </div>
                    </div>
                </div>
                <% if((String)session.getAttribute("USER") == "icms_superadmin") { %>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#promoteAction" data-toggle="modal" data-dismiss="modal"><i class="icon-arrow-up icon-large default"></i> Promote User</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
                <% } %>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockUser()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- New User Action -->
        <div id="newUserAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this account request?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="acceptUser()"><i class="icon-plus-sign-alt icon-large default"></i> Accept</button>
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="declineUser()"><i class="icon-minus-sign-alt icon-large default"></i> Decline</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Block Account Action for Inactive -->
        <div id="inactiveAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this expired account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockUser()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unblock Account Action for Blocked-->
        <div id="blockAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this blocked account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockUser()"><i class="icon-check icon-large default"></i> Unblock Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Informatron layout -->
        <div class="wrapIt" >
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
                            <div class="span9 header-wrap main one-set1">
                                <!--                      
                                <div class="navbar-search search search-account">
                                        <input name="searchName" type="text" placeholder="Search" class="input" ng-model="searchText"/>
                                        <a class="btn-index" ><i class="icon-search"></i> </a>
                                </div> -->
                                <ul class="nav nav-tabs admin" id="display_account">
                                    <li class="active"><a href="#" name="all-account">All Accounts</a></li>
                                    <li><a href="#" name="new-account">New Account Requests</a></li>
                                    <li><a href="#" name="inactive-account">Inactive Accounts</a></li>
                                    <li><a href="#" name="blocked-account">Blocked Accounts</a></li>
                                </ul>  
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="all-account" class="no-display selectedTab">
                <div class="content-row">
                    <table my-table="overrideOptions"
                            aa-data="siteuser"
                        ao-column-defs="columnDefs" class="dataTable table table-hover approve-admin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-all" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                                
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-all">ACTION</a>
            </section>
            <section id="new-account" class="no-display">
                <div class="content-row"><!--
                    <table class="table table-hover approve-admin">
                        <thead>
                            <tr>
                                <th><a href="#newUserMassAction" data-toggle="modal" class="">ACTION</a></th>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="users in newuser.newuser | filter:searchText">
                                <td><input type="checkbox" id="{{users.newUserID}}" class="approve-user-id"></td>
                                <td><a href="#newUserAction" data-toggle="modal" ng-click="setID(users.newUserID)">{{users.lName}}, {{users.fName}}</a></td>
                                <td>{{users.email}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    
                    <table my-table="overrideOptions"
                            aa-data="newuser"
                        ao-column-defs="columnDefsNewUser" class="dataTable table table-hover approve-admin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-new" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Email</th>
                                
                            </tr>
                            </thead>
                        </table>
                    
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-new" >ACTION</a>
            </section>
            <section id="blocked-account" class="no-display">
                <div class="content-row">
                    <!--<table class="table table-hover approve-admin">
                        <thead>
                            <tr>
                                <th><a href="#newUserMassAction" data-toggle="modal" class="">ACTION</a></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="users in blockuser.blockuser | filter:searchText">
                                <td><input type="checkbox" id="{{users.newUserID}}" class="approve-user-id"></td>
                                <td><a href="#inactiveAction" data-toggle="modal" ng-click="setID(users.userID)">{{users.lName}}, {{users.fName}}</a></td>
                                <td>{{users.lastLogin}}</td>
                                <td>{{users.lastDownload}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    <table my-table="overrideOptions"
                            aa-data="blockuser"
                        ao-column-defs="columnDefsBlock" class="dataTable table table-hover approve-admin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-block" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                                
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-block">ACTION</a>
            </section>
            <section id="inactive-account" class="no-display">
                <div class="content-row">
                    <!--<table class="table table-hover approve-admin">
                        <thead>
                            <tr>
                                <th><a href="#newUserMassAction" data-toggle="modal" class="">ACTION</a></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="users in inactiveuser.inactiveuser | filter:searchText">
                                <td><input type="checkbox" id="{{users.newUserID}}" class="approve-user-id"></td>
                                <td><a href="#blockAction" data-toggle="modal" ng-click="setID(users.userID)">{{users.lName}}, {{users.fName}}</a></td>
                                <td>{{users.lastLogin}}</td>
                                <td>{{users.lastDownload}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    <table my-table="overrideOptions"
                            aa-data="inactiveuser"
                        ao-column-defs="columnDefsInactive" class="dataTable table table-hover approve-admin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-inactive" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                                
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-inactive">ACTION</a>
                
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
            <input type="hidden" id="usertype" value="<% //out.println(isid); %>" />
        </div>
        
        <script src="bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-1.9.0.min.js"></script>
    	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        
        <!-- data-table -->
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        
        
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
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        <script src="scripts/adminController.js"></script>
        <script src="scripts/admin-service.js"></script>

        
    </body>
</html>


