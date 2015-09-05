<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : admin_history
    Revised on : September 5, 2015, 2:44:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="tableExample">
    <head>
        <title>Informatron Plus</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
        <meta name="HandheldFriendly" content="True" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <!--slider ccs plugin-->
        <link rel="stylesheet" href="css/slider_themes/default/default.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/light/light.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/dark/dark.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/bar/bar.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/slider_themes/nivo-slider.css" type="text/css" media="screen" />
        
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
        
        <!-- Date Picker -->
        <link href="bootstrap-formhelpers/docs/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        
        <%   
/*        String isid = (String) session.getAttribute("icms_id");
        
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
    <body>
    <s:url id='url_meteradmin' action='meteradmin'/>
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
                            <div class="span10 header-wrap main one-set">      
                                <div class="span8"><h5>Transactions and History View</h5></div>                                                            
                                <div class="span4" ><a href="${url_meteradmin}" class="btn-index span9" >BACK TO METERING</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="meter-settings">
                <div class="container">
                    <div class="span6">
                    <h5>Summary of Receivable Amount</h5>
                    <div id="amount-summary" class="row-fluid" ng-controller="adminTransactionController">
                        <div class="span3">
                                Amount
                        </div>
                        <div class="span2" >
                            <input name="amount" type="text" class="input-medium" readonly ng-model="receivable">
                        </div>
                    </div>
                    
                    
                    <h5>Summary of Collected Amounts</h5>
                    <div id="amount-summary" class="row-fluid" ng-controller="adminTransactionController">
                        <div class="span3">
                                From
                        </div>
                        <div class="" >
                            <div class="controls date">
                                <div class="bfh-datepicker" data-format="y-m-d" data-date="2013-01-01">
                                    <div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                        <input name="dateFrom" type="text" class="input-medium" readonly ng-model="dateStart">
                                    </div>

                                    <div class="bfh-datepicker-calendar">
                                        <table class="calendar table table-bordered">
                                            <thead>
                                                <tr class="months-header">
                                                    <th class="month" colspan="4">
                                                        <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
                                                        <span></span>
                                                        <a class="next" href="#"><i class="icon-chevron-right"></i></a>
                                                    </th>

                                                    <th class="year" colspan="3">
                                                        <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
                                                        <span></span>
                                                        <a class="next" href="#"><i class="icon-chevron-right"></i></a>
                                                    </th>
                                                </tr>
                                                <tr class="days-header"></tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>

                        <div class="span3">
                                To
                        </div>
                        <div class="">
                            <div class="controls">
                                <div class="bfh-datepicker" data-format="y-m-d" data-date="2013-01-11">
                                    <div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                        <input name="dateTo" type="text" class="input-medium" readonly ng-model="dateEnd">
                                    </div>

                                    <div class="bfh-datepicker-calendar">
                                        <table class="calendar table table-bordered">
                                            <thead>
                                                <tr class="months-header">
                                                    <th class="month" colspan="4">
                                                        <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
                                                        <span></span>
                                                        <a class="next" href="#"><i class="icon-chevron-right"></i></a>
                                                    </th>

                                                    <th class="year" colspan="3">
                                                        <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
                                                        <span></span>
                                                        <a class="next" href="#"><i class="icon-chevron-right"></i></a>
                                                    </th>
                                                </tr>
                                                <tr class="days-header"></tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <div>
                            <div class="span3">
                                <button type="submit" class="btn btn-primary" ng-click="subTotal(dateStart, dateEnd)">Submit</button>
                            </div>
                            <input name="amount" type="text" class="input-medium" readonly ng-model="totalamount">
                        </div>
                    </div>
                    </div>
                    <div class="span6" >
                        <h5>LO Price</h5>
                        
                            
                       <div id="amount-summary" class="row-fluid" ng-controller="adminTransactionController">
                            <div class="span3">
                                    Current price
                            </div>
                            <div class="span8 priceoflo" >
                                <input name="amount" type="text" class="input-medium" disabled ng-model="price">
                                <div class="lo-buttons" id="lo-change">
                                    <button id="changelo" type="button" class="btn btn-primary">Change LO Price</button>
                                </div>
                                <div class="lo-buttons no-display" id="lo-update">
                                    <button id="updateprice" type="button" class="btn btn-primary" ng-click="updateloPrice(price)">Update</button>
                                    <button id="cancelprice" type="button" class="btn btn-primary">Cancel</button>
                                </div>
                            </div>
                        </div>
                        <h5>User Maximum Download</h5>
                        <div id="amount-summary" class="row-fluid" ng-controller="adminTransactionController">
                            <div class="span3">
                                    Current Maximum Download   
                            </div>
                            <div class="span8 usermaxdownload" >
                                <input name="amount" type="text" class="input-medium" disabled ng-model="maxdownload">
                                <div class="lo-buttons" id="max-change">
                                    <button id="changemax" type="button" class="btn btn-primary">Change Maximum Download</button>
                                </div>
                                <div class="lo-buttons no-display" id="max-update">
                                    <button id="updatemax" type="button" class="btn btn-primary" ng-click="updatemaxDownload(maxdownload)">Update</button>
                                    <button id="cancelmax" type="button" class="btn btn-primary">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="container">
                    
                    
                    
                    <div class="content-row">
                        <br><h5>Transaction Log</h5>
                        
                        <div ng-controller="adminTransactionController">
                            <table my-table="overrideOptions" aa-data="transactionadmin"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Transaction ID</th>
                                    <th>Amount Paid</th>
                                    <th>Date Paid</th>
                                    <th>O.R. number</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        
                        <br>
                        <hr class="css-history" />
                        <br>
                        <h5>History of Unpaid Downloads</h5>
                        
                        <div ng-controller="adminSummaryController">
                            <table my-table="overrideOptions" aa-data="adminsummary"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Learning Object</th>
                                    <th>Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Date Downloaded</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        
                        <br>
                        <hr class="css-history" />
                        <br>
                        <h5>History of All Administrator and Super Administrator Downloads</h5>
                        
                        <div ng-controller="adminSummaryController">
                            <table my-table="overrideOptions" aa-data="admindownload"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>Superadmin/Admin</th>
                                    <th>Learning Object</th>
                                    <th>Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Date Downloaded</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        
                        <br>
                        <hr class="css-history" />
                        <br>
                        <h5>History of All User Downloads</h5>
                        
                        <div ng-controller="adminSummaryController">
                            <table my-table="overrideOptions" aa-data="userdownload"
                            ao-column-defs="columnDefs" class="dataTable" width="100%"
                                >
                                <thead>
                                <tr>
                                    <th>User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Learning Object</th>
                                    <th>Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Date Downloaded</th>
                                </tr>
                                </thead>
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
    <!-- data-table -->
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        
        <script src="scripts/angular.min.js"></script>
        <script src="scripts/summaryController.js"></script>
        <script src="scripts/summary-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        
        
        <!-- datepicker plugin -->
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script>
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.js"></script>
    </body>
</html>

<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
        $('#transaction').dataTable();
        $('#download').dataTable();
    });

</script>
