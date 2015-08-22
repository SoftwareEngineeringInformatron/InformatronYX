var loModule = angular.module('LO',['User']);

loModule.controller('loController', function($scope, loRepository) {
    /* LOs */
    $scope.errorMessage = '';
    $scope.setAcceptID = -1;
    
    loRepository.getAllLO().success(function(lo) {
        $scope.LOs = lo.downloadedLOs;
    });
    
    
    loRepository.learningObject(getURLParameter('loID')).success(function(lo) {
        $scope.learningObject = lo.learningobject;
    });
    
    loRepository.commentsList(getURLParameter('loID')).success(function(lo) {
        $scope.comments = lo.commentslist;
    });
	
    
    $scope.checkIfDownloaded = function() {
        loRepository.checkIfDownloaded(getURLParameter('loID')).success(function(lo) {
            //alert(lo.likebyuser);
            if(lo.likebyuser != -1){
                $('#like').removeClass('no-display');
                if(lo.likebyuser == 1) {
                    $('#like-text').text('And you liked it.');
                    $('#toUnlike').removeClass('no-display');
                }else {
                    $('#like-text').text('Do you like it?');
                    $('#toLike').removeClass('no-display');
                }
            }
        });
    };
    
    $scope.likeLO = function() {
        //alert('jdkhtfu');
        loRepository.likeLO(getURLParameter('loID')).success(function(lo) {
                    $scope.learningObject = lo.learningobject;
                    $('#like').removeClass('no-display');
                    $('#like-text').text('And you liked it.');
                    $('#toUnlike').removeClass('no-display');
                    $('#toLike').addClass('no-display');
                    
               
        });
    };
    
    $scope.unlikeLO = function() {
        //alert('jdkhtfu');
        loRepository.unlikeLO(getURLParameter('loID')).success(function(lo) {
                    $scope.learningObject = lo.learningobject;
                    $('#like').removeClass('no-display');
                    $('#like-text').text('Do you like it?');
                    $('#toUnlike').addClass('no-display');
                    $('#toLike').removeClass('no-display');
                    
               
        });
    };
        
    
    $scope.callAllLO = function() {
        loRepository.getAllLO().success(function(lo) {
            $scope.LOs = lo.downloadedLOs;
        });
    };
    
    $scope.callAllMostDownloaded = function() {
        loRepository.getMostDownloaded().success(function(lo) {
            $scope.LOs = lo.LOs;
        });
    };
    
    $scope.callAllMostLiked = function() {
        loRepository.getMostLiked().success(function(lo) {
            $scope.LOs = lo.mostliked;
        });
    };
    
    $scope.callLoriTopLOs = function() {
        loRepository.getLoriTopLOs().success(function(lo) {
            $scope.LOs = lo.toplo;
        });
    };
    
    
    $scope.loUpdate = function() {
        setInterval(50000);
        //alert("working");
        $scope.callAllLO();
    };
    
//    $scope.callAllLO();
    
    $scope.setID = function(id) {
        $scope.setAcceptID = id;
    };
    
    $scope.searchLO = function(name, subject, dateStart, dateEnd, orderBy) {
        loRepository.searchLO(name, subject, dateStart, dateEnd, orderBy).success(function(lo) {
            $scope.LOs = lo.searchlo;
            
            if(lo.searchlo == undefined)
                $scope.errorMessage = 'No learning objects found';
            
            $scope.name = '';
            $scope.subject = '';
            $scope.dateStart = '';
            $scope.dateEnd = '';
            $scope.orderBy = '';
        });
        
    }
    
    $('.ul-search li a').on('click', function() {
        $scope.errorMessage = "";
    });
    
    /* LO */
    $scope.lori = function(id) {
        
        loRepository.evaluation(id).success(function(lo) {
                var ep = lo.ep;
                var dataaa = {
                    labels : [
                        "Content Quality",
                        "Learning Goal Alignment",
                        "Feedback and Adaptation",
                        "Motivation",
                        "Presentation Design",
                        "Interaction Usability",
                        "Accessibility", 
                        "Reusability",
                        "Standards Compliance",
                        "Total"
                    ],
                    datasets : [
                            {
                                    fillColor : "rgba(255,128,0,0.5)",
                                    data : 
                                            [
                                        ep.contentQuality, 
                                        ep.learningGoalAlignment, 
                                        ep.feedbackAndAdaptation,
                                        ep.motivation,
                                        ep.presentationDesign,
                                        ep.interactionUsability,
                                        ep.accessibility,
                                        ep.reusability,
                                        ep.standardsCompliance,
                                        ep.total
                                    ]
                            }
                    ]
                };
                
                var options = {      
                        scaleOverlay : true,
                        scaleOverride : true,
                        //** Required if scaleOverride is true **
                        //Number - The number of steps in a hard coded scale        
                        scaleSteps : 10,
                        //Number - The value jump in the hard coded scale       
                        scaleStepWidth : 10,
                        //Number - The scale starting value        
                        scaleStartValue : 0
                }
               
                
                respChart($("#myChart"),dataaa,options);
                
                

            });
        };
        
        
        $scope.lori(getURLParameter('loID'));
        $scope.checkIfDownloaded();
    
        
    
});


