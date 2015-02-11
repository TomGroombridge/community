# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	$("#allCourses").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#course', 'show');  

	$('#course_course_dates_attributes_0_start_date').datepicker(
    dateFormat: 'yy-mm-dd');

	$('#course_course_dates_attributes_0_end_date').datepicker(
    dateFormat: 'yy-mm-dd');  
  



	
