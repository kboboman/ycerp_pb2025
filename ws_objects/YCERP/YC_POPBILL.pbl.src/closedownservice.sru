$PBExportHeader$closedownservice.sru
forward
global type closedownservice from baseservice
end type
end forward

global type closedownservice from baseservice
end type
global closedownservice closedownservice

forward prototypes
public function corpstate checkcorpnum(string corpnum, string userCorpNum) throws popbillexception
public subroutine checkcorpnums(string corpnum, ref string corpnumlist[], ref corpstate ref_returnlist[]) throws popbillexception
public function decimal getunitcost (string corpnum) throws popbillexception
private function corpstate tocorpstate (ref oleobject dic)
public function chargeinfo getchargeinfo (string corpnum) throws popbillexception
public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception
end prototypes

public function corpstate checkcorpnum(string userCorpnum, string checkCorpNum) throws popbillexception;corpstate result
oleobject dic

if isnull(checkCorpNum) or checkCorpNum = "" then throw exception.setCodeNMessage(-99999999,"조회할 사업자번호가 입력되지 않았습니다.")
if isnull(userCorpnum) or userCorpnum = "" then throw exception.setCodeNMessage(-99999999,"팝빌회원 사업자번호가 입력되지 않았습니다.")

dic = httpget("/CloseDown?CN="+checkCorpNum, userCorpnum, "")
result = tocorpstate(dic)

destroy dic
return result
end function

public subroutine checkcorpnums(string corpnum, ref string corpnumlist[], ref corpstate ref_returnlist[]) throws popbillexception;
oleobject infoDic
string postData
integer i 
any response
tarray result

if isnull(corpnumlist) then throw exception.setCodeNMessage(-99999999,"조회할 사업자번호가 입력되지 않았습니다.")

postData = '['

for i =1 to upperbound(corpnumlist)
		postData += '"' + corpnumlist[i] + '"'
		if i<upperbound(corpnumlist) then postData += ","
next
postData += ']'

try 
	response = httppost("/CloseDown", corpnum, postData, "")
	result = create tarray
	result = response
	
	for i = 1 to result.getLength()
		infoDic = result.list[i]
		ref_returnlist[i] = tocorpstate(infoDic)
		
		infoDic.DisconnectObject()
		destroy infoDic
	next
	
	
catch (linkhubexception le)
	throw exception.setcodenmessage(le.getcode(), le.getmessage())
end try

end subroutine 

public function decimal getunitcost (string corpnum) throws popbillexception;decimal unitcost
oleObject result

result = httpget("/CloseDown/UnitCost" , CorpNum,"")
unitcost = dec(result.Item("unitCost"))
result.DisconnectObject()
destroy result

return unitcost
end function

private function corpstate tocorpstate (ref oleobject dic);corpstate result
result.corpnum = string(dic.Item("corpNum"))
result.cstate = string(dic.Item("state"))
result.ctype = string(dic.Item("type"))
result.stateDate = string(dic.Item("stateDate"))
result.checkDate = string(dic.Item("checkDate"))
result.typeDate = string(dic.Item("typeDate"))
return result
end function

public function chargeinfo getchargeinfo (string corpnum) throws popbillexception;
	return getchargeinfo(corpnum, "")
end function

public function chargeinfo getchargeinfo (string corpnum, string userid) throws popbillexception;chargeinfo result
oleobject dic

dic = httpget("/CloseDown/ChargeInfo", CorpNum, userid)
result = tochargeinfo(dic)
dic.DisconnectObject()
destroy dic

return result
end function

on closedownservice.create
call super::create
end on

on closedownservice.destroy
call super::destroy
end on

event constructor;call super::constructor;addscope("170")
end event

