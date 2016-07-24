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

    console.log("hello world")

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



    $('.special.cards .image').dimmer({
      on: 'hover'
    });

    $('.menu .item')
      .tab()
    ;

    $('.button')
      .popup({
        inline   : true,
        hoverable: true,
        position : 'bottom left',
        delay: {
          hide: 300
        }
      })
    ;

    $('.date-link')
      .popup({
        inline   : true,
        hoverable: true,
        position : 'bottom left',
        delay: {
          hide: 300
        }
      })
    ;

    $('.circular.absorb_info')
      .popup({
        inline   : true,
        hoverable: true,
        position : 'bottom left',
        delay: {
          hide: 300
        }
      })
    ;

    $("#courseDates").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#course', 'show');

    $("#cropImage").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#cropModal', 'show');

    $("#normalUserModal").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#user', 'show');

    $("#normalUser").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#signIn', 'show');

    $("#normalUser").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#signInMobile', 'show');

    // $("#monthlySummary").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#monthlySummaryButton', 'show');

    $('#monthlySummary').modal('attach events', '#monthlySummaryButton', 'show');




    var button = document.getElementById('upload_button');
    var input  = document.getElementById('course_image');

});

$(function() {
  var settings, validation;
  validation = {
    name: {
      identifier: 'course_date[tickets_attributes][0][name]',
      rules: [
        {
          type: 'empty',
          prompt: 'Fill in a Course Title'
        }, {
          type: 'length[4]',
          prompt: 'The Course Title must be atleast 4 characters long'
        }, {
          type: 'maxLength[50]',
          prompt: 'You cannot go over 30 characters in the Course Title'
        }
      ]
    },
    start_date: {
      identifier: 'course_date[start_date]',
      rules: [
        {
          type: 'empty',
          prompt: 'Please select a start date'
        }
      ]
    },
    end_date: {
      identifier: 'course_date[end_date]',
      rules: [
        {
          type: 'empty',
          prompt: 'Please select a start date'
        }
      ]
    },
    price: {
      identifier: 'course_date[tickets_attributes][0][price]',
      rules: [
        {
          type: 'empty',
          prompt: 'Please add an price to the ticket'
        },
        {
          type: 'contains[.]',
          prompt: 'Please add a validated price with a decimal place'
        },
      ]
    },
    quantity: {
      identifier: 'course_date[tickets_attributes][0][quantity]',
      rules: [
        {
          type: 'empty',
          prompt: 'Please add an price to the ticket'
        },
        {
          type: 'integer',
          prompt: 'Ticket quantity must be a number'
        },
      ]
    }
  };
  settings = {
    on: 'blur',
    onFailure: function() {
      console.log('Failed');
      $('input[type=submit]').attr('disabled', false);
      $('.courseLoader').removeClass('active')
      return false;
    },
    onSuccess: function() {
      console.log('Success');
    }
  };
  return $('.ui.form.time-select').form(validation, settings);
});

$(function() {
  var setting, validations;
  validations = {
    name: {
      identifier: 'booking[name]',
      rules: [
        {
          type: 'empty',
          prompt: 'Fill in a bookings name'
        }
      ]
    },
    email: {
      identifier: 'booking[email]',
      rules: [
        {
          type: 'empty',
          prompt: 'Fill in the bookings email address'
        }, {
          type: 'email',
          prompt: 'Invalid email address'
        }
      ]
    },
    contact_number: {
      identifier: 'booking[contact_number]',
      rules: [
        {
          type: 'empty',
          prompt: "Fill in their contact number, if you dont have one put 'N/A'"
        }
      ]
    }
  };
  setting = {
    on: 'blur',
    onFailure: function() {
      console.log('Failed');
      $('.buttonLoader').removeClass('active');
      return false;
    },
    onSuccess: function() {
      console.log('Success');
    }
  };
  return $('.ui.form.booking').form(validations, setting);
});

// ---
// generated by coffee-script 1.9.2

