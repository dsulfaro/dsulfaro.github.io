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

	$("#fad").fadeTo(1500, 1);
	setTimeout(function(){
		$("#profile").fadeTo(1000, 1);
	}, 500);

	$(".project").mouseenter(function(){
		$(this).fadeTo(100, 0.5);
	});

	$(".project").mouseleave(function(){
		$(this).fadeTo(100, 1);
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


