$("form").submit(function(e){
	e.preventDefault(e);
	check_apply_dates($("#field-apply_start").val(),$("#field-apply_end").val());
});

function check_apply_dates(datefrom, dateto){
	if(datefrom!=""){
		if (dateto==""){ //with start date but no dateto
			alert('You have set the Apply start date but without end date!');
			$("#field-apply_end").focus();
			cancelFormSubmission();
		}else if(dateto < datefrom){ // dateto > date from
			alert('Please Select the apply end date before the apply start date!');
			$("#field-apply_end").focus();
			cancelFormSubmission();
		}
	}else if(dateto!=""){ //not start date but dateto
		cancelFormSubmission();
	}
};

//$("#new_modal").load('http://localhost/mim/application/modules/admin/views/class_schedule.php #class_schedulex');

$(document).ready(function () {
	update_schedule_display();
	$("#btn_schedule").click(function(){
		$("#offer-name").text($("#field-name_c").val());
		update_modal_schedule_display();
	});

	$("#save_schedule").click(function(){
		save_modal_schedule();
		update_schedule_display();
	});

});

function save_modal_schedule(){
	$selected_schedule=[];
	$("input.schedule_week:checkbox:checked").each(function(){
		$selected_schedule.push({
			"week":$(this).val(),
			"room_id":$("#schedule_room_"+$(this).val()).val(),
			"room_num":$("#schedule_room_"+$(this).val()+" option:selected").attr("tag"),
			"start":$("#schedule_start_"+$(this).val()).val(),
			"hours":$("#schedule_hours_"+$(this).val()).val()
		});
	});
	$("#field-schedule").val(
		JSON.stringify($selected_schedule)
	);
}

function update_modal_schedule_display(){
	$scheduled=jQuery.parseJSON($("#field-schedule").val());
	$.each($scheduled, function(key,value){
		$("#schedule_week_"+value['week']).attr("checked",true);
		$("#schedule_room_"+value['week']+" option[value="+value["room_id"]+"]").attr("selected",true);
		$("#schedule_start_"+value['week']).val(value['start']);
		$("#schedule_hours_"+value['week']).val(value['hours']);
	});
	$("#modal_schedule").modal("show");
}

function update_schedule_display(){
    var weekday=new Array("","Monday","Tuesday","Wednesday","Thursday",
                "Friday","Saturday","Sunday");
	$scheduled=jQuery.parseJSON($("#field-schedule").val());
	$("#schedule_display").empty();
	$.each($scheduled, function(key,value){
		$("#schedule_display").append(
			weekday[value['week']]+
			' in room ' +value['room_num'] +
			' at ' + value['start'] +
			' for ' + value['hours'] + " hours"+
			'<br>'
			);
	});

}
