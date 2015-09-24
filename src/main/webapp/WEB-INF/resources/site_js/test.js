/* 
 * User Controller and Service
 * Author: Ted Ian B. Osias BSCS-4
 * Date: September 18,2015
 */


var app = angular.module("credit",[]);
app.controller("loTransactionContoller",function ($scope,$http,userService,creditService){
    $scope.users = [];
    $scope.transactions = [];
    $scope.selectedId = '';
    $scope.select = function(id){ $scope.selectedId = id;};
    function load(){
        userService.getAllUsers().success(
            function(reponse){
                $scope.users  = reponse;
                loadTransactions();
            }
        );
    }
    function loadTransactions(){
        $scope.transactions = [];
        for(var i=0;i<$scope.users.length;i++)
            creditService.getAllTransactions({id: $scope.users[i].id}).success(
                function(response){
                    response.forEach(function(data){
                        $scope.transactions.push(data);
                    });
                }
            );
        $scope.selectedId = $scope.users[0].id;
    }
    
    $scope.approveTransaction = function (transactionId){
        creditService.approveTransaction({id:transactionId}).success(function(response){
            if(response == 'true')
                load();
            
        });
        
    };
    $scope.removeTransaction = function (transactionId){
        creditService.removeTransaction({id:transactionId}).success(function(response){
            if(response == 'true')
                load();
        });
        
    };
    $scope.removeCredits = function(id,amount){
         var data = {
          u_ID: id,
          amnt: amount,
          //appBy:''
      };
      creditService.addRemoveTransaction(data).success(function(response){
          if(response == 'true')
                      load();
                
      });
    };
    $scope.record = function(id,amount,officialReciept){
      var jsonData = {
          u_ID: id,
          amnt: amount,
          or: officialReciept
          //appBy:''
      };
      creditService.addTransaction(jsonData).success(
              function(response){
                  if(response.errorList.length > 0){
                      var string = "";
                      for(var i=0;i<response.errorList.length;i++)
                          string+= "Error" + (i + 1)+":  "+ response.errorList[i] + "\n";
                      alert(string);
                  }
                  else if(response.result == 'true')
                      load();
                }
      );
    };
    load();
    
});
