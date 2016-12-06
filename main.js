$(document).ready(function(){

	$(".cookie").click(function(){
		var flavor = $(this).attr('id');
		switch(flavor){
			case "brownie":
				$('#brownieModal').modal('toggle');
				break;
			case "dough":
				$('#cookieModal').modal('toggle');
				break;
			case "chocCake":
				$('#chocCakeModal').modal('toggle');
				break;
			case "vanCake":
				$('#vanCakeModal').modal('toggle');
				break;
			case "red":
				$('#redModal').modal('toggle');
				break;
			case "cin":
				$('#cinModal').modal('toggle');
				break;
			case "smore":
				$('#smoreModal').modal('toggle');
				break;
			case "cup":
				$('#cupModal').modal('toggle');
				break;
		}
	});


	$("#nav ul li a[href^='#']").on('click', function(e){
		e.preventDefault();
		$('html, body').animate({
			scrollTop: $(this.hash).offset().top
		}, 300, function(){
			window.location.hash = this.hash;
		});
	});
});
