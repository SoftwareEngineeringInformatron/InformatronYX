<%-- 
    Document   : MyLOs
    Created on : Oct 13, 2015, 2:46:06 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="MyLOs">
    <head>
       <title>InformatronYX</title> 
        
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
    </head>
    <body>
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                    <div class="row-fluid">
                        <div class="span12 header-wrap main">
                            
                            <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronYX</a>
                                        <jsp:include page="includes/ActiveAccount.jsp" /> 
                            </div>
                        </div> 
                    </div>

                    <div class="navbar-inner search-option">
                        <div class="row-fluid">
                            <div class="span10 header-wrap main one-set">      
                                <div class="span8"><h5>Learning Object</h5></div>  
                                
                                <!--<div class="span4" ><a href="${url_usermeter}" class="btn-index span9" >BACK TO METERING</a></div>-->
                                
                            </div> 
                        </div>
                    </div>
            </header>
        </div>
        <div class="clearfix"></div>
            <section id="user-charges" ng-controller="LOViewController">
                <div class="container">
                    <div class="content-row">
                        <br><h5 style="float:left">Learning Objects Owned</h5>
                        <label style="float:right">Sort by:
                            <select ng-model="sortMethod">
                                <option value="1">Name</option>
                                <option value="2">Subject</option>
                            </select>
                        </label>
                        <div class="css-history">
                            <table my-table="overrideOptions" aa-data="transaction"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>Learning Object</th>
                                    <th>Subject</th>
                                    <th>Amount Paid</th>
                                    <th>Date Paid</th>
                                    <th>O.R. Number</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr ng-if="lotransactions == 0"><td>You don't own any Learning Object!<td></tr>
                                    <tr ng-repeat="lo in ownedLOs | object2Array | orderBy:getSortMethod()">
                                        <td data-toggle="modal" data-target="#lodetails" style="cursor:pointer" ng-click="getLODetails(lo)">{{lo.title}}</td>
                                        <td>{{lo.subject}}</td>
                                        <td>{{getTransactionAmount(lo.id)}}</td>
                                        <td>{{getTransactionDate(lo.id) | date: "MMMM d yyyy"}}</td>
                                        <td>{{getTransactionOR(lo.id)}}</td>
                                    </tr>
                                </tbody>
            <!--- MODAL -->
            <div id="lodetails" class="modal hide fade" tabindex="-1" data-width="1000" >
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup"><h4 ng-model="lotitle">{{lotitle}}</h4></span>
                    </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="">
                            <div class="few-details">
                                <h5>Description:</h5> <p ng-model="lodescription">{{lodescription}}</p>
                                <h5>Price:</h5> <p ng-model="loprice">{{loprice}}</p>
                                <h5>Download:</h5> <p ng-model="lodownloads">{{lodownloads}}</p>
                                <h5>Likes:</h5> <p ng-model="lolikes">{{lolikes}}</p>                                
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
            </div>
            <!-- END OF MODAL -->
                        </table>
                    </div>
                    </div>
                </div>
            </section>
            <footer id="footer-index" class="navbar navbar-inverse navbar-fixed-bottom">
                <div class="container">
                    <div>
                        Copyright &copy;2014 Informatron Plus. All rights reserved.
                    </div>
                </div>
            </footer
                        <jsp:include page="includes/scripts.jsp" /> 
                        
                        
        <script src="js/angular.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/myLOs.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/loTransactionService.js"></script>
        <script src="site_js/services/lo-service.js"></script>
    </body>
</html>
