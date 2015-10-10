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
                    {url: 'home',str: 'Home'},
                    {url: 'main',str: 'Store'}
                    ];break; // GUEST
            case 1: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'logout',str: 'Sign Out'}
                    ];break; // COMMON
            case 2: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'admin_meter',str: 'Metering'},
                    {url: 'admin_history',str: 'Metering History'},
                    {url: 'logout',str: 'Sign Out'}
                    ];break; // ADMIN METER
            case 3: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'approveadmin',str: 'Admin View'},
                    {url: 'logout',str: 'Sign Out'},                    
                    ];break; // ADMIN APPROVAL
            case 4: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'super_admin',str: 'Super Admin View'},
                    {url: 'admin_meter',str: 'Metering'},
                    {url: 'admin_history',str: 'Metering History'},
                    {url: 'logout',str: 'Sign Out'}
                    
                    ];break; // SUPER ADMIN
        }
    }
    getUserFromSession();
    loadFunctions();
    setInterval(getUserFromSession(),1000);
    setInterval(loadFunctions(),1000);
});