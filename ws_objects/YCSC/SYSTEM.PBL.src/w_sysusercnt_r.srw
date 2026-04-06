$PBExportHeader$w_sysusercnt_r.srw
$PBExportComments$사용자별 프로그램 사용현황(2001/08/14,이대준)
forward
global type w_sysusercnt_r from w_inheritance
end type
type em_1 from editmask within w_sysusercnt_r
end type
type em_2 from editmask within w_sysusercnt_r
end type
type st_1 from statictext within w_sysusercnt_r
end type
type cbx_1 from checkbox within w_sysusercnt_r
end type
type dw_3 from datawindow within w_sysusercnt_r
end type
type st_2 from statictext within w_sysusercnt_r
end type
type st_3 from statictext within w_sysusercnt_r
end type
type dw_4 from datawindow within w_sysusercnt_r
end type
type pb_1 from picturebutton within w_sysusercnt_r
end type
type tab_1 from tab within w_sysusercnt_r
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_2 from checkbox within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_filteroff from commandbutton within tabpage_1
end type
type cb_filteron from commandbutton within tabpage_1
end type
type sle_value from singlelineedit within tabpage_1
end type
type ddlb_op from dropdownlistbox within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type ddlb_dwtitles from dropdownlistbox within tabpage_1
end type
type ddlb_fld from dropdownlistbox within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_2 cbx_2
cb_4 cb_4
cb_3 cb_3
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_op ddlb_op
st_9 st_9
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_8 st_8
dw_5 dw_5
end type
type tabpage_2 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_3 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_7 dw_7
end type
type tab_1 from tab within w_sysusercnt_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type gb_4 from groupbox within w_sysusercnt_r
end type
end forward

global type w_sysusercnt_r from w_inheritance
integer width = 4361
integer height = 2224
string title = "프로그램 사용현황(w_sysusercnt_r)"
em_1 em_1
em_2 em_2
st_1 st_1
cbx_1 cbx_1
dw_3 dw_3
st_2 st_2
st_3 st_3
dw_4 dw_4
pb_1 pb_1
tab_1 tab_1
gb_4 gb_4
end type
global w_sysusercnt_r w_sysusercnt_r

type variables
string is_id
st_print i_print
DataWindow dw5, dw6, dw7
DropDownListBox ddlb_fld, ddlb_op, ddlb_dwtitles
SingleLineEdit  sle_value

end variables

on w_sysusercnt_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.dw_4=create dw_4
this.pb_1=create pb_1
this.tab_1=create tab_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.tab_1
this.Control[iCurrent+11]=this.gb_4
end on

on w_sysusercnt_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.tab_1)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

long ll_row
DataWindowChild ldwc_user, ldwc_win

dw_2.visible = false
dw_1.visible = false

dw5 = this.tab_1.tabpage_1.dw_5
dw5.SetTransObject(SQLCA)

dw6 = this.tab_1.tabpage_2.dw_6
dw6.SetTransObject(SQLCA)

dw7 = this.tab_1.tabpage_3.dw_7
dw7.SetTransObject(SQLCA)

dw5.reset()

dw_3.insertrow(1)
dw_3.getchild('user_id', ldwc_user)
ldwc_user.SetTransObject(SQLCA)
ldwc_user.retrieve()

ll_row = ldwc_user.insertrow(1)
ldwc_user.setitem(ll_row,'user_id','%')
ldwc_user.setitem(ll_row,'user_name','전체')
dw_3.setitem(1, 'user_id', '%')

if gf_permission("프로그램 사용현황", gs_userid) = 'Y' then
else
	dw_3.setitem(1, 'user_id', gs_userid)
	dw_3.enabled = false
end if

dw_4.insertrow(1)
dw_4.getchild('window_name', ldwc_win)
ldwc_win.SetTransObject(SQLCA)
ldwc_win.retrieve()

ll_row = ldwc_win.insertrow(1)
ldwc_win.setitem(ll_row,'window_id','%')
ldwc_win.setitem(ll_row,'window_name','전체')
dw_4.setitem(1, 'window_name', '%')

dw5.ShareData(dw_2)
em_1.text= string(RelativeDate(today(),  - 31),'yyyy/mm/dd')
em_2.text= string(today(),'yyyy/mm/dd')

ddlb_fld      = tab_1.tabpage_1.ddlb_fld
ddlb_op       = tab_1.tabpage_1.ddlb_op
ddlb_dwtitles = tab_1.tabpage_1.ddlb_dwtitles
sle_value     = tab_1.tabpage_1.sle_value

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw5, ddlb_fld, ddlb_dwtitles )

end event

event resize;call super::resize;//
tab_1.width  = newwidth  - 115
tab_1.height = newheight - 456

dw5.width    = newwidth  - 206
dw5.height   = newheight - 732

dw6.width    = newwidth  - 206
dw6.height   = newheight - 640

dw7.width    = dw6.width
dw7.height   = dw6.height

end event

type pb_save from w_inheritance`pb_save within w_sysusercnt_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_sysusercnt_r
integer x = 1641
integer y = 104
integer width = 96
integer height = 80
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_sysusercnt_r
integer x = 1536
integer y = 104
integer width = 96
integer height = 80
string dataobject = "d_sysusercnt_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_sysusercnt_r
integer x = 46
integer width = 1449
integer height = 140
integer textsize = -20
string text = "프로그램 사용현황"
end type

type st_tips from w_inheritance`st_tips within w_sysusercnt_r
end type

type pb_compute from w_inheritance`pb_compute within w_sysusercnt_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_sysusercnt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_sysusercnt_r
integer x = 4027
integer y = 60
integer taborder = 130
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_sysusercnt_r
integer x = 3835
integer y = 60
integer taborder = 140
end type

event pb_print::clicked;call super::clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

choose case tab_1.SelectedTab
	case 1
		dwxls = dw5
end choose

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//						dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if   
MessageBox("확인","엑셀파일 작업완료.")

end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_sysusercnt_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_sysusercnt_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_sysusercnt_r
boolean visible = false
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_sysusercnt_r
integer x = 3447
integer y = 60
integer taborder = 170
string text = " "
end type

event pb_retrieve::clicked;string  ls_sql, ls_where, ls_id, ls_user,ls_window,ls_wid, ls_filter
integer li_row, li_row2
long    ll_row
string  ls_start, ls_end


choose case cbx_1.checked
	case false
	  ls_start = em_1.text
     ls_end   = em_2.text

	case true
	  ls_start = '2001/07/01'
     ls_end   = string(today(), "yyyy/mm/dd")
end choose
dw_3.accepttext()
dw_4.accepttext()

if gf_permission("프로그램 사용현황", gs_userid) = 'Y' then
	ls_user   = dw_3.object.user_id[1]
else
	ls_user   = gs_userid
end if
ls_window = dw_4.object.window_name[1]

ll_row    = dw5.retrieve( ls_start, ls_end, ls_user, ls_window )
ll_row    = dw6.retrieve( ls_start, ls_end, ls_user, ls_window )
ll_row    = dw7.retrieve( ls_start, ls_end, ls_user, ls_window )
if ll_row = 0 then
	MessageBox("확인","해당하는 자료가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_sysusercnt_r
integer x = 46
integer y = 224
integer width = 1170
integer height = 152
end type

type gb_2 from w_inheritance`gb_2 within w_sysusercnt_r
boolean visible = false
integer x = 1728
integer y = 8
integer width = 242
integer height = 108
integer taborder = 110
end type

type gb_1 from w_inheritance`gb_1 within w_sysusercnt_r
integer x = 3406
integer y = 20
integer width = 850
end type

type em_1 from editmask within w_sysusercnt_r
integer x = 73
integer y = 268
integer width = 402
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_sysusercnt_r
integer x = 549
integer y = 268
integer width = 402
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_sysusercnt_r
integer x = 480
integer y = 264
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_sysusercnt_r
integer x = 974
integer y = 276
integer width = 210
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;if this.checked then
	em_1.enabled = false
	em_2.enabled = false
else
	em_1.enabled = true
	em_2.enabled = true
end if
end event

type dw_3 from datawindow within w_sysusercnt_r
integer x = 1454
integer y = 276
integer width = 640
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_userid_c2"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_sysusercnt_r
integer x = 1248
integer y = 292
integer width = 192
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
boolean enabled = false
string text = "사용자"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_sysusercnt_r
integer x = 2089
integer y = 292
integer width = 274
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
boolean enabled = false
string text = "프로그램"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_sysusercnt_r
integer x = 2368
integer y = 276
integer width = 864
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_syswindow_s"
boolean border = false
boolean livescroll = true
end type

type pb_1 from picturebutton within w_sysusercnt_r
integer x = 3643
integer y = 60
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

choose case tab_1.SelectedTab
	case 1
		dwxls = dw5
	case 2
		dwxls = dw6
	case 3
		dwxls = dw7
end choose

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//						dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if   
MessageBox("확인","엑셀파일 작업완료.")

end event

type tab_1 from tab within w_sysusercnt_r
integer x = 46
integer y = 400
integer width = 4210
integer height = 1664
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
boolean pictureonright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4174
integer height = 1540
long backcolor = 79741120
string text = "리스트"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cbx_2 cbx_2
cb_4 cb_4
cb_3 cb_3
cb_filteroff cb_filteroff
cb_filteron cb_filteron
sle_value sle_value
ddlb_op ddlb_op
st_9 st_9
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_8 st_8
dw_5 dw_5
end type

on tabpage_1.create
this.cbx_2=create cbx_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_9=create st_9
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_8=create st_8
this.dw_5=create dw_5
this.Control[]={this.cbx_2,&
this.cb_4,&
this.cb_3,&
this.cb_filteroff,&
this.cb_filteron,&
this.sle_value,&
this.ddlb_op,&
this.st_9,&
this.ddlb_dwtitles,&
this.ddlb_fld,&
this.st_8,&
this.dw_5}
end on

on tabpage_1.destroy
destroy(this.cbx_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_9)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_8)
destroy(this.dw_5)
end on

type cbx_2 from checkbox within tabpage_1
integer x = 2793
integer y = 44
integer width = 361
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "소계숨김"
end type

event clicked;// 소계숨김
if this.checked = true then
	dw_5.Modify("DataWindow.Detail.Height=84")		// Detail
	dw_5.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
else
	dw_5.Modify("DataWindow.Detail.Height=84")		// Detail
	dw_5.Modify("DataWindow.Trailer.1.Height=80")		// 소계 숨김
end if

end event

type cb_4 from commandbutton within tabpage_1
integer x = 2583
integer y = 28
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw5
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type cb_3 from commandbutton within tabpage_1
integer x = 2395
integer y = 28
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw5
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type cb_filteroff from commandbutton within tabpage_1
integer x = 2194
integer y = 28
integer width = 197
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw5
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

arg_dw.groupcalc()

end event

type cb_filteron from commandbutton within tabpage_1
integer x = 1993
integer y = 28
integer width = 197
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw5
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
arg_dw.groupcalc()

end event

event getfocus;//

end event

type sle_value from singlelineedit within tabpage_1
integer x = 1216
integer y = 32
integer width = 763
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within tabpage_1
integer x = 942
integer y = 28
integer width = 261
integer height = 500
integer taborder = 140
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type st_9 from statictext within tabpage_1
integer x = 768
integer y = 48
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

type ddlb_dwtitles from dropdownlistbox within tabpage_1
integer x = 311
integer y = 36
integer width = 306
integer height = 92
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

type ddlb_fld from dropdownlistbox within tabpage_1
integer x = 251
integer y = 28
integer width = 480
integer height = 580
integer taborder = 140
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

type st_8 from statictext within tabpage_1
integer x = 69
integer y = 48
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

type dw_5 from datawindow within tabpage_1
integer x = 27
integer y = 128
integer width = 4119
integer height = 1388
integer taborder = 60
string title = "none"
string dataobject = "d_sysusercnt_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4174
integer height = 1540
long backcolor = 79741120
string text = "프로그램"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_2.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_2.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_2
integer x = 46
integer y = 36
integer width = 4119
integer height = 1480
integer taborder = 50
string title = "none"
string dataobject = "d_sysusercnt_t1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4174
integer height = 1540
long backcolor = 79741120
string text = "사용자"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tabpage_3.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tabpage_3.destroy
destroy(this.dw_7)
end on

type dw_7 from datawindow within tabpage_3
integer x = 46
integer y = 36
integer width = 4119
integer height = 1480
integer taborder = 30
string title = "none"
string dataobject = "d_sysusercnt_t3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_sysusercnt_r
integer x = 1230
integer y = 224
integer width = 3026
integer height = 152
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

