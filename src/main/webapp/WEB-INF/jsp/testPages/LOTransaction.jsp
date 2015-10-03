<%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : main
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="loTransaction">
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
    <body ng-controller="loTransController">
   
    <s:url id='url_advance' action='advancesearch'/>
    <s:url id='url_main' action='main'/>
    
    USER
    <select ng-model="userSelected">
        <option ng-repeat="user in users">{{user.id}}</option>
    </select>
    LO
    <select ng-model="selectedLO">
        <option ng-repeat="LO in los">{{LO.id}}</option>
    </select>
    <button ng-click="recordLOPurchase()">RECORD LO PURCHASE</button>
    <button ng-click="getAllTransactions()">GET LO TRANSACTIONS</button>
    <table border="2px">
            <tr>
                <th>Id</th>
                <th>LO ID</th>
                <th>DATE PURCHASED</th>
                <th>AMOUNT</th>
            </tr>
            <tr ng-repeat="trans in LOTransactions">
                <td> {{trans.id}}</td>
                <td> {{trans.lo_id}}</td>
                <td> {{trans.dateOfTransaction}}</td>
                <td> {{trans.amount}}</td>
            </tr>
        </table>
    
           <div class="clearfix"></div>
            <footer id="footer-index" class="navbar navbar-inverse navbar-fixed-bottom">
                <div class="container">
                    <div>
                        Copyright &copy;2014 Informatron Plus. All rights reserved.
                    </div>
                </div>
            </footer>
        
        
        
        <script src="bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-1.9.0.min.js"></script>
    	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    	<script src="js/jquery.ui.touch-punch.min.js"></script>
        
        <!-- chart plugin -->
        <script type="text/javascript" src="js/Chart.min.js"></script>
        <script type="text/javascript" src="js/chartjs-option.js"></script>
        
    	<script src="js/bootstrap.min.js"></script>
    	<script src="js/bootstrap-select.js"></script>
    	<script src="js/bootstrap-switch.js"></script>
    	<script src="js/flatui-checkbox.js"></script>
    	<script src="js/flatui-radio.js"></script>
    	<script src="js/jquery.tagsinput.js"></script>
    	<script src="js/jquery.placeholder.js"></script>
    	<script src="js/jquery.stacktable.js"></script>
    	<script src="js/application.js"></script>
        <script src="js/jquery-scripts.js"></script>
        <script src="js/original.js"></script>
        
        <script src="scripts/angular.min.js"></script>
        <!--<script src="scripts/loController.js"></script>
        <script src="scripts/lo-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>-->
        
        
        <script src="js/chart-original.js"></script>
        <script src="site_js/loTransaction.js"></script>
        <script src="site_js/services/userService.js"></script>
        <script src="site_js/services/loTransactionService.js"></script>
        <script src="site_js/services/lo-service.js"></script>
        
    </body>
</html>
<!--
<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
        var str = getURLParameter("errorMessage");
        //alert(str);
        if(str != null) {
            $('.file-action').append(str);
            $('#message').modal('show');
        }
            //alert(str);
    });
    function getURLParameter(name) {
        return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
    }
</script>
-->