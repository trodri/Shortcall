<html>
<head>
<title>Index</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("a#callout").click(function() {
			var jsonObj =[{"searchcriteria":{"calllist":[{"list":"ASHWINI CALLLIST"}],"calllisttype":"Call List","teams":[],"employeelabel":[],"jobs":[],"associatedjobs":"Y","skills":[],"empstatus":[{"status":""}],"availablity":"Y","schedule":"","sortorder":"ALPHABETICAL","calcgroup":[],"shiftbasedavailability":"Y","filtershifttype":[],"filterdayparts":[{"dayParts":""}]},"selectedshifts":{"shifts":[{"selectedShfitIds":"46928758"},{"selectedShfitIds":"46928759"}],"processingalgorithm":"broadcast","processingthreadid":-1},"employeepool":{"employees":[{"order":1,"empId":51332,"firstName":" Rohan","lastName":"Khan"},{"order":2,"empId":51342,"firstName":" Mary","lastName":"Linda"},{"order":3,"empId":51312,"firstName":" Ashwini","lastName":"Matti"},{"order":4,"empId":51346,"firstName":" Nageshwar","lastName":"P"},{"order":5,"empId":51343,"firstName":" Akthar","lastName":"Pasha"},{"order":6,"empId":51322,"firstName":" Anusha","lastName":"Rao"},{"order":7,"empId":51323,"firstName":" Vinutha","lastName":"Ravi"},{"order":8,"empId":51314,"firstName":" QA","lastName":"Test"},{"order":9,"empId":51347,"firstName":" Sangamesh","lastName":"Vastrad"},{"order":10,"empId":51344,"firstName":" Rekha","lastName":"Vinoth"}]},"user":{"userid":"3"}}];
			sendJsonToShoarCall(jsonObj);
		});
	});

	function sendJsonToShoarCall(jsonObj) {
		var jsondata = JSON.stringify(jsonObj);
		$.ajax({
			type : "POST",
			url : "http://localhost:7001/callout/rest/shortcall/save",
			data : jsondata,
			dataType : "json",
			success : function(data) {
				alert(data);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("jqXHR - " + jqXHR.statusText + "\n" + "textStatus - "
						+ textStatus + "\n" + "errorThrown - " + errorThrown);
			}
		});

	}
</script>
</head>
<body>
	<h1>Home</h1>
	<a href="#" id="callout">Invoke Rest</a>
</body>
</html>