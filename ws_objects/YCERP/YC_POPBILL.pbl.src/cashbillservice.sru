$PBExportHeader$cashbillservice.sru
forward
global type cashbillservice from baseservice
end type
end forward

global type cashbillservice from baseservice
end type
global cashbillservice cashbillservice

forward prototypes
public function string geturl (string corpnum, string togo) throws popbillexception	// geturl overload 
public function string geturl (string corpnum, string userid, string togo) throws popbillexception
public function boolean checkmgtkeyinuse (string corpnum, string mgtkey) throws popbillexception
private function string cashbilltojson (ref cashbill ar_cashbill) throws popbillexception
public function response register (string corpnum, ref cashbill ar_cashbill, string userid) throws popbillexception
public function response register (string corpnum, ref cashbill ar_cashbill) throws popbillexception
public function response update (string corpnum, string mgtkey, ref cashbill ar_cashbill) throws popbillexception
public function response update (string corpnum, string mgtkey, ref cashbill ar_cashbill, string userid) throws popbillexception
public function response erase (string corpnum, string mgtkey, string userid) throws popbillexception
public function response erase (string corpnum, string mgtkey) throws popbillexception
public function response issue (string corpnum, string mgtkey, string memo, string userid) throws popbillexception
public function response issue (string corpnum, string mgtkey, string memo) throws popbillexception
public function response cancelissue (string corpnum, string mgtkey, string memo) throws popbillexception	// cancelissue overload
public function response cancelissue (string corpnum, string mgtkey, string memo, string userid) throws popbillexception
public function response sendemail (string corpnum, string mgtkey, string receiver, string userid) throws popbillexception
public function response sendemail (string corpnum, string keytype, string receiver) throws popbillexception
public function response sendsms (string corpnum, string mgtkey, string sender, string receiver, string contents, string userid) throws popbillexception
public function response sendsms (string corpnum, string mgtkey, string sender, string receiver, string contents) throws popbillexception
public function response sendfax (string corpnum, string mgtkey, string sender, string receiver, string userid) throws popbillexception
public function response sendfax (string corpnum, string mgtkey, string sender, string receiver) throws popbillexception
public function cashbillinfo getinfo (string corpnum, string mgtkey) throws popbillexception
public function cashbill getdetailinfo (string corpnum, string mgtkey) throws popbillexception
public subroutine getinfos (string corpnum, ref string mgtkeylist[], ref cashbillinfo ref_returnlist[]) throws popbillexception
public subroutine getlogs (string corpnum, string mgtkey, ref cashbilllog ref_list[]) throws popbillexception
public function string getpopupurl (string corpnum, string mgtkey) throws popbillexception	// getpopupurl overload
public function string getpopupurl (string corpnum, string mgtkey, string userid) throws popbillexception
public function string getprinturl (string corpnum, string mgtkey) throws popbillexception	// getprinturl overload
public function string getprinturl (string corpnum, string mgtkey, string userid) throws popbillexception
public function string geteprinturl (string corpnum, string mgtkey) throws popbillexception		// geteprinturl overload
public function string geteprinturl (string corpnum, string mgtkey, string userid) throws popbillexception
public function string getmailurl (string corpnum, string mgtkey) throws popbillexception		// getmailurl overload
public function string getmailurl (string corpnum, string mgtkey, string userid) throws popbillexception
public function string getmassprinturl (string corpnum, string mgtkeylist[]) throws popbillexception	//getmassprinturl overload
public function string getmassprinturl (string corpnum, string mgtkeylist[], string userid) throws popbillexception
public function decimal getunitcost (string corpnum) throws popbillexception

public function response registissue(string corpnum, ref cashbill ar_cashbill, string memo) throws popbillexception
public function response registissue(string corpnum, ref cashbill ar_cashbill, string memo, string userid) throws popbillexception
public function response registissue(string corpnum, ref cashbill ar_cashbill, string memo, string userid, string emailsubject) throws popbillexception

// 취소현금영수증 즉시발행 추가. (2017/08/18)
public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate) throws popbillexception
public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn) throws popbillexception
public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo) throws popbillexception
public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo, string userid) throws popbillexception

public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo, string userid, &
boolean isPartCancel, int cancelType, string supplyCost, string tax, string serviceFee, string totalAmount) throws popbillexception

// 취소현금영수증 임시저장 추가. (2017/08/18)
public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate) throws popbillexception
public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn) throws popbillexception
public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string userid) throws popbillexception
public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string userid, & 
boolean isPartCancel, int cancelType, string supplyCost, string tax, string serviceFee, string totalAmount) throws popbillexception

private function cashbill tocashbill (ref oleobject dic)
private function cashbillinfo tocashbillinfo (ref oleobject dic)
public function cbsearchresult tocbsearchresult (ref oleobject dic)

public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string order, int page, int perpage) throws popbillexception
public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string qstring, string order, int page, int perpage) throws popbillexception
public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string order, int page, int perpage, string tradeopt[]) throws popbillexception
public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string qstring, string order, int page, int perpage, string tradeopt[]) throws popbillexception

public function chargeinfo getchargeinfo (string coprnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception

public subroutine listEmailconfig (string corpnum, ref emailconfig ref_returnlist[]) throws popbillexception
public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN) throws popbillexception
public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN, string userid) throws popbillexception
public function emailconfig toemailconfig(ref oleobject dic)

end prototypes

public function string geturl (string corpnum, string togo) throws popbillexception;string url
	return geturl(corpnum, "", togo)
end function

public function string geturl (string corpnum, string userid, string togo) throws popbillexception;string url
oleObject result

result = httpget("/Cashbill/?TG=" + togo , CorpNum,UserID)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function boolean checkmgtkeyinuse (string corpnum, string mgtkey) throws popbillexception;oleobject dic
string IK

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

try
	dic = httpget("/Cashbill/" + mgtkey, corpnum,"")
	IK = string(dic.Item("itemKey"))
	return (isnull(IK) or IK = "") = false
	
catch(popbillexception pe)
	if pe.getcode() = -14000003 then return false
	throw pe
end try
end function

private function string cashbilltojson (ref cashbill ar_cashbill) throws popbillexception;string result
result = ""
result += "{"
result += '"mgtKey":"' + escapeString(ar_cashbill.mgtKey) + '",'
result += '"tradeUsage":"' + escapeString(ar_cashbill.tradeUsage) + '",'
result += '"tradeOpt":"' + escapeString(ar_cashbill.tradeOpt) + '",'
result += '"tradeType":"' + escapeString(ar_cashbill.tradeType) + '",'
result += '"orgConfirmNum":"' + escapeString(ar_cashbill.orgConfirmNum) + '",'
result += '"orgTradeDate":"' + escapeString(ar_cashbill.orgTradeDate) + '",'

result += '"taxationType":"' + escapeString(ar_cashbill.taxationType) + '",'
result += '"supplyCost":"' + escapeString(ar_cashbill.supplyCost) + '",'
result += '"tax":"' + escapeString(ar_cashbill.tax) + '",'
result += '"serviceFee":"' + escapeString(ar_cashbill.serviceFee) + '",'
result += '"totalAmount":"' + escapeString(ar_cashbill.totalAmount) + '",'

result += '"franchiseCorpNum":"' + escapeString(ar_cashbill.franchiseCorpNum) + '",'
result += '"franchiseCorpName":"' + escapeString(ar_cashbill.franchiseCorpName) + '",'
result += '"franchiseCEOName":"' + escapeString(ar_cashbill.franchiseCEOName) + '",'
result += '"franchiseAddr":"' + escapeString(ar_cashbill.franchiseAddr) + '",'
result += '"franchiseTEL":"' + escapeString(ar_cashbill.franchiseTEL) + '",'

result += '"identityNum":"' + escapeString(ar_cashbill.identityNum) + '",'
result += '"customerName":"' + escapeString(ar_cashbill.customerName) + '",'
result += '"itemName":"' + escapeString(ar_cashbill.itemName) + '",'
result += '"orderNumber":"' + escapeString(ar_cashbill.orderNumber) + '",'

result += '"memo":"' + escapeString(ar_cashbill.memo) + '",'
result += '"emailSubject":"' + escapeString(ar_cashbill.emailSubject) + '",'
result += '"email":"' + escapeString(ar_cashbill.email) + '",'
result += '"hp":"' + escapeString(ar_cashbill.hp) + '",'
result += '"fax":"' + escapeString(ar_cashbill.fax) + '"'
result += "}"

return result
end function

public function response register (string corpnum, ref cashbill ar_cashbill, string userid) throws popbillexception;response result
oleobject dic

String postData

postData = cashbillToJson(ar_cashbill)

dic = httppost("/Cashbill",corpnum,postData,userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response register (string corpnum, ref cashbill ar_cashbill) throws popbillexception;return register(corpnum,ar_cashbill,"")
end function

public function response update (string corpnum, string mgtkey, ref cashbill ar_cashbill) throws popbillexception;return update(corpnum,mgtkey,ar_cashbill,"")
end function

public function response update (string corpnum, string mgtkey, ref cashbill ar_cashbill, string userid) throws popbillexception;response result
oleobject dic

String postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = cashbillToJson(ar_cashbill)

dic = httppost("/Cashbill/"+ mgtkey ,corpnum,postData,userid,"PATCH")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response erase (string corpnum, string mgtkey, string userid) throws popbillexception;response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httppost("/Cashbill/" + mgtkey ,corpnum,"",userid,"DELETE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response erase (string corpnum, string mgtkey) throws popbillexception;return erase(corpnum,mgtkey,"")
end function

public function response issue (string corpnum, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{'
postData += '"memo":"'+escapestring(memo)+'"'
postData += '}'

dic = httppost("/Cashbill/" + mgtkey ,corpnum,postData,userid,"ISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response issue (string corpnum, string mgtkey, string memo) throws popbillexception;return issue(corpnum,mgtkey,memo,"")
end function

public function response cancelissue (string corpnum, string mgtkey, string memo) throws popbillexception;
	return cancelissue(corpnum, mgtkey, memo, "")
end function

public function response cancelissue (string corpnum, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Cashbill/" + mgtkey ,corpnum,postData,userid,"CANCELISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendemail (string corpnum, string mgtkey, string receiver, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"receiver":"'+escapestring(receiver)+'"}'

dic = httppost("/Cashbill/" + mgtkey ,corpnum,postData,userid,"EMAIL")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendemail (string corpnum, string keytype, string receiver) throws popbillexception;return sendemail(corpnum,keytype,receiver,"")
end function

public function response sendsms (string corpnum, string mgtkey, string sender, string receiver, string contents, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"sender":"'+escapestring(sender)+'","receiver":"'+escapestring(receiver)+'","contents":"'+escapestring(contents)+'"}'

dic = httppost("/Cashbill/" + mgtkey ,corpnum,postData,userid,"SMS")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendsms (string corpnum, string mgtkey, string sender, string receiver, string contents) throws popbillexception;return sendsms(corpnum,mgtkey,sender,receiver,contents,"")
end function

public function response sendfax (string corpnum, string mgtkey, string sender, string receiver, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"sender":"'+escapestring(sender)+'","receiver":"'+escapestring(receiver)+'"}'

dic = httppost("/Cashbill/" + mgtkey ,corpnum,postData,userid,"FAX")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendfax (string corpnum, string mgtkey, string sender, string receiver) throws popbillexception;return sendfax(corpnum,mgtkey,sender,receiver,"")
end function

public function cashbillinfo getinfo (string corpnum, string mgtkey) throws popbillexception;cashbillInfo result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httpget("/Cashbill/"+ MgtKey , CorpNum,"")

result = tocashbillinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function cashbill getdetailinfo (string corpnum, string mgtkey) throws popbillexception;cashbill result
oleobject dic
int i

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httpget("/Cashbill/"+ MgtKey + "?Detail" , CorpNum,"")
result = tocashbill(dic)
oleobject toDestory[]
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine getinfos (string corpnum, ref string mgtkeylist[], ref cashbillinfo ref_returnlist[]) throws popbillexception;any dicList[]
oleobject infoDic
string postData
Integer i
any response
tarray result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(mgtkeylist) or upperbound(mgtkeylist) <= 0  then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData ='['

for i = 1 to upperbound(mgtkeylist)
	postData += '"' + mgtkeyList[i] + '"'
	if i < upperbound(mgtkeyList) then postData += ','
next

postData +=']'

try
	
	response = httppost("/Cashbill/States",corpnum,postData,"")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		infoDic = result.list[i]
		ref_returnlist[i] = tocashbillInfo(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
		
	next
	
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public subroutine getlogs (string corpnum, string mgtkey, ref cashbilllog ref_list[]) throws popbillexception;any dicList[]
integer i
oleobject log
any response
tarray result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

try
	response = httpget("/Cashbill/" + mgtkey + "/Logs",corpnum,"")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		log = result.list[i]
		ref_List[i].docLogType = log.item("docLogType")
		ref_List[i].log = string(log.item("log"))
		ref_List[i].procType =  string(log.item("procType"))
		ref_List[i].procMemo = string(log.item("procMemo"))
		ref_List[i].regDT = string( log.item("regDT"))
		ref_List[i].ip = string( log.item("ip"))
		
		log.DisconnectObject()
		destroy log
		
	next
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())	
end try

end subroutine

public function string getpopupurl (string corpnum, string mgtkey) throws popbillexception;
	return getpopupurl (corpnum, mgtkey, "")
end function 

public function string getpopupurl (string corpnum, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Cashbill/"+ mgtkey + "?TG=POPUP" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getprinturl (string corpnum, string mgtkey) throws popbillexception;
	return getprinturl(corpnum, mgtkey, "")
end function 

public function string getprinturl (string corpnum, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Cashbill/"+ mgtkey + "?TG=PRINT" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string geteprinturl (string corpnum, string mgtkey) throws popbillexception;
	return geteprinturl(corpnum, mgtkey, "")
end function

public function string geteprinturl (string corpnum, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Cashbill/" + mgtkey + "?TG=EPRINT" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getmailurl (string corpnum, string mgtkey) throws popbillexception;
	return getmailurl(corpnum, mgtkey, "")
end function

public function string getmailurl (string corpnum, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Cashbill/" + mgtkey + "?TG=MAIL" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getmassprinturl (string corpnum, string mgtkeylist[]) throws popbillexception;
	return getmassprinturl(corpnum, mgtkeylist, "")
end function

public function string getmassprinturl (string corpnum, string mgtkeylist[], string userid) throws popbillexception;string url
oleObject result
string postData
Integer i

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(mgtkeylist) or upperbound(mgtkeylist) <= 0 then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData ='['

for i = 1 to upperbound(mgtkeylist)
	postData += '"' + mgtkeyList[i] + '"'
	if i < upperbound(mgtkeyList) then postData += ','
next

postData +=']'

result = httppost("/Cashbill/Prints" , CorpNum,postData,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function decimal getunitcost (string corpnum) throws popbillexception;decimal unitcost
oleObject result

result = httpget("/Cashbill?cfg=UNITCOST" , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

public function response registissue(string corpnum, ref cashbill ar_cashbill, string memo) throws popbillexception;
return registissue(corpnum, ar_cashbill, memo, "", "")
end function

public function response registissue (string corpnum, ref cashbill ar_cashbill, string memo, string userid) throws popbillexception;response result
return registissue(corpnum, ar_cashbill, memo, userid, "")
end function

public function response registissue (string corpnum, ref cashbill ar_cashbill, string memo, string userid, string emailsubject) throws popbillexception;
response result
oleobject dic
ar_cashbill.memo = memo
ar_cashbill.emailSubject = emailsubject
String postData

postData = cashbillToJson(ar_cashbill)

dic = httppost("/Cashbill",corpnum,postData,userid, "ISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response revokeregistissue (string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate) throws popbillexception;
return revokeregistissue(corpnum, mgtkey, orgconfirmnum, orgtradedate, false, "", "", false, 0, "", "", "", "")
end function

public function response revokeregistissue (string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn) throws popbillexception;
return revokeregistissue(corpnum, mgtkey, orgconfirmnum, orgtradedate, smssendyn, "", "", false, 0, "", "", "", "")
end function 

public function response revokeregistissue (string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo) throws popbillexception;
	return revokeregistissue(corpnum, mgtkey, orgconfirmnum, orgtradedate, smssendyn, memo, "", false, 0, "", "", "", "")
end function 

public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo, string userid) throws popbillexception;
	return revokeregistissue(corpnum, mgtkey, orgconfirmnum, orgtradedate, smssendyn, memo, userid, false, 0, "", "", "", "")
end function

public function response revokeregistissue(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string memo, string userid, &
boolean isPartCancel, int cancelType, string supplyCost, string tax, string serviceFee, string totalAmount) throws popbillexception

response result
oleobject dic
string postData

postData += "{"
postData += '"mgtKey":"' + escapeString(mgtKey) + '",'
postData += '"orgConfirmNum":"' + escapeString(orgConfirmNum) + '",'
postData += '"orgTradeDate":"' + escapeString(orgTradeDate) + '",'

if smssendyn then
postData += '"smssendYN":true,'
end if

if isPartCancel then
postData += '"isPartCancel":true,'
end if

if cancelType > 0 then
postData += '"cancelType":"' + string(cancelType) + '",'
end if

postData += '"supplyCost":"' + escapeString(supplyCost) + '",'
postData += '"tax":"' + escapeString(tax) + '",'
postData += '"serviceFee":"' + escapeString(serviceFee) + '",'
postData += '"totalAmount":"' + escapeString(totalAmount) + '",'

postData += '"memo":"' + escapeString(memo) + '"'
postData += "}"

dic = httppost("/Cashbill",corpnum,postData,userid, "REVOKEISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic
return result 

end function 

public function response revokeregister (string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate) throws popbillexception;
return revokeregister(corpnum, mgtkey, orgconfirmnum, orgtradedate, false, "", false, 0, "", "", "", "")
end function

public function response revokeregister (string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn) throws popbillexception;
return revokeregister(corpnum, mgtkey, orgconfirmnum, orgtradedate, smssendyn, "", false, 0, "", "", "", "")
end function 

public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string userid) throws popbillexception;
	return revokeregister(corpnum, mgtkey, orgconfirmnum, orgtradedate, smssendyn, userid, false, 0, "", "", "", "")
end function

public function response revokeregister(string corpnum, string mgtkey, string orgconfirmnum, string orgtradedate, boolean smssendyn, string userid, & 
boolean isPartCancel, int cancelType, string supplyCost, string tax, string serviceFee, string totalAmount) throws popbillexception;
response result
oleobject dic
string postData

postData += "{"
postData += '"mgtKey":"' + escapeString(mgtKey) + '",'
postData += '"orgConfirmNum":"' + escapeString(orgConfirmNum) + '",'

if smssendyn then
postData += '"smssendYN":true,'
end if

if isPartCancel then
postData += '"isPartCancel":true,'
end if

if cancelType > 0 then
postData += '"cancelType":"' + string(cancelType) + '",'
end if

postData += '"supplyCost":"' + escapeString(supplyCost) + '",'
postData += '"tax":"' + escapeString(tax) + '",'
postData += '"serviceFee":"' + escapeString(serviceFee) + '",'
postData += '"totalAmount":"' + escapeString(totalAmount) + '",'

postData += '"orgTradeDate":"' + escapeString(orgTradeDate) + '"'
postData += "}"

dic = httppost("/Cashbill",corpnum,postData,userid, "REVOKE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function cashbill tocashbill (ref oleobject dic);cashbill result

result.mgtKey = string(dic.Item("mgtKey"))
result.confirmNum =string( dic.Item("confirmNUm"))
result.orgConfirmNum =string( dic.Item("orgConfirmNum"))
result.orgTradeDate =string( dic.Item("orgTradeDate"))
result.tradeDate = string(dic.Item("tradeDate"))
result.tradeType = string(dic.Item("tradeType"))
result.tradeUsage = string(dic.Item("tradeUsage"))
result.tradeOpt = string(dic.Item("tradeOpt"))
result.taxationType = string(dic.Item("taxationType"))
result.totalAmount = string(dic.Item("totalAmount"))
result.supplyCost = string(dic.Item("supplyCost"))
result.tax = string(dic.Item("tax"))
result.serviceFee = string(dic.Item("serviceFee"))
result.franchiseCorpNum = string(dic.Item("franchiseCorpNum"))
result.franchiseCorpName = string(dic.Item("franchiseCorpName"))
result.franchiseCEOName = string(dic.Item("franchiseCEOName"))
result.franchiseAddr = string(dic.Item("franchiseAddr"))
result.franchiseTEL = string(dic.Item("franchiseTEL"))
result.identityNum = string(dic.Item("identityNum"))
result.customerName = string(dic.Item("customerName"))
result.itemName = string(dic.Item("itemName"))
result.orderNumber = string(dic.Item("orderNumber"))
result.email = string(dic.Item("email"))
result.hp = string(dic.Item("hp"))
result.fax = string(dic.Item("fax"))
result.smssendYN = dic.Item("smssendYN")
result.faxsendYN = dic.Item("faxsendYN")
result.cancelType =integer(dic.Item("cancelType"))

return result
end function

private function cashbillinfo tocashbillinfo (ref oleobject dic);cashbillinfo result

result.itemkey = string(dic.Item("itemKey"))
result.mgtKey = string(dic.Item("mgtKey"))
result.tradeDate = string(dic.Item("tradeDate"))
result.tradeType = string(dic.Item("tradeType"))
result.tradeUsage = string(dic.Item("tradeUsage"))
result.tradeOpt = string(dic.Item("tradeOpt"))
result.taxationType =string( dic.Item("taxationType"))
result.totalAmount = string(dic.Item("totalAmount"))
result.issueDT = string(dic.Item("issueDT"))
result.regDT = string( dic.Item("regDT"))
result.stateMemo = string( dic.Item("stateMemo"))
result.stateCode =  Integer(dic.Item("stateCode"))
result.stateDT =  string(dic.Item("stateDT"))
result.identityNum = string(dic.Item("identityNum"))
result.itemName = string(dic.Item("itemName"))
result.customerName = string(dic.Item("customerName"))
result.confirmNum = string( dic.Item("confirmNum"))
result.orgTradeDate = string(dic.Item("orgTradeDate"))
result.orgConfirmNum =  string(dic.Item("orgConfirmNum"))
result.ntssendDT = string( dic.Item("ntssendDT"))
result.ntsresult = string( dic.Item("ntsresult"))
result.ntsresultDT = string( dic.Item("ntsresultDT"))
result.ntsresultCode = string(dic.Item("ntsresultCode"))
result.ntsresultMessage = string( dic.Item("ntsresultMessage"))
result.printYN =  dic.Item("printYN")

return result
end function

public function cbsearchresult tocbsearchresult (ref oleobject dic);
cbsearchresult result

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
		result.list[i] = tocashbillinfo(list[i])
	next
end if

return result
end function

public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string order, int page, int perpage) throws popbillexception;
	string empty_array[]
	return search (corpnum, dtype, sdate, edate, state, tradetype, tradeusage, taxationtype, "", order, page, perpage, empty_array)
end function

public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string qstring, string order, int page, int perpage) throws popbillexception;
	string empty_array[]
	return search (corpnum, dtype, sdate, edate, state, tradetype, tradeusage, taxationtype, qstring, order, page, perpage, empty_array)
end function

public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string order, int page, int perpage, string tradeopt[]) throws popbillexception;
	return search (corpnum, dtype, sdate, edate, state, tradetype, tradeusage, taxationtype, "", order, page, perpage, tradeopt)
end function

public function cbsearchresult search (string corpnum, string dtype, string sdate, string edate, string state[], string tradetype[], string tradeusage[], string taxationtype[], string qstring, string order, int page, int perpage, string tradeopt[]) throws popbillexception;
oleobject dic
string uri, tmpstr
int i
cbsearchresult result

uri = "/Cashbill/Search"
uri += "?DType=" + dtype
uri += "&SDate=" + sdate
uri += "&EDate=" + edate

tmpstr = ""
for i = 1 to upperbound(state)
	tmpstr += state[i] 
	if i < upperbound(state) then tmpstr+= ','
next
uri += "&State=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(tradetype)
	tmpstr += tradetype[i] 
	if i < upperbound(tradetype) then tmpstr+= ','
next
uri += "&TradeType=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(tradeusage)
	tmpstr += tradeusage[i] 
	if i < upperbound(tradeusage) then tmpstr+= ','
next
uri += "&TradeUsage=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(tradeopt)
	tmpstr += tradeopt[i] 
	if i < upperbound(tradeopt) then tmpstr+= ','
next
uri += "&TradeOpt=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(taxationtype)
	tmpstr += taxationtype[i] 
	if i < upperbound(taxationtype) then tmpstr+= ','
next
uri += "&TaxationType=" + tmpstr
uri += "&Order=" + order
uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)

if qstring <> "" then
	uri += "&QString=" + qstring
end if

dic = httpget(uri,corpnum,"")

result = tocbsearchresult(dic)
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

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/Cashbill/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine listEmailconfig (string corpnum, ref emailconfig ref_returnlist[]) throws popbillexception;
	any dicList[]
	oleobject infoDic
	Integer i
	any response
	tarray result

	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")

	try

		response = httpget("/Cashbill/EmailSendConfig", corpnum, "")
		result = create tarray
		result = response
	
	for i = 1 to result.getLength()
		infoDic = result.list[i]
		ref_returnlist[i] = toemailconfig(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try	
end subroutine

public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN) throws popbillexception
	return updateEmailConfig(corpnum, emailtype, sendYN, "")
end function

public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN, string userid) throws popbillexception
	response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	if isnull(emailtype) or emailtype = "" then throw exception.setCodeNMessage(-99999999,"메일전송 유형이 입력되지 않았습니다.")
	
	dic = httppost("/Cashbill/EmailSendConfig?EmailType="+emailtype+"&SendYN="+string(sendYN), corpnum,"", userid, "")
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic

return result
end function

public function emailconfig toemailconfig(ref oleobject dic);
emailconfig result

result.emailType = string(dic.Item("emailType"))
result.sendYN = dic.Item("sendYN")

return result
end function

on cashbillservice.create
call super::create
end on

on cashbillservice.destroy
call super::destroy
end on

event constructor;call super::constructor;addscope("140")
end event

