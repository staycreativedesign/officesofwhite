// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.autotab.min.js


$( document ).ready(function() {
  $('#user_phone_number_1').autotab({ format: 'numeric', target: '#user_phone_number_2', previous:
  '#user_last_name' });
  $('#user_phone_number_2').autotab({ format: 'numeric', target: '#user_phone_number_3', previous:
  '#user_phone_number_1' });
  $('#user_phone_number_3').autotab({ format: 'numeric', target: '#user_other_phone_number_1', previous:
  '#user_phone_number_2' });
    $('#user_other_phone_number_1').autotab({ format: 'numeric', target: '#user_other_phone_number_2', previous:
  '#user_phone_number_3' });
  $('#user_other_phone_number_2').autotab({ format: 'numeric', target: '#user_other_phone_number_3', previous:
  '#user_other_phone_number_1' });
  $('#user_other_phone_number_3').autotab({ format: 'numeric', target: '#user_driver_license', previous:
  '#user_other_phone_number_2' });
  $('#user_driver_license').autotab({ format: 'alphanumeric', target: '#user_ss_1', previous:
  '#user_other_phone_number_3' });
  $('#user_ss_1').autotab({ format: 'numeric', target: '#user_ss_2', previous:
  '#user_driver_license' });
  $('#user_ss_2').autotab({ format: 'numeric', target: '#user_ss_3', previous:
  '#user_ss_1' });
  $('#user_ss_3').autotab({ format: 'numeric', target: '#user_dob_2i', previous:
  '#user_ss_2' });
  $('#user_zipcode').autotab({ format: 'numeric', target: '#user_time_at_address_months', previous:
  '#user_state' });
  $('#user_employment_zipcode').autotab({ format: 'numeric', target: '#user_employment_phone_1', previous:
  '#user_employment_state' });
  $('#user_employment_phone_1').autotab({ format: 'numeric', target: '#user_employment_phone_2', previous:
  '#user_employment_zipcode' });
  $('#user_employment_phone_2').autotab({ format: 'numeric', target: '#user_employment_phone_3', previous:
  '#user_employment_phone_1' });
  $('#user_employment_phone_3').autotab({ format: 'numeric', target: '#user_employment_months', previous:
  '#user_employment_phone_2' });
});
