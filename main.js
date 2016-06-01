$(document).ready(function(){

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