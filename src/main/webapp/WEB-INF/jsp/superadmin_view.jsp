<%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : superadmin_view
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="SuperAdmin">
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
    
        <!--data-table-->
        <style type="text/css" title="currentStyle">
            @import "bootstrap-table/css/demo_page.css";
            @import "bootstrap-table/css/demo_table.css";
        </style>
        
    <!-- Modal -->
        <link href="bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />
        
        
    </head>
    <body >
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                            <a href="main" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronCMS</a>
                                <jsp:include page="includes/ActiveAccount.jsp" /> 
                            </div>
                        </div>
                            <div class="navbar-inner search-option" ng-controller="navBarController">
                        <div class="row-fluid">
                            <div class="span10 header-wrap main one-set1">
                                <ul class="nav nav-tabs admin" id="display_account">
                                    <li><h5>ADMIN ACCOUNTS</h5> </li>
                                    <li id="allNav" class="active"><a ng-click="loadAll()" href="#" name="super-all-account">All Accounts</a></li>
                                    <li id="inactiveNav"   ><a ng-click="loadInactive()" href="#" name="super-inactive-account">Inactive Accounts</a></li>
                                    <li id="blockedNav"    ><a ng-click="loadBlocked()" href="#" name="super-blocked-account">Blocked Accounts</a></li>
                                    <li                    ><a href="#" data-toggle="modal" data-target="#addAccount" name="add-account" class="add_account"><span>ADD ACCOUNT</span></a></li>
                                </ul>  
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section ng-controller="userController" id="super-all-account" class="no-display selectedTab">
                <div  class="content-row">
                    <table  width="100%" class="table table-striped">
                            <thead class="table-header">
                            <tr>
                                <th><input type="checkbox" ng-checked="displayedUsers.length!=0 && displayedUsers.length==selectedUsers.length" 
                                           ng-click="selectAll()" id="action-checkbox-all" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Function Type</th>
                                <th>User Type</th>
                            </tr>
                            </thead>
                            <tr ng-repeat="user in displayedUsers">
                                <td><input type="checkbox" ng-checked="isSelected(user)" ng-click="changeSelected(user)"></td>
                                <td data-target="{{action}}" data-toggle="modal" ng-click="loadUser(user)">{{user.username}}</td>
                                <td data-target="{{action}}" data-toggle="modal" ng-click="loadUser(user)">{{toStringDate(user.lastLogin)}}</td>
                                <td data-target="{{action}}" data-toggle="modal" ng-click="loadUser(user)">  {{user.functionType}}</td>
                                <td data-target="{{action}}" data-toggle="modal" ng-click="loadUser(user)">{{user.userType}}</td>
                            </tr>
                        </table>
                </div>
                <br><br>
                <div class="container-fluid">
                    <button class="btn btn-primary" id="action-all" data-target="{{action}}Mass" data-toggle="modal">ACTION</button>
                    <div>
                        <h5><b>{{displayedUsers.length}} <u>Admin</u> user/s.</b></h5>
                    </div>
                </div>
                <jsp:include page="includes/superAdminModals.jsp" /> 
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
        <script src="scripts/angular.min.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/superadmin.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
    </body>
</html>
