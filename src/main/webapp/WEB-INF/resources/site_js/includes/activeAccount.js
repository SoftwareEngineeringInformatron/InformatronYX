/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//angular.module("Account",["ngStorage"]).
app.controller('AccountController',function($scope,$sessionStorage,userService){
        
    var eligibilityChecker = [
        {type:['home','main']}, //GUEST
        {type:['main','mylos','history','setting','logout','quiz']},//COMMON
        {type:['main','mylos','history','admin','setting','logout','quiz']},//APPROVE ADMIN
        {type:['main','mylos','history','admin_meter','admin_history','setting','logout','quiz']},//METER ADMIN
        {type:['main','mylos','history','admin','super_admin','admin_meter','admin_history','setting','logout','quiz']},// SUPER ADMIN
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
                if(response != "") {
                    $scope.userInfo = $sessionStorage.user;
                    checkEligibility($scope.userInfo.functionType);
                    setInterval(function(){checkToken($sessionStorage.user)},1000);
                } else {
                    $sessionStorage.user = {username:"Guest",functionType:0};
                    $scope.userInfo = $sessionStorage.user;
                    checkEligibility($sessionStorage.user.functionType);
                }
            });
            getPromise.error(function(response){
                $sessionStorage.user = {username:"Guest",functionType:0};
                $scope.userInfo = $sessionStorage.user;
                checkEligibility($sessionStorage.user.functionType);
            });
    }
    
    function checkEligibility(functionType) {
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
    
    function checkToken(user) {
        userService.validate(user).success(function(response){
           if(response.length > 0) {
               $scope.destroySession();
               alert('Your account has been logged in to another device. You will now be redirected..');
           }
        });
    }
    
    function ted() {
        alert('');
    }
    
    function loadFunctions(){
        switch($scope.userInfo.functionType)
        {
            case 0: $scope.functions = [
                    {url: 'home'            ,str: 'Home'            },
                    {url: 'main'            ,str: 'Store'           }
                    ];break; // GUEST
            case 1: $scope.functions = [
                    {url: 'main'            ,str: 'Store'           },
                    {url: 'mylos'           ,str:'My collection'    },
                    {url: 'history'         ,str:'History'          },
                    {url: 'setting'         ,str: 'Account Settings'},
                  //  {url: 'login_signup'          ,str: 'Sign Out'        }
                    ];break; // COMMON
            case 3: $scope.functions = [
                    {url: 'main'            ,str: 'Store'           },
                    {url: 'mylos'           ,str: 'My collection'   },
                    {url: 'history'         ,str: 'History'         },
                    {url: 'setting'         ,str: 'Account Settings'},
                    {url: 'admin_meter'     ,str: 'Metering'        },
                    {url: 'admin_history'   ,str: 'Metering History'},
                    
                   // {url: 'login_signup'          ,str: 'Sign Out'        }
                    ];break; // ADMIN METER
            case 2: $scope.functions = [
                    {url: 'main'            ,str:'Store'            },
                    {url: 'mylos'           ,str:'My collection'    },
                    {url: 'history'         ,str:'History'          },
                    {url: 'setting'         ,str:'Account Settings' },
                    {url: 'admin'           ,str:'Admin View'       },
                    //{url: 'login_signup'          ,str: 'Sign Out'        }                    
                    ];break; // ADMIN APPROVAL
            case 4: $scope.functions = [
                    {url: 'main'            ,str: 'Store'           },//0
                    {url: 'mylos'           ,str: 'My collection'   },//1
                    {url: 'history'         ,str: 'History'         },//2
                    {url: 'setting'         ,str: 'Account Settings'},//3
                    {url: 'admin'           ,str: 'Admin View'      },//4
                    {url: 'admin_meter'     ,str: 'Metering'        },//5
                    {url: 'admin_history'   ,str: 'Metering History'},//6
                    {url: 'super_admin'     ,str: 'Super Admin View'},//7
                    //{url: 'login_signup'          ,str: 'Sign Out'        }
                    ];break; // SUPER ADMIN
        }
    }
    $scope.destroySession = function(){
        delete $sessionStorage.user;
        window.location = "home";
    }
    getUserFromSession();
    loadFunctions();
    //setInterval(getUserFromSession(),1000);
    //setInterval(loadFunctions(),1000);
});

app.controller('requestCreditController',function($scope,$sessionStorage,creditService){
    $scope.amount = 0;$scope.OR = "";

    $scope.requestCredits = function(){
      var jsonData = {
          u_ID: $sessionStorage.user.id,
          amnt: $scope.amount,
          or: $scope.OR
      };
      creditService.addTransaction(jsonData).success(
              function(response){
                  if(response.errorList.length > 0){
                      var string = "";
                      for(var i=0;i<response.errorList.length;i++)
                          string+= "Error" + (i + 1)+":  "+ response.errorList[i] + "\n";
                      alert(string);
                      $scope.amount = 0;$scope.OR = "";
                  }
                  else{
                      alert("Request has been submitted successfully.");
                      $scope.amount = 0;$scope.OR = "";
                  }
                }
      );
    };
    
});