/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = angular.module('AdminHistory',["ngStorage"]);

app.controller("creditHistory",function($rootScope,$scope,userService,creditService){
    $rootScope.allUsers = [];
    $scope.creditTransactions = [];
    $scope.start = 0;
    $scope.stop = 4;
    $scope.increment=5;
    $scope.pageNumber = 0;
    $scope.showPopulationChanged = function(){ 
        $scope.increment-=0; // To change to INTEGER TYPE
        $scope.pageNumber = 0;
        $scope.loadPage();
        $scope.stop = $scope.start+ ($scope.increment -1);
        if($scope.stop > $scope.creditTransactions.length)
            $scope.stop = $scope.creditTransactions.length;
    };
    $scope.load = function(){
        var commonPromise = userService.getAllUsers();
        commonPromise.success(function(response){
            $rootScope.allUsers = response;
            for(var i=0;i<$rootScope.allUsers.length;i++){
                loadCreditTransaction($rootScope.allUsers[i]);
            }
        });
        commonPromise.error(function(response){
            alert("Something went wrong.");
        });
    }; 
    function loadCreditTransaction(user){
        
            creditService.getTransactionHistoryOfUser(user).success(function(response){
                for(var i=0; i < response.length;i++)
                    $scope.creditTransactions.push(response[i]);
                console.log("credit transactions loaded");
            });
    }
    $rootScope.getUserById = function(id){
        for(var i=0;i<$rootScope.allUsers.length;i++){
                if($rootScope.allUsers[i].id == id)
                    return $rootScope.allUsers[i];
            }
        return null;
    }
    $scope.loadPage = function(){
        var length = $scope.creditTransactions.length;
        
            $scope.start = $scope.pageNumber * $scope.increment;
            $scope.stop  = $scope.start + ($scope.increment - 1);
            if($scope.stop > length)
                $scope.stop = length - 1;
        
    }
    $scope.next = function(){
        var page = $scope.pageNumber + 1;
        if(($scope.creditTransactions.length>= (page*$scope.increment))){
            $scope.pageNumber = page;
            $scope.loadPage();
        }
    }
    $scope.previous = function(){
        var page = $scope.pageNumber - 1;
        if($scope.pageNumber>0){
            $scope.pageNumber = page;
            $scope.loadPage();
        }
    }
    // INITALIZE
     $scope.load();
});
app.controller("loTransactionHistory",function($rootScope,$scope,userService,loTransactionService,loRepository){
    $scope.loTransaction = [];
    $scope.los = [];
    $scope.start = 0;
    $scope.stop = 4;
    $scope.increment=5;
    $scope.pageNumber = 0;
    
    $scope.load = function(){
        var commonPromise = userService.getAllUsers();
        commonPromise.success(function(response){
            $rootScope.allUsers = response;
            loRepository.getAllLO().success(function(response){
                $scope.los = response;
            });
            for(var i=0;i<$rootScope.allUsers.length;i++){
                loTransactionService.getLOTransactionHistory($rootScope.allUsers[i]).success(function(response){
                    for(var x=0;x<response.length;x++){
                        $scope.loTransaction.push(response[x]);
                    }
                });
            }
        });
        commonPromise.error(function(response){
            alert(response);
        });
        
    }
    $scope.showPopulationChanged = function(){ 
        $scope.increment-=0; // To change to INTEGER TYPE
        $scope.pageNumber = 0;
        $scope.loadPage();
        $scope.stop = $scope.start+ ($scope.increment -1);
        if($scope.stop > $scope.creditTransactions.length)
            $scope.stop = $scope.creditTransactions.length;
    };
    $scope.loadPage = function(){
        var length = $scope.loTransaction.length;
        
            $scope.start = $scope.pageNumber * $scope.increment;
            $scope.stop  = $scope.start + ($scope.increment - 1);
            if($scope.stop > length)
                $scope.stop = length - 1;
        
    }
    $scope.next = function(){
        var page = $scope.pageNumber + 1;
        if(($scope.loTransaction.length>= (page*$scope.increment))){
            $scope.pageNumber = page;
            $scope.loadPage();
        }
    }
    $scope.previous = function(){
        var page = $scope.pageNumber - 1;
        if($scope.pageNumber>0){
            $scope.pageNumber = page;
            $scope.loadPage();
        }
    }
    $scope.load();
});