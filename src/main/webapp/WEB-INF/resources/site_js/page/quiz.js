/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("QuizResults",["ngStorage"]);
app.controller('QuizController',function($sessionStorage,$scope,$rootScope,userService,quizService,loRepository){
    var los = [];
    
    function load() {
        var data = {
            "lo_name":getValue("id"),
            "username":$sessionStorage.user.username
        };
        
        quizService.getquizResults(data,$sessionStorage.user.functionType).success(function(response){
            $scope.quiz = response;
        });
        
        loRepository.getAllLO().success(
            function(response) {
                los = response;
        });
    }
    
    function getValue(id) {
        var Param = window.location.toString().split('?')[1];
        var sepParam = Param.split('&');
        for(var j=0; j < sepParam.length;j++) {
            sepVal = sepParam[j].split('=');
            for(var i=0; i < sepVal.length; i++) {
                if(sepVal[i] == id)
                    return sepVal[i+1];
            }
        }
    }
    
    function getSubject(name) {
        for(var i=0; i < los.length; i++) {
            if(los[i].title == name)
                return los[i].subject;
        }
    }
    
    function getID(name) {
        for(var i=0; i < los.length; i++) {
            if(los[i].title == name)
                return los[i].id;
        }
    }
    
    load();
});