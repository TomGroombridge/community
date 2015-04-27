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
//= require isotope-docs.min.js
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

    $("#companyUserModal").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#companyUser', 'show');

    $("#normalUser").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#signIn', 'show');

    $("#normalUser").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#signInMobile', 'show');

    // $("#monthlySummary").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#monthlySummaryButton', 'show');

    $('#monthlySummary').modal('attach events', '#monthlySummaryButton', 'show');




    var button = document.getElementById('upload_button');
    var input  = document.getElementById('course_image');

});



