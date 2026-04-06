$PBExportHeader$w_oiissuereq_r.srw
$PBExportComments$출고의뢰서조회(2003/10/15, 이인호)
forward
global type w_oiissuereq_r from w_inheritance
end type
type gb_4 from groupbox within w_oiissuereq_r
end type
type em_1 from editmask within w_oiissuereq_r
end type
type pb_1 from picturebutton within w_oiissuereq_r
end type
type cbx_all from checkbox within w_oiissuereq_r
end type
type dw_3 from dw_1 within w_oiissuereq_r
end type
type pb_2 from picturebutton within w_oiissuereq_r
end type
type st_time from statictext within w_oiissuereq_r
end type
type st_2 from statictext within w_oiissuereq_r
end type
type dw_6 from datawindow within w_oiissuereq_r
end type
type st_filed from statictext within w_oiissuereq_r
end type
type ddlb_3 from dropdownlistbox within w_oiissuereq_r
end type
type st_operation from statictext within w_oiissuereq_r
end type
type ddlb_4 from dropdownlistbox within w_oiissuereq_r
end type
type sle_1 from singlelineedit within w_oiissuereq_r
end type
type cb_1 from commandbutton within w_oiissuereq_r
end type
type cb_2 from commandbutton within w_oiissuereq_r
end type
type cb_3 from commandbutton within w_oiissuereq_r
end type
type cb_4 from commandbutton within w_oiissuereq_r
end type
type gb_5 from groupbox within w_oiissuereq_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiissuereq_r
end type
end forward

global type w_oiissuereq_r from w_inheritance
integer width = 4210
integer height = 2904
string title = "출고의뢰서조회(w_oiissuereq_r)"
gb_4 gb_4
em_1 em_1
pb_1 pb_1
cbx_all cbx_all
dw_3 dw_3
pb_2 pb_2
st_time st_time
st_2 st_2
dw_6 dw_6
st_filed st_filed
ddlb_3 ddlb_3
st_operation st_operation
ddlb_4 ddlb_4
sle_1 sle_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
gb_5 gb_5
ddlb_dwtitles ddlb_dwtitles
end type
global w_oiissuereq_r w_oiissuereq_r

type variables
st_print i_print
Integer  il_row
Date     id_start, id_end
String   is_ret,   is_old_cust
DataWindowChild idwc_area

end variables

on w_oiissuereq_r.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.em_1=create em_1
this.pb_1=create pb_1
this.cbx_all=create cbx_all
this.dw_3=create dw_3
this.pb_2=create pb_2
this.st_time=create st_time
this.st_2=create st_2
this.dw_6=create dw_6
this.st_filed=create st_filed
this.ddlb_3=create ddlb_3
this.st_operation=create st_operation
this.ddlb_4=create ddlb_4
this.sle_1=create sle_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.gb_5=create gb_5
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.cbx_all
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.st_time
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.dw_6
this.Control[iCurrent+10]=this.st_filed
this.Control[iCurrent+11]=this.ddlb_3
this.Control[iCurrent+12]=this.st_operation
this.Control[iCurrent+13]=this.ddlb_4
this.Control[iCurrent+14]=this.sle_1
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.gb_5
this.Control[iCurrent+20]=this.ddlb_dwtitles
end on

on w_oiissuereq_r.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.cbx_all)
destroy(this.dw_3)
destroy(this.pb_2)
destroy(this.st_time)
destroy(this.st_2)
destroy(this.dw_6)
destroy(this.st_filed)
destroy(this.ddlb_3)
destroy(this.st_operation)
destroy(this.ddlb_4)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.gb_5)
destroy(this.ddlb_dwtitles)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.y = 260

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_6.settransobject(sqlca)

dw_6.insertrow(0)  
dw_6.object.area[1] = "S0001"		// 시화사업장(기본값)

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no',   ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
idwc_area.accepttext()

dw_3.visible = false
em_1.text = string(today(), 'YYYY/MM/DD')

cbx_all.checked = false
cbx_all.postevent( clicked! )
GF_DWTitle2ddlb( dw_3, ddlb_3, ddlb_dwtitles )

end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 660

dw_2.width  = this.width - 120

dw_3.width  = this.width - 120
dw_3.height = this.height - 660

if cbx_all.checked = true then
	gb_2.y      = gb_3.y
	gb_2.width  = dw_3.width + 50
	gb_2.height = dw_3.height + 70 + gb_3.height

	gb_3.width  = dw_3.width + 50
else
	gb_2.y      = dw_1.y - 52
	gb_2.width  = dw_1.width + 50
	gb_2.height = dw_1.height + 70 

	gb_3.width  = dw_3.width + 50
end if
end event

event activate;call super::activate;dw_3.x     = dw_1.x
dw_3.y     = dw_1.y
dw_3.width = dw_1.width


end event

type pb_save from w_inheritance`pb_save within w_oiissuereq_r
boolean visible = false
integer x = 3200
integer taborder = 30
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_oiissuereq_r
integer x = 46
integer y = 532
integer width = 4078
integer height = 2200
integer taborder = 50
string dataobject = "d_oiissuereq_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return
this.scrolltorow(row)
end event

event dw_1::doubleclicked;call super::doubleclicked;//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

if row < 1 then return

ws_process st_process
string ls_sale

st_process.sale_no     = this.object.issuereqdet_sale_no[row]
OpenWithParm(w_whsaledodet_w, st_process)

end event

type dw_2 from w_inheritance`dw_2 within w_oiissuereq_r
integer x = 41
integer y = 268
integer width = 4087
integer height = 160
integer taborder = 60
string title = "출고의뢰 상세내역"
string dataobject = "d_whissuereq_s"
boolean hscrollbar = true
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;if row < 1 or row > il_row then return
this.scrolltorow(row)

date   ld_date
string ls_user, ls_time
int    li_seq

ld_date = date(em_1.text)
ls_user = dw_2.object.issuereq_salesman[row]
li_seq  = dw_2.object.issuereq_req_seq[row]
ls_time = trim(st_time.text)

dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve(ld_date, ls_user, li_seq, ls_time)
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)
this.setfocus()
end event

type st_title from w_inheritance`st_title within w_oiissuereq_r
integer x = 41
integer y = 40
integer width = 965
string text = "출고의뢰서 조회"
end type

type st_tips from w_inheritance`st_tips within w_oiissuereq_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiissuereq_r
boolean visible = false
integer x = 2290
integer y = 0
integer width = 165
integer height = 132
integer taborder = 140
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = ""
alignment htextalign = center!
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiissuereq_r
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiissuereq_r
integer x = 3936
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oiissuereq_r
integer x = 3355
integer taborder = 160
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print l_print

if cbx_all.checked = true then
	if dw_3.rowcount() < 1 then
		return
	end if
	
	l_print.st_datawindow = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc = " 이 프로그램은 출고의뢰현황을 출력합니다." 
	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
							 'Datawindow.Zoom=61'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
else	
	if dw_1.rowcount() < 1 then
		return
	end if
	
	//l_print.name = 'd_orsalesalemanrep_r1'
	l_print.st_datawindow = dw_1
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc = " 이 프로그램은 출고의뢰현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
							 'Datawindow.Zoom=86'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiissuereq_r
boolean visible = false
integer x = 2821
integer y = 48
integer taborder = 170
boolean bringtotop = true
end type

type pb_delete from w_inheritance`pb_delete within w_oiissuereq_r
boolean visible = false
integer x = 2807
integer taborder = 180
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oiissuereq_r
boolean visible = false
integer x = 2610
integer taborder = 200
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuereq_r
integer x = 3163
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

DateTime ld_time
string   ls_area

SELECT top 1 getdate() INTO :ld_time FROM login;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm:ss")

dw_1.reset()

ls_area = trim(dw_6.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

il_row = dw_2.retrieve(ls_area, date(em_1.text), '%')
dw_3.retrieve(date(em_1.text), 'WS00000000')
end event

type gb_3 from w_inheritance`gb_3 within w_oiissuereq_r
integer x = 23
integer y = 216
integer width = 4123
integer height = 232
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 67108864
string text = "클릭하면 출고의뢰내역이 조회됩니다."
end type

type gb_2 from w_inheritance`gb_2 within w_oiissuereq_r
integer x = 23
integer y = 472
integer width = 4128
integer height = 2292
integer taborder = 130
integer textsize = -9
integer weight = 400
long textcolor = 0
long backcolor = 79220952
string text = "상세내역을 더블클릭하면 보조윈도우가 조회됩니다."
end type

type gb_1 from w_inheritance`gb_1 within w_oiissuereq_r
integer x = 3136
integer y = 8
integer width = 1010
integer height = 208
integer taborder = 40
long backcolor = 79220952
end type

type gb_4 from groupbox within w_oiissuereq_r
integer x = 1723
integer y = 20
integer width = 430
integer height = 188
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "출고의뢰 일자"
end type

type em_1 from editmask within w_oiissuereq_r
integer x = 1760
integer y = 96
integer width = 357
integer height = 80
integer taborder = 160
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
string displaydata = ""
end type

event modified;pb_retrieve.postevent(clicked!)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.postevent(clicked!)
end event

type pb_1 from picturebutton within w_oiissuereq_r
event mousemove pbm_mousemove
integer x = 3552
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
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

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type cbx_all from checkbox within w_oiissuereq_r
integer x = 2171
integer y = 56
integer width = 352
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
string text = "전체보기"
end type

event clicked;//
if this.checked = true then
   gb_2.text    = ""	
   gb_3.text    = ""	
	dw_1.visible = false
	dw_2.visible = false
	dw_3.visible = true

	st_filed.visible      = true
	ddlb_3.visible        = true
	ddlb_dwtitles.visible = false
	st_operation.visible  = true
	ddlb_4.visible   = true
	sle_1.visible    = true
	cb_1.visible     = true
	cb_2.visible     = true
	cb_3.visible     = true
	cb_4.visible     = true	
else
	gb_2.text    = "상세내역을 더블클릭하면 보조윈도우가 조회됩니다."
	gb_3.text    = "클릭하면 출고의뢰내역이 조회됩니다."
	dw_1.visible = true
	dw_2.visible = true
	dw_3.visible = false

	st_filed.visible      = false
	ddlb_3.visible        = false
	ddlb_dwtitles.visible = false
	st_operation.visible  = false
	ddlb_4.visible   = false
	sle_1.visible    = false
	cb_1.visible     = false
	cb_2.visible     = false
	cb_3.visible     = false
	cb_4.visible     = false	
end if
end event

type dw_3 from dw_1 within w_oiissuereq_r
integer x = 434
integer y = 948
integer width = 3150
integer height = 1460
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_oiissuereq_s_list"
boolean hsplitscroll = true
borderstyle borderstyle = StyleBox!
end type

type pb_2 from picturebutton within w_oiissuereq_r
event mousemove pbm_mousemove
integer x = 3744
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
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

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if cbx_all.checked = true then
	ldw_sel = dw_3
else
	ldw_sel = dw_1
end if

if ldw_sel.rowcount() > 0 then
	Integer iRet

//			MessageBox("엑셀권한", "\\192.168.1.6\pb80\EXCEL\출고의뢰서.xls 접근오류 입니다.")
	iRet = MessageBox("엑셀", "파일서버에 접근권한이 있어야 합니다.(\\192.168.1.6)~n~n~n출고의뢰서 집계 작업으로 보기.", Exclamation!, OKCancel!, 1)
	IF iRet = 2 THEN
		ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
		li_Pos = PosA(ls_Named, ".")
		ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
		if ls_Value = 1 then
				if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
						ldw_sel.SaveAsascii(ls_DocName)
				elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
							ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
				end if
		end if
	ELSE
		if dw_3.RowCount() < 1 then return
		if RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "CUST_NO", RegString!, is_old_cust) = 1 then
			RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "SDATE", RegString!, string(id_start, "yyyy-mm-dd"))
			RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "EDATE", RegString!, string(id_end, "yyyy-mm-dd"))
		else
			MessageBox('','엑셀파일 기초세팅 실패!~N~N관리자에게 문의 바랍니다.')
		end if

		OLEObject OleExcel

		OleExcel = CREATE OLEObject 
		iRet = OleExcel.ConnectToNewObject("excel.application") 
		if iRet <> 0 then DESTROY OleExcel 

		// Visible = True의 경우 엑셀 프로그램이 띄워지며 
		// False인 경우 아이콘화된다. 
		OleExcel.Application.Visible = true

		// 엑셀을 로드한 후 Empty Sheet를 연다. 
		OleExcel.WorkBooks.Open('\\192.168.1.6\pb80\EXCEL\출고의뢰서.xls') 
		
		Destroy OleExcel
	END IF
end if	


end event

type st_time from statictext within w_oiissuereq_r
integer x = 2363
integer y = 136
integer width = 763
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oiissuereq_r
integer x = 2171
integer y = 136
integer width = 183
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "조회:"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oiissuereq_r
integer x = 1166
integer y = 96
integer width = 521
integer height = 80
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

end event

type st_filed from statictext within w_oiissuereq_r
integer x = 73
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

type ddlb_3 from dropdownlistbox within w_oiissuereq_r
integer x = 261
integer y = 300
integer width = 480
integer height = 632
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

type st_operation from statictext within w_oiissuereq_r
integer x = 782
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

type ddlb_4 from dropdownlistbox within w_oiissuereq_r
integer x = 951
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_1 from singlelineedit within w_oiissuereq_r
integer x = 1253
integer y = 308
integer width = 567
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

type cb_1 from commandbutton within w_oiissuereq_r
integer x = 1824
integer y = 308
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

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_3, ddlb_4, sle_1, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiissuereq_r
integer x = 1989
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

ddlb_4.text = ""
ddlb_3.text = ""
sle_1.text  = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiissuereq_r
integer x = 2153
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_3, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_oiissuereq_r
integer x = 2318
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_3, "D", ddlb_dwtitles )

end event

type gb_5 from groupbox within w_oiissuereq_r
integer x = 1138
integer y = 20
integer width = 571
integer height = 188
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "사업장"
end type

type ddlb_dwtitles from dropdownlistbox within w_oiissuereq_r
integer x = 283
integer y = 316
integer width = 480
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

