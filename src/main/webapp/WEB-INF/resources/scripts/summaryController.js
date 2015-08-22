var dialogApp = angular.module('tableExample', ['User','summaryModule','transactionModule','adminSummaryModule','adminTransactionModule']);

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


var summaryModule = angular.module('summaryModule', []);

summaryModule.controller('Ctrl', function($scope, summaryRepository) {
    
        summaryRepository.userSummary().success(function(summary) {
            $scope.summary = summary.summary;
        });
        
        summaryRepository.userSummaryAll().success(function(summary) {
            $scope.summaryall = summary.summary;
        });
        
        summaryRepository.userPending().success(function(balance) {
            $scope.userbalance = balance.balance;
        });
               
        
           
        $scope.columnDefs = [ 
            { "mDataProp": "name", "aTargets":[0]},
            { "mDataProp": "subject", "aTargets":[1] },
            { "mDataProp": "dateDownload", "aTargets":[2] }
        ]; 
        
        $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200, /* 1 month */
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true
        };
        
        
   });
   
var adminSummaryModule = angular.module('adminSummaryModule', []);
   
adminSummaryModule.controller('adminSummaryController', function($scope, adminSummaryRepository) {
            
        adminSummaryRepository.adminSummary().success(function(summary) {
            $scope.adminsummary = summary.summary;
        });
        
        adminSummaryRepository.adminDownloadSummary().success(function(summary) {
            $scope.admindownload = summary.summary;
        });
        
        adminSummaryRepository.userDownloadSummary().success(function(summary) {
            $scope.userdownload = summary.summary;
        });
        
           
        $scope.columnDefs = [ 
            { "mDataProp": "userName", "aTargets":[0]},
            { "mDataProp": "name", "aTargets":[1]},
            { "mDataProp": "subject", "aTargets":[2] },
            { "mDataProp": "dateDownload", "aTargets":[3] }
        ]; 
        
        $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200, /* 1 month */
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true
        };
        
            
   });


var transactionModule = angular.module('transactionModule', []);

transactionModule.controller('transactionController', function($scope, transactionRepository) {
    
        transactionRepository.userTransaction().success(function(transaction) {
            $scope.transaction = transaction.transaction;
        });
                
       
        $scope.columnDefs = [ 
            { "mDataProp": "transactionID", "aTargets":[0]},
            { "mDataProp": "userID", "aTargets":[1] },
            { "mDataProp": "amountPaid", "aTargets":[2] },
            { "mDataProp": "datePaid", "aTargets":[3] },
            { "mDataProp": "receiptNum", "aTargets":[4] }
        ]; 
        
        $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200, /* 1 month */
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true
        };
    
   });

var adminTransactionModule = angular.module('adminTransactionModule', []);

adminTransactionModule.controller('adminTransactionController', function($scope, adminTransactionRepository) {
        $scope.totalamount = 0;
        $scope.receivable = 0;
        
        adminTransactionRepository.adminTransaction().success(function(transaction) {
            $scope.transactionadmin = transaction.transaction;
        });
    
        $scope.columnDefs = [ 
            { "mDataProp": "userName", "aTargets":[0]},
            { "mDataProp": "transactionID", "aTargets":[1] },
            { "mDataProp": "amountPaid", "aTargets":[2] },
            { "mDataProp": "datePaid", "aTargets":[3] },
            { "mDataProp": "receiptNum", "aTargets":[4] }
        ]; 
        
        $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200, /* 1 month */
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true
        };
        
        $scope.subTotal = function(dateStart, dateEnd) {
            adminTransactionRepository.adminAmountTransaction(dateStart, dateEnd).success(function(transaction) {
                $scope.totalamount = transaction.amount + '.00';
            });
        }
        
        adminTransactionRepository.adminReceivable().success(function(transaction) {
                $scope.receivable = transaction.receivable + '.00';
        });
        
               
        $scope.getLOPrice = function() {
            adminTransactionRepository.loPrice().success(function(transaction) {
                $scope.price = transaction.price + '.00';
            });
        }
        
        $scope.getMaxDownload = function() {
           adminTransactionRepository.maxDownload().success(function(transaction) {
                $scope.maxdownload = transaction.maxdownload;
            }); 
        }
        
        $scope.updateloPrice = function(price) {
            adminTransactionRepository.updateloPrice(price).success(function(transaction) {
                $scope.getLOPrice();
                $(".priceoflo input[type=text]").prop("disabled",true);
                $('#lo-update').addClass('no-display');
                $('#lo-change').removeClass('no-display');
            });
        }
        
        $scope.updatemaxDownload = function(maxdownload) {
           adminTransactionRepository.updatemaxDownload(maxdownload).success(function(transaction) {
               $scope.getMaxDownload();
               $(".usermaxdownload input[type=text]").prop("disabled",true);
               $('#max-update').addClass('no-display');
               $('#max-change').removeClass('no-display');
            }); 
        }
        
        $('#changelo').on('click', function() {
		$(".priceoflo input[type=text]").prop("disabled",false);
                $('#lo-change').addClass('no-display');
                $('#lo-update').removeClass('no-display');
	});
        
        $('#cancelprice').on('click', function() {
		$(".priceoflo input[type=text]").prop("disabled",true);
                $('#lo-update').addClass('no-display');
                $('#lo-change').removeClass('no-display');
	});
        
        $('#changemax').on('click', function() {
		$(".usermaxdownload input[type=text]").prop("disabled",false);
                $('#max-change').addClass('no-display');
                $('#max-update').removeClass('no-display');
	});
        
        $('#cancelmax').on('click', function() {
		$(".usermaxdownload input[type=text]").prop("disabled",true);
                $('#max-update').addClass('no-display');
                $('#max-change').removeClass('no-display');
	});
        
        
        
        $scope.getLOPrice();
        $scope.getMaxDownload();
    
   });


