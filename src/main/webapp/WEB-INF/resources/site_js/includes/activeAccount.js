/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//angular.module("Account",["ngStorage"]).
app.controller('AccountController',function($scope,$sessionStorage,userService){
    
    $scope.userInfo = {
        functionType : 0
        
    };
    $scope.functions = [
        {
            url: 'main',
            str: 'LO Repository'
        },
        {
            url: 'approveadmin',
            str: 'Approval View'
        }
        
    ];
    function getUserFromSession(){
        var getPromise = userService.get($sessionStorage.user);
            getPromise.success(function(response){
                $sessionStorage.user = response ;
            });
            getPromise.error(function(response){
                $sessionStorage.user = response ;
            });
        if($sessionStorage.user!=null){
            $scope.userInfo = $sessionStorage.user;
        }
        // REDIRECT IF NULL
    }
    function loadFunctions(){
        switch($scope.userInfo.functionType)
        {
            case 0: $scope.functions = [
                    {url: 'home',str: 'Home'}
                    ];break; // GUEST
            case 1: $scope.functions = [
                    {url: 'downloads',str: 'My LOs'},
                    
                    ];break; // COMMON
            case 2: $scope.functions = [
                    {url: 'main',str: 'Main'},
                    {url: 'admin_meter',str: 'Metering View'},
                    {url: 'admin_history',str: 'Metering History'},
                    ];break; // ADMIN METER
            case 3: $scope.functions = [
                    {url: 'approveadmin',str: 'Approval View'},
                    
                    ];break; // ADMIN APPROVAL
            case 4: $scope.functions = [
                    {url: 'super',str: 'Super Admin Mode'},
                    
                    ];break; // SUPER ADMIN
        }
    }
    getUserFromSession();
    loadFunctions();
    setInterval(getUserFromSession(),1000);
    setInterval(loadFunctions(),1000);
});