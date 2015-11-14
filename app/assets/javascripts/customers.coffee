# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).ready ->
		if GetURLParameter('from_home')
			url = '/customers/search'
			params = GetURLParameter('data')
			if $('#no_result')
				$('#no_result').hide 200
			$.ajax
				url: url
				data: params
				dataType: 'json'
				success: (data) ->
					#console.log(data)
					handleSearch(data)
			false


		$('#btn_search').click ->
			url = '/customers/search'
			params = $(@form).serialize()
			if $('#no_result')
				$('#no_result').hide 200
			$.ajax
				url: url
				data: params
				dataType: 'json'
				success: (data) ->
					#console.log(data)
					handleSearch(data)
			false


		$('#btn_create').click ->
			$(@form).attr 'action', '/customers'
			$(@form).attr 'method', 'POST'
			return
		return


	handleSearch = (data) ->
		if data.length == 0
			$('#no_result').show 200
		else if data.length == 1
			window.location = data[0].redirect_url
		else
			fields = 
	            'tz': 'ת.ז.'
	            'fname': 'שם פרטי'
	            'lname': 'שם משפחה'
	            'city': 'ישוב'
	            'address': 'כתובת'
	            'phone': 'טלפון'
	            'email': 'דוא"ל'

        	
			$(data.res).each (k,r) ->
				r.city = data.nested.filter((data) ->
					return data.id == r.city_id
				)[0].name

			createResTable(fields, data.res, $('#tableContainer'))
			$('#cSelectModal').foundation 'reveal', 'open'
			$('#res_count').text(data.res.length);
			$('#tableContainer tr:not(:first-child)').click ->
				$('#cSelectModal #btn_select').removeClass("secondary disabled")

			$('#cSelectModal #btn_select').click ->
				$(this).attr 'href', '/customers/'+$('#tableContainer tr.selected')[0].id
				true
		return

