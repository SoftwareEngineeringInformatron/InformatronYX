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
        <button ng-click="addLO()">Add Learning Objects</button>
        <button>Add Learning Element</button>
    </body>
    <script src="js/angular.min.js"></script>
    <script src="site_js/universalAdd.js" type="text/javascript"></script>
</html>

