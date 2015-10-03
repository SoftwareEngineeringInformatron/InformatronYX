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
    </head>
    <body >
        <div ng-controller="adminAccountManagementController">
        
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
                                    class="btn btn-primary" ng-click="approveMass()">
                                <i class="icon-plus-sign-alt icon-large default"></i> 
                                Accept
                            </button>
                            <button type="button" data-dismiss="modal" 
                                    class="btn btn-primary" ng-click="declineMass()">
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
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#promoteActions" data-toggle="modal" data-dismiss="modal"><i class="icon-arrow-up icon-large default"></i> Promote User(s)</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button ng-click="blockMass()"   type="button" data-dismiss="modal" class="btn btn-primary"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button ng-click="promoteMass()" type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
            </div>
        </div>
                
        <!-- Promote mass users -->
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
                                    <option value="2">Approval functions</option>
                                    <option value="3">Metering functions</option>
                                    <option value="4">Super Administrator</option>
                                </select>
                            </label>

                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="promoteMass(functiontype)"><i class="icon-plus-sign-alt icon-large default"></i> Promote Now</button>
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockMass()"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockMass()"><i class="icon-check icon-large default"></i> Unblock Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
                
        <!-- Error Action -->
        <div id="errorMessage" class="modal hide fade" tabindex="-1" data-width="760">
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

        <!-- Promote 
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
        -->
        <!-- All Account Action 
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
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#promoteAction" data-toggle="modal" data-dismiss="modal"><i class="icon-arrow-up icon-large default"></i> Promote User</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockMass()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>            
                        </div>
                    </div>
                </div>
            </div>
        </div>
-->
        <!-- New User Action 
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="approveMass()"><i class="icon-plus-sign-alt icon-large default"></i> Accept</button>
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="declineMass()"><i class="icon-minus-sign-alt icon-large default"></i> Decline</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
-->
        <!-- Block Account Action for Inactive 
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockMass()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        -->
        <!-- Unblock Account Action for Blocked
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
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockMass()"><i class="icon-check icon-large default"></i> Unblock Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        -->
        </div>
        <!-- Informatron layout -->
        <div class="wrapIt"  >
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                                <a href="home" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronCMS</a>
                                <jsp:include page="includes/ActiveAccount.jsp" /> 
                            </div> 
                        </div>
                    <div class="navbar-inner search-option" ng-cloak ng-controller="adminNavBarController">
                        <div class="row-fluid">
                            <div class="span9 header-wrap main one-set1">
                                <ul class="nav nav-tabs admin" id="display_account">
                                    <li><a  ng-click="allAccounts()" href="#all-account" name="all-account">All Accounts</a></li>
                                    <li><a ng-click="newAccounts()" name="new-account">New Account Requests</a></li>
                                    <li><a  ng-click="blockedAccounts()" name="blocked-account">Blocked Accounts</a></li>
                                    <li><a ng-click="inactiveAccounts()"  name="inactive-account">Inactive Accounts</a></li>
                                </ul>  
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section class="no-display selectedTab" ng-cloak ng-controller="adminAccountManagementController"
                     ng-init="load()">
                <div class="content-row">
                    <table my-table="overrideOptions"
                            aa-data="siteuser"
                        ao-column-defs="columnDefs" class="dataTable table table-hover approve-admin" width="100%"
                            >
                            <thead>
                            <tr>
                                <th><!--<input type="checkbox" id="action-checkbox-all" title="Check All" class="" />--></th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Last Login</th>
                                <th>Last Download</th>
                                <th>Blocked</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat = "user in displayedUsers">
                                <td><input ng-change="selectedCheck()" type="checkbox" ng-model="selectedUsers[displayedUsers.indexOf(user)]"/></td>
                                <td>{{user.firstName}} {{user.lastName}}</td>
                                <td>{{user.username}}</td>
                                <td>{{user.lastLoginString}}</td>
                                <td>{{user.lastDownloadDate}}</td>
                                <td>
                                    <b>{{user.blocked}}</b>
                                    
                                </td>
                                </tr>
                            </tbody>
                        </table>
                </div><br><br>
                <button ng-disabled="enableButton" data-target='{{buttonAction}}' data-toggle="modal" class="btn btn-primary action" id="action-all">ACTION</a>
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
        <script src="site_js/admin.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
    </body>
</html>


