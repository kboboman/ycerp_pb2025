$PBExportHeader$w_cdmainsupp_m.srw
$PBExportComments$물품별 주거래처관리(1998/02/09,곽용덕)
forward
global type w_cdmainsupp_m from w_inheritance
end type
type dw_3 from datawindow within w_cdmainsupp_m
end type
type st_4 from statictext within w_cdmainsupp_m
end type
type ddlb_fld from dropdownlistbox within w_cdmainsupp_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdmainsupp_m
end type
type st_6 from statictext within w_cdmainsupp_m
end type
type sle_value from singlelineedit within w_cdmainsupp_m
end type
type cb_2 from commandbutton within w_cdmainsupp_m
end type
type cb_3 from commandbutton within w_cdmainsupp_m
end type
type cb_4 from commandbutton within w_cdmainsupp_m
end type
type cb_5 from commandbutton within w_cdmainsupp_m
end type
type ddlb_op from dropdownlistbox within w_cdmainsupp_m
end type
end forward

global type w_cdmainsupp_m from w_inheritance
integer width = 3502
integer height = 2044
string title = "물품별 주거래처관리(w_cdmainsupp_m)"
dw_3 dw_3
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
ddlb_op ddlb_op
end type
global w_cdmainsupp_m w_cdmainsupp_m

type variables
datawindowchild idwc_supp
st_print i_print
end variables

on w_cdmainsupp_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.ddlb_op
end on

on w_cdmainsupp_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
idwc_supp.insertrow(0)

end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 73
dw_1.height = newheight - 472

end event

type pb_save from w_inheritance`pb_save within w_cdmainsupp_m
integer x = 3022
end type

event pb_save::clicked;string ls_item,ls_supp,ls_qa
long ll_row,ll_cnt,i
dwItemStatus l_status
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ll_row = dw_1.rowcount()
for i = 1 to ll_row
    l_status = dw_1.GetItemStatus(i, 0, Primary!)
	 if (l_status = datamodified!) then
		 ls_item = trim(dw_1.object.item_no[i])
		 ls_qa = trim(dw_1.object.qa[i])
		 ls_supp = trim(dw_1.object.supplier[i])
		 update supplier set priority_flag = 'Y'
		 where item_no = :ls_item and qa = :ls_qa and supp_no = :ls_supp;
	 end if
next
wf_update1(dw_1,"Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdmainsupp_m
integer x = 27
integer y = 436
integer width = 3401
integer height = 1468
string dataobject = "d_cdmainsupp_m"
boolean hscrollbar = false
end type

event dw_1::itemfocuschanged;call super::itemfocuschanged;string ls_supp,ls_item,ls_qa

ls_item = trim(dw_1.object.item_no[row])
ls_qa = trim(dw_1.object.qa[row])
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
if idwc_supp.retrieve(ls_item,ls_qa) < 1 then
	idwc_supp.insertrow(0)
end if

//MessageBox("Greeting", "Hello User")
end event

event dw_1::itemchanged;call super::itemchanged;dw_1.object.supp_supp_name[row] = idwc_supp.getitemstring(idwc_supp.getrow(),'supp_supp_name')
end event

event dw_1::rowfocuschanged;string ls_supp,ls_item,ls_qa
this.accepttext()

ls_item = trim(dw_1.object.item_no[currentrow])
ls_qa = trim(dw_1.object.qa[currentrow])
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
if idwc_supp.retrieve(ls_item,ls_qa) < 1 then
	idwc_supp.insertrow(0)
end if

//MessageBox("Greeting", "Hello User")
end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then return

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdmainsupp_m
integer x = 32
integer width = 1527
string text = "물품별 주거래처 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdmainsupp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdmainsupp_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdmainsupp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdmainsupp_m
integer x = 3214
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdmainsupp_m
integer x = 2825
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_3.retrieve()
i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은  물품별 주거래처를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=105'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdmainsupp_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdmainsupp_m
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_cdmainsupp_m
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdmainsupp_m
integer x = 2629
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdmainsupp_m
boolean visible = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdmainsupp_m
integer x = 27
integer y = 232
integer width = 3401
integer height = 188
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdmainsupp_m
integer x = 2592
integer width = 837
end type

type dw_2 from w_inheritance`dw_2 within w_cdmainsupp_m
boolean visible = false
integer x = 1938
integer y = 40
integer width = 261
integer height = 156
end type

type dw_3 from datawindow within w_cdmainsupp_m
boolean visible = false
integer x = 2249
integer y = 40
integer width = 210
integer height = 168
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_cdmainsupp_r"
boolean livescroll = true
end type

type st_4 from statictext within w_cdmainsupp_m
integer x = 82
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_cdmainsupp_m
integer x = 270
integer y = 296
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

type ddlb_dwtitles from dropdownlistbox within w_cdmainsupp_m
integer x = 302
integer y = 308
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

type st_6 from statictext within w_cdmainsupp_m
integer x = 741
integer y = 312
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

type sle_value from singlelineedit within w_cdmainsupp_m
integer x = 1230
integer y = 304
integer width = 567
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

type cb_2 from commandbutton within w_cdmainsupp_m
integer x = 1801
integer y = 304
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

arg_dw = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_cdmainsupp_m
integer x = 1966
integer y = 304
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_cdmainsupp_m
integer x = 2130
integer y = 304
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdmainsupp_m
integer x = 2295
integer y = 304
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_cdmainsupp_m
integer x = 910
integer y = 300
integer width = 306
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

