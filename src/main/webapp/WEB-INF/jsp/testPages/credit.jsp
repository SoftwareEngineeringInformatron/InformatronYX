<%-- 
    Document   : credit
    Created on : Sep 23, 2015, 6:32:17 PM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="credit">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body ng-controller="test">
        <h3>Credit Manager</h3><hr>
        <table border="2px">
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Credits</th>
            </tr >
            <tr ng-repeat="user in users">
                <td> {{user.id}}</td>
                <td> {{user.username}}</td>
                <td> {{user.credits}}</td>
            </tr>
        </table>
        <div >
            <select>
                <option ng-repeat="user in users" ng-click="select(user.id)" >{{user.username}}</option>
            </select>
            <input type="text" ng-model="amount" placeholder="Amount">
            <input type="text" ng-model="officialReciept" placeholder="Official Reciept">
            <button ng-click="record(selectedId,amount,officialReciept)">Add Credits</button>
        </div>
        <div >
            Pending Credit Records
            <table border="2">
                <tr>
                    <th>id</th>
                    <th>user id</th>
                    <th>amount</th>
                    <th>official receipt</th>
                    <th>Action</th>
                </tr>
                <tr ng-repeat = "transaction in transactions" ng-if="transaction.ok == false">
                    <td>{{transaction.id}}</td>
                    <td>{{transaction.u_ID}}</td>
                    <td>{{transaction.amnt}}</td>
                    <td>{{transaction.or}}</td>
                    <td>
                        <ul>
                            <li><button ng-click="approveTransaction(transaction.id)">Approve</button></li>
                            <li><button ng-click="removeTransaction(transaction.id)">Cancel</button></li>
                        </ul>
                    </td>
                </tr>
            </table>
            
        </div>
        <div >
            Finished Credit Records
            <table border="2">
                <tr>
                    <th>id</th>
                    <th>user id</th>
                    <th>amount</th>
                    <th>official receipt</th>
                </tr>
                <tr ng-repeat = "transaction in transactions" ng-if="transaction.ok == true">
                    <td>{{transaction.id}}</td>
                    <td>{{transaction.u_ID}}</td>
                    <td>{{transaction.amnt}}</td>
                    <td>{{transaction.or}}</td>
                </tr>
            </table>
            
        </div>
          <div >
            <select>
                <option ng-repeat="user in users" ng-click="select(user.id)" >{{user.username}}</option>
            </select>
            <input type="text" ng-model="amount" placeholder="Amount">
            <button ng-click="removeCredits(selectedId,amount)">Remove Credits</button>
        </div>
        <!-- SCRIPT -->
    <script src="js/angular.js"></script>
    <script src="site_js/test.js"></script>
    <script src="site_js/services/creditService.js"></script>
    <script src="site_js/services/userService.js"></script>
    </body>
    
</html>
