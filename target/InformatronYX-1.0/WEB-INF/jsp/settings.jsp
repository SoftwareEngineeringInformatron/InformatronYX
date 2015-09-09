<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : settings
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="User">
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
            */
        
    %>  
    </head>
    <body ng-controller="userController">
    <s:url id='url_main' action='main'/>
    
        <!-- ErrorMessage -->
        <div id="message" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Message</span>
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
    
        <!-- Edit Password -->
        <div id="editPassword" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="editPass">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Edit Password</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">
                                <br><input type="password" size="20" placeholder="Old Password" required ng-model="password">
                                <br><input type="password" size="20" placeholder="New Password" required ng-model="newpass">
                                <br><input type="password" size="20" placeholder="Confirm Password" required ng-model="conpass">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="editPass.$invalid" type="button" class="btn btn-primary" onclick="" data-dismiss="modal" ng-click="updatePassword(password, newpass, conpass)"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                                <input type="hidden" id="selectedIndex" name="index" value="0"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Save Action -->
        <div id="saveAction" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="saveData">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Settings</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">Please input username and password for authentication<br>
                                <br><input type="text" size="20" placeholder="Username" ng-model="a_username" required>
                                <br><input type="password" size="20" placeholder="Password" ng-model="a_password" required>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="saveData.$invalid" type="reset" class="btn btn-primary" ng-click="saveAccount(a_username, a_password)" data-dismiss="modal"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel" ng-click="cancelAccount()"></i> Cancel</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- Save Action1 -->
        <div id="saveAction1" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="saveUser">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Settings</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">Please input old username and password for authentication<br>
                                <br><input type="text" size="20" placeholder="Username" ng-model="u_username" required>
                                <br><input type="password" size="20" placeholder="Password" ng-model="u_password" required>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="saveUser.$invalid" type="reset" class="btn btn-primary"  data-dismiss="modal" ng-click="saveUsername(u_username, u_password)"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel" ng-click="cancelAccount()"></i> Cancel</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
                                <div class="span8"><h5>SETTINGS</h5></div>                                                            
                                <div class="span4" ><a href="${url_main}" class="btn-index span9" >BACK TO LEARNING OBJECT</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="container">
                    <div class="setting span6 offset3">
                        &nbsp;&nbsp;&nbsp;<h5>{{errorsettings}}</h5>
                        <div class="account-setting name-setting txt-disabled" ng-repeat="acc in account">
                            <form name="accountEdit">
                                <div class="edit name-setting"><button class="btn btn-index btn-edit" ng-click="editAccount('name-setting')"><i class="icon-edit icon-large default"></i> Edit</button></div>
                                <div class="input-label">First Name</div>
                                <div><input type="text" ng-model="acc.fName" size="20" disabled required></div>
                                <div class="input-label">Last Name</div>
                                <div><input type="text" ng-model="acc.lName" size="20" disabled required></div>
                                <div class="input-label">Email Address</div>
                                <div><input type="text" ng-model="acc.email" size="20" disabled required></div>
                                <input type="hidden" ng-model="str" value="name-setting">

                                <div class="setting-action offset3">
                                    <button ng-disabled="accountEdit.$invalid" class="btn btn-approve" href="#saveAction" ng-click="upateAccount(acc.fName, acc.lName, acc.email)">Save</button>
                                    <button type="button" class="btn btn-cancel btn-edit-cancel" ng-click="cancelAccount()">Cancel</button>
                                </div>
                            </form>
                        </div>
                        <div class="account-setting user-setting txt-disabled" ng-repeat="acc in account">     
                            <form name="usernameEdit">
                                <div class="edit user-setting"><button class="btn btn-index btn-edit" ng-click="editAccount('user-setting')"><i class="icon-edit icon-large default"></i> Edit</button></div>                 
                                <div class="input-label">Username</div>
                                <div><input type="text" size="20" ng-model="acc.username" disabled required></div>
                                <div class=""><button class="btn btn-approve" href="#editPassword" data-toggle="modal"><i class="icon-edit icon-large default" ></i> Edit Password</button></div>
                                <div class="setting-action offset3">
                                    <button ng-disabled="usernameEdit.$invalid" class="btn btn-approve" href="#saveAction" ng-click="updateUsername(acc.username)">Save</button>
                                    <button class="btn btn-cancel btn-edit-cancel" ng-click="cancelAccount()">Cancel</button>
                                </div>
                            </form>

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
            <input type="hidden" id="usertype" value="<% //out.println(isid); %>" />
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
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
    </body>
</html>

<script type="text/javascript">
</script>

