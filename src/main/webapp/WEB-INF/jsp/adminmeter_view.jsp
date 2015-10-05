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
    <body ng-controller="meterController">
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
        
        
        <!-- Metering Action -->
        <div id="payCharges" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="metering">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Metering Action</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">
                                    <div>{{setName}}</div>
                                    <div>Amount to pay: Php {{setBalance}}.00</div><br/>
                                    <input type="text" size="20" placeholder="Amount paid"  required/>
                                    <input type="text" size="20" placeholder="O.R. number"  required/>
                                </label>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button type="button" data-dismiss="modal" class="btn btn-primary" ><i class="icon-plus-sign-alt icon-large default"></i> Submit</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                                <input type="hidden" id="selectedIndex" name="index" value="0"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="wrapIt">
            <header id="header-wrap" >
                <div class="navbar navbar-inverse">
                        <div class="row-fluid">
                            <div class="span12 header-wrap main">
                            
                                <a href="${url_main}" class="brand offset1 header-txt"><i class="icon-download-alt logo"></i> InformatronCMS</a>

                                <div class="account">
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
                                <div class="span6"><h5>Metering View</h5></div> 
                                <div class="navbar-search search admin-meter">
                                        <input name="searchName" type="text" placeholder="Search" class="input" ng-model="searchText"/>
                                        <a class="btn-index" ><i class="icon-search"></i> </a>
                                </div>
                                <div class="span3" >
                                    <a href="#" class="btn-index span4" >CREDIT</a>
                                    <a href="#" class="btn-index span8" >Learning Object</a>
                                </div>
                                
                            </div> 
                        </div>
                    </div>

                </div>
            </header>
            <div class="clearfix"></div>
            <section id="user-charges" >
                <div class="content-row">
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
                            <tr ng-repeat="trans in creditTransactions">
                                <td></td>
                                <td><a href="#payCharges" data-toggle="modal">{{getUserNameById(trans.u_ID)}}</a></td>
                                <td>{{trans.amnt}}</td>
                                <td>{{trans.or}}</td>
                                <td>
                                    <div ng-switch on="trans.ok" class="text-center">
                                        <div ng-switch-when="false" ">
                                            <button  class="btn" data-toggle="modal" data-target="#payCharges"> Approve </button>
                                        <button  class="btn" data-toggle="modal" data-target="#payCharges"> Decline </button>
                                        </div>
                                        <h4 ng-switch-when="true"> Approved</h4>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
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
        <script src="site_js/services/creditService.js"></script>
        <script src="site_js/services/userService.js"></script>
    </body>
</html>