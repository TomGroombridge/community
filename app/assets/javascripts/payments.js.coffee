# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  PaymentValidation = 
    email:
      identifier: 'payment[email]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your email address'
        }
        {
          type: 'email'
          prompt: 'Invalid email'
        }                
      ]
    full_name:
      identifier: 'payment[full_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your name'
        }        
      ]
    mobile_number:
      identifier: 'payment[mobile_number]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your mobile number'
        }        
      ]            
  settings = 
    inline: true
    onFailure: ->
      console.log 'Failed'
      false
    onSuccess: ->
      console.log 'Success'
      return

  $('.ui.form.payment').form PaymentValidation, settings