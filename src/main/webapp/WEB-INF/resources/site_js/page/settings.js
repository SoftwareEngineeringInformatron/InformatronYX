/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("Settings",['ngStorage']);

app.controller("UpdateController",function($scope,userService,$sessionStorage){
    if($sessionStorage.user.id == null){
        alert("No User found!");
        window.location="home";
    }
    $scope.displayUser = $sessionStorage.user;
    $scope.firstNameChanged = false;
    $scope.lastNameChanged = false;
    $scope.emailChanged = false;
    $scope.userNameChanged = false;
    $scope.passwordChanged = false;
    
    $scope.change = function(){
        if($sessionStorage.user.firstName != $scope.displayUser.firstName)
            $scope.firstNameChanged = true;
        else
            $scope.firstNameChanged = false;
        
        if($sessionStorage.user.lastName != $scope.displayUser.lastName)
            $scope.lastNameChanged = true;
        else
            $scope.lastNameChanged = false;
        
        if($sessionStorage.user.email != $scope.displayUser.email)
            $scope.emailChanged = true;
        else
            $scope.emailChanged = false;
        if($sessionStorage.user.username != $scope.displayUser.username)
            $scope.userNameChanged = true;
        else
            $scope.userNameChanged = false;
        
        if($sessionStorage.user.password != $scope.displayUser.password)
            $scope.passwordChanged = true;
        else
            $scope.passwordChanged = false;
    };
    $scope.enableSave = function(){
        return $scope.firstNameChanged || $scope.lastNameChanged || $scope.emailChanged;
        
    };
    $scope.errorList = [];
    $scope.numTries = 5;
    $scope.updateAccount = function(){
        $scope.checkDisplayUser();
        if($scope.errorList.length == 0){
            var updatePromise = userService.update($scope.displayUser);
            updatePromise.success(function(response){
                if(response == 'true'){
                    alert("Successfully updated your account information.");
                    $scope.updateSessionToDisplay();
                }
            });
            updatePromise.error(function(){
                alert("Something's wrong. Please try again later.");
            });
        }
    };
    $scope.checkDisplayUser = function(){
        $scope.errorList = [];
        if($scope.displayUser.email == null)
            $scope.errorList.push("Email not valid");
        
    };
    
    $scope.updateSessionToDisplay = function(){
      $scope.displayUser = $sessionStorage.user;
      $scope.firstNameChanged = false;
      $scope.lastNameChanged = false;
      $scope.emailChanged = false;
    };
//  setInterval($scope.updateSessionToDisplay,1000);
    $scope.saveAccount = function(username,password){
      if(username!= $sessionStorage.user.username || password != $sessionStorage.user.password){
          if($scope.numTries>0){
              alert("Incorrect input. Your number of tries will be deducted");
              $scope.numTries--;
          }
      }
      else{
          $scope.numTries = 5;
          $scope.updateAccount();
      }
    };
    
    $scope.changePassword = function(oldPassword,newPassword,confirmPassword){
        if((oldPassword != $sessionStorage.user.password)){
            $scope.openErrorModal("Old password is incorrect. Your number of tries will be deducted.");
            $scope.numTries--;
        }
        else if((newPassword != confirmPassword) ){
            $scope.openErrorModal("New password and Confirm password does not match.");
        }
        else
        {
            $scope.displayUser.password = newPassword;
            $scope.change();
        }
    };
    $scope.enableSave2 = function(){
        return $scope.userNameChanged || $scope.passwordChanged;
        
    };
    
    $scope.openErrorModal = function(message){
        alert(message);
    };
});