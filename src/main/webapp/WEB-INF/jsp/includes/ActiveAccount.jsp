<%-- 
    Document   : ActiveAccount
    Created on : Sep 22, 2015, 7:47:18 PM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="account" ng-controller="AccountController">
    <ul class="nav pull-right">
        <li class="dropdown" id="usermeter">  
            <h4>{{userInfo.username}}</h4>
        </li> 
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle font-up header-txt" href="#"><b class="caret"></b> <span><i class="icon-user"></i></span></a>
            <ul class="dropdown-menu">
                <li ng-repeat="function in functions">
                    <a href="{{function.url}}">
                    {{function.str}}
                    </a>
                </li>
                <li ng-if="userInfo.functionType>0">
                    <a href="/logout" >
                        Logout
                    </a>
                </li>
            </ul>
        </li>                                   
    </ul>
</div>
