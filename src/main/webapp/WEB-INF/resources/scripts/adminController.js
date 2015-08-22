var adminModule = angular.module('Admin', ['Metering','User','tableExample']);

adminModule.controller('adminController', function($scope, $compile, userRepository) {
    /* Accounts */
    
    
    
    $scope.setAcceptID = -1;
    
    $('.tempID').on("click", function() {
            $scope.setAcceptID = $(this).attr('id');
    });
    
    $scope.callUpdate = function() {
        userRepository.getAllSiteUsers().success(function(users) {
            $scope.siteuser = users.siteuser;
        });
        userRepository.getAllNewUsers().success(function(users) {
            $scope.newuser = users.newuser;
        });
        userRepository.getAllBlockedUsers().success(function(users) {
            $scope.blockuser = users.blockuser;
        });
        userRepository.getAllInactiveUsers().success(function(users) {
            $scope.inactiveuser = users.inactiveuser;
        });
    };
    
    userRepository.getAllLO().success(function(lo) {
        $scope.LOs = lo;
    });
    
    $scope.promoteUser = function(ftype) {
        var utype;
        
        if($scope.functiontype != undefined) {
            if(ftype == 1 || ftype == 2)
                utype = "admin";
            else if(ftype == 3)
                utype = "superadmin";
            userRepository.promoteUser($scope.setAcceptID,utype,ftype).success(function(users) {
                    userRepository.getAllSiteUsers().success(function(users) {
                        $scope.siteuser = users.siteuser;
                    });
                $scope.setAcceptID = -1;
            }); 
        }else {
            $('#message .file-action').text("No function selected");
            $('#message').modal('show');
        }
    };
    
    $scope.acceptUser = function() {
        
        userRepository.acceptUser($scope.setAcceptID).success(function(users) {
            userRepository.getAllNewUsers().success(function(users) {
                
                $scope.newuser = users.newuser;
                
                userRepository.getAllSiteUsers().success(function(users) {
                    $scope.siteuser = users.siteuser;
                });
                
            });
            
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.declineUser = function() {
        
        userRepository.declineUser($scope.setAcceptID).success(function(users) {
            userRepository.getAllNewUsers().success(function(users) {
                $scope.newuser = users.newuser;
            });
            
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.blockUser = function() {
        
        userRepository.blockUser($scope.setAcceptID).success(function(users) {
            $scope.callUpdate();
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.unblockUser = function() {
        
        userRepository.unblockUser($scope.setAcceptID).success(function(users) {
            $scope.callUpdate();
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.download = function(path) {
        userRepository.download(path).success(function(users) {});
    }
    
    $scope.callUpdate();
    
    $scope.setID = function(id) {
        $scope.setAcceptID = id;
    };
    
    //--------------- ADDED BY JAMES -----------
    $scope.acceptUsers = function() {
        
        var newUserIDs = "";
        var checkedNewUsers = $("#new-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedNewUsers.length ; i++){
            newUserIDs += checkedNewUsers[i].id;
            if(i !== checkedNewUsers.length - 1)
                newUserIDs += ",";
        }
        
        if(newUserIDs !== ""){
            userRepository.acceptUsers(newUserIDs).success(function() {
                userRepository.getAllNewUsers().success(function(users) {

                    $scope.newuser = users.newuser;

                    userRepository.getAllSiteUsers().success(function(users) {
                        $scope.siteuser = users.siteuser;
                    });

                });
            });
        }
    };
    
    // ---------------- ADDED BY JAMES -----------------
    $scope.declineUsers = function() {
        
        var newUserIDs = "";
        var checkedNewUsers = $("#new-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedNewUsers.length ; i++){
            newUserIDs += checkedNewUsers[i].id;
            if(i !== checkedNewUsers.length - 1)
                newUserIDs += ",";
        }
        
        if(newUserIDs !== ""){
            userRepository.declineUsers(newUserIDs).success(function() {
                userRepository.getAllNewUsers().success(function(users) {

                    $scope.newuser = users.newuser;

                    userRepository.getAllSiteUsers().success(function(users) {
                        $scope.siteuser = users.siteuser;
                    });

                });
            });
        }
    };
    

    //------------------- ADDED BY JAMES -----------------------
    $scope.promoteUsers = function(ftype) {
        var utype;
        var userIDs = "";
        var checkedUsers = $("#all-account .someCheckbox:checked");
        
        
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
            if($scope.functiontype != undefined) {
                if(ftype == 1 || ftype == 2)
                    utype = "admin";
                else if(ftype == 3)
                    utype = "superadmin";

                userRepository.promoteUsers(userIDs,utype,ftype).success(function(users) {
                        userRepository.getAllSiteUsers().success(function(users) {
                            $scope.siteuser = users.siteuser;
                        });

                    $scope.setAcceptID = -1;
                    $scope.checked = false;
                }); 
            }else {
                $('#message .file-action').text("No function selected");
                $('#message').modal('show');
            }
        }
    };
    
    //-------------- ADDED BY JAMES ----------------
    $scope.blockUsers = function(checkboxClass) {
        var userIDs = "";
        var checkedUsers = $("#"+ checkboxClass +" .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        if(userIDs !== ""){
            userRepository.blockUsers(userIDs).success(function(users) {
                $scope.callUpdate();
                $scope.setAcceptID = -1;
                $scope.checked = false;
            });     
        }
    };

    //---------------- ADDED BY JAMES ------------------
    $scope.unblockUsers = function() {
        var userIDs = "";
        var checkedUsers = $("#blocked-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
            userRepository.unblockUsers(userIDs).success(function(users) {
                $scope.callUpdate();
                $scope.setAcceptID = -1;
                $scope.checked = false;
            });   
        }
    };
    
    
        $scope.columnDefsNewUser = [ 
            { "mDataProp": 
                        function (data, type, full) {
                                return '<input type="checkbox" id="'+ data.newUserID +'" class="someCheckbox" />';
                        }, "aTargets":[0] 
            },
            { "mDataProp": 
                        function (data, type, full) {
                                return '<a href="#newUserAction"  data-toggle="modal" ng-click="setID('+ data.newUserID +')">'+data.lName+', '+data.fName+'</a>';
                        }
                    , "aTargets":[1]},
            { "mDataProp": "email", "aTargets":[2] }            
        ]; 
        
        $scope.columnDefs = [ 
            { "mDataProp": 
                        function (data, type, full) {
                                return '<input type="checkbox" id="'+ data.userID +'" class="someCheckbox" />';
                        }, "aTargets":[0] 
            },
            { "mDataProp": 
                        function (data, type, full) {
                                return '<a href="#allAccountAction"  data-toggle="modal" ng-click="setID('+ data.userID +')">'+data.lName+', '+data.fName+'</a>';
                        }
                    , "aTargets":[1]},
            { "mDataProp": "lastLogin", "aTargets":[2] },
            { "mDataProp": "lastDownload", "aTargets":[3] }            
        ]; 
        
        $scope.columnDefsBlock = [ 
            { "mDataProp": 
                        function (data, type, full) {
                                return '<input type="checkbox" id="'+ data.userID +'" class="someCheckbox" />';
                        }, "aTargets":[0] 
            },
            { "mDataProp": 
                        function (data, type, full) {
                                return '<a href="#blockAction"  data-toggle="modal" ng-click="setID('+ data.userID +')">'+data.lName+', '+data.fName+'</a>';
                        }
                    , "aTargets":[1]},
            { "mDataProp": "lastLogin", "aTargets":[2] },
            { "mDataProp": "lastDownload", "aTargets":[3] }            
        ]; 
        
        $scope.columnDefsInactive = [ 
            { "mDataProp": 
                        function (data, type, full) {
                                return '<input type="checkbox" id="'+ data.userID +'" class="someCheckbox" />';
                        }, "aTargets":[0] 
            },
            { "mDataProp": 
                        function (data, type, full) {
                                return '<a href="#inactiveAction"  data-toggle="modal" ng-click="setID('+ data.userID +')">'+data.lName+', '+data.fName+'</a>';
                        }
                    , "aTargets":[1]},
            { "mDataProp": "lastLogin", "aTargets":[2] },
            { "mDataProp": "lastDownload", "aTargets":[3] }            
        ]; 
        
        
        
        $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200, /* 1 month */
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true,
            "fnCreatedRow" : function( nRow, aData, iDataIndex ) {
                $compile(nRow)($scope);
            }
        };
        
       

});

        
var meteringModule = angular.module('Metering', []);

meteringModule.controller('meteringController', function($scope, adminRepository) {
    /* Metering */
    $scope.setAcceptID = -1;
    $scope.setName = "";
    $scope.setBalance = -1;
    
    
    $scope.callUpdate = function() {
        adminRepository.getPendingUsers().success(function(balance) {
            $scope.balance = balance.balance;
        });
    };
    
    $scope.submitRequest = function(payment, receipt) {
            adminRepository.submitRequest($scope.setAcceptID, payment, receipt).success(function(balance) {
                if(balance.errorMessage == null) {
                    $scope.balance = balance.balance;
                }else {
                    $('#message .file-action').text(balance.errorMessage);
                    $('#message').modal('show');
                    
                    
                }
                
                $scope.userpayment = "";
                $scope.userreceipt = "";
                $scope.setAcceptID = -1;
                $scope.setName = "";
                $scope.setBalance = -1;
            });
        };
    
    $scope.callUpdate();
    
    $scope.setID = function(id, name, balance) {
        $scope.setAcceptID = id;
        $scope.setName = name;
        $scope.setBalance = balance;
    };
    
});

var dialogApp = angular.module('tableExample', []);

dialogApp.directive('myTable', function() {
        return function(scope, element, attrs) {

            // apply DataTable options, use defaults if none specified by user
            var options = {};
            if (attrs.myTable.length > 0) {
                options = scope.$eval(attrs.myTable);
            } else {
                options = {
                    "bStateSave": true,
                    "iCookieDuration": 2419200, /* 1 month */
                    "bJQueryUI": true,
                    "bPaginate": true,
                    "bLengthChange": true,
                    "bFilter": true,
                    "bInfo": true,
                    "bDestroy": true
                    
                };
            }

            // Tell the dataTables plugin what columns to use
            // We can either derive them from the dom, or use setup from the controller           
            var explicitColumns = [];
            element.find('th').each(function(index, elem) {
                explicitColumns.push($(elem).text());
            });
            if (explicitColumns.length > 0) {
                options["aoColumns"] = explicitColumns;
            } else if (attrs.aoColumns) {
                options["aoColumns"] = scope.$eval(attrs.aoColumns);
            }

            // aoColumnDefs is dataTables way of providing fine control over column config
            if (attrs.aoColumnDefs) {
                options["aoColumnDefs"] = scope.$eval(attrs.aoColumnDefs);
            }
            
            if (attrs.fnRowCallback) {
                options["fnRowCallback"] = scope.$eval(attrs.fnRowCallback);
            }

            // apply the plugin
            var dataTable = element.dataTable(options);

            
            
            // watch for any changes to our data, rebuild the DataTable
            scope.$watch(attrs.aaData, function(value) {
                var val = value || null;
                if (val) {
                    dataTable.fnClearTable();
                    dataTable.fnAddData(scope.$eval(attrs.aaData));
                }
            });
        };
    });
