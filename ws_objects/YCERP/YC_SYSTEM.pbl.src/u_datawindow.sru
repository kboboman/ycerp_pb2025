$PBExportHeader$u_datawindow.sru
$PBExportComments$datawindow 조상
forward
global type u_datawindow from datawindow
end type
end forward

global type u_datawindow from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event type integer insertrowstart ( long row )
event insertrowend ( long row )
event type integer deleterowstart ( long row )
event type integer we_esscheckbyupdate ( )
event we_dberror1st ( )
event we_dberror2st ( long al_errorcode,  string as_errortext,  long al_row,  dwbuffer adwb_buffer )
event type boolean we_isframecontrol ( )
end type
global u_datawindow u_datawindow

type variables
Private:
	String			isdberrorText	= ''

public:
	// parent window
	window	iw_parent
	boolean	SetFocusDW		= False
	gs_dwdberror istr_dberror
end variables

forward prototypes
public function long insertrow (long r)
public function string wf_getsqlerrmsg ()
public function integer deleterow (long r)
end prototypes

event type integer insertrowstart(long row);//to-be 기능 추가 insertrow overroding

Return 1
end event

event insertrowend(long row);//to-be 기능 추가 insertrow overroding
end event

event type integer deleterowstart(long row);//return : -1(error)
return 1
end event

event type integer we_esscheckbyupdate();//DataWindow Update전에 체크 내용 확인
//return : error(-1) / OK(1)
return 1
end event

event we_dberror1st();/* Event profile
	
	Name:			uevent_dberr_initial
	Applies to:	u_dw
	Kind:			User
	Processing:	See below

*/

//////////////////////////////////////////////////////////////////
//                                                               /
//  This user event is triggered by the DBError event script     /
//  at the very beginning of that script.                        /
//                                                               /
//  If you want to perform any specialized initial error         /
//  processing in your descendent DW control, code it here.      /
//                                                               /
//////////////////////////////////////////////////////////////////

end event

event we_dberror2st(long al_errorcode, string as_errortext, long al_row, dwbuffer adwb_buffer);String		ls_text

ls_text				= 'No changes made to database.'
isdberrorText	= MidA(as_errortext, 1, PosA(as_errortext, ls_text) - 1)

Choose Case al_errorcode
	Case 1
		Beep (1)						 
		MessageBox("데이터입력오류: 키 부분에 발생", &
					  "문제: " + &
					  "이미 사용한 키를 다시 사용 하였습니다. " + &
						"~n~r~n~r" + &
					  "해결방안: " + &
					  "다른 키값을 사용하시요. "+ &
 				  	  "~n~r~n~r" + &
					  "내역: " + &
					  String(al_errorcode) + " " + isdberrorText, Exclamation!)
	Case -194
		Beep (1)
		MessageBox("데이터입력오류: 해당정보 없습", &
					  "문제: " + &
					  "해당값은 다른 테이블 과 관련이 없습니다. " + &
						"~n~r~n~r" + &
					  "해결방안: " + &
					  "해당값을 확인후 수정하시오. " + &
 				  	  "~n~r~n~r" + &
					  "내역: " + &
					  String(al_errorcode) + " " + isdberrorText, Exclamation!)

	Case -195
		Beep (1)
		MessageBox("데이터입력오류: 값 오류", &
					  "문제: " + &
					  "반드시 입력해야될 값이 있습니다. " + &
					  "~n~r~n~r" + &
					  "해결방안: " + &
					  "반드시 입력해야될 값을 입력하시오. " + &
 				  	  "~n~r~n~r" + &
					  "내역: " + &
					  String(al_errorcode) + " " + isdberrorText, Exclamation!)

	Case -198
		Beep (1)
		MessageBox("데이터입력오류: 해당정보 문제", &
					  "문제: " + &
					  "키값이 변경되어 관련정보를 삭제할수 없습니다. " + &
  						"~n~r~n~r" + &
					  "해결방안: " + &
					  "수정 완료후 다시 삭제하시오. " + &
 				  	  "~n~r~n~r" + &
					  "내역: " + &
					  String(al_errorcode) + " " + isdberrorText, Exclamation!)

	Case -209
		Beep (1)
		MessageBox("데이터오류: 틀린값 존재", &
					  "문제: " + &
					  "하나 또는 그이상의 틀린값이 존재합니다. " + &
					  "~n~r~n~r" + &
					  "해결방안: " + &
					  "확인후 정확한 값을 입력하시오. " + &
 				  	  "~n~r~n~r" + &
					  "내역: " + &
					  String(al_errorcode) + " " + isdberrorText, Exclamation!)
	Case Else
		Beep (1)		
		MessageBox("데이터오류", &
					  "데이터베이스에 데이터 오류가 " + &
					  "발생되었습니다. " + &
  					  "내용은 아래와 같습니다.: " + &
					  "~n~r~n~r" + &
					  'sqldbcode : ' + String(al_errorcode) + " " + isdberrorText + &
					  "~n~r~n~r" + &
				 	  "관리자에 연락하십시오. ", Exclamation!)
		
End Choose

end event

event type boolean we_isframecontrol();return true
end event

public function long insertrow (long r);//to-be 기능 추가 insertrow overroding
long ll_row
IF r = 0 THEN r = this.rowcount() + 1

ll_row = this.Event insertrowstart(r)
IF ll_row > 0 THEN
	ll_row = super::insertrow(r)
	IF ll_row > 0 THEN
		this.Event insertrowend(ll_row)
	END IF
END IF

return ll_row
end function

public function string wf_getsqlerrmsg ();Return isdberrorText
end function

public function integer deleterow (long r);//to-be 프레임1 일부기능 추가 deleterow overroding
Integer li_rtn

IF r = 0 THEN r = getRow()

li_rtn = Event deleterowstart(r)
Choose Case li_rtn
	Case 1
		li_rtn = super::deleterow(r)
	Case -1
		//
	Case Else
		IF super::deleterow(r) < 0 THEN
			li_rtn = -1
		END IF
END CHoose

return li_rtn
end function

on u_datawindow.create
end on

on u_datawindow.destroy
end on

event constructor;// get parent window
iw_parent = gf_getparentwindow(this)
end event

event getfocus;If SetFocusDW	= True Then iw_parent.Dynamic wf_setfocusdw(This)
end event

event dberror;// 에러 정보 보관
istr_dberror.sqldbcode = sqldbcode
istr_dberror.sqlerrtext = sqlerrtext
istr_dberror.sqlsyntax = sqlsyntax
istr_dberror.errorrow = row

This.Event we_dberror1st()

This.Post Event we_dberror2st(sqldbcode,sqlerrtext, row, buffer)

Return 1
end event

