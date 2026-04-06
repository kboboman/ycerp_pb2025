$PBExportHeader$w_cdcustomer_base_m.srw
$PBExportComments$거래처 이력카드
forward
global type w_cdcustomer_base_m from w_inheritance
end type
type dw_3 from datawindow within w_cdcustomer_base_m
end type
type dw_4 from datawindow within w_cdcustomer_base_m
end type
type pb_excel from picturebutton within w_cdcustomer_base_m
end type
type st_1 from statictext within w_cdcustomer_base_m
end type
type rb_1 from radiobutton within w_cdcustomer_base_m
end type
type rb_2 from radiobutton within w_cdcustomer_base_m
end type
type rb_3 from radiobutton within w_cdcustomer_base_m
end type
type rb_4 from radiobutton within w_cdcustomer_base_m
end type
type cbx_1 from checkbox within w_cdcustomer_base_m
end type
type st_2 from statictext within w_cdcustomer_base_m
end type
type cbx_2 from checkbox within w_cdcustomer_base_m
end type
type cbx_3 from checkbox within w_cdcustomer_base_m
end type
type dw_5 from datawindow within w_cdcustomer_base_m
end type
type cbx_4 from checkbox within w_cdcustomer_base_m
end type
end forward

global type w_cdcustomer_base_m from w_inheritance
integer width = 4229
integer height = 2860
string title = "거래처 이력카드(w_cdcustomer_base_m)"
dw_3 dw_3
dw_4 dw_4
pb_excel pb_excel
st_1 st_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
cbx_1 cbx_1
st_2 st_2
cbx_2 cbx_2
cbx_3 cbx_3
dw_5 dw_5
cbx_4 cbx_4
end type
global w_cdcustomer_base_m w_cdcustomer_base_m

type variables
st_print i_print
string   is_dw4sql
integer  ii_max

DataWindowChild idwc_cust, idwc_cust_name, idwc_itemcd, idwc_sort
DataWindowChild idwc_team, idwc_teammgr, idwc_team_name

end variables

forward prototypes
public function string wf_nextcode (string as_str)
end prototypes

public function string wf_nextcode (string as_str);string ls_str
CHOOSE CASE as_str
	CASE 'A'
		ls_str = 'B'
	CASE 'B'
		ls_str = 'C'
	CASE 'C'
		ls_str = 'D'
	CASE 'D'
		ls_str = 'E'
	CASE 'E'
		ls_str = 'F'
	CASE 'F'
		ls_str = 'G'
	CASE 'G'
		ls_str = 'H'
	CASE 'H'
		ls_str = 'I'
	CASE 'I'
		ls_str = 'J'
	CASE 'J'
		ls_str = 'K'
	CASE 'K'
		ls_str = 'L'
	CASE 'L'
		ls_str = 'M'
	CASE 'M'
		ls_str = 'N'
	CASE 'N'
		ls_str = 'O'
	CASE 'O'
		ls_str = 'P'
	CASE 'P'
		ls_str = 'Q'
	CASE 'Q'
		ls_str = 'R'
	CASE 'R'
		ls_str = 'S'
	CASE 'S'
		ls_str = 'T'
	CASE 'T'
		ls_str = 'U'
	CASE 'U'
		ls_str = 'V'
	CASE 'V'
		ls_str = 'W'
	CASE 'W'
		ls_str = 'X'
	CASE 'X'
		ls_str = 'Y'
	CASE 'Y'
		ls_str = 'Z'
END CHOOSE

return ls_str
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

cbx_1.visible     = false		// 수정모드
cbx_2.visible     = false		// 전체 거래처
cbx_4.visible     = false		// 행 간격조정

dw_4.visible      = false
pb_insert.enabled = false
pb_print.enabled  = false
pb_excel.enabled  = false
pb_retrieve.visible = false

dw_5.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
is_dw4sql = dw_4.describe("datawindow.table.select")

dw_3.insertrow(0)		// 거래처 상세

dw_1.insertrow(0)		// 거래처 선택
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

if GF_PERMISSION("거래처_이력카드(출력)", gs_userid) = "Y" then
	pb_print.enabled  = true
end if
	
if GF_PERMISSION("거래처_이력카드(전체)", gs_userid) = "Y" then
	if GF_PERMISSION("거래처_이력카드(수정)", gs_userid) = "Y" then cbx_1.visible = true // 수정모드
	cbx_3.visible     = false  // 팀 거래처
	cbx_2.visible     = true	// 전체 거래처
	cbx_2.checked     = true
	cbx_2.triggerevent( clicked! )
else
	cbx_3.visible     = true   // 팀 거래처
	cbx_2.checked     = false	// 전체 거래처
	cbx_2.triggerevent( clicked! )	
end if

dw_5.reset()
dw_5.retrieve( "거래처_이력카드", "%" )

dw_2.getchild("item_cd", idwc_itemcd)
idwc_itemcd.settransobject(sqlca)

dw_2.getchild("sort", idwc_sort)
idwc_sort.settransobject(sqlca)
idwc_sort.retrieve( "%" )

dw_1.setfocus()	// 거래처 선택

end event

on w_cdcustomer_base_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.pb_excel=create pb_excel
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cbx_1=create cbx_1
this.st_2=create st_2
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.dw_5=create dw_5
this.cbx_4=create cbx_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.pb_excel
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.rb_4
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.cbx_3
this.Control[iCurrent+13]=this.dw_5
this.Control[iCurrent+14]=this.cbx_4
end on

on w_cdcustomer_base_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.pb_excel)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.dw_5)
destroy(this.cbx_4)
end on

event resize;call super::resize;//
//dw_5.width  = newwidth  - 1060
dw_5.height = newheight - 916

dw_2.width  = newwidth  - 1192
dw_2.height = newheight - 916

dw_4.x      = dw_5.x
dw_4.y      = dw_5.y
dw_4.width  = dw_5.width + dw_2.width
dw_4.height = dw_2.height


end event

type pb_save from w_inheritance`pb_save within w_cdcustomer_base_m
integer x = 3730
integer y = 48
integer taborder = 70
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;// 저장
long    ll_row
string  ls_custno, ls_itemcd, ls_bigo
integer li_max, li_sort
Boolean SW_Exit

ls_custno = dw_1.object.cust_no[1]
if ls_custno = "" then RETURN

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

for ll_row = 1 to dw_2.rowcount()
	ls_bigo = dw_2.object.bigo[ll_row]
	if isnull(ls_bigo) or ls_bigo = "" then
		dw_2.scrolltorow( ll_row )
		dw_2.setcolumn("bigo")
		dw_2.setfocus()
		MessageBox("확인",string(ll_row) + " 행 내용을 반드시 입력하시기 바랍니다.")
		RETURN
	end if
next

if rb_1.checked = true then
	ls_itemcd = "%"
elseif rb_2.checked = true then
	ls_itemcd = "100"
elseif rb_3.checked = true then
	ls_itemcd = "200"
else
	ls_itemcd = "300"
end if

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if wf_update1(dw_2, "Y") then
	cbx_1.checked = false	// 수정모드
	cbx_1.triggerevent( clicked! )
	
	dw_2.reset()
	dw_2.retrieve( ls_custno, ls_itemcd )
	dw_2.setfocus()
end if


end event

type dw_1 from w_inheritance`dw_1 within w_cdcustomer_base_m
integer x = 46
integer y = 272
integer width = 3163
integer height = 88
integer taborder = 10
string dataobject = "d_custddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;// 거래처 선택
string ls_itemcd, ls_custno, ls_custname, ls_salesman, ls_teamcode, ls_teammgr

This.AcceptText()

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
dw_3.reset()
dw_3.insertrow(0)
SELECT top 1 cust_no, cust_name INTO :ls_custno, :ls_custname 
  FROM customer 
 WHERE ( cust_no = :data OR cust_name = :data );

choose case dwo.name
	case "cust_no"
		this.object.cust_name[1] = ls_custname		// 거래처명
	case "cust_name"
		this.object.cust_no[1]   = ls_custno		// 거래처코드
end choose	

if isnull(ls_custno) or ls_custno = "" or isnull(ls_custname) or ls_custname = "" then
	Messagebox("확인", "거래처를 선택하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

SELECT c.salesman,   t.team_code,  t.team_manager
  INTO :ls_salesman, :ls_teamcode, :ls_teammgr
  FROM customer c
       LEFT OUTER JOIN login l  ON c.salesman  = l.user_id 
       LEFT OUTER JOIN team  t  ON l.team_code = t.team_code
 WHERE c.cust_no = :ls_custno;

if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman = gs_userid then		// 담당자
	else
		if GF_PERMISSION("거래처_이력카드(전체)", gs_userid) = "Y" then
		else
			if cbx_3.checked = true and ls_teammgr = gs_userid then
				// 팀원간 자료 공유및 등록함
			else
				Messagebox("확인", "해당하는 거래처 담당자(팀)가 아닙니다.")
				dw_1.setfocus()
				RETURN
			end if
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

if rb_1.checked = true then
	ls_itemcd = "%"
elseif rb_2.checked = true then
	ls_itemcd = "100"
elseif rb_3.checked = true then
	ls_itemcd = "200"
else
	ls_itemcd = "300"
end if

dw_2.reset()
dw_2.retrieve( ls_custno, ls_itemcd )

dw_5.setfocus()	// 목록

end event

type dw_2 from w_inheritance`dw_2 within w_cdcustomer_base_m
integer x = 1102
integer y = 872
integer width = 3035
integer height = 1840
integer taborder = 40
string dataobject = "d_cdcustomer_base_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;call super::itemchanged;// 항목선택
string  ls_custno, ls_itemcd
integer li_sort, li_max
long    ll_row

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then return 1

this.AcceptText()
this.getchild("item_cd", idwc_itemcd)	// 대분류
idwc_itemcd.SetTransObject(SQLCA)

this.getchild("sort", idwc_sort)			// 항목
idwc_sort.SetTransObject(SQLCA)
idwc_sort.retrieve( "%" )		

choose case dwo.name
	case "sort"
		ls_itemcd = this.object.item_cd[row]
		li_sort   = this.object.sort[row]
		SELECT top 1 seq INTO :li_max FROM customer_base 
		 WHERE cust_no = :ls_custno AND item_cd = :ls_itemcd AND sort = :li_sort
		 ORDER BY seq DESC;
		
		if isnull(li_max) or li_max = 0 then
			li_max = 1
		else
			li_max = li_max + 1
		end if		
		dw_2.object.seq[row]     = li_max
		
	case "idate"
		if Not IsDate(this.object.idate[row]) then
         MessageBox("오류","날짜만 입력하세요")
			return 1	
      end if
end choose

end event

event dw_2::rbuttondown;call super::rbuttondown;//
string ls_date

if dwo.name = "idate" then
	OpenWithParm(w_calendar, message.stringparm)
	if Message.StringParm <> 'N' then
		ls_date = string(date(Message.StringParm))
		this.object.idate[row] = date(ls_date)
	end if
end if

end event

event dw_2::losefocus;call super::losefocus;//// 자동저장
//long  ll_row
//dwitemstatus l_status
//
//ll_row = dw_2.getrow()
//if ll_row < 1 then return
//
//l_status = dw_2.getitemstatus(ll_row, 0, primary!)
//if l_status = newmodified! then
//
end event

type st_title from w_inheritance`st_title within w_cdcustomer_base_m
integer x = 32
integer y = 56
integer width = 1449
integer height = 128
string text = "거래처 이력카드"
end type

type st_tips from w_inheritance`st_tips within w_cdcustomer_base_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustomer_base_m
boolean visible = false
integer y = 48
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcustomer_base_m
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_cdcustomer_base_m
integer x = 3922
integer y = 48
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdcustomer_base_m
integer x = 3346
integer y = 48
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

string ls_custno
long   ll_row

if GF_PERMISSION("거래처_이력카드(출력)", gs_userid) = "Y" then
else
	MessageBox("확인", "거래처_이력카드(출력) 권한이 없습니다.")
	return
end if

dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then 
	dw_1.setfocus()
	MessageBox("확인", "조회할 거래처를 선택 하십시요.")
	return
end if
	
if dw_2.rowcount() < 1 then
	MessageBox("확인", "해당하는 거래처의 이력내용 데이터가 없습니다.")
	return
end if

dw_4.retrieve( ls_custno )
dw_4.Modify("dw_2.width = 3296")		// 기본사항
dw_4.Modify("dw_1.width = 3296")		// 거래조건
dw_4.Modify("dw_3.width = 3296")		// 거래처동향

//if cbx_1.visible = true and cbx_1.checked = true then
//	dw_4.Modify("dw_4.width   = 1550")
//	dw_4.Modify("dw_4.visible = 1")
//else
//	dw_4.Modify("dw_4.visible = 0")
//end if

dw_4.visible = true
dw_4.title   = " 이 프로그램은 거래처_이력카드를 출력합니다."

l_print.st_datawindow    = dw_4
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 거래처_이력카드를 출력합니다." 

OpenWithParm(w_printsetup, l_print) 

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustomer_base_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustomer_base_m
integer x = 3154
integer y = 48
integer taborder = 160
end type

event pb_delete::clicked;// 삭제
dwitemstatus l_status
string ls_order_no, ls_scene_no
long   ll_row

if dw_2.rowcount() < 1 then return	

ll_row = dw_2.getrow()
if	dw_2.object.sw_modify[ll_row] = "X" then
	MessageBox("확인","한번 등록한 내용은 삭제 할 수 없습니다.")
	RETURN
end if

if MessageBox("확인","삭제하시겠습니까?",information!, OKCancel!, 2) = 2 then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "D", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
if l_status = newmodified! then
	dw_2.deleterow( dw_2.getrow() )
else
	dw_2.deleterow( dw_2.getrow() )
	wf_update1(dw_2, "Y")
end if



end event

type pb_insert from w_inheritance`pb_insert within w_cdcustomer_base_m
integer x = 2962
integer y = 48
integer taborder = 180
end type

event pb_insert::clicked;call super::clicked;//// 항목 추가
//string  ls_custno, ls_itemcd
//integer li_sort, li_max
//long    ll_row, iY
//
//iy = dw_5.getrow()
//ls_custno = dw_1.object.cust_no[1]
//if isnull(ls_custno) or ls_custno = "" then RETURN
//
//ls_itemcd = dw_5.object.item_cd[iY]
//li_sort   = dw_5.object.sort[iY]
//
//// 행추가 후 저장하지않고 중복된 항목 추가한 경우
//ll_row = dw_2.Find( "sort = " + string(li_sort) + " AND seq = " + string(ii_max) + " ", 1, dw_2.RowCount() )
//if ll_row > 0 then
//	MessageBox("확인", "행추가 후 저장하지 않고 중복된 항목 추가한 경우 입니다.")
//	RETURN
//end if
//
//ll_row = dw_2.Find( "sort >= " + string(li_sort) + " ", 1, dw_2.RowCount() )
//if ll_row < 1 or ll_row > dw_2.rowcount() then
//	MessageBox("확인",string(ll_row) )
//	ll_row = 0
//end if
//
//dw_2.insertrow( ll_row )
//dw_2.scrolltorow(ll_row)
//
//SELECT top 1 seq INTO :li_max FROM customer_base 
// WHERE cust_no = :ls_custno AND item_cd = :ls_itemcd AND sort = :li_sort
// ORDER BY seq DESC;
//
//if isnull(li_max) or li_max = 0 then
//	li_max = 1
//else
//	li_max = li_max + 1
//end if
//ii_max = li_max			// 행추가시 순번 중복방지 체크용
//
//ll_row = dw_2.getrow()	// 행추가 후 변동값
//dw_2.scrolltorow( ll_row )
//
//dw_2.object.cust_no[ll_row]    = ls_custno	// 거래처
//dw_2.object.item_cd[ll_row]    = ls_itemcd	// 대분류
//dw_2.object.sort[ll_row]       = li_sort		// 항목
//dw_2.object.seq[ll_row]        = li_max		// 순번
//dw_2.object.iuser[ll_row]      = gs_userid	// 입력자
//dw_2.object.input_date[ll_row] = gf_today()	// 입력일
//
//dw_2.accepttext()
//dw_2.setcolumn( "idate" )
//dw_2.setfocus()
//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustomer_base_m
integer taborder = 170
end type

event pb_retrieve::clicked;call super::clicked;//===========================================================================//
// 판매거래처 마스터(w_cdcustomer_r) 등 기타 프로그램에서 실행한 경우
//===========================================================================//
string ls_itemcd, ls_custno, ls_custname, ls_salesman

ls_custno   = dw_1.object.cust_no[1]
ls_custname = dw_1.object.cust_name[1]

if isnull(ls_custno) or ls_custno = "" then
	Messagebox("확인", "거래처를 선택하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;
if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman <> gs_userid then
		if cbx_2.checked = true then		// 거래처_이력카드(전체) 권한
		else
			Messagebox("확인", "해당하는 거래처 담당자(팀)가 아닙니다.")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

if rb_1.checked = true then
	ls_itemcd = "%"
elseif rb_2.checked = true then
	ls_itemcd = "100"
elseif rb_3.checked = true then
	ls_itemcd = "200"
else
	ls_itemcd = "300"
end if

//dw_5.reset()
//dw_5.retrieve( "거래처_이력카드", ls_itemcd )

dw_2.reset()
dw_2.retrieve( ls_custno, ls_itemcd )

dw_5.setfocus()	// 목록

end event

type gb_3 from w_inheritance`gb_3 within w_cdcustomer_base_m
integer x = 2039
integer y = 8
integer width = 873
integer height = 204
integer taborder = 50
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustomer_base_m
integer y = 236
integer width = 4105
integer height = 556
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustomer_base_m
integer x = 2930
integer y = 8
integer width = 1207
integer taborder = 80
long backcolor = 79416533
end type

type dw_3 from datawindow within w_cdcustomer_base_m
integer x = 46
integer y = 356
integer width = 3163
integer height = 420
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_cdscene_t"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_cdcustomer_base_m
integer x = 850
integer y = 1124
integer width = 2240
integer height = 848
integer taborder = 60
boolean bringtotop = true
boolean titlebar = true
string title = "거래처 이력카드"
string dataobject = "d_cdcustomer_base_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
string icon = "Information!"
boolean hsplitscroll = true
boolean livescroll = true
end type

type pb_excel from picturebutton within w_cdcustomer_base_m
integer x = 3538
integer y = 48
integer width = 187
integer height = 144
integer taborder = 100
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

ll_cnt = dw_2.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_2.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_2.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_1 from statictext within w_cdcustomer_base_m
integer x = 37
integer y = 208
integer width = 599
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래처 이력카드(전체)"
long bordercolor = 67108864
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_cdcustomer_base_m
integer x = 2080
integer y = 60
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
string ls_custno, ls_salesman

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	Messagebox("확인", "거래처를 먼저 선택 하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;
if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman <> gs_userid then
		if cbx_2.checked = true then		// 거래처_이력카드(전체) 권한
		else
			Messagebox("확인", "해당하는 거래처 담당자가 아닙니다.")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

dw_5.reset()
dw_5.retrieve( "거래처_이력카드", "%" )

dw_2.getchild("item_cd", idwc_itemcd)
idwc_itemcd.settransobject(sqlca)

dw_2.getchild("sort", idwc_sort)
idwc_sort.settransobject(sqlca)
idwc_sort.retrieve( "%" )

dw_2.reset()
dw_2.retrieve( ls_custno, "%" )
dw_2.setfocus()

end event

type rb_2 from radiobutton within w_cdcustomer_base_m
integer x = 2450
integer y = 56
integer width = 448
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "기본사항"
end type

event clicked;// 기본사항
string ls_custno, ls_salesman

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	Messagebox("확인", "거래처를 먼저 선택 하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;
if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman <> gs_userid then
		if cbx_2.checked = true then		// 거래처_이력카드(전체) 권한
		else
			Messagebox("확인", "해당하는 거래처 담당자가 아닙니다.")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

dw_5.reset()
dw_5.retrieve( "거래처_이력카드", "100" )

dw_2.getchild("item_cd", idwc_itemcd)
idwc_itemcd.settransobject(sqlca)

dw_2.getchild("sort", idwc_sort)
idwc_sort.settransobject(sqlca)
idwc_sort.retrieve( "%" )

dw_2.reset()
dw_2.retrieve( ls_custno, "100" )
dw_2.setfocus()

end event

type rb_3 from radiobutton within w_cdcustomer_base_m
integer x = 2085
integer y = 128
integer width = 357
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "거래조건"
end type

event clicked;// 거래조건
string ls_custno, ls_salesman

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	Messagebox("확인", "거래처를 먼저 선택 하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;
if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman <> gs_userid then
		if cbx_2.checked = true then		// 거래처_이력카드(전체) 권한
		else
			Messagebox("확인", "해당하는 거래처 담당자가 아닙니다.")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

dw_5.reset()
dw_5.retrieve( "거래처_이력카드", "200" )

dw_2.getchild("item_cd", idwc_itemcd)
idwc_itemcd.settransobject(sqlca)

dw_2.getchild("sort", idwc_sort)
idwc_sort.settransobject(sqlca)
idwc_sort.retrieve( "%" )

dw_2.reset()
dw_2.retrieve( ls_custno, "200" )
dw_2.setfocus()

end event

type rb_4 from radiobutton within w_cdcustomer_base_m
integer x = 2450
integer y = 128
integer width = 448
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "거래처동향"
end type

event clicked;// 거래처동향
string ls_custno, ls_salesman

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	Messagebox("확인", "거래처를 먼저 선택 하시기 바랍니다.")
	dw_1.setfocus()
	RETURN
end if

//===========================================================================//
// 거래처담당자 확인
//===========================================================================//
SELECT salesman INTO :ls_salesman FROM customer WHERE cust_no = :ls_custno;
if isnull(ls_salesman) or ls_salesman = "" then
	dw_1.setfocus()
	RETURN
else
	if ls_salesman <> gs_userid then
		if cbx_2.checked = true then		// 거래처_이력카드(전체) 권한
		else
			Messagebox("확인", "해당하는 거래처 담당자가 아닙니다.")
			dw_1.setfocus()
			RETURN
		end if
	end if
end if
dw_3.reset()
dw_3.retrieve( ls_custno )
//===========================================================================//

dw_5.reset()
dw_5.retrieve( "거래처_이력카드", "300" )	// 3번항목 자유등록

dw_2.getchild("item_cd", idwc_itemcd)
idwc_itemcd.settransobject(sqlca)

dw_2.getchild("sort", idwc_sort)
idwc_sort.settransobject(sqlca)
idwc_sort.retrieve( "%" )

dw_2.reset()
dw_2.retrieve( ls_custno, "300" )
dw_2.setfocus()

end event

type cbx_1 from checkbox within w_cdcustomer_base_m
integer x = 3749
integer y = 800
integer width = 389
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "수정모드"
end type

event clicked;// 수정모드
long ll_row

if this.checked = true then
	dw_2.object.seq.protect = false
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.sw_modify[ll_row] = "Y"
	next
else
	dw_2.object.seq.protect = true
end if

end event

type st_2 from statictext within w_cdcustomer_base_m
integer x = 46
integer y = 800
integer width = 3598
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "1. 거래처 선택,  2. 관리항목 더블클릭시 항목추가,  3. 수정할 수 없음,  4. 내용은 필수 입력사항(엔터 키는 줄 바꿈)"
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_cdcustomer_base_m
integer x = 3639
integer y = 364
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "전체 거래처"
end type

event clicked;// 전체 거래처
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

idwc_cust.setsort( " cust_name A, user_name A " )
idwc_cust.sort()

idwc_cust_name.setsort( " cust_name A, user_name A " )
idwc_cust_name.sort()

if this.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()

	idwc_cust_name.setfilter( "" )
	idwc_cust_name.filter()
else
	idwc_cust.setfilter( " user_name LIKE '" + gs_username + "%' " )
	idwc_cust.filter()

	idwc_cust_name.setfilter( " user_name LIKE '" + gs_username + "%' " )
	idwc_cust_name.filter()
end if

end event

type cbx_3 from checkbox within w_cdcustomer_base_m
integer x = 3639
integer y = 284
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "팀 거래처"
end type

event clicked;// 팀 거래처
string ls_teammgr

SELECT team.team_manager INTO :ls_teammgr FROM login
		 LEFT OUTER JOIN team    ON login.team_code   = team.team_code
 WHERE login.user_id  = :gs_userid;   
if isnull(ls_teammgr) or ls_teammgr = "" then
else
	// 팀 거래처
	dw_1.getchild("cust_no", idwc_cust)
	idwc_cust.settransobject(sqlca)
	
	dw_1.getchild("cust_name", idwc_cust_name)
	idwc_cust_name.settransobject(sqlca)
	
	if this.checked = true then
		idwc_cust.setsort( " user_name A, cust_name A" )
		idwc_cust.sort()	
		idwc_cust.setfilter( " team_manager LIKE '" + ls_teammgr + "%'" )
		idwc_cust.filter()
	
		idwc_cust_name.setsort( " user_name A, cust_name A" )
		idwc_cust_name.sort()	
		idwc_cust_name.setfilter( " team_manager LIKE '" + ls_teammgr + "%'" )
		idwc_cust_name.filter()
	else		
		if GF_PERMISSION("거래처_이력카드(전체)", gs_userid) = "Y" then
			cbx_2.checked     = true	// 전체 거래처
			cbx_2.triggerevent( clicked! )
		else
			cbx_2.checked     = false
			cbx_2.triggerevent( clicked! )	
		end if
	end if
end if
end event

type dw_5 from datawindow within w_cdcustomer_base_m
integer x = 32
integer y = 872
integer width = 1056
integer height = 1840
integer taborder = 30
string title = "none"
string dataobject = "d_cdcustomer_base_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;// 항목 추가
string  ls_custno, ls_itemcd, ls_itemcdsave
integer li_sort, li_max
long    ll_row

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then RETURN

ls_itemcd = this.object.item_cd[row]
li_sort   = this.object.sort[row]

ll_row = dw_2.Find( "sort = " + string(li_sort) + " ", 1, dw_2.RowCount() )
if ll_row < 1 or ll_row > dw_2.rowcount() then ll_row = 0

if ll_row = 0 then
	li_max = 1
else
	li_max = dw_2.object.seq[ll_row] + 1
end if
//ii_max = li_max			// 행추가시 순번 중복방지 체크용


ll_row = dw_2.insertrow( ll_row )
dw_2.scrolltorow(ll_row)

//SELECT top 1 seq INTO :li_max FROM customer_base 
// WHERE cust_no = :ls_custno AND item_cd = :ls_itemcd AND sort = :li_sort
// ORDER BY seq DESC;

//ll_row = dw_2.getrow()	// 행추가 후 변동값
//dw_2.scrolltorow( ll_row )

dw_2.object.cust_no[ll_row]    = ls_custno	// 거래처
dw_2.object.item_cd[ll_row]    = ls_itemcd	// 대분류
dw_2.object.sort[ll_row]       = li_sort		// 항목
dw_2.object.seq[ll_row]        = li_max		// 순번
dw_2.object.iuser[ll_row]      = gs_userid	// 입력자
dw_2.object.input_date[ll_row] = gf_today()	// 입력일

dw_2.setcolumn( "idate" )
dw_2.setfocus()


//ls_itemcdsave = dw_2.object.item_cd[dw_2.rowcount()]
//for ll_row = dw_2.rowcount() to 1 step -1
//	ls_itemcd = dw_2.object.item_cd[ll_row]
//	li_sort   = dw_2.object.sort[ll_row]
//	
//	SELECT top 1 seq INTO :li_max FROM customer_base 
//	 WHERE cust_no = :ls_custno AND item_cd = :ls_itemcd AND sort = :li_sort
//	 ORDER BY seq DESC;
//	
//	if isnull(li_max) or li_max = 0 then
//		li_max = 1
//	else
//		li_max = li_max + 1
//	end if
//	
//	ii_max = li_max			// 순번 중복방지 체크용
//	dw_2.object.seq[ll_row] = li_max		// 순번	
//next


end event

event rowfocuschanged;// 항목선택
string  ls_custno, ls_itemcd, ls_itemnm
integer li_sort, li_max, li_sort2, li_sort5
long    ll_row,  ll_rowcount

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then RETURN

li_sort   = this.object.sort[currentrow]
ls_itemnm = this.object.item_nm[currentrow]

for ll_row = 1 to dw_2.rowcount()
	li_sort5 = dw_5.object.sort[currentrow]
	li_sort2 = dw_2.object.sort[ll_row]
	if li_sort5 = li_sort2 then
		dw_2.scrolltorow( ll_row )
		exit
	end if
next

end event

type cbx_4 from checkbox within w_cdcustomer_base_m
integer x = 3639
integer y = 472
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79416533
string text = "행 간격조정"
end type

event clicked;//// 행 간격조정
//long ll_row
//
//debugbreak()
//dw_2.SetRedraw( false )
//if this.checked = true then
//	dw_2.SetDetailHeight(1, dw_2.RowCount(), 240 )
//else
//	dw_2.SetDetailHeight(1, dw_2.RowCount(), 80 )
//end if
//dw_2.SetRedraw( true )
//
////
////
////ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), al_StartRow + 1, ll_EndRow)
////// Set the rowheight to normal size for this selected range
////
////Do While ll_Index > 0 
////		adw_DataWindow.SetDetailHeight(ll_Index, ll_Index, 19)
////		ll_Index++
////		If ll_Index > ll_EndRow Then Exit
////		ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), ll_Index, ll_EndRow)
////Loop	
end event

