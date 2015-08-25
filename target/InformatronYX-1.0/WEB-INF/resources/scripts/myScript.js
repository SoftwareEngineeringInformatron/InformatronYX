var app = angular.module('myApp', ['ngGrid']);
app.controller('MyCtrl', function($scope) {
    
    $scope.names = [];

    $scope.submitName = function(){
    
        var ok = false;
    
        if($scope.names.length == 0)
            $scope.names.push({name:$scope.name, count:1});

        else{
            $scope.names.forEach(function(name) {
                if(name.name == $scope.name){
                    name.count++;
                    ok = true;
                    return false;
                }
            });

            if(!ok)
                $scope.names.push({name:$scope.name, count:1});
        }


    };

    $scope.gridOptions = { data: 'names' };
});