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

 
