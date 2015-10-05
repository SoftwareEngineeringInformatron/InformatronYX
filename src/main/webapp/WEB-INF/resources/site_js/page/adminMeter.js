/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("Admin",['ngStorage']);

app.controller("meterController",function($scope,creditService,userService){
    $scope.creditTransactions = [];
    $scope.users = [];
    function load(){
        userService.getAllUsers().success(function(response){
            $scope.users  = response;
            for(var i=0;i<$scope.users.length;i++){
                loadCreditTransaction($scope.users[i]);
            }
        });
    };
    function loadCreditTransaction(user){
        
            creditService.getTransactionHistoryOfUser(user).success(function(response){
                for(var i=0; i < response.length;i++)
                    $scope.creditTransactions.push(response[i]);
                console.log("credit transactions loaded");
            });
    }
    $scope.getUserNameById = function(id){
        for(var i=0;i<$scope.users.length;i++){
                if($scope.users[i].id = id)
                    return $scope.users[i].username;
            }
        return "";
    }
    load();
});

