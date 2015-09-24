/* 
 * User Controller and Service
 * Author: Ted Ian B. Osias BSCS-4
 * Date: September 18,2015
 */


//var app = angular.module("user",[]);
app.controller("userController",function($scope,userService){
    $scope.allUsers = [];
    $scope.userInfo = {
        username: "",
        password:"",
        firstName: "",
        lastName: "",
        email:""
    };
    $scope.output = "";
    $scope.load = function (){
        userService.getAllUsers().success(function(response){
            $scope.allUsers = response;
        });
    };
    $scope.loadNewAccounts = function()
    {
        userService.getAllPendingUsers().success(function(response){
            $scope.allUsers = response;
        });
        
    };
    
    $scope.update = function(userId){
        var user = getUserById(userId);
        userService.update(user).success(function(response){
            var output = "Update was ";
            if(response == 'true'){
                output += "successful.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.update(user).error(function(response){
            console.log("Error occurred in updateing "+ user.id);
        });
        
    };
    $scope.approve = function(userId){
        var user = getUserById(userId);
        userService.approve(user).success(function(response){
            var output = "Account Approval ";
            if(response === 'true'){
                output += "successful.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.update(user).error(function(response){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    $scope.block = function(userId){
        var user = getUserById(userId);
        userService.block(user).success(function(response){
            var output = "Account "+user.username+" has been blocked ";
            if(response === 'true'){
                output += "successfully.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.block(user).error(function(response){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    $scope.unblock = function(userId){
        var user = getUserById(userId);
        userService.unblock(user).success(function(response){
            var output = "Account "+user.username+" has been unblocked ";
            if(response === 'true'){
                output += "successfully.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.unblock(user).error(function(response){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    $scope.register = function()
    {
        var user = $scope.userInfo;
        userService.signup(user).success(function(response){
            var output = "Account Registration ";
            if(response !=null){
                output += "successful.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.signup(user).error(function(){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    $scope.promote = function(userId)
    {
        var user = getUserById(userId);
        userService.promote(user).success(function(response){
            var output = "Account Promotion ";
            if(response === "true" ){
                output += "successful.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.promote(user).error(function(){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    $scope.demote = function(userId)
    {
        var user = getUserById(userId);
        userService.demote(user).success(function(response){
            var output = "Account Demotion ";
            if(response === "true" ){
                output += "successful.";
                $scope.load();
            }
            else
                output += "unsuccessful.";
            alert(output);
        });
        userService.demote(user).error(function(){
            console.log("Error occurred in updateing "+ user.id);
        });
    };
    // HELPER FUNCTIONS
    var getUserById = function(userId)
    {
        for(var i=0;i<$scope.allUsers.length;i++)
            if($scope.allUsers[i].id === userId)
                return $scope.allUsers[i];
        return null;
    }
});
