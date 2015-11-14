# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).ready ->
		$('#btn_search').click ->
			url = '/customers'
			params = 
				'data' : $(@form).serialize()
				'from_page' : 'home#index'
			$.ajax
				url: url
				data: params
				dataType: 'json'
				success: (data) ->
					#console.log(data)
					handleSearch(data)
			false
		

		$('#btn_create').click ->
			$(this.form).attr('action', '/customers')
			$(this.form).attr('method', 'POST')

