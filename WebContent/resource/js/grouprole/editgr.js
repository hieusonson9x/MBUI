
var currentCode;
$(document).ready(function(){
	currentCode = $("#ip-role-code").val();
	updateRoleInGrouprole();
	onChangeCheckbox();
	$("#errorLogin").fadeTo(2000, 500).slideUp(5000, function() {
		$("#errorLogin").slideUp(500);
	});
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
function updateRoleInGrouprole(){
	$("#btn-done").click(function(){
		var listCode = "";
		$("#tbl-tbody-role").empty();
		$('.roled:checkbox:checked').each(function(){
			var code = $(this).attr("rolecode");
			var name = $(this).attr("rolename");
			var html = "<tr>";
			 	html += "<td>" + code +"</td>";
			 	html += "<td>" + name + "</td>";
			 	html += "</tr>";
			 	$("#tbl-tbody-role").append(html);
		});
		
		$("#modal-role").modal('hide');
	});
}
function saveGroupRole(){
	console.log("saving grouprole");
	var name = $('#groupRoleName').val();
	var listCode = "";
	$('.roled:checkbox:checked').each(function(){
		var code = $(this).attr("rolecode");
		listCode += code+";";
	});
	
	var value = $('#parentCode').val();
    var html = "<input name='parentValue' type='hidden' value='"+value+"'>";
	
    	html += "<input type='hidden' name='listcoderole' value='"+ listCode +"'/>";
	console.log(html)
	$("#form-role").append(html);
	$("#form-role").submit();
	console.log(listCode);
}


function onChangeCheckbox(){
	$(".icheckbox_flat-green").on("click",function(){
		console.log("run");
	})
}