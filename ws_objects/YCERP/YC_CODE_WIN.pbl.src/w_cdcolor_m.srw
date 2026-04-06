$PBExportHeader$w_cdcolor_m.srw
$PBExportComments$칼라관리(1998/5/5,성삼지)
forward
global type w_cdcolor_m from w_inheritance
end type
type st_4 from statictext within w_cdcolor_m
end type
type ddlb_fld from dropdownlistbox within w_cdcolor_m
end type
type st_5 from statictext within w_cdcolor_m
end type
type sle_value from singlelineedit within w_cdcolor_m
end type
type cbx_op from checkbox within w_cdcolor_m
end type
type cb_1 from commandbutton within w_cdcolor_m
end type
type cb_2 from commandbutton within w_cdcolor_m
end type
type cb_3 from commandbutton within w_cdcolor_m
end type
type cb_5 from commandbutton within w_cdcolor_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdcolor_m
end type
type pb_1 from picturebutton within w_cdcolor_m
end type
type cb_4 from commandbutton within w_cdcolor_m
end type
type shl_1 from statichyperlink within w_cdcolor_m
end type
type st_1 from statictext within w_cdcolor_m
end type
type st_2 from statictext within w_cdcolor_m
end type
type sle_1 from singlelineedit within w_cdcolor_m
end type
type cbx_first from checkbox within w_cdcolor_m
end type
type cbx_all from checkbox within w_cdcolor_m
end type
type cb_6 from commandbutton within w_cdcolor_m
end type
type cbx_1 from checkbox within w_cdcolor_m
end type
type ddlb_op from dropdownlistbox within w_cdcolor_m
end type
end forward

global type w_cdcolor_m from w_inheritance
integer width = 4443
integer height = 2352
string title = "색상관리(w_cdcolor_m)"
long backcolor = 79220952
boolean center = true
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
pb_1 pb_1
cb_4 cb_4
shl_1 shl_1
st_1 st_1
st_2 st_2
sle_1 sle_1
cbx_first cbx_first
cbx_all cbx_all
cb_6 cb_6
cbx_1 cbx_1
ddlb_op ddlb_op
end type
global w_cdcolor_m w_cdcolor_m

type variables
boolean ib_check
long    il_find = 1

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
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

dw_1.object.color_name.width = 0	// 434

dw_1.retrieve()
dw_2.visible = false

if GF_Permission('색상관리', gs_userid) = 'Y' then
else
	pb_delete.enabled = false
	pb_save.enabled   = false
	pb_insert.enabled = false
end if

end event

on w_cdcolor_m.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.pb_1=create pb_1
this.cb_4=create cb_4
this.shl_1=create shl_1
this.st_1=create st_1
this.st_2=create st_2
this.sle_1=create sle_1
this.cbx_first=create cbx_first
this.cbx_all=create cbx_all
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.sle_value
this.Control[iCurrent+5]=this.cbx_op
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.shl_1
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.sle_1
this.Control[iCurrent+17]=this.cbx_first
this.Control[iCurrent+18]=this.cbx_all
this.Control[iCurrent+19]=this.cb_6
this.Control[iCurrent+20]=this.cbx_1
this.Control[iCurrent+21]=this.ddlb_op
end on

on w_cdcolor_m.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.pb_1)
destroy(this.cb_4)
destroy(this.shl_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.cbx_first)
destroy(this.cbx_all)
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 73
dw_1.height = newheight - 482

end event

type pb_save from w_inheritance`pb_save within w_cdcolor_m
integer x = 2917
integer y = 64
end type

event pb_save::clicked;//
int    li_cnt1, li_cnt2, ll_count
string ls_color, ls_colornm

dw_1.accepttext()

for ll_count = 1 to dw_1.rowcount()
	ls_color   = dw_1.object.color_code[ll_count]
	ls_colornm = dw_1.object.color_name[ll_count]
	
	if isnull(ls_color) OR ls_color = "" then // OR len(ls_color) < 4 then
		MessageBox("입력오류", string(ll_count) + " 번째 색상코드를 입력하십시오")
		RETURN
	end if
	
	if isnull(ls_colornm) OR ls_colornm = "" then
		MessageBox("입력오류", string(ll_count) + " 번째 색상명을 입력하십시오")
		RETURN
	end if
next

// 중복체크
for li_cnt1 = 1 to dw_1.rowcount()
	for li_cnt2 = li_cnt1 + 1 to dw_1.rowcount()
	    if dw_1.object.color_code[li_cnt1] = dw_1.object.color_code[li_cnt2] then
		    MessageBox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 색상코드가 중복되었습니다.")
			 RETURN
		end if
   next
next		            

if MessageBox("확인",'저장하시겠습니까?',information!, OKCancel!, 2) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdcolor_m
integer x = 32
integer y = 428
integer width = 4334
integer height = 1792
string dataobject = "d_cdcolor_m"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdcolor_m
integer x = 32
integer y = 20
integer width = 791
integer height = 140
string text = "색상관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcolor_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcolor_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcolor_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcolor_m
integer x = 3118
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcolor_m
integer x = 2715
integer y = 64
integer taborder = 110
string text = " "
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print


if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

dw_2.retrieve()
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 색상코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcolor_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdcolor_m
integer x = 2290
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;// 삭제
string ls_color_code, ls_color_check, ls_color
int    li_count

if dw_1.rowcount() < 1 then RETURN	

if MessageBox("확인","삭제하시겠습니까?",information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

ls_color_code = dw_1.object.color_code[dw_1.getrow()]

setnull(ls_color)
SELECT color INTO :ls_color FROM saledet WHERE color = :ls_color_code;
if isnull(ls_color) OR ls_color = "" then
else
	MessageBox("에러", "주문된 물품중에 이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	RETURN
end if

setnull(ls_color)
SELECT color INTO :ls_color FROM sale  WHERE color = :ls_color_code;
if isnull(ls_color) OR ls_color = "" then
else
	MessageBox("에러", "이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	RETURN
end if

ls_color = dw_1.object.color_code[dw_1.getrow()]
ls_color = LeftA(ls_color, 1)

if ls_color <> 'Z' then
	MessageBox("확인","기본색상은 삭제할 수 없습니다.",information!)
	RETURN
end if

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdcolor_m
integer x = 2089
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.color_code[ll_count]) OR dw_1.object.color_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상코드를 입력하십시오")
		dw_1.setcolumn("color_code")
		return
	END IF
	IF isnull(dw_1.object.color_name[ll_count]) OR dw_1.object.color_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상명을 입력하십시오")
		dw_1.setcolumn("color_name")
		return
	END IF
NEXT
ll_row = dw_1.insertrow(dw_1.getrow())
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('color_code')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcolor_m
integer x = 1888
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//
dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdcolor_m
integer x = 887
integer y = 16
integer width = 955
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcolor_m
integer y = 256
integer width = 4334
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcolor_m
integer x = 1856
integer y = 16
integer width = 1481
integer height = 216
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdcolor_m
integer x = 69
integer y = 120
integer width = 110
integer height = 84
integer taborder = 60
string dataobject = "d_cdcolor_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_4 from statictext within w_cdcolor_m
integer x = 73
integer y = 324
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cdcolor_m
integer x = 251
integer y = 304
integer width = 443
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

type st_5 from statictext within w_cdcolor_m
integer x = 722
integer y = 320
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

type sle_value from singlelineedit within w_cdcolor_m
integer x = 1184
integer y = 312
integer width = 535
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

type cbx_op from checkbox within w_cdcolor_m
integer x = 1733
integer y = 324
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_1 from commandbutton within w_cdcolor_m
integer x = 1934
integer y = 312
integer width = 146
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

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
string     ls_column, ls_value, ls_col, ls_type, ls_op
integer    li_ret

arg_dw  = dw_1

ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_2 from commandbutton within w_cdcolor_m
integer x = 2085
integer y = 312
integer width = 146
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

arg_dw  = dw_1

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdcolor_m
integer x = 2235
integer y = 312
integer width = 146
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdcolor_m
integer x = 2386
integer y = 312
integer width = 146
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_cdcolor_m
integer x = 283
integer y = 316
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

type pb_1 from picturebutton within w_cdcolor_m
event mousemove pbm_mousemove
string tag = "파일"
integer x = 2491
integer y = 64
integer width = 187
integer height = 144
integer taborder = 70
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	//   "파워빌더리포트 (*.PSR),*.PSR," + &
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)				
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인", "작업완료")
	end if
end if

end event

type cb_4 from commandbutton within w_cdcolor_m
integer x = 3899
integer y = 300
integer width = 453
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RGB 초기화"
end type

event clicked;//
long	ll_row, ll_null

setnull( ll_null )

ll_row = dw_1.getrow()
dw_1.object.r[ll_row] = ll_null
dw_1.object.g[ll_row] = ll_null
dw_1.object.b[ll_row] = ll_null

end event

type shl_1 from statichyperlink within w_cdcolor_m
integer x = 2546
integer y = 300
integer width = 681
integer height = 96
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "LAB -> RGB 변환"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
string url = "http://colormine.org/convert/lab-to-rgb"
end type

type st_1 from statictext within w_cdcolor_m
integer x = 3378
integer y = 56
integer width = 1431
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "색상코드 첫자리 ~'Z~' 아니면 기본 색상임"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdcolor_m
integer x = 933
integer y = 56
integer width = 425
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "검색어"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cdcolor_m
integer x = 933
integer y = 136
integer width = 425
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
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;// 한글 키보드 
long mode

mode = ImmGetContext( handle(parent) )
ImmSetConversionStatus( mode, 2, 0 )		// 2번째 인수값 1=KOR, 2=ENG

this.SelectText(1, LenA(this.Text))

end event

event modified;//
long ll_row

il_find = 1
dw_1.SelectRow(0, false)

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = "N"
next
end event

type cbx_first from checkbox within w_cdcolor_m
integer x = 1376
integer y = 64
integer width = 329
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
string text = "1행부터"
end type

type cbx_all from checkbox within w_cdcolor_m
integer x = 1376
integer y = 144
integer width = 224
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
string text = "일괄"
end type

type cb_6 from commandbutton within w_cdcolor_m
integer x = 1600
integer y = 132
integer width = 197
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;// 검색
string  ls_text, ls_findvalue
boolean lb_find
long    ll_row, ll_found, ll_find, ll_end

DEBUGBREAK()

// 필터해지
cb_2.triggerevent( clicked! )

ls_text = "%" + sle_1.text + "%"
if isnull(ls_text) OR trim(ls_text) = ""  OR ls_text = "%%" then RETURN

if cbx_first.checked = true then
	il_find = 1
	cbx_first.checked = false
end if
ll_end  = dw_1.RowCount() + 1

ls_findvalue = "(color_name  LIKE '" + ls_text + "') OR " + &
					"(color_lname LIKE '" + ls_text + "') OR " + &
					"(cat1        LIKE '" + ls_text + "') OR " + &
					"(product_no  LIKE '" + ls_text + "') OR " + &
					"(maker       LIKE '" + ls_text + "') OR " + &
					"(color_type  LIKE '" + ls_text + "') OR " + &
					"(sample_no   LIKE '" + ls_text + "') OR " + &
					"(color_bigo  LIKE '" + ls_text + "') "

if cbx_all.checked = false then
	// 개별선택 방식
	il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	if il_find > 0 then
		lb_find = true
		dw_1.object.chk[il_find] = "Y"

		dw_1.scrolltorow( il_find )
		//dw_1.SelectRow(0, false)
		//dw_1.SelectRow(il_find, TRUE)

		il_find++	// Search Again
	end if
else
	// 일괄선택 방식
	dw_1.SelectRow(0, false)
	
	cbx_first.checked = false
	il_find = 1
	il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	
	dw_1.setredraw( false )
	Do While il_find > 0
		lb_find = true
		dw_1.scrolltorow( il_find )
	
		////dw_1.SelectRow(0, false)
		//dw_1.SelectRow(il_find, TRUE)
		dw_1.object.chk[il_find] = "Y"
	
		ll_found = ll_found + 1
		
		il_find++	// Search Again
		il_find = dw_1.find( ls_findvalue, il_find, ll_end )
	Loop
	dw_1.setredraw( true )
	
	if ll_found > 0 then
		if MessageBox("확인","검색 대상을 필터링 하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			dw_1.setfilter( " chk = 'Y' ")
			dw_1.filter()
		end if
	end if
end if

if lb_find = false then
	MessageBox("확인","해당하는 내용을 찾지 못했습니다.")
end if


end event

type cbx_1 from checkbox within w_cdcolor_m
integer x = 3250
integer y = 316
integer width = 635
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "색상명(10) 보기"
end type

event clicked;// 색상명(10) 보기
if this.checked = true then
	dw_1.object.color_name.width = 434
else
	dw_1.object.color_name.width = 0
end if

end event

type ddlb_op from dropdownlistbox within w_cdcolor_m
integer x = 896
integer y = 304
integer width = 274
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

