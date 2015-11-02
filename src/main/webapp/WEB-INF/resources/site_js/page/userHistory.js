/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module('UserHistory',["ngStorage"]);

app.controller("userHistory",function($sessionStorage,$scope,$rootScope,userService,loTransactionService,loRepository,downloadRecordService){
    $scope.lotransactions = [];
    $scope.los = [];
    $scope.userdownloads = [];
    
    function load(){
            userService.get($sessionStorage.user).success(function(response){
                $scope.user  = response;
                loadLOTransaction($scope.user); 
                getUserDownloads($scope.user);
             });
             
            loRepository.getAllLO().success(
            function(response) {
                $scope.los = response;
            });
    };
    
    function loadLOTransaction(user) {
            loTransactionService.getLOTransactionHistory(user).success(
                function(response) {
                    for(var i=0; i < response.length;i++)
                        $scope.lotransactions.push(response[i]);
                    console.log("lo transactions loaded");
                }
            );
    }
    
    function getUserDownloads(user) {
        downloadRecordService.getUserDownloads($scope.user).success(function(response){
                $scope.userdownloads = response;
            });
    }
    $scope.getLOTitleById = function(id) {
        for(var i = 0; i < $scope.los.length; i++) {
            if($scope.los[i].id == id) 
                return $scope.los[i].title;
        }
        return id;
    }
    
    $scope.getLOSubjectById = function(id) {
        for(var i = 0; i < $scope.los.length; i++) {
            if($scope.los[i].id == id)
                return $scope.los[i].subject;
        }
    }
    
    load();
});