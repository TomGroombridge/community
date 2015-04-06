# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # init Isotope
  $container = $('.isotope').isotope(
    itemSelector: '.element-item'
    layoutMode: 'fitRows'
    getSortData:
      name: '.name'
      symbol: '.symbol'
      number: '.number parseInt'
      category: '[data-category]'
      weight: (itemElem) ->
        weight = $(itemElem).find('.weight').text()
        parseFloat weight.replace(/[\(\)]/g, '')
  )
  # filter functions
  filterFns =
    numberGreaterThan50: ->
      number = $(this).find('.number').text()
      parseInt(number, 10) > 50
    ium: ->
      name = $(this).find('.name').text()
      name.match /ium$/
  # bind filter button click
  $('#filters').on 'click', 'button', ->
    filterValue = $(this).attr('data-filter')
    # use filterFn if matches value
    filterValue = filterFns[filterValue] or filterValue
    $container.isotope filter: filterValue
    return
  # change is-checked class on buttons
  $('.button-group').each (i, buttonGroup) ->
    $buttonGroup = $(buttonGroup)
    $buttonGroup.on 'click', 'button', ->
      $buttonGroup.find('.is-checked').removeClass 'is-checked'
      $(this).addClass 'is-checked'
      return
    return
  return


# ---
# generated by js2coffee 2.0.1

jQuery ->
	$(".allCourses").modal('setting', 'transition', 'horizontal flip').modal('attach events', '.course', 'show');


	$('#course_course_dates_attributes_0_start_date').datepicker
    dateFormat: 'yy-mm-dd'

	$('#course_course_dates_attributes_0_end_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#course_date_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#course_date_end_date').datepicker
    dateFormat: 'yy-mm-dd'

$ ->
  validation =
    name:
      identifier: 'course_date[tickets_attributes][0][name]'
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
  settings =
    on     : 'blur'
    onFailure: ->
      console.log 'Failed'

      false
    onSuccess: ->
      console.log 'Success'
      return
  $('.ui.form').form validation, settings

