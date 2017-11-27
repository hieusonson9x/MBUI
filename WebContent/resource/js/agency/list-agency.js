$(document).ready(function(){
	clickXemAgen();
});

function clickXemAgen(){
	$("#a-ag").click(function(){
		$.get("http://localhost:53160/api/agency",function(data,status){
			if(status =="success"){
				console.log(data);
				$("#content").empty();
				$html = "";
				$html += '<h2 class="col-sm-6">Quản lý chi nhánh</h2><button class="btn btn-primary id="btn-themchinhanh" style="margin-top:5px;">Thêm mới chi nhánh</button>\
					<table id="table-group"\
									class="table table-responsive table-striped table-bordered table-hover">\
									<thead>\
										<tr>\
											<th style="text-align: center; font-size:14px">STT</th>\
											<th style="text-align: center; font-size:14px;">Mã chi nhánh</th>\
											<th  style="text-align: center; font-size:14px;">Địa chỉ</th>\
											<th  style="text-align: center; font-size:14px;">Tên nhân viên tiếp nhận</th>\
											<th  style="text-align: center; font-size:14px;">Tên chi nhánh</th>\
											<th  style="text-align: center; font-size:14px;">Số điện thoại</th>\
											<th  style="text-align: center; font-size:14px;">Tùy chọn</th></tr>\
									</thead> <tbody id="body-group">';
					for(var i = 0 ; i < data.length ; i++){
						$html += "<tr>";
						$html+= "<td>" + (i+1)+"</td>";
						$html+= "<td>" + data[i].banhchCode+"</td>";
						$html+= "<td>" + data[i].address+"</td>";
						$html+= "<td>" + data[i].consultantName+"</td>";
						$html+= "<td>" + data[i].name+"</td>";
						$html+= "<td>" + data[i].phonenumber+"</td>";
						$html+= "<td>" + "<button class='btn btn-xs btn-default'"+"id=suacn"+ data[i].banhchCode +">Sửa</button>" + "<button class='btn btn-xs btn-default' "+"id=xoacn" + data[i].banhchCode+">Xóa</button>"+"</td>";
						
						$html +="</tr>";
					}
					$html +="</tbody></table>";
					$("#content").append($html);
					$("#table-group").dataTable({
						"searching" : false
					});
			}
		});
	});
}
