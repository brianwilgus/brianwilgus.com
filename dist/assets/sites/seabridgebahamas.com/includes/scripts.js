// JavaScript Document


var currID = 'txtArea0'; 
function divSwitch(navID) {
	var isDiv = ["txtArea0", "txtArea1", "txtArea2", "txtArea3"];
	for (var i = 0; i < isDiv.length; i++) {
		if ($ != currID) {
		$(currID).style.display = 'none'; 	// set the style of the current div to none
		$(navID).style.display = 'block'; 	// set the style of the div with the ID passed to Block
		currID = navID; 					// set the ID that was passed to be the current ID
		}
	
	}
}
var currTxt = 'txtLink0'; 
function txtSwitch(txtID) {
	var isDiv = ["txtLink0", "txtLink1", "txtLink2", "txtLink3"];
	for (var i = 0; i < isDiv.length; i++) {
		if ($ != currID) {
		$(currTxt).style.color = '#3f371b'; 	
		$(currTxt).style.textDecoration = 'none';
		$(txtID).style.color = '#b6af79';
		$(txtID).style.textDecoration = 'underline'; 	
		currTxt = txtID; 				
		}
	
	}
}

/* function setVisibility() {	
	if(document.forms[0].country.value == "US")
	{
		document.getElementById("state_info").style.display = "block";
		document.getElementById("state_title").style.display = "block";
		document.getElementById("province_info").style.display = "none";
		document.getElementById("province_title").style.display = "none";
	}
	else
	{ 
		document.getElementById("state_info").style.display = "none";
		document.getElementById("state_title").style.display = "none";
		document.getElementById("province_info").style.display = "block";
		document.getElementById("province_title").style.display = "block";
	}
}
*/

function setState() {	
	if(document.forms[0].country.value == "US")
	{
		$("state_info").style.display = "block";
		$("state_title").style.display = "block";
		$("province_info").style.display = "none";
		$("province_title").style.display = "none";
	}
	else
	{ 
		$("state_info").style.display = "none";
		$("state_title").style.display = "none";
		$("province_info").style.display = "block";
		$("province_title").style.display = "block";
	}
}

function setCheck() {	
	if(document.form1.amenities[4].checked == true)
	{
		document.getElementById('otherDetail').style.display = 'block';
	}
	else
	{ 
		document.getElementById('otherDetail').value = '';
		document.getElementById('otherDetail').style.display = 'none';
	}
}
	
/*  Old stuf

var currID = 'txtArea0'; 
function divSwitch(navID) {
	var isDiv = new Array(divID);
	for (var i=0; i< divID.length; i++) {
		isDiv[i] = "txtArea"+i;
		alert(txtArea[i]);
		} 
	
	var isDiv = ["txtArea0", "txtArea1", "txtArea2", "txtArea3"];
	for (var i = 0; i < isDiv.length; i++) {
		if ($ != currID) {
		$(currID).style.display = 'none'; 
		$(navID).style.display = 'block'; 
		currID = navID; 
		}
	
	}
}
*/


