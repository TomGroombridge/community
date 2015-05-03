# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  validation =
    name:
      identifier: 'booking[name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in the name of the booking'
        }
      ]
    email:
      identifier: 'booking[email]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your email address'
        }
        {
          type: 'email'
          prompt: 'Invalid their email'
        }
      ]
    contact_number:
      identifier: 'booking[contact_number]'
      rules: [
        {
          type: 'empty'
          prompt: "Fill in their contact number if you dont have one put 'N/A'"
        }
      ]
  settings =
    on     : 'blur'
    onFailure: ->
      console.log 'Failed'
      $('.buttonLoader').removeClass('active')
      false
    onSuccess: ->
      console.log 'Success'
      return
  $('.ui.form.booking').form validation, settings
  return