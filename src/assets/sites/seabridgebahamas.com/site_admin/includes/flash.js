// JavaScript Document

// ***** ATTENTION *****
// This code is copyrighted to Reason Labs, LLC and cannot be duplicated. All Rights Reserved.

function runChart(strXML)
{
	document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="350" height="230" id="Pie3D" >');
	document.write('<param name="movie" value="../charts/Pie3D.swf" />');
	document.write('<param name="FlashVars" value="&dataXML=' + strXML + '">');
	document.write('<param name="quality" value="high" />');
	document.write('<embed src="../charts/Pie3D.swf" flashVars="&dataXML=' + strXML + '" quality="high" width="350" height="230" name="Pie3D" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
	document.write('</object>');
}