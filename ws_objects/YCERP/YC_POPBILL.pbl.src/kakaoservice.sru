$PBExportHeader$kakaoservice.sru
forward
global type kakaoservice from baseservice
end type
end forward

global type kakaoservice from baseservice
end type
global kakaoservice kakaoservice

forward prototypes
//GetURL
public function string geturl (string corpnum, string togo, string userid) throws popbillexception

//플러스친구 계정관리 팝업 URL
public function string getPlusFriendMgtURL (string corpnum, string userid) throws popbillexception

//발신번호 관리 팝업 URL
public function string getSenderNumberMgtURL (string corpnum, string userid) throws popbillexception

//알림톡 템플릿관리 팝업 URL
public function string getATSTemplateMgtURL (string corpnum, string userid) throws popbillexception

//카카오톡 전송내역 팝업 URL
public function string getSentListURL (string corpnum, string userid) throws popbillexception

//플러스친구 목록 확인
public subroutine listplusfriendid (string corpnum, ref plusfriend ref_list[]) throws popbillexception

//발신번호 목록 확인
public subroutine getsendernumberlist (string corpnum, ref sendernumber ref_list[]) throws popbillexception

//알림톡 템플릿 목록 확인
public subroutine listatstemplate (string corpnum, ref atstemplate ref_list[]) throws popbillexception

//알림톡 전송
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[]) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string userid) throws popbillexception

//알림톡 전송(requestNum)
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string requestnum, string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string requestnum, string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string requestnum, string userid) throws popbillexception

//알림톡 버튼 추가(buttons) 
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string  requestnum, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string requestnum, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string requestnum, kakaobutton kakaobutton[], string userid) throws popbillexception

//친구톡 텍스트 전송
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[]) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[]) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[]) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[], string userid) throws popbillexception

//친구톡 텍스트 전송(requestNum)
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception

//친구톡 이미지 전송
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[]) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[]) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[]) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[], string userid) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[], string userid) throws popbillexception

//친구톡 이미지 전송(requestNum)
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[],  string requestnum, string userid) throws popbillexception

//예약전송 취소
public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception
public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception

//예약전송 취소(requestnum)
public function response cancelreservern (string corpnum, string requestnum) throws popbillexception
public function response cancelreservern (string corpnum, string requestnum, string userid) throws popbillexception

//알림톡/친구톡 전송내역 확인
public function kakaoResult getmessages (string corpnum, string receiptnum) throws popbillexception
public function kakaoResult getmessages (string corpnum, string receiptnum, string userid) throws popbillexception

//알림톡/친구톡 전송내역(rqeustnum) 확인
public function kakaoResult getmessagesrn (string corpnum, string requestnum) throws popbillexception
public function kakaoResult getmessagesrn (string corpnum, string requestnum, string userid) throws popbillexception
public function kakaoResult tokakaoresult (ref oleobject dic)

//전송내역 목록 조회
public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage) throws popbillexception
public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage, string userid) throws popbillexception
public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage, string userid, string qstring) throws popbillexception
public function kakaosearchresult tokakaosearchresult (ref oleobject dic)

//전송단가 확인
public function decimal getunitcost (string corpnum, string kakaotype) throws popbillexception
public function decimal getunitcost (string corpnum, string kakaotype, string userid) throws popbillexception

//과금정보 확인
public function chargeinfo getchargeinfo (string corpnum, string kakaotype) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string kakaotype, string userid) throws popbillexception
end prototypes

public function string geturl(string corpnum, string togo, string userid) throws popbillexception
string url
oleObject result

if togo = "SENDER" then
	result = httpget("/Message/?TG="+togo, corpnum, userid)
else
	result = httpget("/KakaoTalk/?TG="+togo, corpnum, userid)
end if

url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getPlusFriendMgtURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/KakaoTalk/?TG=PLUSFRIEND", CorpNum,Userid)
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

public function string getATSTemplateMgtURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/KakaoTalk/?TG=TEMPLATE", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getSentListURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/KakaoTalk/?TG=BOX", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public subroutine listplusfriendid (string corpnum, ref plusfriend ref_list[]) throws popbillexception
any dicList
integer i
oleobject key
tarray result

try 
	dicList = httpget("/KakaoTalk/ListPlusFriendID", corpnum, "")
	result = create tarray
	result = dicList
	
	for i = 1 to result.getLength()
		key = result.list[i]
		
		ref_List[i].plusFriendID = key.item("plusFriendID")
		ref_List[i].plusFriendName = key.item("plusFriendName")
		ref_List[i].regDT = key.item("regDT")
		
		key.DisconnectObject()
		destroy key
		
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

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

public subroutine listatstemplate (string corpnum, ref atstemplate ref_list[]) throws popbillexception
any dicList
integer i, j
oleobject dic
oleobject btndic
tarray result

try
	dicList = httpget("/KakaoTalk/ListATSTemplate", corpnum, "")
	result = create tarray
	result = dicList

	for i = 1 to result.getLength()
		dic = result.list[i]
		
		ref_List[i].templateCode = dic.item("templateCode")
		ref_List[i].templateName = dic.item("templateName")
		ref_List[i].template = dic.item("template")
		ref_List[i].plusFriendID = dic.item("plusFriendID")
		
		if isnull(dic.item("btns")) = false then  
			oleobject btns[]
			btns = dic.item("btns")
			for j = 1 to upperbound(btns)
				btndic = btns[j]
				ref_List[i].btns[j].n = btndic.item("n")
				ref_List[i].btns[j].t = btndic.item("t")
				if isnull(btndic.item("u1")) = false then ref_List[i].btns[j].u1 = btndic.item("u1")
				if isnull(btndic.item("u2")) = false then ref_List[i].btns[j].u2 = btndic.item("u2")
			next
			
			oleobject todic[]
			todic = dic.item("btns")
		
			for j = 1 to upperbound(todic)
				todic[j].DisconnectObject()
				destroy todic[j]
			next	
		end if	
			
		dic.DisconnectObject()
		destroy dic
	
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername) throws popbillexception
	return sendats(corpnum, templatecode, sender, content, altcontent, altsendtype, snddt, receiver, receivername, "")
end function

public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt) throws popbillexception
	return sendats(corpnum, templatecode, sender, kakaomsg, altsendtype, snddt, "")
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[]) throws popbillexception
	return sendats (corpnum, templatecode, sender, "", "", altsendtype, snddt, kakaomsg, "")
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string userid) throws popbillexception
kakaomsg l_kakaomsg[]

l_kakaomsg[1].rcv = receiver
l_kakaomsg[1].rcvnm = receivername
l_kakaomsg[1].msg = content
l_kakaomsg[1].altmsg = altcontent

return sendats(corpnum, templatecode, sender, "", "", altsendtype, snddt, l_kakaomsg, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string userid) throws popbillexception
	return sendats (corpnum, templatecode, sender, "", "", altsendtype, snddt, kakaomsg, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string userid) throws popbillexception
oleobject dic
string receiptNum, postData

postData = '{'

if (isnull(templatecode) or templatecode = "") = false then postData += '"templateCode":"'+ escapestring(templatecode) + '",'
if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
if (isnull(altcontent) or altcontent = "") = false then postData += '"altcontent":"' + escapestring(altcontent) + '",'
if (isnull(altsendtype) or altsendtype = "") = false then postData += '"altsendtype":"' + escapestring(altsendtype) + '",'
if (isnull(snddt) or snddt = "") = false then postData += '"snddt":"' + escapestring(snddt) + '",'

postData += ' "msgs":[ '
integer i

for i = 1 to upperbound(kakaomsg)
	postData += '{"rcv":"'+escapestring(kakaomsg[i].rcv)+'",' + &
					'"rcvnm":"' + escapestring(kakaomsg[i].rcvnm) + '",' + &					
					'"msg":"' + escapestring(kakaomsg[i].msg) + '",' + &
					'"altmsg":"' + escapestring(kakaomsg[i].altmsg) + '"}' 
	if i < upperbound(kakaomsg) then postData += ","
next
	
postData += ']'

postData += '}'

dic = httppost("/ATS", corpnum, postData, userid)
receiptNum = dic.Item("receiptNum")
dic.DisconnectObject()
destroy dic

return receiptNum
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string requestnum, string userid) throws popbillexception
	KakaoButton l_kakaoButton[]
	kakaomsg l_kakaomsg[]
	
	l_kakaomsg[1].rcv = receiver
	l_kakaomsg[1].rcvnm = receivername
	l_kakaomsg[1].msg = content
	l_kakaomsg[1].altmsg = altcontent

	
	return sendats(corpnum, templatecode, sender, "", "", altsendtype, snddt, l_kakaomsg, requestnum, l_kakaoButton, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string requestnum, string userid) throws popbillexception
	KakaoButton l_kakaoButton[]
	return sendats (corpnum, templatecode, sender, "", "", altsendtype, snddt, kakaomsg, requestnum, l_kakaoButton, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string requestnum, string userid) throws popbillexception
	KakaoButton l_kakaoButton[]
	
	return sendats (corpnum, templatecode, sender, content, altcontent, altsendtype, snddt, kakaomsg, requestnum, l_kakaoButton, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, string receiver, string receivername, string requestnum, KakaoButton btns[], string userid) throws popbillexception
	kakaomsg l_kakaomsg[]
	
	l_kakaomsg[1].rcv = receiver
	l_kakaomsg[1].rcvnm = receivername
	l_kakaomsg[1].msg = content
	l_kakaomsg[1].altmsg = altcontent
	
	return sendats(corpnum, templatecode, sender, "", "", altsendtype, snddt, l_kakaomsg, requestnum, btns, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, kakaomsg kakaomsg[], string altsendtype, string snddt, string requestnum, KakaoButton btns[], string userid) throws popbillexception
	return sendats (corpnum, templatecode, sender, "", "", altsendtype, snddt, kakaomsg, requestnum, btns, userid)
end function

public function string sendats (string corpnum, string templatecode, string sender, string content, string altcontent, string altsendtype, string snddt, kakaomsg kakaomsg[], string requestnum, kakaobutton kakaobutton[], string userid) throws popbillexception
	oleobject dic
	string receiptNum, postData
	postData = '{'
	
	if (isnull(templatecode) or templatecode = "") = false then postData += '"templateCode":"'+ escapestring(templatecode) + '",'
	if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
	if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
	if (isnull(altcontent) or altcontent = "") = false then postData += '"altcontent":"' + escapestring(altcontent) + '",'
	if (isnull(altsendtype) or altsendtype = "") = false then postData += '"altsendtype":"' + escapestring(altsendtype) + '",'
	if (isnull(snddt) or snddt = "") = false then postData += '"snddt":"' + escapestring(snddt) + '",'
	if (isnull(requestnum) or requestnum = "") = false then postData += '"requestnum":"' + escapestring(requestnum) + '",'
	
	postData += ' "msgs":[ '
	integer i
	
	for i = 1 to upperbound(kakaomsg)
		postData += '{"rcv":"'+escapestring(kakaomsg[i].rcv)+'",' + &
						'"rcvnm":"' + escapestring(kakaomsg[i].rcvnm) + '",' + &					
						'"msg":"' + escapestring(kakaomsg[i].msg) + '",' + &
						'"altmsg":"' + escapestring(kakaomsg[i].altmsg) + '"}' 
		if i < upperbound(kakaomsg) then postData += ","
	next
		
	postData += '],'
   postData += '"btns":['
   for i = 1 to upperbound(kakaobutton)
   postData +=  '{"n":"'+escapestring(kakaobutton[i].n)+'",' + &
            '"t":"' + escapestring(kakaobutton[i].t) + '",' + &
            '"u1":"' + escapestring(kakaobutton[i].u1) + '",' + &
            '"u2":"' + escapestring(kakaobutton[i].u2) + '"}' 
   if i < upperbound(kakaobutton) then postData += ","
   next
   postData += ']'	
	postData += '}'
	
	dic = httppost("/ATS", corpnum, postData, userid)
	receiptNum = dic.Item("receiptNum")
	dic.DisconnectObject()
	destroy dic
	
	return receiptNum
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[]) throws popbillexception
	return sendfts(corpnum, plusFriendID, sender, content, altContent, altSendType, sndDT, adsYN, receiver, receivername, kakaobutton, "")
end function	

public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[]) throws popbillexception
	return  sendfts (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, adsYN, kakaomsg, kakaobutton, "")
end function	

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[]) throws popbillexception
	return sendfts (corpnum,  plusFriendID,  sender,  content,  altContent,  altSendType,  sndDT,  adsYN,  kakaomsg,  kakaobutton, "") 
end function	

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string userid) throws popbillexception
kakaomsg l_kakaomsg[]

l_kakaomsg[1].rcv = receiver
l_kakaomsg[1].rcvnm = receivername
l_kakaomsg[1].msg = content
l_kakaomsg[1].altmsg = altcontent

return sendfts (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, adsYN, l_kakaomsg, kakaobutton, userid)
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[], string userid) throws popbillexception
	return sendfts (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, adsYN, kakaomsg, kakaobutton, userid)
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[], string userid) throws popbillexception
	return sendfts (corpnum,  plusFriendID,  sender,  content,  altContent,  altSendType,  sndDT,  adsYN,  kakaomsg[],  kakaobutton[],  "", userid)
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
	kakaomsg l_kakaomsg[]
	
	l_kakaomsg[1].rcv = receiver
	l_kakaomsg[1].rcvnm = receivername
	l_kakaomsg[1].msg = content
	l_kakaomsg[1].altmsg = altcontent
	
	return sendfts (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, adsYN, l_kakaomsg, kakaobutton, requestnum, userid)
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, boolean adsYN, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
	return sendfts (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, adsYN, kakaomsg, kakaobutton, requestnum, userid)
end function

public function string sendfts (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
	oleobject dic
	string receiptNum, postData
	int i
	
	postData = '{'
	
	if (isnull(plusfriendid) or plusfriendid = "") = false then postData += '"plusfriendid":"'+ escapestring(plusfriendid) + '",'
	if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
	if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
	if (isnull(altcontent) or altcontent = "") = false then postData += '"altcontent":"' + escapestring(altcontent) + '",'
	if (isnull(altsendtype) or altsendtype = "") = false then postData += '"altsendtype":"' + escapestring(altsendtype) + '",'
	if (isnull(snddt) or snddt = "") = false then postData += '"snddt":"' + escapestring(snddt) + '",'
	if adsYN then postData += "adsYN:true,"
	if (isnull(requestnum) or requestnum = "") = false then postData += '"requestNum":"' + escapestring(requestnum) + '",'
	
	postData += ' "msgs":[ '
	for i = 1 to upperbound(kakaomsg)
		postData += '{"rcv":"'+escapestring(kakaomsg[i].rcv)+'",' + &
						'"rcvnm":"' + escapestring(kakaomsg[i].rcvnm) + '",' + &					
						'"msg":"' + escapestring(kakaomsg[i].msg) + '",' + &
						'"altmsg":"' + escapestring(kakaomsg[i].altmsg) + '"}' 
		if i < upperbound(kakaomsg) then postData += ","
	next
	postData += '],'
	
	postData += '"btns":['
	for i = 1 to upperbound(kakaobutton)
		postData +=  '{"n":"'+escapestring(kakaobutton[i].n)+'",' + &
						'"t":"' + escapestring(kakaobutton[i].t) + '",' + &
						'"u1":"' + escapestring(kakaobutton[i].u1) + '",' + &
						'"u2":"' + escapestring(kakaobutton[i].u2) + '"}' 
		if i < upperbound(kakaobutton) then postData += ","
	next
	postData += ']'
	
	postData += '}'
	
	dic = httppost("/FTS", corpnum, postData, userid)
	receiptNum = dic.Item("receiptNum")
	dic.DisconnectObject()
	destroy dic
	
	return receiptNum
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[]) throws popbillexception
	return sendfms(corpnum, plusFriendID, sender, content, altContent, altSendType, sndDT, filepath, fileName, imageURL, adsYN, receiver, receivername, kakaobutton, "")
end function	

public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[]) throws popbillexception
	return sendfms(corpnum, plusFriendID, sender, "", "", altSendType, sndDT, filepath, fileName, imageURL, adsYN, kakaomsg, kakaobutton, "")
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[]) throws popbillexception
	return sendfms(corpnum, plusFriendID, sender, content, altContent, altSendType, sndDT,  filepath, filename, imageURL,  adsYN,  kakaomsg, kakaobutton, "")
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string userid) throws popbillexception
  kakaomsg l_kakaomsg[]

  l_kakaomsg[1].rcv = receiver
  l_kakaomsg[1].rcvnm = receivername
  l_kakaomsg[1].msg = content
  l_kakaomsg[1].altmsg = altcontent

  return sendfms(corpnum, plusFriendID, sender, "", "", altSendType, sndDT, filepath, fileName, imageURL, adsYN, l_kakaomsg, kakaobutton, userid)
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[], string userid) throws popbillexception
	return sendfms(corpnum, plusFriendID, sender, "", "", altSendType, sndDT, filepath, fileName, imageURL, adsYN, kakaomsg, kakaobutton, userid)
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[],string userid) throws popbillexception
	return sendfms (corpnum, plusFriendID, sender, content, altContent, altSendType, sndDT, filepath, fileName, imageURL, adsYN, kakaomsg[], kakaobutton[], "", userid)
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, string receiver, string receivername, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
  kakaomsg l_kakaomsg[]

  l_kakaomsg[1].rcv = receiver
  l_kakaomsg[1].rcvnm = receivername
  l_kakaomsg[1].msg = content
  l_kakaomsg[1].altmsg = altcontent

  return sendfms (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, filepath, fileName, imageURL, adsYN, l_kakaomsg, kakaobutton, requestnum, userid)
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, kakaomsg kakaomsg[], string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaobutton kakaobutton[], string requestnum, string userid) throws popbillexception
  return sendfms (corpnum, plusFriendID, sender, "", "", altSendType, sndDT, filepath, fileName, imageURL, adsYN, kakaomsg, kakaobutton, requestnum, userid)
end function

public function string sendfms (string corpnum, string plusFriendID, string sender, string content, string altContent, string altSendType, string sndDT, string filepath, string fileName, string imageURL, boolean adsYN, kakaomsg kakaomsg[], kakaobutton kakaobutton[],  string requestnum, string userid) throws popbillexception
  oleobject dic
  string receiptNum, postData
  integer i

  postData = '{'

  if (isnull(plusfriendid) or plusfriendid = "") = false then postData += '"plusfriendid":"'+ escapestring(plusfriendid) + '",'
  if (isnull(sender) or sender = "") = false then postData += '"snd":"' + escapestring(sender) + '",'
  if (isnull(content) or content = "") = false then postData += '"content":"' + escapestring(content) + '",'
  if (isnull(altcontent) or altcontent = "") = false then postData += '"altcontent":"' + escapestring(altcontent) + '",'
  if (isnull(altsendtype) or altsendtype = "") = false then postData += '"altsendtype":"' + escapestring(altsendtype) + '",'
  if (isnull(snddt) or snddt = "") = false then postData += '"snddt":"' + escapestring(snddt) + '",'
  if (isnull(imageURL) or imageURL = "") = false then postData += '"imageURL":"' + escapestring(imageURL) + '",'
  if adsYN then postData += "adsYN:true,"
  if (isnull(requestnum) or requestnum = "") = false then postData += '"requestnum":"' + escapestring(requestnum) + '",'
  
  postData += ' "msgs":[ '
  for i = 1 to upperbound(kakaomsg)
    postData += '{"rcv":"'+escapestring(kakaomsg[i].rcv)+'",' + &
            '"rcvnm":"' + escapestring(kakaomsg[i].rcvnm) + '",' + &					
            '"msg":"' + escapestring(kakaomsg[i].msg) + '",' + &
            '"altmsg":"' + escapestring(kakaomsg[i].altmsg) + '"}' 
    if i < upperbound(kakaomsg) then postData += ","
  next
  postData += '],'

  postData += '"btns":['
  for i = 1 to upperbound(kakaobutton)
    postData +=  '{"n":"'+escapestring(kakaobutton[i].n)+'",' + &
            '"t":"' + escapestring(kakaobutton[i].t) + '",' + &
            '"u1":"' + escapestring(kakaobutton[i].u1) + '",' + &
            '"u2":"' + escapestring(kakaobutton[i].u2) + '"}' 
    if i < upperbound(kakaobutton) then postData += ","
  next
  postData += ']'

  postData += '}'

  dic = httppostfiles("/FMS", corpnum, postData, {filepath}, "file", userid, {filename})
  receiptNum = dic.Item("receiptNum")
  dic.DisconnectObject()
  destroy dic

  return receiptNum
end function

public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception
	return cancelreserve(corpnum, receiptnum, "")
end function 

public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptnum) or receiptnum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

dic = httpget("/KakaoTalk/" + receiptnum + "/Cancel", corpnum, userid)
result.code = dic.item("code")
result.message = dic.item("message")
dic.DisconnectObject()
destroy dic 

return result
end function

public function response cancelreservern (string corpnum, string requestnum) throws popbillexception
	return cancelreservern(corpnum, requestnum, "")
end function 

public function response cancelreservern (string corpnum, string requestnum, string userid) throws popbillexception
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(requestnum) or requestnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")

dic = httpget("/KakaoTalk/Cancel/"+requestnum, corpnum, userid)
result.code = dic.item("code")
result.message = dic.item("message")
dic.DisconnectObject()
destroy dic 

return result
end function

public function kakaoResult getmessages (string corpnum, string receiptnum) throws popbillexception
	return getmessages (corpnum, receiptnum, "")
end function	

public function kakaoResult getmessages (string corpnum, string receiptnum, string userid) throws popbillexception
kakaoResult result
integer i
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptNum) or receiptNum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

dic = httpget("/KakaoTalk/" + receiptNum, corpnum, "")
result = tokakaoResult(dic)

return result
end function

public function kakaoResult getmessagesrn (string corpnum, string reqeustnum) throws popbillexception
	return getmessagesrn (corpnum, reqeustnum, "")
end function	

public function kakaoResult getmessagesrn (string corpnum, string reqeustnum, string userid) throws popbillexception
kakaoResult result
integer i
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(reqeustnum) or reqeustnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")

dic = httpget("/KakaoTalk/Get/" + reqeustnum, corpnum, "")
result = tokakaoResult(dic)

return result
end function

public function kakaoresult tokakaoresult (ref oleobject dic)
kakaoresult result
oleobject log

result.contentType = string(dic.Item("contentType"))
result.templateCode = string(dic.Item("templateCode"))
result.plusFriendID = string(dic.Item("plusFriendID"))
result.sendNum = string(dic.Item("sendNum"))
result.altContent = string(dic.Item("altContent"))
result.altSendType = string(dic.Item("altSendType"))
result.sendCnt = string(dic.Item("sendCnt"))
result.successCnt = string(dic.Item("successCnt"))
result.failCnt = string(dic.Item("failCnt"))
result.altCnt = string(dic.Item("altCnt"))
result.cancelCnt = string(dic.Item("cancelCnt"))
result.reserveDT = string(dic.Item("reserveDT"))
result.adsYN = dic.Item("adsYN")
result.imageURL = string(dic.Item("imageURL"))


integer i
oleobject btns[]

if not isnull(dic.Item("btns")) then
	btns = dic.Item("btns")
	for i = 1 to upperbound(btns)
		log = btns[i]
		result.btns[i].t = string(log.item("t"))
		result.btns[i].n = string(log.item("n"))
		result.btns[i].u1 = string(log.item("u1"))	
		result.btns[i].u2 = string(log.item("u2"))
		
		log.DisconnectObject()
		destroy log
	
	next
end if

oleobject msgs[]
if not isnull(dic.Item("msgs")) then
	msgs = dic.Item("msgs")
	
	for i = 1 to upperbound(msgs)
		log = msgs[i]
		result.msgs[i].state = string(log.item("state"))
		result.msgs[i].senddt = string(log.item("sendDT"))
		result.msgs[i].receivenum = string(log.item("receiveNum"))	
		result.msgs[i].receivename = string(log.item("receiveName"))
		result.msgs[i].content = string(log.item("content"))
		result.msgs[i].result = string(log.item("result"))
		result.msgs[i].resultdt = string(log.item("resultDT"))	
		result.msgs[i].altcontent = string(log.item("altContent"))
		result.msgs[i].altcontenttype = string(log.item("altContentType"))
		result.msgs[i].altsenddt = string(log.item("altSendDT"))
		result.msgs[i].altresult = string(log.item("altResult"))	
		result.msgs[i].altresultdt = string(log.item("altResultDT"))	
		result.msgs[i].receiptnum = string(log.item("receiptNum"))	
		result.msgs[i].requestnum = string(log.item("requestNum"))	
		
		log.DisconnectObject()
		destroy log
	
	next	
end if
return result
end function

public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage) throws popbillexception
	return search (corpnum, sdate, edate, state, item, reserveyn, senderyn, order, page, perpage, "")
end function

public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage, string userid) throws popbillexception
	return search (corpnum, sdate, edate, state, item, reserveyn, senderyn, order, page, perpage, userid, "")
end function

public function kakaosearchresult search (string corpnum, string sdate, string edate, string state[], string item[], string reserveyn, boolean senderyn, string order, int page, int perpage, string userid, string qstring) throws popbillexception
oleobject dic
string uri, tmpstr
int i
kakaosearchresult result

uri = "/KakaoTalk/Search"
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

uri += "&ReserveYN=" + reserveyn

if not isnull(senderyn) then
	if senderyn then uri += "&SenderYN=1"
	if not(senderyn) then uri += "&SenderYN=0"
end if

uri += "&Order=" + order
uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)

if not isnull(qstring) then uri += "&QString=" + urlencode(qstring)

dic = httpget(uri,corpnum,"")

result = tokakaosearchresult(dic)

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

public function kakaosearchresult tokakaosearchresult (ref oleobject dic)
kakaosearchresult result
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
	result.list[i].state = string(log.item("state"))
	result.list[i].senddt = string(log.item("sendDT"))
	result.list[i].result = string(log.item("result"))
	result.list[i].resultdt = string(log.item("resultDT"))
	result.list[i].contenttype = string(log.item("contentType"))
	result.list[i].receivenum = string(log.item("receiveNum"))
	result.list[i].receivename = string(log.item("receiveName"))
	result.list[i].content = string(log.item("content"))
	result.list[i].altContentType = string(log.item("altContentType"))
	result.list[i].altsenddt = string(log.item("altSendDT"))
	result.list[i].altresult = string(log.item("altResult"))
	result.list[i].altresultdt = string(log.item("altResultDT"))
	result.list[i].receiptNum = string(log.item("receiptNum"))
	result.list[i].requestNum = string(log.item("requestNum"))
	
	log.DisconnectObject()
	destroy log
	
next
end if

return result
end function

public function decimal getunitcost (string corpnum, string kakaotype) throws popbillexception
	return getunitcost (corpnum, kakaotype, "")
end function

public function decimal getunitcost (string corpnum, string kakaotype, string userid) throws popbillexception
decimal unitcost
oleObject result

if (kakaotype = "ATS" or kakaotype = "FTS" or kakaotype = "FMS" ) = false then throw exception.setCodeNMessage(-99999999,"메시지 유형이 올바르게 입력되지 않았습니다.")

result = httpget("/KakaoTalk/UnitCost?Type=" + kakaotype , corpnum, "")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

public function chargeinfo getchargeinfo (string corpnum, string kakaotype) throws popbillexception;
	return getchargeinfo(corpnum, kakaotype, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string kakaotype, string userid) throws popbillexception;
chargeinfo result
oleobject dic

dic = httpget("/KakaoTalk/ChargeInfo?Type="+kakaotype, corpnum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

on kakaoservice.create
call super::create
end on

on kakaoservice.destroy
call super::destroy
end on

event constructor;
call super::constructor;
addscope("153")
addscope("154")
addscope("155")
end event

