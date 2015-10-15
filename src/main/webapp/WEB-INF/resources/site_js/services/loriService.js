/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.factory('loriService', function($http) {
    return {
        
        submit: function(data) {
            var url = "/InformatronYX/informatron/lori/submit";
            return $http.post(url,data);
        },
        edit: function(data){
            var url = "/InformatronYX/informatron/lori/edit";
            return $http.post(url,data);
        },
        remove:function(data){
            var url = "/InformatronYX/informatron/lori/delete";
            return $http.post(url,data);
        },
        getAll:function(){
            var url = "/InformatronYX/informatron/lori/LORIs";
            return $http.get(url);
        },
        getLORIsByLOId: function(data){
            var url = "/InformatronYX/informatron/lori/LORIs/LOId";
            return $http.post(url,data);
        },
        getLORIsByReviewId: function(data){
            var url = "/InformatronYX/informatron/lori/LORIs/reviewId";
            return $http.post(url,data);
        },
        getLORIsBoth: function(data){
            var url = "/InformatronYX/informatron/lori/LORIs/reviewId";
            return $http.post(url,data);
        }
    };
});