/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var quizApp = angular.module("QUIZ",[]);
    quizApp.controller("loController", function($scope,$http) {
    var errorList = 0;
        
        $scope.viewQuiz = function() {
            $scope.quizList = [];
            
            var angularPromise = $http.get("/InformatronYX/informatron/quiz/results");
            angularPromise.success(function(data) {
                if(errorList === 0) {
                        alert('');
                        $scope.quizList = data;
                    } else {
                        var errorMsg = "Errors:\n";
                        for(var i = 0; i < errorList; i ++)
                            errorMsg += data.errorList[i] + "\n";
                            console.log(errorMsg);
                    }
        }) .error(function(data,status,header,config) {
                
        });
    }
    
    $scope.viewQuiz();
});