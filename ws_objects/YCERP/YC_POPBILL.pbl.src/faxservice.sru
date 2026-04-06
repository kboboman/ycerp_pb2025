$PBExportHeader$faxservice.sru
forward
global type faxservice from baseservice
end type
end forward

global type faxservice from baseservice
end type
global faxservice faxservice

forward prototypes
private function string requestfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception
private function string requestfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception


public function decimal getunitcost (string corpnum) throws popbillexception
public function string geturl (string corpnum,  string togo) throws popbillexception // geturl overload func
public function string geturl (string corpnum, string userid, string togo) throws popbillexception
public function string getSenderNumberMgtURL (string corpnum, string userid) throws popbillexception
public function string getSentListURL (string corpnum, string userid) throws popbillexception

public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception
public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception // cancelreserve overload 

public function response cancelreservern (string corpnum, string requestnum) throws popbillexception	// cancelreservern overload func
public function response cancelreservern (string corpnum, string requestnum, string userid) throws popbillexception

// senderName 미포함
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid) throws popbillexception
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid) throws popbillexception

// senderName 추가 
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid) throws popbillexception

// adsYN 추가
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN) throws popbillexception
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN) throws popbillexception

// SendFax - title 추가, 2017/07/20
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN, string title) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN, string title) throws popbillexception

// requestNum 추가 - 2018-08-07
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title, string requestNum ) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception
public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsYN, string title, string requestNum) throws popbillexception

// ResendFax 
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid) throws popbillexception

// ResendFax - title 추가, 2017/07/20
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string title) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string title) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title) throws popbillexception

// requestNum 추가 - 2018-08-07
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title, string requestnum) throws popbillexception
public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title, string requestnum) throws popbillexception

// ResendfaxRN - 2018-08-07
public function string resendfaxrn (string corpnum, string orgrequestnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title, string requestnum) throws popbillexception
public function string resendfaxrn (string corpnum, string orgrequestnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title, string requestnum) throws popbillexception


public subroutine getfaxresult (string corpnum, string receiptnum, ref faxresult ref_result[]) throws popbillexception
public subroutine getfaxresultrn (string corpnum, string requestnum, ref faxresult ref_result[]) throws popbillexception
public function faxsearchresult search (string corpnum, string sdate, string edate, string state[], boolean reserveyn, boolean senderonly, string order, int page, int perpage) throws popbillexception
public function faxsearchresult search (string corpnum, string sdate, string edate, string state[], boolean reserveyn, boolean senderonly, string order, int page, int perpage, string qstring) throws popbillexception
public function faxsearchresult tofaxsearchresult (ref oleobject dic)
public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception
public subroutine getsendernumberlist (string corpnum, ref sendernumber ref_list[]) throws popbillexception
public function string getpreviewurl (string coprnum, string receiptnum, string userid) throws popbillexception

end prototypes

public function string requestfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	return requestfax(corpnum, sendnum, sendername, receivers[], filepaths[], filename[], reservedt, userid, adsyn, title, "")
end function

public function string requestfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestNum) throws popbillexception;
oleobject dic
string receiptNum,postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receivers) or upperbound(receivers) <= 0 then throw exception.setcodenMessage(-99999999,"수신자 정보가 입력되지 않았습니다.")
if isnull(filepaths) or upperbound(filepaths) <= 0 then throw exception.setcodenMessage(-99999999,"전송파일 경로가 입력되지 않았습니다.")
if upperbound(filepaths)  > 20 then throw exception.setcodenMessage(-99999999,"동시 전송파일은 최대 20개입니다.")

postData = '{'
if adsyn then postData += '"adsYN":true,'
if (isnull(sendnum) or sendnum = "") = false then postData += '"snd":"' + escapestring(sendnum) + '",'
if (isnull(sendername) or sendername = "") = false then postData += '"sndnm":"' + escapestring(sendername) + '",'
if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
if (isnull(title) or title = "") = false then postData += '"title":"' + escapestring(title) + '",'
if (isnull(requestnum) or requestnum = "") = false then postData += '"requestNum":"' + escapestring(requestNum) + '",'
postData += '"fCnt":"' + string(upperbound(filepaths)) + '",'

postData += '"rcvs":['
integer i

for i = 1 to upperbound(receivers)
	postData += '{"rcv":"' + escapestring(receivers[i].receivenum) + '",' + &
					'"rcvnm":"' + escapestring(receivers[i].receivename) + '"}'
				
	if i < upperbound(receivers) then postData += ","
next

postData += ']'

postData += '}'

dic = httppostfiles("/FAX" ,corpnum, postData,filepaths, "file", userid, filename)
receiptNum = dic.Item("receiptNum")
dic.DisconnectObject()
destroy dic

return receiptNum
end function

public function decimal getunitcost (string corpnum) throws popbillexception;decimal unitcost
oleObject result

result = httpget("/FAX/UnitCost" , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

public function string geturl (string corpnum, string togo) throws popbillexception;
	return geturl(corpnum, "", togo)
end function 

public function string geturl (string corpnum, string userid, string togo) throws popbillexception;string url
oleObject result

result = httpget("/FAX/?TG=" + togo , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getSenderNumberMgtURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/FAX/?TG=SENDER", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getSentListURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/FAX/?TG=BOX", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function response cancelreserve (string corpnum, string receiptnum) throws popbillexception;
	return cancelreserve(corpnum, receiptnum, "")
end function 

public function response cancelreserve (string corpnum, string receiptnum, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptnum) or receiptnum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

dic = httpget("/FAX/" + receiptNum + "/Cancel" ,corpnum,userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response cancelreservern (string corpnum, string requestnum) throws popbillexception;
	return cancelreservern(corpnum, requestnum, "")
end function

public function response cancelreservern (string corpnum, string requestnum, string userid) throws popbillexception;
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(requestnum) or requestnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")

dic = httpget("/FAX/Cancel/"+requestnum ,corpnum,userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid) throws popbillexception;
	return requestfax(corpnum, sendnum, "", receivers, filepaths, filename, reservedt, userid, false, "")
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid) throws popbillexception;faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, "", l_receivers,filepaths,filename,reservedt,userid,false,"")
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	
	return requestfax(corpnum, sendnum, "", l_receivers,{filepath},{filename},reservedt,userid,false,"")
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid) throws popbillexception;
	return requestfax(corpnum,sendnum, "", receivers,{filepath},{filename},reservedt,userid,false,"")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid) throws popbillexception;
	return requestfax(corpnum, sendnum, sendername, receivers, filepaths, filename, reservedt, userid, false, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid) throws popbillexception;faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, sendername, l_receivers,filepaths,filename,reservedt,userid,false, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	return requestfax(corpnum, sendnum, sendername, l_receivers,{filepath},{filename},reservedt,userid,false, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid) throws popbillexception;
	return requestfax(corpnum,sendnum, sendername, receivers,{filepath},{filename},reservedt,userid,false, "")
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn) throws popbillexception;
	return requestfax(corpnum, sendnum, "", receivers, filepaths, filename, reservedt, userid, adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn) throws popbillexception;faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, "", l_receivers,filepaths,filename,reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	
	return requestfax(corpnum, sendnum, "", l_receivers,{filepath},{filename},reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn) throws popbillexception;
	return requestfax(corpnum,sendnum, "", receivers,{filepath},{filename},reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn) throws popbillexception;
	return requestfax(corpnum, sendnum, sendername, receivers, filepaths, filename, reservedt, userid, adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn) throws popbillexception;faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, sendername, l_receivers,filepaths,filename,reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	return requestfax(corpnum, sendnum, sendername, l_receivers,{filepath},{filename},reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn) throws popbillexception;
	return requestfax(corpnum,sendnum, sendername, receivers,{filepath},{filename},reservedt,userid,adsyn, "")
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	return requestfax(corpnum, sendnum, "", receivers, filepaths, filename, reservedt, userid, adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception;faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, "", l_receivers,filepaths,filename,reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	
	return requestfax(corpnum, sendnum, "", l_receivers,{filepath},{filename},reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	return requestfax(corpnum,sendnum, "", receivers,{filepath},{filename},reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	return requestfax(corpnum, sendnum, sendername, receivers, filepaths, filename, reservedt, userid, adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
faxreceiver l_receivers[]

l_receivers[1].receivenum = receivenum
l_receivers[1].receivename = receivename

return requestfax(corpnum,sendnum, sendername, l_receivers,filepaths,filename,reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	return requestfax(corpnum, sendnum, sendername, l_receivers,{filepath},{filename},reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn, string title) throws popbillexception;
	return requestfax(corpnum,sendnum, sendername, receivers,{filepath},{filename},reservedt,userid,adsyn, title)
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	return requestfax(corpnum, sendnum, "", receivers, filepaths, filename, reservedt, userid, adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
  faxreceiver l_receivers[]
  l_receivers[1].receivenum = receivenum
  l_receivers[1].receivename = receivename
  return requestfax(corpnum,sendnum, "", l_receivers,filepaths,filename,reservedt,userid,adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	return requestfax(corpnum, sendnum, "", l_receivers,{filepath},{filename},reservedt,userid,adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	return requestfax(corpnum,sendnum, "", receivers,{filepath},{filename},reservedt,userid,adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	return requestfax(corpnum, sendnum, sendername, receivers, filepaths, filename, reservedt, userid, adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepaths[], string filename[], string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
  faxreceiver l_receivers[]
  l_receivers[1].receivenum = receivenum
  l_receivers[1].receivename = receivename
  return requestfax(corpnum,sendnum, sendername, l_receivers,filepaths,filename,reservedt,userid,adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, string receivenum, string receivename, string filepath, string filename, string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	faxreceiver l_receivers[]
	l_receivers[1].receivenum = receivenum
	l_receivers[1].receivename = receivename
	return requestfax(corpnum, sendnum, sendername, l_receivers,{filepath},{filename},reservedt,userid,adsyn, title, requestnum)
end function

public function string sendfax (string corpnum, string sendnum, string sendername, faxreceiver receivers[], string filepath, string filename, string reservedt, string userid, boolean adsyn, string title, string requestnum) throws popbillexception;
	return requestfax(corpnum,sendnum, sendername, receivers,{filepath},{filename},reservedt,userid,adsyn, title, requestnum)
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivenum, receivename, reservedt, "", "", "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string title) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivenum, receivename, reservedt, "", title, "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivers, reservedt, "", "", "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string title) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivers, reservedt, "", title, "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivenum, receivename, reservedt, userid, title, "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title) throws popbillexception;
	return resendfax(corpnum, receiptnum, sendnum, sendername, receivers, reservedt, userid, title, "")
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title, string requestnum) throws popbillexception;
  faxreceiver l_receivers[]

  if NOT (( isnull(receivenum) or ( receivenum = "") ) and ( isnull(receivename) or (receivename = ""))) then
  	l_receivers[1].receivenum = receivenum
  	l_receivers[1].receivename = receivename
  else
  	faxreceiver empty_receiver[]
  	l_receivers = empty_receiver
  end if

  return resendfax(corpnum, receiptnum, sendnum, sendername, l_receivers, reservedt, userid, title, requestnum)
end function

public function string resendfax (string corpnum, string receiptnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title, string requestnum) throws popbillexception;
	oleobject dic
	string resReceiptNum,postData
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	if isnull(receiptnum) or receiptnum = "" then throw exception.setCodeNMessage(-99999999,"접수번호(receiptNum)가 입력되지 않았습니다.")
	
	postData = '{'
	
	if (isnull(sendnum) or sendnum = "") = false then postData += '"snd":"' + escapestring(sendnum) + '",'
	if (isnull(sendername) or sendername = "") = false then postData += '"sndnm":"' + escapestring(sendername) + '",'
	if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
	if (isnull(title) or title = "") = false then postData += '"title":"' + escapestring(title) + '",'
	if (isnull(requestnum) or requestnum = "") = false then postData += '"requestnum":"' + escapestring(requestnum) + '",'
	
	if (isnull(receivers) = false) then 
		postData += '"rcvs":['
		integer i
		
		for i = 1 to upperbound(receivers)
			postData += '{"rcv":"' + escapestring(receivers[i].receivenum) + '",' + &
							'"rcvnm":"' + escapestring(receivers[i].receivename) + '"}'
						
			if i < upperbound(receivers) then postData += ","
		next
		
		postData += ']'
	end if 
	
	postData += '}'
	
	dic = httppost("/FAX/" + receiptnum , corpnum, postData, userid)
	resReceiptNum = dic.Item("receiptNum")
	dic.DisconnectObject()
	destroy dic
	
	return resReceiptNum
end function

public function string resendfaxrn (string corpnum, string orgrequestnum, string sendnum, string sendername, string receivenum, string receivename, string reservedt, string userid, string title, string requestnum) throws popbillexception
  faxreceiver l_receivers[]

  if NOT (( isnull(receivenum) or ( receivenum = "") ) and ( isnull(receivename) or (receivename = ""))) then
    l_receivers[1].receivenum = receivenum
    l_receivers[1].receivename = receivename
  else
    faxreceiver empty_receiver[]
    l_receivers = empty_receiver
  end if

  return resendfaxrn(corpnum, orgrequestnum, sendnum, sendername, l_receivers, reservedt, userid, title, requestnum)
end function

public function string resendfaxrn (string corpnum, string orgrequestnum, string sendnum, string sendername, faxreceiver receivers[], string reservedt, string userid, string title, string requestnum) throws popbillexception
  oleobject dic
  string resReceiptNum,postData

  if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
  if isnull(orgrequestnum) or orgrequestnum = "" then throw exception.setCodeNMessage(-99999999,"원본 팩스 요청번호가 입력되지 않았습니다.")

  postData = '{'

  if (isnull(sendnum) or sendnum = "") = false then postData += '"snd":"' + escapestring(sendnum) + '",'
  if (isnull(sendername) or sendername = "") = false then postData += '"sndnm":"' + escapestring(sendername) + '",'
  if (isnull(reservedt) or reservedt = "") = false then postData += '"sndDT":"' + escapestring(reservedt) + '",'
  if (isnull(title) or title = "") = false then postData += '"title":"' + escapestring(title) + '",'
  if (isnull(requestnum) or requestnum = "") = false then postData += '"requestnum":"' + escapestring(requestnum) + '",'

  if Not IsNull(receivers) then 
    postData += '"rcvs":['
    integer i
    for i = 1 to upperbound(receivers)
      postData += '{"rcv":"' + escapestring(receivers[i].receivenum) + '",' + &
              '"rcvnm":"' + escapestring(receivers[i].receivename) + '"}'
            
      if i < upperbound(receivers) then postData += ","
    next
    postData += ']'
  end if

  postData += '}'

  dic = httppost("/FAX/Resend/" + orgrequestnum, corpnum, postData, userid)
  resReceiptNum = dic.Item("receiptNum")
  dic.DisconnectObject()
  destroy dic

  return resReceiptNum
end function

public subroutine getfaxresult (string corpnum, string receiptnum, ref faxresult ref_result[]) throws popbillexception;
any dicList[]
integer i, j 
oleobject log
any response
tarray result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(receiptNum) or receiptNum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")

try 
	response = httpget("/FAX/" + receiptNum ,corpnum,"")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		log = result.list[i]
		ref_result[i].state = integer(log.item("state"))
		ref_result[i].result = integer(log.item("result"))
		ref_result[i].title = string(log.item("title"))
		
		ref_result[i].sendstate = log.item("sendState")
		ref_result[i].convstate = log.item("convState")
		ref_result[i].sendNum = string(log.item("sendNum"))
		ref_result[i].senderName = string(log.item("senderName"))
		ref_result[i].receiveNum = string(log.item("receiveNum"))
		ref_result[i].receiveName = string(log.item("receiveName"))
	
		ref_result[i].sendPageCnt = integer(log.item("sendPageCnt"))
		ref_result[i].successPageCnt = integer( log.item("successPageCnt"))
		ref_result[i].failPageCnt = integer(log.item("failPageCnt"))
		ref_result[i].refundPageCnt = integer(log.item("refundPageCnt"))
		ref_result[i].cancelPageCnt =integer( log.item("cancelPageCnt"))
		
		ref_result[i].receiptDT= string( log.item("receiptDT"))
		ref_result[i].reserveDT = string(log.item("reserveDT"))
		ref_result[i].sendDT = string(log.item("sendDT"))
		ref_result[i].resultDT = string(log.item("resultDT"))
		ref_result[i].sendResult = string(log.item("sendResult"))
		ref_result[i].receiptNum = string(log.item("receiptNum"))
		ref_result[i].requestNum = string(log.item("requestNum"))
		ref_result[i].chargePageCnt = string(log.item("chargePageCnt"))
		ref_result[i].tiffFileSize = string(log.item("tiffFileSize"))
		
		string fileNames[]
		fileNames= log.Item("fileNames")
	
		for j = 1 to upperbound(fileNames)
			ref_result[i].fileNames[j]= fileNames[j]
		next
	
		log.DisconnectObject()
		destroy log
		
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public subroutine getfaxresultrn (string corpnum, string requestnum, ref faxresult ref_result[]) throws popbillexception;
any dicList[]
integer i, j 
oleobject log
any response
tarray result
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	if isnull(requestnum) or requestnum = "" then throw exception.setCodeNMessage(-99999999,"요청번호가 입력되지 않았습니다.")

	try 
		response = httpget("/FAX/Get/" + requestnum ,corpnum,"")
		result = create tarray
		result = response
		
		for i = 1 to result.getLength()
			log = result.list[i]
			ref_result[i].state = integer(log.item("state"))
			ref_result[i].result = integer(log.item("result"))
			ref_result[i].title = string(log.item("title"))
			
			ref_result[i].sendstate = log.item("sendState")
			ref_result[i].convstate = log.item("convState")
			ref_result[i].sendNum = string(log.item("sendNum"))
			ref_result[i].senderName = string(log.item("senderName"))
			ref_result[i].receiveNum = string(log.item("receiveNum"))
			ref_result[i].receiveName = string(log.item("receiveName"))
		
			ref_result[i].sendPageCnt = integer(log.item("sendPageCnt"))
			ref_result[i].successPageCnt = integer( log.item("successPageCnt"))
			ref_result[i].failPageCnt = integer(log.item("failPageCnt"))
			ref_result[i].refundPageCnt = integer(log.item("refundPageCnt"))
			ref_result[i].cancelPageCnt =integer( log.item("cancelPageCnt"))
			
			ref_result[i].receiptDT= string( log.item("receiptDT"))
			ref_result[i].reserveDT = string(log.item("reserveDT"))
			ref_result[i].sendDT = string(log.item("sendDT"))
			ref_result[i].resultDT = string(log.item("resultDT"))
			ref_result[i].sendResult = string(log.item("sendResult"))
			ref_result[i].receiptNum = string(log.item("receiptNum"))
			ref_result[i].requestNum = string(log.item("requestNum"))
			ref_result[i].chargePageCnt = string(log.item("chargePageCnt"))
			ref_result[i].tiffFileSize = string(log.item("tiffFileSize"))
			
			string fileNames[]
			fileNames= log.Item("fileNames")
		
			for j = 1 to upperbound(fileNames)
				ref_result[i].fileNames[j]= fileNames[j]
			next
		
			log.DisconnectObject()
			destroy log
			
		next
	
	catch (linkhubexception le)
		throw exception.setcodenmessage(le.getcode(), le.getmessage())
	end try

end subroutine

public function faxsearchresult search (string corpnum, string sdate, string edate, string state[], boolean reserveyn, boolean senderonly, string order, int page, int perpage) throws popbillexception;
return search(corpnum, sdate, edate, state, reserveyn, senderonly, order, page, perpage, "")
end function

public function faxsearchresult search (string corpnum, string sdate, string edate, string state[], boolean reserveyn, boolean senderonly, string order, int page, int perpage, string qstring) throws popbillexception;

oleobject dic
string uri, tmpstr
int i
faxsearchresult result

uri = "/FAX/Search"
uri += "?SDate=" + sdate
uri += "&EDate=" + edate

tmpstr = ""
for i = 1 to upperbound(state)
	tmpstr += state[i] 
	if i < upperbound(state) then tmpstr+= ','
next
uri += "&State=" + tmpstr

if not isnull(reserveyn) then
	if reserveyn then uri += "&ReserveYN=1"
	if not(reserveyn) then uri += "&ReserveYN=0"
end if

if not isnull(senderonly) then
	if senderonly then uri += "&SenderOnly=1"
	if not(senderonly) then uri += "&SenderOnly=0"
end if

uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
uri += "&Order=" + order

if not isnull(qstring) then uri += "&QString=" + urlencode(qstring)

dic = httpget(uri,corpnum,"")

result = tofaxsearchresult(dic)
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

public function faxsearchresult tofaxsearchresult (ref oleobject dic);
faxsearchresult result
oleobject log

result.code = string(dic.Item("code"))
result.message = string(dic.Item("message"))
result.total = string(dic.Item("total"))
result.perPage = string(dic.Item("perPage"))
result.pageNum = string(dic.Item("pageNum"))
result.pageCount = string(dic.Item("pageCount"))

Integer i, j
oleobject list[]

if not isnull(dic.Item("list")) then
list = dic.Item("list")

for i = 1 to upperbound(list)
	log = list[i]
	result.list[i].sendState = log.item("sendState")
	result.list[i].convState = log.item("convState")
	result.list[i].sendNum = string(log.item("sendNum"))
	result.list[i].senderName = string(log.item("senderName"))
	result.list[i].receiveNum = string(log.item("receiveNum"))
	result.list[i].receiveName = string(log.item("receiveName"))
	result.list[i].sendPageCnt = integer(log.item("sendPageCnt"))
	result.list[i].successPageCnt = integer(log.item("successPageCnt"))
	result.list[i].failPageCnt = integer(log.item("failPageCnt"))
	result.list[i].refundPageCnt = integer(log.item("refundPageCnt"))
	result.list[i].cancelPageCnt = integer(log.item("cancelPageCnt"))
	result.list[i].receiptDT = string(log.item("receiptDT"))
	result.list[i].reserveDT = string(log.item("reserveDT"))
	result.list[i].sendDT = string(log.item("sendDT"))
	result.list[i].resultDT = string(log.item("resultDT"))
	result.list[i].sendResult = string(log.item("sendResult"))
	result.list[i].receiptNum = string(log.item("receiptNum"))
	result.list[i].requestNum = string(log.item("requestNum"))
	result.list[i].chargePageCnt = string(log.item("chargePageCnt"))
	result.list[i].tiffFileSize = string(log.item("tiffFileSize"))
	
	string fileNames[]
	fileNames= log.Item("fileNames")

	for j = 1 to upperbound(fileNames)
		result.list[i].fileNames[j]= fileNames[j]
	next
	
	log.DisconnectObject()
	destroy log
next
end if

return result
end function

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/FAX/ChargeInfo", CorpNum, userid)
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

	dicList = httpget("/FAX/SenderNumber",corpnum,"")
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

public function string getpreviewurl (string coprnum, string receiptnum, string userid) throws popbillexception
	if isnull(receiptnum) or receiptnum = "" then throw exception.setCodeNMessage(-99999999,"접수번호가 입력되지 않았습니다.")
	string url
	oleObject result
	
	result = httpget("/FAX/Preview/" + receiptnum , coprnum, Userid)
	url = result.Item("url")
	result.DisconnectObject()
	destroy result
	
	return url
end function

on faxservice.create
call super::create
end on

on faxservice.destroy
call super::destroy
end on

event constructor;call super::constructor;addscope("160")
end event

