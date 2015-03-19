# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#info1').on 'click', ->
	  $('#content2').fadeOut()
	  $("#content3").fadeOut();
	  $('#content1').fadeIn()
	  $('#info1').addClass 'selected'
	  $('#info2').removeClass 'selected'
	  $('#info3').removeClass 'selected'
	  return
	$('#info2').on 'click', ->
	  $('#content1').fadeOut()
	  $("#content3").fadeOut();
	  $('#content2').fadeIn()
	  $('#info1').removeClass 'selected'
	  $('#info3').removeClass 'selected'
	  $('#info2').addClass 'selected'
	  return
	$('#info3').on 'click', ->
	  $('#content1').fadeOut()
	  $('#content2').fadeOut()
	  $('#content3').fadeIn()
	  $('#info1').removeClass 'selected'
	  $('#info2').removeClass 'selected'
	  $('#info3').addClass 'selected'
	  return

