var userModule = angular.module('User', []);

userModule.controller('userController', function($scope, accountRepository) {
        
            $scope.errorsettings = '';
            accountRepository.getUsertype().success(function(user) {
                var type = user.type;
                var ftype = user.functiontype;
                var name;
                var email;
                var str = '';
                
                
                if(user.siteuser != undefined) {
                    $scope.account = user.siteuser;
                    
                    name = user.siteuser[0].fName + ' ' + user.siteuser[0].lName;
                    email = user.siteuser[0].email;

                        str += '<li><a href="#" class="account-txt">' + name +'</li>';
                        str += '<li><a href="#" class="account-txt"><i>' + email + '</i></a></li>';
                        str += '<li class="divider"></li>';

                    if(type == 'icms_user') {
                        $('#usermeter').html('<a href="usermeter">' +                                                
                            '<i data-placement="bottom" rel="tooltip" title="Go to AMCS" id="goto-amcs" class="icon-flag icon-large default header-txt font-up"></i> ' +
                            '<span data-placement="bottom" rel="tooltip" title=""id="days-left" class="badge badge-important"></span>' +
                            '</a>');

                        str += '<li><a href="main">LO Repository</a></li>';
                    }else if(type == 'icms_admin' && ftype == 1) {
                        $('#usermeter').html('<h4>Administrator</h4>');
                        str += '<li><a href="main">LO Repository</a></li>';
                        str += '<li><a href="approveadmin">Approval View</a></li>';
                    }else if(type == 'icms_admin' && ftype == 2) {
                        $('#usermeter').html('<h4>Administrator</h4>');
                        str += '<li><a href="main">LO Repository</a></li>';
                        str += '<li><a href="meteradmin">Metering View</a></li>';
                    }else if(type == 'icms_superadmin') {
                        $('#usermeter').html('<h4>Super Administrator</h4>');
                        str += '<li><a href="main">LO Repository</a></li>';
                        str += '<li><a href="approveadmin">Approval View</a></li>';
                        str += '<li><a href="meteradmin">Metering View</a></li>';
                        str += '<li><a href="superadmin">Super Admin View</a></li>';
                    }
                        str += '<li class="divider"></li>';
                        str += '<li><a href="settings"><i class="icon-cog"></i> Settings</a></li>';
                        str += '<li><a href="logout" ><i class="icon-off"></i> Logout</a></li>';
                        
                        
                    
                }else {
                        $('#usermeter').html('<h4>Welcome guest!</h4>');
                        str += '<li><a href="logout" ><i class="icon-off"></i> Logout</a></li>';
                }
            
                $('#functions').html(str);
            });   
            
            $scope.upateAccount = function(fname, lname, email) {
                $scope.ufname = fname;
                $scope.ulname = lname;
                $scope.uemail = email;
                
                $('#saveAction').modal('show');
            };
            
            $scope.saveAccount = function(username, password) {
                //alert($scope.ufname+$scope.ulname+$scope.uemail+username+password);
                accountRepository.updateAccount($scope.ufname, $scope.ulname, $scope.uemail, username, password).success(function(user) {
                    if(user.ok == 1) {    
                        $scope.account = user.siteuser;
                        $.editCancelButton('name-setting');
                    }else if(user.ok == 0){
                        $('#message .file-action').text("Incorrect username or password");
                        $('#message').modal('show');
                        $scope.cancelAccount('name-setting');
                    }else {
                        $scope.errorsettings = user.errormessage;
                    }
                    
                    $scope.a_username = "";
                    $scope.a_password = "";
                });
            };
            
            $scope.updateUsername = function(username) {
                    $scope.username = username;
                    $('#saveAction1').modal('show');
                     
            };
            
            $scope.saveUsername = function(username, password) {
                accountRepository.updateUsername($scope.username, username, password).success(function(user) {
                    $scope.errorsettings = '';
                    
                    if(user.ok == 1) {    
                        $scope.account = user.siteuser;
                        $.editCancelButton('user-setting');
                    }else if(user.ok == 0){
                        $('#message .file-action').text("Incorrect username or password");
                        $('#message').modal('show');
                        $scope.cancelAccount('user-setting');
                    }else {
                        $scope.errorsettings = user.errormessage;
                    }
                    
                    
                    $scope.u_username = "";
                    $scope.u_password = "";
                    
                    
                    
                }); 
            }
            
            $scope.editAccount = function(str) {
                $.editButton(str);
            };
            
            $scope.cancelAccount = function(str) {
                $scope.errorsettings = '';
                accountRepository.getUsertype().success(function(user) {
                    $scope.account = user.siteuser;
                    $.editCancelButton(str);
                    
                }); 
            };
            
            
            $scope.updatePassword = function(password, newpass, conpass) {
                $scope.password = "";
                $scope.newpass = "";
                $scope.conpass = "";
                
                if(newpass == conpass) {
                    accountRepository.updatePassword(password, newpass).success(function(user) {
                        if(user.ok != 1) { 
                            $('#message .file-action').text("Incorrect password");
                            $('#message').modal('show');
                        }else {
                            $('#message .file-action').text("You have successfully edited your password.");
                            $('#message').modal('show');
                        }
                    }); 
                }else {
                    $('#message .file-action').text("New password does not match with the confirmation password.");
                    $('#message').modal('show');
                }
                
                $('#editPassword').modal('hide');
                
                
            };
            
    
});




