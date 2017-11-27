
var currentUsername;
$(document).ready(function(){
	var token = $('meta[name=_csrf]').attr('content');
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		  });
	currentUsername = $("#username").val();
	//updateGrouproleInUser();
	updateRoleInGrouprole()
	onChangeCheckbox();
});



function searchEngine(input , ul) {
	console.log(input , ul)
    var input, filter, ul, li, a, i;
    input = document.getElementById(input);
    filter = input.value.toUpperCase();
    ul = document.getElementById(ul);
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("p")[0];
        console.log();
        if ($(a).text().toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}
function saveNewGroupRole(){
	var listCode = "";
	$('input[type="checkbox"]:checked').each(function(){
		var code = $(this).attr("groupRoleCode");
		listCode += code + ";"
	});
	var html = "<input type='hidden' name='listGroupRoles' value='"+ listCode +"'/>";
	console.log(html)
	$("#fromUpdateEmp").append(html);
	$("#fromUpdateEmp").submit();
}
function updateGrouproleInUser(){
	$("#btn-updateRole").click(function(){
		var listCode = "";
		$('.roled:checkbox:checked').each(function(){
			var code = $(this).attr("groupRoleCode");
			listCode += code + ";";
		});
		if(currentUsername == ''){
			console.log("username not found!");
		}
		else{
			$.post("/MBAL/web/userjson/updateGroupRole",{ username: currentUsername, listGroupRoleCode : listCode} , function(data, status){
				if(status == "success"){
					console.log(data);
					if(data.message == "success"){
						createAlert("success", "Cập nhật quyền vào vai trò thành công!");
						
						var groupRoles = JSON.parse(data.data);
						console.log(groupRoles);
						$("#tbl-tbody-group").empty();
						var html = "";
						for(var i = 0 ; i < groupRoles.length ; i++){
							html +="<tr>";
							html +="<td>" + groupRoles[i].groupRoleCode + "</td>";
							html +="<td>" + groupRoles[i].groupRoleName + "</td>";
							if(groupRoles[i].parent == null){
								html +="<td></td>";
							}
							else{
								html +="<td>" + groupRoles[i].parent.groupRoleName + "</td>";
							}
							if(groupRoles[i].forPartner == false){
								html +="<td></td>";
							} else {
								html += "<td>" + "x" + "<td/>";
							}
							html +="</tr>";
						}
						$("#tbl-tbody-group").append(html);
					}
					else{                                                                                                                                                             
						createAlert("danger" , "Lỗi! Không thể cập nhật quyền vào vai trò!")
					}
					$('#modal-grouprole').modal('hide');
				}
				else{
					createAlert("danger" , "Lỗi! Không thể cập nhật quyền vào vai trò!")
				}
			} );
		}
		
	});
}
function updateRoleInGrouprole(){
	$("#btn-updateRole").click(function(){
		var listCode = "";
		$("#tbl-tbody-group").empty();
		$('.roled:checkbox:checked').each(function(){
			var code = $(this).attr("grouprolecode");
			var name = $(this).attr("grouprolename");
			var parent = $(this).attr("parent");
			var html = "<tr>";
			 	html += "<td>" + code +"</td>";
			 	html += "<td>" + name + "</td>";
			 	html += "<td>" + parent + "</td>";
			 	html += "</tr>";
			 	$("#tbl-tbody-group").append(html);
		});
		
		$("#modal-grouprole").modal('hide');
	});
}
function updateUserInGroup(){
	$("#btn-update-user-modal").click(function(){
		var listUsername = "";
		$('.roled-user:checkbox:checked').each(function(){
			var code = $(this).attr("username");
			listUsername += code + ";";
		});
		console.log(listUsername);
		if(currentCode == ''){
			console.log("GroupRoleCode not found!");
		}
	});
}

function onChangeCheckbox(){
	$(".icheckbox_flat-green").on("click",function(){
		console.log("run");
	})
}