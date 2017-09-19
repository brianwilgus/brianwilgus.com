<%
'Dimension variables
Dim fsoObject 				'File System Object
Dim tsObject 				'Text Stream Object
Dim filObject				'File Object
Dim lngVisitorNumber 		'Holds the visitor number
Dim intWriteDigitLoopCount 	'Loop counter to display the graphical hit count
		
	'Create a File System Object variable
	Set fsoObject = Server.CreateObject("Scripting.FileSystemObject")
	
	'Initialise a File Object with the path and name of text file to open
	Set filObject = fsoObject.GetFile(Server.MapPath("visit_counter/splitsky.txt"))
		
	'Open the visitor counter text file
	Set tsObject = filObject.OpenAsTextStream
		
	'Read in the visitor number from the visitor counter file
	lngVisitorNumber = CLng(tsObject.ReadAll)
		
	'Increment the visitor counter number by 1
	lngVisitorNumber = lngVisitorNumber + 1
				
	'Create a new visitor counter text file over writing the previous one
	Set tsObject = fsoObject.CreateTextFile(Server.MapPath("visit_counter/splitsky.txt"))
		
	'Write the new visitor number to the text file
	tsObject.Write CStr(lngVisitorNumber)
		
	'Reset server objects
	Set fsoObject = Nothing
	Set tsObject = Nothing
	Set filObject = Nothing

%>