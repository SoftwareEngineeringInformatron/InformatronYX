<%-- 
    Document   : universalAdd
    Created on : Sep 8, 2015, 10:08:25 PM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="addApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body ng-controller="buttonController">
        <button>Add Learning Object</button>
        <button>Add Learning Element</button>
    </body>
    <script src="js/angular.min.js"></script>
    <script>
        var app = angular.module("addApp",[]);
        app.controller('generateEvents', function($scope, $http){
           
           $scope.addLO = function(){
               var req = {
                 url:  
                   
               };
           };
            
        });
        
        
        
    </script>
</html>

