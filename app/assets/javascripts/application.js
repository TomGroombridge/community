// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require jquery.Jcrop
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .
//= require ckeditor/init


$(document).ready(function() {  

    $('#example2')
      .progress({
        percent: gon.percentage
      })
    ;

    $('.filter.menu .item')
      .tab()
    ;

    $('.ui.rating')
      .rating({
        clearable: true
      })
    ;

    $('.ui.sidebar')
      .sidebar({
        context: $('.bottom.segment')
      })
      .sidebar('attach events', ' .menu .open_item')
    ;

    $('.ui.dropdown')
      .dropdown()
    ;

    $('.small.test.modal')
      .modal('show')
    ;

    $('.ui.checkbox')
      .checkbox()
    ;

    $('.ui.accordion')
      .accordion()
    ;      

    $('.gmap').append('<iframe frameborder="0" style="border:0" src="https://maps.google.com/maps?output=embed&iwloc&z=12&t=p&q=London UK"></iframe>');

    $('.special.cards.image')
      .dimmer({
        on: 'hover'
    });         
      
    $("#courseDates").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#course', 'show');

    $("#cropImage").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#cropModal', 'show');  

    $("#normalUserModal").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#user', 'show');  

    $("#companyUserModal").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#companyUser', 'show');  

    $("#normalUser").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#signIn', 'show');  
    




    var button = document.getElementById('upload_button');
    var input  = document.getElementById('course_image');      


    var payment;

    jQuery(function() {
      Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
      return payment.setupForm();
    });

    payment = {
      setupForm: function() {
        return $('#new_payment').submit(function() {
          $('input[type=submit]').attr('disabled', true);
          if ($('#card_number').length) {
            payment.processCard();
            return false;
          } else {
            return true;
          }
        });
      },
      processCard: function() {
        var card;
        card = {
          number: $('#card_number').val(),
          cvc: $('#card_code').val(),
          expMonth: $('#card_month').val(),
          expYear: $('#card_year').val()
        };
        return Stripe.createToken(card, payment.handleStripeResponse);
      },
      handleStripeResponse: function(status, response) {
        if (status === 200) {
          $('#payment_stripe_card_token').val(response.id);
          return $('#new_payment')[0].submit();
        } else {
          $('#stripe_error').text(response.error.message);
          return $('input[type=submit]').attr('disabled', false);
        }
      }
    };

         


});



