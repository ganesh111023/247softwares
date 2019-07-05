// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery.min
//= require popper.min
//= require bootstrap.min
//= require custom

$(document).ready(function(){
	var form = $('#main-contact-form');
	form.submit(function(event){
		event.preventDefault();
		var form_status = $('<div class="form_status"></div>');
		var email ="";
		var subject ="";
		var token ="";
		var message = "";
		name = $("#contact_name").val();
		email = $("#contact_email").val();
		message = $("#contact_message").val();
		subject = $("#contact_subject").val();
		phone_number = $("#contact_phone_number").val();
		token = document.getElementsByName("authenticity_token")[0].value;
		$.ajax({
			method: "POST",
			url: $(this).attr('action'),
			data: { contact: {name: name, email: email, message: message, subject: subject, phone_number: phone_number}, authenticity_token: token },
			beforeSend: function(){
				form.prepend( form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn() );
			},
			success: function (html) {
        $("#sucess_msg").html('<p class="text-success">Thank you for contact us. As early as possible  we will contact you</p>');
				$("#main-contact-form").hide();
      },
      error: function(data, errorThrown)
      {
      	form_status.html("<p><i class='fa fa fa-exclamation-triangle'></i>"+data['responseText']+"</p>");
      	if($('.form_status').size() > 1){
      		$('.form_status').get(1).remove();
      	}
      	$('#main-contact-form .btn').removeAttr('disabled');
      }
		});
	});
})