/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
summaryModule.factory('summaryRepository', function($http) {
    return {
        userSummary: function() {
            var url = "user-summary";
            return $http.get(url);
        },
        userSummaryAll: function() {
            var url = "user-summaryall";
            return $http.get(url);
        },
        userPending: function() {
            var url = "pending-summary";
            return $http.get(url);
        }
    };
});

adminSummaryModule.factory('adminSummaryRepository', function($http) {
    return {
        adminSummary: function() {
            var url = "admin-summary";
            return $http.get(url);
        },
        adminDownloadSummary: function() {
            var url = "summary-admindownload";
            return $http.get(url);
        },
        userDownloadSummary: function() {
            var url = "summary-userdownload";
            return $http.get(url);
        }
    };
});

transactionModule.factory('transactionRepository', function($http) {
    return {
        userTransaction: function() {
            var url = "user-transaction";
            return $http.get(url);
        }
        
    };
});

adminTransactionModule.factory('adminTransactionRepository', function($http) {
    return {
        adminTransaction: function() {
            var url = "admin-transaction";
            return $http.get(url);
        },
        adminAmountTransaction: function(dateStart, dateEnd) {
            var url = "admin-amount-transaction";
            return $http.get(url, 
                {params:{dateStart: dateStart, dateEnd: dateEnd}}
            );
        },
        adminReceivable: function() {
            var url = "admin-receivable-transaction";
            return $http.get(url);
        },
        loPrice: function() {
            var url = "admin-loprice-transaction";
            return $http.get(url);
        },
        maxDownload: function() {
            var url = "admin-maxdownload-transaction";
            return $http.get(url);
        },
        updateloPrice: function(price) {
            var url = "admin-updateloprice-transaction";
            return $http.get(url, 
                {params:{price: price}}
            );
        },
        updatemaxDownload: function(maxdownload) {
            var url = "admin-updatemaxdownload-transaction";
            return $http.get(url, 
                {params:{maxdownload: maxdownload}}
            );
        }
    };
});