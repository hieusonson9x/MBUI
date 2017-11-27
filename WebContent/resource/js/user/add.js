$(document).ready(function(){
	var token = $('meta[name=_csrf]').attr('content');
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		  });
	
	
	$("#btn-add-user").click(function() {
		
		
//		var listGroupRole = [];
//		$('input[type="checkbox"]:checked').each(function(){
//			var code = $(this).val();
//			listGroupRole += code + ";"
//		});
		/*var username = $("#username").val();
		var email = $("#email").val();
		var fullname = $("#fullname").val();
		var phonenumber = $("#phonenumber").val();
		var sta = $("#sta").val();
		var title = $("#title").val();
		console.log(listGroupRole);
		
		if (username == '' | email == '' | fullname == '') {
			createAlert("danger" , "bạn không thể để trống các trường bắt buôc")
		}
		else {
			$.post("/MBAL/web/userjson/addGroupRole",{username : username,email : email,fullname : fullname, phonenumber : phonenumber,sta : sta,title : title,listGroupRoleCode : listGroupRole} , function(data, status){
				if(status == "success"){
					console.log(data);
					if(data.message == "success"){
						createAlert("success", "Thêm NSD thành công!");
						
					}
					else{
						createAlert("danger" , "Lỗi! Thêm Quyền thất bại!")
					}
				}
				else{
					createAlert("danger" , "Lỗi! Không thể cập nhật quyền vào vai trò!")
				}
			} );
		}*/
	});
});

function saveNewGroupRole(){
	var listCode = "";
	$('input[type="checkbox"]:checked').each(function(){
		var code = $(this).val();
		listCode += code + ";"
	});
	var html = "<input type='hidden' name='listGroupRoles' value='"+ listCode +"'/>";
	console.log(html)
	$("#fromAddEmp").append(html);
	$("#fromAddEmp").submit();
}