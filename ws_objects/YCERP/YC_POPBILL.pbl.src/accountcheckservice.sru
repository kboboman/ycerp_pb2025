$PBExportHeader$accountcheckservice.sru
forward
global type accountcheckservice from baseservice
end type
end forward

global type accountcheckservice from baseservice
end type
global accountcheckservice accountcheckservice

forward prototypes
public function accountcheckinfo checkaccountinfo(string userCorpnum, string bankcode, string accountnumber) throws popbillexception
public function accountcheckinfo checkaccountinfo(string userCorpnum, string bankcode, string accountnumber, string userid) throws popbillexception
public function decimal getunitcost (string corpnum) throws popbillexception
private function accountcheckinfo toaccountcheckinfo (ref oleobject dic)

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception
end prototypes

public function accountcheckinfo checkAccountInfo(string userCorpnum, string bankCode, String accountNumber) throws popbillexception;
	return checkAccountInfo(userCorpnum, bankCode, accountNumber, "")
end function

public function accountcheckinfo checkAccountInfo(string userCorpnum, string bankCode, String accountNumber, String userid) throws popbillexception;
accountcheckinfo result
oleobject dic

if isnull(bankCode) or bankCode =  "" then throw exception.setCodeNMessage(-99999999,"기관코드가 입력되지 않았습니다.")
if isnull(accountNumber) or accountNumber = "" then throw exception.setCodeNMessage(-99999999,"계좌번호가 입력되지 않았습니다.")

dic = httppost("/EasyFin/AccountCheck?c="+bankCode+"&n="+accountNumber, userCorpnum, "", userid, "")
result = toaccountcheckinfo(dic)
dic.DisconnectObject()
destroy dic
return result
end function

public function decimal getunitcost (string corpnum) throws popbillexception;decimal unitcost
oleObject result

result = httpget("/EasyFin/AccountCheck/UnitCost" , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

private function accountcheckinfo toaccountcheckinfo  (ref oleobject dic);
accountcheckinfo result
result.bankCode = string(dic.Item("bankCode"))
result.accountNumber = string(dic.Item("accountNumber"))
result.accountName = string(dic.Item("accountName"))
result.checkDate = string(dic.Item("checkDate"))
result.resultCode = string(dic.Item("resultCode"))
result.resultMessage = string(dic.Item("resultMessage"))
return result
end function

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/EasyFin/AccountCheck/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

on accountcheckservice.create
call super::create
end on

on accountcheckservice.destroy
call super::destroy
end on

event constructor;call super::constructor;addscope("182")
end event

