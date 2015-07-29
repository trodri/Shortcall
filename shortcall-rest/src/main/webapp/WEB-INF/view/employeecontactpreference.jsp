<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.formBorder {
	border: 1px solid black;
	border-collapse: collapse;
	width: 50%;
	height: auto;
}

}
.tableDesign {
	padding-top: 80px;
	padding-left: 10px;
}

.deleteImg {
	font-weight:bold;
	font-size:12px;
	padding: 20px;
	display: inline;
}

.row {
	font-weight:bold;
	font-size:12px;
}

.row div {
	float: left;
}

.textFormat{
	font-weight:bold;
	font-size:12px;
	white-space: nowrap;
	width: 300px;
}

.buttonStyle{
	font-weight:bold;
	font-size:12px;
	padding-left: 12px;
	display: inline;
	padding-top:20px;
}

.daysStyle{
padding-left: 20px; 
float: right;
}

.empStyle{
padding-left: 30px; 
display: inline;
}

.option{
padding-left: 20px; 
float: left;
}

.buttonText{
width:45px;
font-size:10px;
}

.others{
disabled :false;
}

.phone{
disabled :false;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<!-- <script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script> -->
<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
<link href="/style/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<body>

<script>
  $(document).ready(function(){
  
   $("#phoneDaysToggle").click(function () {
        if ($("#phoneDaysToggle").is(':checked')) {
            $("input[name=phoneDays]").prop("checked", true);
           $("input[name=phoneDays]").attr("disabled" , "disabled");
        } else {
            $("input[name=phoneDays]").prop("checked", false);
             $("input[name=phoneDays]").attr("disabled" , false);
        }
    });
    
    $("#smsDaysToggle").click(function () {
        if ($("#smsDaysToggle").is(':checked')) {
            $("input[name=smsDays]").prop("checked", true);
             $("input[name=smsDays]").attr("disabled" , "disabled");
        } else {
            $("input[name=smsDays]").prop("checked", false);
              $("input[name=smsDays]").attr("disabled" , false);
        }
    });
    
    $("#emailDaysToggle").click(function () {
        if ($("#emailDaysToggle").is(':checked')) {
            $("input[name=emailDays]").prop("checked", true);
             $("input[name=emailDays]").attr("disabled" , "disabled");
        } else {
            $("input[name=emailDays]").prop("checked", false);
              $("input[name=emailDays]").attr("disabled" , false);
        }
    });
  
});  

function disableRest(){
if($('#checkboxs').prop('checked')){
$("input.others").prop("disabled", true);
 $(".phone").attr("disabled" , "disabled");
 }
 else{
$("input.others").prop("disabled", false);
 $(".phone").attr("disabled" , false);
}
}



function savePreference(){

var dontContact = $('#checkboxs').prop('checked');
/* var preferenceSelection = $("[name=preferenceSelection]:checked").length;
 */
 var calloutEnabled = dontContact;
 var preferenceSelection = 2;
if((!dontContact) && (preferenceSelection <= 0)){
alert("Please select your preference");
}else{
var preference = '';
var allPreference = [];

var phone = $('input[name="phonePreference"]:checked').val();
if(typeof phone === 'undefined'){
phone = '';
}
var sms = $('input[name="smsPreference"]:checked').val();
if(typeof sms === 'undefined'){
sms = '';
}
var email = $('input[name="emailPreference"]:checked').val();
if(typeof email === 'undefined'){
email = '';
}

var phoneDays = "";
$('input[name=phoneDays]').each(function () {
    phoneDays += (this.checked ? 1 : 0);
});
var smsDays = "";
$('input[name=smsDays]').each(function () {
    smsDays += (this.checked ? 1 : 0);
});

var emailDays = "";
$('input[name=emailDays]').each(function () {
    emailDays += (this.checked ? 1 : 0);
});


var empContactPrefeffstartdate = $("#empContactPrefeffstartdate").val();
var empContactPrefeffenddate = $("#empContactPrefeffenddate").val();
var phoneNumber = $("#phoneNumber").val();
var phoneStartTime = $("#phoneStartTime").val();
var phoneEndTime = $("#phoneEndTime").val();
var smsNumber = $("#smsNumber").val();
var smsStartTime = $("#smsStartTime").val();
var smsEndTime = $("#smsEndTime").val();
var emailId = $("#emailId").val();
var emailStartTime = $("#emailStartTime").val();
var emailEndTime = $("#emailEndTime").val();
var comments = $("#comments").val();
               	   $.ajax({
                   url: "saveEmpContactPreference",
                   method: "POST",
                   data: {
                   phone:phone,
                   sms:sms,
                   email:email,
                   empContactPrefeffstartdate:empContactPrefeffstartdate,
                   empContactPrefeffenddate:empContactPrefeffenddate,
                   allPreference:allPreference,
                   phoneNumber:phoneNumber,
                   phoneStartTime: phoneStartTime,
                   phoneEndTime: phoneEndTime,
                   smsNumber:smsNumber,
                   smsStartTime:smsStartTime,
                   smsEndTime:smsEndTime,
                   emailId:emailId,
                   emailStartTime:emailStartTime,
                   emailEndTime:emailEndTime,
                   phoneDays:phoneDays,
                   smsDays:smsDays,
                   emailDays:emailDays,
                   comments:comments,
                   calloutEnabled:calloutEnabled,
                   },
                   success: function (data) {
                   
        },
                   error: function (data) {
                   
                   }
               });    

}
}
</script>


	<div class="formBorder">
		<div class="buttonStyle">
			<button class="buttonText" onclick="savePreference()" type="button">Submit</button>
		</div>
		<div class="buttonStyle">
			<button class="buttonText" type="button">Cancel</button>
		</div>
		<h4 style="text-align: center;">
			Short Call Employee Contact Preference
			</h2>
			<div>
				<div class="empStyle">
				<select id="employee">
				<option>Select</option>
  <option value="1234">Ashwini Matti</option>
  <option value="4567">Rohit Shetty</option>
</select>
				
					<input id="empName" type="text" value="" />
				</div>
				<div class="deleteImg">Delete</div>
			</div>
<form:form commandName="empContactPreference" id="empPreference"  method="POST">
			<table class="tableDesign">
			
			
			<tr>
					<td></td>
					<td class="option">
						<div class="row">
							<div>From</div>
							<div>
							<input data-format="dd/MM/yyyy"  type="text" id="empContactPrefeffstartdate"/>
							</div>
							<div>to</div>
							<div>
							<input data-format="dd/MM/yyyy"  type="text" id="empContactPrefeffenddate"/>
							</div>
						</div>
					</td>

				</tr>
			
			
			<!-- <tr>
			<td><div class="input-append date"><input data-format="dd/MM/yyyy"  type="text" id="empContactPrefeffstartdate"/>
			<span class="input-group-addon"><span class="add-on glyphicon glyphicon-calendar"></span></span>
			
			</div></td>
			<td><div class="input-append date"><input data-format="dd/MM/yyyy"  type="text" id="empContactPrefeffenddate"/>
			<span class="input-group-addon"><span class="add-on glyphicon glyphicon-calendar"></span></span>
			
			</div></td>
			</tr> -->
			
			
				<tr>
					<td><input id="checkboxs" onclick="disableRest()"  type="checkbox"  /></td>
					<td class="textFormat">Do not contact me for short
						call shifts</td>
				</tr>

				<tr>
					<td>
					<input type="checkbox" name="phonePreference" class="others"  value="phone"/>
					<td class="textFormat">Conatact me
						using phone at 
						<input name="phoneNumber" id="phoneNumber" class="phone" style="width: 380px"/>
					</td>

				</tr>
				
				

				<tr>
					<td></td>
					<td class="option">
						<div class="row">
							<div>Between</div>
							<div>
							<input name="phoneStartTime" id="phoneStartTime" class="phone" />
							</div>
							<div>and</div>
							<div>
							<input name="phoneEndTime" id="phoneEndTime"  class="phone" />
							</div>
						</div>
					</td>

				</tr>

				<tr>
					<td></td>
					<td class="daysStyle"><div class="row">
					<div>
								<input class="others"  type="checkbox"  id="phoneDaysToggle" value="all" />
							</div>
							<div>On</div>
							<div>
								<input class="others"  type="checkbox" name="phoneDays" value="sunday" />
							</div>
							<div>Sunday</div>
						 <div>
						 <input class="others" name="phoneDays" type="checkbox" value="monday" />
							</div>
							<div>Monday</div>
							<div>
							<input class="others" name="phoneDays" type="checkbox" value="tuesday" />
							</div>
							<div>Tuesday</div>
							<div>
							<input class="others" name="phoneDays" type="checkbox" value="wednesday" />
							</div>
							<div>Wednesday</div>
							<div>
							<input class="others" name="phoneDays" type="checkbox" value="thursday" />
							</div>
							<div>Thursday</div>
							<div>
							<input class="others" name="phoneDays" type="checkbox" value="friday" />
							</div>
							<div>Friday</div>
							<div>
							<input class="others" name="phoneDays" type="checkbox" value="saturday" />
							</div>
							<div>Saturday</div>
						</div></td>
				</tr>


				<tr>
					<td><input type="checkbox" name="smsPreference" class="others"  value="sms"/></td>
					<td class="textFormat">Conatact me using SMS at
					<input name="smsNumber" id="smsNumber" class="phone" style="width: 380px"/> 
				</tr>
				
				


				<tr>
					<td></td>
					<td class="option">
						<div class="row">
							<div>Between</div>
							<div>
								<input class="phone" name="smsStartTime" id="smsStartTime"  type="text" />
							</div>
							<div>and</div>
							<div>
								<input class="phone" name="smsEndTime" id="smsEndTime" type="text" />
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td></td>
					<td class="daysStyle"><div class="row">
					<div>
								<input class="others" id="smsDaysToggle"  type="checkbox" value="sunday" />
							</div>
							<div>On</div>
							<div>
								<input class="others" name="smsDays" type="checkbox" value="sunday" />
							</div>
							<div>Sunday</div>
						 <div>
						 <input class="others" name="smsDays" type="checkbox" value="monday" />
							</div>
							<div>Monday</div>
							<div>
							<input class="others" name="smsDays" type="checkbox" value="tuesday" />
							</div>
							<div>Tuesday</div>
							<div>
							<input class="others" name="smsDays" type="checkbox" value="wednesday" />
							</div>
							<div>Wednesday</div>
							<div>
							<input class="others" name="smsDays" type="checkbox" value="thursday" />
							</div>
							<div>Thursday</div>
							<div>
							<input class="others" name="smsDays" type="checkbox" value="friday" />
							</div>
							<div>Friday</div>
							<div>
							<input class="others" name="smsDays" type="checkbox" value="saturday" />
							</div>
							<div>Saturday</div>
						</div></td>
				</tr>


				<tr>
					<td><input type="checkbox" name="emailPreference" class="others"  value="email"/></td>
					<td class="textFormat">Conatact me using Email at
					<input name="emailId" id="emailId" class="phone" style="width: 380px"/> 
				</tr>

				
				
				<tr>
					<td></td>
					<td class="option">
						<div class="row">
							<div>Between</div>
							<div>
								<input class="phone" name="emailStartTime" id="emailStartTime" type="text" />
							</div>
							<div>and</div>
							<div>
								<input class="phone" name="emailEndTime" id="emailEndTime" type="text" />
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td></td>
					<td class="daysStyle"><div class="row">
					<div>
								<input class="others" id="emailDaysToggle"   type="checkbox" value="sunday" />
							</div>
							<div>On</div>
							<div>
								<input class="others" name="emailDays"  type="checkbox" value="sunday" />
							</div>
							<div>Sunday</div>
						 <div>
						 <input class="others" name="emailDays" type="checkbox" value="monday" />
							</div>
							<div>Monday</div>
							<div>
							<input class="others" name="emailDays" type="checkbox" value="tuesday" />
							</div>
							<div>Tuesday</div>
							<div>
							<input class="others" name="emailDays" type="checkbox" value="wednesday" />
							</div>
							<div>Wednesday</div>
							<div>
							<input class="others" name="emailDays" type="checkbox" value="thursday" />
							</div>
							<div>Thursday</div>
							<div>
							<input class="others" name="emailDays" type="checkbox" value="friday" />
							</div>
							<div>Friday</div>
							<div>
							<input class="others" name="emailDays" type="checkbox" value="saturday" />
							</div>
							<div>Saturday</div>
						</div></td>
				</tr>
					<tr>
						<td></td>
						<td class="daysStyle"><div class="row">
								<div>
									Comments
									<textarea class="phone" name="comments" id="comments"></textarea>
								</div>
							</div></td>
					</tr>

<tr>
						<td></td>
						<td class="daysStyle"><div class="row">
								<div>
									Last updated by ${updatedBy}
								</div>
							</div></td>
					</tr>
				</table>
				
				
				
				<div></div>
			<table id="futureTable">
  <tr>
    <th class="futureHeader">From</th>
    <th class="futureHeader">To</th>
    <th class="futureHeader">Preference</th>
	<th class="futureHeader">Start Time</th>
	<th class="futureHeader">End Time</th>
	<th class="futureHeader">Days</th>
	<th class="futureHeader">Contact</th>
  </tr>
<c:forEach items="${empContactPreferenceDetails}" var="details">
  <tr>
    <td class="futureRows">${fromDate}</td>
    <td class="futureRows">${toDate}</td>
    <td class="futureRows">${details.contactType}</td>
	<td class="futureRows">${details.startTime}</td>
    <td class="futureRows">${details.endTime}</td>
    <td class="futureRows">${details.days}</td>
	<td class="futureRows">${details.contactDetails}</td>
  </tr>
  	</c:forEach>
 
</table>
				
				
			</form:form>
	</div>
</body>
</html>
