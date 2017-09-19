// JavaScript Document

function checkEmail(obj) {
	if (obj.value == null || obj.value == "") { 
		return true; 
  	} 
	var em = obj.value
	var re = new RegExp();
	re = /.+@.+\..+/
	if (em != "") 
	{
		if (!(re.test(em))) 
		{
			return false;
		}
		return true;
	}
}

function isPhone(strPhone) {
	// Pattern matches 9999999999, 999-999-9999, (999)-999-9999, (999) 999-9999, (999)999-9999
	var regexp = /^(\d{10}|\d{3}-\d{3}-\d{4}|(\((\d{3})\)|(\d{3}))[- ]?)?(\d{3})[- ]?(\d{4})$/;
	// The exec() method returns an array of matched substrings:
	if (regexp.exec(strPhone)) {
		// At least one of $3 or $4 will be null:
		//var match = RegExp.$3 + RegExp.$4 + RegExp.$5 + RegExp.$6;
		//window.document.simpleForm.phone.value = match;
		return true;
	}
	return false;
}

function Validate(){
	if(document.registration.firm.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
	{
		alert('Please enter your Broker Firm');
		document.registration.firm.select();
		return false
	}

	if(document.registration.name.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
	{
		alert('Please enter your Broker Name');
		document.registration.name.select();
		return false
	}
	
	if(document.registration.phone.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
	{
		alert('Please enter your Phone Number');
		document.registration.phone.select();
		return false;
	}
	else
	{
		if(!isPhone(document.registration.phone.value))
		{
			alert('Please enter a valid Phone Number including area code.');
			document.registration.phone.select();
			return false;
		}
	}
	
	if(document.registration.email.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
	{
		alert('Please enter your E-mail address');
		document.registration.email.select();
		return false;
	}
	else
	{
		if(!checkEmail(document.registration.email))
		{
			alert('Please enter a valid email address.');
			document.registration.email.select();
			return false;
		}
	}
	if(document.registration.cname.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
	{
		alert('Please enter your Client\'s Name');
		document.registration.cname.select();
		return false;
	}
	
	return true
}