# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()


payment =
  setupForm: ->
    $('#new_payment').submit (e) -> 
      e.preventDefault()
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').val().length
        payment.processCard()        
        return
    return

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, payment.handleStripeResponse)
    return
  
  handleStripeResponse: (status, response) ->
    if response.error
      console.log 'error :('
      return
    else
      $('#payment_stripe_card_token').val(response.id)
      $('#new_payment')[0].submit()
      return

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

  $('#new_payment').form PaymentValidation, settings