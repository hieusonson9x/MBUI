$(document).ready(function(){
	$("tr").each(function(){
		if(this.innerHTML.trim() == "") 
			this.remove();
	});
	$("#table-group").dataTable({
		"searching" : false
	});
	$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
		$("#errorLogin").slideUp(500);
	});
	console.log($("#a-nq").attr("href"));	
	history.pushState(null, null, $("#a-nq").attr("href"));
});
/*function confirmDel(){
	$(".del-group").click(function(event){
		var code = $(this).attr("code");
		if(!confirm("Bạn muốn xóa vai trò " + code + " khỏi hệ thống? Toàn bộ vai trò con sẽ bị xóa theo!"))
			event.preventDefault();
	});
}*/