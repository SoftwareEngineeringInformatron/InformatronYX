/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
loModule.factory('loRepository', function($http) {
    return {
        
        getMostDownloaded: function() {
            var url = "mostdownloaded";
            return $http.get(url);
        },
        getAllLO: function() {
            var url = "alllo";
            return $http.get(url);
        },
        getMostLiked: function() {
            var url = "most-liked";
            return $http.get(url);
        },
        getLoriTopLOs: function() {
            var url = "lori-top-los";
            return $http.get(url);
        },
        learningObject: function(id) {
            var url = "learning-object";
            return $http.get(url,
                {params:{id:id}}
            );
        },
        commentsList: function(id) {
            var url = "show-comments";
            return $http.get(url,
                {params:{loID:id}}
            );
        },
        searchLO: function(name, subject, dateStart, dateEnd, orderBy) {
            var url = "search-lo";
            return $http.get(url, 
                 {params:{name: name, subject:subject, dateStart:dateStart, dateEnd:dateEnd, orderBy:orderBy}}
            );
        },
        evaluation: function(id) {
            var url = "get-evaluation-percentages";
            return $http.get(url, 
                 {params:{loID: id}}
             );            
        },
        checkIfDownloaded: function(id) {
            var url = "check-like";
            return $http.get(url, 
                 {params:{loID: id}}
             );            
        },
        likeLO: function(id) {
            var url = "like-lo";
            return $http.get(url, 
                 {params:{loID: id}}
             );            
        },
        unlikeLO: function(id) {
            var url = "unlike-lo";
            return $http.get(url, 
                 {params:{loID: id}}
             );            
        }
    };
});

