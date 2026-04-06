$PBExportHeader$w_qcitemcoil_m.srw
$PBExportComments$품목별 코일규격관리(2005/06/09, 이인호)
forward 
global type w_qcitemcoil_m from w_inheritance
end type
type rb_1 from radiobutton within w_qcitemcoil_m
end type
type rb_2 from radiobutton within w_qcitemcoil_m
end type
type sle_1 from singlelineedit within w_qcitemcoil_m
end type
type cb_1 from commandbutton within w_qcitemcoil_m
end type
type pb_4 from picturebutton within w_qcitemcoil_m
end type
type dw_3 from datawindow within w_qcitemcoil_m
end type
type cbx_1 from checkbox within w_qcitemcoil_m
end type
type em_1 from editmask within w_qcitemcoil_m
end type
type em_2 from editmask within w_qcitemcoil_m
end type
type st_6 from statictext within w_qcitemcoil_m
end type
type ddlb_fld from dropdownlistbox within w_qcitemcoil_m
end type
type st_7 from statictext within w_qcitemcoil_m
end type
type ddlb_op from dropdownlistbox within w_qcitemcoil_m
end type
type sle_value from singlelineedit within w_qcitemcoil_m
end type
type cb_2 from commandbutton within w_qcitemcoil_m
end type
type cb_3 from commandbutton within w_qcitemcoil_m
end type
type cb_4 from commandbutton within w_qcitemcoil_m
end type
type cb_5 from commandbutton within w_qcitemcoil_m
end type
type gb_4 from groupbox within w_qcitemcoil_m
end type
type gb_5 from groupbox within w_qcitemcoil_m
end type
type ddlb_dwtitles from dropdownlistbox within w_qcitemcoil_m
end type
end forward

global type w_qcitemcoil_m from w_inheritance
integer width = 4654
integer height = 2356
string title = "품목별 코일규격관리(w_qcitemcoil_m)"
rb_1 rb_1
rb_2 rb_2
sle_1 sle_1
cb_1 cb_1
pb_4 pb_4
dw_3 dw_3
cbx_1 cbx_1
em_1 em_1
em_2 em_2
st_6 st_6
ddlb_fld ddlb_fld
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
gb_4 gb_4
gb_5 gb_5
ddlb_dwtitles ddlb_dwtitles
end type
global w_qcitemcoil_m w_qcitemcoil_m

type variables
st_print  i_print
datawindowchild idwc_item, idwc_qa
string  is_dw

end variables

on w_qcitemcoil_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.sle_1=create sle_1
this.cb_1=create cb_1
this.pb_4=create pb_4
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.em_1=create em_1
this.em_2=create em_2
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.gb_4=create gb_4
this.gb_5=create gb_5
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.pb_4
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.em_2
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.ddlb_op
this.Control[iCurrent+14]=this.sle_value
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.cb_5
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.gb_5
this.Control[iCurrent+21]=this.ddlb_dwtitles
end on

on w_qcitemcoil_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.pb_4)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false

	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
end if

string ls_modify_desc

dw_1.reset()
dw_3.settransobject(sqlca)
dw_3.visible = false
dw_2.visible = false

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

ls_modify_desc = "item_no.Protect = '0~tIf(isRowNew(),0,1)'"
dw_1.modify(ls_modify_desc)
ls_modify_desc = "qa.Protect = '0~tIf(isRowNew(),0,1)'"	
dw_1.modify(ls_modify_desc)
ls_modify_desc = "coil_item.Protect = '0~tIf(isRowNew(),0,1)'"
dw_1.modify(ls_modify_desc)	

if GF_PERMISSION('품목별코일규격관리', gs_userid) = 'Y' then	
	pb_save.enabled = true
end if

dw_1.getchild("item_no", idwc_item)
GS_DS_ITEMALL.ShareData(idwc_item)

dw_1.getchild("qa", idwc_qa)
idwc_qa.settransobject(sqlca)

dw_1.sharedata(dw_2)
dw_1.setfocus()


end event

event resize;call super::resize;//
dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_qcitemcoil_m
integer x = 4174
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if wf_update1(dw_1,"Y") = true then
	long ll_row
	ll_row = dw_1.getrow()
	dw_1.setredraw(false)
	pb_retrieve.triggerevent( clicked!)
	dw_1.scrolltorow(ll_row)
	dw_1.setredraw(true)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_qcitemcoil_m
integer x = 32
integer y = 428
integer width = 4544
integer height = 1788
string dataobject = "d_qcitemcoil_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case 'item_no'
			idwc_qa.retrieve(data)
	case else
		/*statementblock*/
end choose

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;long ll_row
string ls_item

ll_row = this.getrow()

if ll_row < 1 then return
ls_item = this.object.item_no[ll_row]
idwc_qa.retrieve(ls_item)

end event

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_qcitemcoil_m
integer x = 32
integer y = 20
integer width = 1271
integer height = 140
string text = "품목별 코일규격관리"
end type

type st_tips from w_inheritance`st_tips within w_qcitemcoil_m
end type

type pb_compute from w_inheritance`pb_compute within w_qcitemcoil_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_qcitemcoil_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_qcitemcoil_m
integer x = 4366
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_qcitemcoil_m
integer x = 3982
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_currcode

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 품목별 코일 규격관리를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_qcitemcoil_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_qcitemcoil_m
integer x = 3589
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_qcitemcoil_m
integer x = 3397
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;long ll_row
string ls_item

dw_1.accepttext( )
ll_row = dw_1.insertrow(dw_1.getrow() + 1)
dw_1.ScrollToRow(ll_row)
dw_1.object.item_no[ll_row] = dw_1.object.item_no[ll_row -1]
dw_1.object.qa[ll_row] = dw_1.object.qa[ll_row -1]
ls_item = dw_1.object.item_no[ll_row]
idwc_qa.retrieve(ls_item)
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_qcitemcoil_m
integer x = 3205
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate

ls_sdate  = em_1.text
ls_edate  = em_2.text

dw_1.SetFilter("")
dw_1.Filter()

dw_1.retrieve(gs_area)
dw_3.retrieve( ls_sdate, ls_edate )

end event

type gb_3 from w_inheritance`gb_3 within w_qcitemcoil_m
boolean visible = false
integer x = 1582
integer y = 36
integer width = 594
integer height = 204
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_qcitemcoil_m
integer y = 236
integer width = 4544
integer height = 180
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_qcitemcoil_m
integer x = 3163
integer y = 16
integer width = 1413
integer height = 220
end type

type dw_2 from w_inheritance`dw_2 within w_qcitemcoil_m
integer x = 1102
integer y = 16
integer width = 105
integer height = 80
string dataobject = "d_qcitemcoil_r"
boolean vscrollbar = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type rb_1 from radiobutton within w_qcitemcoil_m
integer x = 1957
integer y = 76
integer width = 283
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품목별"
boolean checked = true
end type

event clicked;dw_1.SetSort(" use_flag DESC, item_no, qa, seq_no ")
dw_1.Sort()
end event

type rb_2 from radiobutton within w_qcitemcoil_m
integer x = 1957
integer y = 144
integer width = 416
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일품목별"
end type

event clicked;dw_1.SetSort(" use_flag DESC, coil_item ")
dw_1.Sort()
end event

type sle_1 from singlelineedit within w_qcitemcoil_m
integer x = 2400
integer y = 100
integer width = 544
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "품목"
borderstyle borderstyle = stylelowered!
end type

event getfocus;sle_1.text = ""
gs_where2 lst_whitemret

lst_whitemret.chk = "S"
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	sle_1.text = lst_whitemret.str1[1]
end if
sle_1.setfocus()
end event

type cb_1 from commandbutton within w_qcitemcoil_m
integer x = 2953
integer y = 100
integer width = 160
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "찾기"
end type

event clicked;if sle_1.text = "" or sle_1.text = "품목" then 
	dw_1.SetFilter("")
	dw_1.Filter()
else
	string ls_filter
	ls_filter = "item_no = '" + trim(sle_1.text) + "'"
	dw_1.SetFilter( ls_filter )
	dw_1.Filter()
end if

end event

type pb_4 from picturebutton within w_qcitemcoil_m
event mousemove pbm_mousemove
integer x = 3785
integer y = 64
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type dw_3 from datawindow within w_qcitemcoil_m
integer x = 850
integer y = 680
integer width = 2921
integer height = 1104
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_qcitemcoil_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.scrolltorow( row )

end event

type cbx_1 from checkbox within w_qcitemcoil_m
integer x = 2866
integer y = 316
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고 기간별 CHECK"
end type

event clicked;//
if this.checked = true then
	dw_3.visible = true
else
	dw_3.visible = false
end if


end event

type em_1 from editmask within w_qcitemcoil_m
integer x = 1413
integer y = 68
integer width = 357
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_qcitemcoil_m
integer x = 1499
integer y = 148
integer width = 357
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_6 from statictext within w_qcitemcoil_m
integer x = 114
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_qcitemcoil_m
integer x = 302
integer y = 300
integer width = 480
integer height = 632
integer taborder = 10
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

type st_7 from statictext within w_qcitemcoil_m
integer x = 800
integer y = 316
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

type ddlb_op from dropdownlistbox within w_qcitemcoil_m
integer x = 969
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_qcitemcoil_m
integer x = 1289
integer y = 308
integer width = 517
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

type cb_2 from commandbutton within w_qcitemcoil_m
integer x = 1819
integer y = 308
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

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_3"
		arg_dw = dw_3
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_qcitemcoil_m
integer x = 1984
integer y = 308
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

choose case is_dw
	case "dw_1"
		arg_dw = dw_1
	case "dw_3"
		arg_dw = dw_3
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_qcitemcoil_m
integer x = 2149
integer y = 308
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
		arg_dw = dw_1
	case "dw_3"
		arg_dw = dw_3
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_qcitemcoil_m
integer x = 2313
integer y = 308
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
		arg_dw = dw_1
	case "dw_3"
		arg_dw = dw_3
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_qcitemcoil_m
integer x = 1915
integer y = 16
integer width = 1230
integer height = 220
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "검색조건"
end type

type gb_5 from groupbox within w_qcitemcoil_m
integer x = 1362
integer y = 16
integer width = 526
integer height = 220
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고기간"
end type

type ddlb_dwtitles from dropdownlistbox within w_qcitemcoil_m
integer x = 343
integer y = 312
integer width = 311
integer height = 88
integer taborder = 10
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

