$.ajaxSetup({
    headers:
        { 'X-CSRF-TOKEN': $( "input[name='_csrf']" ).attr('value') }
});
$(document).ready(function(){
	//alert(localStorage.getItem("token-mbui"));
	let check = $("#check-ss").text().trim()
	console.log(check);
	if(check == null || check == ''){
		$("#logout-form").submit();
	}
});

$(document).ajaxStart(function(){
    $("#wait").remove();
    $html = '<div id="wait" class="alert alert-success" style="z-index: 1000; position:fixed;bottom:10px;right:10px;">\
                  <a href="#" class="close" data-dismiss="alert" aria-label="close"></a>\
                  <i class="fa fa-refresh fa-spin"></i>\
                  <strong>Đang xử lý...</strong>\
                </div>';
    //Pace.restart();
    $('body').append($html);
});

//Add anhlt 26-10-2017
function fomatNumber(value) {
	return parseFloat(Math.round(value * 100) / 100).toFixed(0);
}
//End

function getContextPath() {
	   return $("#context-path").val();
	}
$(document).ajaxComplete(function(){
    $("#wait").remove();
    console.log("ajaxComplete");
});
function createAlert($type , $data){
    $html = '<div id="alertA" class="alert alert-'+$type+'" style="position:fixed;bottom:10px;right:10px;">\
								  <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>'+
        $data +'</div>';
    $('#alertA').remove();
    $('body').append($html);
    $('#alertA').delay(50000).fadeOut('fast');
}