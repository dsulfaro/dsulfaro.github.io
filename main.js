$(document).ready(function(){

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