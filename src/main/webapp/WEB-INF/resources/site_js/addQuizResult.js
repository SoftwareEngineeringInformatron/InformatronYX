/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

       

var quizApp = angular.module("QUIZ", []);
    quizApp.controller("lolController", function($scope,$http){
    var errorList = "";
    
    $scope.addQuiz = function () {
        alert('');
        var quizJson = {
          "id":null,
          "lo_id":null,
          "lo_name": $scope.lo,
          "score": $scope.score,
          "totalScore":0,
          "date_submitted":null,
          "time_started": $scope.time_started,
          "time_finished": $scope.time_finished,
          "username": $scope.student,
          "user_id":0,
          "quizResults":null,
          "errorList":[]
        };
        
        var WALANGFOREVER = $http.post("/InformatronYX/informatron/quiz/submit", quizJson);
            WALANGFOREVER.success(function(data,status,header,config) {
                    if(data.errorList.length === 0) {
                        alert("Added Quiz successfully!");
                        location.reload();
                    } else {
                        var errorMsg = "";
                        for(var i = 0; i < data.errorList.length; i ++)
                            errorMsg += data.errorList[i] + "\n";
                        console.log(errorMsg);
                    }
        })  .error(function(data,status,header,config) {
            
        });
    }
});