/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.factory('userService', function($http) {
    return {
        getAllUsers: function(){
            var url = "/InformatronYX/informatron/user/allUsers";
            return $http.get(url);
        },
        update: function(data){
            var url = "/InformatronYX/informatron/user/edit";
            return $http.post(url,data);
        },
        approve: function(data){
            var url = "/InformatronYX/informatron/user/approve";
            return $http.post(url,data);
        },
        block: function(data){
            var url = "/InformatronYX/informatron/user/block";
            return $http.post(url,data);
        },
        unblock: function(data){
            var url = "/InformatronYX/informatron/user/unblock";
            return $http.post(url,data);
        },
        promote: function(data){
            var url = "/InformatronYX/informatron/user/promote";
            return $http.post(url,data);
        },
        demote: function(data){
            var url = "/InformatronYX/informatron/user/demote";
            return $http.post(url,data);
        },
        getAllAdminUsers: function(){
            var url = "/InformatronYX/informatron/user/admins";
            return $http.get(url);
        },
        getBlockedUsers: function(){
            var url = "/InformatronYX/informatron/user/blocked";
            return $http.get(url);
        },
        getInactiveUsers: function(){
            var url = "/InformatronYX/informatron/user/inactive";
            return $http.get(url);
        },
        getAllCommonUsers: function(){
            var url = "/InformatronYX/informatron/user/commonUsers";
            return $http.get(url);
        },
        getAllPendingUsers: function(){
            var url = "/InformatronYX/informatron/user/pendingUsers";
            return $http.get(url);
        },
        login: function(data){
            var url = "/InformatronYX/informatron/user/login";
            return $http.post(url,data);
        },
        signup: function(data){
            var url = "/InformatronYX/informatron/user/signup";
            return $http.post(url,data);
        },
        get: function(data){
            var url = "/InformatronYX/informatron/user/get";
            return $http.post(url,data);
        }
    };    
});