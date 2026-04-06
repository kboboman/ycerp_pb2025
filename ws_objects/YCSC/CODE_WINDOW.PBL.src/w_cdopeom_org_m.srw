$PBExportHeader$w_cdopeom_org_m.srw
$PBExportComments$매출집계 조직도
forward
global type w_cdopeom_org_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdopeom_org_m
end type
type st_4 from statictext within w_cdopeom_org_m
end type
type st_2 from statictext within w_cdopeom_org_m
end type
type ddlb_fld from dropdownlistbox within w_cdopeom_org_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdopeom_org_m
end type
type st_5 from statictext within w_cdopeom_org_m
end type
type sle_value from singlelineedit within w_cdopeom_org_m
end type
type cbx_op from checkbox within w_cdopeom_org_m
end type
type cb_1 from commandbutton within w_cdopeom_org_m
end type
type cb_2 from commandbutton within w_cdopeom_org_m
end type
type cb_4 from commandbutton within w_cdopeom_org_m
end type
type cb_5 from commandbutton within w_cdopeom_org_m
end type
type dw_3 from datawindow within w_cdopeom_org_m
end type
type cbx_1 from checkbox within w_cdopeom_org_m
end type
type st_vertical from u_splitbar_vertical within w_cdopeom_org_m
end type
type ddlb_op from dropdownlistbox within w_cdopeom_org_m
end type
end forward

global type w_cdopeom_org_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4270
integer height = 2352
string title = "매출집계 조직도(w_cdopeom_org_m)"
cb_3 cb_3
st_4 st_4
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_3 dw_3
cbx_1 cbx_1
st_vertical st_vertical
ddlb_op ddlb_op
end type
global w_cdopeom_org_m w_cdopeom_org_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

DataWindowChild idwc_mgr1, idwc_mgr2, idwc_mgr3

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
// register objects with vertical splitbar
st_vertical.of_set_leftobject(dw_1)

st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

dw_1.getchild("area_mgr", idwc_mgr1)
idwc_mgr1.settransobject(sqlca)
idwc_mgr1.setfilter( "use_flag = 'Y'" )
idwc_mgr1.filter()

dw_1.getchild("sector_mgr", idwc_mgr2)
idwc_mgr2.settransobject(sqlca)
idwc_mgr2.setfilter( "use_flag = 'Y'" )
idwc_mgr2.filter()

dw_1.getchild("team_mgr", idwc_mgr3)
idwc_mgr3.settransobject(sqlca)
idwc_mgr3.setfilter( "use_flag = 'Y'" )
idwc_mgr3.filter()

if GF_Permission("매출집계_조직도", gs_userid) = "Y" then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

pb_retrieve.PostEvent( clicked! )

end event

on w_cdopeom_org_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cbx_op
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.dw_3
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.st_vertical
this.Control[iCurrent+16]=this.ddlb_op
end on

on w_cdopeom_org_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.st_vertical)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = (newwidth  - (gb_2.x * 2)) * 0.7
dw_1.height = newheight - dw_1.y - gb_2.x 

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.y      = dw_1.y
st_vertical.height = dw_1.height

dw_3.x      = st_vertical.x + st_vertical.width
dw_3.y      = dw_1.y
dw_3.width  = ((newwidth  - (gb_2.x * 2)) * 0.3) - st_vertical.width
dw_3.height = newheight - dw_1.y - gb_2.x 

end event

type pb_save from w_inheritance`pb_save within w_cdopeom_org_m
integer x = 3781
integer y = 64
end type

event pb_save::clicked;//
int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

//FOR ll_count = 1 TO dw_1.rowcount()
//	IF isnull(dw_1.object.user_id[ll_count]) OR dw_1.object.user_id[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 영업사원을 입력하십시오")
//		dw_1.setcolumn("user_id")
//		dw_1.setfocus()
//		dw_1.scrolltorow(ll_count)
//		return
//	END IF
//NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//	    IF dw_1.object.user_id[li_cnt1] = dw_1.object.user_id[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 영업사원이 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT		            

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
WF_Update1(dw_1, "Y")

cbx_1.checked = false

end event

type dw_1 from w_inheritance`dw_1 within w_cdopeom_org_m
integer x = 32
integer y = 444
integer width = 3003
integer height = 1768
string dataobject = "d_cdopeom_org_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

string ls_userid

choose case dwo.name
	case "area", "area_mgr"
		ls_userid = this.object.area_mgr[row]

	case "sector", "sector_mgr"
		ls_userid = this.object.sector_mgr[row]

	case "team", "team_mgr"
		ls_userid = this.object.team_mgr[row]

	case "user_id", "user_name", "rank", "custcnt"
		ls_userid = this.object.user_id[row]
end choose

dw_3.setredraw( false )
dw_3.retrieve( ls_userid )
dw_3.setredraw( true )

end event

type dw_2 from w_inheritance`dw_2 within w_cdopeom_org_m
boolean visible = false
integer x = 1851
integer y = 4
integer width = 187
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdopeom_org_m
integer x = 32
integer y = 28
integer width = 1138
integer height = 136
string text = "매출집계 조직도"
end type

type st_tips from w_inheritance`st_tips within w_cdopeom_org_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdopeom_org_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdopeom_org_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdopeom_org_m
integer x = 3973
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdopeom_org_m
integer x = 3589
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_3.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출집계 조직도를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdopeom_org_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdopeom_org_m
integer x = 3397
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_userid
int    li_count

if dw_1.rowcount() < 1 then return	

ls_userid = dw_1.object.user_id[dw_1.getrow()]
if ls_userid = "insite" then
	MessageBox("확인","내부업체는 삭제할 수 없습니다.")
	return
end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then	return

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdopeom_org_m
integer x = 3205
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;//
long ll_row, ll_cnt

dw_1.accepttext()

ll_row = dw_1.getrow()
ll_cnt = dw_1.insertrow(ll_row)

dw_1.object.rank[ll_cnt] = ""		// 직책

dw_1.scrolltorow(ll_cnt)
dw_1.setcolumn('seq')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdopeom_org_m
integer x = 3013
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdopeom_org_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdopeom_org_m
integer y = 268
integer width = 4165
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdopeom_org_m
integer x = 2976
integer y = 16
integer width = 1216
integer height = 216
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdopeom_org_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_4 from statictext within w_cdopeom_org_m
integer x = 37
integer y = 212
integer width = 425
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "매출집계_조직도"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdopeom_org_m
integer x = 105
integer y = 336
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cdopeom_org_m
integer x = 283
integer y = 316
integer width = 443
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_cdopeom_org_m
integer x = 315
integer y = 328
integer width = 311
integer height = 88
integer taborder = 20
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

type st_5 from statictext within w_cdopeom_org_m
integer x = 754
integer y = 332
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

type sle_value from singlelineedit within w_cdopeom_org_m
integer x = 1216
integer y = 324
integer width = 535
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_cdopeom_org_m
integer x = 1765
integer y = 336
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

type cb_1 from commandbutton within w_cdopeom_org_m
integer x = 1966
integer y = 324
integer width = 146
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
string     ls_column, ls_value, ls_col, ls_type, ls_op
integer    li_ret

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_3"
		arg_dw  = dw_3
end choose

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

type cb_2 from commandbutton within w_cdopeom_org_m
integer x = 2117
integer y = 324
integer width = 146
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_3"
		arg_dw  = dw_3
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_cdopeom_org_m
integer x = 2267
integer y = 324
integer width = 146
integer height = 76
integer taborder = 130
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

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdopeom_org_m
integer x = 2418
integer y = 324
integer width = 146
integer height = 76
integer taborder = 140
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

	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_cdopeom_org_m
integer x = 3072
integer y = 444
integer width = 1125
integer height = 1768
integer taborder = 30
boolean bringtotop = true
string title = "권한별거래처목록"
string dataobject = "d_cdmycustomer_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type cbx_1 from checkbox within w_cdopeom_org_m
integer x = 2624
integer y = 336
integer width = 251
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "편집"
end type

event clicked;// 편집
long   ll_row
string ls_chk

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next

end event

type st_vertical from u_splitbar_vertical within w_cdopeom_org_m
integer x = 3040
integer y = 444
integer height = 1768
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cdopeom_org_m
integer x = 923
integer y = 316
integer width = 283
integer height = 500
integer taborder = 70
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

