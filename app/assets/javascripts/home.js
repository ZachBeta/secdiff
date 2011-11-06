//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
	var d= new diff_match_patch;
	var diffs=d.diff_main($('#first').text(),$('#second').text());
	d.diff_cleanupSemantic(diffs);
	var out=d.diff_prettyHtml(diffs);
	$('#content').html(out);
});
 
