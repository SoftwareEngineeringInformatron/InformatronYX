/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//angular.module("Account",["ngStorage"]).
app.controller('AccountController',function($scope,$sessionStorage,userService){
        
    var eligibilityChecker = [
        {type:['home','main']},
        {type:['main','downloads','mylos','setting','logout']},
        {type:['main','downloads','mylos','setting','logout']},
        {type:['main','downloads','mylos','approveadmin','setting','logout']},
        {type:['main','downloads','mylos','super_admin','admin_meter','admin_history','setting','logout']},
    ];
    
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
        checkEligibility($sessionStorage.user.functionType);
    }
    
    function checkEligibility(functionType) {
        if(functionType == undefined)
            functionType = 0;
        var currentURL = window.location.toString().split('/store/')[1];
        var userFunction = eligibilityChecker[functionType].type;
        var flag = 0;
        for(var i=0; i < userFunction.length; i++) {
            if(userFunction[i] == currentURL) {
                flag = 1;
                break;
            }
        }
        if(flag == 0)
            window.location.href = "main";
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
                    {url: 'mylos',str:'My collection'},
                    {url: 'setting',str: 'Account Settings'},
                    {url: 'logout',str: 'Sign Out'}
                    ];break; // COMMON
            case 2: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'mylos',str:'My collection'},
                    {url: 'admin_meter',str: 'Metering'},
                    {url: 'admin_history',str: 'Metering History'},
                    {url: 'setting',str: 'Account Settings'},
                    {url: 'logout',str: 'Sign Out'}
                    ];break; // ADMIN METER
            case 3: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'mylos',str:'My collection'},
                    {url: 'approveadmin',str: 'Admin View'},
                    {url: 'setting',str: 'Account Settings'},
                    {url: 'logout',str: 'Sign Out'}                    
                    ];break; // ADMIN APPROVAL
            case 4: $scope.functions = [
                    {url: 'main',str: 'Store'},
                    {url: 'downloads',str: 'My LOs'},
                    {url: 'mylos',str:'My collection'},
                    {url: 'super_admin',str: 'Super Admin View'},
                    {url: 'admin_meter',str: 'Metering'},
                    {url: 'admin_history',str: 'Metering History'},
                    {url: 'setting',str: 'Account Settings'},
                    {url: 'logout',str: 'Sign Out'}
                    ];break; // SUPER ADMIN
        }
    }
    getUserFromSession();
    loadFunctions();
    setInterval(getUserFromSession(),1000);
    setInterval(loadFunctions(),1000);
});