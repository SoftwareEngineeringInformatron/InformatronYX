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
    
    
    setInterval($scope.load,5000);
    $scope.load();
});
app.factory('userService', function($http) {
    return {
        getAllUsers: function(){
            var url = "/InformatronYX/informatron/user/allUsers";
            return $http.get(url);
        },
        update: function(data){
            var url = "/InformatronYX/informatron/user/edit";
            return $http.post(url,data);
        },
        approve: function(data){
            var url = "/InformatronYX/informatron/user/approve";
            return $http.post(url,data);
        },
        block: function(data){
            var url = "/InformatronYX/informatron/user/block";
            return $http.post(url,data);
        },
        unblock: function(data){
            var url = "/InformatronYX/informatron/user/unblock";
            return $http.post(url,data);
        },
        promote: function(data){
            var url = "/InformatronYX/informatron/user/promote";
            return $http.post(url,data);
        },
        demote: function(data){
            var url = "/InformatronYX/informatron/user/demote";
            return $http.post(url,data);
        },
        getAllAdminUsers: function(){
            var url = "/InformatronYX/informatron/user/admins";
            return $http.get(url);
        },
        getAllCommonUsers: function(){
            var url = "/InformatronYX/informatron/user/commonUsers";
            return $http.get(url);
        },
        getAllPendingUsers: function(){
            var url = "/InformatronYX/informatron/user/pendingUsers";
            return $http.get(url);
        },
        login: function(data){
            var url = "/InformatronYX/informatron/user/login";
            return $http.post(url,data);
        },
        signup: function(data){
            var url = "/InformatronYX/informatron/user/signup";
            return $http.post(url,data);
        }
    };    
});