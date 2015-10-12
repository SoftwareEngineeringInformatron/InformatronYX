/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("MyLOs",['ngStorage']).filter('object2Array', function() {
    return function(input) {
      var out = []; 
      for(i in input){
        out.push(input[i]);
      }
      return out;
    }
  });
  
  app.controller("LOViewController",function($sessionStorage,$scope,$rootScope,userService,loTransactionService,loRepository){
      $scope.lotransactions = [];
      $scope.user = "";
      $scope.los = [];
      $scope.ownedLOs = [];
      $scope.sortMethod = 1;
      
    function load(){
            userService.get($sessionStorage.user).success(function(response){
                $scope.user  = response;
                loadLOTransaction($scope.user);
             });
             
            loRepository.getAllLO().success(
            function(response) {
                $scope.los = response;
                getOwnedLOs();
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
    
    function getOwnedLOs() {
        if($scope.lotransactions != undefined || $scope.los != undefined) {
            for(var i=0; i < $scope.los.length; i++) {
                for(var j=0; j < $scope.lotransactions.length; j++)
                    if($scope.lotransactions[j].lo_id == $scope.los[i].id)
                        $scope.ownedLOs.push($scope.los[i]);
            }
        }
    }
    
    $scope.getTransactionAmount = function(id) {
        for(var i=0; i < $scope.lotransactions.length; i++)
            if($scope.lotransactions[i].lo_id == id)
                return $scope.lotransactions[i].amount;
    }
    
    $scope.getTransactionDate = function(id) {
        for(var i=0; i < $scope.lotransactions.length; i++)
            if($scope.lotransactions[i].lo_id == id)
                return $scope.lotransactions[i].dateOfTransaction;
    }
    
    $scope.getTransactionOR = function(id) {
        for(var i=0; i < $scope.lotransactions.length; i++)
            if($scope.lotransactions[i].lo_id == id)
                return $scope.lotransactions[i].officialReceipt;
    }
    
    $scope.getSortMethod = function() {
        if($scope.ownedLOs != undefined)
            if($scope.sortMethod == 1)
                return 'title';
            else
                return 'subject';
        else
            return null;
    }
    
    $scope.getLODetails = function(lo) {
        $scope.lotitle = lo.title;
        $scope.lodescription = lo.description;
        $scope.loprice = lo.price;
        $scope.lodownloads = lo.downloads;
        $scope.lolikes = lo.likes;
    }
    
    load();
});
