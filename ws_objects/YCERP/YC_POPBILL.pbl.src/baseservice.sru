$PBExportHeader$baseservice.sru
forward
global type baseservice from nonvisualobject
end type
end forward

global type baseservice from nonvisualobject
end type
global baseservice baseservice

type prototypes
FUNCTION long WideCharToMultiByte(ulong CodePage, ulong dwFlags, ref blob lpWideCharStr, long cchWideChar, ref blob lpMultiByteStr, long cbMultiByte, long lpDefaultChar,long lpUsedDefaultChar) Library "kernel32.dll" 
FUNCTION long MultiByteToWideChar(ulong CodePage, ulong dwFlags, ref blob lpMultiByteStr,long cchMultiByte,ref blob lpWideCharStr,  long cchWideChar) LIBRARY "kernel32.dll"
end prototypes

type variables
private:
Constant String ServiceID_REAL = "POPBILL"
constant string serviceID_TEST = "POPBILL_TEST"
constant string ServiceURL_REAL = "https://popbill.linkhub.co.kr"
constant string ServiceURL_TEST = "https://popbill-test.linkhub.co.kr"
constant string APIVersion = "1.0"

protected:
token in_token
string in_curCorpNum
boolean in_IsTest
boolean in_IPRestrictOnOff
authority in_authority
string scopes[]
popbillexception exception
linkhubexception leexceteption
public:
string linkID
string secretKey

end variables

forward prototypes
private function authority getauthority () throws popbillexception
protected function string getserviceid ()
protected function string getserviceurl ()
protected subroutine addscope (string scope)
public subroutine setistest (boolean istest)
public subroutine setIPRestrictOnOff (boolean IPRestrictOnOff)
public function double getbalance (string corpnum) throws popbillexception
private function string getsessiontoken (string corpnum, string forwardip) throws popbillexception
public function string getpartnerurl (string corpnum, string togo) throws popbillexception
public function string getpopbillurl (string corpnum, string togo) throws popbillexception	// getpopbillurl overload func 
public function string getpopbillurl (string corpnum, string userid, string togo) throws popbillexception
public function string getAccessURL (string corpnum, string userid) throws popbillexception
public function string getChargeURL (string corpnum, string userid) throws popbillexception
public function double getpartnerbalance (string corpnum) throws popbillexception
public function response joinmember (ref joinform joininfo) throws popbillexception
private function string joinformtostring (readonly joinform joininfo)
public subroutine listcontact(string corpnum, ref contact ref_returnlist[]) throws popbillexception	// listcontact overload func
public subroutine listcontact(string corpnum, string userid, ref contact ref_returnlist[]) throws popbillexception
public function response updatecontact (string corpnum, ref contact contactinfo, string userid) throws popbillexception
private function string contactInfoToString (readonly contact contactInfo)
public function response registcontact(string corpnum, ref contact contactinfo) throws popbillexception	// registcontact overload func
public function response registcontact(string corpnum, ref contact contactinfo, string userid) throws popbillexception
public function corpinfo getcorpinfo(string corpnum) throws popbillexception	// getcorpinfo overload func
public function corpinfo getcorpinfo(string corpnum, string userid) throws popbillexception
public function response updatecorpinfo(string corpnum, ref corpinfo corpinfoObj) throws popbillexception	// updatecorpinfo overload func
public function response updatecorpinfo(string corpnum, ref corpinfo corpinfoObj, string userid) throws popbillexception
private function string corpInfotoString (readonly corpInfo corpInfoObj)
public function response checkID(string id) throws popbillexception;
private function corpInfo tocorpInfo(ref oleobject dic)
public function chargeinfo tochargeinfo(ref oleobject dic)
public function jobstate tojobstate(ref oleobject dic)

protected function string escapestring (readonly string input)
public function response checkismember (string corpnum, string a_linkid) throws popbillexception
protected function any parsejson (string inputjson) throws popbillexception
private function contact toContactInfo (ref oleobject dic)
protected function any httpget (string url, string corpnum, string userid) throws popbillexception
protected function any httppost (string url, string corpnum, string postdata, string userid, string action, string contentstype) throws popbillexception
protected function any httppost (string url, string corpnum, string postdata, string userid, string action) throws popbillexception
public function any httppost (string url, string corpnum, string postdata, string userid) throws popbillexception
protected function oleobject httppostfiles (string url, string corpnum, string postdata, string postfiles[], string fieldname, string userid, string filename[]) throws popbillexception
protected function string of_replaceall (string as_oldstring, string as_findstr, string as_replace)
protected function blob ansiToUtf8Blob(string as_ansi)
public function string urlencode(string target)

end prototypes

private function authority getauthority () throws popbillexception;if isnull(in_authority) then
	if isnull(linkid) or linkID = "" then throw exception.setCodeNMessage(-99999999,"링크아이디가 입력되지 않았습니다.")
	if isnull(secretKey) or secretKey = "" then throw exception.setCodeNMessage(-99999999,"비밀키가 입력되지 않았습니다.")
	in_authority = create authority
	in_authority.linkid = linkid
	in_authority.secretkey = secretKey
end if

return in_authority
end function

protected function string getserviceid ();if in_istest then 
	return serviceid_test
else 
	return serviceid_real
end if
end function

protected function string getserviceurl ();if in_istest then
	return serviceurl_test
else
	return serviceurl_real
end if
end function

protected subroutine addscope (string scope);scopes[UpperBound(scopes)+1] = scope
end subroutine

public subroutine setistest (boolean istest);in_IsTest = istest
end subroutine

public subroutine setIPRestrictOnOff (boolean IPRestrictOnOff);
in_IPRestrictOnOff = IPRestrictOnOff
end subroutine

public function double getbalance (string corpnum) throws popbillexception;try
	return  getAuthority().getBalance(getsessionToken(corpnum,""),getServiceID())
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end function

private function string getsessiontoken (string corpnum, string forwardip) throws popbillexception;if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")

boolean changed,expired
expired = true

changed = in_curCorpNum <> corpnum

DateTime now

if not changed and isnull(in_token) = false then
	try 
		now = DateTime(date(MidA(getAuthority().getTime(),1,10)) ,time( MidA(getAuthority().getTime(),12,8)))
	catch (linkhubexception ex)
		throw exception.setCodeNMessage(ex.getcode(),ex.getmessage())
	end try
	expired = DateTime(date(MidA(in_token.expiration,1,10)) ,time( MidA(in_token.expiration,12,8))) <  now
end if

if expired then
	try
		if in_IPRestrictOnOff then
			in_token = getauthority().gettoken(getServiceID(),CorpNum,scopes,forwardip)			
		else
			in_token = getauthority().gettoken(getServiceID(),CorpNum,scopes,"*")		
		end if

	catch (linkhubexception le)
		in_curCorpNum = ""
		throw exception.setCodeNMessage(le.getcode(),le.getmessage())
	end try
	in_curCorpNUm = corpNum
end if

return in_token.session_token
end function

public function string getpartnerurl (string corpnum, string togo) throws popbillexception;
	try
		return  getAuthority().getpartnerurl(getsessionToken(corpnum,""),getServiceID(), togo)
	catch(linkhubexception le)
		throw exception.setcodenmessage(le.getcode(),le.getmessage())
	end try
end function

public function string getpopbillurl (string corpnum, string togo) throws popbillexception;
	return getpopbillurl(corpnum, "", togo)
end function

public function string getpopbillurl (string corpnum, string userid, string togo) throws popbillexception;string url
oleObject result

result = httpget("/?TG=" + togo , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getAccessURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/?TG=LOGIN", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getChargeURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/?TG=CHRG", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function double getpartnerbalance (string corpnum) throws popbillexception;try
	return  getAuthority().getPartnerBalance(getsessionToken(corpnum,""),getServiceID())
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end function

public function response joinmember (ref joinform joininfo) throws popbillexception;response result
oleobject dic

String postData

postData = joinFormToString(joinInfo)

dic = httppost("/Join","",postData,"")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function string joinformtostring (readonly joinform joininfo);
string result
result = ""

result += "{"
result += '"LinkID":"' + escapeString(joininfo.LinkID) + '",'
result += '"CorpNum":"' + escapeString(joininfo.CorpNum) + '",'
result += '"CEOName":"' + escapeString(joininfo.CEOName) + '",'
result += '"CorpName":"' + escapeString(joininfo.CorpName) + '",'
result += '"Addr":"' + escapeString(joininfo.Addr) + '",'
result += '"ZipCode":"' + escapeString(joininfo.ZipCode) + '",'
result += '"BizType":"' + escapeString(joininfo.BizType) + '",'
result += '"BizClass":"' + escapeString(joininfo.BizClass) + '",'
result += '"ContactName":"' + escapeString(joininfo.ContactName) + '",'
result += '"ContactEmail":"' + escapeString(joininfo.ContactEmail) + '",'
result += '"ContactTEL":"' + escapeString(joininfo.ContactTEL) + '",'
result += '"ContactHP":"' + escapeString(joininfo.ContactHP) + '",'
result += '"ContactFAX":"' + escapeString(joininfo.ContactFAX) + '",'
result += '"ID":"' + escapeString(joininfo.ID) + '",'
result += '"PWD":"' + escapeString(joininfo.PWD) + '"'
result += "}"

return result
end function

public subroutine listcontact(string corpnum, ref contact ref_returnlist[]) throws popbillexception;
try 
oleobject infoDic
Integer i

any response
response = httpget("/IDs"  ,corpnum, "")
tarray result
result = create tarray
result = response
integer resultLength
resultLength = result.getLength()

for i = 1 to resultLength
	infoDic = result.list[i]
	ref_returnlist[i] = toContactInfo(infodic)
	
	infoDic.DisconnectObject()
	destroy infoDic
next
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public subroutine listcontact(string corpnum, string userid, ref contact ref_returnlist[]) throws popbillexception;
try 
oleobject infoDic
Integer i

any response
response = httpget("/IDs"  ,corpnum,userid)
tarray result
result = create tarray
result = response
integer resultLength
resultLength = result.getLength()

for i = 1 to resultLength
	infoDic = result.list[i]
	ref_returnlist[i] = toContactInfo(infodic)
	
	infoDic.DisconnectObject()
	destroy infoDic
next
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function response updatecontact(string corpnum, ref contact contactinfo, string userid) throws popbillexception;
response result
oleobject dic

String postData

postData = contactInfoToString(contactInfo)

dic = httppost("/IDs", corpnum, postData, userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function string contactInfoToString (readonly contact contactInfo);//contactInfo to jsonString
string result
result = ""

result += "{"
if contactInfo.searchAllAllowYN then
result += '"searchAllAllowYN":true,'
end if
if contactInfo.mgrYN then
result += '"mgrYN":true,'
end if
result += '"id":"' + escapeString(contactInfo.id) + '",'
result += '"personName":"' + escapeString(contactInfo.personName) + '",'
result += '"email":"' + escapeString(contactInfo.email) + '",'
result += '"tel":"' + escapeString(contactInfo.tel) + '",'
result += '"hp":"' + escapeString(contactInfo.hp) + '",'
result += '"fax":"' + escapeString(contactInfo.fax) + '",'
result += '"pwd":"' + escapeString(contactInfo.pwd) + '",'
result += '"email":"' + escapeString(contactInfo.email) + '"'
result += "}"

return result
end function

public function response registcontact(string corpnum, ref contact contactinfo) throws popbillexception;
	return registcontact(corpnum, contactinfo, "")
end function 

public function response registcontact(string corpnum, ref contact contactinfo, string userid) throws popbillexception;
response result
oleobject dic

String postData

postData = contactInfoToString(contactInfo)

dic = httppost("/IDs/New", corpnum, postData, userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function corpinfo getcorpinfo(string corpnum) throws popbillexception;
	return getcorpinfo(corpnum, "") 
end function 

public function corpinfo getcorpinfo(string corpnum, string userid) throws popbillexception;
corpInfo result
oleobject dic 
dic = httpget("/CorpInfo",corpnum, userid)
result = tocorpinfo(dic)
dic.DisconnectObject()
destroy dic
return result
end function

public function response updatecorpinfo(string corpnum, ref corpinfo corpinfoObj) throws popbillexception
	return updatecorpinfo(corpnum, corpinfoObj, "")
end function 

public function response updatecorpinfo(string corpnum, ref corpinfo corpinfoObj, string userid) throws popbillexception
response result
oleobject dic

String postData

postData = corpInfotoString(corpInfoObj)

dic = httppost("/CorpInfo", corpnum, postData, userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function string corpInfotoString (readonly corpInfo corpInfoObj);//corpInfo to jsonString
string result
result = ""

result += "{"
result += '"ceoname":"' + escapeString(corpInfoObj.ceoname) + '",'
result += '"corpName":"' + escapeString(corpInfoObj.corpName) + '",'
result += '"addr":"' + escapeString(corpInfoObj.addr) + '",'
result += '"bizType":"' + escapeString(corpInfoObj.bizType) + '",'
result += '"bizClass":"' + escapeString(corpInfoObj.bizClass) + '"'
result += "}"

return result
end function

public function response checkID(string id) throws popbillexception;
response result
oleObject dic

dic = httpget("/IDCheck?ID="+id ,"","")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function corpInfo tocorpInfo(ref oleobject dic);
corpInfo result
result.ceoname = string(dic.Item("ceoname"))
result.corpName = string(dic.Item("corpName"))
result.addr = string(dic.Item("addr"))
result.bizType = string(dic.Item("bizType"))
result.bizClass = string(dic.Item("bizClass"))
return result
end function

public function chargeinfo tochargeinfo(ref oleobject dic);
chargeinfo result
result.unitCost = string(dic.Item("unitCost"))
result.chargeMethod = string(dic.Item("chargeMethod"))
result.rateSystem = string(dic.Item("rateSystem"))
return result
end function

public function jobstate tojobstate(ref oleobject dic);
jobstate result
result.jobid = string(dic.Item("jobID"))
result.jobState = int(dic.Item("jobState"))
result.queryType = string(dic.Item("queryType"))
result.queryStDate = string(dic.Item("queryStDate"))
result.queryEnDate = string(dic.Item("queryEnDate"))
result.queryDateType = string(dic.Item("queryDateType"))
result.errorCode = long(dic.Item("errorCode"))
result.errorReason = string(dic.Item("errorReason"))
result.jobStartDT = string(dic.Item("jobStartDT"))
result.jobEndDT = string(dic.Item("jobEndDT"))
result.collectCount = long(dic.Item("collectCount"))
result.regDT = string(dic.Item("regDT"))
return result
end function

protected function string escapestring (readonly string input);
string result

result = input

// null 처리 추가 (2017/08/24)
if IsNull(result) THEN result = ""

result = of_replaceall(result,'\','\\')
result = of_replaceall(result,'/','\/')
result = of_replaceall(result,'"','\"')
result = of_replaceall(result,"'","\'")
result = of_replaceall(result,'~b','\b')
result = of_replaceall(result,'~t','\t')
result = of_replaceall(result,'~n','\n')
result = of_replaceall(result,'~f','\f')
result = of_replaceall(result,'~r','\r')

return result
end function

public function response checkismember (string corpnum, string a_linkid) throws popbillexception;response result
oleObject dic

dic = httpget("/Join?CorpNum=" + CorpNum + "&LID=" + a_linkid ,"","")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

protected function any parsejson (string inputjson) throws popbillexception;try
	return getauthority().parsejson(inputjson)
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try
end function

private function contact toContactInfo (ref oleobject dic);
contact result

result.id = string(dic.Item("id"))
result.personName = string(dic.Item("personName"))
result.email = string(dic.Item("email"))
result.hp = string(dic.Item("hp"))
result.fax = string(dic.Item("fax"))
result.tel = string(dic.Item("tel"))
result.regDT = string(dic.Item("regDT"))
result.mgrYN = dic.Item("mgrYN")
result.searchAllAllowYN =  dic.Item("searchAllAllowYN")
result.state = string(dic.Item("state"))
return result
end function

protected function any httpget (string url, string corpnum, string userid) throws popbillexception;OLEObject lo_httpRequest,dic
any anyReturn
string ls_result

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("MSXML2.XMLHTTP.6.0") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("GET",getServiceURL() + url,false)
if (isnull(corpnum) or corpnum = "") = false then
	lo_httpRequest.setRequestHeader("Authorization","Bearer " + getsessionToken(corpnum,""))
end if
if (isnull(userid) or userid = "") = false then lo_httpRequest.setRequestHeader("x-pb-userid",userid)
lo_httpRequest.setRequestHeader("Accept-Encoding", "gzip,deflate")
lo_httpRequest.send()

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

anyReturn = parsejson(ls_result)

return anyReturn
end function

protected function any httppost (string url, string corpnum, string postdata, string userid, string action, string contentstype) throws popbillexception;
OLEObject lo_httpRequest, dic
any returnobj
string ls_result

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("MSXML2.XMLHTTP.6.0") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("POST",getServiceURL() + url,false)
lo_httpRequest.setRequestHeader("Accept-Encoding","gzip,deflate")

if (isnull(corpnum) or corpnum = "") = false then
	lo_httpRequest.setRequestHeader("Authorization","Bearer " + getsessionToken(corpnum,""))
end if

if (isnull(action) or action = "") = false then
	lo_httpRequest.setRequestHeader("X-HTTP-Method-Override",action)
end if

if (isnull(contentstype) or contentstype = "") = true then
	lo_httpRequest.setRequestHeader("Content-Type", "Application/json")
else
	lo_httpRequest.setRequestHeader("Content-Type", contentstype)	
end if


if (isnull(userid) or userid = "") = false then lo_httpRequest.setRequestHeader("x-pb-userid",userid)

lo_httpRequest.send(postData)

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

returnobj = parsejson(ls_result)

return returnobj
end function

protected function any httppost (string url, string corpnum, string postdata, string userid, string action) throws popbillexception;
	return httppost (url, corpnum, postdata, userid, action, "")
end function

public function any httppost (string url, string corpnum, string postdata, string userid) throws popbillexception;
	return httppost (url, corpnum, postdata, userid, "", "")
end function

protected function oleobject httppostfiles (string url, string corpnum, string postdata, string postfiles[], string fieldname, string userid, string filename[]) throws popbillexception;OLEObject lo_httpRequest, dic
any returnobj
string ls_result
string boundary

boundary = "------------LINKHUB-PB"

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("MSXML2.XMLHTTP.6.0") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("POST",getServiceURL() + url,false)
lo_httpRequest.setRequestHeader("Content-Type", "multipart/form-data; boundary=" + boundary)
lo_httpRequest.setRequestHeader("Accept-Encoding", "gzip,deflate")

if (isnull(corpnum) or corpnum = "") = false then
	lo_httpRequest.setRequestHeader("Authorization","Bearer " + getsessionToken(corpnum,""))
end if

if (isnull(userid) or userid = "") = false then lo_httpRequest.setRequestHeader("x-pb-userid",userid)

blob toSend
toSend = blob("")

if (isnull(postData) or postData = "") = false then
	toSend += blob("--" + boundary + "~r~n" + &
						'Content-Disposition: form-data; name="form"~r~n' + &
						'Content-Type: Application/json~r~n' + &
						'~r~n')
	toSend += ansiToUtf8blob(postdata)
end if

integer i

for i = 1 to upperbound(postFiles)
	long ll_fileLen,l_fileHandle, ll_new_pos, ll_bytes_read, tmp_value
	string l_filePath
	blob lb_file
	integer li_filenum, li_loops, li_counter
	blob lb_our_blob, lb_tot_b, blob_temp, total_blob, blank_blob
			
	l_filePath = postFiles[i]
	
	if isnull(l_filePath) or l_filePath = "" then exception.setcodenmessage(-99999999,"전송할 파일 경로가 입력되지 않았습니다.")
	if FileLength(l_filePath) <= 0 then exception.setcodenmessage(-99999999,"전송할 파일이 올바르지 않거나 존재하지 않습니다.")
	
	toSend += blob("~r~n--" + boundary + "~r~n" + &
						'Content-Disposition: form-data; name="'+ fieldName +'"; filename="')
	toSend += ansiToUtf8Blob(filename[i])
	toSend += blob('"~r~n' + &
						'Content-Type: application/octet-stream~r~n' + &
						'~r~n')
	ll_fileLen = FileLength(l_filePath)
	li_filenum = FileOpen(l_filePath,StreamMode!,READ!,LOCKREAD!)

	IF ll_filelen > 32765 THEN
		IF Mod(ll_filelen, 32765) = 0 THEN
			li_loops = ll_filelen/32765
		else
			li_loops = (ll_filelen/32765) + 1
		end if 
	Else 
		li_loops = 1
	End If
	
	for li_counter = 1 to li_loops
		ll_bytes_read = FileRead(li_filenum,blob_temp)
	  	lb_tot_b = lb_tot_b + blob_temp
		ll_new_pos = ll_new_pos + ll_bytes_read
  		FileSeek(li_filenum,ll_new_pos,FROMBEGINNING!)
  		if LenA(lb_tot_b) > 1000000 then
  			total_blob = total_blob + lb_tot_b
  			lb_tot_b = blank_blob
	   end if
	NEXT
	
	FileClose(li_filenum)
	
	total_blob = total_blob + lb_tot_b

	toSend += total_blob
	
next

toSend += blob("~r~n--" + boundary + "--~r~n")

lo_httpRequest.send(toSend)

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest
destroy dic
returnobj = parsejson(ls_result)

return returnobj
end function

protected function string of_replaceall (string as_oldstring, string as_findstr, string as_replace);String ls_newstring
Long ll_findstr, ll_replace, ll_pos

ll_findstr = LenA(as_findstr)
ll_replace = LenA(as_replace)

ls_newstring = as_oldstring
ll_pos = PosA(ls_newstring, as_findstr)

Do While ll_pos > 0
	ls_newstring = ReplaceA(ls_newstring, ll_pos, ll_findstr, as_replace)
	ll_pos = PosA(ls_newstring, as_findstr, (ll_pos + ll_replace))
Loop

Return ls_newstring
end function

protected function blob ansiToUtf8Blob(string as_ansi)
constant ulong CP_ACP = 0
constant ulong CP_UTF8 = 65001

blob lblb_ANSI, lblb_null, ablb_utf8, rblb_unicode
long ll_ANSI_Size, ll_Unicode_WChar_Size, ll_utf8_size, ll_unicode_byte_size, ll_unicode_size

setnull(lblb_null)
lblb_ansi = blob(as_ansi)
ll_ANSI_Size = LenA(lblb_ANSI)

ll_Unicode_WChar_Size = MultiByteToWideChar(CP_ACP, 0, lblb_ANSI, ll_ANSI_Size, lblb_null, 0)

if ll_Unicode_WChar_Size < 1 then exception.setcodenmessage(-99999999,"UTF8 인코딩 중 오류가 발생하였습니다.")


ll_Unicode_Byte_Size = ll_Unicode_WChar_Size * 2
rblb_unicode = blob(space(ll_Unicode_Byte_Size))

ll_Unicode_WChar_Size = MultiByteToWideChar(CP_ACP, 0, lblb_ANSI, ll_ANSI_Size, rblb_unicode, ll_Unicode_Byte_Size)
if ll_Unicode_WChar_Size < 1 then

end if

ll_Unicode_Size = LenA(rblb_unicode)

if(ll_Unicode_Size) < 1 then exception.setcodenmessage(-99999999,"UTF8 인코딩 중 오류가 발생하였습니다.")

ll_Unicode_Size = ll_Unicode_Size/2

ll_UTF8_Size = WideCharToMultiByte(CP_UTF8, 0, rblb_unicode, ll_Unicode_Size, ablb_utf8, 0, 0, 0)

if ll_UTF8_Size < 1 then exception.setcodenmessage(-99999999,"UTF8 인코딩 중 오류가 발생하였습니다.")

ablb_utf8 = blob(space(ll_UTF8_Size))
ll_UTF8_Size = WideCharToMultiByte(CP_UTF8, 0, rblb_unicode, ll_Unicode_Size, ablb_utf8, ll_utf8_Size, 0, 0)

if ll_UTF8_Size < 1 then exception.setcodenmessage(-99999999,"UTF8 인코딩 중 오류가 발생하였습니다.")

return ablb_utf8

end function

public function string urlencode(string target);
	oleObject wsh
	integer li_rc
	string tmp_str
	
	wsh = CREATE OleObject
	li_rc = wsh.ConnectToNewObject( "MSScriptControl.ScriptControl" )
	wsh.language = "javascript"
	tmp_str = wsh.Eval("encodeURI('"+target+"')")
	
	wsh.DisconnectObject()
	destroy wsh
	
	return tmp_str
end function

on baseservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on baseservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;setnull(in_authority)
exception  = create popbillexception
scopes[1] = "member"
in_IPRestrictOnOff = true

end event

