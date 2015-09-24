<%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : main
    Revised on : September 5, 2015, 2:57:AM
    Author     : osias
    REVISION:
    Document   : copy
    Revised on : September 23, 2015, 1:03:16 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="LO">
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
    <body ng-controller="LORIController"> <!--ng-controller="loController">-->
   
    <s:url id='url_advance' action='advancesearch'/>
    <s:url id='url_main' action='main'/>
            <button ng-click="submitReview()">SUBMIT LORI</button>
            <button ng-click="editReview()">EDIT LORI</button>
            <button ng-click="deleteReview()">DELETE LORI</button>
            <button ng-click="getReview()">GET LORI</button>
            <table>
                <thead>
                    <tr>
                        <th>Learning Object ID</th>
                        <th>Subject</th>
                        <th>Evaluation</th>
                        <th>Review ID</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="LORI in returnedLORI">
                        <td>{{LORI.learningObjectId}}</td>
                        <td>{{LORI.subject}}</td>
                        <td>{{LORI.evaluation}}</td>
                        <td>{{LORI.reviewId}}</td>
                    </tr>
                </tbody>
            </table>
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
            <input type="hidden" id="usertype" value="< //% out.println(isid); %>" />
            
        </div>
        
        
        
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
        
        <!-- datepicker plugin -->
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script>
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.js"></script>
        
        <script src="js/chart-original.js"></script>
        <script src="site_js/LearningObjectReviewInformationTest.js"></script>
        
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