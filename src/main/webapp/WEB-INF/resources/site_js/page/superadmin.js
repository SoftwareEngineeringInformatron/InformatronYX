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
    $scope.userInfo = {
        firstName:'',
        lastName:'',
        functionType:0,
        username:'',
        password:''
    };
    $scope.confirmPassword = '',
    $rootScope.action = "#allAccount"
    $rootScope.userModal = "#allAccount"
    $rootScope.selectedUsers = [];
    $rootScope.selectedAll = false;
    
    
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
    // LOAD
    $rootScope.loadUser = function(user){
        $rootScope.userModal = user;        
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
    
    // SINGLE ACTION
    $scope.blockAdmin = function(){
        $scope.block($rootScope.userModal);
        $rootScope.loadAllUsers();
        $rootScope.loadBlockedUsers();
    };
    $scope.unblockAdmin = function(){
        $scope.unblock($rootScope.userModal);
        $rootScope.loadBlockedUsers();
    };
    $scope.demoteAdmin = function(){
        $scope.demote($rootScope.userModal);
        $rootScope.loadAllUsers();
    };
    $scope.changeFunctionTypeAdmin = function(functionType){
        $scope.changeFunctionType($rootScope.userModal,functionType);
        $rootScope.loadAllUsers();
    };
    // MASS ACTION
    $scope.blockAdmins = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            $scope.block($rootScope.selectedUsers[i]);
        }
        $rootScope.loadAllUsers();
        $rootScope.loadBlockedUsers();
    };
    $scope.unblockAdmins = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            $scope.unblock($rootScope.selectedUsers[i]);
        }
        $rootScope.loadBlockedUsers();
    };
    $scope.demoteAdmins = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            $scope.demote($rootScope.selectedUsers[i]);
        }
        $rootScope.loadAllUsers();
    };
    $scope.changeFunctionTypeAdmins = function(functionType){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            $scope.changeFunctionType($rootScope.selectedUsers[i],functionType);
        }
        $rootScope.loadAllUsers();
    };
// CHECK BOX MANIPULATION    
    $scope.isSelected = function(user){
        for(var i=0;i<$rootScope.selectedUsers.length;i++)
            if($rootScope.selectedUsers[i].id == user.id)
                return true;
        return false;
    };
    $scope.changeSelected = function(user){
        if($scope.isSelected(user))
            $rootScope.selectedUsers.splice($rootScope.selectedUsers.indexOf(user),1);
        else
            $rootScope.selectedUsers.push(user);
    };
    $scope.selectAll = function(){
        if($rootScope.selectedAll==false){
            $rootScope.selectedUsers = [];
            for(var i=0;i < $scope.displayedUsers.length ; i++)  {
                $rootScope.selectedUsers.push($scope.displayedUsers[i]);
            }
            $rootScope.selectedAll = true;
        }
        else{
            $rootScope.selectedUsers = [];
            $rootScope.selectedAll = false;
        }
    };
    // OPERATIONS
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
    $scope.demote = function(user){
        var demotePromise = userService.demote(user);
        var result = false;
        demotePromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        demotePromise.error(function(response){
            $scope.errorList.push("An error has come up upon promoting "+user.username);
        });
        return result;
    };
    $scope.block = function(user){
        var blockPromise = userService.block(user);
        var result = false;
        blockPromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        blockPromise.error(function(response){
            $scope.errorList.push("An error has come up upon blocking "+user.username);
        });
        return result;
    };
    $scope.changeFunctionType = function(user,functionType){
        user.functionType = functionType;
        var blockPromise = userService.update(user);
        var result = false;
        blockPromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        blockPromise.error(function(response){
            $scope.errorList.push("An error has come up upon blocking "+user.username);
        });
        return result;
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
    
    // INITIALIZE
    $rootScope.loadAllUsers();
});

app.controller("navBarController",function($scope,$rootScope){
    
    $scope.setActive = function(selector){
      $("#display_account").children().removeClass("active");
      $("#"+selector).addClass("active");
    };
    
    $scope.loadAll = function(){
        $rootScope.selectedUsers = [];
        $rootScope.selectedAll = false;
        $rootScope.action = "#allAccount"
        $rootScope.loadAllUsers();
        $scope.setActive("allNav");
        
    };
    $scope.loadInactive = function(){
        $rootScope.selectedUsers = [];
        $rootScope.selectedAll = false;
        $rootScope.action = "#inactive"
        $rootScope.loadInactiveUsers();
        $scope.setActive("inactiveNav");
        
    };
    $scope.loadBlocked = function(){
        $rootScope.selectedUsers = [];  
        $rootScope.selectedAll = false;
        $rootScope.action = "#block"
        $rootScope.loadBlockedUsers();
        $scope.setActive("blockedNav");
        
    };
});
