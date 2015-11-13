$(function() {
  $(document).ready(function() {
    $('#btn_search').click(function() {
    	url =  '/customers/search';
    	params = $(this.form).serialize();
			$('#no_result').hide(200);
    	$.ajax({
    		url: url,
    		data: params,
    		dataType: 'json',
    		success: function(data) {
    			if (data.length == 0) {
    				$('#no_result').show(200);
    			} else if (data.length == 1) {
						window.location = data[0].redirect_url
    			} else {
    				table = '<table><tr><th>תז</th><th>שם פרטי</th><th>שם משפחה</th><th>מגדר</th><th>ישוב</th><th>כתובת</th><th>טלפון</th><th>דוא"ל</th></tr><tr><td>111111111</td><td>יניב</td><td>פנחס</td><td>ז</td><td></td><td></td><td></td><td></td></tr><tr><td>222222222</td><td>אלון</td><td>צוקר</td><td>ז</td><td></td><td></td><td></td><td></td></tr><tr><td>333333333</td><td>אלון</td><td>שיטרית</td><td>ז</td><td></td><td></td><td></td><td></td></tr></table>'
    				$('#cResultList').append(table);
    				$('#cSelectModal').foundation('reveal', 'open');
    			}
    			window.bla = data;
    			console.log(data);
    		}
    	})
    	return false;
    });

  	$('#btn_create').click(function() {
      $(this.form).attr('action', '/customers');
    	$(this.form).attr('method', 'POST');
    });
  });
});