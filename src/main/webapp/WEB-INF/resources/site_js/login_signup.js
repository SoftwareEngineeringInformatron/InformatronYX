/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("login_signup",["ngStorage"]);
app.controller("login_signupController", function($scope,$sessionStorage,userService){
    $scope.userInfo = {
        firstName : "",
        lastname : "",
        email:"",
        username:"",
        password:""
    };
    $scope.invalidEmail = true;
    
    $scope.login = function(){
        $scope.errorList = [];
        userService.login($scope.userInfo).success(function (response){
            $sessionStorage.user = response;
            if($sessionStorage.user.token!=null){
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
        userService.signup(userInfo).success(function (response){
            alert('Response');
        });
    };
    $scope.clear = function(){
        $scope.firstName = "";
        $scope.lastname = "";
        $scope.email="";
        $scope.username="";
        $scope.password="";
    };
    
    
});






/*
$(document).ready(function() {
        $("#username, #password").val("");

        $('#slider_now').nivoSlider();
        
        $('#btn-signup:submit').click(function(e) {
            if( !isValidEmailAddress( $("#email").val() ) ) { 
                $('.error_message_1').text("Invalid email");
                $('#email').addClass('addborder');
                    e.preventDefault();
            }
            if($('#a_pass').val() != $('#a_conpass').val()) {
                $('.error_message').text("Confirmation password does not match password");
                $('#a_pass, #a_conpass').addClass('addborder');
                e.preventDefault();
            }
        });
        $('#email, #a_pass, #a_conpass').on('keydown', function() {
            if($(this).hasClass('addborder')) {
                $(this).removeClass('addborder');
                $(this).val('');
                $('.error_message').text('');
                $('.error_message_1').text('');
            }
        });
        */
        /*
        var switchit = "";
        <%   
            if(session.getAttribute("action") == "signup") {
        %>
        switchit = "signup";
        <% 
            }else {
        %>
        switchit = $.getURLParameter('action');
        <% } %>
            */
        // Edited     
       /*
        var switchit = get("action");
        if(switchit == 'signup') 
		$.switchPage(switchit);
	else if(switchit == 'login') 
		$.switchPage(switchit);
        // ADDED 
        $("#btn-signup").click(function(){
            var jsonData = 
                        JSON.stringify({
			firstName : $("#fname").val(), 
			lastname: $("#lname").val(),
                        email: $("#email").val(),
                        username:$("#uname").val(),
			password: $("#a_pass").val()
                        });
            $.ajax({
                url: "/InformatronYX/informatron/user/signup",
                contentType:'application/json',
                data: jsonData,
                dataType: 'json',
                type: "POST",
                success: function(data, status, jqXHR){
                    if(data.errorList.length>0){
                        alert("Registration Succesful!");
                        $.switchPage("login");
                    }
                },
		error: function(jqXHR, status, error) {;
		}
            });
        });
        $("#btn-login").click(function(){
            var jsonData = 
                        JSON.stringify({
			username:$("#username").val(),
			password: $("#password").val()
                        });
            $.ajax({
                url: "/InformatronYX/informatron/user/login",
                contentType:'application/json',
                data: jsonData,
                dataType: 'json',
                type: "POST",
                success: function(data, status, jqXHR){
                    if(data.errorList.length>0){
                        alert("Login Succesful!");
                        
                       // $.switchPage("login");
                    }
                },
		error: function(jqXHR, status, error) {;
		}
            });
        });
    });
    function get(name){
        if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
           return decodeURIComponent(name[1]);
    }
    */
