/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("Admin",['ngStorage']);

app.controller("meterController",function($sessionStorage,$scope,$rootScope,creditService,userService,loTransactionService,loRepository){
    $scope.transactions = [];
    $scope.lotransactions = [];
    $scope.users = [];
    $scope.los = [];
    $scope.currentTransaction = {};
    $rootScope.switchView = true;
    function load(){
        userService.getAllUsers().success(function(response){
            $scope.transactions = [];
            $scope.lotransactions = [];
            $scope.users  = response;
            for(var i=0;i<$scope.users.length;i++){
                loadCreditTransaction($scope.users[i]);
                loadLOTransaction($scope.users[i]);
            }
        });
        loRepository.getAllLO().success(
            function(response) {
                $scope.los = response;
                console.log("los loaded");
            }
        );
        
    };
    
    function loadCreditTransaction(user){
        
            creditService.getTransactionHistoryOfUser(user).success(function(response){
                for(var i=0; i < response.length;i++)
                    $scope.transactions.push(response[i]);
                console.log("credit transactions loaded");
            });
    }
    
    function loadLOTransaction(user) {
            loTransactionService.getLOTransactionHistory(user).success(
                function(response) {
                    for(var i=0; i < response.length;i++)
                        $scope.lotransactions.push(response[i]);
                    console.log("lo transactions loaded");
                }
            );
    }
    
    $scope.getUserNameById = function(id){
        for(var i=0;i<$scope.users.length;i++){
                if($scope.users[i].id == id)
                    return $scope.users[i].username;
            }
        return "";
    }
    
    $scope.getLOById = function(id) {
        for(var i = 0; i < $scope.los.length; i++) {
            if($scope.los[i].id == id)
                return $scope.los[i].title;
        }
    }
    
    $scope.approveTransaction = function(transaction){
        if($sessionStorage.user!=null)
            transaction.appBy = $sessionStorage.user.id;
        var transactionPOST = creditService.approveTransaction(transaction);
        transactionPOST.success(function (response){
            if(response=='true'){
                load();
                console.log("LOG:   Approval of transactiond #"+transaction.id);
            }
        });
        transactionPOST.error(function (response){
            $("#message").toggle();
            $("#errorMessage").html("Error occurred upon the process of approving transaction #"+transaction.id);
        });
        $('#approveAction').toggle();
    };
    $scope.declineTransaction = function(transaction){
        var transactionPOST = creditService.removeTransaction(transaction);
        transactionPOST.success(function (response){
            if(response=='true'){
                load();
                console.log("LOG:   Removal of transactiond #"+transaction.id);
            }
        });
        transactionPOST.error(function (response){
            $("#message").toggle();
            $("#errorMessage").html("Error occurred upon the process of approving transaction #"+transaction.id);
        });
        $('#declineAction').toggle();
    };
    $scope.loadTransaction = function(transaction){
      $scope.currentTransaction = transaction;
    };
    
    load();
});

    app.controller("viewController",function($scope,$rootScope){
        $scope.switchOn = function() {
            $rootScope.switchView = true;
        }
    
        $scope.switchOff = function() {
            $rootScope.switchView = false;
        }
});

