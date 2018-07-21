
$(document).ready(function(){
		$("#teacher_id_input_box").append("<a href='teachers' target='_blank'><button type='button'>...</button></a>");
});






var weekday=new Array("","Monday","Tuesday","Wednesday","Thursday",
                "Friday","Saturday","Sunday");
$scheduled=[];


//$("#new_modal").load('http://localhost/mim/application/modules/admin/views/class_schedule.php #class_schedulex');

update_schedule_display();

//click schedule button for classroom scheduleing
$("#btn_schedule").click(function(){
	$("#offer-name").text($("#field-name_c").val());
	$scheduled=jQuery.parseJSON($("#field-schedule").val());
	update_modal_schedule_display();

});

//click the save schedule button on schedule modal
$("#save_schedule").click(function(){
	save_modal_schedule();
	update_schedule_display();
});

//add new item of classroom schedule.
$("#add_schedule").click(function(){

	error_msg="";
	if($("#schedule_room").val()==null)
		error_msg="Room number not selected;\n";
	if($("#schedule_start").val()=="")
		error_msg+="Start time can not be empty;\n";
	if($("#schedule_hours").val()<=0.5 || $("#schedule_hours").val()%0.5>0)
		error_msg+="Hours must be greater than 0 (0.5 hour increments)\n";
	if(error_msg!=""){
		alert(error_msg);
		return false;
	}
	if($scheduled==undefined){
		$scheduled=[];
	}
	$scheduled.push({
		week: $("#schedule_week").val(),
		room_id: $("#schedule_room").val(),
		room_num: $("#schedule_room option:selected").attr("tag"),
		start: $("#schedule_start").val(),
		hours: $("#schedule_hours").val()
	});
	update_modal_schedule_display($scheduled);
});
1

function save_modal_schedule(){
	$("#field-schedule").val(JSON.stringify($scheduled));
	update_schedule_display();
	$("#modal_schedule").modal("hide");
};

//update the schedule display on Model, which is retrieve from field-schedule.
function update_modal_schedule_display(){
	$("#schedule_plan").empty();
	$.each($scheduled, function(key,value){
		$("#schedule_plan").append(
			"<p>"+
			weekday[value["week"]]+" in room "+
			value["room_num"]+ " at "+
			value["start"]+" for "+
			value["hours"]+ " hours"+
			"</p>"
		);
	});
	$("#modal_schedule").modal("show");
};

//retrieve from field-schedule and show as readable text on #schedule_display div.
function update_schedule_display(){
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

};

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


$("form").submit(function(e){
	e.preventDefault(e);
	check_apply_dates($("#field-apply_start").val(),$("#field-apply_end").val());
});

