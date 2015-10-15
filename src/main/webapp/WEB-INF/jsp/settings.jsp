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
<html ng-app="Settings">
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
    </head>
    <body >
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                                
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronCMS</a>
                                <jsp:include page="includes/ActiveAccount.jsp" /> 
                                
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
            <section id="user-charges" ng-controller="UpdateController">
                <!-- ErrorMessage -->
                <div id="error" class="modal  fade" tabindex="-1" data-width="760">
                    <form name="saveData">
                        <div class="modal-center">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <span class="popup">Message</span>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="row-fluid">
                                        <div class="span10 offset1">
                                            <label class="file-action" id="errorMessage">
                                            </label>
                                        </div>
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
                    </form>
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
                                        <button ng-disabled="editPass.$invalid" type="button" class="btn btn-primary" data-dismiss="modal" ng-click="changePassword(password, newpass, conpass)"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                        <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Save Action 1-->
                <div id="saveAction1" class="modal hide fade" tabindex="-1" data-width="760">
                    <form name="saveData">
                        <div class="modal-center">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <span class="popup">Settings</span>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span10 offset1">
                                        <label class="text-info">Number of tries left {{numTries}}</label>
                                        <label class="file-action">Please input old username and old password for authentication<br>
                                        <br><input ng-disabled="numTries == 0" type="text" size="20" placeholder="Username" ng-model="a_username" required>
                                        <br><input ng-disabled="numTries == 0" type="password" size="20" placeholder="Password" ng-model="a_password" required>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="row-fluid">
                                    <div class="span10 offset1">
                                        <button ng-click="saveAccount(a_username,a_password)" ng-disabled="numTries == 0" type="submit" class="btn btn-primary" ng-click="saveAccount(a_username, a_password)" data-dismiss="modal"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                        <button type="reset" data-dismiss="modal" class="btn btn-cancel" ng-click="cancelAccount()"></i> Cancel</button>

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
                                        <label class="text-info">Number of tries left {{numTries}}</label>
                                        <label class="file-action">Please input username and password for authentication<br>
                                        <br><input ng-disabled="numTries == 0" type="text" size="20" placeholder="Username" ng-model="a_username" required>
                                        <br><input ng-disabled="numTries == 0" type="password" size="20" placeholder="Password" ng-model="a_password" required>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="row-fluid">
                                    <div class="span10 offset1">
                                        <button ng-disabled="numTries == 0" type="submit" class="btn btn-primary" ng-click="saveAccount(a_username, a_password)" data-dismiss="modal"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                        <button type="reset" data-dismiss="modal" class="btn btn-cancel" ng-click="cancelAccount()"></i> Cancel</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!--  Request Credits -->
                <div id="saveAction1" class="modal hide fade" tabindex="-1" data-width="760">
                    <form name="saveData">
                        <div class="modal-center">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <span class="popup">Settings</span>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span10 offset1">
                                        <label class="text-info">Number of tries left {{numTries}}</label>
                                        <label class="file-action">Please input old username and old password for authentication<br>
                                        <br><input ng-disabled="numTries == 0" type="text" size="20" placeholder="Username" ng-model="a_username" required>
                                        <br><input ng-disabled="numTries == 0" type="password" size="20" placeholder="Password" ng-model="a_password" required>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="row-fluid">
                                    <div class="span10 offset1">
                                        <button ng-click="saveAccount(a_username,a_password)" ng-disabled="numTries == 0" type="submit" class="btn btn-primary" ng-click="saveAccount(a_username, a_password)" data-dismiss="modal"><i class="icon-plus-sign-alt icon-large default"></i> Save Now</button>
                                        <button type="reset" data-dismiss="modal" class="btn btn-cancel" ng-click="cancelAccount()"></i> Cancel</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
                
                
                
                <div class="container">
                    <div class="setting span6 offset3">
                        <div class="account-setting name-setting " >
                            <div class="bg-info">
                                <p ng-if="errorList.length > 0">Error(s):</p>
                                <ul >
                                    <li class="text-error" ng-repeat="error in errorList">{{error}}</li>
                                </ul>
                            </div>
                            <form name="accountEdit">
                                <h4>User Information</h4><hr>
                                <label for="firstName" class="input-label">First Name</label>
                                <input type="text" ng-change="change()" ng-model="displayUser.firstName" size="30" required id="firstName">
                                <p ng-if="firstNameChanged" class="text-warning"><i>Changed</i></p>
                                
                                <label for="lastName" class="input-label">Last Name</label>
                                <input type="text" ng-change="change()" ng-model="displayUser.lastName" size="30" required id="lastName">
                                <p ng-if="lastNameChanged" class="text-warning"><i>Changed</i></p>
                                
                                <label for="emailAddress" class="input-label">Email Address</label>
                                <div><input type="email" ng-change="change()" ng-model="displayUser.email" size="30" required id="emailAddress"></div>
                                <p ng-if="emailChanged" class="text-warning"><i>Changed</i></p>
                                <hr>
                                <div class="setting-action offset4">
                                    <button type="submit" ng-disabled="!enableSave()" class="btn btn-approve" href="#saveAction" data-toggle="modal">Save</button>
                                </div>
                            </form>
                        </div>
                        <div class="account-setting user-setting" >     
                            <h4>Login Information</h4><hr>
                            <form name="usernameEdit">
                                <div class="input-label">Username</div>
                                <div><input ng-change="change()" type="text" size="20" ng-model="displayUser.username" required>
                                </div>
                                <div class=""><button class="btn btn-approve" href="#editPassword" data-toggle="modal"><i class="icon-edit icon-large default" ></i> Edit Password</button></div>
                                <hr>
                                <div class="setting-action offset3">
                                    <button ng-disabled="!enableSave2()" class="btn btn-approve" href="#saveAction1" data-toggle="modal">Save</button>
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
        
        <jsp:include page="includes/scripts.jsp" /> 
        
        <script src="scripts/angular.min.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/settings.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/creditService.js"></script>
    </body>
</html>

<script type="text/javascript">
</script>

