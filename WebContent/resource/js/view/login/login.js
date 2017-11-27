$(document).ready(function() {
	
	var validator = $("#fromLogin").validate({
        rules: {
            "user.username": "required",
            "user.password": "required"
        },
        messages: {
            "userBean.userName": "Please enter your username",
            "userBean.password": "Please enter your password"
        }
    });
	
});