# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  companyValidation =
    first_name:
      identifier: 'user[first_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your First Name'
        }
      ]
    last_name:
      identifier: 'user[last_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in you Last Name'
        }
      ]
    email:
      identifier: 'user[email]'
      rules: [
      	{
          type: 'empty'
          prompt: 'Fill in a Email Address'
        }
        {
          type: 'email'
          prompt: 'Please fill in a valid Email Address'
        }
      ]
    contact_number:
      identifier: 'user[contact_number]'
      rules: [ {
        type: 'empty'
        prompt: 'Fill in a contact number'
      } ]
    password:
      identifier: 'user[password]'
      rules: [ {
        type: 'empty'
        prompt: 'Please enter a password'
      } ]
    password_confirmation:
      identifier: 'user[password_confirmation]'
      rules: [ {
        type: 'match[user[password]]'
        prompt: 'password confirmation does not match'
      } ]
    company_name:
      identifier: 'user[company_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please enter a company name'
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

  $('.ui.form.company.user').form companyValidation, settings
  $('#termsAndConditions').modal('setting', 'transition', 'horizontal flip').modal 'attach events', '#terms', 'show'
  return

$ ->
  userValidation =
    first_name:
      identifier: 'user[first_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your First Name'
        }
      ]
    last_name:
      identifier: 'user[last_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in you Last Name'
        }
      ]
    email:
      identifier: 'user[email]'
      rules: [
      	{
          type: 'empty'
          prompt: 'Fill in a Email Address'
        }
        {
          type: 'email'
          prompt: 'Please fill in a valid Email Address'
        }
      ]
    password:
      identifier: 'user[password]'
      rules: [ {
        type: 'empty'
        prompt: 'Please enter a password'
      } ]
    password_confirmation:
      identifier: 'user[password_confirmation]'
      rules: [
      	{
	        type: 'match[user[password]]'
	        prompt: 'password confirmation does not match'
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

  $('.ui.form.noraml.user').form userValidation, settings

$ ->
  userEditValidation =
    first_name:
      identifier: 'user[first_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in your First Name'
        }
      ]
    last_name:
      identifier: 'user[last_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in you Last Name'
        }
      ]
    email:
      identifier: 'user[email]'
      rules: [
        {
          type: 'empty'
          prompt: 'Fill in a Email Address'
        }
        {
          type: 'email'
          prompt: 'Please fill in a valid Email Address'
        }
      ]
    user_avatar:
      identifier: 'user[avatar]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please add a image to a user'
        }
      ]
    contact_number:
      identifier: 'user[contact_number]'
      rules: [ {
        type: 'empty'
        prompt: 'Fill in a contact number'
      } ]
    company_name:
      identifier: 'user[company_name]'
      rules: [
        {
          type: 'empty'
          prompt: 'Please enter a company name'
        }
      ]
  settings =
    on     : 'blur'
    onFailure: ->
      console.log 'Failed'
      false
    onSuccess: ->
      console.log 'Success'
      return

  $('.ui.form.edit.user').form userEditValidation, settings


