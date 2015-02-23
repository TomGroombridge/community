# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()


payment =
  setupForm: ->
    $('#new_payment').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        payment.processCard()        
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#payment_stripe_card_token').val(response.id)
      $('#new_payment')[0].submit()
    else      
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

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