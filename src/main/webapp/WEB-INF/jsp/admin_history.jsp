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
<html ng-app="AdminHistory">
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
        <link href="bootstrap-formhelpers/docs/assets/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        
       
    </head>
    <body>
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
                                <div class="span8"><h5>Transactions and History View</h5></div>                                                            
                                <div class="span4" ><a href="${url_meteradmin}" class="btn-index span9" >BACK TO METERING</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="container">
                    
                    
                    
                    <div class="content-row" ng-controller="creditHistory">
                        <br><h4 >Credit Transaction Log</h4>
                        <h6>Show List by :
                        <select  ng-model="increment" class="input-control" ng-change="showPopulationChanged()">
                            <option type="number" value=3 >3</option>
                            <option type="number" value=5 >5</option>
                            <option type="number" value=10>10</option>
                        </select>
                        </h6>
                        <div  >
                            <table class="table table-striped table-bordered" width="100%"
                                >
                                <thead>
                                <tr class="table-header">
                                    <th >#</th>
                                    <th >User</th>
                                    <th>Transaction ID</th>
                                    <th>Amount Paid</th>
                                    <th>Date Paid</th>
                                    <th>O.R. number</th>
                                    <th>Approved By</th>
                                </tr>
                                </thead>
                                <tr ng-if='creditTransactions.length<5'>
                                    <td colspan="7"><b>No credit transaction history.</b></td>
                                </tr>
                                <tr ng-repeat="trans in creditTransactions" 
                                    ng-if='creditTransactions.indexOf(trans) <= stop && creditTransactions.indexOf(trans)>=start'>
                                    <td>{{creditTransactions.indexOf(trans) + 1}}</td>
                                    <td>{{getUserNameById(trans.id)}}</td>
                                    <td>{{trans.id}}</td>
                                    <td>{{trans.amnt}}</td>
                                    <td>{{trans.date}}</td>
                                    <td>{{trans.or}}</td>
                                    <td>{{getUserNameById(trans.appBy)}}</td>
                                </tr>
                            </table>
                            <button class="btn btn-primary" ng-click="previous()">Previous</button>
                            <button class="btn btn-primary" ng-click="next()">Next</button>
                            <h6>Showing {{start+1}} to {{stop+1}} (<i>out of {{creditTransactions.length}}</i>)</h6>
                        </div>
                        <br>
                        <hr class="css-history" />
                        <br>
                        <div ng-controller="loTransactionHistory">
                            <h4>Learning Object Transaction Log</h4>
                            <h6>Show List by :
                            <select  ng-model="increment" class="input-control" ng-change="showPopulationChanged()">
                                <option type="number" value=3 >3</option>
                                <option type="number" value=5 >5</option>
                                <option type="number" value=10>10</option>
                            </select>
                            </h6>
                            <table class="table table-striped table-bordered"
                                >
                                <thead>
                                <tr class="table-header">
                                    <th>User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Learning Object</th>
                                    <th>Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Date of Purchase</th>
                                </tr>
                                </thead>
                                <tr ng-repeat="trans in loTransaction">
                                    <td>{{getUserNameById(trans.u_Id)}}</td>
                                    <td>TEST</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                        
                        <br>
                        <hr class="css-history" />
                        <br>
                        <div ng-controller="">
                            <h4>History of All Administrator and Super Administrator Downloads</h4>
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
                        <div ng-controller="">
                            <h4>History of All User Downloads</h4>
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
        <jsp:include page="includes/scripts.jsp" /> 
        <script src="scripts/angular.min.js"></script>
        <script src="site_js/ngStorage.js"></script>
        <script src="site_js/page/adminHistory.js"></script>
        <script src="site_js/includes/activeAccount.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/creditService.js"></script>
        <script src="site_js/services/loTransactionService.js"></script>
        <script src="site_js/services/lo-service.js"></script>
    </body>
</html>

<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
        $('#transaction').dataTable();
        $('#download').dataTable();
    });

</script>
