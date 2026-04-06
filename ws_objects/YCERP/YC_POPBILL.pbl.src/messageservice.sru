$PBExportHeader$messageservice.sru
forward
global type messageservice from baseservice
end type
end forward

global type messageservice from baseservice
end type
global messageservice messageservice

forward prototypes
public function decimal getunitcost (string corpnum, string msgtype) throws popbillexception

private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception
private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string reqeustnum, string userid) throws popbillexception

// adsYN 미포함.
public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendsms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, string userid) throws popbillexception

public function string sendlms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendlms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, string userid) throws popbillexception

public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendxms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception
public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, string userid) throws popbillexception

public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, string userid) throws popbillexception
public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, string userid) throws popbillexception
public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, string userid) throws popbillexception


// adsYN 추가.
public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendsms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendsms (string corpnum, string sender, string sendername, string receiver, string receivername, string content, string reservedt, boolean adsyn, string userid) throws popbillexception


public function string sendlms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendlms (string corpnum, mmessage messages[], string reservedt,  boolean adsyn, string userid) throws popbillexception
public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendlms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception


public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendxms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendxms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception


public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception
public function string sendmms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception


// reqeustNum 포함
public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendsms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendsms (string corpnum, string sender, string senderName, string receiver, string receivername, string content, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception

public function string sendlms (string corpnum, string sender,  string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendlms (string corpnum, mmessage messages[], string reservedt,  boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn,  string requestnum, string userid) throws popbillexception
public function string sendlms (string corpnum, string sender, string senderName, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn,  string requestnum, string userid) throws popbillexception

public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception
public function string sendxms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception
public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception
public function string sendxms (string corpnum, string sender, string senderName, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception

public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception
public function string sendmms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception



// 요청번호 미할당
public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception	// cancelreserve overload
public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception
public subroutine getmessageresult (string corpnum, string receiptnum, ref messageresult ref_result[]) throws popbillexception

// 요청번호 할당(requestnum)
public function response cancelreservern (string corpnum, string requestnum) throws  popbillexception
public function response cancelreservern (string corpnum, string requestnum, string userid) throws  popbillexception
public subroutine getmessageresultrn (string corpnum, string requestnum, ref messageresult ref_result[]) throws popbillexception


public function string geturl (string corpnum, string togo) throws popbillexception // geturl overload 
public function string geturl (string corpnum, string userid, string togo) throws popbillexception
public function string getSenderNumberMgtURL (string corpnum, string userid) throws popbillexception
public function string getSentListURL (string corpnum, string userid) throws popbillexception
public function msgsearchresult search (string corpnum, string sdate, string edate, string state[], string item[], boolean reserveyn, boolean senderyn, string order, int page, int perpage) throws popbillexception
public function msgsearchresult search (string corpnum, string sdate, string edate, string state[], string item[], boolean reserveyn, boolean senderyn, string order, int page, int perpage, string qstring) throws popbillexception
public function msgsearchresult tomsgsearchresult (ref oleobject dic)
public subroutine getautodenylist (string corpnum, ref autodeny ref_list[]) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string msgtype) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string msgtype, string userid) throws popbillexception
public subroutine getsendernumberlist (string corpnum, ref sendernumber ref_list[]) throws popbillexception
public subroutine getstates(string corpnum, ref string reciptnumlist[], ref messagebriefinfo ref_returnlist[])  throws popbillexception
public function messagebriefinfo tomessagebriefinfo(ref oleobject dic)

end prototypes

public function decimal getunitcost (string corpnum, string msgtype) throws popbillexception;decimal unitcost
oleObject result

if (msgType = "SMS" or msgType = "LMS" or msgType = "XMS" or msgType = "MMS" )  = false then throw exception.setCodeNMessage(-99999999,"메시지 유형이 올바르게 입력되지 않았습니다.")

result = httpget("/Message/UnitCost?Type=" + msgType , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception;
	return sendmessage(msgtype,  corpnum,  sender,  subject,  content,  messages[],  reservedt, false, "", userid)
end function

private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
	return sendmessage(msgtype,  corpnum,  sender,  subject,  content,  messages[],  reservedt,  adsyn,  "",  userid)
end function

private function string sendmessage (string msgtype, string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;oleobject dic
string receiptNum,postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (msgType = "SMS" or msgType = "LMS" or msgType = "XMS" or msgType = "MMS" )  = false then throw exception.setCodeNMessage(-99999999,"메시지 유형이 올바르게 입력되지 않았습니다.")
if isnull(messages) or upperbound(messages) <= 0 then throw exception.setcodenMessage(-99999999,"전송할 메시지가 입력되지 않았습니다.")

postData = '{'

if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
if (isnull(subject) or subject = "") = false then postData += '"subject":"' + escapestring(subject) + '",'
if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
if adsyn then postData += '"adsYN":true,'
if (isnull(requestNum) or requestNum = "") = false then postData += '"requestNum":"' + escapestring(requestnum) + '",'
postData += '"msgs":['
integer i

for i = 1 to upperbound(messages)
	postData += '{"snd":"'+escapestring(messages[i].sender)+'",' + &
					'"sndnm":"' + escapestring(messages[i].sendername) + '",' + &
					'"rcv":"' + escapestring(messages[i].receiver) + '",' + &
					'"rcvnm":"' + escapestring(messages[i].receivername) + '",' + &
					'"msg":"' + escapestring(messages[i].content) + '",' + &
					'"sjt":"' + escapestring(messages[i].subject) + '"}' 
	if i < upperbound(messages) then postData += ","
next

postData += ']'

postData += '}'

dic = httppost("/" + msgType ,corpnum,postData,userid)
receiptNum = dic.Item("receiptNum")
dic.DisconnectObject()
destroy dic

return receiptNum
end function

public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("SMS",corpnum, sender, "",content,messages,reservedt,false,userid)
end function

public function string sendsms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("SMS",corpnum,"","","",messages,reservedt,false,userid)
end function

public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].content = content

return sendsms(corpnum,l_message,reservedt,userid)
end function

public function string sendlms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,sender,subject,content,messages,reserveDT,false,userid)
end function

public function string sendlms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,"","","",messages,reservedt,false,userid)
end function

public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendlms(corpnum,l_message,reservedt,userid)
end function

public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("XMS",corpnum,sender,subject,content,messages,reserveDT,false,userid)
end function

public function string sendxms (string corpnum, mmessage messages[], string reservedt, string userid) throws popbillexception;
return sendmessage("XMS",corpnum,"","","",messages,reservedt,false,userid)
end function

public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendxms(corpnum,l_message,reservedt,userid)
end function

public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, string userid) throws popbillexception;
	return sendmms(corpnum, sender, subject, content, messages[], filepath, filename, reservedt, false, userid)
end function

public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, string userid) throws popbillexception;
mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendmms(corpnum,l_message,filepath,filename, reservedt, false, userid)
end function

public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, string userid) throws popbillexception;
	return sendmms(corpnum,"","","", messages,filepath,filename, reservedt,false, userid)
end function

public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
return sendmessage("SMS",corpnum,sender, "",content,messages,reserveDT, adsyn, userid)
end function

public function string sendsms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
return sendmessage("SMS",corpnum,"","","",messages,reservedt,adsyn,userid)
end function

public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].content = content

return sendsms(corpnum, l_message, reservedt, adsyn, userid)
end function

public function string sendsms (string corpnum, string sender, string sendername, string receiver, string receivername, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].sendername = sendername
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].content = content

return sendsms(corpnum, l_message, reservedt, adsyn, userid)
end function

public function string sendlms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,sender,subject,content,messages,reserveDT,adsyn, userid)
end function

public function string sendlms (string corpnum, mmessage messages[], string reservedt,boolean adsyn, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,"","","",messages,reservedt,adsyn,userid)
end function

public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendlms(corpnum,l_message,reservedt,adsyn, userid)
end function

public function string sendlms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].sendername = sendername
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendlms(corpnum,l_message,reservedt,adsyn, userid)
end function

public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
return sendmessage("XMS",corpnum,sender,subject,content,messages,reserveDT,adsyn, userid)
end function

public function string sendxms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string userid) throws popbillexception;
return sendmessage("XMS",corpnum,"","","",messages,reservedt,adsyn, userid)
end function

public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;
mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendxms(corpnum,l_message,reservedt, adsyn, userid)
end function

public function string sendxms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string userid) throws popbillexception;
mmessage l_message[]

l_message[1].sender = sender
l_message[1].sendername = sendername
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendxms(corpnum,l_message,reservedt, adsyn, userid)
end function

public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception;oleobject dic
string receiptNum,postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(filepath) or filepath = "" then throw exception.setcodenMessage(-99999999,"전송파일 경로가 입력되지 않았습니다.")

postData = '{'

if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
if (isnull(subject) or subject = "") = false then postData += '"subject":"' + escapestring(subject) + '",'
if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
if adsyn then postData += '"adsYN":true,'

postData += '"msgs":['
integer i

for i = 1 to upperbound(messages)
	postData += '{"snd":"'+escapestring(messages[i].sender)+'",' + &
					'"sndnm":"' + escapestring(messages[i].sendername) + '",' + &
					'"rcv":"' + escapestring(messages[i].receiver) + '",' + &
					'"rcvnm":"' + escapestring(messages[i].receivername) + '",' + &
					'"msg":"' + escapestring(messages[i].content) + '",' + &
					'"sjt":"' + escapestring(messages[i].subject) + '"}' 
	if i < upperbound(messages) then postData += ","
next

postData += ']'
postData += '}'

dic = httppostfiles("/MMS",corpnum,postData,{filepath},"file", userid, {filename})
receiptNum = dic.Item("receiptNum")
dic.DisconnectObject()
destroy dic

return receiptNum
end function

public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception;
	return sendmms(corpnum,"","","", messages,filepath,filename,reservedt,adsyn, userid)
end function

public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception;
	mmessage l_message[]

  l_message[1].sender = sender
  l_message[1].receiver = receiver
  l_message[1].receivername = receivername
  l_message[1].subject = subject
  l_message[1].content = content
  return sendmms(corpnum,l_message,filepath,filename,reservedt,adsyn,userid)
end function

public function string sendmms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string userid) throws popbillexception;
	mmessage l_message[]

	l_message[1].sender = sender
	l_message[1].sendername = sendername
	l_message[1].receiver = receiver
	l_message[1].receivername = receivername
	l_message[1].subject = subject
	l_message[1].content = content
	
	return sendmms(corpnum,l_message,filepath,filename,reservedt,adsyn,userid)
end function

public function string sendsms (string corpnum, string sender, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;
return sendmessage("SMS",corpnum,sender, "",content,messages,reserveDT, adsyn, requestnum, userid)
end function

public function string sendsms (string corpnum, mmessage messages[], string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;
return sendmessage("SMS",corpnum, "","","",messages,reservedt,adsyn, requestnum, userid)
end function

public function string sendsms (string corpnum, string sender, string receiver, string receivername, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].content = content

return sendsms(corpnum, l_message, reservedt, adsyn,requestnum, userid)
end function

public function string sendsms (string corpnum, string sender, string senderName, string receiver, string receivername, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].senderName = senderName
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].content = content

return sendsms(corpnum, l_message, reservedt, adsyn, requestnum, userid)
end function

public function string sendlms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn,  string requestnum, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,sender, subject,content,messages,reserveDT,adsyn, requestnum,userid)
end function

public function string sendlms (string corpnum, mmessage messages[], string reservedt,boolean adsyn,  string requestnum, string userid) throws popbillexception;
return sendmessage("LMS",corpnum,"","","",messages,reservedt,adsyn,requestnum,userid)
end function

public function string sendlms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn,  string requestnum, string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendlms(corpnum,l_message,reservedt,adsyn,requestnum, userid)
end function

public function string sendlms (string corpnum, string sender, string senderName, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;mmessage l_message[]

l_message[1].sender = sender
l_message[1].senderName = senderName
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendlms(corpnum,l_message,reservedt,adsyn, requestnum, userid)
end function

public function string sendxms (string corpnum, string sender, string subject, string content, mmessage messages[], string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;
return sendmessage("XMS",corpnum,sender,subject,content,messages,reserveDT,adsyn, requestnum,userid)
end function

public function string sendxms (string corpnum, mmessage messages[], string reservedt, boolean adsyn,  string requestnum, string userid) throws popbillexception;
return sendmessage("XMS",corpnum,"","","",messages,reservedt,adsyn, requestnum,userid)
end function

public function string sendxms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string requestnum,  string userid) throws popbillexception;
mmessage l_message[]

l_message[1].sender = sender
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendxms(corpnum,l_message,reservedt, adsyn, requestnum,userid)
end function

public function string sendxms (string corpnum, string sender, string senderName, string receiver, string receivername, string subject, string content, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;
mmessage l_message[]

l_message[1].sender = sender
l_message[1].senderName = senderName
l_message[1].receiver = receiver
l_message[1].receivername = receivername
l_message[1].subject = subject
l_message[1].content = content

return sendxms(corpnum,l_message,reservedt, adsyn,requestnum, userid)
end function

public function string sendmms (string corpnum, string sender, string subject, string content, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;oleobject dic
string receiptNum,postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(filepath) or filepath = "" then throw exception.setcodenMessage(-99999999,"전송파일 경로가 입력되지 않았습니다.")

postData = '{'

if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
if (isnull(subject) or subject = "") = false then postData += '"subject":"' + escapestring(subject) + '",'
if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
if adsyn then postData += '"adsYN":true,'
if (isnull(requestnum) or requestnum = "") = false then postData += '"requestnum":"' + escapestring(requestnum) + '",'

postData += '"msgs":['
integer i

for i = 1 to upperbound(messages)
	postData += '{"snd":"'+escapestring(messages[i].sender)+'",' + &
					'"sndnm":"' + escapestring(messages[i].sendername) + '",' + &
					'"rcv":"' + escapestring(messages[i].receiver) + '",' + &
					'"rcvnm":"' + escapestring(messages[i].receivername) + '",' + &
					'"msg":"' + escapestring(messages[i].content) + '",' + &
					'"sjt":"' + escapestring(messages[i].subject) + '"}' 
	if i < upperbound(messages) then postData += ","
next

postData += ']'
postData += '}'

dic = httppostfiles("/MMS",corpnum,postData,{filepath},"file", userid, {filename})
receiptNum = dic.Item("receiptNum")
dic.DisconnectObject()
destroy dic

return receiptNum
end function

public function string sendmms (string corpnum, mmessage messages[], string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;
	return sendmms(corpnum,"","","", messages,filepath,filename,reservedt,adsyn, requestnum, userid)
end function

public function string sendmms (string corpnum, string sender, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;
	mmessage l_message[]

  l_message[1].sender = sender
  l_message[1].receiver = receiver
  l_message[1].receivername = receivername
  l_message[1].subject = subject
  l_message[1].content = content
  return sendmms(corpnum,l_message,filepath,filename,reservedt,adsyn, requestnum, userid)
end function

public function string sendmms (string corpnum, string sender, string sendername, string receiver, string receivername, string subject, string content, string filepath, string filename, string reservedt, boolean adsyn, string requestnum, string userid) throws popbillexception;
	mmessage l_message[]
	
	l_message[1].sender = sender
	l_message[1].sendername = sendername
	l_message[1].receiver = receiver
	l_message[1].receivername = receivername
	l_message[1].subject = subject
	l_message[1].content = content
	
	return sendmms(corpnum,l_message,filepath,filename,reservedt,adsyn, requestnum, userid)
end function

public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception;
	return cancelreserve(corpnum, receiptnum, "")
end function 

public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptnum) or receiptnum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

dic = httpget("/Message/" + receiptNum + "/Cancel" ,corpnum,userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine getmessageresult (string corpnum, string receiptnum, ref messageresult ref_result[]) throws popbillexception;any dicList[]
integer i
oleobject log
any response
tarray result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptNum) or receiptNum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

try
	response = httpget("/Message/" + receiptNum ,corpnum,"")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		log = result.list[i]
		
		ref_result[i].state = log.item("state")
		ref_result[i].result = Integer(log.item("result"))
		ref_result[i].msgtype = string(log.item("type"))
		ref_result[i].subject = string(log.item("subject"))
		ref_result[i].content = string(log.item("content"))
		ref_result[i].sendNum = string(log.item("sendNum"))
		ref_result[i].senderName = string(log.item("senderName"))
		ref_result[i].receiveNum = string(log.item("receiveNum"))
		ref_result[i].receiveName = string(log.item("receiveName"))
		ref_result[i].reserveDT = string(log.item("reserveDT"))
		ref_result[i].sendDT = string(log.item("sendDT"))
		ref_result[i].resultDT = string(log.item("resultDT"))
		ref_result[i].tranNet = string(log.item("tranNet"))	
		ref_result[i].sendResult = string(log.item("sendResult"))
		ref_result[i].receiptNum = string(log.item("receiptNum"))
		ref_result[i].requestNum = string(log.item("requestNum"))
	
		log.DisconnectObject()
		destroy log
		
	next
	
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function response cancelreservern (string corpnum, string requestnum) throws popbillexception;
	return cancelreservern(corpnum, requestnum, "")
end function 

public function response cancelreservern (string corpnum, string requestnum, string userid) throws popbillexception;
	response result
	oleobject dic
	string postData
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	if isnull(requestnum) or requestnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")
	
	dic = httpget("/Message/Cancel/"+requestnum ,corpnum,userid)
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic
	
	return result
end function

public subroutine getmessageresultrn (string corpnum, string requestnum, ref messageresult ref_result[]) throws popbillexception;
any dicList[]
integer i
oleobject log
any response
tarray result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(requestnum) or requestnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")

try
	response = httpget("/Message/Get/" + requestnum ,corpnum,"")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		log = result.list[i]
		
		ref_result[i].state = log.item("state")
		ref_result[i].result= integer(log.item("result"))
		ref_result[i].msgtype = string(log.item("type"))
		ref_result[i].subject = string(log.item("subject"))
		ref_result[i].content = string(log.item("content"))
		ref_result[i].sendNum = string(log.item("sendNum"))
		ref_result[i].senderName = string(log.item("senderName"))
		ref_result[i].receiptdt = string(log.item("receiptDT"))	
		ref_result[i].receiveNum = string(log.item("receiveNum"))
		ref_result[i].receiveName = string(log.item("receiveName"))
		ref_result[i].reserveDT = string(log.item("reserveDT"))
		ref_result[i].sendDT = string(log.item("sendDT"))
		ref_result[i].resultDT = string(log.item("resultDT"))
		ref_result[i].sendResult = string(log.item("sendResult"))
		ref_result[i].tranNet = string(log.item("tranNet"))
		ref_result[i].receiptNum = string(log.item("receiptNum"))
		ref_result[i].requestNum = string(log.item("requestNum"))
	
		log.DisconnectObject()
		destroy log
	next
	
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function string geturl (string corpnum, string togo) throws popbillexception;
	return geturl(corpnum, "", togo)
end function 

public function string geturl (string corpnum, string userid, string togo) throws popbillexception;string url
oleObject result

result = httpget("/Message/?TG=" + togo , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getSenderNumberMgtURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/Message/?TG=SENDER", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getSentListURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/Message/?TG=BOX", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function msgsearchresult search (string corpnum, string sdate, string edate, string state[], string item[], boolean reserveyn, boolean senderyn, string order, int page, int perpage) throws popbillexception;
return search(corpnum, sdate, edate, state, item, reserveyn, senderyn, order, page, perpage, "")
end function

public function msgsearchresult search (string corpnum, string sdate, string edate, string state[], string item[], boolean reserveyn, boolean senderyn, string order, int page, int perpage, string qstring) throws popbillexception;
oleobject dic
string uri, tmpstr
int i
msgsearchresult result

uri = "/Message/Search"
uri += "?SDate=" + sdate
uri += "&EDate=" + edate

tmpstr = ""
for i = 1 to upperbound(state)
	tmpstr += state[i] 
	if i < upperbound(state) then tmpstr+= ','
next
uri += "&State=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(item)
	tmpstr += item[i] 
	if i < upperbound(item) then tmpstr+= ','
next
uri += "&Item=" + tmpstr

if not isnull(senderyn) then
	if senderyn then uri += "&SenderYN=1"
	if not(senderyn) then uri += "&SenderYN=0"
end if

if not isnull(reserveyn) then
	if reserveyn then uri += "&ReserveYN=1"
	if not(reserveyn) then uri += "&ReserveYN=0"
end if
uri += "&Order=" + order
uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
	
if not isnull(qstring) then uri += "&QString=" + urlencode(qstring)

dic = httpget(uri,corpnum,"")

result = tomsgsearchresult(dic)
oleobject toDestory[]

if not isnull(dic.Item("list")) then
	toDestory = dic.Item("list")
	for i = 1 to upperbound(toDestory)
		toDestory[i].DisconnectObject()
		destroy toDestory[i]
	next
end if

dic.DisconnectObject()
destroy dic

return result
end function

public function msgsearchresult tomsgsearchresult (ref oleobject dic);
msgsearchresult result
oleobject log

result.code = string(dic.Item("code"))
result.message = string(dic.Item("message"))
result.total = string(dic.Item("total"))
result.perPage = string(dic.Item("perPage"))
result.pageNum = string(dic.Item("pageNum"))
result.pageCount = string(dic.Item("pageCount"))

Integer i
oleobject list[]

if not isnull(dic.Item("list")) then
	list = dic.Item("list")
	
	for i = 1 to upperbound(list)
		log = list[i]
		result.list[i].state = log.item("state")
		result.list[i].result = Integer(log.item("result"))
		result.list[i].msgtype = string(log.item("type"))
		result.list[i].subject = string(log.item("subject"))
		result.list[i].content = string(log.item("content"))
		result.list[i].sendNum = string(log.item("sendNum"))
		result.list[i].senderName = string(log.item("senderName"))
		result.list[i].receiptdt = string(log.item("receiptDT"))	
		result.list[i].receiveNum = string(log.item("receiveNum"))
		result.list[i].receiveName = string(log.item("receiveName"))
		result.list[i].reserveDT = string(log.item("reserveDT"))
		result.list[i].sendDT = string(log.item("sendDT"))
		result.list[i].resultDT = string(log.item("resultDT"))
		result.list[i].sendResult = string(log.item("sendResult"))
		result.list[i].tranNet = string(log.item("tranNet"))
		result.list[i].receiptNum = string(log.item("receiptNum"))
		result.list[i].requestNum = string(log.item("requestNum"))
	
		log.DisconnectObject()
		destroy log
	next
end if

return result
end function

public subroutine getautodenylist (string corpnum, ref autodeny ref_list[]) throws popbillexception
any dicList
integer i
oleobject key
tarray result

try

	dicList = httpget("/Message/Denied",corpnum,"")
	result = create tarray
	result = dicList
	
	for i = 1 to result.getLength()
		key = result.list[i]
		
		ref_List[i].number = key.item("number")
		ref_List[i].regdt = key.item("regDT")
		
		key.DisconnectObject()
		destroy key
		
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function chargeinfo getchargeinfo (string corpnum, string msgtype) throws popbillexception;
	return getchargeinfo(corpnum, msgtype, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string msgtype, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/Message/ChargeInfo?Type="+msgtype, CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine getsendernumberlist (string corpnum, ref sendernumber ref_list[]) throws popbillexception
any dicList
integer i
oleobject key
tarray result

try

	dicList = httpget("/Message/SenderNumber",corpnum,"")
	result = create tarray
	result = dicList
	
	for i = 1 to result.getLength()
		key = result.list[i]
		
		ref_List[i].number = key.item("number")
		ref_List[i].state = key.item("state")
		ref_List[i].representYN = key.item("representYN")		

		key.DisconnectObject()
		destroy key
		
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public subroutine getstates (string corpnum, ref string reciptnumlist[], ref messagebriefinfo ref_returnlist[]) throws popbillexception;
	any dicList[]
	oleobject infoDic
	string postdata
	Integer i
	
	postdata += '['
	
	for i = 1 to upperbound(reciptnumlist)
		postdata += '"' + reciptnumlist[i] + '"'
		if i < upperbound(reciptnumlist) then postData += ','
	next
	
	postdata += ']'

try
		any response
		response = httppost("/Message/States", corpnum, postdata, "")
		tarray result
		result = create tarray
		result = response
		integer resultLength
		resultLength = result.getLength()
	
for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = tomessagebriefinfo(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
		
next

catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function messagebriefinfo tomessagebriefinfo(ref oleobject dic);
messagebriefinfo result
result.rNum = string(dic.Item("rNum"))
result.sn = string(dic.Item("sn"))
result.stat = string(dic.Item("stat"))
result.rlt = string(dic.Item("rlt"))
result.sDT = string(dic.Item("sDT"))
result.rDT = string(dic.Item("rDT"))
result.net = string(dic.Item("net"))
result.srt = string(dic.Item("srt"))
return result
end function

on messageservice.create
call super::create
end on

on messageservice.destroy
call super::destroy
end on

event constructor;call super::constructor;addscope("150")
addscope("151")
addscope("152")
end event

