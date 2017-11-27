$(document).ready(function(){
	$('#dateRange').datetimepicker({
        format: 'DD/MM/YYYY',
        allowInputToggle: true,
        locale: 'vi'
    });
	$('#birthday').datetimepicker({
        format: 'DD/MM/YYYY',
        allowInputToggle: true,
        locale: 'vi'
    });
});