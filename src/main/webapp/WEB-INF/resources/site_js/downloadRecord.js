/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var drModule = angular.module("DR", []);

drModule.controller("downloadRecord", function($scope, recordRepository) {
    var errorList = "";

    $scope.callAllRecordsByUserID = function() {
        recordRepository.
    recordRepository.getAllLO().success(function(lo) {
        $scope.LOs = lo.downloadedLOs;
    });
    };
});
