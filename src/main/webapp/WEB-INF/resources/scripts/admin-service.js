/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
adminModule.factory('userRepository', function($http) {
    return {
        getAllSiteUsers: function() {
            var url = "user/getSiteUser";
            return $http.get(url);
        },
        getAllNewUsers: function() {
            var url = "user/getNewUser";
            return $http.get(url);
        },
        getAllBlockedUsers: function() {
            var url = "user/getBlockUser";
            return $http.get(url);
        },
        getAllInactiveUsers: function() {
            var url = "user/getInactiveUser";
            return $http.get(url);
        },
        promoteUser: function(id, utype, ftype) {
            var url = "action/promoteUser";
            return $http.get(url, 
                 {params:{newuserID: id, usertype: utype, functiontype: ftype}} //place your code argument here
                 )
        },
        acceptUser: function(id) {
            var url = "action/acceptUser";
            return $http.get(url, 
                 {params:{newuserID: id}} //place your code argument here
                 )
        },
        declineUser: function(id) {
            var url = "action/declineUser";
            return $http.get(url, 
                 {params:{newuserID: id}} //place your code argument here
                 )
        },
        blockUser: function(id) {
            var url = "action/blockUser";
            return $http.get(url, 
                 {params:{newuserID: id}} //place your code argument here
                 )
        },
        unblockUser: function(id) {
            var url = "action/unblockUser";
            return $http.get(url, 
                 {params:{newuserID: id}} //place your code argument here
                 )
        },
        getAllLO: function() {
            var url = "get-all-lo";
            return $http.get(url);
        },
        download: function(filepath) {
            var url = "download-lo";
            return $http.get(url, 
                 {params:{filename: filepath}} //place your code argument here
                 );
        },
        acceptUsers: function(ids) { //------- ADDED BY JAMES ------
            var url = "action/acceptUsers";
            return $http.get(url, 
                 {params:{newuserIDs: ids}} //place your code argument here
                 )
            
        },
        declineUsers: function(ids) { //------- ADDED BY JAMES ------
            var url = "action/declineUsers";
            return $http.get(url, 
                 {params:{newuserIDs: ids}} //place your code argument here
                 )
            
        },
        promoteUsers: function(ids, utype, ftype) {//-------- ADDED BY JAMES -----------------
            var url = "action/promoteUsers";
            return $http.get(url, 
                 {params:{newuserIDs: ids, usertype: utype, functiontype: ftype}} //place your code argument here
                 )
        },
        blockUsers: function(ids) {//-------- ADDED BY JAMES -----------------
            var url = "action/blockUsers";
            return $http.get(url, 
                 {params:{newuserIDs: ids}} //place your code argument here
                 )
        },
        unblockUsers: function(ids) { //---- ADDED BY JAMES ------
            var url = "action/unblockUsers";
            return $http.get(url, 
                 {params:{newuserIDs: ids}} //place your code argument here
                 )
        }
        
    };
});


meteringModule.factory('adminRepository', function($http) {
    return {
        getPendingUsers: function() {
            var url = "get-pending-user";
            return $http.get(url);
        },
        submitRequest: function(id, payment, receipt) {
            var url = "submit-request";
            return $http.get(url, 
                 {params:{userID: id, payment: payment, receipt:receipt}}
             );
        }
    };
});

