/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
loModule.factory('loRepository', function($http) {
    return {
        getAllQuizResult: function( loid, uid ){
			var url = "getAllQuizResult";
            return $http.get(url, {
								params: { 
											loid : loid ,
											uid : uid
										}
							});
		}
    };
});

