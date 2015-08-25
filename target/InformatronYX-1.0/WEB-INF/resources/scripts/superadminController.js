var superadminModule = angular.module('Superadmin', ['User','tableExample']);

superadminModule.controller('superadminController', function($scope, $compile, adminRepository) {
    /* Accounts */
    
    $scope.setAcceptID = -1;
    
    $scope.callUpdate = function() {
        adminRepository.getAllSiteAdmin().success(function(admin) {
            $scope.siteadmin = admin.siteadmin;
        });
        adminRepository.getAllBlockedAdmin().success(function(admin) {
            $scope.blockadmin = admin.blockadmin;
        });
        adminRepository.getAllInactiveAdmin().success(function(admin) {
            $scope.inactiveadmin = admin.inactiveadmin;
        });
    };
    
    $scope.blockAdmin = function() {
        
        adminRepository.blockAdmin($scope.setAcceptID).success(function(admin) {
            $scope.callUpdate();            
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.unblockAdmin = function() {
        adminRepository.unblockAdmin($scope.setAcceptID).success(function(admin) {
            $scope.callUpdate();
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.demoteAdmin = function() {
       //alert("working");
        adminRepository.demoteAdmin($scope.setAcceptID).success(function(admin) {
            $scope.callUpdate();
            $scope.setAcceptID = -1;
        });        
    };
    
    $scope.changeFunctionType = function(ftype) {
        if(ftype != undefined) {
            adminRepository.changeFunctionType($scope.setAcceptID, ftype).success(function(admin) {
                $scope.callUpdate();
                $scope.setAcceptID = -1;
            });        
        }else {
            $('#message .file-action').text("No function selected");
            $('#message').modal('show');
        }
    };
    
    $scope.setID = function(id) {
        $scope.setAcceptID = id;
    };
    
    $scope.checkFunction = function(type) {
        if(type == 1)
            return "Approval Admin";
        else if(type == 2)
            return "Metering Admin";
        
        return -1;
    }
    
    $scope.callUpdate();
    
    $scope.addAccount = function(add_fname, add_lname, add_function, add_user, add_pass, add_conpass) {
        var type;
        $scope.ok = -1;
        $scope.errorMessage = [];

        if(add_function == 1 || add_function == 2)
            type = "icms_admin";
        else if(add_function == 3)
            type = "icms_superadmin";
        
        adminRepository.checkUsername(add_user).success(function(admin) {
                $scope.ok = admin.ok;
                
                if(admin.ok == 1)
                    $scope.errorMessage.push("* Username exists.");
                
                if(add_pass != add_conpass) {
                    $scope.errorMessage.push("* Password does not match with the confirmation password.");
                }
                if(add_function == null) {
                    $scope.errorMessage.push("* Select a function.");
                }

                if(add_pass == add_conpass && add_function != null && $scope.ok == 0) {
                    //alert('worksnnn');
                    adminRepository.addAccount(add_fname, add_lname, add_function, add_user, add_pass, type).success(function(admin) {
                       // if(user.ok == 1)
                            $scope.siteadmin = admin.siteuser;
                            $('#addAccount').modal('hide');

                    }); 
                }
        });
        
        
    };

    $('.add_account').on('click', function() {
        $scope.errorMessage = [];
        $('#addAccount input').val("");                
        $('#addAccount').modal('show');
    });


    //--------------- ADDED BY JAMES --------------------
    $scope.blockAdmins = function(checkboxClass) {
        var userIDs = "";
        var checkedUsers = $("#"+ checkboxClass +" .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
            adminRepository.blockAdmins(userIDs).success(function(admin) {
                $scope.callUpdate();            
                $scope.setAcceptID = -1;
                $scope.checked = false;
            });   
        }
    };

    //------------ ADDED BY JAMES ------------
    $scope.unblockAdmins = function() {
        var userIDs = "";
        var checkedUsers = $("#super-blocked-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
        
            adminRepository.unblockAdmins(userIDs).success(function(admin) {
                $scope.callUpdate();
                $scope.setAcceptID = -1;
                $scope.checked = false;
            });  
        }
    };

    //--------------- ADDED BY JAMES --------------------
    $scope.demoteAdmins = function() {
        var userIDs = "";
        var checkedUsers = $("#super-all-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
            adminRepository.demoteAdmins(userIDs).success(function(admin) {
                $scope.callUpdate();
                $scope.setAcceptID = -1;
                $scope.checked = false;
            });    
        }
    };

    //---------------- ADDED JAMES --------------------
    $scope.massChangeFunctionType = function(ftype) {
        var userIDs = "";
        var checkedUsers = $("#super-all-account .someCheckbox:checked");
        
        for(var i = 0 ; i < checkedUsers.length ; i++){
            userIDs += checkedUsers[i].id;
            if(i !== checkedUsers.length - 1)
                userIDs += ",";
        }
        
        if(userIDs !== ""){
            if(ftype != undefined) {
                adminRepository.massChangeFunctionType(userIDs, ftype).success(function(admin) {
                    $scope.callUpdate();
                    $scope.setAcceptID = -1;
                    $scope.checked = false;
                });        
            }else {
                $('#message .file-action').text("No function selected");
                $('#message').modal('show');
            }
        }
    };
    
    
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
            { "mDataProp": function (data, type, full) {
                                return $scope.checkFunction(data.functionType);
                        }, "aTargets":[3] }            
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
            { "mDataProp": function (data, type, full) {
                                return $scope.checkFunction(data.functionType);
                        }, "aTargets":[3] }             
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
            { "mDataProp": function (data, type, full) {
                                return $scope.checkFunction(data.functionType);
                        }, "aTargets":[3] }             
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
