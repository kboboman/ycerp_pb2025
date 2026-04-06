$PBExportHeader$httaxinvoiceservice.sru
forward
global type httaxinvoiceservice from baseservice
end type
end forward

global type httaxinvoiceservice from baseservice
end type
global httaxinvoiceservice httaxinvoiceservice

forward prototypes
public function chargeinfo getchargeinfo (string corpnum) throws popbillexception	// overload
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception
public function string requestjob (string corpnum, string keytype, string dtype, string sdate, string edate) throws popbillexception	// overload 
public function string requestjob (string corpnum, string keytype, string dtype, string sdate, string edate, string userid) throws popbillexception
public function jobstate getjobstate (string corpnum, string jobid) throws popbillexception // overload 
public function jobstate getjobstate (string corpnum, string jobid, string userid) throws popbillexception
public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[]) throws popbillexception	// overload
public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[], string userid) throws popbillexception
public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order) throws popbillexception // overload
public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order, string userid) throws popbillexception
public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order, string userid, string searchstring) throws popbillexception

public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid) throws popbillexception // overload
public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, string userid) throws popbillexception
public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, string userid, string searchstring) throws popbillexception

public function httaxinvoicesearch tohttaxinvoicesearch (ref oleobject dic);
private function httaxinvoiceabbr totaxinvoiceabbr (ref oleobject dic)
public function httaxinvoice gettaxinvoice (string corpnum, string ntsconfirmnum) throws popbillexception // overload
public function httaxinvoice gettaxinvoice (string corpnum, string ntsconfirmnum, string userid) throws popbillexception
public function httaxinvoicexml getxml (string corpnum, string ntsconfirmnum) throws popbillexception // overload
public function httaxinvoicexml getxml (string corpnum, string ntsconfirmnum, string userid) throws popbillexception
public function httaxinvoice tohttaxinvoice (ref oleobject dic)
public function string getflatratepopupurl (string corpnum) throws popbillexception // overload
public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception
public function flatratestate getflatratestate (string corpnum) throws popbillexception	// overload
public function flatratestate getflatratestate (string corpnum, string userid) throws popbillexception
public function string getcertificatepopupurl (string corpnum) throws popbillexception	// overload 
public function string getcertificatepopupurl (string corpnum, string userid) throws popbillexception
public function string getcertificateexpiredate (string corpnum) throws popbillexception	// overload
public function string getcertificateexpiredate (string corpnum, string userid) throws popbillexception
public function string getpopupurl (string corpnum, string ntsconfirmnum) throws popbillexception
public function string getpopupurl (string corpnum, string ntsconfirmnum, string userid) throws popbillexception
public function string getprinturl (string corpnum, string ntsconfirmnum) throws popbillexception
public function string getprinturl (string corpnum, string ntsconfirmnum, string userid) throws popbillexception

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

dic = httpget("/HomeTax/Taxinvoice/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function string requestjob (string corpnum, string keytype, string dtype, string sdate, string edate) throws popbillexception;
	return requestjob(corpnum, keytype, dtype, sdate, edate, "")
end function

public function string requestjob (string corpnum, string keytype, string dtype, string sdate, string edate, string userid) throws popbillexception; string jobid
string uri
oleobject dic

uri = "/HomeTax/Taxinvoice/"+keytype
uri += "?DType="+dtype
uri += "&SDate="+sdate
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

dic = httpget("/HomeTax/Taxinvoice/"+jobid+"/State", corpnum, userid)
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
	response = httpget("/HomeTax/Taxinvoice/JobList" , CorpNum, "")
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
	
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public subroutine listactivejob (string corpnum, ref jobstate ref_returnlist[], string userid) throws popbillexception;
oleobject infoDic
Integer i

any response

try 
	response = httpget("/HomeTax/Taxinvoice/JobList" , CorpNum, userid)
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
	
catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order) throws popbillexception
	return search (corpnum, jobid, titype, taxtype, purposetype, taxregidyn, taxregidtype, taxregid, page, perpage, order, "", "")
end function 

public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order, string userid) throws popbillexception
	return search (corpnum, jobid, titype, taxtype, purposetype, taxregidyn, taxregidtype, taxregid, page, perpage, order, userid, "")
end function

public function httaxinvoicesearch search (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, int page, int perpage, string order, string userid, string searchstring) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i
httaxinvoicesearch result

uri = "/HomeTax/Taxinvoice/" + jobid

tmpstr = ""
for i = 1 to upperbound(titype)
	tmpstr += titype[i] 
	if i < upperbound(titype) then tmpstr+= ','
next
uri += "?Type=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(taxtype)
	tmpstr += taxtype[i] 
	if i < upperbound(taxtype) then tmpstr+= ','
next
uri += "&TaxType=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(purposetype)
	tmpstr += purposetype[i] 
	if i < upperbound(purposetype) then tmpstr+= ','
next
uri += "&PurposeType=" + tmpstr

if not (taxregidyn <> "") then
	uri += "&TaxRegIDYN=" +taxregidyn
end if

uri += "&TaxRegID=" + taxregid
uri += "&TaxRegIDType=" + taxregidtype

uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
uri += "&Order=" +string(order)

if searchstring <> "" then
	uri += "&SearchString=" + urlencode(searchstring)
end if 


dic = httpget(uri,corpnum,userid)

result = tohttaxinvoicesearch(dic)


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

public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid) throws popbillexception
	return summary(corpnum, jobid, titype, taxtype, purposetype, taxregidyn, taxregidtype, taxregid, "", "")
end function

public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, string userid) throws popbillexception
	return summary(corpnum, jobid, titype, taxtype, purposetype, taxregidyn, taxregidtype, taxregid, userid, "")
end function

public function httaxinvoicesummary summary (string corpnum, string jobid, string titype[], string taxtype[], string purposetype[], string taxregidyn, string taxregidtype, string taxregid, string userid, string searchstring) throws popbillexception
if isnull(jobid) or LenA(jobid) <> 18 then throw exception.setCodeNMessage(-99999999,"작업아이디(jobid)가 올바르지 않습니다.")

oleobject dic
string uri, tmpstr
int i

uri = "/HomeTax/Taxinvoice/" + jobid + "/Summary"

tmpstr = ""
for i = 1 to upperbound(titype)
	tmpstr += titype[i] 
	if i < upperbound(titype) then tmpstr+= ','
next
uri += "?Type=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(taxtype)
	tmpstr += taxtype[i] 
	if i < upperbound(taxtype) then tmpstr+= ','
next
uri += "&TaxType=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(purposetype)
	tmpstr += purposetype[i] 
	if i < upperbound(purposetype) then tmpstr+= ','
next
uri += "&PurposeType=" + tmpstr

if searchstring <> "" then
	uri += "&SearchString=" + urlencode(searchstring)
end if 

if not (taxregidyn <> "") then
	uri += "&TaxRegIDYN=" +taxregidyn
end if

uri += "&TaxRegID=" + taxregid
uri += "&TaxRegIDType=" + taxregidtype



dic = httpget(uri,corpnum,userid)

httaxinvoicesummary result

result.count = dic.Item("count")
result.supplyCostTotal = dic.Item("supplyCostTotal")
result.taxTotal = dic.Item("taxTotal")
result.amountTotal = dic.Item("amountTotal")

return result

end function

public function httaxinvoicesearch tohttaxinvoicesearch (ref oleobject dic);
httaxinvoicesearch result

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
		result.list[i] = totaxinvoiceabbr(list[i])
	next
end if

return result
end function

private function httaxinvoiceabbr totaxinvoiceabbr (ref oleobject dic); 
httaxinvoiceabbr result

result.ntsconfirmNum = string(dic.Item("ntsconfirmNum"))
result.writeDate = string(dic.Item("writeDate"))
result.issueDate = string(dic.Item("issueDate"))
result.sendDate = string(dic.Item("sendDate"))
result.taxType = string(dic.Item("taxType"))
result.purposeType = string(dic.Item("purposeType"))
result.supplyCostTotal = string(dic.Item("supplyCostTotal"))
result.taxTotal = string(dic.Item("taxTotal"))
result.totalAmount = string(dic.Item("totalAmount"))
result.remark1 = string(dic.Item("remark1"))
result.invoiceType = string(dic.Item("invoiceType"))

result.modifyYN = dic.Item("modifyYN")
result.orgNTSConfirmNum = string(dic.Item("orgNTSConfirmNum"))

result.purchaseDate = string(dic.Item("purchaseDate"))
result.itemName = string(dic.Item("itemName"))
result.spec = string(dic.Item("spec"))
result.qty = string(dic.Item("qty"))
result.unitCost = string(dic.Item("unitCost"))
result.supplyCost = string(dic.Item("supplyCost"))
result.tax = string(dic.Item("tax"))
result.remark = string(dic.Item("remark"))

result.invoicerCorpNum = string(dic.Item("invoicerCorpNum"))
result.invoicerTaxRegID = string(dic.Item("invoicerTaxRegID"))
result.invoicerCorpName = string(dic.Item("invoicerCorpName"))
result.invoicerCEOName = string(dic.Item("invoicerCEOName"))
result.invoicerEmail = string(dic.Item("invoicerEmail"))

result.invoiceeCorpNum = string(dic.Item("invoiceeCorpNum"))
result.invoiceeType = string(dic.Item("invoiceeType"))
result.invoiceeTaxRegID = string(dic.Item("invoiceeTaxRegID"))
result.invoiceeCorpName = string(dic.Item("invoiceeCorpName"))
result.invoiceeCEOName = string(dic.Item("invoiceeCEOName"))
result.invoiceeEmail1 = string(dic.Item("invoiceeEmail1"))
result.invoiceeEmail2 = string(dic.Item("invoiceeEmail2"))

result.trusteeCorpNum = string(dic.Item("trusteeCorpNum"))
result.trusteeTaxRegID = string(dic.Item("trusteeTaxRegID"))
result.trusteeCorpName = string(dic.Item("tursteeCorpName"))
result.trusteeCEOName = string(dic.Item("tursteeCEOName"))
result.trusteeEmail = string(dic.Item("trusteeEmail"))


return result
end function

public function httaxinvoice gettaxinvoice (string corpnum, string ntsconfirmnum) throws popbillexception
	return gettaxinvoice(corpnum, ntsconfirmnum, "")
end function 

public function httaxinvoice gettaxinvoice (string corpnum, string ntsconfirmnum, string userid) throws popbillexception
if isnull(ntsconfirmnum) or LenA(ntsconfirmnum) <> 24 then throw exception.setCodeNMessage(-99999999,"국세청승인번호(ntsconfirmNum)가 올바르지 않습니다.")

httaxinvoice result
oleobject dic
int i

dic = httpget("/HomeTax/Taxinvoice/" + ntsconfirmnum , CorpNum, userid)
result = tohttaxinvoice(dic)
oleobject toDestory[]

if not isnull(dic.Item("detailList")) then
	toDestory = dic.Item("detailList")
	for i = 1 to upperbound(toDestory)
		toDestory[i].DisconnectObject()
		destroy toDestory[i]
	next
end if

dic.DisconnectObject()
destroy dic

return result
end function

public function httaxinvoicexml getxml (string corpnum, string ntsconfirmnum) throws popbillexception
	return getxml(corpnum, ntsconfirmnum, "")
end function 

public function httaxinvoicexml getxml (string corpnum, string ntsconfirmnum, string userid) throws popbillexception
if isnull(ntsconfirmnum) or LenA(ntsconfirmnum) <> 24 then throw exception.setCodeNMessage(-99999999,"국세청승인번호(ntsconfirmNum)가 올바르지 않습니다.")

httaxinvoicexml result
oleobject dic
int i

dic = httpget("/HomeTax/Taxinvoice/" + ntsconfirmnum+"?T=xml" , CorpNum, userid)
result.ResultCode = dic.Item("ResultCode")
result.Message = dic.Item("Message")
result.retObject = dic.Item("retObject")

dic.DisconnectObject()
destroy dic

return result
end function

public function httaxinvoice tohttaxinvoice (ref oleobject dic);
httaxinvoice result

result.writeDate = string(dic.Item("writeDate"))
result.issueDT = string(dic.Item("issueDT"))
result.invoiceType = dic.Item("invoiceType")
result.taxType = string(dic.Item("taxType"))
result.taxTotal = string(dic.Item("taxTotal"))
result.supplyCostTotal = string(dic.Item("supplyCostTotal"))
result.totalAmount = string(dic.Item("totalAmount"))
result.purposeType = string(dic.Item("purposeType"))
result.serialNum = string(dic.Item("serialNum"))
result.cash = string(dic.Item("cash"))
result.chkBill = string(dic.Item("chkBill"))
result.credit = string(dic.Item("credit"))
result.note = string(dic.Item("note"))
result.remark1 = string(dic.Item("remark1"))
result.remark2 = string(dic.Item("remark2"))
result.remark3 = string(dic.Item("remark3"))
result.ntsconfirmNum = string(dic.Item("ntsconfirmNum"))
result.modifyCode = string(dic.Item("modifyCode"))
result.orgNTSConfirmNum = string(dic.Item("orgNTSConfirmNum"))
result.invoicerCorpNum = string(dic.Item("invoicerCorpNum"))
result.invoicerMgtKey = string(dic.Item("invoicerMgtKey"))
result.invoicerTaxRegID = string(dic.Item("invoicerTaxRegID"))
result.invoicerCorpName = string(dic.Item("invoicerCorpName"))
result.invoicerCEOName = string(dic.Item("invoicerCEOName"))
result.invoicerAddr = string(dic.Item("invoicerAddr"))
result.invoicerBizType = string(dic.Item("invoicerBizType"))
result.invoicerBizClass = string(dic.Item("invoicerBizClass"))
result.invoicerContactName = string(dic.Item("invoicerContactName"))
result.invoicerTEL = string(dic.Item("invoicerTEL"))
result.invoicerEmail = string(dic.Item("invoicerEmail"))
result.invoiceeCorpNum = string(dic.Item("invoiceeCorpNum"))
result.invoiceeType = string(dic.Item("inoviceeType"))
result.invoiceeMgtKey = string(dic.Item("invoiceeMgtKey"))
result.invoiceeTaxRegID = string(dic.Item("invoiceeTaxRegID"))
result.invoiceeCorpName = string(dic.Item("invoiceeCorpName"))
result.invoiceeCEOName = string(dic.Item("invoiceeCEOName"))
result.invoiceeAddr = string(dic.Item("invoiceeAddr"))
result.invoiceeBizType = string(dic.Item("invoiceeBizType"))
result.invoiceeBizClass = string(dic.Item("invoiceeBizClass"))
result.invoiceeContactName1 = string(dic.Item("invoiceeContactName1"))
result.invoiceeTEL1 = string(dic.Item("invoiceeTEL1"))
result.invoiceeEmail1 = string(dic.Item("invoiceeEmail1"))
result.invoiceeContactName2 = string(dic.Item("invoiceeContactName2"))
result.invoiceeTEL2 = string(dic.Item("invoiceeTEL2"))
result.invoiceeEmail2 = string(dic.Item("invoiceeEmail2"))
result.trusteeCorpNum = string(dic.Item("trusteeCorpNum"))
result.trusteeMgtKey = string(dic.Item("tursteeMgtKey"))
result.trusteeTaxRegID = string(dic.Item("trusteeTaxRegID"))
result.trusteeCorpName = string(dic.Item("trusteeCorpName"))
result.trusteeCEOName = string(dic.Item("trusteeCEOName"))
result.trusteeAddr = string(dic.Item("trusteeAddr"))
result.trusteeBizType = string(dic.Item("trusteeBizType"))
result.trusteeBizClass = string(dic.Item("tursteeBizClass"))
result.trusteeContactName = string(dic.Item("trusteeContactName"))
result.trusteeTEL = string(dic.Item("trusteeTEL"))
result.trusteeEmail = string(dic.Item("trusteeEmail"))


Integer i
oleobject detailList[]
detailList = dic.Item("detailList")

for i = 1 to upperbound(detailList)
	result.detailList[i].serialNum = detailList[i].Item("serialNum")
	result.detailList[i].purchaseDT = string(detailList[i].Item("purchaseDT"))
	result.detailList[i].itemName = string(detailList[i].Item("itemName"))
	result.detailList[i].spec = string(detailList[i].Item("spec"))
	result.detailList[i].qty = string(detailList[i].Item("qty"))
	result.detailList[i].unitCost = string(detailList[i].Item("unitCost"))
	result.detailList[i].supplyCost = string(detailList[i].Item("supplyCost"))
	result.detailList[i].tax = string(detailList[i].Item("tax"))
	result.detailList[i].remark = string(detailList[i].Item("remark"))
next

return result
end function

public function string getflatratepopupurl (string corpnum) throws popbillexception;
	return getflatratepopupurl(corpnum, "")
end function

public function string getflatratepopupurl (string corpnum, string userid) throws popbillexception;
string url
oleObject result

result = httpget("/HomeTax/Taxinvoice?TG=CHRG", CorpNum,Userid)
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

dic = httpget("/HomeTax/Taxinvoice/Contract", CorpNum, userid)
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

result = httpget("/HomeTax/Taxinvoice?TG=CERT", CorpNum,Userid)
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

dic = httpget("/HomeTax/Taxinvoice/CertInfo", CorpNum, UserID)
tmp = String(dic.Item("certificateExpiration"))
result = MidA(tmp,1,4) + "-" + MidA(tmp,5,2) + "-" + MidA(tmp,7,2) + " " + MidA(tmp,9,2) + ":" +  MidA(tmp,11,2) + ":" + MidA(tmp,13,2)
dic.DisconnectObject()
destroy dic

return result
end function

public function string getpopupurl (string corpnum, string ntsconfirmnum) throws popbillexception;
	return getpopupurl(corpnum, ntsconfirmnum, "")
end function 

public function string getpopupurl (string corpnum, string ntsconfirmnum, string userid) throws popbillexception;
if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(ntsconfirmnum) or LenA(ntsconfirmnum) <> 24 then throw exception.setCodeNMessage(-99999999,"국세청승인번호(ntsconfirmNum)가 올바르지 않습니다.")

string url
oleObject result

result = httpget("/HomeTax/Taxinvoice/"+ntsconfirmnum+"/PopUp", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function 

public function string getprinturl (string corpnum, string ntsconfirmnum) throws popbillexception;
	return getprinturl(corpnum, ntsconfirmnum, "")
end function 

public function string getprinturl (string corpnum, string ntsconfirmnum, string userid) throws popbillexception;
if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if isnull(ntsconfirmnum) or LenA(ntsconfirmnum) <> 24 then throw exception.setCodeNMessage(-99999999,"국세청승인번호(ntsconfirmNum)가 올바르지 않습니다.")

string url
oleObject result

result = httpget("/HomeTax/Taxinvoice/"+ntsconfirmnum+"/Print", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function 

public function response checkcertvalidation (string corpnum) throws popbillexception;
	return checkcertvalidation(corpnum, "")
end function

public function response checkcertvalidation (string corpnum, string userid) throws popbillexception;response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	
	dic = httpget("/HomeTax/Taxinvoice/CertCheck", corpnum, userid)
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

dic = httppost("/HomeTax/Taxinvoice/DeptUser",corpnum,postData,userid,"")
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
	
	dic = httpget("/HomeTax/Taxinvoice/DeptUser", corpnum, userid)
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
	
	dic = httpget("/HomeTax/Taxinvoice/DeptUser/Check", corpnum, userid)
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

dic = httppost("/HomeTax/Taxinvoice/DeptUser",corpnum,"",userid,"DELETE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

event constructor;call super::constructor;addscope("111")
end event 

on httaxinvoiceservice.create
call super::create
end on

on httaxinvoiceservice.destroy
call super::destroy
end on

