superadminModule.factory('adminRepository', function($http) {
    return {
        getAllSiteAdmin: function() {
            var url = "admin/getSiteAdmin";
            return $http.get(url);
        },
        getAllBlockedAdmin: function() {
            var url = "admin/getBlockAdmin";
            return $http.get(url);
        },
        getAllInactiveAdmin: function() {
            var url = "admin/getInactiveAdmin";
            return $http.get(url);
        },
        blockAdmin: function(id) {
            var url = "admin-action/blockAdmin";
            return $http.get(url, 
                 {params:{id: id}} //place your code argument here
                 )
        },
        unblockAdmin: function(id) {
            var url = "admin-action/unblockAdmin";
            return $http.get(url, 
                 {params:{id: id}} //place your code argument here
                 )
        },
        demoteAdmin: function(id) {
            var url = "action/demoteAdmin";
            return $http.get(url, 
                 {params:{newuserID: id, usertype: "user"}} //place your code argument here
                 )
        },
        changeFunctionType: function(id, ftype) {
            var url = "action/changeFunctiontype";
            return $http.get(url, 
                 {params:{newuserID: id, usertype: "admin", functiontype: ftype}} //place your code argument here
                 )
        },
        addAccount: function(add_fname, add_lname, add_function, add_user, add_pass, add_usertype){
            var url = "addAccount";
            return $http.get(url, 
                 {params:{username: add_user,
                         password: add_pass,
                         fname: add_fname,
                         lname: add_lname,
                         type: add_usertype,
                         functiontype: add_function
                 }});
        },
        blockAdmins: function(ids) { //--------------------- ADDED BY JAMES -----
            var url = "admin-action/blockAdmins";
            return $http.get(url, 
                 {params:{ids: ids}} //place your code argument here
                 )
        },
        unblockAdmins: function(ids) {//--------------------- ADDED BY JAMES ------
            var url = "admin-action/unblockAdmins";
            return $http.get(url, 
                 {params:{ids: ids}} //place your code argument here
                 )
        },
        demoteAdmins: function(ids) { //--------------------- ADDED BY JAMES -----
            var url = "action/demoteAdmins";
            return $http.get(url, 
                 {params:{newuserIDs: ids, usertype: "user"}} //place your code argument here
                 )
        },
        massChangeFunctionType: function(ids, ftype) { //--------------------- ADDED BY JAMES -----
            var url = "action/massChangeFunctiontype";
            return $http.get(url, 
                 {params:{newuserIDs: ids, usertype: "admin", functiontype: ftype}} //place your code argument here
                 )
        },
        checkUsername: function(str) { //--------------------- ADDED BY JAMES -----
            var url = "action/checkUsername";
            return $http.get(url, 
                 {params:{str: str}} //place your code argument here
                 )
        }
        
    };    
});