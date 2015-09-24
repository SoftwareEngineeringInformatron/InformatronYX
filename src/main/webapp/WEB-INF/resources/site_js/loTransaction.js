/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("loTransaction",[]);
    app.controller("loTransController", function($scope,$http,userService,loTransactionService,loRepository) {
        $scope.users = [];
        $scope.los = [];
        
        function load(){
        userService.getAllUsers().success(
            function(reponse){
                $scope.users  = reponse;
            }
        );
        loRepository.getAllLO().success(
            function(response) {
                $scope.los = response;
            }
        );
        }
        
        $scope.selectedLO = "";
        $scope.selectedUser = [
            {id:""},
            {username:""},
            {password:""},
            {firstName:""},
            {lastName:""},
            {email:""},
            {lastLogin:""},
            {lastDownloadDate:""},
            {token:""},
            {approved:""},
            {blocked:""},
            {userType:""},
            {functionType:""},
            {credits:""}
        ];
        
        $scope.recordLOPurchase = function() {
            var transactionJSON = {
              "lo_id":$scope.selectedLO,
              "u_Id":$scope.selectedUser.id,
              "errorList":null
            };
            
            loTransactionService.recordLOPurchase(transactionJSON).success(
                    function(response) {
                        if(response == 'true') {
                                load();
                            }
                    }
            );
        }
        
        $scope.LOTransactions = [];
        
        $scope.getAllTransactions = function() {
            var userJSON = {
            "id":$scope.selectedUser.id,
            "username":$scope.selectedUser.username,
            "password":$scope.selectedUser.password,
            "firstName":$scope.selectedUser.firstName,
            "lastName":$scope.selectedUser.lastName,
            "email":$scope.selectedUser.email,
            "lastLogin":$scope.selectedUser.lastLogin,
            "lastDownloadDate":$scope.selectedUser.lastDownloadDate,
            "token":$scope.selectedUser.token,
            "approved":$scope.selectedUser.approved,
            "blocked":$scope.selectedUser.blocked,
            "userType":$scope.selectedUser.userType,
            "functionType":$scope.selectedUser.functionType,
            "credits":$scope.selectedUser.credits
            };
            
            loTransactionService.getLOTransactionHistory(userJSON).success(
                    function(response) {
                        $scope.LOTransactions = response;
                    }
            );
        }
        
        load();
    });