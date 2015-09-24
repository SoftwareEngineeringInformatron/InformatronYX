/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
app.factory('loRepository', function($http) {
    return {
        
        getTest: function() {
            var url = "/InformatronYX/informatron/LO/testing";
            return $http.get(url);
        },
        getMostDownloaded: function() {
            var url = "/InformatronYX/informatron/LO/mostDownloaded";
            return $http.get(url);
        },
        getAllLO: function() {
            var url = "/InformatronYX/informatron/LO/availableLearningObjects";//"alllo";
            return $http.get(url);
        },
        getMostLiked: function() {
            var url = "/InformatronYX/informatron/LO/mostLiked";
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

