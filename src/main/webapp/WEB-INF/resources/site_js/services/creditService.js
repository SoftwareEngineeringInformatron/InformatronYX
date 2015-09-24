/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.factory('creditService', function($http) {
    return {
        addTransaction: function(data){
            var url = "/InformatronYX/informatron/transact/credit/add";
            return $http.post(url,data);
        },
        addRemoveTransaction: function(data){
            var url = "/InformatronYX/informatron/transact/credit/remove";
            return $http.post(url,data);
        },
        getAllTransactions : function(data){
            var url = "/InformatronYX/informatron/transact/history/credit";
            return $http.post(url,data);
        },
        approveTransaction: function(data){
            var url = "/InformatronYX/informatron/transact/approve/credit";
            return $http.post(url,data);
        },
        removeTransaction: function(data){
            var url = "/InformatronYX/informatron/transact/cancel/credit";
            return $http.post(url,data);
        }
    };    
});