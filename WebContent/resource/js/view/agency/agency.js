$(document).on("click", ".delete-button", function() {
	let rowData = $(this).closest("tr");
	$("#modal-agency-code").text($(rowData).find(".agency-code").text());
	$(".delete-button").attr("href", "delete?id=" + $(rowData).find(".agency-id").val());
	
});
$(document).ready(function() {
	$("#aaa").dataTable({
		"searching": false
	});
});