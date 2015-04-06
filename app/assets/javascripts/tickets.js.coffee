# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  validation =
    ticket_name:
      identifier: 'course_date[tickets_attributes][0][name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in a Ticket name'
        }
        {
          type: 'length[4]'
          prompt: 'The Course Title must be atleast 4 characters long'
        }
      ]
    ticket_price:
      identifier: 'course_date[tickets_attributes][0][price]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add an price to the ticket'
        }
        {
          type: 'contains[.]'
          prompt: 'Please add a validated price with a decimal place'
        }
      ]
    quantity:
      identifier: 'course_date[tickets_attributes][0][quantity]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add the amount of places available on this ticket'
        }
        {
          type: 'integer'
          prompt: 'ticket places must be a number'
        }
      ]
  settings =
    on     : 'blur'
    onFailure: ->
      console.log 'Failed'
      $('input[type=submit]').attr('disabled', false)
      $('.courseLoader').removeClass('active')
      false
    onSuccess: ->
      console.log 'Success'
      return
  $('.ui.form').form validation, settings

  $('#courseSubmit').click ->
    $('.courseLoader').addClass 'active'
    return
