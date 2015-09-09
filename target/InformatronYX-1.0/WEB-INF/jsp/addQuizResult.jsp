<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : addQuizResult
    Revised on : September 5, 2015, 7:50:AM
    Author     : osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="QUIZ">
    <head>
        <title>Object Player</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
        <meta name="HandheldFriendly" content="True" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
        
    <!--plugins-->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
        <!--<link rel="stylesheet" media="screen"  href="bootstrap/css/bootstrap-customize.css" />-->
        <!--<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />-->
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!--<link rel="stylesheet" type="text/css" href="css/940grid.css" />
        <link rel="stylesheet" type="text/css" href="css/media.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.coolautosuggest.css" />
        
    <!--data-table-->
        <style type="text/css" title="currentStyle">
            @import "bootstrap-table/css/demo_page.css";
            @import "bootstrap-table/css/demo_table.css";
        </style>
        
    <!-- Date Picker -->
        <link href="bootstrap-formhelpers/docs/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        
    <%   
/*        String isession = (String) session.getAttribute("USER");
        String isid = (String) session.getAttribute("icms_id");
        if(isession  == null) 
                response.sendRedirect("login.action");
        String loid = (String) request.getParameter("loid");*/
    %>
    
    
    
    </head>
    <body ng-controller="lolController">
   
    <s:url id='url_advance' action='advancesearch'/>
    <s:url id='url_main' action='main'/>
    
        <div id="message" class="modal hide fade" tabindex="-1" data-width="760">
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
    
    
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                            
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> Object Player</a>

                                <div class="account"><!--ng-controller="userController">-->
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
                            <div class="span11 header-wrap main">
                                <a class="btn btn-navbar index box" data-toggle="collapse" data-target=".nav-collapse">
                                    <b><span class="icon-chevron-down"></span></b>
                                </a>    
                                
                                <!--<div class="nav-collapse collapse">
                                    <ul class="nav ul-search">
                                        <li class="not-anchor">SEARCH OPTIONS</li>
                                        <li><a href="#" class="active" ng-click="callAllLO()" >All</a></li> 
                                        <li><a href="#" ng-click="callAllMostDownloaded()">Most Downloaded</a></li>
                                        <li><a href="#" ng-click="callAllMostLiked()">Most Liked</a></li>
                                        <li><a href="#" ng-click="callLoriTopLOs()">LORI's Top LOs</a></li>    
                                        <li>
                                            <div class="accordion-heading">
                                                <a class="accordion-toggle foracc" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                                    <div class="content" id="q1">
                                                            <div class="item-container">
                                                                <div class="item-title" id="item-title-1">Advanced Search</div>
                                                            </div>
                                                    </div>
                                                </a>
                                           </div>
                                        </li>
                                    </ul>
                                </div>    --> 
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            
            <div class="clearfix"></div>
            <section id="learning-objects" class="container">
                <h3>Add Quiz Result</h3>
                <div class="content-row " style="text-align: center; padding-top: 50px;">
                    <form role="form">
                        <input type="text" placeholder="Student" id="student" alt="student" ng-model="student"><br>
                        <input type="text" placeholder="Learning Object" id="lo" alt="lo" ng-model="lo"><br>
                        <div id="datetimepicker1" class="input-append date">
                            <input data-format="yyyy/MM/dd hh:mm:ss" type="text" id="time_started" placeholder="Time Started" ng-model="time_started"></input>
                            <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                            </i>
                            </span>
                        </div><br>
                        <div id="datetimepicker2" class="input-append date">
                            <input data-format="yyyy/MM/dd hh:mm:ss" type="text" id="time_finished" placeholder="Time Finished" ng-model="time_ended"></input>
                            <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                            </i>
                            </span>
                        </div><br>
                        <input type="text" placeholder="Score" id="score" ng-model="score"><br>
                        <button type="button" class="btn btn-default" id="add_result_btn" ng-click="addQuiz()">Submit</button>
                    </form>
                    <div id="add_result_results">
                    
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>
            <footer id="footer-index" class="navbar navbar-inverse navbar-fixed-bottom">
                <div class="container">
                    <div>
                        Copyright &copy;2014 Object Player. All rights reserved.
                    </div>
                </div>
            </footer>
        </div>
                                <div><!-- ng-controller="userController">-->
            <input type="hidden" id="usertype" value="<% //out.println(isid); %>" />
            
        </div>
        
        
        
        <script src="bootstrap/js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-1.9.0.min.js"></script>
    	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    	<script src="js/jquery.ui.touch-punch.min.js"></script>
		
		

		<!-- data-table -->
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="bootstrap-table/js/jquery.dataTables.js"></script>
        
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
        <script src="scripts/quizController.js"></script>
        <script src="scripts/quizServices.js"></script>
        <!--<script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>-->
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery.coolautosuggest.js"></script>
        <script src ="site_js/addQuizResult.js"></script>
        
        <!-- datepicker plugin -->
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script>
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.js"></script>
        
<!--        <script src="js/chart-original.js"></script>-->
        
    </body>
</html>

<!--
<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
	$('#datetimepicker1, #datetimepicker2').datetimepicker();
        
        
        $("#student").coolautosuggest({
					url:"getSiteUserForAutoSuggest?&keyword=",
					width: 263,
					minChars:1,
					onSelected:function(result){
						$('#student').attr('data-id', result.id);
					}
				});
                                
        $("#lo").coolautosuggest({
					url:"getLOForAutoSuggest?&keyword=",
					width: 263,
					minChars:1,
					onSelected:function(result){
						$('#lo').attr('data-id', result.id);
					}
				});
        
        $('#add_result_btn').click(function(){
            var student = Number( $('#student').attr('data-id') ); 
            var lo = Number( $('#lo').attr('data-id')); 
            var time_started = $('#time_started').val();
            var time_finished = $('#time_finished').val();
            var score = $('#score').val();
            //alert(time_started+"\n"+time_finished);
            
            if( isNaN(student)  || isNaN(lo) || time_started == '' || time_finished == '' || score == '' ){
                $('#add_result_results').html('<div class="alert alert-danger">Please fill-in all fields.</div>');
            }else{
                $.ajax({
                    url : 'addQuizResultToDb',
                    type: 'post',
                    data : {
                            lo_id : lo,
                            user_id : student,
                            time_started : time_started,
                            time_finished : time_finished,
                            score : score
                    },
                    success: function(result){
                        $('#add_result_results').html('<div class="alert alert-success">Successully added the result.</div>');
                    }
                });
            }
            
        });
        
        
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

