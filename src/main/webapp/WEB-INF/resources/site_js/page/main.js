var app=angular.module('LO',['ngStorage']);

app.controller("navBarController", function($scope, $rootScope){  
    
    $scope.allLOs = function(){
        $rootScope.callAllLO();
    };    
    $scope.mostDownloadedLOs = function(){
        $rootScope.callAllMostDownloaded();
    };    
    $scope.mostLikedLOs = function(){
        $rootScope.callAllMostLiked();
    };
    $scope.modalInstance = function() {
        $rootScope.modalInstance();
    };
});


app.controller("LOcontroller", function($sessionStorage,$scope, $rootScope, loRepository, loTransactionService){
    
    $scope.ModalInstance = function(lo) {
        $rootScope.loprice = lo.price;
        $rootScope.lotitle = lo.title;
        $rootScope.lodescription = lo.description;
        $rootScope.loid = lo.id;
    };
    
    $scope.searchLO = function(title, subject, dateStart, dateEnd, orderBy) {
        loRepository.searchLO(title, subject, dateStart, dateEnd, orderBy).success(function(lo) {
            $rootScope.LOs = lo.searchlo;
            
            if(lo.searchlo == undefined)
                $scope.errorMessage = 'No learning objects found';
            
            $rootScope.lotitle = "";
            $rootScope.subject = "";
            $scope.dateStart = '';
            $scope.dateEnd = '';
            $scope.orderBy = "";
        });        
    };
    
    function displayAll() {
        loRepository.getAllLO().success(function(lo) {
            $rootScope.LOs = lo;
        });
    }    
    /// ADDED
    $rootScope.LOs = [];
    $rootScope.loprice = 0;
    $rootScope.lodescription = "";
    $rootScope.loid = "";
    $rootScope.lotitle = "";
    $rootScope.purchased = "";
    $rootScope.userID = "";
    $rootScope.credits = {user:$sessionStorage.user.credits};
    
    $rootScope.callAllMostDownloaded = function() {
        loRepository.getMostDownloaded().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
    
    $rootScope.callAllLO = function() {
        loRepository.getAllLO().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
    
    $rootScope.callAllMostLiked = function() {
        loRepository.getMostLiked().success(function(lo) {
            $rootScope.LOs = lo;
        });
    };
    
    displayAll();
    
    $rootScope.purchaseLO = function() {
        var transactionData = {
          "lo_id":$rootScope.loid,
          "u_Id":$sessionStorage.user.id,
          "amount":$rootScope.loprice,
          "errorList":null
        };
        loTransactionService.recordLOPurchase(transactionData).success(function(lo) {
            if(lo == "true") {
                alert('SUCCESS');
                $rootScope.purchased = lo;
            }
        });                
    };
});

app.controller("loriController",function($scope,$rootScope,loriService){
    $scope.displayLoris = [];
    $rootScope.lori = function(lori){
        var data = {
            learningObjectId:lori
        };
        var loriOfLO = loriService.getLORIsByLOId(data);
        loriOfLO.success(function(response){
            $scope.displayLoris = response;
        });
        loriOfLO.error(function(response){
            alert(response);
        });
    };
});