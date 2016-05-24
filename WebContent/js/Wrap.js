$(function(){
	$(".wrap_1_2_3 td").mousemove(function(){
		$(this).addClass("wrap111");
	});
	$(".wrap_1_2_3 td").mouseout(function(){
		$(this).removeClass("wrap111");
	});
	
	$(".hot_1_1_1 span:eq(0)").addClass("hot_1_1_1_1");
	$(".hot_1_1_1 span:eq(1)").addClass("hot_1_1_1_2");
	$(".hot_1_1_1 span:eq(2)").addClass("hot_1_1_1_3");
	$(".hot_1_1_1 span:eq(3)").addClass("hot_1_1_1_4");
	$("#hot1 td").mousemove(function(){
		$(this).addClass("hot_1_1_2_7");
	});
	$("#hot1 td").mouseout(function(){
		$(this).removeClass("hot_1_1_2_7");
	});
	$("#hot2 td").mousemove(function(){
		$(this).addClass("hot_1_1_2_7");
	});
	$("#hot2 td").mouseout(function(){
		$(this).removeClass("hot_1_1_2_7");
	});
	$(".hot_1_2_1 span:eq(0)").addClass("hot_1_2_1_1");
	$(".hot_1_2_1 span:eq(1)").addClass("hot_1_2_1_2");
	$(".hot_1_2_1 span:eq(2)").addClass("hot_1_2_1_2");
	$(".hot_1_2_1 span:eq(3)").addClass("hot_1_2_1_2");
	$(".hot_1_2_1 span:eq(4)").addClass("hot_1_2_1_3");
	$(".hot_1_2_1 span:eq(5)").addClass("hot_1_2_1_4");

});



