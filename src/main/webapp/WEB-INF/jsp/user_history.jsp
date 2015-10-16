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
<html ng-app="UserHistory">
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
                    </div>

                    <div class="navbar-inner search-option">
                        <div class="row-fluid">
                            <div class="span10 header-wrap main one-set">      
                                <div class="span8"><h5>Transactions and History View</h5></div>  
                                
                                <div class="span4" ><a href="admin_meter" class="btn-index span9" >BACK TO METERING</a></div>
                            </div> 
                        </div>
                    </div>

            </header>
                </div>
            <div class="clearfix"></div>
            <section id="user-charges" ng-controller="userHistory">
                <div class="container">
                    <div class="content-row">
                        <br><h5>Transaction Log</h5>
                        <div class="css-history">
                            <table my-table="overrideOptions" aa-data="transaction"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>Transaction ID</th>
                                    <th>User ID</th>
                                    <th>Amount Paid</th>
                                    <th>Date Paid</th>
                                    <th>O.R. number</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr ng-if="lotransactions == 0"><td>User has no transactions!<td></tr>
                                    <tr ng-repeat="trans in lotransactions">
                                        <td>{{trans.lo_id}}</td>
                                        <td>{{trans.u_Id}}</td>
                                        <td>{{trans.amount}}</td>
                                        <td>{{trans.dateOfTransaction | date: "MMMM d yyyy"}}</td>
                                        <td>{{trans.officialReceipt}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br><br>
                        <h5>History of All Downloads</h5>
                        <div class="css-history">
                            <table my-table="overrideOptions" aa-data="summaryall"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>Learning Object</th>
                                    <th>Subject</th>
                                    <th>Date Downloaded</th>
                                </tr>
                                </thead
                                <tbody>
                                    <tr ng-if="userdownloads == 0"><td>User has no downloads!<td></tr>
                                    <tr ng-repeat="trans in userdownloads">
                                        <td>{{getLOTitleById(trans.learningObjectId)}}</td>
                                        <td>{{getLOSubjectById(trans.learningObjectId)}}</td>
                                        <td>{{trans.dateDownload | date: "MMMM d yyyy"}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                </div>
            </section>
            <br><br>
            <div class="clearfix"></div>
            <footer id="footer-index" class="navbar navbar-inverse navbar-fixed-bottom">
                <div class="container">
                    <div>
                        Copyright &copy;2014 Informatron Plus. All rights reserved.
                    </div>
                </div>
            </footer>
        <div >
            <input type="hidden" id="usertype" value="<% //out.println(isid); %>" />
        </div>
        
                
        <jsp:include page="includes/scripts.jsp" /> 
        <!--
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
    <!-- data-table
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        -->

        <script src="js/angular.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/userHistory.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/loTransactionService.js"></script>
        <script src="site_js/services/lo-service.js"></script>
        <script src="site_js/services/downloadRecordService.js"></script>
        <script src="site_js/services/creditService.js"></script>
    </body>
</html>
