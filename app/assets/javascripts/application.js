// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
// require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

ready = function() {$(".top-bar-section>.right>li:nth-child(" + $(".top-bar-section>.right").attr("data-active") +")").addClass("active")}

$( document ).ready(ready);

$( document ).on('page:load', ready);

function createResTable (labels, results, container) {
	
	// if (!contailner || container = "")
	// 	container = "tableContainer"
	var table = $("<table id='cResultList' class='selectable' />");

	var row = $("<tr/>");
	$.each(labels, function(k,label){
		row.append($("<th/>").text(label));
	})
	table.append(row)

	$.each(results, function(i,res){
		row = $("<tr id='"+res["id"]+"'/>");
		$.each(labels, function(f,label){
			row.append($("<td/>").text(res[f]));
		})
		table.append(row)
	})

	container.html(table);

	$("#cResultList tr:not(:first-child)").click(function(){
	    $("#cResultList tr").removeClass("selected");
	    $(this).addClass("selected");
	});
}

function GetURLParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}​
