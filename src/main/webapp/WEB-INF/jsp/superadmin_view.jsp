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
<html ng-app="Superadmin">
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
        
        <%   
        /*String isid = (String) session.getAttribute("icms_id");
        
        if(session.getAttribute("USER") == null) 
                response.sendRedirect("login.action");
        else if("icms_guest".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_user".equals((String)session.getAttribute("USER")))
            response.sendRedirect("main.action");
        else if("icms_approveadmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("approveadmin.action");
        else if("icms_meteradmin".equals((String)session.getAttribute("USER")))
            response.sendRedirect("meteradmin.action");*/
        %>
    </head>
    <body ng-controller="superadminController">
        
        <!-- Mass Super Admin Action -->
        <!-- All Account Action -->
        <div id="allAccountMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected admin account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="demoteAdmins()"><i class="icon-large icon-arrow-down default"></i> Demote Admin(s)</button>        
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#changeFunctionMassAction" data-toggle="modal" data-dismiss="modal"><i class="icon-edit icon-large default"></i> Change Admin(s) Function</button>          
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmins('super-all-account')"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Change Function Action -->
        <div id="changeFunctionMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="ftype">
                                    <option value="">--Select function type--</option>
                                    <option value="1">Approval functions</option>
                                    <option value="2">Metering functions</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="massChangeFunctionType(ftype)"><i class="icon-edit icon-large default"></i> Change Function</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Block Account Action for Inactive -->
        <div id="inactiveMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected expired account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmins('super-inactive-account')"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unblock Account Action for Blocked-->
        <div id="blockMassAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected blocked account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockAdmins()"><i class="icon-check icon-large default"></i> Unblock Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
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
        <!-- Admin Actions -->

        <!-- All Account Action -->
        <div id="allAccountAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this admin account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="demoteAdmin()"><i class="icon-large icon-arrow-down default"></i> Demote Admin</button>        
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#changeFunctionAction" data-toggle="modal" data-dismiss="modal"><i class="icon-edit icon-large default"></i> Change Admin Function</button>          
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmin()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Change Function Action -->
        <div id="changeFunctionAction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="ftype">
                                    <option value="">--Select function type--</option>
                                    <option value="1">Approval functions</option>
                                    <option value="2">Metering functions</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="changeFunctionType(ftype)"><i class="icon-edit icon-large default"></i> Change Function</button>
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
                    <span class="popup">Super Admin Action</span>
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmin()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
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
                    <span class="popup">Super Admin Action</span>
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockAdmin()"><i class="icon-check icon-large default"></i> Unblock Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Account Action -->
        <div id="addAccount" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="addAcc">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Add Account</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">Please fill in the textfields<br>
                                <br><input type="text" size="20" placeholder="First Name" required ng-model="add_fname">
                                <br><input type="text" size="20" placeholder="Last Name" required ng-model="add_lname">
                                <br><select ng-model="add_function">
                                        <option value="" selected>--Choose function type--</option>
                                        <option value="1">Approval Admin</option>
                                        <option value="2">Metering Admin</option>
                                        <option value="3">Super Administrator</option>
                                    </select>
                                <div class="divider"></div>
                                <br><input type="text" size="20" placeholder="Username" required ng-model="add_user">
                                <br><input type="password" size="20" placeholder="Password" required ng-model="add_pass">
                                <br><input type="password" size="20" placeholder="Confirm Password" required ng-model="add_conpass">
                                    <h6>Error(s)</h6>
                                    <div ng-repeat = "error in errorMessage">
			            	<p>{{error}}</p>
			            </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="addAcc.$invalid" type="button" class="btn btn-primary" ng-click="addAccount(add_fname,add_lname,add_function,add_user,add_pass,add_conpass)"><i class="icon-plus-sign-alt icon-large default"></i> Add</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel"> Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
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
                            <div class="span10 header-wrap main one-set1">
                                    <!--                  
                                <div class="navbar-search search search-account">
                                        <input name="searchName" type="text" placeholder="Search" class="input" ng-model="searchText"/>
                                        <a class="btn-index" ><i class="icon-search"></i> </a>
                                </div>--> 
                                
                                <ul class="nav nav-tabs admin" id="display_account">
                                    <li><h5>ADMIN ACCOUNTS</h5> </li>
                                    <li class="active"><a href="#" name="super-all-account">All Accounts</a></li>
                                    <li><a href="#" name="super-inactive-account">Inactive Accounts</a></li>
                                    <li><a href="#" name="super-blocked-account">Blocked Accounts</a></li>
                                    <li><a href="#" name="add-account" class="add_account"><span>ADD ACCOUNT</span></a></li>
                                </ul>  
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="super-all-account" class="no-display selectedTab">
                <div class="content-row"><!--
                    <table class="table table-hover superadmin">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="admin in siteadmin | filter:searchText">
                                <td><a href="#allAccountAction" data-toggle="modal" ng-click="setID(admin.userID)">{{admin.lName}}, {{admin.fName}}</a></td>
                                <td>{{admin.lastLogin}}</td>
                                <td>{{admin.function = checkFunction(admin.functionType)}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    <table my-table="overrideOptions"
                            aa-data="siteadmin"
                        ao-column-defs="columnDefs" class="dataTable table table-hover superadmin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-all" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-all" >ACTION</a>
            </section>
            <section id="super-blocked-account" class="no-display">
                <div class="content-row"><!--
                    <table class="table table-hover approve-admin">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="admin in blockadmin | filter:searchText">
                                <td><a href="#blockAction" data-toggle="modal" ng-click="setID(admin.userID)">{{admin.lName}}, {{admin.fName}}</a></td>
                                <td>{{admin.lastLogin}}</td>
                                <td>{{admin.function = checkFunction(admin.functionType)}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    <table my-table="overrideOptions"
                            aa-data="blockadmin"
                        ao-column-defs="columnDefsBlock" class="dataTable table table-hover superadmin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-block" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-block" >ACTION</a>
            </section>
            <section id="super-inactive-account" class="no-display">
                <div class="content-row"><!--
                    <table class="table table-hover approve-admin">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-repeat="admin in inactiveadmin | filter:searchText">
                                <td><a href="#inactiveAction" data-toggle="modal" ng-click="setID(admin.userID)">{{admin.lName}}, {{admin.fName}}</a></td>
                                <td>{{admin.lastLogin}}</td>
                                <td>{{admin.function = checkFunction(admin.functionType)}}</td>
                            </tr>
                        </tbody>
                    </table>-->
                    <table my-table="overrideOptions"
                            aa-data="inactiveadmin"
                        ao-column-defs="columnDefsInactive" class="dataTable table table-hover superadmin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="action-checkbox-inactive" title="Check All" class="" /></th>
                                <th>Name</th>
                                <th>Last Login</th>
                                <th>Admin Type</th>
                            </tr>
                            </thead>
                        </table>
                </div><br><br>
                <a href="#" class="btn btn-primary action" id="action-inactive" >ACTION</a>
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
    	<script src="js/jquery.ui.touch-punch.min.js"></script>
        
        <!-- data-table -->
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        
        
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
        <script src="scripts/superadminController.js"></script>
        <script src="scripts/superadmin-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>

        
    </body>
</html>

<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
    });

</script>
