$PBExportHeader$easyfinbankservice.sru
forward
global type easyfinbankservice from baseservice
end type
end forward

global type easyfinbankservice from baseservice
end type
global easyfinbankservice easyfinbankservice

forward prototypes

public function string getbankaccountmgturl (string corpnum) throws popbillexception	
public function string getbankaccountmgturl (string corpnum, string userid) throws popbillexception

public subroutine listbankaccount (string corpnum, ref easyfinbankaccount ref_returnlist[]) throws popbillexception
public subroutine listbankaccount (string corpnum, ref easyfinbankaccount ref_returnlist[], string userid) throws popbillexception

public function string requestjob (string corpnum, string bankcode, string accountnumber, string sdate, string edate) throws popbillexception
public function string requestjob (string corpnum, string bankcode, string accountnumber, string sdate, string edate, string userid) throws popbillexception

public function easyfinjobstate getjobstate (string corpnum, string jobid) throws popbillexception
public function easyfinjobstate getjobstate (string corpnum, string jobid, string userid) throws popbillexception

public subroutine listactivejob (string corpnum, ref easyfinjobstate ref_returnlist[]) throws popbillexception
public subroutine listactivejob (string corpnum, ref easyfinjobstate ref_returnlist[], string userid) throws popbillexception

public function easyfinbanksearch search (string corpnum, string jobid, string tradetype[], string searchstring, int page, int perpage, string order) throws popbillexception
public function easyfinbanksearch search (string corpnum, string jobid, string tradetype[], string searchstring, int page, int perpage, string order, string userid) throws popbillexception

public function easyfinbanksummary summary (string corpnum, string jobid, string tradetype[], string searchstring) throws popbillexception
public function easyfinbanksummary summary (string corpnum, string jobid, string tradetype[], string searchstring, string userid) throws popbillexception

public function response savememo(string corpnum, string tid, string memo) throws popbillexception 
public function response savememo(string corpnum, string tid, string memo, string userid) throws popbillexception

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception

public function string getflatratepopupurl (string corpnum) throws popbillexception	// getflatratepopupurl overload
public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception

public function flatratestate getflatratestate (string corpnum, string bankcode, string accountnumber ) throws popbillexception
public function flatratestate getflatratestate (string corpnum, string bankcode, string accountnumber, string userid) throws popbillexception

public function easyfinbankaccount tobankaccount(ref oleobject dic);
public function easyfinjobstate toeasyfinjobstate(ref oleobject dic);
public function easyfinbanksearch toeasyfinbanksearch (ref oleobject dic);
private function easyfinbanksearchdetail toeasyfinbankdetail (ref oleobject dic)

end prototypes

public function string getbankaccountmgturl (string corpnum) throws popbillexception
	return getbankaccountmgturl(corpnum, "")
end function

public function string getbankaccountmgturl (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/EasyFin/Bank?TG=BankAccount", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public subroutine listbankaccount (string corpnum, ref easyfinbankaccount ref_returnlist[]) throws popbillexception
oleobject infoDic
Integer i

any response

try 
	response = httpget("/EasyFin/Bank/ListBankAccount" , CorpNum, "")
	tarray result
	result = create tarray
	result = response
	integer resultLength
	resultLength = result.getLength()
	
	for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = tobankaccount(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public subroutine listbankaccount (string corpnum, ref easyfinbankaccount ref_returnlist[], string userid) throws popbillexception
oleobject infoDic
any dicList[]
Integer i

try 
	dicList = httpget("/EasyFin/Bank/ListBakAccount" , CorpNum, userid)
	any result[]
	
	for i = 1 to upperbound(diclist)
		infoDic = dicList[i]
		ref_returnlist[i] = tobankaccount(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public function string requestjob (string corpnum, string bankcode, string accountnumber, string sdate, string edate) throws popbillexception;
	return requestjob(corpnum, bankcode, accountnumber, sdate, edate, "")
end function

public function string requestjob (string corpnum, string bankcode, string accountnumber, string sdate, string edate, string userid) throws popbillexception;
string jobid
string uri
oleobject dic

uri = "/EasyFin/Bank/BankAccount"
uri += "?AccountNumber="+accountnumber
uri += "&BankCode="+bankcode
uri += "&SDate="+sdate
uri += "&EDate="+edate

dic = httppost(uri, corpnum, "", userid ,"")
jobid = dic.Item("jobID")
return jobid
end function

public function easyfinjobstate getjobstate (string corpnum, string jobid) throws popbillexception; 
	easyfinjobstate result
	return getjobstate(corpnum, jobid, "")
end function

public function easyfinjobstate getjobstate (string corpnum, string jobid, string userid) throws popbillexception; 
easyfinjobstate result

if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic 

dic = httpget("/EasyFin/Bank/"+jobid+"/State", corpnum, userid)
result = toeasyfinjobstate(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public subroutine listactivejob (string corpnum, ref easyfinjobstate ref_returnlist[]) throws popbillexception;
oleobject infoDic
Integer i

any response
try 
	response = httpget("/EasyFin/Bank/JobList" , CorpNum, "")
	tarray result
	result = create tarray
	result = response
	integer resultLength
	resultLength = result.getLength()
	
	for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = toeasyfinjobstate(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public subroutine listactivejob (string corpnum, ref easyfinjobstate ref_returnlist[], string userid) throws popbillexception;
oleobject infoDic
Integer i

any response

try 
	response = httpget("/EasyFin/Bank/JobList" , CorpNum, userid)
	tarray result
	result = create tarray
	result = response
	integer resultLength
	resultLength = result.getLength()
	
	for i = 1 to resultLength
		infoDic = result.list[i]
		ref_returnlist[i] = toeasyfinjobstate(infodic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public function easyfinbanksearch search (string corpnum, string jobid, string tradetype[], string searchstring, int page, int perpage, string order, string userid) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i
easyfinbanksearch result

uri = "/EasyFin/Bank/" + jobid

tmpstr = ""
for i = 1 to upperbound(tradetype)
	tmpstr += tradetype[i] 
	if i < upperbound(tradetype) then tmpstr+= ','
next
uri += "?TradeType=" + tmpstr

uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
uri += "&Order=" +string(order)

if searchstring <> "" then
	uri += "&SearchString=" +urlencode( searchstring	)
end if

dic = httpget(uri,corpnum,userid)

result = toeasyfinbanksearch(dic)


oleobject toDestory[]
toDestory = dic.Item("list")
for i = 1 to upperbound(toDestory)
	toDestory[i].DisconnectObject()
	destroy toDestory[i]
next
dic.DisconnectObject()
destroy dic

return result

end function

public function easyfinbanksummary summary (string corpnum, string jobid, string tradetype[], string searchstring) throws popbillexception
	return summary (corpnum, jobid, tradetype, searchstring, "");
end function

public function easyfinbanksummary summary (string corpnum, string jobid, string tradetype[], string searchstring, string userid) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i

uri = "/EasyFin/Bank/" + jobid + "/Summary"

tmpstr = ""
for i = 1 to upperbound(tradetype)
	tmpstr += tradetype[i] 
	if i < upperbound(tradetype) then tmpstr+= ','
next
uri += "?TradeType=" + tmpstr

if searchstring <> "" then
	uri += "&SearchString=" +urlencode( searchstring	)
end if

dic = httpget(uri,corpnum,userid)

easyfinbanksummary result

result.count = dic.Item("count")
result.cntAccIn = dic.Item("cntAccIn")
result.cntAccOut = dic.Item("cntAccOut")
result.totalAccIn = dic.Item("totalAccIn")
result.totalAccOut = dic.Item("totalAccOut")

return result

end function

public function response saveMemo (string corpnum, string tid, string memo, string userid) throws popbillexception;
response result
string uri
oleobject dic

uri = "/EasyFin/Bank/SaveMemo"
uri += "?TID="+tid
uri += "&Memo="+urlencode(memo)

dic = httppost(uri, corpnum, "", userid ,"")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/EasyFin/Bank/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function string getflatratepopupurl (string corpnum) throws popbillexception;
	return getflatratepopupurl(corpnum, "")
end function

public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception;
string url
oleObject result

result = httpget("/EasyFin/Bank?TG=CHRG", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function flatratestate getflatratestate (string corpnum, string bankcode, string accountnumber ) throws popbillexception;
	return getflatratestate(corpnum, bankcode, accountnumber, "");
end function

public function flatratestate getflatratestate (string corpnum, string bankcode, string accountnumber, string userid) throws popbillexception;
flatratestate result
oleobject dic

dic = httpget("/EasyFin/Bank/Contract/"+bankcode+"/"+AccountNumber, CorpNum, userid)
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

public function easyfinbankaccount tobankaccount(ref oleobject dic);
easyfinbankaccount result
result.accountNumber = string(dic.Item("accountNumber"))
result.bankCode = string(dic.Item("bankCode"))
result.accountName = string(dic.Item("accountName"))
result.accountType = string(dic.Item("accountType"))
result.state = int(dic.Item("state"))
result.regDT = string(dic.Item("regDT"))
result.memo = string(dic.Item("memo"))
return result
end function

public function easyfinjobstate toeasyfinjobstate(ref oleobject dic);
easyfinjobstate result
result.jobid = string(dic.Item("jobID"))
result.jobState = int(dic.Item("jobState"))
result.startDate = string(dic.Item("startDate"))
result.endDate = string(dic.Item("endDate"))
result.errorCode = long(dic.Item("errorCode"))
result.errorReason = string(dic.Item("errorReason"))
result.jobStartDT = string(dic.Item("jobStartDT"))
result.jobEndDT = string(dic.Item("jobEndDT"))
result.regDT = string(dic.Item("regDT"))
return result
end function

public function easyfinbanksearch toeasyfinbanksearch (ref oleobject dic);
easyfinbanksearch result

result.code = string(dic.Item("code"))
result.message = string(dic.Item("message"))
result.total = string(dic.Item("total"))
result.perPage = string(dic.Item("perPage"))
result.pageNum = string(dic.Item("pageNum"))
result.pageCount = string(dic.Item("pageCount"))

Integer i
oleobject list[]
list = dic.Item("list")

for i = 1 to upperbound(list)
	result.list[i] = toeasyfinbankdetail(list[i])
next

return result
end function

private function easyfinbanksearchdetail toeasyfinbankdetail (ref oleobject dic); 
easyfinbanksearchdetail result

result.tid = string(dic.Item("tid"))
result.trdate = string(dic.Item("trdate"))
result.trserial = long(dic.Item("trserial"))
result.trdt = string(dic.Item("trdt"))
result.accIn = string(dic.Item("accIn"))
result.accOut = string(dic.Item("accOut"))
result.balance = string(dic.Item("balance"))
result.remark1 = string(dic.Item("remark1"))
result.remark2 = string(dic.Item("remark2"))
result.remark3 = string(dic.Item("remark3"))
result.remark4 = string(dic.Item("remark4"))
result.regDT = string(dic.Item("regDT"))
result.memo = string(dic.Item("memo"))

return result
end function

event constructor;call super::constructor;addscope("180")
end event

on easyfinbankservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on easyfinbankservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

