$(function() {
	$("#fromAddEmp").validate({
		rules : {
			"user.firstName" : {
				required : true
			},
			"user.lastName" : {
				required : true
			},
			"user.email" : {
				required : true,
				email: true
			},
			"user.username" : {
                required : true
            }
           /* "user.role" : {
                selectStatus : true
            }
*/
		},
		messages : {
			"user.firstName" : {
				required : "không được để trống trường này"
			},
			"user.lastName" : {
				required : "không được để trống trường này"
			},
			"user.email" : {
				required : "không được để trống trường này",
				email: "sai định dạng"
			},
			"user.username" : {
                required : "không được để trống trường này"
            }
            /*status : {
                required : "Chọn trạng thái"
            },*/
		}
	});
});

