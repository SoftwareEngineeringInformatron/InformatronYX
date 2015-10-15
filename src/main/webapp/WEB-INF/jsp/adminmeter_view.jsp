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
    </head>
    <body >
        <div id="message" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Error Message</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action" id="errorMessage">
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
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronYX</a>
                                <jsp:include page="includes/ActiveAccount.jsp" /> 
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
                                <div class="span3" ng-controller="viewController">
                                    <a ng-href="#" class="btn-index span4" ng-click="switchOn()">CREDIT</a>
                                    <a ng-href="#" class="btn-index span8" ng-click="switchOff()">Learning Object</a>
                                </div>
                                
                            </div> 
                        </div>
                    </div>
 
                </div>
            </header>
            <div class="clearfix" ></div>
            <section id="user-charges" ng-controller="meterController" >
                <div class="content-row" ng-show="switchView" >
                    <table class="table table-hover meter-admin ">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Amount Issued</th>
                                <th>Receipt</th>
                                <th> <div  class="text-center">Approve</div></th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr ng-if="transactions.length == 0">
                                <td><h3>There no pending credit transactions that needs approval.</h3></td>
                            </tr>
                            <tr ng-repeat="trans in transactions" ng-if="trans.ok == false">
                                <td></td>
                                <td><a href="#payCharges" data-toggle="modal">{{getUserNameById(trans.u_ID)}}</a></td>
                                <td>{{trans.amnt}}</td>
                                <td>{{trans.or}}</td>
                                <td>
                                    <div class="text-center">
                                        <button  ng-click="loadTransaction(trans)" class="btn" data-toggle="modal" data-target="#approveAction"> Approve </button>
                                        <!--<button  ng-click="loadTransaction(trans)" class="btn" data-toggle="modal" data-target="#declineAction"> Decline </button>-->
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- LOs view -->
                <div class="content-row" ng-hide="switchView" >
                    <table class="table table-hover meter-admin" >
                        <thead>
                            <tr>
                                <th></th>
                                <th>UserName</th>
                                <th>LO</th>
                                <th>Amount</th>
                                <th>Date Purchased</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="trans in lotransactions">
                                <td></td>
                                <td><a href="#payCharges" data-toggle="modal">{{getUserNameById(trans.u_Id)}}</a></td>
                                <td>{{getLOById(trans.lo_id)}}</td>
                                <td>{{trans.amount}}</td>
                                <td>{{trans.dateOfTransaction | date: "MMMM d yyyy"}}</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Approve Action -->
                <div id="approveAction" class="modal hide fade" tabindex="-1" data-width="760">
                    <div class="modal-center">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="popup">Approve Transaction</span>
                        </div>
                        <div class="modal-body">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <label class="file-action">
                                        Are you sure you want to <b>approve</b> this transaction?
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <button ng-click="approveTransaction(currentTransaction)" type="button"  class="btn btn-success">&nbsp;&nbsp;CONFIRM&nbsp;&nbsp;</button>
                                    <button type="button" data-dismiss="modal" class="btn btn-danger">&nbsp;&nbsp;DECLINE&nbsp;&nbsp;</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Decline Action -->
                <div id="declineAction" class="modal hide fade" tabindex="-1" data-width="760">
                    <div class="modal-center">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="popup">Decline Transaction</span>
                        </div>
                        <div class="modal-body">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <label class="file-action">
                                        Are you sure you want to <b>decline</b> this transaction?
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <button ng-click="declineTransaction(currentTransaction)" type="button"  class="btn btn-success">&nbsp;&nbsp;CONFIRM&nbsp;&nbsp;</button>
                                    <button type="button" data-dismiss="modal" class="btn btn-danger">&nbsp;&nbsp;DECLINE&nbsp;&nbsp;</button>
                                </div>
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
        <div >
            <input type="hidden" id="usertype" value="<%// out.println(isid); %>" />
        </div>
        <jsp:include page="includes/scripts.jsp" /> 

        <script src="js/angular.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/adminMeter.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/creditService.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/loTransactionService.js"></script>
        <script src="site_js/services/lo-service.js"></script>
        <script src="site_js/services/creditService.js"></script>
    </body>
</html>