$PBExportHeader$taxinvoiceservice.sru
forward
global type taxinvoiceservice from baseservice
end type
end forward

global type taxinvoiceservice from baseservice
end type
global taxinvoiceservice taxinvoiceservice

forward prototypes
public function decimal getunitcost (string corpnum) throws popbillexception
public function string getcertificateexpiredate (string corpnum) throws popbillexception
public function boolean checkmgtkeyinuse (string corpnum, string keytype, string mgtkey) throws popbillexception
public function taxinvoiceinfo getinfo (string corpnum, string keytype, string mgtkey) throws popbillexception
public function response register (string corpnum, ref taxinvoice ar_taxinvoice) throws popbillexception
public function response register (string corpnum, ref taxinvoice ar_taxinvoice, boolean writespecification) throws popbillexception
public function response register (string corpnum, ref taxinvoice ar_taxinvoice, boolean writespecification, string userid) throws popbillexception
private function taxinvoiceinfo totaxinvoiceinfo (ref oleobject dic)
private function string taxinvoicetojson (ref taxinvoice ar_taxinvoice, boolean writespecification)
public function response erase (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function response erase (string corpnum, string keytype, string mgtkey) throws popbillexception
public function response send (string corpnum, string keytype, string mgtkey, string memo, string emailsubject, string userid) throws popbillexception
public function response send (string corpnum, string keytype, string mgtkey, string memo, string emailsubject) throws popbillexception
public function response cancelsend (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response cancelsend (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response accept (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response accept (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response deny (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response deny (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response cancelissue (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response cancelissue (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice) throws popbillexception
public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice, string memo) throws popbillexception
public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice, string memo, string userid) throws popbillexception
public function response request (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response request (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response cancelrequest (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response cancelrequest (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response refuse (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response refuse (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo) throws popbillexception
public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue) throws popbillexception
public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey) throws popbillexception
public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey, string emailsubject) throws popbillexception
public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey, string emailsubject, string userid) throws popbillexception
public function response issue (string corpnum, string keytype, string mgtkey, string memo, boolean forceissue, string userid) throws popbillexception
public function response issue (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception
public function response issue (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception
public function response issue (string corpnum, string keytype, string mgtkey, string memo, boolean forceissue) throws popbillexception
public function response sendtonts (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function response sendtonts (string corpnum, string keytype, string mgtkey) throws popbillexception
public subroutine getemailpublickeys (string corpnum, ref emailpublickey ref_list[]) throws popbillexception
public subroutine getinfos (string corpnum, string keytype, ref string mgtkeylist[], ref taxinvoiceinfo ref_returnlist[]) throws popbillexception
public subroutine getlogs (string corpnum, string keytype, string mgtkey, ref taxinvoicelog ref_list[]) throws popbillexception
public function response update (string corpnum, string keytype, string mgtkey, ref taxinvoice ar_taxinvoice, string userid) throws popbillexception
public function response update (string corpnum, string keytype, string mgtkey, ref taxinvoice ar_taxinvoice) throws popbillexception
public function response sendemail (string corpnum, string keytype, string mgtkey, string receiver, string userid) throws popbillexception
public function response sendemail (string corpnum, string keytype, string mgtkey, string receiver) throws popbillexception
public function response sendsms (string corpnum, string keytype, string mgtkey, string sender, string receiver, string contents, string userid) throws popbillexception
public function response sendsms (string corpnum, string keytype, string mgtkey, string sender, string receiver, string contents) throws popbillexception
public function response sendfax (string corpnum, string keytype, string mgtkey, string sender, string receiver) throws popbillexception	
public function response sendfax (string corpnum, string keytype, string mgtkey, string sender, string receiver, string userid) throws popbillexception
public function string geturl (string corpnum, string togo) throws popbillexception
public function string geturl (string corpnum, string userid, string togo) throws popbillexception
public function string getpopupurl (string corpnum, string keytype, string mgtkey) throws popbillexception // getpopupurl overload
public function string getpopupurl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function string getViewURL (string corpnum, string keytype, string mgtkey) throws popbillexception // getpopupurl overload
public function string getViewURL (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception

public function string getprinturl (string corpnum, string keytype, string mgtkey) throws popbillexception	// getprinturl overload
public function string getprinturl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function string geteprinturl (string corpnum, string keytype, string mgtkey) throws popbillexception	// geteprinturl overload
public function string geteprinturl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function string getmailurl (string corpnum, string keytype, string mgtkey) throws popbillexception	// getmailurl overload
public function string getmailurl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception
public function string getmassprinturl (string corpnum, string keytype, string mgtkeylist[]) throws popbillexception	// getmassprinturl overload
public function string getmassprinturl (string corpnum, string keytype, string mgtkeylist[], string userid) throws popbillexception
public function taxinvoice getdetailinfo (string corpnum, string keytype, string mgtkey) throws popbillexception
public function taxinvoice totaxinvoice (ref oleobject dic)

public function response attachfile (string corpnum, string keytype, string mgtkey, string filepath, string userid, string filename) throws popbillexception
public function response attachfile (string corpnum, string keytype, string mgtkey, string filepath, string filename) throws popbillexception
public subroutine getfiles (string corpnum, string keytype, string mgtkey, ref attachedfile ref_filelist[]) throws popbillexception
public function response deletefile (string corpnum, string keytype, string mgtkey, string fileid, string userid) throws popbillexception
public function response deletefile (string corpnum, string keytype, string mgtkey, string fileid) throws popbillexception
public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string order, int page, int perpage) throws popbillexception
public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string order, int page, int perpage) throws popbillexception
public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage) throws popbillexception
public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage, string interOPYN) throws popbillexception
public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage, string interOPYN, string issuetype[]) throws popbillexception
public function tisearchresult totisearchresult (ref oleobject dic)
public function response attachstatement (string corpnum, string keytype, string mgtkey, int itemcode, string submgtkey) throws popbillexception
public function response detachstatement (string corpnum, string keytype, string mgtkey, int itemcode, string submgtkey) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception

public function response assignmgtkey (string corpnum, string keytype, string itemkey, string mgtkey) throws popbillexception
public function response assignmgtkey (string corpnum, string keytype, string itemkey, string mgtkey, string userid) throws popbillexception

public subroutine listEmailconfig (string corpnum, ref emailconfig ref_returnlist[]) throws popbillexception
public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN) throws popbillexception
public function response updateEmailConfig(string corpnum, string emailtype, boolean sendYN, string userid) throws popbillexception
public function emailconfig toemailconfig(ref oleobject dic)

public function response checkcertvalidation (string corpnum) throws popbillexception
public function response checkcertvalidation (string corpnum, string userid) throws popbillexception

public function string getSealURL (string corpnum, string userid) throws popbillexception
public function string getTaxCertURL (string corpnum, string userid) throws popbillexception

end prototypes

public function decimal getunitcost (string corpnum) throws popbillexception;decimal unitcost
oleObject result

result = httpget("/Taxinvoice?cfg=UNITCOST" , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

public function string getcertificateexpiredate (string corpnum) throws popbillexception;string result
oleObject dic
string tmp

dic = httpget("/Taxinvoice?cfg=CERT", CorpNum,"")
tmp = String(dic.Item("certificateExpiration"))
result = MidA(tmp,1,4) + "-" + MidA(tmp,5,2) + "-" + MidA(tmp,7,2) + " " + MidA(tmp,9,2) + ":" +  MidA(tmp,11,2) + ":" + MidA(tmp,13,2)
dic.DisconnectObject()
destroy dic

return result
end function

public function boolean checkmgtkeyinuse (string corpnum, string keytype, string mgtkey) throws popbillexception;oleobject dic
string IK

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

try
	dic = httpget("/Taxinvoice/" + KeyType + "/" + MgtKey , CorpNum,"")
	IK = string(dic.Item("itemKey"))
	return (isnull(IK) or IK = "") = false
	
catch(popbillexception pe)
	if pe.getcode() = -11000005 then return false
	throw pe
end try
end function

public function taxinvoiceinfo getinfo (string corpnum, string keytype, string mgtkey) throws popbillexception;taxinvoiceInfo result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httpget("/Taxinvoice/" + KeyType + "/" + MgtKey , CorpNum,"")
result = totaxinvoiceinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function response register (string corpnum, ref taxinvoice ar_taxinvoice) throws popbillexception;return register(corpnum,ar_taxinvoice,false,"")
end function

public function response register (string corpnum, ref taxinvoice ar_taxinvoice, boolean writespecification) throws popbillexception;return register(corpnum,ar_taxinvoice,writespecification, "")
end function

public function response register (string corpnum, ref taxinvoice ar_taxinvoice, boolean writespecification, string userid) throws popbillexception;response result
oleobject dic

String postData

postData = taxinvoiceToJson(ar_taxinvoice,writespecification)

dic = httppost("/Taxinvoice",corpnum,postData,userid)
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

private function taxinvoiceinfo totaxinvoiceinfo (ref oleobject dic);
taxinvoiceinfo result

result.closedownstate = Integer(dic.Item("closeDownState"))
result.closedownstatedate = string(dic.Item("closeDownStateDate"))

result.itemkey = string(dic.Item("itemKey"))
result.taxType = string(dic.Item("taxType"))
result.writeDate = string(dic.Item("writeDate"))
result.regDT = string(dic.Item("regDT"))
result.invoicerCorpName = string(dic.Item("invoicerCorpName"))
result.invoicerCorpNum = string(dic.Item("invoicerCorpNum"))
result.invoicerMgtKey = string(dic.Item("invoicerMgtKey"))
result.invoiceeCorpName =string( dic.Item("invoiceeCorpName"))
result.invoiceeCorpNum = string(dic.Item("invoiceeCorpNum"))
result.invoiceeMgtKey = string(dic.Item("invoiceeMgtKey"))
result.trusteeCorpName = string(dic.Item("trusteeCorpName"))
result.trusteeCorpNum =  string(dic.Item("trusteeCorpNum"))
result.trusteeMgtKey =  string(dic.Item("trusteeMgtKey"))
result.supplyCostTotal = string( dic.Item("supplyCostTotal"))
result.taxTotal = string( dic.Item("taxTotal"))
result.purposeType = string(dic.Item("purposeType"))
result.modifyCode =  Integer(dic.Item("modifyCode"))
result.issueType = string( dic.Item("issueType"))
result.issueDT = string( dic.Item("issueDT"))
result.preIssueDT = string( dic.Item("preIssueDT"))
result.stateCode = Integer(dic.Item("stateCode"))
result.stateDT = string( dic.Item("stateDT"))
result.openYN =  dic.Item("openYN")
result.openDT = string( dic.Item("openDT"))
result.ntsresult =  string(dic.Item("ntsresult"))
result.ntsconfirmNum =  string(dic.Item("ntsconfirmNum"))
result.ntssendDT = string( dic.Item("ntssendDT"))
result.ntsresultDT = string( dic.Item("ntsresultDT"))
result.ntssendErrCode = string( dic.Item("ntssendErrCode"))
result.stateMemo = string( dic.Item("stateMemo"))
result.lateIssueYN = dic.Item("lateIssueYN")
result.invoicerPrintYN = dic.Item("invoicerPrintYN")
result.invoiceePrintYN = dic.Item("invoiceePrintYN")
result.trusteePrintYN = dic.Item("trusteePrintYN")
result.interOPYN = dic.Item("interOPYN")

return result
end function

private function string taxinvoicetojson (ref taxinvoice ar_taxinvoice, boolean writespecification);string result
result = ""
result += "{"

if ar_taxinvoice.writespecification then
	result += '"writeSpecification":true,'
end if

if ar_taxinvoice.forceissue then
	result += '"forceIssue":true,'
end if

result += '"dealInvoiceMgtKey":"' +escapeString(ar_taxinvoice.dealInvoiceMgtKey) +'",'
result += '"memo":"' +escapeString(ar_taxinvoice.memo) +'",'
result += '"emailSubject":"' +escapeString(ar_taxinvoice.emailSubject) +'",'

if writespecification then 
result += '"writeSpecification":true,'
end if

result += '"writeDate":"' + escapeString(ar_taxinvoice.writeDate) + '",'

result += '"chargeDirection":"' + escapeString(ar_taxinvoice.chargeDirection) + '",'
result += '"issueType":"' + escapeString(ar_taxinvoice.issueType) + '",'
result += '"issueTiming":"' + escapeString(ar_taxinvoice.issueTiming) + '",'
result += '"taxType":"' + escapeString(ar_taxinvoice.taxType) + '",'

result += '"invoicerCorpNum":"' + escapeString(ar_taxinvoice.invoicerCorpNum) + '",'
result += '"invoicerMgtKey":"' + escapeString(ar_taxinvoice.invoicerMgtKey) + '",'
result += '"invoicerTaxRegID":"' + escapeString(ar_taxinvoice.invoicerTaxRegID) + '",'
result += '"invoicerCorpName":"' + escapeString(ar_taxinvoice.invoicerCorpName) + '",'
result += '"invoicerCEOName":"' + escapeString(ar_taxinvoice.invoicerCEOName) + '",'
result += '"invoicerAddr":"' + escapeString(ar_taxinvoice.invoicerAddr) + '",'
result += '"invoicerBizClass":"' + escapeString(ar_taxinvoice.invoicerBizClass) + '",'
result += '"invoicerBizType":"' + escapeString(ar_taxinvoice.invoicerBizType) + '",'
result += '"invoicerContactName":"' + escapeString(ar_taxinvoice.invoicerContactName) + '",'
result += '"invoicerDeptName":"' + escapeString(ar_taxinvoice.invoicerDeptName) + '",'
result += '"invoicerTEL":"' + escapeString(ar_taxinvoice.invoicerTEL) + '",'
result += '"invoicerHP":"' + escapeString(ar_taxinvoice.invoicerHP) + '",'
result += '"invoicerEmail":"' + escapeString(ar_taxinvoice.invoicerEmail) + '",'
if ar_taxinvoice.invoicersmssendyn then
result += '"invoicerSMSSendYN":true,'
end if

result += '"invoiceeType":"' + escapeString(ar_taxinvoice.invoiceeType) + '",'
result += '"invoiceeCorpNum":"' + escapeString(ar_taxinvoice.invoiceeCorpNum) + '",'
result += '"invoiceeMgtKey":"' + escapeString(ar_taxinvoice.invoiceeMgtKey) + '",'
result += '"invoiceeTaxRegID":"' + escapeString(ar_taxinvoice.invoiceeTaxRegID) + '",'
result += '"invoiceeCorpName":"' + escapeString(ar_taxinvoice.invoiceeCorpName) + '",'
result += '"invoiceeCEOName":"' + escapeString(ar_taxinvoice.invoiceeCEOName) + '",'
result += '"invoiceeAddr":"' + escapeString(ar_taxinvoice.invoiceeAddr) + '",'
result += '"invoiceeBizClass":"' + escapeString(ar_taxinvoice.invoiceeBizClass) + '",'
result += '"invoiceeBizType":"' + escapeString(ar_taxinvoice.invoiceeBizType) + '",'
result += '"invoiceeContactName1":"' + escapeString(ar_taxinvoice.invoiceeContactName1) + '",'
result += '"invoiceeDeptName1":"' + escapeString(ar_taxinvoice.invoiceeDeptName1) + '",'
result += '"invoiceeTEL1":"' + escapeString(ar_taxinvoice.invoiceeTEL1) + '",'
result += '"invoiceeHP1":"' + escapeString(ar_taxinvoice.invoiceeHP1) + '",'
result += '"invoiceeEmail1":"' + escapeString(ar_taxinvoice.invoiceeEmail1) + '",'
result += '"invoiceeContactName2":"' + escapeString(ar_taxinvoice.invoiceeContactName2) + '",'
result += '"invoiceeDeptName2":"' + escapeString(ar_taxinvoice.invoiceeDeptName2) + '",'
result += '"invoiceeTEL2":"' + escapeString(ar_taxinvoice.invoiceeTEL2) + '",'
result += '"invoiceeHP2":"' + escapeString(ar_taxinvoice.invoiceeHP2) + '",'
result += '"invoiceeEmail2":"' + escapeString(ar_taxinvoice.invoiceeEmail2) + '",'
if ar_taxinvoice.invoiceesmssendyn then
result += '"invoiceeSMSSendYN":true,'
end if

result += '"trusteeCorpNum":"' + escapeString(ar_taxinvoice.trusteeCorpNum) + '",'
result += '"trusteeMgtKey":"' + escapeString(ar_taxinvoice.trusteeMgtKey) + '",'
result += '"trusteeTaxRegID":"' + escapeString(ar_taxinvoice.trusteeTaxRegID) + '",'
result += '"trusteeCorpName":"' + escapeString(ar_taxinvoice.trusteeCorpName) + '",'
result += '"trusteeCEOName":"' + escapeString(ar_taxinvoice.trusteeCEOName) + '",'
result += '"trusteeAddr":"' + escapeString(ar_taxinvoice.trusteeAddr) + '",'
result += '"trusteeBizClass":"' + escapeString(ar_taxinvoice.trusteeBizClass) + '",'
result += '"trusteeBizType":"' + escapeString(ar_taxinvoice.trusteeBizType) + '",'
result += '"trusteeContactName":"' + escapeString(ar_taxinvoice.trusteeContactName) + '",'
result += '"trusteeDeptName":"' + escapeString(ar_taxinvoice.trusteeDeptName) + '",'
result += '"trusteeTEL":"' + escapeString(ar_taxinvoice.trusteeTEL) + '",'
result += '"trusteeHP":"' + escapeString(ar_taxinvoice.trusteeHP) + '",'
result += '"trusteeEmail":"' + escapeString(ar_taxinvoice.trusteeEmail) + '",'
if ar_taxinvoice.trusteesmssendyn then
result += '"trusteeSMSSendYN":true,'
end if

result += '"taxTotal":"' + escapeString(ar_taxinvoice.taxTotal) + '",'
result += '"supplyCostTotal":"' + escapeString(ar_taxinvoice.supplyCostTotal) + '",'
result += '"totalAmount":"' + escapeString(ar_taxinvoice.totalAmount) + '",'
if (isnull(ar_taxinvoice.modifyCode) or ar_taxinvoice.modifycode = "") = false then
result += '"modifyCode":' + escapeString(ar_taxinvoice.modifyCode) + ','	
end if

result += '"orgNTSConfirmNum":"' + escapeString(ar_taxinvoice.orgNTSConfirmNum) + '",'
result += '"purposeType":"' + escapeString(ar_taxinvoice.purposeType) + '",'
result += '"serialNum":"' + escapeString(ar_taxinvoice.serialNum) + '",'
result += '"cash":"' + escapeString(ar_taxinvoice.cash) + '",'
result += '"chkBill":"' + escapeString(ar_taxinvoice.chkBill) + '",'
result += '"credit":"' + escapeString(ar_taxinvoice.credit) + '",'
result += '"note":"' + escapeString(ar_taxinvoice.note) + '",'
if (isnull(ar_taxinvoice.kwon) or ar_taxinvoice.kwon = "") = false then
result += '"kwon":' + escapeString(ar_taxinvoice.kwon) + ','	
end if
if (isnull(ar_taxinvoice.ho) or ar_taxinvoice.kwon = "") = false then
result += '"ho":' + escapeString(ar_taxinvoice.ho) + ','
end if

if ar_taxinvoice.BusinessLicenseYN then
result += '"businessLicenseYN":true,'
end if
if ar_taxinvoice.bankBookYN then
result += '"bankBookYN":true,'
end if

result += '"ntsconfirmNum":"' + escapeString(ar_taxinvoice.ntsconfirmNum) + '",'
result += '"originalTaxinvoiceKey":"' + escapeString(ar_taxinvoice.originalTaxinvoiceKey) + '",'

Integer i

if upperbound(ar_taxinvoice.detailList) > 0 then
	result += '"detailList":['
	
	for i = 1 to upperbound(ar_taxinvoice.detailList)
		result += '{'
		result += '"serialNum":' + String(ar_taxinvoice.detailList[i].serialNum) + ','	
		result += '"purchaseDT":"' + escapeString(ar_taxinvoice.detailList[i].purchaseDT) + '",'
		result += '"itemName":"' + escapeString(ar_taxinvoice.detailList[i].itemName) + '",'
		result += '"spec":"' + escapeString(ar_taxinvoice.detailList[i].spec) + '",'
		result += '"qty":"' + escapeString(ar_taxinvoice.detailList[i].qty) + '",'
		result += '"unitCost":"' + escapeString(ar_taxinvoice.detailList[i].unitCost) + '",'
		result += '"supplyCost":"' + escapeString(ar_taxinvoice.detailList[i].supplyCost) + '",'
		result += '"tax":"' + escapeString(ar_taxinvoice.detailList[i].tax) + '",'
		result += '"remark":"' + escapeString(ar_taxinvoice.detailList[i].remark) + '"'
		result += '}'
		if i < upperbound(ar_taxinvoice.detailList) then
			result += ','
		end if
	next
	
	result += '],'
end if

if upperbound(ar_taxinvoice.addContactList) > 0 then
	result += '"addContactList":['
	
	for i = 1 to upperbound(ar_taxinvoice.addContactList)
		result += '{'
		result += '"serialNum":"' + String(ar_taxinvoice.addContactList[i].serialNum) + '",'
		result += '"email":"' + escapeString(ar_taxinvoice.addContactList[i].email) + '",'
		result += '"contactName":"' + escapeString(ar_taxinvoice.addContactList[i].contactName) + '"'
		result += '}'
		if i < upperbound(ar_taxinvoice.addContactList) then
			result += ','
		end if
	next
	
	result += '],'
end if

result += '"remark1":"' + escapeString(ar_taxinvoice.remark1) + '",'
result += '"remark2":"' + escapeString(ar_taxinvoice.remark2) + '",'
result += '"remark3":"' + escapeString(ar_taxinvoice.remark3) + '"'
result += "}"

return result
end function

public function response erase (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,"",userid,"DELETE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response erase (string corpnum, string keytype, string mgtkey) throws popbillexception;return erase(corpnum,keytype,mgtkey,"")
end function

public function response send (string corpnum, string keytype, string mgtkey, string memo, string emailsubject, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'","emailSubject":"'+escapestring(emailSubject)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"SEND")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response send (string corpnum, string keytype, string mgtkey, string memo, string emailsubject) throws popbillexception;return send(corpnum,keytype,mgtkey,memo,emailsubject,"")
end function

public function response cancelsend (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"CANCELSEND")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response cancelsend (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return cancelsend(corpnum,keytype,mgtkey,memo,"")
end function

public function response accept (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"ACCEPT")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response accept (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return accept(corpnum,keytype,mgtkey,memo,"")
end function

public function response deny (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"DENY")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response deny (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return deny(corpnum,keytype,mgtkey,memo,"")
end function

public function response cancelissue (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"CANCELISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response cancelissue (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return cancelIssue(corpnum,keytype,mgtkey,memo,"")
end function

public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice) throws popbillexception
	return registrequest(corpnum,ar_taxinvoice,"","")
end function

public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice, string memo) throws popbillexception
	return registrequest(corpnum,ar_taxinvoice,memo,"")
end function

public function response registrequest (string corpnum, ref taxinvoice ar_taxinvoice, string memo, string userid) throws popbillexception
	response result
	oleobject dic
	
	String postData
	ar_taxinvoice.memo = memo
	
	postData = taxinvoiceToJson(ar_taxinvoice,false)
	
	dic = httppost("/Taxinvoice",corpnum,postData,userid,"REQUEST")
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic
	
	return result
end function

public function response request (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"REQUEST")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response request (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return request(corpnum,keytype,mgtkey,memo,"")
end function

public function response cancelrequest (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"CANCELREQUEST")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response cancelrequest (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return cancelrequest(corpnum,keytype,mgtkey,memo,"")
end function

public function response refuse (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"memo":"'+escapestring(memo)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"REFUSE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response refuse (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return refuse(corpnum,keytype,mgtkey,memo,"")
end function

public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo) throws popbillexception;
	return registIssue(corpnum, ar_taxinvoice, memo, false, false, "", "", "")
end function

public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue) throws popbillexception;
	return registIssue(corpnum, ar_taxinvoice, memo, forceissue, false, "")
end function

public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey) throws popbillexception;
	return registIssue(corpnum, ar_taxinvoice, memo, forceissue, writespecification, dealinvoicemgtkey, "")
end function

public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey, string emailsubject) throws popbillexception;
	return registIssue(corpnum, ar_taxinvoice, memo, forceissue, writespecification, dealinvoicemgtkey, emailsubject, "")
end function

public function response registIssue(string corpnum, ref taxinvoice ar_taxinvoice, string memo, boolean forceissue, boolean writespecification, string dealinvoicemgtkey, string emailsubject, string userid) throws popbillexception;
response result
oleobject dic

String postData
ar_taxinvoice.memo = memo
ar_taxinvoice.forceissue = forceissue
ar_taxinvoice.writespecification = writespecification
ar_taxinvoice.dealinvoicemgtkey = dealinvoicemgtkey
ar_taxinvoice.emailsubject = emailsubject

postData = taxinvoiceToJson(ar_taxinvoice,false)

dic = httppost("/Taxinvoice",corpnum,postData,userid,"ISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
result.ntsConfirmNum = dic.Item("ntsConfirmNum")
dic.DisconnectObject()
destroy dic

return result
end function

public function response issue (string corpnum, string keytype, string mgtkey, string memo, boolean forceissue, string userid) throws popbillexception;
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{'
postData += '"memo":"'+escapestring(memo)+'",'
if forceIssue then
postData += '"forceIssue":true'
else
postData += '"forceIssue":false'
end if
postData += '}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"ISSUE")
result.code = dic.Item("code")
result.message = dic.Item("message")
result.ntsConfirmNum = dic.Item("ntsConfirmNum")
dic.DisconnectObject()
destroy dic

return result
end function

public function response issue (string corpnum, string keytype, string mgtkey, string memo, string userid) throws popbillexception;return issue(corpnum,keytype,mgtkey,memo,false,userid)
end function

public function response issue (string corpnum, string keytype, string mgtkey, string memo) throws popbillexception;return issue(corpnum,keytype,mgtkey,memo,false,"")
end function

public function response issue (string corpnum, string keytype, string mgtkey, string memo, boolean forceissue) throws popbillexception;
return issue(corpnum,keytype,mgtkey,memo,forceIssue,"")
end function

public function response sendtonts (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,"",userid,"NTS")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendtonts (string corpnum, string keytype, string mgtkey) throws popbillexception;return sendtonts(corpnum,keytype,mgtkey,"")
end function

public subroutine getemailpublickeys (string corpnum, ref emailpublickey ref_list[]) throws popbillexception;any dicList[]
integer i
oleobject key

any response

try
response = httpget("/Taxinvoice/EmailPublicKeys",corpnum,"")
tarray result
result = create tarray
result = response

for i = 1 to result.getlength()
	key = result.list[i]
	ref_List[i].confirmNum = key.item("confirmNum")
	ref_List[i].email = key.item("email")
	
	key.DisconnectObject()
	destroy key
	
next

catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public subroutine getinfos (string corpnum, string keytype, ref string mgtkeylist[], ref taxinvoiceinfo ref_returnlist[]) throws popbillexception;
any dicList[]
oleobject infoDic
string postData
Integer i

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(mgtkeylist) or upperbound(mgtkeylist) <= 0  then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData ='['

for i = 1 to upperbound(mgtkeylist)
	postData += '"' + mgtkeyList[i] + '"'
	if i < upperbound(mgtkeyList) then postData += ','
next

postData +=']'

try
	
any response
response = httppost("/Taxinvoice/"+keytype, corpnum, postData, "")
tarray result
result = create tarray
result = response
integer resultLength
resultLength = result.getLength()

for i = 1 to resultLength
	infoDic = result.list[i]
	ref_returnlist[i] = totaxinvoiceInfo(infodic)
	
	infoDic.DisconnectObject()
	destroy infoDic
	
next

catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public subroutine getlogs (string corpnum, string keytype, string mgtkey, ref taxinvoicelog ref_list[]) throws popbillexception;any dicList[]
integer i
oleobject log

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

try
	
any tmp
tmp = httpget("/Taxinvoice/" + keytype + "/" + mgtkey + "/Logs",corpnum,"")
tarray result
result = create tarray
result = tmp

for i = 1 to result.getLength()
	log = result.list[i]
	
	ref_List[i].docLogType = log.item("docLogType")
	ref_List[i].log = string(log.item("log"))
	ref_List[i].procType =  string(log.item("procType"))
	ref_List[i].procCorpName =  string(log.item("procCorpName"))
	ref_List[i].procContactName =  string(log.item("procContactName"))
	ref_List[i].procMemo = string(log.item("procMemo"))
	ref_List[i].regDT = string(log.item("regDT"))
	ref_List[i].ip = string( log.item("ip"))
	
	log.DisconnectObject()
	destroy log
	
next

catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine

public function response update (string corpnum, string keytype, string mgtkey, ref taxinvoice ar_taxinvoice, string userid) throws popbillexception;response result
oleobject dic

String postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = taxinvoiceToJson(ar_taxinvoice,false)

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"PATCH")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response update (string corpnum, string keytype, string mgtkey, ref taxinvoice ar_taxinvoice) throws popbillexception;return update(corpnum,keytype,mgtkey,ar_taxinvoice,"")
end function

public function response sendemail (string corpnum, string keytype, string mgtkey, string receiver, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"receiver":"'+escapestring(receiver)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"EMAIL")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendemail (string corpnum, string keytype, string mgtkey, string receiver) throws popbillexception;return sendemail(corpnum,keytype,mgtkey,receiver,"")
end function

public function response sendsms (string corpnum, string keytype, string mgtkey, string sender, string receiver, string contents, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"sender":"'+escapestring(sender)+'","receiver":"'+escapestring(receiver)+'","contents":"'+escapestring(contents)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"SMS")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response sendsms (string corpnum, string keytype, string mgtkey, string sender, string receiver, string contents) throws popbillexception;return sendsms(corpnum,keytype,mgtkey,sender,receiver,contents,"")
end function

public function response sendfax (string corpnum, string keytype, string mgtkey, string sender, string receiver) throws popbillexception;return sendfax(corpnum,keytype,mgtkey,sender,receiver,"")
end function

public function response sendfax (string corpnum, string keytype, string mgtkey, string sender, string receiver, string userid) throws popbillexception;response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{"sender":"'+escapestring(sender)+'","receiver":"'+escapestring(receiver)+'"}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey ,corpnum,postData,userid,"FAX")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function string geturl (string corpnum, string togo) throws popbillexception;
	return geturl (corpnum, "", togo)
end function 

public function string geturl (string corpnum, string userid, string togo) throws popbillexception;string url
oleObject result

result = httpget("/Taxinvoice/?TG=" + togo , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getpopupurl (string corpnum, string keytype, string mgtkey) throws popbillexception;
	return getpopupurl(corpnum, keytype, mgtkey, "")
end function

public function string getpopupurl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Taxinvoice/"+keytype + "/" + mgtkey + "?TG=POPUP" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getViewURL (string corpnum, string keytype, string mgtkey) throws popbillexception;
	return getViewURL(corpnum, keytype, mgtkey, "")
end function

public function string getViewURL (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Taxinvoice/"+keytype + "/" + mgtkey + "?TG=VIEW" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getprinturl (string corpnum, string keytype, string mgtkey) throws popbillexception;
	return getprinturl(corpnum, keytype, mgtkey, "")
end function

public function string getprinturl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Taxinvoice/"+keytype + "/" + mgtkey + "?TG=PRINT" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string geteprinturl (string corpnum, string keytype, string mgtkey) throws popbillexception;
	return geteprinturl(corpnum, keytype, mgtkey, "")
end function 

public function string geteprinturl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Taxinvoice/"+keytype + "/" + mgtkey + "?TG=EPRINT" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getmailurl (string corpnum, string keytype, string mgtkey) throws popbillexception;
	return getmailurl (corpnum, keytype, mgtkey, "")
end function

public function string getmailurl (string corpnum, string keytype, string mgtkey, string userid) throws popbillexception;string url
oleObject result

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

result = httpget("/Taxinvoice/"+keytype + "/" + mgtkey + "?TG=MAIL" , CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getmassprinturl (string corpnum, string keytype, string mgtkeylist[]) throws popbillexception;
	return getmassprinturl(corpnum, keytype, mgtkeylist, "")
end function

public function string getmassprinturl (string corpnum, string keytype, string mgtkeylist[], string userid) throws popbillexception;string url
oleObject result
string postData
Integer i

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(mgtkeylist) or upperbound(mgtkeylist) <= 0 then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData ='['

for i = 1 to upperbound(mgtkeylist)
	postData += '"' + mgtkeyList[i] + '"'
	if i < upperbound(mgtkeyList) then postData += ','
next

postData +=']'

result = httppost("/Taxinvoice/"+keytype + "?Print" , CorpNum,postData,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function taxinvoice getdetailinfo (string corpnum, string keytype, string mgtkey) throws popbillexception;taxinvoice result
oleobject dic
int i

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httpget("/Taxinvoice/" + KeyType + "/" + MgtKey + "?Detail" , CorpNum,"")
result = totaxinvoice(dic)
oleobject toDestory[]

if not isnull(dic.Item("detailList")) then
	toDestory = dic.Item("detailList")
	for i = 1 to upperbound(toDestory)
		toDestory[i].DisconnectObject()
		destroy toDestory[i]
	next
end if

if not isnull(dic.Item("addContactList")) then
	toDestory = dic.Item("addContactList")
	for i = 1 to upperbound(toDestory)
		toDestory[i].DisconnectObject()
		destroy toDestory[i]
	next
end if

dic.DisconnectObject()
destroy dic

return result
end function

public function taxinvoice totaxinvoice (ref oleobject dic);taxinvoice result
result.closedownstate = Integer(dic.Item("closeDownState"))
result.closedownstatedate = string(dic.Item("closeDownStateDate"))

result.writeDate = string(dic.Item("writeDate"))
result.chargeDirection = string(dic.Item("chargeDirection"))
result.issueType = string(dic.Item("issueType"))
result.issueTiming = string(dic.Item("issueTiming"))
result.taxType = string(dic.Item("taxType"))

result.invoicerCorpNum = string(dic.Item("invoicerCorpNum"))
result.invoicerMgtKey = string(dic.Item("invoicerMgtKey"))
result.invoicerTaxRegID = string(dic.Item("invoicerTaxRegID"))
result.invoicerCorpName = string(dic.Item("invoicerCorpName"))
result.invoicerCEOName = string(dic.Item("invoicerCEOName"))
result.invoicerAddr = string(dic.Item("invoicerAddr"))
result.invoicerBizClass = string(dic.Item("invoicerBizClass"))
result.invoicerBizType = string(dic.Item("invoicerBizType"))
result.invoicerContactName = string(dic.Item("invoicerContactName"))
result.invoicerDeptName = string(dic.Item("invoicerDeptName"))
result.invoicerTEL = string(dic.Item("invoicerTEL"))
result.invoicerHP = string(dic.Item("invoicerHP"))
result.invoicerEmail = string(dic.Item("invoicerEmail"))
result.invoicerSMSSendYN = dic.Item("invoicerSMSSendYN")

result.invoiceeType = string(dic.Item("invoiceeType"))
result.invoiceeCorpNum = string(dic.Item("invoiceeCorpNum"))
result.invoiceeMgtKey = string(dic.Item("invoiceeMgtKey"))
result.invoiceeTaxRegID = string(dic.Item("invoiceeTaxRegID"))
result.invoiceeCorpName =string( dic.Item("invoiceeCorpName"))
result.invoiceeCEOName =string( dic.Item("invoiceeCEOName"))
result.invoiceeAddr =string( dic.Item("invoiceeAddr"))
result.invoiceeBizClass =string( dic.Item("invoiceeBizClass"))
result.invoiceeBizType =string( dic.Item("invoiceeBizType"))
result.invoiceeContactName1 =string( dic.Item("invoiceeContactName1"))
result.invoiceeDeptName1 =string( dic.Item("invoiceeDeptName1"))
result.invoiceeTEL1 =string( dic.Item("invoiceeTEL1"))
result.invoiceeHP1 =string( dic.Item("invoiceeHP1"))
result.invoiceeEmail1 =string( dic.Item("invoiceeEmail1"))
result.invoiceeContactName2 =string( dic.Item("invoiceeContactName2"))
result.invoiceeDeptName2 =string( dic.Item("invoiceeDeptName2"))
result.invoiceeTEL2 =string( dic.Item("invoiceeTEL2"))
result.invoiceeHP2 =string( dic.Item("invoiceeHP2"))
result.invoiceeEmail2 =string( dic.Item("invoiceeEmail2"))
result.invoiceeSMSSendYN = dic.Item("invoiceeSMSSendYN")

result.trusteeCorpNum = string(dic.Item("trusteeCorpNum"))
result.trusteeMgtKey = string(dic.Item("trusteeMgtKey"))
result.trusteeTaxRegID = string(dic.Item("trusteeTaxRegID"))
result.trusteeCorpName = string(dic.Item("trusteeCorpName"))
result.trusteeCEOName = string(dic.Item("trusteeCEOName"))
result.trusteeAddr = string(dic.Item("trusteeAddr"))
result.trusteeBizClass = string(dic.Item("trusteeBizClass"))
result.trusteeBizType = string(dic.Item("trusteeBizType"))
result.trusteeContactName = string(dic.Item("trusteeContactName"))
result.trusteeDeptName = string(dic.Item("trusteeDeptName"))
result.trusteeTEL = string(dic.Item("trusteeTEL"))
result.trusteeHP = string(dic.Item("trusteeHP"))
result.trusteeEmail = string(dic.Item("trusteeEmail"))
result.trusteeSMSSendYN = dic.Item("trusteeSMSSendYN")

result.taxTotal = string( dic.Item("taxTotal"))
result.supplyCostTotal = string( dic.Item("supplyCostTotal"))
result.totalAmount = string( dic.Item("totalAmount"))
result.modifyCode =  string(dic.Item("modifyCode"))
result.orgNTSConfirmNum =  string(dic.Item("orgNTSConfirmNum"))
result.serialNum = string(dic.Item("serialNum"))
result.cash = string(dic.Item("cash"))
result.chkBill = string(dic.Item("chkBill"))
result.credit = string(dic.Item("credit"))
result.note = string(dic.Item("note"))
result.remark1 = string(dic.Item("remark1"))
result.remark2 = string(dic.Item("remark2"))
result.remark3 = string(dic.Item("remark3"))
result.kwon = string(dic.Item("kwon"))
result.ho = string(dic.Item("ho"))
result.businessLicenseYN = dic.Item("businessLicenseYN")
result.bankBookYN = dic.Item("bankBookYN")
result.ntsconfirmNum = string(dic.Item("ntsconfirmNum"))
result.originalTaxinvoiceKey = string(dic.Item("originalTaxinvoiceKey"))

Integer i
oleobject detailList[]
if not isnull(dic.Item("detailList")) then
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
end if

oleobject contactList[]
if not isnull(dic.Item("addContactList")) then
	contactList = dic.Item("addContactList")
	for i = 1 to upperbound(contactList)
		result.addcontactList[i].serialNum = contactList[i].Item("serialNum")
		result.addcontactList[i].email = string(contactList[i].Item("email"))
		result.addcontactList[i].contactName = string(contactList[i].Item("contactName"))
	next
end if

return result
end function

public function response attachfile (string corpnum, string keytype, string mgtkey, string filepath, string userid, string filename) throws popbillexception;response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

dic = httppostfiles("/Taxinvoice/" + keytype + "/" + mgtkey + "/Files" ,corpnum,"",{filepath},"Filedata", userid, {filename})
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response attachfile (string corpnum, string keytype, string mgtkey, string filepath, string filename) throws popbillexception;return attachfile(corpnum,keytype,mgtkey,filepath,"", filename)
end function

public subroutine getfiles (string corpnum, string keytype, string mgtkey, ref attachedfile ref_filelist[]) throws popbillexception;any dicList[]
integer i
oleobject log

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")


try 
any response
response = httpget("/Taxinvoice/" + keytype + "/" + mgtkey + "/Files",corpnum,"")
tarray resultArr
resultArr = create tarray
resultArr = response


for i = 1 to resultArr.getLength()
	log = resultArr.list[i]
	
	ref_filelist[i].serialNum = log.item("serialNum")
	ref_filelist[i].fileID = string(log.item("attachedFile"))
	ref_filelist[i].displayName = string(log.item("displayName"))
	ref_filelist[i].regDT = string( log.item("regDT"))
	
	log.DisconnectObject()
	destroy log
	
next

catch(linkhubexception le)
	throw exception.setcodenmessage(le.getcode(),le.getmessage())
end try

end subroutine

public function response deletefile (string corpnum, string keytype, string mgtkey, string fileid, string userid) throws popbillexception;response result
oleobject dic

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")
if isnull(fileid) or fileid = "" then throw exception.setCodeNMessage(-99999999,"파일아이디가 입력되지 않았습니다.")

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey + "/Files/" + FileID ,corpnum,"",userid,"DELETE")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response deletefile (string corpnum, string keytype, string mgtkey, string fileid) throws popbillexception;return deletefile(corpnum,keytype,mgtkey,fileid,"")
end function

public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string order, int page, int perpage) throws popbillexception;
	return search (corpnum, keytype, dtype, sdate, edate, state, ttype, taxtype, lateonly, "", "", "", "", order, page, perpage, "")
end function 

public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string order, int page, int perpage) throws popbillexception;
	return search (corpnum, keytype, dtype, sdate, edate, state, ttype, taxtype, lateonly, taxregidtype, taxregidyn, taxregid, "", order, page, perpage, "")
end function

public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage) throws popbillexception;
	return search (corpnum, keytype, dtype, sdate, edate, state, ttype, taxtype, lateonly, taxregidtype, taxregidyn, taxregid, qstring, order, page, perpage, "")
end function

public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage, string interOPYN) throws popbillexception;
	string empty_array[]
	return search (corpnum, keytype, dtype, sdate, edate, state, ttype, taxtype, lateonly, taxregidtype, taxregidyn, taxregid, qstring, order, page, perpage, "", empty_array)
end function

public function tisearchresult search (string corpnum, string keytype, string dtype, string sdate, string edate, string state[], string ttype[], string taxtype[], boolean lateonly, string taxregidtype, string taxregidyn, string taxregid, string qstring, string order, int page, int perpage, string interOPYN, string issuetype[]) throws popbillexception;
oleobject dic
string uri, tmpstr
int i
tisearchresult result

uri = "/Taxinvoice/" + keytype
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
for i = 1 to upperbound(ttype)
	tmpstr += ttype[i] 
	if i < upperbound(ttype) then tmpstr+= ','
next
uri += "&Type=" + tmpstr

tmpstr = ""
for i = 1 to upperbound(taxtype)
	tmpstr += taxtype[i] 
	if i < upperbound(taxtype) then tmpstr+= ','
next
uri += "&TaxType=" + tmpstr

if not isnull(issuetype) then
	tmpstr = ""
	for i = 1 to upperbound(issuetype)
		tmpstr += issuetype[i] 
		if i < upperbound(issuetype) then tmpstr+= ','
	next
	uri += "&IssueType=" + tmpstr
end if 

if not isnull(lateOnly) then
	if lateOnly then uri += "&LateOnly=1"
	if not(lateOnly) then uri += "&LateOnly=0"
end if

uri += "&Page=" + string(page)
uri += "&PerPage=" + string(perPage)
uri += "&Order=" +string(order)

if taxregidyn <> "" then
	uri += "&TaxRegIDYN=" + taxregIDYN
end if

uri += "&TaxRegIDType=" + taxregIDType
uri += "&TaxRegID=" + taxregID

if qstring <> "" then
	uri += "&QString=" + urlencode(qstring)
end if 

if interOPYN <> "" then
	uri += "&InterOPYN=" + interOPYN
end if 

dic = httpget(uri,corpnum,"")

result = totisearchresult(dic)
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

public function tisearchresult totisearchresult (ref oleobject dic);
tisearchresult result

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
		result.list[i] = totaxinvoiceinfo(list[i])
	next
end if

return result
end function

public function response attachstatement (string corpnum, string keytype, string mgtkey, int itemcode, string submgtkey) throws popbillexception
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{'
postData += '"ItemCode":"'+string(itemcode)+'",'
postData += '"MgtKey":"'+submgtkey+'"'
postData += '}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey +"/AttachStmt" ,corpnum,postData,"","")
result.code = dic.Item("code")
result.message = dic.Item("message")
dic.DisconnectObject()
destroy dic

return result
end function

public function response detachstatement (string corpnum, string keytype, string mgtkey, int itemcode, string submgtkey) throws popbillexception
response result
oleobject dic
string postData

if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

postData = '{'
postData += '"ItemCode":"'+string(itemcode)+'",'
postData += '"MgtKey":"'+submgtkey+'"'
postData += '}'

dic = httppost("/Taxinvoice/" + keytype + "/" + mgtkey +"/DetachStmt" ,corpnum,postData,"","")
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

dic = httpget("/Taxinvoice/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

public function response assignmgtkey (string corpnum, string keytype, string itemkey, string mgtkey) throws popbillexception
	return assignmgtkey(corpnum, keytype, itemkey, mgtkey, "");
end function

public function response assignmgtkey (string corpnum, string keytype, string itemkey, string mgtkey, string userid) throws popbillexception;	response result
	oleobject dic
	string postData
		
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	if (KeyType = "SELL" or KeyType = "BUY" or KeyType = "TRUSTEE")  = false then throw exception.setCodeNMessage(-99999999,"관리번호 유형이 올바르게 입력되지 않았습니다.")
	if isnull(MgtKey) or MgtKey = "" then throw exception.setCodeNMessage(-99999999,"관리번호가 입력되지 않았습니다.")

	postData = "MgtKey="+mgtkey;
	dic = httppost("/Taxinvoice/" + itemkey + "/" + keytype, corpnum, postdata, userid, "", "application/x-www-form-urlencoded; charset=utf-8")

	result.code = dic.Item("code")
	result.message = dic.Item("message")
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

		response = httpget("/Taxinvoice/EmailSendConfig", corpnum, "")
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
	
	dic = httppost("/Taxinvoice/EmailSendConfig?EmailType="+emailtype+"&SendYN="+string(sendYN), corpnum,"", userid, "")
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

public function response checkcertvalidation (string corpnum) throws popbillexception
	return checkcertvalidation(corpnum, "")
end function

public function response checkcertvalidation (string corpnum, string userid) throws popbillexception;response result
	oleobject dic
	
	if isnull(corpnum) or corpnum = "" then throw exception.setCodeNMessage(-99999999,"회원 사업자번호가 입력되지 않았습니다.")
	
	dic = httpget("/Taxinvoice/CertCheck", corpnum, userid)
	result.code = dic.Item("code")
	result.message = dic.Item("message")
	dic.DisconnectObject()
	destroy dic

return result
end function

public function string getSealURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/?TG=SEAL", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

public function string getTaxCertURL (string corpnum, string userid) throws popbillexception
string url
oleObject result

result = httpget("/?TG=CERT", CorpNum,Userid)
url = result.Item("url")
result.DisconnectObject()
destroy result

return url
end function

on taxinvoiceservice.create
call super::create
end on

on taxinvoiceservice.destroy
call super::destroy
end on

event constructor;
call super::constructor;
addscope("110")
end event

