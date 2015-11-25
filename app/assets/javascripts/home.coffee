# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).ready ->
		$('#btn_search_h').click ->
			url = '/customers'
			params = $(@form).serialize() + "&from_page=home_index"
			window.location = url + "?" + params
			false
		

		$('#btn_create_h').click ->
			$(this.form).attr('action', '/customers')
			$(this.form).attr('method', 'POST')

