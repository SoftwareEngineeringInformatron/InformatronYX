/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("SuperAdmin",['ngStorage']);
app.controller("userController",function($scope,userService){
    $scope.allUsers = [];
    $scope.displayedUsers = [];
    $scope.confirmPassword = "TEST";
    $scope.errorList = [];
    
    $scope.userInfo = {
        
        
    };
    $scope.loadAllUsers = function(){
        var allUserPromise = userService.getAllUsers();
        allUserPromise.success(function(response){
            //$rootScope.allUsers = response;
            //$scope.displayedUsers = $rootScope.allUsers;
            $scope.displayedUsers = response;
        });
        allUserPromise.error(function(response){
            alert("Unabled to get user information.");
            
        });
    };
    $scope.addUser = function( ){
        $scope.errorList = [];
        $scope.checkUserInfo();
        if($scope.errorList==0){
            alert();
            
        }
    };
    // Filter
    $scope.checkUserInfo = function(){
        
    };
    // INITIALIZE
    $scope.loadAllUsers();
});

app.controller("navBarController",function($scope){
    
    $scope.setActive = function(selector){
      $("#display_account").children().removeClass("active");
      $("#"+selector).addClass("active");
    };
    
    $scope.loadAll = function(){
        $scope.setActive("all");
        
    };
    $scope.loadInactive = function(){
        $scope.setActive("inactive");
        
    };
    $scope.loadBlocked = function(){
        $scope.setActive("blocked");
        
    };
});