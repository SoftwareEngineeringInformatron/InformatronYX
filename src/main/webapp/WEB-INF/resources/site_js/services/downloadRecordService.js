/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.factory('downloadRecordService', function($http) {
   return {
        getUserDownloads: function(data) {
            var url = "/InformatronYX/informatron/downloadRecords/recordsByUserID";
            return $http.post(url,data.id);
        }
   }
});
