/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

       

var quizApp = angular.module("QUIZ", []);
    quizApp.controller("lolController", function($scope,$http){
    var errorList = "";
    
    $scope.datepickerON = function () {
        $('#datetimepicker1, #datetimepicker2').datetimepicker();
    }
    $scope.datepickerON();
        
    $scope.addQuiz = function () {
        var quizJson = {
          "id":null,
          "lo_id":null,
          "lo_name": $scope.lo,
          "score": $scope.score,
          "subject": "",
          "totalScore":0,
          "date_submitted": null,
          "time_started": new Date(document.getElementById('time_started').value),
          "time_finished": new Date(document.getElementById('time_finished').value),
          "username": $scope.student,
          "user_id": 0,
          "quizResults":null,
          "errorList":[]
        };
        
        var angularPromise = $http.post("/InformatronYX/informatron/quiz/submit", quizJson);
            angularPromise.success(function(data) {
                    if(data.errorList.length === 0) {
                        alert("Added Quiz successfully!");
                        location.reload();
                    } else {
                        var errorMsg = "Errors:\n";
                        for(var i = 0; i < data.errorList.length; i ++)
                            errorMsg += data.errorList[i] + "\n";
                            console.log(errorMsg);
                    }
        })  .error(function(data,status,header,config) {
            
        });
    }
});