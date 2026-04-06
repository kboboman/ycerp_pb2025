$PBExportHeader$w_oiissuereqchk_r.srw
$PBExportComments$제품별 제품출고현황(1998/5/14,성삼지)
forward
global type w_oiissuereqchk_r from w_inheritance
end type
type pb_1 from picturebutton within w_oiissuereqchk_r
end type
type st_3 from statictext within w_oiissuereqchk_r
end type
type ddlb_fld from dropdownlistbox within w_oiissuereqchk_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiissuereqchk_r
end type
type st_4 from statictext within w_oiissuereqchk_r
end type
type sle_value from singlelineedit within w_oiissuereqchk_r
end type
type cb_1 from commandbutton within w_oiissuereqchk_r
end type
type cb_2 from commandbutton within w_oiissuereqchk_r
end type
type cb_3 from commandbutton within w_oiissuereqchk_r
end type
type cb_5 from commandbutton within w_oiissuereqchk_r
end type
type st_1 from statictext within w_oiissuereqchk_r
end type
type em_1 from editmask within w_oiissuereqchk_r
end type
type em_2 from editmask within w_oiissuereqchk_r
end type
type ddlb_op from dropdownlistbox within w_oiissuereqchk_r
end type
end forward

global type w_oiissuereqchk_r from w_inheritance
integer y = 112
integer width = 4389
integer height = 2500
string title = "출고의뢰서 송장체크(w_oiissuereqchk_r)"
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_1 st_1
em_1 em_1
em_2 em_2
ddlb_op ddlb_op
end type
global w_oiissuereqchk_r w_oiissuereqchk_r

type variables
st_print i_print
string   is_sale_flag, is_ret, is_itemdosql1, is_itemdosql2
gs_itemdo_str1 ist_code

end variables

on w_oiissuereqchk_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.em_2
this.Control[iCurrent+14]=this.ddlb_op
end on

on w_oiissuereqchk_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible  = false

em_1.text = string(RelativeDate(today(), -7), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_oiissuereqchk_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiissuereqchk_r
string tag = "d_oiissuereq_chk"
integer x = 32
integer y = 440
integer width = 4279
integer height = 1924
integer taborder = 0
string title = "d_oiissuereq_s_list"
string dataobject = "d_oiissuereq_chk"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiissuereqchk_r
integer y = 20
integer width = 1221
integer height = 136
string text = "출고의뢰서 송장체크"
end type

type st_tips from w_inheritance`st_tips within w_oiissuereqchk_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiissuereqchk_r
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiissuereqchk_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiissuereqchk_r
integer x = 2802
integer y = 72
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiissuereqchk_r
integer x = 2418
integer y = 72
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row, ll_count
string ls_request, ls_price
w_repsuper w_print

ll_row = dw_2.rowcount()
if ll_row < 1 then
   MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//i_print.name = 'd_oiitemdo_r'
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 물품별 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiissuereqchk_r
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiissuereqchk_r
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiissuereqchk_r
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuereqchk_r
integer x = 2226
integer y = 72
integer taborder = 10
end type

event pb_retrieve::clicked;//
st_security lst_security

string ls_sdate, ls_edate
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.settransobject(sqlca)

ls_sdate = em_1.text
ls_edate = em_2.text

dw_1.setredraw(false)
ll_row = dw_1.retrieve( ls_sdate, ls_edate )
dw_1.setredraw(true)

if ll_row < 1 then
	MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiissuereqchk_r
integer x = 1303
integer y = 16
integer width = 882
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiissuereqchk_r
integer y = 260
integer width = 4279
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiissuereqchk_r
integer x = 2199
integer y = 16
integer width = 814
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiissuereqchk_r
integer x = 69
integer y = 180
integer width = 87
integer height = 68
integer taborder = 0
string dataobject = "d_oiitemdo_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type pb_1 from picturebutton within w_oiissuereqchk_r
event mousemove pbm_mousemove
integer x = 2610
integer y = 72
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
		                        "엑셀 (*.XLS), *.XLS," + &
 		                        "CSV(쉽표로 분리), *.CSV," + &
		                        "Html(웹문서), *.HTML,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" OR ls_ExpandName = "html" OR ls_ExpandName = "HTML" then
				dw_1.SaveAs(ls_DocName, HTMLTable!	, TRUE)
			end if
	end if
end if	

end event

type st_3 from statictext within w_oiissuereqchk_r
integer x = 82
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_oiissuereqchk_r
integer x = 270
integer y = 308
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

type ddlb_dwtitles from dropdownlistbox within w_oiissuereqchk_r
integer x = 302
integer y = 320
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

type st_4 from statictext within w_oiissuereqchk_r
integer x = 741
integer y = 324
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

type sle_value from singlelineedit within w_oiissuereqchk_r
integer x = 1230
integer y = 316
integer width = 526
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

type cb_1 from commandbutton within w_oiissuereqchk_r
integer x = 1765
integer y = 316
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

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiissuereqchk_r
integer x = 1929
integer y = 316
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

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiissuereqchk_r
integer x = 2094
integer y = 316
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiissuereqchk_r
integer x = 2258
integer y = 316
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_1 from statictext within w_oiissuereqchk_r
integer x = 1330
integer y = 60
integer width = 823
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "의뢰일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oiissuereqchk_r
integer x = 1330
integer y = 148
integer width = 407
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if


end event

type em_2 from editmask within w_oiissuereqchk_r
integer x = 1746
integer y = 148
integer width = 407
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if


end event

type ddlb_op from dropdownlistbox within w_oiissuereqchk_r
integer x = 919
integer y = 312
integer width = 302
integer height = 500
integer taborder = 180
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

