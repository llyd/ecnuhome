<%
Dim database,conn,connstr
Response.Buffer=True
database = "notes.mdb"
Set conn=server.createobject("ADODB.Connection")
connstr="provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(database)
conn.Open connstr

Set WBrs = Server.CreateObject("ADODB.RecordSet")
WBrs.Open "Select * from web",conn,1,3
sitename = WBrs("SiteName")
maxlength = WBrs("MaxLength")
mail = WBrs("Mail")
distance = WBrs("Distance")
counts = WBrs("Counts")
subjectmaxlength = WBrs("SubjectMaxLength")
WBrs.Close
Set WBrs = nothing
%>