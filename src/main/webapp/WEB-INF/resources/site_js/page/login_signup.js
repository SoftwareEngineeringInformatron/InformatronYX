/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("login_signup",["ngStorage"]);
app.controller("login_signupController", function($scope,$sessionStorage,userService){
    $scope.userInfo = {
        firstName : "",
        lastName : "",
        email:"",
        username:"",
        password:""
    };
    $scope.load = function(){
        if($sessionStorage.user!=null){
            if(confirm("You have an existing session. Do you want to login with the same account?"))
                window.location="main";
            else
                delete $sessionStorage.user;
        }
    }
    
    $scope.invalidEmail = true;
    
    $scope.login = function(){
        $scope.errorList = [];
        userService.login($scope.userInfo).success(function (response){
            if(response.token!=null){
                $sessionStorage.user = response;
                window.location.href= "main";
            }
        });
    };
    $scope.isValidEmail = function (emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    };
    $scope.signup = function(){
        $scope.errorList = [];
        userService.signup($scope.userInfo).success(function (response){
            if(response.errorList.length==0)
                alert('Response');
        });
    };
    $scope.clear = function(){
        $scope.firstName = "";
        $scope.lastName = "";
        $scope.email="";
        $scope.username="";
        $scope.password="";
    };
    function get(name)
    {
            if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
               return decodeURIComponent(name[1]);
    }
    $scope.load();
});


$(document).ready(function() {
        $('#slider_now').nivoSlider();
    });