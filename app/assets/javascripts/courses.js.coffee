# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#course_crop_x').val(coords.x)
    $('#course_crop_y').val(coords.y)
    $('#course_crop_w').val(coords.w)
    $('#course_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(200/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(200/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(200/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(200/coords.h * coords.y) + 'px'


jQuery ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()




$ ->
  validation =
    name:
      identifier: 'course[name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in a Course Title'
        }
        {
          type: 'length[4]'
          prompt: 'The Course Title must be atleast 4 characters long'
        }
        {
          type: 'maxLength[50]'
          prompt: 'You cannot go over 30 characters in the Course Title'
        }
      ]
    address1:
      identifier: 'course[course_addresses_attributes][0][address1]'
      rules: [ {
        type: 'empty'
        prompt: 'Please fill in the first line of your address'
      } ]
    address2:
      identifier: 'course[course_addresses_attributes][0][address2]'
      rules: [ {
        type: 'empty'
        prompt: 'Please fill in the second line of your address'
      } ]
    city:
      identifier: 'course[course_addresses_attributes][0][city]'
      rules: [ {
        type: 'empty'
        prompt: 'Please fill in the city or town'
      } ]
    postcode:
      identifier: 'course[course_addresses_attributes][0][postcode]'
      rules: [ {
        type: 'empty'
        prompt: 'Please fill in the postcode of your address'
      } ]
    image:
      identifier: 'course[avatar]'
      rules: [ {
        type: 'empty'
        prompt: 'Please add an image to the course'
      } ]
    price:
      identifier: 'course[price]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add an price to the course'
        }
        {
          type: 'contains[.]'
          prompt: 'Please add a validated price with a decimal place'
        }
      ]
    start_date:
      identifier: 'course[course_dates_attributes][0][start_date]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add the start date of the course'
        }
      ]
    end_date:
      identifier: 'course[course_dates_attributes][0][end_date]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add the end date of the course'
        }
      ]
    quantity:
      identifier: 'course[course_dates_attributes][0][quantity]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add the amount of places available on this course'
        }
        {
          type: 'integer'
          prompt: 'Course places must be a integer'
        }
      ]
    ticket_name:
      identifier: 'course[course_dates_attributes][0][tickets_attributes][0][name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add the name of the ticket'
        }
      ]
    ticket_quantity:
      identifier: 'course[course_dates_attributes][0][tickets_attributes][0][quantity]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add an price to the ticket'
        }
        {
          type: 'integer'
          prompt: 'Ticket quantity must be a number'
        }
      ]
    ticket_price:
      identifier: 'course[course_dates_attributes][0][tickets_attributes][0][price]'
      rules: [
        {
          type: 'contains[.]'
          prompt: 'Please add a validated price with a decimal place'
        }
        {
          type: 'empty'
          prompt: 'Please add the quantity of tickets'
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
  $('#termsAndConditions').modal('setting', 'transition', 'horizontal flip').modal 'attach events', '#terms', 'show'
  return

  $('#courseSubmit').click ->
    $('.courseLoader').addClass 'active'
    return






