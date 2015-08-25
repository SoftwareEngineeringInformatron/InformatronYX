$(document).ready(function() {
        var ep;
        
        $.ajax({
            url: "get-evaluation-percentages",
            data: { loID: 2}            
        }).done(function(data) {
            ep = data.ep;
            
            var dataaa = {
                labels : [
                    "Content Quality",
                    "Learning Goal Alignment",
                    "Feedback and Adaptation",
                    "Motivation",
                    "Presentation Design",
                    "Interaction Usability",
                    "Accessibility", 
                    "Standards Compliance",
                    "Total"
                ],
                datasets : [
                        {
                                fillColor : "rgba(220,220,220,0.5)",
                                pointColor : "rgba(220,220,220,1)",
                                pointStrokeColor : "#fff",
                                //strokeColor : "rgba(10,220,220,1)",
                                data : 
                                        [
                                    ep.contentQuality, 
                                    ep.learningGoalAlignment, 
                                    ep.feedbackAndAdaptation,
                                    ep.motivation,
                                    ep.presentationDesign,
                                    ep.interactionUsability,
                                    ep.accessibility,
                                    ep.standardsCompliance,
                                    ep.total
                                ]
                        }
                ]
            };
            
            respChart($("#myChart"),dataaa);

        });
        
    });