$(document).ready(function(){
	$('.nav-tabs a').on('click', function(e) {
        localStorage.setItem("currentAttrValue", $(this).attr('href'));
        loadPage($(this).attr('href'));
        e.preventDefault();
      });
      loadPage(localStorage.getItem("currentAttrValue"));
      console.log(localStorage.getItem("currentAttrValue"));
});
function loadPage(currentValue) {
	  currentValue = currentValue === null ? '#discountByCusGroup' : currentValue;
	  $('.nav-tabs a[href="'+currentValue+'"]').tab('show');
}