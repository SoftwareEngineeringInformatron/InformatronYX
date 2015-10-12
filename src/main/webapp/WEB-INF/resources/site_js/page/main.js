/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app=angular.module('LO',['ngStorage']);

app.controller("navBarController", function($scope, $rootScope){  
    
    $scope.allLOs = function(){
        $rootScope.allLOs();
    };    
    $scope.mostDownloadedLOs = function(){
        $rootScope.mostDownloadedLOs();
    };    
    $scope.mostLikedLOs = function(){
        $rootScope.mostLikedLOs();
    };
    $scope.modalInstance = function() {
        $rootScope.modalInstance();
    };
});


app.controller("LOcontroller", function($scope, $rootScope, loRepository, $location){
    //alert('');
    
    $scope.ModalInstance = function(lo) {
        $rootScope.loprice = lo.price;
        $rootScope.lotitle = lo.title;
        $rootScope.lodescription = lo.description;
        $rootScope.loid = lo.id;
    };
    
    $scope.searchLO = function(name, subject, dateStart, dateEnd, orderBy) {
        loRepository.searchLO(name, subject, dateStart, dateEnd, orderBy).success(function(lo) {
            $rootScope.LOs = lo.searchlo;
            
            if(lo.searchlo == undefined)
                $scope.errorMessage = 'No learning objects found';
            
            $scope.name = '';
            $scope.subject = '';
            $scope.dateStart = '';
            $scope.dateEnd = '';
            $scope.orderBy = '';
        });        
    };
    
    $scope.go = function (path) {
        $location.path(path);
    };
    
    function displayAll() {
        loRepository.getAllLO().success(function(lo) {
            $rootScope.LOs = lo;
        });
    }    
    
    displayAll();
});
    
app.controller('LOController',function($scope,$rootScope,loRepository) {
    //alert('alright');
    $rootScope.LOs = [];
    
    $rootScope.loprice = "";
    $rootScope.lodescription = "";
    $rootScope.loid = "";
    $rootScope.lotitle = "";
    
    $scope.callAllMostDownloaded = function() {
        loRepository.getMostDownloaded().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
    
    $scope.callAllLO = function() {
        loRepository.getAllLO().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
    
    $scope.callAllMostLiked = function() {
        loRepository.getMostLiked().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
});