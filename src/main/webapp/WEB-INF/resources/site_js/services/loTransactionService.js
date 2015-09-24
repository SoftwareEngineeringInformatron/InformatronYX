/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.factory('loTransactionService', function($http) {
    return {
        recordLOPurchase: function(data) {
            var url = "/InformatronYX/informatron/transact/LO/record";
            return $http.post(url,data);
        },
        getLOTransactionHistory: function(data) {
            var url = "/InformatronYX/informatron/transact/history/LO";
            return $http.post(url,data);
        }
    }
});