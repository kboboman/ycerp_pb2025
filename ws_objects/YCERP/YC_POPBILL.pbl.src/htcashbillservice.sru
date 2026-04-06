$PBExportHeader$htcashbillservice.sru
forward
global type htcashbillservice from baseservice
end type
end forward

global type htcashbillservice from baseservice
end type
global htcashbillservice htcashbillservice

forward prototypes
public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception
public function string requestjob (string corpnum, string keytype, string sdate, string edate) throws popbillexception
public function string requestjob (string corpnum, string keytype, string sdate, string edate, string userid) throws popbillexception
public function jobstate getjobstate (string corpnum, string jobid) throws popbillexception
public function jobstate getjobstate (string corpnum, string jobid, string userid) throws popbillexception
public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[]) throws popbillexception
public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[], string userid) throws popbillexception
public function htcashbillsearch search (string corpnum, string jobid, string tradetype[], string tradeusage[], int page, int perpage, string order) throws popbillexception // overload 
public function htcashbillsearch search (string corpnum, string jobid, string tradetype[], string tradeusage[], int page, int perpage, string order, string userid) throws popbillexception
public function htcashbillsummary summary (string corpnum, string jobid, string tradetype[], string tradeusage[]) throws popbillexception	// overload 
public function htcashbillsummary summary (string corpnum, string jobid, string tradetype[], string tradeusage[], string userid) throws popbillexception
public function htcashbillsearch tohtcashbillsearch (ref oleobject dic);
private function htcashbill tocashbill (ref oleobject dic)
public function string getflatratepopupurl (string corpnum) throws popbillexception	// overload 
public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception
public function flatratestate getflatratestate (string corpnum) throws popbillexception
public function flatratestate getflatratestate (string corpnum, string userid) throws popbillexception
public function string getcertificatepopupurl (string corpnum) throws popbillexception	// overload
public function string getcertificatepopupurl (string corpnum, string userid) throws popbillexception
public function string getcertificateexpiredate (string corpnum) throws popbillexception	// overload
public function string getcertificateexpiredate (string corpnum, string userid) throws popbillexception
public function response checkcertvalidation (string corpnum) throws popbillexception
public function response checkcertvalidation (string corpnum, string userid) throws popbillexception
public function response registdeptuser (string corpnum, string deptuserid, string deptuserpwd) throws popbillexception
public function response registdeptuser (string corpnum, string deptuserid, string deptuserpwd, string userid) throws popbillexception
public function response checkdeptuser (string corpnum) throws popbillexception
public function response checkdeptuser (string corpnum, string userid) throws popbillexception
public function response checklogindeptuser (string corpnum) throws popbillexception
public function response checklogindeptuser (string corpnum, string userid) throws popbillexception
public function response deletedeptuser (string corpnum) throws popbillexception
public function response deletedeptuser (string corpnum, string userid) throws popbillexception 
end prototypes

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic


dic = httpget("/HomeTax/Cashbill/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function string requestjob (string corpnum, string keytype, string sdate, string edate) throws popbillexception;
	return requestjob(corpnum, keytype, sdate, edate, "")
end function 

public function string requestjob (string corpnum, string keytype, string sdate, string edate, string userid) throws popbillexception; string jobid
string uri
oleobject dic

uri = "/HomeTax/Cashbill/"+keytype
uri += "?SDate="+sdate
uri += "&EDate="+edate

dic = httppost(uri, corpnum, "", userid ,"")
jobid = dic.Item("jobID")
return jobid
end function

public function jobstate getjobstate (string corpnum, string jobid) throws popbillexception;
	return getjobstate(corpnum, jobid, "")
end function

public function jobstate getjobstate (string corpnum, string jobid, string userid) throws popbillexception; jobstate result

if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic 

dic = httpget("/HomeTax/Cashbill/"+jobid+"/State", corpnum, userid)
result = tojobstate(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[]) throws popbillexception;
oleobject infoDic
Integer i

any response

try
	response = httpget("/HomeTax/Cashbill/JobList" , CorpNum, "")
	tarray result
	result = create tarray
	result = response
	integer resultLength
	resultLength = result.getLength()
	
	for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = tojobstate(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try
end subroutine

public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[], string userid) throws popbillexception;
oleobject infoDic
Integer i

any response

try
	response = httpget("/HomeTax/Cashbill/JobList" , CorpNum, userid)
	tarray result
	result = create tarray
	result = response
	integer resultLength
	resultLength = result.getLength()
	
	for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = tojobstate(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next

catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try
end subroutine

public function htcashbillsearch search (string corpnum, string jobid, string tradetype[], string tradeusage[], int page, int perpage, string order) throws popbillexception
	return search(corpnum, jobid, tradetype, tradeusage, page, perpage, order, "")
end function 

public function htcashbillsearch search (string corpnum, string jobid, string tradetype[], string tradeusage[], int page, int perpage, string order, string userid) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i
htcashbillsearch result

uri = "/HomeTax/Cashbill/" + jobid

tmpstr = ""
for i = 1 to upperbound(tradetype)
	tmpstr += tradetype[i] 
	if i < upperbound(tradetype) then tmpstr+= ','
next
uri += "?TradeType=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(tradeusage)
	tmpstr += tradeusage[i] 
	if i < upperbound(tradeusage) then tmpstr+= ','
next
uri += "&TradeUsage=" + tmpstr

uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
uri += "&Order=" +string(order)

dic = httpget(uri,corpnum,userid)

result = tohtcashbillsearch(dic)
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

public function htcashbillsummary summary (string corpnum, string jobid, string tradetype[], string tradeusage[]) throws popbillexception
	return summary(corpnum, jobid, tradetype, tradeusage, "")
end function 

public function htcashbillsummary summary (string corpnum, string jobid, string tradetype[], string tradeusage[], string userid) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i

uri = "/HomeTax/Cashbill/" + jobid + "/Summary"

tmpstr = ""
for i = 1 to upperbound(tradetype)
	tmpstr += tradetype[i] 
	if i < upperbound(tradetype) then tmpstr+= ','
next
uri += "?TradeType=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(tradeusage)
	tmpstr += tradeusage[i] 
	if i < upperbound(tradeusage) then tmpstr+= ','
next
uri += "&TradeUsage=" + tmpstr

dic = httpget(uri,corpnum,userid)

htcashbillsummary result

result.count = dic.Item("count")
result.supplyCostTotal = dic.Item("supplyCostTotal")
result.taxTotal = dic.Item("taxTotal")
result.serviceFeeTotal = dic.Item("serviceFeeTotal")
result.amountTotal = dic.Item("amountTotal")

return result

end function

public function htcashbillsearch tohtcashbillsearch (ref oleobject dic);
htcashbillsearch result

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
		result.list[i] = tocashbill(list[i])
	next
end if
return result
end function

private function htcashbill tocashbill (ref oleobject dic); 
htcashbill result

result.ntsconfirmNum = string(dic.Item("ntsconfirmNum"))
result.tradeDT = string(dic.Item("tradeDT"))
result.tradeDate = string(dic.Item("tradeDate"))
result.tradeUsage = string(dic.Item("tradeUsage"))
result.tradeType = string(dic.Item("tradeType"))
result.supplyCost = string(dic.Item("supplyCost"))
result.tax = string(dic.Item("tax"))
result.serviceFee = string(dic.Item("serviceFee"))
result.totalAmount = string(dic.Item("totalAmount"))

result.invoiceType = string(dic.Item("invoiceType"))

result.franchiseCorpNum = string(dic.Item("franchiseCorpNum"))
result.franchiseCorpName = string(dic.Item("franchiseCorpName"))
result.franchiseCorpType = string(dic.Item("franchiseCorpType"))

result.identityNum = string(dic.Item("identityNum"))
result.identityNumType = string(dic.Item("identityNumType"))
result.customerName = string(dic.Item("customerName"))
result.cardOwnerName = string(dic.Item("cardOwnerName"))
result.deductionType = string(dic.Item("deductionType"))

return result
end function

public function string getflatratepopupurl (string corpnum) throws popbillexception;
	return getflatratepopupurl(corpnum, "")
end function 

public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception;
string url
oleObject result

result = httpget("/HomeTax/Cashbill?TG=CHRG", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function flatratestate getflatratestate (string corpnum) throws popbillexception;
	return getflatratestate(corpnum, "")
end function

public function flatratestate getflatratestate (string corpnum, string userid) throws popbillexception;flatratestate result
oleobject dic

dic = httpget("/HomeTax/Cashbill/Contract", CorpNum, userid)
result.referenceID = string(dic.Item("referenceID"))
result.contractDT = string(dic.Item("contractDT"))
result.useEndDate = string(dic.Item("useEndDate"))
result.baseDate = int(dic.Item("baseDate"))
result.state = int(dic.Item("state"))
result.closeRequestYN = dic.Item("closeRequestYN")
result.useRestrictYN = dic.Item("useRestrictYN")
result.closeOnExpired = dic.Item("closeOnExpired")
result.unPaidYN = dic.Item("unPaidYN")

dic.DisconnectObject()
destroy dic

return result
end function

public function string getcertificatepopupurl (string corpnum) throws popbillexception;
	return getcertificatepopupurl(corpnum, "")
end function 

public function string getcertificatepopupurl (string corpnum, string userid) throws popbillexception;
string url
oleObject result

result = httpget("/HomeTax/Cashbill?TG=CERT", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getcertificateexpiredate (string corpnum) throws popbillexception;
	return getcertificateexpiredate(corpnum, "")
end function 

public function string getcertificateexpiredate (string corpnum, string userid) throws popbillexception;
string result
oleObject dic
string tmp

dic = httpget("/HomeTax/Cashbill/CertInfo", CorpNum, UserID)
tmp = String(dic.Item("certificateExpiration"))
result = MidA(tmp,1,4) + "-" + MidA(tmp,5,2) + "-" + MidA(tmp,7,2) + " " + MidA(tmp,9,2) + ":" +  MidA(tmp,11,2) + ":" + MidA(tmp,13,2)
dic.DisconnectObject()
destroy dic

return result
end function

public function response checkcertvalidation (string corpnum) throws popbillexception;
	return checkcertvalidation(corpnum, "")
end function

public function response checkcertvalidation (string corpnum, string userid) throws popbillexception;response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	
	dic = httpget("/HomeTax/Cashbill/CertCheck", corpnum, userid)
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic

return result
end function

public function response registdeptuser (string corpnum, string deptuserid, string deptuserpwd) throws popbillexception
	return registdeptuser(corpnum, deptuserid, deptuserpwd, "")
end function

public function response registdeptuser (string corpnum, string deptuserid, string deptuserpwd, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(deptuserid) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"홈택스 부서사용자 계정 아이디가 입력되지 않았습니다.")
if isnull(deptuserpwd) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"홈택스 부서사용자 계정 비밀번호가 입력되지 않았습니다.")

postData = '{"id":"'+escapestring(deptuserid)+'","pwd":"'+escapestring(deptuserpwd)+'"}'

dic = httppost("/HomeTax/Cashbill/DeptUser",corpnum,postData,userid,"")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response checkdeptuser (string corpnum)
	return checkdeptuser(corpnum, "")
end function

public function response checkdeptuser (string corpnum, string userid);response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	
	dic = httpget("/HomeTax/Cashbill/DeptUser", corpnum, userid)
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic

return result
end function

public function response checklogindeptuser (string corpnum)
	return checklogindeptuser(corpnum, "")
end function

public function response checklogindeptuser (string corpnum, string userid);response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	
	dic = httpget("/HomeTax/Cashbill/DeptUser/Check", corpnum, userid)
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic

return result
end function

public function response deletedeptuser (string corpnum)
	return deletedeptuser(corpnum, "")
end function

public function response deletedeptuser (string corpnum, string userid);response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")

dic = httppost("/HomeTax/Cashbill/DeptUser",corpnum,"",userid,"DELETE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

event constructor;call super::constructor;addscope("141")
end event

on htcashbillservice.create
call super::create
end on

on htcashbillservice.destroy
call super::destroy
end on

