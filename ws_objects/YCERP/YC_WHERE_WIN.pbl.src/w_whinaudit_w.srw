$PBExportHeader$w_whinaudit_w.srw
$PBExportComments$재고이력검색(2004/10/19,이인호)
forward
global type w_whinaudit_w from window
end type
type st_1 from statictext within w_whinaudit_w
end type
type st_date from statictext within w_whinaudit_w
end type
type sle_1 from singlelineedit within w_whinaudit_w
end type
type cb_5 from commandbutton within w_whinaudit_w
end type
type cb_3 from commandbutton within w_whinaudit_w
end type
type cb_2 from commandbutton within w_whinaudit_w
end type
type cb_1 from commandbutton within w_whinaudit_w
end type
type sle_value from singlelineedit within w_whinaudit_w
end type
type ddlb_op from dropdownlistbox within w_whinaudit_w
end type
type st_4 from statictext within w_whinaudit_w
end type
type ddlb_dwtitles from dropdownlistbox within w_whinaudit_w
end type
type ddlb_fld from dropdownlistbox within w_whinaudit_w
end type
type st_3 from statictext within w_whinaudit_w
end type
type pb_2 from picturebutton within w_whinaudit_w
end type
type st_name from statictext within w_whinaudit_w
end type
type dw_3 from datawindow within w_whinaudit_w
end type
type pb_1 from picturebutton within w_whinaudit_w
end type
type pb_print from picturebutton within w_whinaudit_w
end type
type pb_retrieve from picturebutton within w_whinaudit_w
end type
type em_2 from editmask within w_whinaudit_w
end type
type st_2 from statictext within w_whinaudit_w
end type
type em_1 from editmask within w_whinaudit_w
end type
type dw_1 from datawindow within w_whinaudit_w
end type
type gb_1 from groupbox within w_whinaudit_w
end type
type gb_6 from groupbox within w_whinaudit_w
end type
end forward

global type w_whinaudit_w from window
integer x = 23
integer y = 288
integer width = 5289
integer height = 2164
boolean titlebar = true
string title = "재고이력검색(w_whinaudit_w)"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean palettewindow = true
boolean center = true
st_1 st_1
st_date st_date
sle_1 sle_1
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_value sle_value
ddlb_op ddlb_op
st_4 st_4
ddlb_dwtitles ddlb_dwtitles
ddlb_fld ddlb_fld
st_3 st_3
pb_2 pb_2
st_name st_name
dw_3 dw_3
pb_1 pb_1
pb_print pb_print
pb_retrieve pb_retrieve
em_2 em_2
st_2 st_2
em_1 em_1
dw_1 dw_1
gb_1 gb_1
gb_6 gb_6
end type
global w_whinaudit_w w_whinaudit_w

type variables
Integer	 ii_WindowBorder = 15
st_print i_print
gs_where ist_where
end variables

on w_whinaudit_w.create
this.st_1=create st_1
this.st_date=create st_date
this.sle_1=create sle_1
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_4=create st_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_fld=create ddlb_fld
this.st_3=create st_3
this.pb_2=create pb_2
this.st_name=create st_name
this.dw_3=create dw_3
this.pb_1=create pb_1
this.pb_print=create pb_print
this.pb_retrieve=create pb_retrieve
this.em_2=create em_2
this.st_2=create st_2
this.em_1=create em_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_6=create gb_6
this.Control[]={this.st_1,&
this.st_date,&
this.sle_1,&
this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_value,&
this.ddlb_op,&
this.st_4,&
this.ddlb_dwtitles,&
this.ddlb_fld,&
this.st_3,&
this.pb_2,&
this.st_name,&
this.dw_3,&
this.pb_1,&
this.pb_print,&
this.pb_retrieve,&
this.em_2,&
this.st_2,&
this.em_1,&
this.dw_1,&
this.gb_1,&
this.gb_6}
end on

on w_whinaudit_w.destroy
destroy(this.st_1)
destroy(this.st_date)
destroy(this.sle_1)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_4)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_fld)
destroy(this.st_3)
destroy(this.pb_2)
destroy(this.st_name)
destroy(this.dw_3)
destroy(this.pb_1)
destroy(this.pb_print)
destroy(this.pb_retrieve)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_6)
end on

event open;//
string ls_loc
long   ll_row

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.settransobject(sqlca)
dw_1.settransobject(sqlca)
dw_3.settransobject(sqlca)

// 전달자
//lst_where.str1 = trim(dw_1.object.itemloc_item_no[ll_row])
//lst_where.str2 = trim(dw_1.object.itemloc_qa[ll_row])
//lst_where.str3 = trim(dw_2.object.loc_no[1])
//lst_where.str4 = trim(dw_2.object.loc_no[1])  // 시작
//lst_where.str5 = trim(dw_2.object.loc_no[1])	// 종료
//lst_where.name = trim(dw_1.object.groupitem_item_name[ll_row])
//lst_where.chk  = "DO"

ist_where = Message.PowerObjectParm

dw_3.insertrow(0) 
ls_loc = ist_where.str3
dw_3.object.loc_no[1] = ls_loc
st_name.text = '품명 : ' + trim(ist_where.name) + '~n~r규격 : ' + ist_where.str2

//em_1.text = string(today(), 'yyyy/mm/01')
//em_2.text = string(today(), 'yyyy/mm/DD')
em_1.text = ist_where.str4
em_2.text = ist_where.str5

pb_retrieve.postevent( clicked! )

//dw_1.retrieve( date(em_1.text), date(em_2.text), em_1.text, ist_where.str1, ist_where.str2, ls_loc )
//if dw_1.rowcount() < 1 then
//	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
//end if
//
end event

event resize;//
dw_1.width  = newwidth  - (dw_1.x * 2)
dw_1.height = newheight - dw_1.y - 15

gb_6.width  = dw_1.width
end event

type st_1 from statictext within w_whinaudit_w
integer x = 3872
integer y = 256
integer width = 370
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "실사일자:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_date from statictext within w_whinaudit_w
integer x = 4233
integer y = 256
integer width = 457
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "0000/00/00"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_whinaudit_w
integer x = 2459
integer y = 252
integer width = 1403
integer height = 76
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_5 from commandbutton within w_whinaudit_w
integer x = 2272
integer y = 252
integer width = 160
integer height = 76
integer taborder = 190
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

type cb_3 from commandbutton within w_whinaudit_w
integer x = 2107
integer y = 252
integer width = 160
integer height = 76
integer taborder = 180
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

type cb_2 from commandbutton within w_whinaudit_w
integer x = 1943
integer y = 252
integer width = 160
integer height = 76
integer taborder = 170
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

type cb_1 from commandbutton within w_whinaudit_w
integer x = 1778
integer y = 252
integer width = 160
integer height = 76
integer taborder = 160
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

type sle_value from singlelineedit within w_whinaudit_w
integer x = 1207
integer y = 252
integer width = 567
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_whinaudit_w
integer x = 887
integer y = 244
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_4 from statictext within w_whinaudit_w
integer x = 718
integer y = 260
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

type ddlb_dwtitles from dropdownlistbox within w_whinaudit_w
integer x = 279
integer y = 256
integer width = 311
integer height = 88
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

type ddlb_fld from dropdownlistbox within w_whinaudit_w
integer x = 247
integer y = 244
integer width = 443
integer height = 632
integer taborder = 130
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

type st_3 from statictext within w_whinaudit_w
integer x = 59
integer y = 260
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

type pb_2 from picturebutton within w_whinaudit_w
event mousemove pbm_mousemove
integer x = 3877
integer y = 56
integer width = 160
integer height = 128
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀(*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
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

type st_name from statictext within w_whinaudit_w
integer x = 32
integer y = 28
integer width = 1787
integer height = 176
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whinaudit_w
integer x = 2647
integer y = 72
integer width = 859
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type pb_1 from picturebutton within w_whinaudit_w
integer x = 4050
integer y = 56
integer width = 160
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_print from picturebutton within w_whinaudit_w
integer x = 3712
integer y = 56
integer width = 160
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = left!
end type

event clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
parent.WindowState = Minimized!
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 재고이력검색 내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
w_print.setfocus()

//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//
//string  ls_window
//ls_window=parent.classname()
//
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//i_print.st_datawindow = dw_1
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 재고이력검색 내역을 출력합니다." 
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

type pb_retrieve from picturebutton within w_whinaudit_w
integer x = 3543
integer y = 56
integer width = 160
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;string   ls_locno, LS_DATE
datetime ld_countdate

dw_3.accepttext()

ls_locno = dw_3.object.loc_no[1]

SELECT count_date = convert(char(10), count_date, 111)
  INTO :ld_countdate
  FROM LOCATION 
 WHERE use_yn ='Y' AND loc_no = :ls_locno;
 
st_date.text = string(ld_countdate,"yyyy/mm/dd")
LS_DATE = LeftA(em_1.text,4)+MidA(em_1.text,6,2) + RightA(em_1.text,2)

dw_1.retrieve( date(em_1.text), date(em_2.text), LS_DATE, ist_where.str1, ist_where.str2, ls_locno )
if dw_1.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if


end event

type em_2 from editmask within w_whinaudit_w
integer x = 2281
integer y = 76
integer width = 352
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "IBeam!"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_whinaudit_w
integer x = 2213
integer y = 72
integer width = 59
integer height = 80
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whinaudit_w
integer x = 1861
integer y = 76
integer width = 352
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "IBeam!"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_1 from datawindow within w_whinaudit_w
integer x = 32
integer y = 368
integer width = 5147
integer height = 1584
integer taborder = 20
string title = "d_irusersilsa_s2"
string dataobject = "d_irusersilsa_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//w_repsuper w_print
////===============사용자별 프로그램 사용현황=================================
//
//string  ls_window
//ls_window=parent.classname()
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//pb_insert.enabled = true
//i_print.st_datawindow = dw_3
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
//
//gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
//
end event

event clicked;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if isnull( row ) OR row < 1 then RETURN
sle_1.text = dw_1.object.inaudit_item[row] + "|" + dw_1.object.qa[row]
end event

type gb_1 from groupbox within w_whinaudit_w
integer x = 1829
integer y = 8
integer width = 2418
integer height = 196
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_6 from groupbox within w_whinaudit_w
integer x = 32
integer y = 200
integer width = 5147
integer height = 160
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

