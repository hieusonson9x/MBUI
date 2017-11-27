$(document).ready(function() {
	var token = $('meta[name=_csrf]').attr('content');
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
	});
	var aa = $('#rateIncrease11').val();
	if(aa === '0,0' || aa === '0.0'){
		$('#rateIncrease11').val('');
	}
	var bb = $('#insuranceMoney11').val();
	var tty = bb.split(',');
	if(tty[0] != ''){
		$('#insuranceMoney11').val(tty[0]);
	}
	
	$('#customerCode').change(function() {
		var customerCode = $('#customerCode').val();
		console.log(customerCode);
		$('#insurrance.sex').val(1);
		$.post(getContextPath() +"/web/customerjson/getCustomer",{customerCode : customerCode} , function(data, status){
			if(status == "success"){
				console.log(data.data);
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					if(load.dateRange != null){
						var date = new Date(new Number(load.dateRange));
						$('input[name="insurrance.dateRange"]').val(date.getDate()+'/'+(date.getMonth()+1)+'/'+date.getFullYear());
					}
					var date2 = new Date(new Number(load.birthday));
					$('input[name="insurrance.cardId"]').val(load.cmtnd);
					$('input[name="insurrance.issuedBy"]').val(load.issuedBy);
					//$('input[name="insurrance.sex"]').val(load.sex);
					$('input[name="insurrance.sex"][value="' + load.sex + '"]').prop('checked', true);
					$('input[name="insurrance.customerName"]').val(load.fullname);
					$('input[name="insurrance.birthday"]').val(date2.getDate()+'/'+(date2.getMonth()+1)+'/'+date2.getFullYear());
					
					var labels = document.documentElement.getElementsByTagName('label');
					for(var i=0;i<labels.length;i++) {  
						if(labels.item(i).getAttribute('for')=='insurrance_cardId' || labels.item(i).getAttribute('for')=='insurrance_customerName'
							|| labels.item(i).getAttribute('for')=='insurrance.sex' || labels.item(i).getAttribute('for')=='birthday') {
							labels.item(i).innerHTML = '';
						}
					}
				} else {
					$('input[name="insurrance.dateRange"]').val(null);
					$('input[name="insurrance.cardId"]').val(null);
					$('input[name="insurrance.issuedBy"]').val(null);
					$('input[name="insurrance.customerName"]').val(null);
					$('input[name="insurrance.birthday"]').val(null);
					$('input[name="insurrance.sex"]').prop('checked', false);
				}
			}
		} );
	});
	
	$('#product').change(function() {
		var code = $('#product').val();
		console.log(code);
		if ($('#feeRateByPayMethodHidden').val) {
			$('#feeRateByPayMethodHidden').remove();
		}
		$("#insurrance_groupCustomer").empty();
		
		var rate_product = 0;
		var rate_money = 0;
		var rate_customer = 0;
		
		$.post(getContextPath() + "/web/insurrancejson/getConfigProduct",{code : code} , function(data, status){
			if(status == "success"){
				var load = JSON.parse(data.data);
				var loadRate = JSON.parse(data.data1);
				console.log(load);
				if(data.message == "success"){
					$('#insurrance_coverageRate').val(load.feeRateByPayMethod);
					var html = "<input type='hidden' id='feeRateByPayMethodHidden' value='"+load.feeRateByPayMethod+"'/>"
					$('#fromAdd').append(html);
					
				}
				else{
					return;
				}
				if (data.message1 == "success"){
					if (loadRate) {
						let html = "";
						html += "<option ></option>";
						for(let i=0; i< loadRate.length; i++){
							html+="<option value="+loadRate[i].id+" >"+loadRate[i].customerGroup+"</option>"
						}
						console.log(html);
						$("#insurrance_groupCustomer").append(html);
					}
				} else {
					return;
				}
			}
			
		} );
	});
	
	$('input[name="insurrance.agency"]').change(function() {
		var agencyCode = $('#agency').val();
		console.log(agencyCode);
		$.post(getContextPath() + "/web/agencyjson/getAgency",{agencyCode : agencyCode} , function(data, status){
			console.log(data);
			if(status == "success"){
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					$('input[name="insurrance.agencyName"]').val(load.name);
				}
				else{
					return;
				}
			}
			
		} );
	});
		
	
	$('input[name="insurrance.insuranceMoney"]').change(function() {		
		var money = $('input[name="insurrance.insuranceMoney"]').val();
		var productCode = $('#product').val();
		console.log(productCode);
		console.log(money);
		if ($('#feeRateByPayMethodHidden1').val()) {
			$('#feeRateByPayMethodHidden1').remove();
		}
		var rate_product = $('#feeRateByPayMethodHidden').val();
		//var rate_money = $('#feeRateByPayMethodHidden1').val();
		var rate_customer = $('#feeRateByPayMethodHidden2').val();
		var rate = 0;
		$.post(getContextPath() + "/web/discountjson/getDiscount",{money : money,productCode:productCode} , function(data, status){
			if(status == "success"){
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					var rate_current_money = load.rate;
					if (rate_product && rate_customer) {
						rate = rate_product - (rate_current_money*rate_product)/100 - (rate_customer*rate_product)/100;;
					}
					if (rate_product && !rate_customer) {
						rate = rate_product - (rate_current_money*rate_product)/100;
					}
					$('#insurrance_coverageRate').val(Math.round(rate * 100000)/100000);
					var html = "<input type='hidden' id='feeRateByPayMethodHidden1' value='"+load.rate+"'/>"
					html += "<input type='hidden' name='groupMoney' value='"+load.id+"' />";
					$('#fromAdd').append(html);
				}
				else{
					if (rate_product && rate_customer) {
						rate = rate_product - (rate_customer*rate_product)/100;;
					}
					if (rate_product && !rate_customer) {
						rate = rate_product;
					}
					$('#insurrance_coverageRate').val(Math.round(rate * 100000)/100000);
				}
			}
			
		} );
		
		/*var nf = new Intl.NumberFormat();
		var yy = nf.format(money); 
		$('input[name="insurrance.insuranceMoney"]').val(yy);*/
		
	});
	$('select[name="insurrance.groupCustomer"]').change(function() {
		var customer_id = $('select[name="insurrance.groupCustomer"]').val();
		if ($('#feeRateByPayMethodHidden2').val) {
			$('#feeRateByPayMethodHidden2').remove();
		}
		var rate_product = $('#feeRateByPayMethodHidden').val();
		var rate_money = $('#feeRateByPayMethodHidden1').val();
		//var rate_customer = $('#feeRateByPayMethodHidden2').val();
		var rate = 0;
		$.post(getContextPath() + "/web/discountcustomerjson/getDiscountByCustomer",{customer_id : customer_id} , function(data, status){
			console.log(data);
			if(status == "success"){
				var load = JSON.parse(data.data);
				console.log(load);
				if(data.message == "success"){
					rate_current_money = load.rate;
					if (rate_product && rate_money) {
						rate = rate_product - (rate_current_money*rate_product)/100 - (rate_money*rate_product)/100;
					}
					if (rate_product && !rate_money) {
						rate = rate_product - (rate_current_money*rate_product)/100;
					}
//					rate_product = $('#feeRateByPayMethodHidden').val();
//					rate = rate_product - (rate_money*rate_product)/100;
					$('#insurrance_coverageRate').val(Math.round(rate * 100000)/100000);
					var html = "<input type='hidden' id='feeRateByPayMethodHidden2' value='"+load.rate+"'/>"
					$('#fromAdd').append(html);
				}
				else{
					if (rate_product && rate_money) {
						rate = rate_product - (rate_money*rate_product)/100;
					}
					if (rate_product && !rate_money) {
						rate = rate_product;
					}
					$('#insurrance_coverageRate').val(Math.round(rate * 100000)/100000);
				}
			}
		});
	});
	
	/*$('input[name="insurrance.insuranceAmountToMB"]').change(function() {
		var x = $('input[name="insurrance.insuranceAmountToMB"]').val();
		var money = $('input[name="insurrance.insuranceMoney"]').val();
		var rate = $('input[name="insurrance.coverageRate"]').val();
		var total = 0;
		if (money === '' || rate === '') {
			return;
		} else {
			total = rate*money;
			if (total !== x) {
				var ok = confirm("phí bảo hiểm không khớp bạn chắc chắn muốn lưu?");
				if (ok) {
					return;
				} else {
					$('input[name="insurrance.insuranceAmountToMB"]').val(total);
				}
			}
		}
	});*/
	
	$('input[name="insurrance.coverageRate"]').change(function() {
		var x = $('input[name="insurrance.coverageRate"]').val();
		var money = $('#feeRateByPayMethodHidden').val();
		var rate = $('#feeRateByPayMethodHidden1').val();
		var y = $('#feeRateByPayMethodHidden2').val();
		var total = 0;
		
		if (money && rate && !y) {
			total = money - (money*rate)/100;
		}
		if (money && y && rate) {
			total = money - (money*y)/100 - (money*rate)/100;
		}
		if (money && y && !rate) {
			total = money - (money*y)/100;
		}
		
		if (money && !y && !rate) {
			total = money;
		}
		total =  Math.round(total * 100000)/100000;
		if (total !== x) {
			var ok = confirm("Tỷ lệ phí bảo hiểm không khớp bạn chắc chắn muốn lưu?");
			if (ok) {
				return;
			} else {
				$('input[name="insurrance.coverageRate"]').val(total);
			}
		}
	});
});