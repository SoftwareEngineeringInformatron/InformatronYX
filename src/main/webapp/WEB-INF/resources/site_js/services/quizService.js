/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.factory('quizService', function($http) {
    return {
        getquizResults: function(data,functionType) {
            if(functionType>=2 && functionType<=4)
                var url = "/InformatronYX/informatron/quiz/loresult";
            else
                var url = "/InformatronYX/informatron/quiz/userresult";
            return $http.post(url,data);
        }
    }
});