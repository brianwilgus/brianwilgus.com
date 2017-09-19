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

function Validate()
	{
	
		if(document.form1.first_name.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your First Name');
			document.form1.first_name.select();
			return false
		}

		if(document.form1.last_name.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your Last Name');
			document.form1.last_name.select();
			return false
		}
		
		if(document.form1.address.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your Address');
			document.form1.address.select();
			return false
		}
		
		if(document.form1.city.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your City');
			document.form1.city.select();
			return false
		}

		if(document.form1.state.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your State');
			document.form1.state.focus();
			return false
		}
		
		if(document.form1.zip.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your Zip Code');
			document.form1.zip.select();
			return false
		}
		if(document.form1.country.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter the Country');
			document.form1.country.select();
			return false
		}
		
		if(document.form1.email.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your E-mail address');
			document.form1.email.select();
			return false;
		}
		else
		{
			if(!checkEmail(document.form1.email))
			{
				alert('Please enter a valid email address.');
				document.form1.email.select();
				return false;
			}
		}
		
		if(document.form1.phone.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
		{
			alert('Please enter your Phone Number');
			document.form1.phone.select();
			return false;
		}
		else
		{
			if(!isPhone(document.form1.phone.value))
			{
				alert('Please enter a valid Phone Number including area code.');
				document.form1.phone.select();
				return false;
			}
		}
		
		if(document.form1.phone2.value.replace(/^\s*/, '').replace(/\s*$/, '') != "")
		{
		if(!isPhone(document.form1.phone2.value))
			{
				alert('Please enter a valid Phone Number including area code.');
				document.form1.phone2.select();
				return false;
			}
		}
		
		if(document.form1.reagent[1].selected == true)
		{
			if(document.form1.agent_name.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
			{
				alert('Please enter the Agent Name');
				document.form1.agent_name.focus();
				return false;
			}
			if(document.form1.agent_company.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
			{
				alert('Please enter the Agent Company');
				document.form1.agent_company.focus();
				return false;
			}
			if(document.form1.agent_city.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
			{
				alert('Please enter the Agent City');
				document.form1.agent_city.focus();
				return false;
			}
			
			if(document.form1.agent_phone.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
			{
				alert('Please enter the Agent Phone Number');
				document.form1.agent_phone.select();
				return false;
			}
			else
			{
				if(!isPhone(document.form1.agent_phone.value))
				{
					alert('Please enter a valid Agent Phone Number including area code.');
					document.form1.agent_phone.select();
					return false;
				}
			}
			if(document.form1.agent_email.value.replace(/^\s*/, '').replace(/\s*$/, '') == "")
			{
				alert('Please enter the Agent E-mail address');
				document.form1.agent_email.select();
				return false;
			}
			else
			{
				if(!checkEmail(document.form1.agent_email))
				{
					alert('Please enter a valid email address.');
					document.form1.agent_email.select();
					return false;
				}
			}
		}
		
		if(document.form1.how_found[0].checked == false && document.form1.how_found[1].checked == false && document.form1.how_found[2].checked == false && document.form1.how_found[3].checked == false && document.form1.how_found[4].checked == false)
			{
				alert('Please indicate how did you find out about us');
				return false
			}
		if(document.form1.how_found[4].checked == true && (document.form1.how_found_other.value.replace(/^\s*/, '').replace(/\s*$/, '') == "Please Specify" || document.form1.how_found_other.value.replace(/^\s*/, '').replace(/\s*$/, '') == ""))
			{
				alert('Please indicate how did you find out about us');
				return false
			}
		
		return true
	}

function changeRealtor()
	{
		if(document.form1.reagent[1].selected == true)
			{
				document.all['reaName'].innerHTML = '<span class="required">*</span>';
				document.all['reaCompany'].innerHTML = '<span class="required">*</span>';
				document.all['reaCity'].innerHTML = '<span class="required">*</span>';
				document.all['reaPhone'].innerHTML = '<span class="required">*</span>';
				document.all['reaEmail'].innerHTML = '<span class="required">*</span>'
			}
		else
			{
				document.all['reaName'].innerHTML = '';
				document.all['reaCompany'].innerHTML = '';
				document.all['reaCity'].innerHTML = '';
				document.all['reaPhone'].innerHTML = '';
				document.all['reaEmail'].innerHTML = ''
			}
			
	}