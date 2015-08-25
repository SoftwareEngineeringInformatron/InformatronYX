userModule.factory('accountRepository', function($http) {
    return {
        updateAccount: function(fname, lname, email, username, password) {
            var url = "updateAccount";
            return $http.get(url, 
                 {params:{fname: fname, 
                         lname: lname, 
                         email: email,
                         user_name: username,
                         password: password
                 }});
        },
        updateUsername: function(username, user_name, password) {
            var url = "updateAccount";
            return $http.get(url, 
                 {params:{username: username,
                         user_name: user_name,
                         password: password
                 }});
        },
        updatePassword: function(password, newpass){
            var url = "updatePassword";
            return $http.get(url, 
                 {params:{newpass: newpass,
                         password: password
                 }});
        },
        getUsertype: function() {
            var url = "getUsertype";
            return $http.get(url);
        }
    };    
});