<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�Ž��������ղ�ѯ���</title>
</head>

<body>
<%
dim connabc,objstr,objrs,sql,tiaojian,sel
tiaojian=request("tiaojian")
sel=request("sel")
set connabc=server.CreateObject("ADODB.connection")
connabc.open "provider=Microsoft.jet.oledb.4.0;"&"data source="& server.MapPath("yin.mdb")
set objrs=server.createobject("ADODB.recordset")
select case sel
case 1
sql="select * from ���� where ƴ��='"&tiaojian&"'"
case 2
sql="select * from ���� where ���� like '%"& tiaojian &"%'"
case 3
sql="select * from ���� where ���� like '%"& tiaojian &"%'"
end select
objrs.open sql,connabc,1,3
%>
<%
if objrs.EOF then
   response.write "<p align=center><font color=red>û�в鵽��Ӧ������</font></p>"
else
%>
<table border=3 bordercolor=blue align=center><tr>
<%
for i=0 to objrs.fields.count-1
response.write"<th>"&objrs.fields(i).name&"</th>"
next
%>
</tr>
<%
do while not objrs.eof
data="<tr>"
for i=0 to objrs.fields.count-1
data=data&"<td>"&objrs.fields(i).value&"</td>"
next
response.write data&"</tr>"
objrs.MoveNext
   Loop
objrs.close 
Set objrs = Nothing
connabc.close 
set connabc=Nothing
end if
%>
</table>
<p align=center><a href=cha.htm>���²�ѯ</a></p>
<p align=center><a href=cha2.htm>�߼���ѯ</a></p></body>
</html>
