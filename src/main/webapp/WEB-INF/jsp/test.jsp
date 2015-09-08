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
    <!-- Date Picker -->
        <link href="bootstrap-formhelpers/docs/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
    
    </head>
    <body ng-controller="loController">
   
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
    
        <!--  evaluation -->
        <div id="evaluation" class="modal hide fade" tabindex="-1" data-width="1000" >
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">LORI Evaluation</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="">
                            <canvas id="myChart" width="900" height="400"></canvas>
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
                            
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronPlus</a>

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
                            <div class="span11 header-wrap main">
                                                      
                                <div class="navbar-search search">
                                        <input ng-model="searchText" name="searchName" type="text" placeholder="Search" class="input" />
                                        <a class="btn-index" ><i class="icon-search"></i> </a>
                                </div> 
                                <a class="btn btn-navbar index box" data-toggle="collapse" data-target=".nav-collapse">
                                    <b><span class="icon-chevron-down"></span></b>
                                </a>    
                                
                                <div class="nav-collapse collapse">
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
                                </div>     
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
                                
            <div class="clearfix"></div>
            
            <section class="search-accordion">
                <div class="accordion" id="accordion2">
                    <div class="accordion-group" >
                        <div id="collapseOne" class="accordion-body collapse" style="height: 0; ">
                            <div class="accordion-inner">
                                    <div class="row-fluid accordion-inner-flow">
                                        <section id="search-lo">
                                            <div class="container">
                                                <form class="form-horizontal" name="advanced" >
                                                    <fieldset class="">
                                                        <div class=" advanced-search">
                                                            <div class="well span6">
                                                                <!--<label class="label-search" for="input01"><i class="icon-search"></i> Search</label>
                                                                <div class="control-label advanced-search">
                                                                    <input type="text" ng-model="name" name="searchName" class="input-xlarge" id="input01">
                                                                </div>-->
                                                                
                                                                <label class="checkbox" for="checkbox0">
                                                                    <input name="nameCheck" type="checkbox" checked="checked" id="checkbox0" data-toggle="checkbox" value="option1">
                                                                    Learning Object
                                                                </label>

                                                                <label class="control-label" for="select01">
                                                                    Input Name
                                                                </label>

                                                                <div class="controls">
                                                                    <input type="text" ng-model="name" name="searchName" id="input01">
                                                                </div>
                                                            </div>

                                                            <div class="well span6">
                                                                <label class="checkbox" for="checkbox1">
                                                                    <input name="subjectCheck" type="checkbox" checked="checked" id="checkbox1" data-toggle="checkbox" value="option1">
                                                                    Subject
                                                                </label>

                                                                <label class="control-label" for="select01">
                                                                    Choose Subject
                                                                </label>

                                                                <div class="controls">
                                                                    <input type="text" name="subject" ng-model="subject" placeholder="e.g. Algebra, Physics" />
                                                                </div>
                                                            </div>

                                                            <div class="well span6">
                                                                <label class="checkbox" for="checkbox2">
                                                                    <input name="dateCheck" type="checkbox" checked="checked" id="checkbox2" data-toggle="checkbox" value="option2">
                                                                    Date
                                                                </label>

                                                                <label class="control-label" for="select01">
                                                                    From
                                                                </label>

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

                                                                <label class="control-label" for="select01">
                                                                    To
                                                                </label>

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

                                                            <div class="well span6">
                                                                <label class="checkbox" for="checkbox3">
                                                                    <input name="orderCheck" type="checkbox" checked="checked" id="checkbox3" data-toggle="checkbox" value="option3">
                                                                    Order By
                                                                </label>

                                                                <label class="control-label" for="select01">
                                                                    Choose Order
                                                                </label>

                                                                <div class="controls">
                                                                    <select name="order" id="select01" ng-model="orderBy">
                                                                        <option value="dateUploaded">Date</option>
                                                                        <!--<option value="downloads">Popularity</option>-->
                                                                        <option value="name">Name</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="clearfix"></div>

                                                        <div class="form-actions advanced-search" >
                                                            <button id="btn-advance" type="reset" ng-click="searchLO(name,subject,dateStart,dateEnd,orderBy)" class="btn btn-approve">Search</button>
                                                            <button type="reset" class="btn btn-cancel">Clear</button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </section>
                                   </div>
                           </div> <!--//accordion-inner-->
                        </div>
                    </div>
                </div>
            </section>
            
            <div class="clearfix"></div>
            <section id="learning-objects">
                <div class="content-row">
                    <table class="table table-hover user">
                        <thead>
                            <tr class="table-header">
                                
                                <th>Name</th>
                                <th>Subject</th>
                                <th>Date Uploaded</th>
                                <th>Evaluation</th>
                                 <% //if(isession != "icms_guest") { %>
				<th>Download</th>
                                <th>Quiz</th>
                               
                                <!--<th></th>-->
								
                                <% //} %>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="lo in LOs | filter:searchText">
                                <td><a href="learningobject?loID={{lo.id}}"><i class="icon-file"></i> {{lo.name}}</a>
                                    <div class="few-details"><i>Downloads: {{lo.downloads}} &nbsp;&nbsp;<span class="icon-thumbs-up"></span> {{lo.likes}} &nbsp;&nbsp;
                                        </i>
                                    </div>
                                </td>
                                <td>{{lo.subject}}</td>
                                <td>{{lo.dateUpload}}</td>
                                <td><a href="#evaluation" class="" data-toggle="modal" ng-click="lori(lo.id)"><img class="lori" src="img/logo2-3.png"></a></td>
                                <%// if(isession != "icms_guest") { %>
                                <td>
                                    <s:form action="download-lo">
                                        <s:hidden name="filename" value="{{lo.filepath}}" />
                                        <s:hidden name="id" value="{{lo.id}}" />
                                    <button type="submit" title="Download" class="btn-download" ng-click="loUpdate()"><i class="icon-download-alt btn-index"></i> &nbsp;</button>
                                    </s:form></td>
                                
								<td><a href="quiz?loid={{lo.id}}&uid=<% //if( isession == "icms_user" ) out.println(user_id); else out.println("0"); %>"><img src="img/quiz.jpg"></img></a></td>
				<%// } %>													<!-- gets na  -->
                            </tr>
                        </tbody>
                    </table>
                            <div class="offset1 error">
                                <h5>{{errorMessage}}</h5>
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
        <script src="scripts/loController.js"></script>
        <script src="scripts/lo-service.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        
        <!-- datepicker plugin -->
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script>
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.js"></script>
        
        <script src="js/chart-original.js"></script>
        
    </body>
</html>

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

