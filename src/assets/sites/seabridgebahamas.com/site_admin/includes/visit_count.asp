<%
Dim fsoObject
Dim tsObject
Dim filObject
Dim intSovereign


Set fsoObject = Server.CreateObject("Scripting.FileSystemObject")

'Path to text file
Set filObject = fsoObject.GetFile(Server.MapPath("/visit_counter/splitsky.txt"))
	
'Open the text file
Set tsObject = filObject.OpenAsTextStream
	
'Read in the visitor number from the visitor counter file
intSovereign = CLng(tsObject.ReadAll)

intTotal = intSovereign
%>