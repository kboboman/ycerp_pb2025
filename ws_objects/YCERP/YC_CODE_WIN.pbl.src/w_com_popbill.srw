$PBExportHeader$w_com_popbill.srw
$PBExportComments$POPBILL 공통 관리
forward
global type w_com_popbill from w_inheritance2
end type
type st_4 from statictext within w_com_popbill
end type
type ddlb_fld from dropdownlistbox within w_com_popbill
end type
type ddlb_dwtitles from dropdownlistbox within w_com_popbill
end type
type st_6 from statictext within w_com_popbill
end type
type sle_value from singlelineedit within w_com_popbill
end type
type cbx_op from checkbox within w_com_popbill
end type
type cb_4 from commandbutton within w_com_popbill
end type
type cb_6 from commandbutton within w_com_popbill
end type
type cb_7 from commandbutton within w_com_popbill
end type
type cb_8 from commandbutton within w_com_popbill
end type
type st_vertical from u_splitbar_vertical within w_com_popbill
end type
type ddlb_op from dropdownlistbox within w_com_popbill
end type
type dw_cond from u_datawindow within w_com_popbill
end type
type cb_1 from commandbutton within w_com_popbill
end type
type cb_2 from commandbutton within w_com_popbill
end type
type cb_3 from commandbutton within w_com_popbill
end type
type cb_5 from commandbutton within w_com_popbill
end type
type cb_9 from commandbutton within w_com_popbill
end type
end forward

global type w_com_popbill from w_inheritance2
integer x = 320
integer y = 552
integer width = 6080
integer height = 7188
string title = "팝빌공통 관리(w_com_popbill)"
long backcolor = 79416533
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_4 cb_4
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
st_vertical st_vertical
ddlb_op ddlb_op
dw_cond dw_cond
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_9 cb_9
end type
global w_com_popbill w_com_popbill

type variables
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

long    	idw_w, idw_h
long    	ih_curteam
integer 	ii_chk = 0
string	is_chk = 'N'
TreeViewitem itv_team




// 링크아이디
string in_linkid = "YOOCHANG"		

// 비밀키
string in_secretkey = "QVJvaiwhBYhVfoIujbIGbSG4/+GH47RWCmLHTvHV7KU=" 

kakaoservice in_kakaoservice

//알림톡 관련
//1. 템플릿 코드
string	is_template_cd	= '021060000334'
//2. 변수 정의
//▣ 고객명 : #A
//▣ 현장명 : #B
//▣ 품목 : #C 외
//▣ 도착예정일 : #D
//▣ 배송기사 : #E / #F
//▣ 송장번호 : #G
//※ 이 출고건의 문의사항은 ☎ #H 입니다
string is_a, is_b,is_c,is_d,is_e,is_f,is_g,is_h
end variables

forward prototypes
public subroutine wf_filter ()
public function integer wf_set_dddw ()
end prototypes

public subroutine wf_filter ();
end subroutine

public function integer wf_set_dddw ();//dw_1
gf_dddw_detl_cd(dw_1, 'template_gubun', 'P001', '')

//dw_2
gf_dddw_detl_cd(dw_2, 'template_gubun', 'P001', '')

return 1
end function

on w_com_popbill.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.dw_cond=create dw_cond
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_9=create cb_9
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cbx_op
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_6
this.Control[iCurrent+9]=this.cb_7
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.dw_cond
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.cb_9
end on

on w_com_popbill.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.dw_cond)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_9)
end on

event resize;call super::resize;dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.width  = newwidth  - dw_2.x - gb_2.x

idw_w       = dw_2.width
idw_h       = dw_2.height

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
//st_vertical.of_set_leftobject(dw_1)
//st_vertical.of_set_rightobject(dw_2)
//st_vertical.of_set_rightobject(cb_upload)
//st_vertical.of_set_rightobject(p_photo)
//st_vertical.of_set_minsize(250, 250)
//////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

//dddw 자동 셋팅
wf_set_dddw()

this.postevent('we_retrieve')

end event

event we_delete;call super::we_delete;long		i, ll_row, ll_chk_cnt
string	ls_msg, ls_no, ls_sqlerrtext, ls_chk

ll_row = dw_1.rowcount()

for i = ll_row to 1 step -1
	ls_chk = dw_1.getitemstring(i,'chk')
	if ls_chk = 'N' then continue
	
	ls_no	= dw_1.getitemstring(i, 'template_cd')
	ls_msg	= "선택한 템플릿 코드 : " + ls_no + " 삭제하시겠습니까?"
	if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return -1
	
	//사용자 삭제
	delete from sdk_popbill_template
	where
		template_cd = :ls_no
	using sqlca;	
	
	if sqlca.sqlcode = -1 then 
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return -1
	else
		commit using sqlca;
		dw_1.deleterow(i)
	end if
next

this.postevent('we_retrieve')
return 1

end event

event we_save;call super::we_save;Long	ll_rtn
ll_rtn = wf_update_array({dw_2})
If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
	this.postevent('we_retrieve')
end if

Return 1
end event

event we_insert;call super::we_insert;Long		ll_row

dw_2.reset()
ll_row = dw_2.InsertRow(0)
dw_2.ScrollToRow(ll_row)
dw_2.Post SetFocus()
//초기화
dw_2.setitem(ll_row, 'template_gubun', '001')
dw_2.setitem(ll_row, 'use_yn', 'Y')
return 1

end event

event we_retrieve;call super::we_retrieve;long ll_ret

dw_1.reset()
dw_2.reset()

ll_ret	= dw_1.Retrieve()

Choose Case ll_ret
	Case is > 0
		dw_1.Post Event Clicked(0,0, 1, dw_1.Object.template_cd)		
		dw_1.Post SetFocus()		
	Case 0
		this.post Event we_insert()
//		MessageBox("Check", "검색된 자료가 없습니다.")
	Case is < 0
		MessageBox("Error", "검색 Error")
End Choose

return 1
end event

type pb_saveas from w_inheritance2`pb_saveas within w_com_popbill
boolean visible = false
integer x = 5669
integer y = 1236
boolean enabled = false
end type

type pb_save from w_inheritance2`pb_save within w_com_popbill
integer x = 5143
integer y = 40
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_com_popbill
integer x = 27
integer y = 468
integer width = 3552
integer height = 1944
string dataobject = "d_com_popbill_01"
end type

event dw_1::clicked;call super::clicked;string 	ls_cd

if row = 0 then return

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//상세 내역 변경 저장 확인
wf_uptmodifycheckdw(dw_2)

ls_cd	= this.getitemstring(row, 'template_cd')
Choose Case row
	Case is > 0
		dw_2.retrieve(ls_cd)
	Case 0
		dw_2.insertrow(0)
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

type st_title from w_inheritance2`st_title within w_com_popbill
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "팝빌공통 관리"
end type

type st_tips from w_inheritance2`st_tips within w_com_popbill
integer x = 5275
integer y = 908
end type

type pb_compute from w_inheritance2`pb_compute within w_com_popbill
boolean visible = false
integer x = 5275
integer y = 1072
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_com_popbill
boolean visible = false
integer x = 5696
integer y = 1072
end type

type pb_close from w_inheritance2`pb_close within w_com_popbill
integer x = 5335
integer y = 40
integer taborder = 100
end type

type pb_print from w_inheritance2`pb_print within w_com_popbill
boolean visible = false
integer x = 5906
integer y = 1064
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 은행코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance2`pb_cancel within w_com_popbill
boolean visible = false
integer x = 5481
integer y = 1072
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_com_popbill
integer x = 4951
integer y = 40
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_com_popbill
integer x = 4759
integer y = 40
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_com_popbill
integer x = 4567
integer y = 40
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_com_popbill
boolean visible = false
integer x = 5911
integer y = 1192
integer width = 101
integer height = 100
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_com_popbill
integer x = 27
integer y = 268
integer width = 5513
integer height = 188
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_com_popbill
integer x = 4549
integer y = 0
integer width = 992
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_com_popbill
integer x = 3616
integer y = 468
integer width = 2139
integer height = 1376
integer taborder = 60
string dataobject = "d_com_popbill_02"
boolean hscrollbar = true
boolean vscrollbar = false
end type

event dw_2::updatestart;call super::updatestart;Long		ll_rcnt, ll_row, ll_cnt
dwitemstatus	 ldwstatus
string	ls_temp
long		ll_no

ll_rcnt			= this.rowcount()
Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
			choose case ldwstatus
				Case NewModified!
					//템플릿 코드 중복 확인
					ls_temp	= this.getitemstring(ll_row, 'template_cd')
					select 
						count(*)
					into
						:ll_cnt
					from
						sdk_popbill_template
					where
						template_cd	= :ls_temp
					using sqlca;
					
					if ll_cnt <> 0 then
						messagebox("오류","동일한 탬플릿 코드가 존재합니다.")
						return 1
					end if
					
					this.setItem(ll_row, 'input_user', gs_userid)
					this.setItem(ll_row, 'input_date', gf_today2s())
				Case DataModified!
					this.setItem(ll_row, 'update_user', gs_userid)
					this.setItem(ll_row, 'update_date', gf_today2s())
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event dw_2::we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0
String	ls_temp
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		
		ls_temp	= this.getitemstring(ll_row, 'template_cd')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "탬플릿 코드를 입력하세요.")
			return -1
		end if
		
		ls_temp = this.getItemString(ll_row, 'template_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "탬플릿 명을 입력하세요. ")
			Return -1
		End IF
		
		ls_temp = this.getItemString(ll_row, 'content')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "탬플릿 내용을 입력하세요. ")
			Return -1
		End IF
		
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

type st_4 from statictext within w_com_popbill
integer x = 82
integer y = 348
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_com_popbill
integer x = 270
integer y = 332
integer width = 443
integer height = 632
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_dwtitles from dropdownlistbox within w_com_popbill
integer x = 270
integer y = 332
integer width = 311
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_6 from statictext within w_com_popbill
integer x = 741
integer y = 348
integer width = 165
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_com_popbill
integer x = 1230
integer y = 336
integer width = 539
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_com_popbill
integer x = 1783
integer y = 344
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_4 from commandbutton within w_com_popbill
integer x = 1989
integer y = 336
integer width = 160
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

integer    li_ret
string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_6 from commandbutton within w_com_popbill
integer x = 2153
integer y = 336
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_com_popbill
integer x = 2318
integer y = 336
integer width = 160
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_8 from commandbutton within w_com_popbill
integer x = 2482
integer y = 336
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_com_popbill
integer x = 3584
integer y = 464
integer height = 1944
end type

type ddlb_op from dropdownlistbox within w_com_popbill
integer x = 914
integer y = 332
integer width = 306
integer height = 500
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type dw_cond from u_datawindow within w_com_popbill
boolean visible = false
integer width = 50
integer height = 52
integer taborder = 30
boolean bringtotop = true
end type

event constructor;call super::constructor;this.insertrow(0)
end event

type cb_1 from commandbutton within w_com_popbill
integer x = 1239
integer y = 72
integer width = 576
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "알림톡 전송 예제"
end type

event clicked;string	ls_temp

//messagebox("확인","1")
select 
	content
into
	:ls_temp
from
	sdk_popbill_template
where
	template_cd = '021060000334'
using sqlca;
//messagebox("확인","2")
/////////////////////////////////////////
// 카카오톡 API 서비스 객체 생성
in_kakaoservice = create kakaoservice
messagebox("확인","3")
// 링크아이디 
in_kakaoservice.linkid = in_linkid
//messagebox("확인","4")
// 비밀키
in_kakaoservice.secretkey = in_secretkey
//messagebox("확인","5")
// 연동환경 설정값, 개발용(true), 상업용(false)
in_kakaoservice.setistest(false)
//messagebox("확인","6")
// 인증토큰 IP제한기능 사용여부, 권장-true
in_kakaoservice.setIPRestrictOnOff(true)	
//messagebox("확인","7")	
	
/*****************************************************************************
* 단건의 알림톡을 전송합니다
* - 사전에 승인된 템플릿의 내용과 알림톡 내용(content)이 다를 경우 전송실패 처리됩니다.
* - 팝빌에 등록되지 않은 발신번호로 알림톡 메시지를 전송하는 경우 발신번호 미등록 오류로 처리됩니다.
* - https://docs.popbill.com/kakao/pb/api#SendATS_one
*****************************************************************************/

string l_receiptNum, templatecode, sender, content, altcontent, altsendtype,  receiver, receivername, requestnum
int i

//알림톡 템플릿 코드
//승인된 알림톡 템플릿 코드는 ListATStemplate API, GetATSTemplateMgtURL API, 혹은 팝빌사이트에서 확인이 가능합니다.
templatecode = "022120000225"

// 발신번호 (팝빌에 등록된 발신번호만 이용가능)
sender = "02-2648-1998"

//알림톡 내용 (최대 1000자)
//content = "[ 팝빌 ]~n"
//content += "신청하신 #{템플릿코드}에 대한 심사가 완료되어 승인 처리되었습니다.~n"
//content += "해당 템플릿으로 전송 가능합니다.~n~n"
//content += "문의사항 있으시면 파트너센터로 편하게 연락주시기 바랍니다. ~n~n"
//content += "팝빌 파트너센터 : 1600-8536~n"
//content += "support@linkhub.co.kr"

//content = "[출고안내]~n"
//content += "제품의 배송이 시작되었습니다.~n~n"
//content += "▣ 고객명 : #{고객명}~n"
//content += "▣ 현장명 : #{현장명}~n"
//content += "▣ 품목 : #{품목명} 외~n"
//content += "▣ 도착예정일 : #{예정일}~n"
//content += "▣ 배송기사 : #{배송기사 전화번호} / #{화물정보}~n"
//content += "▣ 송장번호 : #{송장번호}~n"
//content += "※ 이 출고건의 문의사항은 ☎ #{담당 전화번호} 입니다"

//content = "[출고안내]~n"
//content += "제품의 배송이 시작되었습니다.~n~n"
//content += "▣ 고객명 : 김보길~n"
//content += "▣ 현장명 : 등촌역~n"
//content += "▣ 품목 : 스틸 외~n"
//content += "▣ 도착예정일 : 2021-06-11~n"
//content += "▣ 배송기사 : 02-413-1982 / 2톤~n"
//content += "▣ 송장번호 : SD20210609-001~n"
//content += "※ 이 출고건의 문의사항은 ☎ 02-2640-4703 입니다"
//
//test

//content = "[출고안내]~n"
//content += "제품의 배송이 시작되었습니다.~n~n"
//content += "▣ 고객명 : 김보길~n"
//content += "▣ 현장명 : 등촌역~n"
//content += "▣ 품목 : 스틸 외~n"
//content += "▣ 도착예정일 : 2021-06-11~n"
//content += "▣ 배송기사 : 02-413-1982 / 2톤~n"
//content += "▣ 송장번호 : SD20210609-001~n"
//content += "※ 이 출고건의 문의사항은 ☎ 02-2640-4703 입니다"

content	= ls_temp

//대체문자 내용 (최대 2000byte)
altContent = "알림톡 대체 문자"
//altContent = content

//대체문자 유형 [공백-미전송, C-알림톡 내용, A-대체문자 내용]
//altsendtype = "A"
altsendtype = "C"

//수신번호
//receiver = "010111222"

//수신자 이름
receivername = "partner"

// 전송요청번호, 파트너가 전송요청에 대한 관리번호를 직접 할당하여 관리하는 경우 기재
// 최대 36자리, 영문, 숫자, 언더바('_'), 하이픈('-')을 조합하여 사업자별로 중복되지 않도록 구성
requestnum = "";	

// 알림톡 버튼정보를 템플릿 신청시 기재한 버튼정보와 동일하게 전송하는 경우 
// l_kakaobutton 배열을 선언만 하고 함수호출.
kakaobutton l_kakaobutton[]

/*
// 알림톡 버튼 URL에 #{템플릿변수}를 기재한경우 템플릿변수 영역을 변경하여 버튼정보 구성
kakaobutton l_kakaobutton[]

// 버튼명
l_kakaobutton[1].n = "템플릿 안내"
	
// 버튼유형 DS-배송조회, WL-웹링크, AL-앱링크, MD-메시지전달, BK-봇키워드
l_kakaobutton[1].t = "WL"
	
// 앱링크-iOS, 웹링크-Mobile
l_kakaobutton[1].u1 = "https://www.linkhub.co.kr"
	
// 앱링크-Android, 웹링크-PC URL
 l_kakaobutton[1].u2 = "http://www.popbill.co.kr"
*/

//테스트용 추가
receiver	= '01027369470'	
//receiver	= '01075161346'	//박지훈
//receiver	= '010-9085-3764' //한미란
string	ls_corpnum, ls_reserveDT, ls_userid

ls_corpnum		= '1408148198'
ls_reserveDT	= ''
ls_userid		= 'ycadmin'
	
//messagebox("123","확인")
	
try	
	l_receiptNum = in_kakaoservice.sendATS(ls_corpnum, templatecode, sender, content, altcontent, &
													altsendtype, ls_reserveDT, receiver, receivername, requestnum, l_kakaobutton, ls_userid)
														
	messagebox("알림톡 단건 전송","접수번호 : " + l_receiptNum)
	//sle_receiptnum.text = l_receiptNum
	
catch(popbillexception pe)	
	
	messagebox("알림톡 단건 전송", "응답코드 : " + String(pe.getcode()) +  "~n응답메시지 :" + pe.getmessage())
	
end try	

destroy in_kakaoservice
end event

type cb_2 from commandbutton within w_com_popbill
integer x = 1842
integer y = 72
integer width = 576
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "메세지 확인 예제"
end type

event clicked;string   ls_chk,  ls_do_no, ls_do_no1,  ls_sale_flag, ls_do_date,   ls_seq,     ls_null, ls_scene_code, ls_car_no
string   ls_item, ls_qa,    ls_qa_cust, ls_loc,       ls_old_time,  ls_cust_no, ls_month, ls_area,  ls_sale
string   ls_lot,  ls_oc,    ls_case,    ls_do_dr_hp,  ls_fitno,     ls_orderno, ls_ship_flag, ls_shipamt_case

string   ls_car_text
string   ls_s_cust_name, ls_s_scene_desc, ls_s_do_date,  ls_driver, ls_driverdw1, ls_cargubun, ls_itemcd
string   ls_s_hp_no,     ls_s_scene_tel,  ls_s_cust_tel, ls_callback, ls_s_msg, ls_csmsg, ls_s_hp_no1, ls_ship_no

string   ls_sale_control, ls_cust_chk, ls_spot_code, ls_timearrival, ls_gubun


int      li_int,  li_seq,   ll_row,  ll_int,       li_count,  li_saleseq, l_row, l_id
long     ll_year, ll_inauditrow,     ll_coilcnt,   ll_cnt,    ll_receiptid,  ll_fitseq
decimal  ld_qoh,  ld_qty,            ld_do_amount, ld_rcpt,   ld_order_qty,  ld_issue_qty, ld_shipqty, ld_dototal
decimal  ld_issueqty_org,          ld_ship_amount

datetime ldt_today, ldt_etime
boolean  lb_chk, lb_mmssend 

/*2018.11.7 jowonsuk 가입고 반영을 위한 변수들 */
datetime l_today
string      ls_dw2_item_no, ls_dw2_qa, ls_uom, ls_order_no, ls_seq_no, ls_tempno, ls_dw2_uom
long  		l_seq, l_seq_no, l_qty, l_intemp
string       ls_prt

//알림톡 품목 가져오기
long ll_rcnt, i, j
string ls_source
//j = 0
//ll_rcnt	= dw_2.rowcount()
//for i = 1 to ll_rcnt
//	ls_source = dw_2.getitemstring(i, 'source')
//	if ls_source = 'Y' then
//		is_c = dw_2.getitemstring(i, 'item_name')
//		j = 1
//		exit
//	end if
//next
//
if j = 0 then
	is_c = '선택 품목없음'
end if	
	
	////////////////////////////
	// SMS 단문전송
	// - 알림톡 기능 추가 2021.06.17
	////////////////////////////
	string ls_s_sms_yn, ls_s_area_no, ls_s_tel, ls_phonecheck, ls_sms_custno, ls_s_support
	Long		ll_gubun
	String	ls_template_cd
	
	ls_do_no1	= 'SD20210702-006'
	SELECT isnull(sms_yn,'N'), area_no INTO :ls_s_sms_yn, :ls_s_area_no
	  FROM do
	 WHERE do_no = :ls_do_no1;
	
	choose case ls_s_area_no
		case 'H0001'
			ls_s_tel = 'chulha_t_h'
		case 'S0001', 'B0001'
			ls_s_tel = 'chulha_t_s'
		case 'T0001'
			ls_s_tel = 'chulha_t_t'
		case 'Z0001'
			ls_s_tel = 'chulha_t_z'
		case else
			ls_s_tel = 'chulha_t_0'
	end choose

	// 거래처 문자전송 
	string ls_useyn
	SELECT item_cd INTO :ls_useyn FROM codemst WHERE type = '출고_피드백' AND use_yn = 'Y';

SELECT top 1 b.cust_no
		  , b.cust_name
		  , c.scene_desc
		  , convert(varchar(10), a.do_date, 111)
		  , replace(substring(ltrim(rtrim(isnull(d.hp_no,    ''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(a.tel_no,''))),1,13), '-', '')			/*2021-12-21 jowonsuk 송장전화 번호 발송 */
/*		  , replace(substring(ltrim(rtrim(isnull(b.buyer1_hp,''))),1,13), '-', '')*/
		  ,( case when ISNULL(B.SCENE_PHONE, 'N') = 'Y' then replace(substring(ltrim(rtrim(isnull(b.buyer1_hp,''))),1,13), '-', '') else '' end) /*2020-07-20 jowonsuk 수주번호반영유무 체크 */
		  , replace(substring(ltrim(rtrim(isnull(e.phone,    ''))),1,13), '-', '')
		  , replace(substring(ltrim(rtrim(isnull(F.hp_no,    ''))),1,13), '-', '')		  /*2018.07.16 jowonsuk 반영 작업 부담당자 문자 차주 정보 발송 */
		  , g.saler_phone
	  INTO :ls_sms_custno, :ls_s_cust_name, :ls_s_scene_desc, :ls_s_do_date
		  , :ls_s_hp_no   , :ls_s_scene_tel, :ls_s_cust_tel, :ls_s_support, :ls_s_hp_no1
		  , :is_h
	  FROM do       A with(nolock)
		    LEFT OUTER JOIN customer B with(nolock) ON a.cust_no  = b.cust_no
		    LEFT OUTER JOIN scene    C with(nolock) ON a.cust_no  = c.cust_no AND a.spot_code   = c.scene_code
		    LEFT OUTER JOIN salehp   D with(nolock) ON b.salesman = d.user_id
		    LEFT OUTER JOIN login    E with(nolock) ON b.support  = e.user_id AND e.use_flag <> 'N'
		    LEFT OUTER JOIN salehp   F with(nolock) ON b.salesman_bu = F.user_id	
			 LEFT OUTER JOIN aroiinv_esero G with(nolock) ON B.salesman = G.id
	 WHERE a.do_no  = :ls_do_no1;

	//
//	dw_1.GetChild('do_car_gbn', dwc1)
//	ls_car_text    = dwc1.getitemstring(dwc1.getrow(),'item_nm')
//	
	//알림톡, SMS 발송 내용 구분
	Select 
		count(*)
	Into
		:ll_gubun
	From
		sdk_popbill_template
	Where
		use_yn = 'Y'
	And	
		template_cd = :is_template_cd
	Using sqlca;	
	
	choose case ll_gubun
		case 1		//알림톡
			if isnull(ldt_etime) then
				is_d	= '0000-00-00'
			else
				is_d = string(ldt_etime, "yyyy-mm/dd hh") + "시"
			end if
			
			//▣ 고객명 : #A
			//▣ 현장명 : #B
			//▣ 품목 : #C 외
			//▣ 도착예정일 : #D
			//▣ 배송기사 : #E / #F
			//▣ 송장번호 : #G
			//※ 이 출고건의 문의사항은 ☎ #H 입니다
			is_a	= ls_s_cust_name
			is_b	= ls_s_scene_desc
			is_e	= ls_do_dr_hp
			is_f	= ls_car_text
			is_g	= ls_do_no1
			//문의 전화 번호 확인
			choose case ls_sms_custno
				case 'U580'	//송천건업
					is_h	= '02-2690-1999'
				case 'N219'	//유창건업
					is_h	= '031-755-1600'					
			end choose

			Select 
				content
			into
				:ls_s_msg
			From
				sdk_popbill_template
			Where
				use_yn = 'Y'
			And	
				template_cd = :is_template_cd
			Using sqlca;			
			ls_s_msg	= gf_replaceall(ls_s_msg, '#A',is_a)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#B',is_b)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#C',is_c)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#D',is_d)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#E',is_e)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#F',is_f)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#G',is_g)
			ls_s_msg	= gf_replaceall(ls_s_msg, '#H',is_h)

			ls_template_cd	=	is_template_cd			
		case else	//SMS
			if isnull(ldt_etime) then
			else
				ls_timearrival = "예정:" + string(ldt_etime, "mm/dd hh") + "시"
			end if
			ls_s_cust_name = GF_Hangle_TR(ls_s_cust_name,24)
			ls_s_msg = '[유창]차주:' + ls_do_dr_hp + ',' + ls_car_text + ',' + ls_s_cust_name + ',' + ls_s_scene_desc + ',' + ls_timearrival
			ls_s_msg = GF_Hangle_TR(ls_s_msg,80)
			
			ls_template_cd	=	gs_userid			
	end choose	
	
	
messagebox("결과", ls_s_msg)	
end event

type cb_3 from commandbutton within w_com_popbill
integer x = 1225
integer y = 184
integer width = 457
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;ulong ul_num = 146944	
ulong ul_getnum

//RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing", &
//      "State", ReguLong!, 146944)

string ls_path = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing"
RegistryGet(ls_path, "State", RegULong!, ul_getnum)
messagebox("", string(ul_getnum))
		
		
//RegistrySet("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing", &
//      "Test1", ReguLong!, ul_num)		
end event

type cb_5 from commandbutton within w_com_popbill
integer x = 2542
integer y = 92
integer width = 457
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;messagebox("", gs_username + gs_userid)
end event

type cb_9 from commandbutton within w_com_popbill
integer x = 3191
integer y = 80
integer width = 576
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "신규 등록 테스트"
end type

event clicked;string ls_template_cd, ls_s_msg, ls_s_hp_no
string ls_a, ls_b, ls_c, ls_d, ls_e, ls_f

ls_template_cd	= '022120000225'		//템플릿코드
ls_s_hp_no		= '01090853764'		//받는 사람

Select 
	content
into
	:ls_s_msg
From
	sdk_popbill_template
Where
	use_yn = 'Y'
And	
	template_cd = :ls_template_cd
Using sqlca;		

ls_a	= '테스트'
ls_b	= 'TEST'
ls_c	= 'SD20221213-001'
ls_d	= '70,000,000원'
ls_e	= '30,000,000원'
ls_f	= '40,000,000원'

ls_s_msg	= gf_replaceall(ls_s_msg, '#A',ls_a)
ls_s_msg	= gf_replaceall(ls_s_msg, '#B',ls_b)
ls_s_msg	= gf_replaceall(ls_s_msg, '#C',ls_c)
ls_s_msg	= gf_replaceall(ls_s_msg, '#D',ls_d)
ls_s_msg	= gf_replaceall(ls_s_msg, '#E',ls_e)
ls_s_msg	= gf_replaceall(ls_s_msg, '#F',ls_f)

GF_MMSSEND( ls_template_cd, '', ls_s_hp_no, '담보내역', ls_s_msg )
end event

