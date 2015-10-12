/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("SuperAdmin",['ngStorage']);
app.controller("userController",function($rootScope,$scope,userService){
    $scope.displayedUsers = [];
    $scope.confirmPassword = "TEST";
    $scope.errorList = [];
    
    
    $rootScope.loadAllUsers = function(){
        var allUserPromise = userService.getAllAdminUsers();
        allUserPromise.success(function(response){
            //$rootScope.allUsers = response;
            //$scope.displayedUsers = $rootScope.allUsers;
            $scope.displayedUsers = response;
        });
        allUserPromise.error(function(response){
            alert("Unabled to get user information.");
            
        });
    };
    // INITIALIZE
    $rootScope.loadAllUsers();
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

app.controller("modalController",function($scope,$rootScope,userService){
    $scope.userInfo = {
        firstName:'',
        lastName:'',
        functionType:0,
        username:'',
        password:''
    };
    $scope.confirmPassword = '',
    $scope.errorList = [];
    $scope.addUser = function( ){
        $scope.errorList = [];
        $scope.checkUserInfo();
        if($scope.errorList==0){
            var addPromise = userService.signup($scope.userInfo);
                addPromise.success(function(response){
                    $rootScope.loadAllUsers();
                    $('#addAccount').toggle();
                });
                addPromise.error(function(response){
                   alert("Sorry an error has occurred upon adding a new user.");
                });
        }
    };
    // Filter
    $scope.checkUserInfo = function(){
        userService.exists($scope.userInfo).success(function(response){
            if(response == 'true')
                $scope.errorList.push("Username exists.");
        });
        
        if($scope.userInfo.password!=$scope.confirmPassword)
            $scope.errorList.push("Password and Confirm Password does not match.");
        
    };
});
