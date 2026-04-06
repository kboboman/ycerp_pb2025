$PBExportHeader$w_orsaledue_r.srw
$PBExportComments$납기일별 수주현황(1998/05/13, 정재수)
forward 
global type w_orsaledue_r from w_inheritance
end type
type st_1 from statictext within w_orsaledue_r
end type
type em_1 from editmask within w_orsaledue_r
end type
type em_2 from editmask within w_orsaledue_r
end type
type st_3 from statictext within w_orsaledue_r
end type
type st_2 from statictext within w_orsaledue_r
end type
type ddlb_1 from dropdownlistbox within w_orsaledue_r
end type
type dw_3 from datawindow within w_orsaledue_r
end type
type dw_6 from datawindow within w_orsaledue_r
end type
type st_4 from statictext within w_orsaledue_r
end type
type st_5 from statictext within w_orsaledue_r
end type
type pb_1 from picturebutton within w_orsaledue_r
end type
type st_8 from statictext within w_orsaledue_r
end type
type ddlb_fld from dropdownlistbox within w_orsaledue_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaledue_r
end type
type st_9 from statictext within w_orsaledue_r
end type
type ddlb_op from dropdownlistbox within w_orsaledue_r
end type
type sle_value from singlelineedit within w_orsaledue_r
end type
type cb_filteron from commandbutton within w_orsaledue_r
end type
type cb_filteroff from commandbutton within w_orsaledue_r
end type
type cb_1 from commandbutton within w_orsaledue_r
end type
type cb_2 from commandbutton within w_orsaledue_r
end type
end forward

global type w_orsaledue_r from w_inheritance
integer y = 112
integer width = 4599
integer height = 1856
string title = "납기일별 수주현황(w_orsaledue_r)"
st_1 st_1
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
dw_6 dw_6
st_4 st_4
st_5 st_5
pb_1 pb_1
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
end type
global w_orsaledue_r w_orsaledue_r

type variables
string is_sale_flag, is_ret
datawindowchild idwc_login, idwc_area


end variables

on w_orsaledue_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.dw_6=create dw_6
this.st_4=create st_4
this.st_5=create st_5
this.pb_1=create pb_1
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_filteron
this.Control[iCurrent+19]=this.cb_filteroff
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
end on

on w_orsaledue_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
destroy(this.dw_6)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk
st_security lst_security

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

string ls_level_userid
Choose Case gs_level
	Case "A", "B"
		is_ret = '%'
	Case 'C'
		is_ret = gs_userid
End Choose

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
dw_1.sharedata(dw_2)
dw_2.visible = false

dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_3.getchild('user',idwc_login)
idwc_login.insertrow(1)
If is_ret = '%' Then
	idwc_login.setitem(1,'user_id','%')
	idwc_login.setitem(1,'user_name','전체')
	idwc_login.accepttext()
	dw_3.object.user[1] = "%"	
Else
	idwc_login.setitem(1,'user_id',is_ret)
	idwc_login.setitem(1,'user_name',gs_username)
	idwc_login.accepttext()
	dw_3.object.user[1] = is_ret	
End If	

is_sale_flag = 'A'
ddlb_1.text = '전체'

dw_6.settransobject(sqlca)
dw_6.setredraw(false)
dw_6.insertrow(0)  

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_6.object.area[1] = gs_area
dw_6.accepttext()
dw_6.setredraw(true)


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_orsaledue_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_orsaledue_r
integer x = 32
integer y = 440
integer width = 4494
integer height = 1284
integer taborder = 0
string dataobject = "d_orsaleduerep_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_orsaledue_r
integer x = 37
integer y = 24
integer width = 1202
integer height = 136
string text = "납기일별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsaledue_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaledue_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaledue_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_orsaledue_r
integer x = 4297
integer y = 80
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaledue_r
integer x = 3904
integer y = 80
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsaleduerep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 수주일보를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaledue_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_orsaledue_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_orsaledue_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaledue_r
integer x = 3712
integer y = 80
integer taborder = 40
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_sale_flag[], ls_saleman
 
if em_1.text = '' then
	messagebox("확인","납기기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","납기기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","납기기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end = date(em_2.text)

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
end if

//ls_saleman = dw_3.object.user[1]
ls_saleman = is_ret
dw_1.retrieve(dw_6.object.area[1], ls_sale_flag, ld_start, ld_end, ls_saleman)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title, ls_area, ls_user
	string ls_username, ls_areaname, ls_sale_flag1
	
		ls_area = dw_6.object.area[1]
		ls_user = dw_3.object.user[1]
		If ls_area = '%' Then
			ls_areaname = '전체'
		Else
			select area_name Into :ls_areaname from area where area_no = :ls_area;
		End If
		If ls_user = '%' Then
			ls_username = '전체'
		Else
			select user_name into :ls_username from login where user_id = :ls_user;
		End If
		
		Choose Case is_sale_flag
			Case 'A'
				ls_sale_flag1 = '전체'
			Case 'D'
				ls_sale_flag1 = '내수'
			Case 'L'
				ls_sale_flag1 = 'L/C'
			Case 'E'
				ls_sale_flag1 = '수출'
		End Choose
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '사업장:' + ls_areaname + ' 납기기간:' + string(em_1.text) + '-' + string(em_2.text) + ' 수주유형:' + ls_sale_flag1 + ' 영업사원:' + ls_username
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================



	
end event

type gb_3 from w_inheritance`gb_3 within w_orsaledue_r
integer x = 1829
integer y = 16
integer width = 1815
integer height = 236
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsaledue_r
integer y = 256
integer width = 4498
integer height = 168
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_orsaledue_r
integer x = 3671
integer y = 16
integer width = 855
integer height = 236
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaledue_r
integer x = 1015
integer y = 24
integer width = 123
integer height = 80
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsaleduerep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_1 from statictext within w_orsaledue_r
integer x = 2647
integer y = 72
integer width = 137
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "납기"
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsaledue_r
integer x = 2816
integer y = 60
integer width = 357
integer height = 80
integer taborder = 10
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
string displaydata = "~t/"
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_orsaledue_r
integer x = 3241
integer y = 60
integer width = 357
integer height = 80
integer taborder = 20
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
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

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

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_3 from statictext within w_orsaledue_r
integer x = 3182
integer y = 56
integer width = 55
integer height = 72
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsaledue_r
integer x = 1911
integer y = 160
integer width = 288
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_orsaledue_r
integer x = 2299
integer y = 148
integer width = 357
integer height = 384
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","내수","L/C","수출"}
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_3 from datawindow within w_orsaledue_r
integer x = 2967
integer y = 152
integer width = 663
integer height = 76
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type dw_6 from datawindow within w_orsaledue_r
integer x = 2098
integer y = 60
integer width = 526
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_4 from statictext within w_orsaledue_r
integer x = 1879
integer y = 72
integer width = 210
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "사업장"
boolean focusrectangle = false
end type

type st_5 from statictext within w_orsaledue_r
integer x = 2679
integer y = 160
integer width = 270
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "영업사원"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_orsaledue_r
event mousemove pbm_mousemove
string tag = "파일"
integer x = 4096
integer y = 80
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
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS","엑셀 (*.XLS), *.XLS," + &
		"텍스트 (*.TXT),*.TXT," + &
		"HTML문서 (*.HTM), *.HTM," + &
		"CSV(쉽표로 분리), *.CSV")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dw_1.SaveAsascii(ls_DocName)
				
		elseif ls_ExpandName = "txt" OR ls_ExpandName = "TXT" then
				dw_1.SaveAsascii(ls_DocName)
				  
		elseif ls_ExpandName = "htm" OR ls_ExpandName = "HTM" then
					dw_1.SaveAs(ls_DocName, HTMLTable!, TRUE)

		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
					dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if

end event

type st_8 from statictext within w_orsaledue_r
integer x = 160
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_orsaledue_r
integer x = 343
integer y = 312
integer width = 480
integer height = 580
integer taborder = 80
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

type ddlb_dwtitles from dropdownlistbox within w_orsaledue_r
integer x = 402
integer y = 320
integer width = 306
integer height = 92
integer taborder = 90
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

type st_9 from statictext within w_orsaledue_r
integer x = 859
integer y = 332
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

type ddlb_op from dropdownlistbox within w_orsaledue_r
integer x = 1033
integer y = 312
integer width = 261
integer height = 500
integer taborder = 90
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

type sle_value from singlelineedit within w_orsaledue_r
integer x = 1307
integer y = 316
integer width = 581
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_orsaledue_r
integer x = 1902
integer y = 312
integer width = 197
integer height = 84
integer taborder = 100
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_orsaledue_r
integer x = 2103
integer y = 312
integer width = 197
integer height = 84
integer taborder = 110
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_orsaledue_r
integer x = 2304
integer y = 312
integer width = 183
integer height = 84
integer taborder = 120
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_orsaledue_r
integer x = 2491
integer y = 312
integer width = 183
integer height = 84
integer taborder = 130
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

