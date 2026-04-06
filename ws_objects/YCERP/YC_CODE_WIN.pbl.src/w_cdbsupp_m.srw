$PBExportHeader$w_cdbsupp_m.srw
$PBExportComments$조업자재 구매처(1999/06/07,이인호)
forward
global type w_cdbsupp_m from w_inheritance
end type
type st_3 from statictext within w_cdbsupp_m
end type
type ddlb_fld from dropdownlistbox within w_cdbsupp_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdbsupp_m
end type
type st_4 from statictext within w_cdbsupp_m
end type
type sle_value from singlelineedit within w_cdbsupp_m
end type
type cb_1 from commandbutton within w_cdbsupp_m
end type
type cb_2 from commandbutton within w_cdbsupp_m
end type
type cb_3 from commandbutton within w_cdbsupp_m
end type
type cb_5 from commandbutton within w_cdbsupp_m
end type
type ddlb_op from dropdownlistbox within w_cdbsupp_m
end type
end forward

global type w_cdbsupp_m from w_inheritance
integer width = 4297
integer height = 2072
string title = "조업자재 거래처관리(w_cdbsupp_m)"
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cdbsupp_m w_cdbsupp_m

type variables
st_print  i_print
end variables

on w_cdbsupp_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_op
end on

on w_cdbsupp_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_cdbsupp_m
integer x = 2217
integer y = 64
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

string ls_bsupp
long   ll_row

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	ls_bsupp = dw_1.object.supp_name[ll_row]
	if isnull(ls_bsupp) or ls_bsupp = "" then
		MessageBox("확인", string(ll_row) + " 행 조업자재 거래처명은 공난처리 안됩니다")
		dw_1.scrolltorow( ll_row )
		RETURN
	end if
next

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdbsupp_m
integer x = 32
integer y = 420
integer width = 4192
integer height = 1520
string dataobject = "d_cdbsupp_m"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdbsupp_m
integer x = 32
integer y = 20
integer width = 1326
integer height = 140
string text = "조업자재 거래처관리"
end type

type st_tips from w_inheritance`st_tips within w_cdbsupp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbsupp_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbsupp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdbsupp_m
integer x = 2409
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbsupp_m
integer x = 2025
integer y = 64
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 조업자재거래처내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdbsupp_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdbsupp_m
integer x = 1833
integer y = 64
end type

event pb_delete::clicked;long   ll_row
string ls_suppno

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_suppno = trim(dw_1.object.supp_no[dw_1.getrow()])

SELECT count(*) INTO :ll_row FROM binitem WHERE supp_no = :ls_suppno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.deleterow(0)
dw_1.accepttext()

if dw_1.update() = 1 then
	commit;
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if


end event

type pb_insert from w_inheritance`pb_insert within w_cdbsupp_m
integer x = 1641
integer y = 64
end type

event pb_insert::clicked;long   ll_row
string ls_suppno

dw_1.accepttext()
if dw_1.getrow() < 1 then
	ll_row = dw_1.insertrow(0)
else
	ll_row = dw_1.insertrow(dw_1.getrow())
end if

SELECT max(supp_no) INTO :ls_suppno  FROM bsupp;
if isnull(ls_suppno) then
	ls_suppno = "001"
else 
	ls_suppno = string(integer(ls_suppno) + 1, "000")
end if

dw_1.ScrollToRow(ll_row)
dw_1.object.supp_no[ll_row] = ls_suppno
dw_1.setcolumn('supp_name')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbsupp_m
integer x = 1449
integer y = 64
end type

event pb_retrieve::clicked;dw_1.retrieve()
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================
	
end event

type gb_3 from w_inheritance`gb_3 within w_cdbsupp_m
boolean visible = false
integer x = 1632
integer y = 12
integer width = 594
integer height = 204
end type

type gb_2 from w_inheritance`gb_2 within w_cdbsupp_m
integer y = 240
integer width = 4192
integer height = 168
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdbsupp_m
integer x = 1417
integer y = 16
integer width = 1216
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdbsupp_m
integer x = 101
integer y = 116
integer width = 160
integer height = 108
string dataobject = "d_cdbsupp_r"
boolean vscrollbar = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_3 from statictext within w_cdbsupp_m
integer x = 110
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_cdbsupp_m
integer x = 297
integer y = 292
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_cdbsupp_m
integer x = 329
integer y = 304
integer width = 311
integer height = 88
integer taborder = 120
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

type st_4 from statictext within w_cdbsupp_m
integer x = 768
integer y = 308
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

type sle_value from singlelineedit within w_cdbsupp_m
integer x = 1257
integer y = 300
integer width = 567
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_cdbsupp_m
integer x = 1829
integer y = 300
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_cdbsupp_m
integer x = 1993
integer y = 300
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdbsupp_m
integer x = 2158
integer y = 300
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdbsupp_m
integer x = 2322
integer y = 300
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cdbsupp_m
integer x = 942
integer y = 292
integer width = 306
integer height = 500
integer taborder = 40
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

