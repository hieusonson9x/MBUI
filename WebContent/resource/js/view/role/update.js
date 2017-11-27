$(document).ready(function(){
	console.log("saving grouprole");
	var listCode = "";
	$('.roled:checkbox:checked').each(function(){
		var code = $(this).attr("rolecode");
		listCode += code+";";
	});
	var html = "<input type='hidden' name='listcoderole' value='"+ listCode +"'/>";
	console.log(html)
	$("#form-role").append(html);
	$("#form-role").submit();
	console.log(listCode);
});