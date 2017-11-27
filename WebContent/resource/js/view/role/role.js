$(document).on("click", ".delete-button", function() {
	let rowData = $(this).closest("tr");
	$("#modal-role-code").text($(rowData).find(".role-code").text());
	$("#modal-role-name").text($(rowData).find(".role-name").text());
	$("#modal-role-action").text($(rowData).find(".role-action").text());
	$("#delete-submit").attr("href", "delete?id=" + $(rowData).find(".role-id").val());
});