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
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .
//= require ckeditor/init



$(document).ready(function() {

    $('.filter.menu .item')
      .tab()
    ;

    $('.ui.rating')
      .rating({
        clearable: true
      })
    ;

    $('.ui.sidebar')
      .sidebar('attach events', '.launch.button')
    ;

    $('.ui.dropdown')
      .dropdown()
    ;

    $('.standard.test.modal')
 			 .modal('show')
		;

		$('.ui.checkbox')
		  .checkbox()
		;


    var button = document.getElementById('upload_button');
    var input  = document.getElementById('course_image');

    // Making input invisible, but leaving shown fo graceful degradation
    input.style.display = 'none';
    button.style.display = 'initial';

    button.addEventListener('click', function (e) {
        e.preventDefault();
        
        input.click();
    });

    input.addEventListener('change', function () {
       button.innerText = this.value; 
    });

});


$(function(){
  $('.ui.form').form({
    name: {
      identifier: 'course-name',
      rules: [
        { type: 'empty', prompt: "Fill in a Course Title"},
        { type: 'length[4]', prompt: "The Course Title must be atleast 4 characters long"},
        { type: 'maxLength[30]', prompt: "You cannot go over 30 characters in the Course Title"},        
      ]
    },
    blurb: {
      identifier: 'course-blurb',
      rules: [
        { type: 'empty', prompt: "Fill in a Tweetable Description"},        
        { type: 'maxLength[120]', prompt: "You cannot go over 120 characters in this Tweet"},        
      ]
    },
    description: {
      identifier: 'course-description',
      rules: [
        { type: 'empty', prompt: "Fill in a Course Description"}              
      ]
    },
    address1: {
      identifier: 'address1',
      rules: [
        { type: 'empty', prompt: "Please fill in the first line of your address"}              
      ]
    },
    county: {
      identifier: 'county',
      rules: [
        { type: 'empty', prompt: "Please fill in the county of your course"}              
      ]
    },
    postcode: {
      identifier: 'postcode',
      rules: [
        { type: 'empty', prompt: "Please fill in the postcode of your address"}              
      ]
    },
    image: {
      identifier: 'course-image',
      rules: [
        { type: 'empty', prompt: "Please add an image to the course"}              
      ]
    },
    price: {
      identifier: 'course-price',
      rules: [
        { type: 'empty', prompt: "Please add an price to the course"}              
      ]
    },
  })
});

