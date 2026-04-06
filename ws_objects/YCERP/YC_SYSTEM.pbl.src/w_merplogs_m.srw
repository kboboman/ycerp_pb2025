$PBExportHeader$w_merplogs_m.srw
$PBExportComments$mERP 접속현황
forward 
global type w_merplogs_m from w_inheritance
end type
type cb_3 from commandbutton within w_merplogs_m
end type
type pb_4 from picturebutton within w_merplogs_m
end type
type cbx_5 from checkbox within w_merplogs_m
end type
type st_3 from statictext within w_merplogs_m
end type
type ddlb_fld from dropdownlistbox within w_merplogs_m
end type
type ddlb_dwtitles from dropdownlistbox within w_merplogs_m
end type
type st_4 from statictext within w_merplogs_m
end type
type ddlb_op from dropdownlistbox within w_merplogs_m
end type
type sle_value from singlelineedit within w_merplogs_m
end type
type cb_1 from commandbutton within w_merplogs_m
end type
type cb_2 from commandbutton within w_merplogs_m
end type
type cb_4 from commandbutton within w_merplogs_m
end type
type cb_5 from commandbutton within w_merplogs_m
end type
type dw_3 from datawindow within w_merplogs_m
end type
type cbx_1 from checkbox within w_merplogs_m
end type
type st_1 from statictext within w_merplogs_m
end type
type em_1 from editmask within w_merplogs_m
end type
type em_2 from editmask within w_merplogs_m
end type
type cbx_link from checkbox within w_merplogs_m
end type
type st_vertical from u_splitbar_vertical within w_merplogs_m
end type
type gb_4 from groupbox within w_merplogs_m
end type
end forward

global type w_merplogs_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4192
integer height = 2504
string title = "mERP 접속현황(w_merplogs_m)"
long backcolor = 79416533
cb_3 cb_3
pb_4 pb_4
cbx_5 cbx_5
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_3 dw_3
cbx_1 cbx_1
st_1 st_1
em_1 em_1
em_2 em_2
cbx_link cbx_link
st_vertical st_vertical
gb_4 gb_4
end type
global w_merplogs_m w_merplogs_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print

string   is_sql, is_window
boolean  ib_check = true

long    il_dragsource, il_dragparent, il_droptarget
long    ih_curteam
integer ii_chk = 0
string  is_chk = 'N'
TreeViewitem itv_team

////////////////////////////////////////////////////////////////////////////////////////////////
// The following are used for the resizing service
boolean		ib_debug = False			// Debug mode
long			il_hiddencolor = 0		// Bar hidden color to match the window background
integer		ii_barthickness = 32		// Bar Thickness
integer		ii_windowborder = 428	// Window border to be used on all sides
dragobject	idrg_Vertical[2]			// Reference to the vertical controls on the window
////////////////////////////////////////////////////////////////////////////////////////////////

end variables

on w_merplogs_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.pb_4=create pb_4
this.cbx_5=create cbx_5
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.cbx_link=create cbx_link
this.st_vertical=create st_vertical
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.pb_4
this.Control[iCurrent+3]=this.cbx_5
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.cbx_1
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.em_1
this.Control[iCurrent+18]=this.em_2
this.Control[iCurrent+19]=this.cbx_link
this.Control[iCurrent+20]=this.st_vertical
this.Control[iCurrent+21]=this.gb_4
end on

on w_merplogs_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.pb_4)
destroy(this.cbx_5)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.cbx_link)
destroy(this.st_vertical)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_2.height = newheight - dw_2.y - gb_2.x

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_2.x
dw_1.height = newheight - dw_1.y - gb_2.x

end event

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_PERMISSION("mERP_접속현황(모바일)", gs_userid) = "Y" then
else
	dw_1.object.agent.visible = false
	dw_1.object.raddr.visible = false
	
	cbx_link.enabled  = false
	cbx_5.enabled     = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if


em_1.text = string(RelativeDate(today(), -60),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

dw_3.visible = false
pb_insert.visible = false

dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent(clicked!)

end event

type pb_save from w_inheritance`pb_save within w_merplogs_m
integer x = 3241
integer y = 68
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

//FOR ll_count = 1 TO dw_1.rowcount()
//	IF isnull(dw_1.object.bank_code[ll_count]) OR dw_1.object.bank_code[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행코드을 입력하십시오")
//		return
//	END IF
//	IF isnull(dw_1.object.bank_name[ll_count]) OR dw_1.object.bank_name[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 은행명을 입력하십시오")
//		return
//	END IF
//NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//	    IF dw_1.object.bank_code[li_cnt1] = dw_1.object.bank_code[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 은행코드가 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT		            
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_merplogs_m
integer x = 1221
integer y = 428
integer width = 2898
integer height = 1948
string dataobject = "d_merplogs"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) or row < 1 then RETURN

/////////////////////////////////////////////////////////////////////////////////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////

this.setfocus()

end event

event dw_1::itemchanged;call super::itemchanged;// CHK 카운트 확인
long ll_Selected

if isnull(row) or row < 1 then RETURN

if dwo.name = "chk" then
	if data = "Y" then
		This.SelectRow(row, TRUE)
	else
		This.SelectRow(row, FALSE)
	end if

	ll_Selected = long(dw_1.describe("evaluate('sum( if(isselected(), 1, 0) for all)',1)"))
	if ll_Selected = 0 then
		cbx_5.checked = false
	elseif ll_Selected = this.rowcount() then
		cbx_5.checked = true
	end if
end if




//messagebox("SelectedLine", string(this.SelectedLine()) )
//messagebox("Describe", dw_1.Describe("DataWindow.Selected") )

end event

event dw_1::getfocus;call super::getfocus;//
is_window = "dw_1"


end event

type st_title from w_inheritance`st_title within w_merplogs_m
integer x = 37
integer y = 32
integer width = 1477
integer height = 136
string text = "mERP 접속현황(모바일)"
end type

type st_tips from w_inheritance`st_tips within w_merplogs_m
end type

type pb_compute from w_inheritance`pb_compute within w_merplogs_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_merplogs_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_merplogs_m
integer x = 3433
integer y = 68
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_merplogs_m
integer x = 2843
integer y = 68
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

DataWindow arg_dw

if is_window = "dw_1" then
	arg_dw = dw_1
else	
	arg_dw = dw_3
end if

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = arg_dw
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 은행코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
if is_window = "dw_3" then
	dw_3.print()
else
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if


end event

type pb_cancel from w_inheritance`pb_cancel within w_merplogs_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_merplogs_m
integer x = 2651
integer y = 68
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;// 삭제
long   ll_row

if dw_1.rowcount() < 1 then RETURN	

if dw_1.object.tchk[1] = 0 then
	MessageBox("확인",'선택한 데이터가 존재하지 않습니다.',information!)
	RETURN
end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	RETURN
end if	

dw_1.accepttext()

for ll_row = dw_1.rowcount() to 1 step -1
	if dw_1.object.chk[ll_row] = "Y" then
		dw_1.scrolltorow( ll_row )
		dw_1.deleterow( ll_row )
	end if
next

wf_update1(dw_1,"Y")
cbx_5.checked = false		// 전체


end event

type pb_insert from w_inheritance`pb_insert within w_merplogs_m
boolean visible = false
integer x = 1595
integer y = 44
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_merplogs_m
integer x = 2455
integer y = 68
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_sdate, ls_edate

ls_sdate = em_1.text
ls_edate = em_2.text

cbx_5.checked = false

////////////////////////////////////////////////////
dw_2.setredraw( false )
dw_2.setfilter( "" )
dw_2.filter()
dw_2.SetSort( "cnt D" )
dw_2.sort()

dw_2.reset()
dw_2.retrieve()
dw_2.setredraw( true )

////////////////////////////////////////////////////
dw_1.setredraw( false )
dw_1.setfilter( "" )
dw_1.filter()
dw_1.SetSort( "sysdate D, hhmm D" )
dw_1.sort()

dw_1.reset()
dw_1.retrieve( ls_sdate, ls_edate )		// Reselectrow() 
dw_1.setredraw( true )

end event

type gb_3 from w_inheritance`gb_3 within w_merplogs_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_merplogs_m
integer y = 240
integer width = 4087
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_merplogs_m
integer x = 2423
integer y = 16
integer width = 1234
integer height = 224
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_merplogs_m
integer x = 32
integer y = 428
integer width = 1134
integer height = 1948
integer taborder = 60
string dataobject = "d_merplogs_r"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
string ls_program
long   ll_found
Inet   linet_base

if isnull(row) or row < 1 then RETURN

/////////////////////////////////////////////////////////////////////////////////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
/////////////////////////////////////////////////////////////////////////////////

ls_program = this.object.pgmdesc[row]
if cbx_link.checked = true then
	GetContextService("Internet", linet_base)
	linet_base.HyperlinkToURL("http://m.yoo-chang.co.kr/merp target=_blank")
end if

ll_found = dw_1.Find( "pgmdesc = '" + ls_program + "'", 1, dw_1.RowCount() )
if ll_found > 0 then
	dw_1.scrolltorow( ll_found )
end if
this.setfocus()

end event

event dw_2::getfocus;call super::getfocus;//
is_window = "dw_2"


end event

type cb_3 from commandbutton within w_merplogs_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type pb_4 from picturebutton within w_merplogs_m
event mousemove pbm_mousemove
integer x = 3035
integer y = 68
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

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if is_window = "dw_1" then
	ldw_sel = dw_1
else	
	ldw_sel = dw_3
end if

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

type cbx_5 from checkbox within w_merplogs_m
integer x = 2537
integer y = 316
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;// 전체
long ll_row

for ll_row = 1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.chk[ll_row] = "Y"
		dw_1.SelectRow(ll_row, TRUE)
	else
		dw_1.object.chk[ll_row] = "N"
		dw_1.SelectRow(ll_row, FALSE)
	end if
next

end event

type st_3 from statictext within w_merplogs_m
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_merplogs_m
integer x = 265
integer y = 300
integer width = 389
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

type ddlb_dwtitles from dropdownlistbox within w_merplogs_m
integer x = 329
integer y = 312
integer width = 219
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

type st_4 from statictext within w_merplogs_m
integer x = 667
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

type ddlb_op from dropdownlistbox within w_merplogs_m
integer x = 837
integer y = 300
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_merplogs_m
integer x = 1143
integer y = 304
integer width = 658
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

type cb_1 from commandbutton within w_merplogs_m
integer x = 1815
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_window = "dw_2" then
	arg_dw = dw_2
else	
	arg_dw = dw_1
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_merplogs_m
integer x = 1979
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_2" then
	arg_dw = dw_2
else	
	arg_dw = dw_1
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_merplogs_m
integer x = 2144
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_window = "dw_2" then
	arg_dw = dw_2
else	
	arg_dw = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_merplogs_m
integer x = 2309
integer y = 304
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

if is_window = "dw_2" then
	arg_dw = dw_2
else	
	arg_dw = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_merplogs_m
integer x = 64
integer y = 184
integer width = 96
integer height = 76
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_merplogs_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
this.SelectRow( 0, false )
this.SelectRow( row, true )

this.scrolltorow( row )

end event

event getfocus;//
is_window = "dw_3"


end event

type cbx_1 from checkbox within w_merplogs_m
integer x = 2930
integer y = 316
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일별집계"
end type

event clicked;//
string ls_sdate, ls_edate

ls_sdate = em_1.text
ls_edate = em_2.text

dw_3.x = dw_1.x
dw_3.y = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

if this.checked = true then
	st_vertical.visible = false
	pb_delete.enabled = false
	
	dw_3.visible = true
	dw_3.retrieve( ls_sdate, ls_edate )
else
	pb_delete.enabled = true

	st_vertical.visible = true
	dw_3.visible = false
end if

end event

type st_1 from statictext within w_merplogs_m
integer x = 1641
integer y = 56
integer width = 718
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "접속일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_merplogs_m
integer x = 1641
integer y = 140
integer width = 347
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
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type em_2 from editmask within w_merplogs_m
integer x = 2011
integer y = 140
integer width = 347
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type cbx_link from checkbox within w_merplogs_m
integer x = 3529
integer y = 316
integer width = 430
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "HyperLink"
end type

type st_vertical from u_splitbar_vertical within w_merplogs_m
integer x = 1179
integer y = 428
integer height = 1948
boolean bringtotop = true
end type

type gb_4 from groupbox within w_merplogs_m
integer x = 1605
integer y = 16
integer width = 795
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

