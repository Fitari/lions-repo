// $(function() {
//   $(document).ready(function() {
//     $('#btn_search').click(function() {
//     	url =  '/customers/search';
//     	params = $(this.form).serialize();
// 			$('#no_result').hide(200);
//     	$.ajax({
//     		url: url,
//     		data: params,
//     		dataType: 'json',
//     		success: function(data) {
//     			if (data.length == 0) {
//     				$('#no_result').show(200);
//     			} else if (data.length == 1) {
// 						window.location = data[0].redirect_url
//     			} else {
//     				$('#tableContainer').append(createResTable (fields, results));
//     				$('#cSelectModal').foundation('reveal', 'open');
//     			}
//     			window.bla = data;
//     			console.log(data);
//     		}
//     	})
//     	return false;
//     });

//   	$('#btn_create').click(function() {
//       $(this.form).attr('action', '/customers');
//     	$(this.form).attr('method', 'POST');
//     });
//   });
// });