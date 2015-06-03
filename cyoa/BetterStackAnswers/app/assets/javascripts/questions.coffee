# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	ruby = parseFloat($('#ruby-version').html());
	rails = parseFloat($('#rails-version').html());

	answer_background = (ruby, rails) ->
		console.log("function")
		console.log(ruby)
		console.log(rails)
		if(ruby > 1.7)
			$('#answer-body.panel-body').css("background-color", "#c8e6c9")
		else
			$('#answer-body.panel-body').css("background-color", "#ffcdd2")


	answer_background(ruby, rails);
