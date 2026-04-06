$PBExportHeader$w_cditemqapattern_m.srw
$PBExportComments$품목규격 패턴관리
forward
global type w_cditemqapattern_m from w_inheritance
end type
type cb_3 from commandbutton within w_cditemqapattern_m
end type
type st_4 from statictext within w_cditemqapattern_m
end type
type st_3 from statictext within w_cditemqapattern_m
end type
type ddlb_fld from dropdownlistbox within w_cditemqapattern_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditemqapattern_m
end type
type st_1 from statictext within w_cditemqapattern_m
end type
type ddlb_op from dropdownlistbox within w_cditemqapattern_m
end type
type sle_value from singlelineedit within w_cditemqapattern_m
end type
type cb_1 from commandbutton within w_cditemqapattern_m
end type
type cb_2 from commandbutton within w_cditemqapattern_m
end type
type cb_4 from commandbutton within w_cditemqapattern_m
end type
type cb_5 from commandbutton within w_cditemqapattern_m
end type
type st_2 from statictext within w_cditemqapattern_m
end type
type pb_1 from picturebutton within w_cditemqapattern_m
end type
end forward

global type w_cditemqapattern_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4594
integer height = 2540
string title = "품목규격 패턴관리(w_cditemqapattern_m)"
cb_3 cb_3
st_4 st_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
st_2 st_2
pb_1 pb_1
end type
global w_cditemqapattern_m w_cditemqapattern_m

type variables
//gs_where istr_where
st_print i_print

boolean  ib_continue = false
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

if gf_permission('물품그룹관리자', gs_userid) = 'Y' then	
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

dw_1.SetTransObject(SQLCA)
pb_retrieve.triggerevent(clicked!)

	
end event

on w_cditemqapattern_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_2=create st_2
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.pb_1
end on

on w_cditemqapattern_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.pb_1)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - 83

dw_1.width  = newwidth  - 83
dw_1.height = newheight - 468

end event

type pb_save from w_inheritance`pb_save within w_cditemqapattern_m
integer x = 4105
integer y = 56
end type

event pb_save::clicked;//
long   ll_row, ll_col
string ls_qa, ls_chk, ls_val, ls_colname

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

debugbreak()
for ll_row = 1 to dw_1.rowcount()
	ls_qa = dw_1.object.qa[ll_row]
	
	if LenA(ls_qa) >= 18 then
	else
		MessageBox("오류", string(ll_row) + " 행 규격 오류 입니다.")
		dw_1.setcolumn( "qa" )
		dw_1.setfocus()
		RETURN
	end if

	for ll_col = 1 to 4
		ls_chk = ""; ls_val = ""; ls_colname = ""
		
		choose case ll_col
			case 1
				ls_colname = "qa1"
				ls_chk = dw_1.object.chk1[ll_row]
				ls_val = dw_1.object.qa1[ll_row]
				if LenA(ls_val) <> 3 then 
					dw_1.setcolumn( ls_colname )
					dw_1.setfocus()
					MessageBox("오류1", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
					RETURN
				end if
			case 2
				ls_colname = "qa2"
				ls_chk = dw_1.object.chk2[ll_row]
				ls_val = dw_1.object.qa2[ll_row]
				if LenA(ls_val) <> 4 then 
					dw_1.setcolumn( ls_colname )
					dw_1.setfocus()
					MessageBox("오류1", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
					RETURN
				end if
			case 3
				ls_colname = "qa3"
				ls_chk = dw_1.object.chk3[ll_row]
				ls_val = dw_1.object.qa3[ll_row]
				if LenA(ls_val) <> 4 then 
					dw_1.setcolumn( ls_colname )
					dw_1.setfocus()
					MessageBox("오류1", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
					RETURN
				end if
			case 4
				ls_colname = "qa4"
				ls_chk = dw_1.object.chk4[ll_row]
				ls_val = dw_1.object.qa4[ll_row]
				if (LenA(ls_val) = 4 AND ls_val = "FREE") OR (LenA(ls_val) = 5) then 
				else
					dw_1.setcolumn( ls_colname )
					dw_1.setfocus()
					MessageBox("오류1", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
					RETURN
				end if
		end choose
		
		if ls_chk = "Y" then		// CHECK 함
			if isnumber(ls_val) then
				choose case ls_val	
					case "000", "0000", "00000", ""		// VALUE 없음
						dw_1.setcolumn( ls_colname )
						dw_1.setfocus()
						if	ib_continue = false then
							if MessageBox("오류2", string(ll_row) + " 행 규격오류 입니다. 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
								RETURN
							else
								if MessageBox("확인", "지금부터 규격오류 작업메시지를 나타나지 않도록 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
									ib_continue = true
								end if
							end if
						end if
					case else
				end choose
			else
				dw_1.setcolumn( ls_colname )
				dw_1.setfocus()
				MessageBox("오류2", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
				RETURN
			end if
		else
			choose case ls_val	
				case "FRE", "FREE"			// VALUE 존재
				case else
					dw_1.setcolumn( ls_colname )
					dw_1.setfocus()
					MessageBox("오류2", string(ll_row) + " 행 규격 " + string(ll_col) + " 오류 입니다.")
					RETURN
			end choose
		end if
	next
next

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

wf_update1(dw_1, "Y")


end event

type dw_1 from w_inheritance`dw_1 within w_cditemqapattern_m
integer x = 37
integer y = 420
integer width = 4475
integer height = 1968
string dataobject = "d_cditemqapattern_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

event dw_1::itemchanged;call super::itemchanged;
string ls_data, ls_qa

debugbreak()
choose case dwo.name
	case "chk1"
		if this.object.chk1[row] = "N" then
			this.object.qa1[row] = "000"
		else
			this.object.qa1[row] = "FRE"
		end if

	case "chk2"
		if this.object.chk2[row] = "N" then
			this.object.qa2[row] = "0000"
		else
			this.object.qa2[row] = "FREE"
		end if

	case "chk3"
		if this.object.chk3[row] = "N" then
			this.object.qa3[row] = "0000"
		else
			this.object.qa3[row] = "FREE"
		end if

	case "chk4"
		if this.object.chk4[row] = "N" then
			this.object.qa4[row] = "00000"
		else
			this.object.qa4[row] = "FREE"
		end if
end choose

this.accepttext()

ls_qa = ""
ls_qa = ls_qa + this.object.qa1[row] + "X"
ls_qa = ls_qa + this.object.qa2[row] + "X"
ls_qa = ls_qa + this.object.qa3[row] + "X"
ls_qa = ls_qa + this.object.qa4[row]
this.object.qa[row] = ls_qa


end event

type dw_2 from w_inheritance`dw_2 within w_cditemqapattern_m
boolean visible = false
integer x = 1851
integer y = 4
integer width = 187
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cditemqapattern_m
integer width = 1138
string text = "품목규격 패턴관리"
end type

type st_tips from w_inheritance`st_tips within w_cditemqapattern_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemqapattern_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemqapattern_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemqapattern_m
integer x = 4297
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemqapattern_m
integer x = 3913
integer y = 56
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 품목규격 패턴 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemqapattern_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cditemqapattern_m
integer x = 3529
integer y = 56
integer taborder = 130
end type

event pb_delete::clicked;string ls_driver, ls_bank_check
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cditemqapattern_m
integer x = 3337
integer y = 56
integer taborder = 150
end type

event pb_insert::clicked;// 추가
gs_where2 lstr_where
long   ll_row, ll_cnt
string ls_location, ls_qa, ls_qa_split[]

SELECT def_loc INTO :ls_location FROM area WHERE area_no = :gs_area;
dw_1.accepttext()

/////////////////////////////////////////////////////////////////
// 다중추가 화면
/////////////////////////////////////////////////////////////////
lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ls_location
lstr_where.str8[1] = ""
OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
lstr_where = Message.PowerObjectParm
/////////////////////////////////////////////////////////////////

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_1.insertrow(0)

	dw_1.object.item_no[ll_cnt]   = trim(lstr_where.str1[ll_row])		// 품목
	dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
	ls_qa                         = trim(lstr_where.str2[ll_row])		// 규격
	dw_1.object.qa[ll_cnt]        = LeftA(ls_qa,13)		               // 규격13
	dw_1.object.uom[ll_cnt]       = trim(lstr_where.str3[ll_row])

	if PosA(ls_qa, "X") > 0 then
		GF_SPLIT( ls_qa, "X", ls_qa_split )
	
		dw_1.object.qa1[ll_cnt]       = ls_qa_split[1]		// 규격1
		if ls_qa_split[1] <> "000"  then dw_1.object.chk1[ll_cnt] = "Y"
		
		dw_1.object.qa2[ll_cnt]       = ls_qa_split[2]		// 규격2
		if ls_qa_split[2] <> "0000"  then dw_1.object.chk2[ll_cnt] = "Y"

		dw_1.object.qa3[ll_cnt]       = ls_qa_split[3]		// 규격3
		if ls_qa_split[3] <> "0000"  then dw_1.object.chk3[ll_cnt] = "Y"

		dw_1.object.qa4[ll_cnt]       = ls_qa_split[4]		// 규격4
		if ls_qa_split[4] <> "00000" then dw_1.object.chk4[ll_cnt] = "Y"
	end if
	
   dw_1.object.use_yn[ll_cnt]    = "Y"
   dw_1.object.sys_date[ll_cnt]  = gdt_todaytime
next

dw_1.scrolltorow(ll_cnt)
dw_1.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemqapattern_m
integer x = 3145
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cditemqapattern_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cditemqapattern_m
integer x = 37
integer width = 4475
integer height = 176
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cditemqapattern_m
integer x = 3122
integer y = 16
integer width = 1390
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cditemqapattern_m
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

type st_4 from statictext within w_cditemqapattern_m
integer x = 1198
integer y = 156
integer width = 407
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "물품그룹관리자"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cditemqapattern_m
integer x = 110
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_cditemqapattern_m
integer x = 297
integer y = 288
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_cditemqapattern_m
integer x = 329
integer y = 300
integer width = 311
integer height = 88
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

type st_1 from statictext within w_cditemqapattern_m
integer x = 768
integer y = 304
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

type ddlb_op from dropdownlistbox within w_cditemqapattern_m
integer x = 937
integer y = 288
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

type sle_value from singlelineedit within w_cditemqapattern_m
integer x = 1257
integer y = 296
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

type cb_1 from commandbutton within w_cditemqapattern_m
integer x = 1829
integer y = 296
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

type cb_2 from commandbutton within w_cditemqapattern_m
integer x = 1993
integer y = 296
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

type cb_4 from commandbutton within w_cditemqapattern_m
integer x = 2158
integer y = 296
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

type cb_5 from commandbutton within w_cditemqapattern_m
integer x = 2322
integer y = 296
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

type st_2 from statictext within w_cditemqapattern_m
integer x = 3273
integer y = 312
integer width = 1230
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "등록된 품목은 패턴체크 대상 입니다."
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_cditemqapattern_m
event mousemove pbm_mousemove
integer x = 3721
integer y = 56
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

