var price = document.getElementById("price").innerHTML;
var maxAvailable = $( "input[name='quantity']").attr('max');

jQuery('#item-view-quantity-input').on('input propertychange paste', function() {
	var quantity = parseFloat($( "input[name='quantity']").val(), 10);
	var totalPrice=quantity*price;
	if(isNaN(totalPrice) || quantity < 1 || quantity>maxAvailable || !Number.isInteger(quantity)){
		$('#total').html('<span style="color:red;">Provide a proper quantity!</span>');
	}
	else{
		$('#total').html("$"+totalPrice.toFixed(2));
	}
    
});

jQuery(document).ready(function() {
	var quantity = parseFloat($( "input[name='quantity']").val(), 10);
	var totalPrice=quantity*price;
	if(isNaN(totalPrice) || quantity < 1 || quantity>maxAvailable || !Number.isInteger(quantity)){
		$('#total').html('<span style="color:red;">Provide a proper quantity!</span>');
	}
	else{
		$('#total').html("$"+totalPrice.toFixed(2));
	}
    
});