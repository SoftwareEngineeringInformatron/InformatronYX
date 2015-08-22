/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    
    $('.ul-search li a').on('click', function() {
        $('.ul-search').find('.active').removeClass('active');
        $(this).addClass('active');
        
        if($('#collapseOne').hasClass('in')) {
             $('#collapseOne').collapse('hide');
        }
    });
    
    $('#btn-advance').on('click', function() {
        $('#collapseOne').collapse('hide');
    });
    
    
});
