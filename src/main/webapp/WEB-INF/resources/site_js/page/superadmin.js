/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("SuperAdmin",['ngStorage']);
app.controller("userController",function($rootScope,$scope,userService){
    $scope.allUsers = [];
    $scope.displayedUsers = [];
    $scope.confirmPassword = "TEST";
    $scope.errorList = [];
    
    $scope.toStringDate = function(time){
        if(time== null)
            return "";
        var date = new Date(time);
        return date.getMonth()+"/"+
                date.getDate()+"/"+
                date.getUTCFullYear()+" "+
                date.getHours()+":"+
                date.getMinutes()+":"+
                date.getSeconds();
    };
    $rootScope.loadAllUsers = function(){
        var allUserPromise = userService.getAllAdminUsers();
        allUserPromise.success(function(response){
            $scope.allUsers = response;
            $scope.displayedUsers = response;
        });
        allUserPromise.error(function(response){
            alert("Unabled to get user information.");
            
        });
    };
    $rootScope.loadBlockedUsers = function(){
        $scope.displayedUsers = [];
        userService.getBlockedUsers().success(function(response){
            for(var i=0;i<response.length;i++)
                if(response[i].userType == "Admin" || response[i].userType == "Super Admin")
                    $scope.displayedUsers.push(response[i]);
        });
    };
    $rootScope.loadInactiveUsers = function(){
        $scope.displayedUsers = [];
        userService.getInactiveUsers().success(function(response){
            for(var i=0;i<response.length;i++)
                if(response[i].userType == "Admin" || response[i].userType == "Super Admin")
                    $scope.displayedUsers.push(response[i]);
        });
    };
    
    // INITIALIZE
    $rootScope.loadAllUsers();
});

app.controller("navBarController",function($scope,$rootScope){
    
    $scope.setActive = function(selector){
      $("#display_account").children().removeClass("active");
      $("#"+selector).addClass("active");
    };
    
    $scope.loadAll = function(){
        $rootScope.loadAllUsers();
        $scope.setActive("all");
        
    };
    $scope.loadInactive = function(){
        $rootScope.loadInactiveUsers();
        $scope.setActive("inactive");
        
    };
    $scope.loadBlocked = function(){
        $rootScope.loadBlockedUsers();
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
