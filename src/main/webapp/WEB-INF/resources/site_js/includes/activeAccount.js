/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//angular.module("Account",["ngStorage"]).
app.controller('AccountController',function($scope,$http,$sessionStorage){
    
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
        if($sessionStorage.user!=null)
            $scope.userInfo = $sessionStorage.user;
        // REDIRECT IF NULL
    }
    function loadFunctions(){
        switch($scope.userInfo.functionType)
        {
            case 0: $scope.functions = [
                    {url: 'home',str: 'Home'}
            ];break; // GUEST
            case 1: $scope.functions = [
                    {url: 'home',str: 'Home'},
                    {url: 'downloads',str: 'My LOs'}
            ];break; // COMMON
            case 2: $scope.functions = [
                    {url: 'home',str: 'Home'},
                    {url: 'meteradmin',str: 'Metering View'}
            ];break; // ADMIN METER
            case 3: $scope.functions = [
                    {url: 'home',str: 'Home'},
                    {url: 'approveadmin',str: 'Approval View'}
            ];break; // ADMIN APPROVAL
            case 4: $scope.functions = [
                    {url: 'home',str: 'Home'},
                    {url: 'super',str: 'Supser Admin Mode'}
            ];break; // SUPER ADMIN
        }
    }
    getUserFromSession();
    loadFunctions();
});