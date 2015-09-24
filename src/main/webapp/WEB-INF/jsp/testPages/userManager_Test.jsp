<%-- 
    Document   : userManager_Test
    Created on : Sep 18, 2015, 9:38:31 PM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="user">
    <body ng-controller="userController" ng-init="load()">
        <div>
            <h2>All Users</h2>
            <table border="1" ng-model="allUsers">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Token</th>
                    <th>Update</th>
                    <th>Approved</th>
                    <th>Block/Unblock</th>
                    <th>User Type</th>
                    <th>Function Type</th>
                    
                </tr>
                <tr ng-repeat="user in allUsers">
                    <td>{{user.id}}</td>
                    <td><input type="text" ng-model="user.username"></td>
                    <td><input type="text" ng-model="user.password"></td>
                    <td><input type="text" ng-model="user.firstName"></td>
                    <td><input type="text" ng-model="user.lastName"></td>
                    <td><input type="text" ng-model="user.email"></td>
                    <td><input  type="text" ng-model="user.token"></td>
                    <td><button ng-click="update(user.id)">Update</button></td>
                    <td>
                        <button ng-click="approve(user.id)" ng-if="user.approved === false">Approve</button>
                    </td>
                    <td>
                        {{user.blocked}}
                        <button ng-click="block(user.id)" ng-if="!user.blocked">Block</button>
                        <button ng-click="unblock(user.id)"ng-if="user.blocked">Unblock</button>
                    </td>
                    <td>
                        {{user.userType}}
                        <button ng-click="promote(user.id)">Promote</button>
                        <button ng-click="demote(user.id)">Demote</button>
                    </td>
                    <td>
                        <select>
                            <option>Account</option>
                            <option>Metering</option>
                        </select>
                        
                    </td>
                    
                </tr>
            </table>
        </div>
        <div>
            <h2>Login</h2>
            <form>
                Username:<input ng-model="userInfo.username" type="text" placeholder="Username">
                Password<input ng-model="userInfo.password" type="text" placeholder="Password">
                <input ng-click="login()" type="submit">
            </form>
            <br>
            OUTPUT:{{ouput}}
        </div>
        <div>
            <h2>Register</h2>
            <form>
                Username:<input ng-model="userInfo.username" type="text" placeholder="Username">
                Password<input ng-model="userInfo.password" type="text" placeholder="Password">
                Email<input ng-model="userInfo.email" type="text" placeholder="Email">
                First Name<input ng-model="userInfo.firstName" type="text" placeholder="First Name">
                Last Name<input ng-model="userInfo.lastName" type="text" placeholder="Last Name">
                <input ng-click="register()" type="submit">
            </form>
            <br>
            OUTPUT: {{output}}
        </div>
        
        <script src="js/angular.js"></script>
        <script >
            var app = angular.module("user",[]);
            
        </script>
        <script src="site_js/includes/user.js"></script>
        <script src="site_js/services/userService.js"></script>
    </body>
</html>
