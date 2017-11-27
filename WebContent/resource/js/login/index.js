$(document).ready(function(){
	console.log("ok");
	login();
});
function login(){
	$("#btn-login").click(function(){
		$username = $("#username").val();
		$password = $("#password").val();
		$data = {"username": $username, "password": $password};
		
		$.ajax({
		  url:"http://localhost:53160/api/Token/get",
		  type:"POST",
		  data:JSON.stringify($data),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(data){
			  console.log(data.token);
			  if(data.token != null && data.token != "" && data.token != undefined){
				  localStorage.setItem("token-mbui",data.token);
				  window.location.href = "http://localhost:8080/MBUI/view/home.jsp";
			  }
		  }
		})
	});
}