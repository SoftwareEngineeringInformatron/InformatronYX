/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var LORIapp = angular.module("LORI", []);
    LORIapp.controller("LORIController", function($scope,$http) {
        var errorList = "";
        
        $scope.submitReview = function () {
        var LORIJson = {
          "id":null,
          "evaluation": "This is a test evaluation!",
          ""
          "errorList":[]
        };
    });