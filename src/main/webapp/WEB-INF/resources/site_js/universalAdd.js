/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module("addApp",[]);
        app.controller('buttonController', function($scope, $http){
           
           var los = [
               {"id":null,"title":'Test 1',"subject":null,"description":null,"downloads":0,"uploadDate":null,"likes":0,"sequence":null,"price":0.0},
               {"id":null,"title":'Test 2',"subject":null,"description":null,"downloads":0,"uploadDate":null,"likes":0,"sequence":null,"price":0.0},
               {"id":null,"title":'Test 3',"subject":null,"description":null,"downloads":0,"uploadDate":null,"likes":0,"sequence":null,"price":0.0}
           ];
           $scope.addLO = function(){
               var req = {
                 url:  '/InformatronYX/informatron/LO/upload/avaiableLOs',
                 contentType:'application/json',
                 data: JSON.stringify(los),
                 dataType: 'json',
                 method: "POST",
               };
               $http(req).then(
                   function(response){
                        alert("Upload Successful!");
               
                   },
                   function(response){
                       alert("Upload Unuccessful!");
                       
                   }
               );
           };
           
});