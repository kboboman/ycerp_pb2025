$PBExportHeader$w_coil01.srw
$PBExportComments$코일조회
forward
global type w_coil01 from window
end type
type cb_f2 from commandbutton within w_coil01
end type
type cb_f8 from commandbutton within w_coil01
end type
type cb_f7 from commandbutton within w_coil01
end type
type cb_f6 from commandbutton within w_coil01
end type
type cb_f5 from commandbutton within w_coil01
end type
type cb_f4 from commandbutton within w_coil01
end type
type cb_f3 from commandbutton within w_coil01
end type
type cb_f1 from commandbutton within w_coil01
end type
type st_8 from statictext within w_coil01
end type
type dw_2 from datawindow within w_coil01
end type
type cb_2 from commandbutton within w_coil01
end type
type cb_1 from commandbutton within w_coil01
end type
type dw_1 from datawindow within w_coil01
end type
end forward

global type w_coil01 from window
integer width = 4155
integer height = 2108
boolean titlebar = true
string title = "코일선택(w_coil01)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_keydown pbm_keydown
cb_f2 cb_f2
cb_f8 cb_f8
cb_f7 cb_f7
cb_f6 cb_f6
cb_f5 cb_f5
cb_f4 cb_f4
cb_f3 cb_f3
cb_f1 cb_f1
st_8 st_8
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_coil01 w_coil01

type variables
gs_coil istr_where
string  is_dw = 'dw2', is_loc, is_sheet_type
boolean ib_f7 = true, ib_f8 = true, ib_f3 = true, ib_f4 = true, ib_f5 = true, ib_f6 = true
end variables

forward prototypes
public subroutine wf_f1 ()
public subroutine wf_f2 ()
end prototypes

event ue_keydown;// 정렬: F3:코일번호, F4:두께, F5:폭, F6:단중, F7:갯수, F8:품명
long ll_row

choose case key
	case KeyEscape!	// 취소[ESC]
		istr_where.chk = "N"	
		CloseWithReturn( this, istr_where )
		
	case KeyF1!			// F1:저장소
		wf_f1()
		RETURN

	case KeyF2!			// F2:쉬트
		wf_f2()
		RETURN
end choose

//
if dw_1.rowcount() > 0 then	
	ll_row = dw_1.getrow()
	if isnull(ll_row) OR ll_row < 1 then RETURN
	
	choose case key
		case KeyF3!		// F3:코일번호
			if ib_f3 then
				dw_1.setsort("coil_no A, thin, wid, unit_qty, qcnt, groupitem_item_name")
			else
				dw_1.setsort("coil_no D, thin, wid, unit_qty, qcnt, groupitem_item_name")
			end if
			ib_f3 = not (ib_f3)
			
		case KeyF4!		// F4:두께
			if ib_f4 then
				dw_1.setsort("thin A, wid, unit_qty, qcnt, groupitem_item_name, coil_no")
			else
				dw_1.setsort("thin D, wid, unit_qty, qcnt, groupitem_item_name, coil_no")
			end if
			ib_f4 = not (ib_f4)
			
		case KeyF5!		// F5:폭
			if ib_f5 then
				dw_1.setsort("wid A, unit_qty, qcnt, groupitem_item_name, coil_no, thin")
			else
				dw_1.setsort("wid D, unit_qty, qcnt, groupitem_item_name, coil_no, thin")
			end if
			ib_f5 = not (ib_f5)
			
		case KeyF6!		// F6:단중
			if ib_f6 then
				dw_1.setsort("unit_qty A, qcnt, groupitem_item_name, coil_no, thin, wid")
			else
				dw_1.setsort("unit_qty D, qcnt, groupitem_item_name, coil_no, thin, wid")
			end if
			ib_f6 = not (ib_f6)
			
		case KeyF7!		// F7:갯수
			if ib_f7 then
				dw_1.setsort("qcnt A, groupitem_item_name, coil_no, thin, wid, unit_qty")
			else
				dw_1.setsort("qcnt D, groupitem_item_name, coil_no, thin, wid, unit_qty")
			end if
			ib_f7 = not (ib_f7)
			
		case KeyF8!		// F8:품명
			if ib_f8 then
				dw_1.setsort("groupitem_item_name A, coil_no, thin, wid, unit_qty, qcnt")
			else
				dw_1.setsort("groupitem_item_name D, coil_no, thin, wid, unit_qty, qcnt")
			end if
			ib_f8 = not (ib_f8)
			
		case else
			RETURN
	end choose
	
	dw_1.sort()
	dw_1.scrolltorow(ll_row)
end if

end event

public subroutine wf_f1 ();//
gs_where lst_code
long     ll_row

if is_sheet_type = "S" OR is_sheet_type = "SC" then
	is_sheet_type = "SC"
else
	is_sheet_type = "C"
end if

if is_sheet_type = "C" OR is_sheet_type = "SC" then
	dw_1.dataobject = "d_cdcoil_c"
else
	dw_1.dataobject = "d_cdsheet_c"
end if
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = 130


if gs_workno = "P01" OR gs_workno = "P02" then
	MessageBox("확인","도장반 원재료,반제품 저장소 업무를 정의해야 합니다.")
end if

lst_code.str5 = is_sheet_type
OpenWithParm( w_loc01, lst_code )
lst_code = Message.PowerObjectParm
if lst_code.chk = "N" then RETURN

st_8.text = lst_code.name
is_loc    = lst_code.str1

dw_1.retrieve(is_loc, "%", "%", 0, 0)
if dw_1.rowcount() > 0 then
	dw_1.setfocus()
else
	dw_2.setfocus()
end if

end subroutine

public subroutine wf_f2 ();// 쉬트코일
gs_where lst_code

if is_sheet_type = "S" OR is_sheet_type = "SC" then
	is_sheet_type = "S"
else
	is_sheet_type = "C"
end if

//
if is_sheet_type = "C" or is_sheet_type = "SC" then
	dw_1.dataobject = "d_cdcoil_c"
else
	dw_1.dataobject = "d_cdsheet_c"
end if
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = 130


if gs_workno = "P01" OR gs_workno = "P02" then
	MessageBox("확인","도장반 원재료,반제품 저장소 업무를 정의해야 합니다.")
end if

lst_code.str5 = is_sheet_type
OpenWithParm( w_loc01, lst_code )
lst_code = Message.PowerObjectParm
if lst_code.chk = "N" then RETURN

st_8.text = lst_code.name
is_loc    = lst_code.str1

dw_1.retrieve(is_loc, "%", "%", 0, 0)
if dw_1.rowcount() > 0 then
	dw_1.setfocus()
else
	dw_2.setfocus()
end if

end subroutine

on w_coil01.create
this.cb_f2=create cb_f2
this.cb_f8=create cb_f8
this.cb_f7=create cb_f7
this.cb_f6=create cb_f6
this.cb_f5=create cb_f5
this.cb_f4=create cb_f4
this.cb_f3=create cb_f3
this.cb_f1=create cb_f1
this.st_8=create st_8
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_f2,&
this.cb_f8,&
this.cb_f7,&
this.cb_f6,&
this.cb_f5,&
this.cb_f4,&
this.cb_f3,&
this.cb_f1,&
this.st_8,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_coil01.destroy
destroy(this.cb_f2)
destroy(this.cb_f8)
destroy(this.cb_f7)
destroy(this.cb_f6)
destroy(this.cb_f5)
destroy(this.cb_f4)
destroy(this.cb_f3)
destroy(this.cb_f1)
destroy(this.st_8)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//	coilmst

istr_where = Message.PowerObjectParm
setnull( istr_where.chk )

string ls_name
date   ld_date

is_loc = istr_where.loc_no		// 작업장

//////////////////////////////////////////////////
// 생산라인_작업장에 따른 저장소변경 적용일
//////////////////////////////////////////////////
string ls_linedate		// 생산라인_저장소변경 적용일
SELECT isnull(replace(ITEM_NM,'/','-'),'') INTO :ls_linedate 
  FROM CODEMST 
 WHERE ITEM_CD = 'LINE_REROUTING' AND USE_YN = 'Y';

ld_date = gd_date

//choose case is_loc
//	case "F17"
//		if IsDate(ls_linedate) And gd_date >= Date(ls_linedate) then
//		else
//			is_loc = "F05"
//		end if
//	
//	case "F02"
//		if IsDate(ls_linedate) And gd_date >= Date(ls_linedate) then
//		else
//			is_loc = "F01"
//		end if
//
//	case "F09"
//		if IsDate(ls_linedate) And gd_date >= Date(ls_linedate) then
//			is_loc = "F05"
//		else
//		end if
//end choose
//////////////////////////////////////////////////

// 절곡(SheetCoil, 반제품), 도장(반제품), 유압(코일,SheetCoil), YSP01,YSP02(코일)
choose case is_loc
	case "B01", "P01", "P02", "U01", "Y01", "Y03", "Y04", "Y05"	// 절곡, 도장, 유압, YSP01, YSP02, YSP접착
		//st_1.text = "정렬: F3:코일번호, F4:두께,       F6:단중, F7:갯수, F8:품명"

		cb_f1.text    = "F1:코일"
		cb_f1.enabled = true		// F1:코일
		cb_f5.enabled = true		// F5:폭
		
		choose case is_loc
			case "U01"				// 유압반(유압원재료)
				cb_f2.enabled = true		// F2:쉬트
				cb_f5.enabled = true		// F5:폭
				is_sheet_type = "SC"				
				is_loc = "WW03"		
				
			case "B01"				// 절곡반(절곡원재료)
				cb_f1.enabled = false	// F1:코일
				cb_f2.enabled = true		// F2:쉬트
				cb_f5.enabled = false	// F5:폭
				is_sheet_type = "SC"				
				is_loc = "WW02"		
			
			case "Y03", "Y04"		// YSP01, YSP02호(YSP원재료)
				cb_f2.enabled = false	// F2:쉬트
				cb_f5.enabled = true		// F5:폭
				is_sheet_type = "C"
				is_loc = "WW04"		
				
			case "Y05"				// YSP접착(YSP원재료)
				is_loc = "WW04"		
				
			case "P01", "P02"				// 동장2호기(도장원재료?)
				is_loc = "WW05"
		end choose
		
	case else						// 성형반, 화성작업장
		cb_f1.text    = "F1:저장소"
		cb_f2.enabled = false	// F2:쉬트
		cb_f5.enabled = true		// F5:폭
		is_sheet_type = "C"
end choose

// 저장소명
SELECT loc_name INTO :ls_name FROM location WHERE loc_no = :is_loc; 
st_8.text  = ls_name

//////////////////////////////////////////
// 코일(스리팅), 쉬트
//////////////////////////////////////////
if is_sheet_type = "C" or is_sheet_type = "SC" then
	dw_1.dataobject = "d_cdcoil_c"
else
	dw_1.dataobject = "d_cdsheet_c"
end if
dw_1.SetTransObject(SQLCA)
dw_1.Object.DataWindow.Zoom = 130
dw_2.Object.DataWindow.Zoom = 130

dw_2.insertrow(0)
dw_2.setfocus()

end event

event closequery;//IF NOT ISNULL(istr_where.chk) THEN
//	RETURN 0
//ELSE
//	RETURN 1
//END IF
end event

type cb_f2 from commandbutton within w_coil01
integer x = 539
integer y = 28
integer width = 498
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F2:쉬트"
boolean cancel = true
end type

event clicked;// F2:쉬트
wf_f2()

end event

type cb_f8 from commandbutton within w_coil01
integer x = 3250
integer y = 28
integer width = 343
integer height = 128
integer taborder = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F8:품명"
boolean cancel = true
end type

event clicked;// F8:품명
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f8 then
	dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
else
	dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
end if
ib_f8 = not (ib_f8)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f7 from commandbutton within w_coil01
integer x = 2903
integer y = 28
integer width = 343
integer height = 128
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F7:갯수"
boolean cancel = true
end type

event clicked;// F7:갯수
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f7 then
	dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
else
	dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
end if
ib_f7 = not (ib_f7)

dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f6 from commandbutton within w_coil01
integer x = 2555
integer y = 28
integer width = 343
integer height = 128
integer taborder = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F6:단중"
boolean cancel = true
end type

event clicked;// F6:단중
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f6 then
	dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
else
	dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
end if
ib_f6 = not (ib_f6)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f5 from commandbutton within w_coil01
integer x = 2208
integer y = 28
integer width = 343
integer height = 128
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F5:폭"
boolean cancel = true
end type

event clicked;// F5:폭
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f5 then
	dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
else
	dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
end if
ib_f5 = not (ib_f5)
		
dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f4 from commandbutton within w_coil01
integer x = 1861
integer y = 28
integer width = 343
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F4:두께"
boolean cancel = true
end type

event clicked;// F4:두께
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f4 then
	dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
else
	dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
end if
ib_f4 = not (ib_f4)

dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f3 from commandbutton within w_coil01
integer x = 1339
integer y = 28
integer width = 517
integer height = 128
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F3:코일번호"
boolean cancel = true
end type

event clicked;// F3:코일번호
long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

if ib_f3 then
	dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
else
	dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
end if
ib_f3 = not (ib_f3)

dw_1.sort()
dw_1.scrolltorow(ll_row)

end event

type cb_f1 from commandbutton within w_coil01
integer x = 37
integer y = 28
integer width = 498
integer height = 128
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "F1:저장소"
boolean cancel = true
end type

event clicked;// F1:저장소 검색
wf_f1()

end event

type st_8 from statictext within w_coil01
integer x = 37
integer y = 168
integer width = 635
integer height = 204
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 16711680
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_coil01
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 681
integer y = 160
integer width = 3419
integer height = 212
integer taborder = 10
string title = "COILMST"
string dataobject = "d_serch_s"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event ue_enter;long ll_row, ll_cnt, ll_unit_qty, ll_pos
dec{1} ld_wid
string ls_string, ls_coil, ls_qa

this.accepttext()
choose case This.GetColumnName()
//	case 'coil_no'
//	case 'qa'
//	case 'wid'
//			IF isnull(this.object.wid[1]) then this.object.wid[1] = 0
	case 'unit_qty'
//			IF isnull(this.object.unit_qty[1]) then this.object.unit_qty[1] = 0
		ls_coil = trim(this.object.coil_no[1])
		if isnull(ls_coil) or trim(ls_coil) = '' then
			ls_coil = '%'
		else
			ls_coil = '%' + trim(this.object.coil_no[1]) + '%'
		end if
		
		ls_qa = trim(this.object.qa[1])
		if isnull(ls_qa) or trim(ls_qa) = '' then
			ls_qa = '%'
		else
			ll_pos = PosA(ls_qa, '.')
			if ll_pos > 0 then
				ls_qa = ReplaceA(ls_qa, ll_pos, 1, '')
			end if
			ls_qa = ls_qa + '%'
		end if
		
		ld_wid = this.object.wid[1]
		if isnull(ld_wid) then ld_wid = 0
		
		ll_unit_qty = this.object.unit_qty[1]
		if isnull(ll_unit_qty) then ll_unit_qty = 0
		
		dw_1.retrieve(is_loc, ls_coil, ls_qa, ld_wid, ll_unit_qty)
		if dw_1.rowcount() < 1 then
			this.setcolumn('coil_no')
			return 1
		end if
end choose

this.accepttext()
Send(Handle(this), 256, 9, 0)
return 1
//return 0

end event

event ue_key;//
long ll_row

choose case key
	case KeyEscape!
		istr_where.chk = "N"	
		CloseWithReturn( parent, istr_where )

	case KeyF1!
		wf_f1()
		RETURN

	case KeyF2!
		wf_f2()
		RETURN
end choose

if isnull(this) OR this.rowcount() < 1 then RETURN

ll_row = this.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

if is_sheet_type = 'C' or is_sheet_type = 'SC' then
	choose case key
		case KeyF3!
			if ib_f3 then
				dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
			else
				dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
			end if
			ib_f3 = not (ib_f3)

		case KeyF4!
			if ib_f4 then
				dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
			else
				dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
			end if
			ib_f4 = not (ib_f4)

		case KeyF5!
			if ib_f5 then
				dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
			else
				dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
			end if
			ib_f5 = not (ib_f5)

		case KeyF6!
			if ib_f6 then
				dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
			else
				dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
			end if
			ib_f6 = not (ib_f6)

		case KeyF7!
			if ib_f7 then
				dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
			else
				dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
			end if
			ib_f7 = not (ib_f7)
			
		case KeyF8!
			if ib_f8 then
				dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
			else
				dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
			end if
			ib_f8 = not (ib_f8)
			
		case else
			RETURN
	end choose
	
else
	choose case key
		case KeyF3!
			if ib_f3 then
				dw_1.setsort('sheet_no, thin,unit_qty,qcnt,groupitem_item_name')
			else
				dw_1.setsort('sheet_no D, thin,unit_qty,qcnt,groupitem_item_name')
			end if
			ib_f3 = not (ib_f3)
			
		case KeyF4!
			if ib_f4 then
				dw_1.setsort('thin, unit_qty,qcnt,groupitem_item_name, sheet_no')
			else
				dw_1.setsort('thin D, unit_qty,qcnt,groupitem_item_name, sheet_no ')
			end if
			ib_f4 = not (ib_f4)
			
		case KeyF6!
			if ib_f6 then
				dw_1.setsort('unit_qty,qcnt,groupitem_item_name, sheet_no, thin')
			else
				dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, sheet_no, thin')
			end if
			ib_f6 = not (ib_f6)
			
		case KeyF7!
			if ib_f7 then
				dw_1.setsort('qcnt,groupitem_item_name, sheet_no, thin,unit_qty')
			else
				dw_1.setsort('qcnt D,groupitem_item_name, sheet_no, thin,unit_qty')
			end if
			ib_f7 = not (ib_f7)
			
		case KeyF8!
			if ib_f8 then
				dw_1.setsort('groupitem_item_name,sheet_no, thin,unit_qty,qcnt')
			else
				dw_1.setsort('groupitem_item_name D,sheet_no, thin,unit_qty,qcnt')
			end if
			ib_f8 = not (ib_f8)
			
		case else
			RETURN
	end choose
end if

dw_1.sort()
this.scrolltorow(ll_row)

end event

event getfocus;//
is_dw = 'dw2'
this.Object.DataWindow.Color = rgb(255,0,255)

end event

event itemerror;

//choose case dwo.name
//	case 'coil_no'
//	case 'qa'
//	case 'wid'
//			this.object.wid[row] = 0.0
//	case 'unit_qty'
//			this.object.unit_qty[row] = 0
//end choose
//return 2
end event

event itemchanged;//long ll_row, ll_cnt, ll_unit_qty, ll_pos
//dec{1} ld_wid
//string ls_string, ls_coil, ls_qa
//
//this.accepttext()
//choose case dwo.name
//	case 'coil_no'
//	case 'qa'
//	case 'wid'
//		if isnull(data) then return 1
////			IF isnull(this.object.wid[1]) then this.object.wid[1] = 0
//	case 'unit_qty'
//		if isnull(data) then return 1
////			IF isnull(this.object.unit_qty[1]) then this.object.unit_qty[1] = 0
//end choose
//return 0
////return 0
//
end event

event losefocus;//
this.Object.DataWindow.Color = 67108864	// rgb(240, 240, 240)

end event

type cb_2 from commandbutton within w_coil01
integer x = 3634
integer y = 28
integer width = 462
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소[ESC]"
boolean cancel = true
end type

event clicked;// 취소[ESC]
if is_dw = 'dw2' then
	istr_where.chk = "N"	
	closewithreturn(parent, istr_where)
ELSE
	dw_2.setcolumn('coil_no')
	dw_2.setfocus()
end if
end event

type cb_1 from commandbutton within w_coil01
integer x = 1097
integer y = 28
integer width = 238
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "정렬:"
end type

event clicked;//long ll_row
//
//dw_1.accepttext()
//ll_row = dw_1.getrow()
//
//if ll_row > 0 then
//	istr_where.str1 = dw_1.object.work_no[ll_row]
//	istr_where.name = dw_1.object.work_name[ll_row]
//	istr_where.str2 = dw_1.object.work_manager[ll_row]
//	
//	istr_where.chk = "Y"
//else
//	istr_where.chk = "N"
////	rollback;
//end if
//closewithreturn(parent, istr_where)
//
end event

type dw_1 from datawindow within w_coil01
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
string tag = "d_cdsheet_c"
integer x = 32
integer y = 384
integer width = 4073
integer height = 1612
integer taborder = 20
string title = "d_cdcoil_c"
string dataobject = "d_cdcoil_c"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_enter;// ENTER(ue_enter)
long ll_row

this.accepttext()
ll_row = this.getrow()

if ll_row > 0 then
	if is_sheet_type = 'C' or is_sheet_type = 'SC' then
		istr_where.coil_no = this.object.coil_no[ll_row]
		istr_where.length  = this.object.length[ll_row]
		istr_where.wid     = this.object.wid[ll_row]
		istr_where.etc_no  = this.object.coilmst_etc_no[ll_row]
	else
		istr_where.coil_no = this.object.sheet_no[ll_row]
		istr_where.length  = 0
		istr_where.wid     = 0
		istr_where.etc_no  = '0'
	end if

	istr_where.loc_no    = this.object.loc_no[ll_row]
	istr_where.item_no   = this.object.item_no[ll_row]
	istr_where.item_name = this.object.groupitem_item_name[ll_row]
	istr_where.qa        = this.object.qa[ll_row]
	istr_where.qcnt      = this.object.qcnt[ll_row]
	istr_where.unit_qty  = this.object.unit_qty[ll_row]
	istr_where.uom       = this.object.uom[ll_row]
	
	istr_where.chk = "Y"
else
	istr_where.chk = "N"
end if
closewithreturn(parent, istr_where)

end event

event ue_key;//
long ll_row

if this.rowcount() > 0 then RETURN

choose case key
	case KeyEscape!
			istr_where.chk = "N"	
			closewithreturn( parent, istr_where )

	case KeyF1!
		wf_f1()
		RETURN

	case KeyF2!
		wf_f2()
		RETURN
end choose

if this.rowcount() > 0 then
	ll_row = this.getrow()
end if
if isnull(ll_row) OR ll_row < 1 then RETURN

if is_sheet_type = 'C' or is_sheet_type = 'SC' then
	choose case key
		case KeyF3!
			if ib_f3 then
				dw_1.setsort('coil_no, thin,wid,unit_qty,qcnt,groupitem_item_name')
			else
				dw_1.setsort('coil_no D, thin,wid,unit_qty,qcnt,groupitem_item_name')
			end if
			ib_f3 = not (ib_f3)
			
		case KeyF4!
			if ib_f4 then
				dw_1.setsort('thin, wid,unit_qty,qcnt,groupitem_item_name, coil_no')
			else
				dw_1.setsort('thin D, wid,unit_qty,qcnt,groupitem_item_name, coil_no ')
			end if
			ib_f4 = not (ib_f4)
			
		case KeyF5!
			if ib_f5 then
				dw_1.setsort('wid,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
			else
				dw_1.setsort('wid D,unit_qty,qcnt,groupitem_item_name,coil_no, thin')
			end if
			ib_f5 = not (ib_f5)
			
		case KeyF6!
			if ib_f6 then
				dw_1.setsort('unit_qty,qcnt,groupitem_item_name, coil_no, thin,wid')
			else
				dw_1.setsort('unit_qty D,qcnt,groupitem_item_name, coil_no, thin,wid')
			end if
			ib_f6 = not (ib_f6)
			
		case KeyF7!
			if ib_f7 then
				dw_1.setsort('qcnt,groupitem_item_name, coil_no, thin,wid,unit_qty')
			else
				dw_1.setsort('qcnt D,groupitem_item_name, coil_no, thin,wid,unit_qty')
			end if
			ib_f7 = not (ib_f7)
			
		case KeyF8!
			if ib_f8 then
				dw_1.setsort('groupitem_item_name,coil_no, thin,wid,unit_qty,qcnt')
			else
				dw_1.setsort('groupitem_item_name D,coil_no, thin,wid,unit_qty,qcnt')
			end if
			ib_f8 = not (ib_f8)
			
		case else
			RETURN
	end choose
	
else
	choose case key
		case KeyF3!
			if ib_f3 then
				dw_1.setsort('sheet_no,   thin, unit_qty, qcnt, groupitem_item_name')
			else
				dw_1.setsort('sheet_no D, thin, unit_qty, qcnt, groupitem_item_name')
			end if
			ib_f3 = not (ib_f3)
			
		case KeyF4!
			if ib_f4 then
				dw_1.setsort('thin,   unit_qty, qcnt, groupitem_item_name, sheet_no')
			else
				dw_1.setsort('thin D, unit_qty, qcnt, groupitem_item_name, sheet_no ')
			end if
			ib_f4 = not (ib_f4)
			
		case KeyF6!
			if ib_f6 then
				dw_1.setsort('unit_qty,   qcnt, groupitem_item_name, sheet_no, thin')
			else
				dw_1.setsort('unit_qty D, qcnt, groupitem_item_name, sheet_no, thin')
			end if
			ib_f6 = not (ib_f6)
			
		case KeyF7!
			if ib_f7 then
				dw_1.setsort('qcnt,   groupitem_item_name, sheet_no, thin, unit_qty')
			else
				dw_1.setsort('qcnt D, groupitem_item_name, sheet_no, thin, unit_qty')
			end if
			ib_f7 = not (ib_f7)
			
		case KeyF8!
			if ib_f8 then
				dw_1.setsort('groupitem_item_name,   sheet_no, thin, unit_qty, qcnt')
			else
				dw_1.setsort('groupitem_item_name D, sheet_no, thin, unit_qty, qcnt')
			end if
			ib_f8 = not (ib_f8)
			
		case else
			RETURN
	end choose
end if

dw_1.sort()
this.scrolltorow(ll_row)

end event

event getfocus;//
is_dw = 'dw1'
this.Object.DataWindow.Color = rgb(255,0,255)

end event

event losefocus;//
this.Object.DataWindow.Color = 67108864 // rgb(240, 240, 240)

end event

event doubleclicked;//
this.triggerevent( "ue_enter" )

end event

