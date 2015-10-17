<%-- 
    Document   : ActiveAccount
    Created on : Sep 22, 2015, 7:47:18 PM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="account" ng-controller="AccountController">
    <ul class="nav pull-right">
        <li><a href="#requestCreditModal" data-toggle="modal" hint="Request Credits"><span class="text-info">(PHP {{userInfo.credits}})&nbsp;</span></a></li>
        <li class="dropdown" id="usermeter">  
            <h4>{{userInfo.username}}</h4>
        </li> 
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle font-up header-txt" href="#"><b class="caret"></b> <span><i class="icon-user"></i></span></a>
            <ul class="dropdown-menu">
                <li ng-repeat="function in functions" ng-if="functions.indexOf(function)<=3">
                    <a href="{{function.url}}">
                    {{function.str}}
                    </a>
                </li>
                <li class="divider"></li>
                <li ng-repeat="function in functions" ng-if="functions.indexOf(function)>3">
                    <a href="{{function.url}}">
                    {{function.str}}
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a ng-click="destroySession()" ng-if="userInfo.functionType!=0">
                        Sign Out
                    </a>
                </li>
            </ul>
        </li>                                   
    </ul>
</div>


<div id="requestCreditModal" class="modal hide fade" tabindex="-1" data-width="760" ng-controller="requestCreditController">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Request Credit</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            Amount :<input type="number" ng-model="amount" value="1">
                            Official Receipt :<input type="text" ng-model="OR">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" 
                                    class="btn btn-primary" ng-click="requestCredits()">
                                <i class="icon-plus-sign-alt icon-large default"></i> 
                                Request
                            </button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"> 
                                Cancel
                            </button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>