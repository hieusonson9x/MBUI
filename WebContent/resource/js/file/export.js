$(document).ready(function(){
	console.log("ok");
	$("#btn-export").click(function(){
		console.log("clicl");
		var startDate = $("#ip-startdate").val();
		var type = $("#sel1").val();
		var endDate = $("#ip-enddate").val();
		//getContextPath()
		$.post(getContextPath()+"/web/filejson/exportfile",{typeReport : type, startDate : startDate, endDate : endDate} , function(data, status){
			if(status == "success"){
				console.log(data);
				var arr = data.file;
				var byteArray = new Uint8Array(arr);
				var a = window.document.createElement('a');

				a.href = window.URL.createObjectURL(new Blob([byteArray], { type: 'application/octet-stream' }));
				a.download = data.fileName;

				// Append anchor to body.
				document.body.appendChild(a)
				a.click();
				// Remove anchor from body
				document.body.removeChild(a)
			}
		} );
	});
});