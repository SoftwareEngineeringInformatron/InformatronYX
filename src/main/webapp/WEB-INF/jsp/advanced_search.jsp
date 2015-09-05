<%-- 
    <%-- 
    Document   : index
    Created on : Jan 4, 2014, 4:15:44 PM
    Author     : nechelle
    REVISION:
    Document   : advanced_search
    Revised on : September 5, 2015, 8:00:AM
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
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <!-- flat-ui 
        <link rel="stylesheet" type="text/css" href="css/flat-ui-custom.css" /> -->
    <!-- Date Picker -->
        <link href="bootstrap-formhelpers/docs/css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="bootstrap-formhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        
        <link rel="stylesheet" type="text/css" href="css/media.css" />
    
        
    <%   
/*        String isession = (String) session.getAttribute("USER");
        String isid = (String) session.getAttribute("icms_id");
        if(isession  == null) 
                response.sendRedirect("/Informatron/login.action");*/
        
    %>          
        
    </head>
    <body>                  
    <s:url id='url_main' action='main'/>
    
        <div class="wrapIt" ng-controller="loController">
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
                                <div class="span8"><h5>ADVANCED SEARCH</h5></div>                                                            
                                <div class="span4" ><a href="${url_main}" class="btn-index span9" >BACK TO LEARNING OBJECTS</a></div>
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges">
                <div class="container">
                    <form class="form-horizontal" name="advanced" >
                        <fieldset class="">
                            <div class="control-group advanced-search">
                                <label class="control-label label-search" for="input01"><i class="icon-search"></i> Search</label>
                                <div class="advanced-search">
                                    <input type="text" ng-model="name" name="searchName" class="input-xlarge" id="input01">
                                </div>

                                <div class="well">
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

                                <div class="well">
                                    <label class="checkbox" for="checkbox2">
                                        <input name="dateCheck" type="checkbox" id="checkbox2" data-toggle="checkbox" value="option2">
                                        Date
                                    </label>

                                    <label class="control-label" for="select01">
                                        From
                                    </label>

                                    <div class="controls date">
                                        <div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-01">
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
                                        <div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-10">
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

                                <div class="well">
                                    <label class="checkbox" for="checkbox3">
                                        <input name="orderCheck" type="checkbox" id="checkbox3" data-toggle="checkbox" value="option3">
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

                            <div class="clearfix"></div>
                            
                            <div class="form-actions advanced-search" >
                                <button type="button" ng-click="searchLO(name,subject,dateStart,dateEnd,orderBy)" class="btn btn-approve">Search</button>
                                <button type="reset" class="btn btn-cancel">Clear</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </section>
            <div class="clearfix"></div>
            <section id="learning-objects">
                <div class="offset1">
                    <h4>Searched Objects</h4>
                </div>
                
                <div class="content-row">
                    <table class="table table-hover user">
                        <thead>
                            <tr class="table-header">
                                
                                <th>Name</th>
                                <th>Subject</th>
                                <th>Date Uploaded</th>
                                <th>Evaluation</th>
                                <% //if(isession != "icms_guest") %>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="lo in searchedlos">
                                
                                <td><a href="#"><i class="icon-file"></i> {{lo.name}}</a>
                                    <div class="few-details"><i>Downloads: {{lo.downloads}} &nbsp;&nbsp;<span class="icon-thumbs-up"></span> 40 &nbsp;&nbsp;
                                        </i>
                                        {{lo.LOs}}
                                    </div>
                                </td>
                                <td>{{lo.subject}}</td>
                                <td>{{lo.dateUploaded}}</td>
                                <td><a href="" class=""><img class="lori" src="img/logo2-3.png"></a></td>
                                <% //if(isession != "icms_guest") { %>
                                <td>
                                    <s:form action="download-lo">
                                        <s:hidden name="filename" value="{{lo.filepath}}" />
                                        <s:hidden name="id" value="{{lo.id}}" />
                                    <button type="submit" title="Download" class="btn-download" ng-click="loUpdate()"><i class="icon-download-alt btn-index"></i> &nbsp;</button>
                                    </s:form></td>
                                <% //} %>
                            </tr>
                        </tbody>
                    </table>
                            <div class="offset1">
                                <h5>{{errorMessage}}</h5>
                            </div>
                </div>
                            
                            <br>
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
        
        <script src="scripts/angular.min.js"></script>
        <script src="scripts/userController.js"></script>
        <script src="scripts/user-service.js"></script>
        <script src="scripts/loController.js"></script>
        <script src="scripts/lo-service.js"></script>
        
    <!-- datepicker plugin -->
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script>
        <script src="bootstrap-formhelpers/js/bootstrap-formhelpers-datepicker.js"></script>
    </body>
</html>

<script type="text/javascript">
//alert('working');
    $(document).ready(function() {
    });
</script>
