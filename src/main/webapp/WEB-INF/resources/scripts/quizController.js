var loModule = angular.module('QUIZ',['User']);

loModule.controller('loController', function($scope, loRepository) {
    /* LOs */
    $scope.errorMessage = '';
    $scope.setAcceptID = -1;
	var $_GET = populateGet();
	//alert(  $_GET.loid );
	
	loRepository.getAllQuizResult( $_GET.loid, $_GET.uid ).success(function(lo){
		$scope.QuizResult = lo.quiz_results;
	});
	
	$scope.columnDefs = [ 
            { "mDataProp": 
                        function (data, type, full) {
                                return '<a href="learningobject?loID='+data.lo.id+'"><i class="icon-file"></i> '+data.lo.name+'</a><div class="few-details"><i>Downloads: '+data.lo.downloads+' &nbsp;&nbsp;<span class="icon-thumbs-up"></span> '+data.lo.likes+' &nbsp;&nbsp;</i></div>';
                        }, "aTargets":[0] 
            },
            { "mDataProp": 
                        function (data, type, full) {
                                return data.lo.subject;
                        }
                    , "aTargets":[1]},
            { "mDataProp": function (data, type, full) {
                                return data.username;
                        }, "aTargets":[2] },
            { "mDataProp": function (data, type, full) {
                                return data.timeStarted;
                        }, "aTargets":[3] },
            { "mDataProp": function (data, type, full) {
                                return data.timeFinished;
                        }, "aTargets":[4] },
            { "mDataProp": function (data, type, full) {
                                return data.dateSubmitted;
                        }, "aTargets":[5] },
            { "mDataProp": function (data, type, full) {
                                return data.score;
                        }, "aTargets":[6] }            
        ]; 
        
    $scope.overrideOptions = {
            "bStateSave": true,
            "iCookieDuration": 2419200,
            "bPaginate": true,
            "bLengthChange": true,
            "bFilter": true,
            "bInfo": true,
            "bDestroy": true/* ,
            "fnCreatedRow" : function( nRow, aData, iDataIndex ) {
                $compile(nRow)($scope);
            } */
        };
});


function populateGet() {
  var obj = {}, params = location.search.slice(1).split('&');
  for(var i=0,len=params.length;i<len;i++) {
    var keyVal = params[i].split('=');
    obj[decodeURIComponent(keyVal[0])] = decodeURIComponent(keyVal[1]);
  }
  return obj;
}
//var dialogApp = angular.module('QUIZ', ['User']);

loModule.directive('myTable', function() {
        return function(scope, element, attrs) {

            // apply DataTable options, use defaults if none specified by user
            var options = {};
            if (attrs.myTable.length > 0) {
                options = scope.$eval(attrs.myTable);
            } else {
                options = {
                    "bStateSave": true,
                    "iCookieDuration": 2419200, 
                    "bJQueryUI": true,
                    "bPaginate": true,
                    "bLengthChange": true,
                    "bFilter": true,
                    "bInfo": true,
                    "bDestroy": true
                    
                };
            }

            // Tell the dataTables plugin what columns to use
            // We can either derive them from the dom, or use setup from the controller           
            var explicitColumns = [];
            element.find('th').each(function(index, elem) {
                explicitColumns.push($(elem).text());
            });
            if (explicitColumns.length > 0) {
                options["aoColumns"] = explicitColumns;
            } else if (attrs.aoColumns) {
                options["aoColumns"] = scope.$eval(attrs.aoColumns);
            }

            // aoColumnDefs is dataTables way of providing fine control over column config
            if (attrs.aoColumnDefs) {
                options["aoColumnDefs"] = scope.$eval(attrs.aoColumnDefs);
            }
            
            if (attrs.fnRowCallback) {
                options["fnRowCallback"] = scope.$eval(attrs.fnRowCallback);
            }

            // apply the plugin
            var dataTable = element.dataTable(options);

            
            
            // watch for any changes to our data, rebuild the DataTable
            scope.$watch(attrs.aaData, function(value) {
                var val = value || null;
                if (val) {
                    dataTable.fnClearTable();
                    dataTable.fnAddData(scope.$eval(attrs.aaData));
                }
            });
        };
    });