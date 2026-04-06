$PBExportHeader$w_erpstatus.srw
$PBExportComments$ERP 상태보기
forward 
global type w_erpstatus from window
end type
type cb_5 from commandbutton within w_erpstatus
end type
type cb_3 from commandbutton within w_erpstatus
end type
type cb_2 from commandbutton within w_erpstatus
end type
type cb_1 from commandbutton within w_erpstatus
end type
type sle_value from singlelineedit within w_erpstatus
end type
type ddlb_op from dropdownlistbox within w_erpstatus
end type
type st_6 from statictext within w_erpstatus
end type
type ddlb_dwtitles from dropdownlistbox within w_erpstatus
end type
type ddlb_fld from dropdownlistbox within w_erpstatus
end type
type st_4 from statictext within w_erpstatus
end type
type st_2 from statictext within w_erpstatus
end type
type st_1 from statictext within w_erpstatus
end type
type pb_1 from picturebutton within w_erpstatus
end type
type pb_5 from picturebutton within w_erpstatus
end type
type st_time from statictext within w_erpstatus
end type
type pb_4 from picturebutton within w_erpstatus
end type
type st_title from statictext within w_erpstatus
end type
type dw_1 from datawindow within w_erpstatus
end type
type gb_1 from groupbox within w_erpstatus
end type
type dw_2 from datawindow within w_erpstatus
end type
type gb_2 from groupbox within w_erpstatus
end type
end forward

global type w_erpstatus from window
integer x = 494
integer y = 424
integer width = 4535
integer height = 2256
boolean titlebar = true
string title = "ERP 상태보기(w_erpstatus)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "Hand!"
boolean center = true
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_value sle_value
ddlb_op ddlb_op
st_6 st_6
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_4 st_4
st_2 st_2
st_1 st_1
pb_1 pb_1
pb_5 pb_5
st_time st_time
pb_4 pb_4
st_title st_title
dw_1 dw_1
gb_1 gb_1
dw_2 dw_2
gb_2 gb_2
end type
global w_erpstatus w_erpstatus

type variables

end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

String  ls_msgchk, ls_colx
long    ll_row
Window  w_parent

// OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()
THIS.X   = (w_parent.width  - this.width)  / 2
THIS.Y   = (w_parent.height - this.height) / 2 - 250

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

dw_2.visible = false

st_time.text = ""

ls_colx = dw_1.object.program_name.x
//dw_1.object.datawindow.horizontalscrollsplit = ls_colx

pb_1.triggerevent(clicked!)

end event

on w_erpstatus.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_6=create st_6
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_5=create pb_5
this.st_time=create st_time
this.pb_4=create pb_4
this.st_title=create st_title
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_2=create dw_2
this.gb_2=create gb_2
this.Control[]={this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_value,&
this.ddlb_op,&
this.st_6,&
this.ddlb_dwtitles,&
this.ddlb_fld,&
this.st_4,&
this.st_2,&
this.st_1,&
this.pb_1,&
this.pb_5,&
this.st_time,&
this.pb_4,&
this.st_title,&
this.dw_1,&
this.gb_1,&
this.dw_2,&
this.gb_2}
end on

on w_erpstatus.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_6)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_5)
destroy(this.st_time)
destroy(this.pb_4)
destroy(this.st_title)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_2)
destroy(this.gb_2)
end on

event resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

end event

type cb_5 from commandbutton within w_erpstatus
integer x = 2267
integer y = 288
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_3 from commandbutton within w_erpstatus
integer x = 2103
integer y = 288
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_erpstatus
integer x = 1938
integer y = 288
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

type cb_1 from commandbutton within w_erpstatus
integer x = 1774
integer y = 288
integer width = 160
integer height = 76
integer taborder = 80
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

type sle_value from singlelineedit within w_erpstatus
integer x = 1239
integer y = 288
integer width = 526
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_erpstatus
integer x = 919
integer y = 280
integer width = 297
integer height = 512
integer taborder = 60
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

type st_6 from statictext within w_erpstatus
integer x = 750
integer y = 296
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

type ddlb_dwtitles from dropdownlistbox within w_erpstatus
integer x = 311
integer y = 292
integer width = 311
integer height = 88
integer taborder = 60
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

type ddlb_fld from dropdownlistbox within w_erpstatus
integer x = 279
integer y = 280
integer width = 443
integer height = 632
integer taborder = 50
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

type st_4 from statictext within w_erpstatus
integer x = 91
integer y = 296
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

type st_2 from statictext within w_erpstatus
integer x = 1765
integer y = 136
integer width = 2016
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_1 from statictext within w_erpstatus
integer x = 1765
integer y = 56
integer width = 2016
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_erpstatus
integer x = 1115
integer y = 48
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
string disabledname = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;long  ll_cnt, ll_cnttot, ll_row, ll_blk[], ll_spid, ll_idx

st_1.text = ""
st_2.text = ""
st_time.text = string(now(),"yyyy/mm/dd hh:mm:ss")

ll_cnttot = dw_1.retrieve()
dw_1.sharedata( dw_2 )
//===============
// #  SPID  BLK
//===============
// 1  69    104
// 2  70    69
// 3  71    0
// 4  74    70
// 5  76    0
// 6  79    69
// 7  104   0
//===============
for ll_cnt = 1 to ll_cnttot
	if dw_1.object.blocked[ll_cnt] <> 0 then
		ll_idx = ll_idx + 1
		ll_blk[ll_idx] = dw_1.object.blocked[ll_cnt]
		st_1.text = st_1.text + string(ll_blk[ll_idx]) + ","
		// 104, 69, 70, 69
	end if
next

// 104, 69, 70, 69
for ll_cnt = 1 to UpperBound(ll_blk)
	ll_spid = ll_blk[ll_cnt]		// 104
	st_2.text = st_2.text + string(ll_spid) + ","
	for ll_row = 1 to ll_cnttot
		if ll_spid = dw_1.object.spid[ll_row] then
			if dw_1.object.blocked[ll_row] = 0 then
				dw_1.Object.spid.Background.Color         = RGB(255, 0, 0)
				dw_1.Object.blocked.Background.Color      = RGB(255, 0, 0)
				dw_1.Object.program_name.Background.Color = RGB(255, 0, 0)
				dw_1.Object.loginname.Background.Color    = RGB(255, 0, 0)
				dw_1.Object.hostname.Background.Color     = RGB(255, 0, 0)
				dw_1.Object.macaddr.Background.Color      = RGB(255, 0, 0)
				dw_1.Object.login_time.Background.Color   = RGB(255, 0, 0)
				dw_1.Object.last_batch.Background.Color   = RGB(255, 0, 0)
				dw_1.Object.use_hour.Background.Color     = RGB(255, 0, 0)
				
				dw_1.ScrollToRow(ll_idx)
				exit
			end if
		end if
	next
next

end event

type pb_5 from picturebutton within w_erpstatus
integer x = 1513
integer y = 48
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
string disabledname = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event clicked;close(parent)
end event

type st_time from statictext within w_erpstatus
integer x = 3255
integer y = 296
integer width = 1147
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_4 from picturebutton within w_erpstatus
event mousemove pbm_mousemove
integer x = 1317
integer y = 48
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
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

type st_title from statictext within w_erpstatus
integer x = 32
integer y = 24
integer width = 997
integer height = 136
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "ERP 상태보기"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_erpstatus
integer x = 32
integer y = 404
integer width = 4425
integer height = 1712
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_erpstatus"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
//is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

type gb_1 from groupbox within w_erpstatus
integer x = 1088
integer width = 645
integer height = 212
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type dw_2 from datawindow within w_erpstatus
integer x = 78
integer y = 176
integer width = 73
integer height = 64
integer taborder = 80
boolean bringtotop = true
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_erpstatus
integer x = 32
integer y = 228
integer width = 4425
integer height = 164
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

