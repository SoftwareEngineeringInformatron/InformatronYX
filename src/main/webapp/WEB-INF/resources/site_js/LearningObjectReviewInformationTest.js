/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var LORIapp = angular.module("LO", []);
    LORIapp.controller("LORIController", function($scope,$http) {
        var errorList = 0;
        
        $scope.submitReview = function () {
        var LORIJson = {
          "id":null,
          "evaluation": "This is a test evaluation!",
          "reviewId": "reviewId",
          "learningObjectId": "LearningObjectId",
          "subject": "math",
          "errorList":[]
        };
        
        var angularPromise = $http.post("/InformatronYX/informatron/lori/submit", LORIJson);
            angularPromise.success(function(data) {
                    if(data.errorList.length === 0) {
                        alert("Added LORI successfully!");
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
        
        $scope.deleteReview = function() {
          var LORIJson = {
          "id":null,
          "evaluation": "This is a test evaluation!",
          "reviewId": "reviewId",
          "learningObjectId": "LearningObjectId",
          "subject": "math",
          "errorList":[]
        };
        
        var angularPromise = $http.post("/InformatronYX/informatron/lori/delete", LORIJson);
            angularPromise.success(function(data) {
                    if(data.errorList.length === 0) {
                        alert("Deleted LORI successfully!");
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
        
        $scope.editReview = function() {
          var LORIJson = {
          "id":null,
          "evaluation": "This is a test evaluation! EDITED",
          "reviewId": "reviewId",
          "learningObjectId": "LearningObjectId",
          "subject": "math",
          "errorList":[]
        };
        
        var angularPromise = $http.post("/InformatronYX/informatron/lori/edit", LORIJson);
            angularPromise.success(function(data) {
                    if(data.errorList.length === 0) {
                        alert("Edited LORI successfully!");
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
        
        $scope.returnedLORI = "";
        
        $scope.getReview = function() {
        var angularPromise = $http.get("/InformatronYX/informatron/lori/LORIs");
            angularPromise.success(function(data) {
                    if(errorList === 0) {
                        alert("Retrieved data successfully!");
                        $scope.returnedLORI = data;
                    } else {
                        var errorMsg = "Errors:\n";
                        for(var i = 0; i < errorList; i ++)
                            errorMsg += data.errorList[i] + "\n";
                            console.log(errorMsg);
                    }
        })  .error(function(data,status,header,config) {
            
        });
        }
    });