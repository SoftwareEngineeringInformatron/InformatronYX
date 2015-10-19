/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module('Admin',["ngStorage"]);

app.controller("adminAccountManagementController",function($scope,$rootScope,userService){
    $scope.allUsers = [];
    $scope.errorList = [];
    $rootScope.displayedUsers = [];
    $rootScope.actions = [
        'newUserMassAction',    //0
        'allAccountMassAction', //1
        'inactiveMassAction',   //2
        'blockMassAction',      //3
        'promoteActions',       //4
        'promoteAction',        //6
        'allAccountAction',     //7
        'newUserAction',        //8
        'inactiveAction',       //9
        'blockAction',           //9
        'errorMessage'         //10
    ];
    $rootScope.action = 'all';
    $rootScope.selectedUsers = [];
    $scope.buttonAction = '';
    $scope.enableButton = true;
    $scope.selectedCheck = function(){
        var count = 0;
        for( var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                count=1;
                break;
            }
        }
        $scope.enableButton = count <= 0;
    }
    $rootScope.allAccounts = function (){
        userService.getAllCommonUsers().success(function(response){
        //userService.getAllUsers().success(function(response){
            $rootScope.selectedUsers = [];
            $scope.allUsers = response;
            $rootScope.displayedUsers = response;
            $scope.buttonAction = '#'+$rootScope.actions[1];
            for(var i=0;i<response.length;i++)
                $rootScope.selectedUsers.push(false);
        });
    };
    $rootScope.newAccounts = function(){
        userService.getAllPendingUsers().success(function(response){
            $rootScope.selectedUsers = [];
            $rootScope.displayedUsers = response;
            $scope.buttonAction = '#'+$rootScope.actions[0];
            for(var i=0;i<response.length;i++)
                $rootScope.selectedUsers.push(false);
        });
    };
    $rootScope.blockedAccounts = function (){
        userService.getBlockedUsers().success(function(response){
            $rootScope.selectedUsers = [];
            $rootScope.displayedUsers = [];
            //$rootScope.displayedUsers = response;
            $scope.buttonAction = '#'+$rootScope.actions[3];
            for(var i=0;i<response.length;i++){
                    if(response[i].userType == "User"){
                        $rootScope.displayedUsers.push(response[i]);
                        $rootScope.selectedUsers.push(false);
                     }
            }
        });
    };
    $rootScope.inactiveAccounts = function (){
        userService.getInactiveUsers().success(function(response){
            $rootScope.selectedUsers = [];
            $rootScope.displayedUsers = [];
            //$rootScope.displayedUsers = response;
            $scope.buttonAction = '#'+$rootScope.actions[2];
            for(var i=0;i<response.length;i++){
                if(response[i].userType == "User"){
                   $rootScope.displayedUsers.push(response[i]);
                   $rootScope.selectedUsers.push(false);
                }
            }
        });
    };
    $rootScope.allAccounts();
    // MASS ACTION
    $scope.promoteMass = function(functionType){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                var user = $rootScope.displayedUsers[i];
                user.functionType = functionType;
                $scope.promote(user);
            }
        }
        $rootScope.allAccounts();
    };
    $scope.approveMass = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                var user = $rootScope.displayedUsers[i];
                $scope.approve(user);
            }
        }
        $rootScope.allAccounts();
        $rootScope.newAccounts();
    };
    $scope.declineMass = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                var user = $rootScope.displayedUsers[i];
                $scope.decline(user);
                $rootScope.newAccounts();
            }
        }
        
    };
    $scope.unblockMass = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                var user = $rootScope.displayedUsers[i];
                $scope.unblock(user);
            }
        }
        $rootScope.allAccounts();
        $rootScope.blockedAccounts();
    };
    $scope.blockMass = function(){
        for(var i=0;i<$rootScope.selectedUsers.length;i++){
            if($rootScope.selectedUsers[i] == true){
                var user = $rootScope.displayedUsers[i];
                $scope.block(user);
            }
        }
        $rootScope.allAccounts();
        $rootScope.blockedAccounts();
    };
    // SINGLE ACTION
    $scope.promote = function(user){
        var promotePromise = userService.promote(user);
        var result = false;
        promotePromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        promotePromise.error(function(response){
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
    $scope.unblock = function(user){
        var blockPromise = userService.unblock(user);
        var result = false;
        blockPromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        blockPromise.error(function(){
            $scope.errorList.push("An error has come up upon blocking "+user.username);
        });
        return result;
    };
    $scope.approve = function(user){
        var approvePromise = userService.approve(user);
        var result = false;
        approvePromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        approvePromise.error(function(response){
            $scope.errorList.push("An error has come up upon blocking "+user.username);
        });
        return result;
    };
    $scope.decline = function(user){
        var declinePromise = userService.decline(user);
        var result = false;
        declinePromise.success(function(response){
            if(response == 'true')
                result = true;
        });
        declinePromise.error(function(response){
            $scope.errorList.push("An error has come up upon blocking "+user.username);
        });
        return result;
        
    };
});
app.controller("adminNavBarController",function($scope,$rootScope){
    $scope.curentAction = "all";
    
    $scope.isActive = function(action){
      var b = (currentAction ==  action) ? 'active' : '';        
      return 'active';
    };
    $scope.allAccounts = function(){
        $rootScope.allAccounts();
        $scope.curentAction = "all";
    };
    $scope.newAccounts = function(){
        $rootScope.newAccounts();
        $scope.curentAction = "new";
    };
    $scope.blockedAccounts = function(){
        $rootScope.blockedAccounts();
        $scope.curentAction = "block";
    };
    $scope.inactiveAccounts = function(){
        $rootScope.inactiveAccounts();
        $scope.curentAction = "inactive";
    };
    
});