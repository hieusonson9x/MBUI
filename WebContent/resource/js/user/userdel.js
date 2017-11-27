$(document).ready(function(){
	var token = $('meta[name=_csrf]').attr('content');
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		  });
	//$("#user-table").dataTable();
	$('#btn-reset').click(function() {
		var result = confirm("bạn có muốn reset password");
		if (result) {
		    //Logic to delete the item
			var  currentUsername = $("#username").val();
			console.log(currentUsername);
			if (currentUsername == null) {
				console.log("user name not found");
			} else {
				var html = "";
				html = "<a class='reset' href='delete?username='"+currentUsername+"''></a>"
				$("#btn-reset").append(html);
				$('.reset').click();
				$('#myModal').modal('hide');
				/*$.post("/MBAL/web/userjson/reset",{username : currentUsername} , function(data, status){
					if(status == "success"){
						console.log(data);
						if(data.message == "success"){
							createAlert("success", "reset pass thanh cong!");
							location.reload();
						}
						else{
							createAlert("danger" , "Lỗi! reset pass that bai!")
						}
					}
					else{
						createAlert("danger" , "Lỗi! Không thể cập nhật quyền vào vai trò!")
					}
					$('#myModal').modal('hide');
				} );*/
			}
		}
		
		
	});
	
	$('#btn-bolock').click(function() {
		var result = confirm("Bạn có muốn DEACTIVE NSD này không ?");
		if (result) {
		    //Logic to delete the item
			var  currentUsername = $("#username").val();
			console.log(currentUsername);
			if (currentUsername == null) {
				console.log("user name not found");
			} else {
				var html = "";
				html = "<a class='reset' href='delete?username='"+currentUsername+"''></a>"
				$("#btn-bolock").append(html);
				$('.reset').click();
				$('#myModal').modal('hide');
				/*$.post("/MBAL/web/userjson/bolock",{username : currentUsername} , function(data, status){
					if(status == "success"){
						console.log(data);
						if(data.message == "success"){
							createAlert("success", "block NSD thanh cong!");
							location.reload();
							
						}
						else{
							createAlert("danger" , "Lỗi! rblock NSD that bai!")
						}
					}
					else{
						createAlert("danger" , "Lỗi! Không thể cập nhật quyền vào vai trò!")
					}
					
				} );*/
			}
		}
	});
});
function setSecssionObj(fullname, title, email, status, username, phoneNumber) {
    removeSecssionObj();
    localStorage.setItem("fullname", fullname);
    localStorage.setItem("title", title);
    localStorage.setItem("email", email);
    localStorage.setItem("status", status);
    localStorage.setItem("username", username);
    localStorage.setItem("phoneNumber", phoneNumber);
    //log.console("fsdfsd");
    getSecssion();
}

 function removeSecssionObj() {
        sessionStorage.removeItem("nameNSD");
        sessionStorage.removeItem("title");
        sessionStorage.removeItem("email");
        sessionStorage.removeItem("status");
        sessionStorage.removeItem("username");
        sessionStorage.removeItem("phoneNumber");
}
function getSecssion() {
	//log.console("gggg", localStorage.getItem("nameNSD"));
	document.getElementById("nameNSD").value = localStorage.getItem("fullname");
	document.getElementById("title").value = localStorage.getItem("title");
	document.getElementById("email").value = localStorage.getItem("email");
	
	var status = localStorage.getItem("status");
	if (status == 0) {
		status = "ACTIVE";
	} else {
		status = "DEACTIVE";
	}
	document.getElementById("status").value = status;
	document.getElementById("username").value = localStorage.getItem("username");
	document.getElementById("SDT").value = localStorage.getItem("phoneNumber");
	var curentUsername = localStorage.getItem("username");
}