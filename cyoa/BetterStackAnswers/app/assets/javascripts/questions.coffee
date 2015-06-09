# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	ruby = parseFloat($('#ruby-version').html());
	rails = parseFloat($('#rails-version').html());

	answer_background = (ruby, rails) ->
		if(ruby > 2.0 || rails > 4.0)
			$('#answer-body-show.panel-body').css("background-color", "#c8e6c9")
		else
			$('#answer-body-show.panel-body').css("background-color", "#ffcdd2")


	answer_background(ruby, rails);
