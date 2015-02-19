# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	$("#allCourses").modal('setting', 'transition', 'horizontal flip').modal('attach events', '#course', 'show');  
 
  
	$('#course_course_dates_attributes_0_start_date').datepicker
    dateFormat: 'yy-mm-dd'

	$('#course_course_dates_attributes_0_end_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#course_date_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#course_date_end_date').datepicker
    dateFormat: 'yy-mm-dd'

// $ ->
//   DateValidation = 
//     start_date:
//       identifier: 'course_date[start_date]'
//       rules: [
//         {
//           type: 'empty'
//           prompt: 'Fill in a Course Title'
//         }        
//       ]
//   settings = 
//     inline: true
//     onFailure: ->
//       console.log 'Failed'
//       false
//     onSuccess: ->
//       console.log 'Success'
//       return

//   $('.ui.form.time-select').form DateValidation, settings




	
