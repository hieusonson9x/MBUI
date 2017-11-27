$(document).ready(function() {
	
	$('#save-pending').click(function() {
		$('input[name="insurrance.typeReason"]').remove();
		$('input[name="insurrance.note"]').remove();
		var radio = $("input[name='optradio']:checked").val();
		if (typeof radio === "undefined") {
			alert("Hãy chọn lý do chờ xử lý");
			return;
		}
		var note = $("#note-pending").val();
		console.log(radio +" --- " +note);
		var html = "<input type='hidden' name='insurrance.typeReason' value='"+radio+"' />"
		html += "<input type='hidden' name='insurrance.note' value='"+note+"' />"
		$('#fromAdd').append(html);
		console.log(html);
		$('#myModal').modal('hide');
		$('#fromAdd').submit();
	});
//	
	$('#btnSave').click(function() {
		console.log("aaa")
		var pending = $("input[name='insurrance.statusContract']:checked").val();
		if (pending == 3) {
			$('#myModal').modal('toggle');
			$('#myModal').modal('show');
		} else {
			$('#fromAdd').submit();
		}
		
	});
});