$PBExportHeader$w_erpstatus.srw
$PBExportComments$ERP 상태보기
forward
global type w_erpstatus from window
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
type cb_12 from commandbutton within w_erpstatus
end type
type cb_11 from commandbutton within w_erpstatus
end type
type cb_filteroff from commandbutton within w_erpstatus
end type
type sle_value from singlelineedit within w_erpstatus
end type
type ddlb_2 from dropdownlistbox within w_erpstatus
end type
type st_9 from statictext within w_erpstatus
end type
type ddlb_col from dropdownlistbox within w_erpstatus
end type
type st_8 from statictext within w_erpstatus
end type
type pb_4 from picturebutton within w_erpstatus
end type
type st_title from statictext within w_erpstatus
end type
type dw_1 from datawindow within w_erpstatus
end type
type cb_filteron from commandbutton within w_erpstatus
end type
type gb_1 from groupbox within w_erpstatus
end type
end forward

global type w_erpstatus from window
integer x = 494
integer y = 424
integer width = 4558
integer height = 2264
boolean titlebar = true
string title = "ERP 상태보기(w_erpstatus)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
string icon = "Hand!"
boolean center = true
st_2 st_2
st_1 st_1
pb_1 pb_1
pb_5 pb_5
st_time st_time
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
pb_4 pb_4
st_title st_title
dw_1 dw_1
cb_filteron cb_filteron
gb_1 gb_1
end type
global w_erpstatus w_erpstatus

type variables

end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

String  ls_msgchk, ls_colx
long    ll_row
Window  w_parent

//OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()
THIS.X   = (w_parent.width  - this.width)  / 2
THIS.Y   = (w_parent.height - this.height) / 2 - 250

dw_1.settransobject(sqlca)

st_time.text = ""
ddlb_col.text = "BLK"
ddlb_2.text   = "LIKE"

ls_colx = dw_1.object.program_name.x
//dw_1.object.datawindow.horizontalscrollsplit = ls_colx

pb_1.triggerevent(clicked!)
end event

on w_erpstatus.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_5=create pb_5
this.st_time=create st_time
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_filteroff=create cb_filteroff
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.pb_4=create pb_4
this.st_title=create st_title
this.dw_1=create dw_1
this.cb_filteron=create cb_filteron
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.st_1,&
this.pb_1,&
this.pb_5,&
this.st_time,&
this.cb_12,&
this.cb_11,&
this.cb_filteroff,&
this.sle_value,&
this.ddlb_2,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.pb_4,&
this.st_title,&
this.dw_1,&
this.cb_filteron,&
this.gb_1}
end on

on w_erpstatus.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_5)
destroy(this.st_time)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_filteroff)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.pb_4)
destroy(this.st_title)
destroy(this.dw_1)
destroy(this.cb_filteron)
destroy(this.gb_1)
end on

event resize;dw_1.width  = this.width  - 160
dw_1.height = this.height - 472
end event

type st_2 from statictext within w_erpstatus
integer x = 1522
integer y = 112
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
integer x = 1522
integer y = 32
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
integer x = 3616
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
integer x = 4219
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
integer x = 3296
integer y = 240
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

type cb_12 from commandbutton within w_erpstatus
integer x = 2761
integer y = 228
integer width = 270
integer height = 76
integer taborder = 70
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
String ls_col
choose case trim(ddlb_col.text)
	case "SPID"
		ls_col = "spid "
	case "BLK"
		ls_col = "blocked "
	case "PROGRAM"
		ls_col = "program_name "
	case "USER"
		ls_col = "loginname "
	case "HOSTNAME"
		ls_col = "hostname "
	case "MAC"
		ls_col = "macaddr "
	case "LOGIN TIME"
		ls_col = "login_time "
	case "LAST BATCH"
		ls_col = "last_batch "
	case "HOUR"
		ls_col = "use_hour "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type cb_11 from commandbutton within w_erpstatus
integer x = 2487
integer y = 228
integer width = 270
integer height = 76
integer taborder = 60
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
String ls_col
choose case trim(ddlb_col.text)
	case "SPID"
		ls_col = "spid "
	case "BLK"
		ls_col = "blocked "
	case "PROGRAM"
		ls_col = "program_name "
	case "USER"
		ls_col = "loginname "
	case "HOSTNAME"
		ls_col = "hostname "
	case "MAC"
		ls_col = "macaddr "
	case "LOGIN TIME"
		ls_col = "login_time "
	case "LAST BATCH"
		ls_col = "last_batch "
	case "HOUR"
		ls_col = "use_hour "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_filteroff from commandbutton within w_erpstatus
integer x = 2213
integer y = 228
integer width = 270
integer height = 76
integer taborder = 40
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "BLK"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

end event

type sle_value from singlelineedit within w_erpstatus
integer x = 1129
integer y = 228
integer width = 795
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within w_erpstatus
integer x = 837
integer y = 224
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_9 from statictext within w_erpstatus
integer x = 654
integer y = 244
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
string text = "연산: "
boolean focusrectangle = false
end type

type ddlb_col from dropdownlistbox within w_erpstatus
integer x = 238
integer y = 224
integer width = 402
integer height = 532
integer taborder = 30
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
string item[] = {"SPID","BLK","PROGRAM","USER","HOSTNAME","MAC","LOGIN TIME","LAST BATCH","HOUR",""}
end type

type st_8 from statictext within w_erpstatus
integer x = 55
integer y = 244
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

type pb_4 from picturebutton within w_erpstatus
event mousemove pbm_mousemove
integer x = 3817
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
integer x = 27
integer y = 24
integer width = 1440
integer height = 148
integer textsize = -24
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
integer x = 50
integer y = 320
integer width = 4398
integer height = 1792
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_erpstatus"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;string ls_col, ls_text

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

choose case dwo.name
	case "spid"
		ddlb_2.text = "=" 
		ls_col  = "SPID"
		ls_text = string(this.object.spid[row])
	case "blocked"
		ddlb_2.text = "=" 
		ls_col  = "BLK"
		ls_text = string(this.object.blocked[row])
	case "program_name"
		ddlb_2.text = "LIKE" 
		ls_col  = "PROGRAM"
		ls_text = this.object.program_name[row]
	case "loginname"
		ddlb_2.text = "LIKE" 
		ls_col  = "USER"
		ls_text = this.object.loginname[row]
	case "hostname"
		ddlb_2.text = "LIKE" 
		ls_col  = "HOSTNAME"
		ls_text = this.object.hostname[row]
	case "macaddr"
		ddlb_2.text = "LIKE" 
		ls_col  = "MAC"
		ls_text = this.object.macaddr[row]
	case "login_time"
		ddlb_2.text = "LIKE" 
		ls_col  = "LOGIN TIME"
		ls_text = this.object.login_time[row]
	case "last_batch"
		ddlb_2.text = "LIKE" 
		ls_col  = "LAST BATCH"
		ls_text = this.object.last_batch[row]
	case "use_hour"
		ddlb_2.text = "=" 
		ls_col  = "HOUR"
		ls_text = string(this.object.use_hour[row])
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text


end event

type cb_filteron from commandbutton within w_erpstatus
integer x = 1938
integer y = 228
integer width = 270
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "SPID"
			ls_col = "spid "
		case "BLK"
			ls_col = "blocked "
		case "PROGRAM"
			ls_col = "program_name "
		case "USER"
			ls_col = "loginname "
		case "HOSTNAME"
			ls_col = "hostname "
		case "MAC"
			ls_col = "macaddr "
		case "LOGIN TIME"
			ls_col = "login_time "
		case "LAST BATCH"
			ls_col = "last_batch "
		case "HOUR"
			ls_col = "use_hour "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case trim(ls_col)
			case "login_time","last_batch"
				ddlb_2.text = "LIKE" 
				ls_column = ls_col + trim(ddlb_2.text) + " #" + trim(sle_value.text) + "# "
			case "spid", "blocked", "use_hour"
				ddlb_2.text = "=" 
				ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
			case else
//				ddlb_2.text = "LIKE" 
				ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end choose
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

st_time.text = ls_temp
dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)
dw_1.triggerevent(rowfocuschanged!)

end event

type gb_1 from groupbox within w_erpstatus
integer x = 3589
integer width = 855
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

