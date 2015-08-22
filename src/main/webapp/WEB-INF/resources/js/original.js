$(document).ready(function() {
	$('#display_account li>a').click(function() {
		if(!$(this).hasClass('add_account')) {
			$('#display_account li').each(function() {
				if($(this).hasClass('active'))
					$(this).removeClass('active');
			});

			$(this).parent().addClass('active');
			var str = '#' + $(this).attr('name'); 
			$.showTab(str);	
		}

	});	


	$('.setting-action button.btn-approve').on('click', function() {
		if($(this).parent().parent().hasClass('name-setting'))	
			$.saveModal('name-setting');
		else
			$.saveModal('user-setting');

	});

	$('.modal .btn-cancel').on('click', function() {
		$('.modal input').val('');
	});

	

	$('#authenticate a').on('click', function() {
		var str = $(this).attr('class');
		$.switchPage(str);
	});

        // checkboxes
        $('#action-checkbox-all').on('click', function() {
            if($('#action-checkbox-all').is(":checked"))
                $('#all-account .someCheckbox').prop("checked", true);
            else
                $('#all-account .someCheckbox').prop("checked", false);
            
            if($('#action-checkbox-all').is(":checked"))
                $('#super-all-account .someCheckbox').prop("checked", true);
            else
                $('#super-all-account .someCheckbox').prop("checked", false);
        });
    
        $('#action-checkbox-new').on('click', function() {
            if($('#action-checkbox-new').is(":checked"))
                $('#new-account .someCheckbox').prop("checked", true);
            else
                $('#new-account .someCheckbox').prop("checked", false);
        });
        
        $('#action-checkbox-block').on('click', function() {
            if($('#action-checkbox-block').is(":checked"))
                $('#blocked-account .someCheckbox').prop("checked", true);
            else
                $('#blocked-account .someCheckbox').prop("checked", false);
            
            if($('#action-checkbox-block').is(":checked"))
                $('#super-blocked-account .someCheckbox').prop("checked", true);
            else
                $('#super-blocked-account .someCheckbox').prop("checked", false);
        });
        
        $('#action-checkbox-inactive').on('click', function() {
            if($('#action-checkbox-inactive').is(":checked"))
                $('#inactive-account .someCheckbox').prop("checked", true);
            else
                $('#inactive-account .someCheckbox').prop("checked", false);
            
            
            if($('#action-checkbox-inactive').is(":checked"))
                $('#super-inactive-account .someCheckbox').prop("checked", true);
            else
                $('#super-inactive-account .someCheckbox').prop("checked", false);
        });
        
        
        
        
        $('#action-all').on('click', function() {
            if($('#all-account .someCheckbox').is(":checked")) {
                $('#allAccountMassAction').modal('show');
            }
            else if($('#super-all-account .someCheckbox').is(":checked")) {
                $('#allAccountMassAction').modal('show');
            }  
            else {
                $('#message .file-action').text("No checkboxes being selected.");
                $('#message').modal('show');
            }
        });
        
        $('#action-inactive').on('click', function() {
            if($('#inactive-account .someCheckbox').is(":checked")) {
                $('#inactiveMassAction').modal('show');
            }
            else if($('#super-inactive-account .someCheckbox').is(":checked")) {
                $('#inactiveMassAction').modal('show');
            } 
            else {
                $('#message .file-action').text("No checkboxes being selected.");
                $('#message').modal('show');
            }
        });
        
        $('#action-new').on('click', function() {
            if($('#new-account .someCheckbox').is(":checked")) {
                $('#newUserMassAction').modal('show');
            }
             
            else {
                $('#message .file-action').text("No checkboxes being selected.");
                $('#message').modal('show');
            }
        });
        
        $('#action-block').on('click', function() {
            if($('#blocked-account .someCheckbox').is(":checked")) {
                $('#blockMassAction').modal('show');
            }
            else if($('#super-blocked-account .someCheckbox').is(":checked")) {
                $('#blockMassAction').modal('show');
            }    
            else {
                $('#message .file-action').text("No checkboxes being selected.");
                $('#message').modal('show');
            }
        });

});

jQuery.switchPage = function(id) {
	var str = '.' + id;
	if($(str).hasClass('a_login') || id == 'signup') {
		$('.login').addClass('no-display');
		$('#authenticate .signup').removeClass('no-display');
	}
	else if($(str).hasClass('a_signup') || id == 'login') {
		$('.signup').addClass('no-display');
		$('#authenticate .login').removeClass('no-display');	
	}
}

jQuery.editCancelButton = function(id) {
	var str = '.' + id;
	$(str + ' input').prop("disabled", true);
	if(!$(str).hasClass('txt-disabled'));
		$(str).addClass('txt-disabled');

	$(str + ' .edit').removeClass('no-display');
};

jQuery.editButton = function(id) {
	var str = '.' + id;
	$(str + ' input').prop("disabled", false);
	if($(str).hasClass('txt-disabled'))
		$(str).removeClass('txt-disabled');

	$(str + ' .edit').addClass('no-display');
};

jQuery.showTab = function(str) {
	$('section').each(function() {
		if($(this).hasClass('selectedTab'))
			$(this).removeClass('selectedTab');
	});


	$(str).addClass('selectedTab');
	
};

jQuery.getURLParameter = function(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
}