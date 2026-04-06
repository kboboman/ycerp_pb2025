$PBExportHeader$w_irlocationstock_m2.srw
$PBExportComments$지점재고관리(2013/10/19)
forward 
global type w_irlocationstock_m2 from w_inheritance
end type
type dw_3 from datawindow within w_irlocationstock_m2
end type
type em_1 from editmask within w_irlocationstock_m2
end type
type st_3 from statictext within w_irlocationstock_m2
end type
type ddlb_dwtitles from dropdownlistbox within w_irlocationstock_m2
end type
type st_4 from statictext within w_irlocationstock_m2
end type
type ddlb_op from dropdownlistbox within w_irlocationstock_m2
end type
type sle_value from singlelineedit within w_irlocationstock_m2
end type
type cb_1 from commandbutton within w_irlocationstock_m2
end type
type cb_2 from commandbutton within w_irlocationstock_m2
end type
type cb_3 from commandbutton within w_irlocationstock_m2
end type
type cb_5 from commandbutton within w_irlocationstock_m2
end type
type ddlb_fld from dropdownlistbox within w_irlocationstock_m2
end type
type st_7 from statictext within w_irlocationstock_m2
end type
type dw_area from datawindow within w_irlocationstock_m2
end type
type cbx_iall from checkbox within w_irlocationstock_m2
end type
type cbx_i01 from checkbox within w_irlocationstock_m2
end type
type cbx_i02 from checkbox within w_irlocationstock_m2
end type
type cbx_i03 from checkbox within w_irlocationstock_m2
end type
type cbx_i04 from checkbox within w_irlocationstock_m2
end type
type cbx_i05 from checkbox within w_irlocationstock_m2
end type
type cbx_i06 from checkbox within w_irlocationstock_m2
end type
type cbx_i07 from checkbox within w_irlocationstock_m2
end type
type cbx_oall from checkbox within w_irlocationstock_m2
end type
type cbx_o01 from checkbox within w_irlocationstock_m2
end type
type cbx_o02 from checkbox within w_irlocationstock_m2
end type
type cbx_o03 from checkbox within w_irlocationstock_m2
end type
type cbx_o04 from checkbox within w_irlocationstock_m2
end type
type cbx_o05 from checkbox within w_irlocationstock_m2
end type
type cbx_o06 from checkbox within w_irlocationstock_m2
end type
type cbx_o07 from checkbox within w_irlocationstock_m2
end type
type cbx_o08 from checkbox within w_irlocationstock_m2
end type
type cbx_o09 from checkbox within w_irlocationstock_m2
end type
type gb_4 from groupbox within w_irlocationstock_m2
end type
type gb_5 from groupbox within w_irlocationstock_m2
end type
type gb_6 from groupbox within w_irlocationstock_m2
end type
type pb_1 from picturebutton within w_irlocationstock_m2
end type
type pb_3 from picturebutton within w_irlocationstock_m2
end type
type cbx_iotype from checkbox within w_irlocationstock_m2
end type
type st_1 from statictext within w_irlocationstock_m2
end type
type st_2 from statictext within w_irlocationstock_m2
end type
type st_5 from statictext within w_irlocationstock_m2
end type
type rb_1 from radiobutton within w_irlocationstock_m2
end type
type rb_2 from radiobutton within w_irlocationstock_m2
end type
type st_6 from statictext within w_irlocationstock_m2
end type
type dw_4 from datawindow within w_irlocationstock_m2
end type
type cbx_day from checkbox within w_irlocationstock_m2
end type
type dw_5 from datawindow within w_irlocationstock_m2
end type
type cbx_1 from checkbox within w_irlocationstock_m2
end type
type dw_6 from datawindow within w_irlocationstock_m2
end type
type cbx_2 from checkbox within w_irlocationstock_m2
end type
type st_8 from statictext within w_irlocationstock_m2
end type
type hpb_1 from hprogressbar within w_irlocationstock_m2
end type
type pb_ewol from picturebutton within w_irlocationstock_m2
end type
type cbx_3 from checkbox within w_irlocationstock_m2
end type
type cb_4 from commandbutton within w_irlocationstock_m2
end type
end forward

global type w_irlocationstock_m2 from w_inheritance
integer width = 4635
integer height = 2564
string title = "지점재고관리(w_irlocationstock_m2)"
string icon = "Hand!"
dw_3 dw_3
em_1 em_1
st_3 st_3
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_fld ddlb_fld
st_7 st_7
dw_area dw_area
cbx_iall cbx_iall
cbx_i01 cbx_i01
cbx_i02 cbx_i02
cbx_i03 cbx_i03
cbx_i04 cbx_i04
cbx_i05 cbx_i05
cbx_i06 cbx_i06
cbx_i07 cbx_i07
cbx_oall cbx_oall
cbx_o01 cbx_o01
cbx_o02 cbx_o02
cbx_o03 cbx_o03
cbx_o04 cbx_o04
cbx_o05 cbx_o05
cbx_o06 cbx_o06
cbx_o07 cbx_o07
cbx_o08 cbx_o08
cbx_o09 cbx_o09
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
pb_1 pb_1
pb_3 pb_3
cbx_iotype cbx_iotype
st_1 st_1
st_2 st_2
st_5 st_5
rb_1 rb_1
rb_2 rb_2
st_6 st_6
dw_4 dw_4
cbx_day cbx_day
dw_5 dw_5
cbx_1 cbx_1
dw_6 dw_6
cbx_2 cbx_2
st_8 st_8
hpb_1 hpb_1
pb_ewol pb_ewol
cbx_3 cbx_3
cb_4 cb_4
end type
global w_irlocationstock_m2 w_irlocationstock_m2

type variables
DataWindow idw_view
DataWindowChild idwc_area, idwc_qa

string is_itemno, is_qa, is_dw
string is_ritype, is_rtype, is_itype	// 입,출고 형태


end variables

on w_irlocationstock_m2.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.st_3=create st_3
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_fld=create ddlb_fld
this.st_7=create st_7
this.dw_area=create dw_area
this.cbx_iall=create cbx_iall
this.cbx_i01=create cbx_i01
this.cbx_i02=create cbx_i02
this.cbx_i03=create cbx_i03
this.cbx_i04=create cbx_i04
this.cbx_i05=create cbx_i05
this.cbx_i06=create cbx_i06
this.cbx_i07=create cbx_i07
this.cbx_oall=create cbx_oall
this.cbx_o01=create cbx_o01
this.cbx_o02=create cbx_o02
this.cbx_o03=create cbx_o03
this.cbx_o04=create cbx_o04
this.cbx_o05=create cbx_o05
this.cbx_o06=create cbx_o06
this.cbx_o07=create cbx_o07
this.cbx_o08=create cbx_o08
this.cbx_o09=create cbx_o09
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.pb_1=create pb_1
this.pb_3=create pb_3
this.cbx_iotype=create cbx_iotype
this.st_1=create st_1
this.st_2=create st_2
this.st_5=create st_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_6=create st_6
this.dw_4=create dw_4
this.cbx_day=create cbx_day
this.dw_5=create dw_5
this.cbx_1=create cbx_1
this.dw_6=create dw_6
this.cbx_2=create cbx_2
this.st_8=create st_8
this.hpb_1=create hpb_1
this.pb_ewol=create pb_ewol
this.cbx_3=create cbx_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.ddlb_op
this.Control[iCurrent+7]=this.sle_value
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.dw_area
this.Control[iCurrent+15]=this.cbx_iall
this.Control[iCurrent+16]=this.cbx_i01
this.Control[iCurrent+17]=this.cbx_i02
this.Control[iCurrent+18]=this.cbx_i03
this.Control[iCurrent+19]=this.cbx_i04
this.Control[iCurrent+20]=this.cbx_i05
this.Control[iCurrent+21]=this.cbx_i06
this.Control[iCurrent+22]=this.cbx_i07
this.Control[iCurrent+23]=this.cbx_oall
this.Control[iCurrent+24]=this.cbx_o01
this.Control[iCurrent+25]=this.cbx_o02
this.Control[iCurrent+26]=this.cbx_o03
this.Control[iCurrent+27]=this.cbx_o04
this.Control[iCurrent+28]=this.cbx_o05
this.Control[iCurrent+29]=this.cbx_o06
this.Control[iCurrent+30]=this.cbx_o07
this.Control[iCurrent+31]=this.cbx_o08
this.Control[iCurrent+32]=this.cbx_o09
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_5
this.Control[iCurrent+35]=this.gb_6
this.Control[iCurrent+36]=this.pb_1
this.Control[iCurrent+37]=this.pb_3
this.Control[iCurrent+38]=this.cbx_iotype
this.Control[iCurrent+39]=this.st_1
this.Control[iCurrent+40]=this.st_2
this.Control[iCurrent+41]=this.st_5
this.Control[iCurrent+42]=this.rb_1
this.Control[iCurrent+43]=this.rb_2
this.Control[iCurrent+44]=this.st_6
this.Control[iCurrent+45]=this.dw_4
this.Control[iCurrent+46]=this.cbx_day
this.Control[iCurrent+47]=this.dw_5
this.Control[iCurrent+48]=this.cbx_1
this.Control[iCurrent+49]=this.dw_6
this.Control[iCurrent+50]=this.cbx_2
this.Control[iCurrent+51]=this.st_8
this.Control[iCurrent+52]=this.hpb_1
this.Control[iCurrent+53]=this.pb_ewol
this.Control[iCurrent+54]=this.cbx_3
this.Control[iCurrent+55]=this.cb_4
end on

on w_irlocationstock_m2.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_fld)
destroy(this.st_7)
destroy(this.dw_area)
destroy(this.cbx_iall)
destroy(this.cbx_i01)
destroy(this.cbx_i02)
destroy(this.cbx_i03)
destroy(this.cbx_i04)
destroy(this.cbx_i05)
destroy(this.cbx_i06)
destroy(this.cbx_i07)
destroy(this.cbx_oall)
destroy(this.cbx_o01)
destroy(this.cbx_o02)
destroy(this.cbx_o03)
destroy(this.cbx_o04)
destroy(this.cbx_o05)
destroy(this.cbx_o06)
destroy(this.cbx_o07)
destroy(this.cbx_o08)
destroy(this.cbx_o09)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.cbx_iotype)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_6)
destroy(this.dw_4)
destroy(this.cbx_day)
destroy(this.dw_5)
destroy(this.cbx_1)
destroy(this.dw_6)
destroy(this.cbx_2)
destroy(this.st_8)
destroy(this.hpb_1)
destroy(this.pb_ewol)
destroy(this.cbx_3)
destroy(this.cb_4)
end on

event open;call super::open;//=============================================================================================
// ITEMLOC(저장소 재고)의 현재고 수량 불일치로 영업지점만 별도 관리하도록 함 : 2013/10/05
// 재고조정 작업을 하지않아 이월수량이 실물수량과 상이함
// 물품대체 작업을 재고조정 수단으로 활용하고 있음
// 화곡, 대전 저장소만 일마감 으로 전환함
// 반품증 없이 입고되는 품목(보관, 정상반품) 들에 대한 업무정의가 되어야 함
//=============================================================================================

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

cbx_3.visible = false
hpb_1.visible = false
cbx_day.triggerevent( clicked! )

em_1.text = string(today(), 'yyyy/mm/dd')

dw_2.visible = false		// 출력
dw_6.visible = false		// 원본보기
pb_3.enabled = false		// 다중추가

dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
dw_5.SetTransObject(sqlca)
dw_6.SetTransObject(sqlca)

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = " "

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_area.object.area[1] = gs_area	// 기본값을 변경	
dw_area.accepttext()
 
//dw_area.enabled = false

string ls_loc, ls_locno

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;

dw_3.insertrow(1)
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()

is_dw = "dw_1"

dw_1.Modify("DataWindow.Detail.Height=88")	// Detail
dw_1.Modify("DataWindow.Trailer.1.Height=0")	// 품목 소계

//dw_4.object.base_qty.visible = false		// 조정수량
//dw_4.object.iotype.visible   = false		// 조정형태
//dw_4.object.cust_no.visible  = false		// 거래처
//dw_4.object.bigo.visible     = false		// 비고

debugbreak()

// 지점재고_관리
pb_save.enabled = false // 저장
pb_ewol.enabled = false	// 지점재고_이월작업

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_save.enabled = true	// 저장
else		
	if ls_locno = ls_loc then
		pb_save.enabled = true	// 저장
	end if	
end if	

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_이월작업' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_ewol.enabled = true	// 지점재고 이월작업
else		
	if ls_locno = ls_loc then
		pb_ewol.enabled = true	// 지점재고 이월작업
	end if	
end if	


// 입고전체
cbx_iall.checked = true
cbx_iall.triggerevent( clicked! )

// 출고전체
cbx_oall.checked = true
cbx_oall.triggerevent( clicked! )

// 현재고
if gs_userid = "1999010s" then
else
	rb_1.enabled = false
end if

// 재고조정
rb_2.checked = true
rb_2.postevent( clicked! )

end event

event resize;call super::resize;//
gb_6.width  = newwidth  - 73
gb_6.height = newheight - 712

dw_1.width  = newwidth  - 137
dw_1.height = newheight - 904

dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

dw_5.x      = dw_1.x
dw_5.y      = dw_1.y
dw_5.width  = dw_1.width
dw_5.height = dw_1.height

dw_6.width  = dw_1.width  * 0.7
dw_6.height = dw_1.height * 0.7
dw_6.x      = dw_1.x + ((dw_1.width  - dw_6.width) / 2)
dw_6.y      = dw_1.y + ((dw_1.height - dw_6.height) / 2)

end event

type pb_save from w_inheritance`pb_save within w_irlocationstock_m2
integer x = 4155
integer y = 64
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_locno, ls_iodate, ls_iotype, ls_itemno, ls_qa, ls_io, ls_bigo, ls_custno, ls_errtext
string  ls_area, ls_defno

long    ll_row, ll_rowsave, ll_qty
decimal ld_rcptqty, ld_issueqty

dw_3.accepttext()
dw_4.accepttext()
dw_area.accepttext()

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

if ls_area <> "S0001" then
   SELECT area_no INTO :ls_area FROM location WHERE loc_no = :ls_locno AND use_yn = 'Y';
	if ls_area = gs_area then
	else
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

SELECT bigo INTO :ls_defno FROM codemst 
 WHERE type = '지점재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = ls_defno then
else
	MessageBox("확인", "사업장이 다르면 저장할 수 없습니다.")
	RETURN
end if

for ll_row = 1 to dw_4.rowcount()
	ls_iotype = dw_4.object.iotype[ll_row]
	ls_io     = LeftA(ls_iotype,1)
	ls_itemno = dw_4.object.item_no[ll_row]
	ls_qa     = dw_4.object.qa[ll_row]
	ll_qty    = dw_4.object.base_qty[ll_row]
	ls_custno = dw_4.object.cust_no[ll_row]
	ls_bigo   = dw_4.object.bigo[ll_row]

	if ll_qty <> 0 then
		if isnull(ls_iotype) or ls_iotype = "" then
			MessageBox("확인", "오류형태는 반드시 입력해야 합니다.")
			RETURN
		end if
	end if
next

dw_4.accepttext()
if MessageBox("확인", "저장 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	ls_locno   = dw_3.object.loc_no[1]		// 저장소
	ls_iodate  = em_1.text
	
	for ll_row = 1 to dw_4.rowcount()
		ls_iotype = dw_4.object.iotype[ll_row]
		ls_io     = LeftA(ls_iotype,1)
		ls_itemno = dw_4.object.item_no[ll_row]
		ls_qa     = dw_4.object.qa[ll_row]
		ll_qty    = dw_4.object.base_qty[ll_row]
		ls_custno = dw_4.object.cust_no[ll_row]
		ls_bigo   = dw_4.object.bigo[ll_row]
	
		if isnull(ls_custno) then ls_custno = ""
		// 
		if ll_qty <> 0 then	
			ld_rcptqty = 0 ; ld_issueqty = 0
			if ls_io = "R" then
				ld_rcptqty  = ll_qty
				ld_issueqty = 0
			else
				ld_rcptqty  = 0
				ld_issueqty = ll_qty
			end if
			
			INSERT INTO INAUDIT_LOC (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
			       rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)
			VALUES( getdate(), :ls_iodate, :ls_itemno, :ls_qa, :ls_locno, :ls_iotype, :ls_custno,
			       :ld_rcptqty, :ld_issueqty, 0, '', '', :ls_bigo, 0, 0, 0, :gs_userid );
			if sqlca.sqlcode <> 0 then
				ls_errtext = SQLCA.SQLErrText
				rollback;
				MessageBox("확인","지점재고 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
				RETURN
			else
				COMMIT;
			end if		
		end if
	next
end if

ll_rowsave = dw_4.getrow()
pb_retrieve.triggerevent( clicked! )
if dw_4.rowcount() >= ll_rowsave then
	dw_4.scrolltorow( ll_rowsave )
end if

MessageBox("확인","저장완료")

end event

type dw_1 from w_inheritance`dw_1 within w_irlocationstock_m2
string tag = "d_irlocationstock_lv"
integer y = 824
integer width = 4466
integer height = 1568
string title = "INEODAY_LOC"
string dataobject = "d_irlocationstock_lv"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_1"

end event

type st_title from w_inheritance`st_title within w_irlocationstock_m2
integer x = 41
integer y = 48
integer width = 1006
string text = "지점재고 관리"
end type

type st_tips from w_inheritance`st_tips within w_irlocationstock_m2
end type

type pb_compute from w_inheritance`pb_compute within w_irlocationstock_m2
boolean visible = false
integer x = 4178
integer y = 252
integer height = 88
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_irlocationstock_m2
boolean visible = false
integer x = 3982
integer y = 252
integer height = 88
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_irlocationstock_m2
integer x = 4347
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irlocationstock_m2
integer x = 3963
integer y = 64
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then return

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 지점재고 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=93'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_irlocationstock_m2
boolean visible = false
integer x = 4375
integer y = 252
integer height = 88
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_irlocationstock_m2
boolean visible = false
integer x = 3771
integer y = 64
end type

type pb_insert from w_inheritance`pb_insert within w_irlocationstock_m2
boolean visible = false
integer x = 3579
integer y = 64
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_irlocationstock_m2
integer x = 3575
integer y = 64
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_edate, ls_year, ls_month, ls_defno
string ls_itemno = "%", ls_qa = "%",  ls_rall, ls_iall,  ls_ralls[7], ls_ialls[9], ls_ritype, ls_rtype, ls_itype
long   ll_iX

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( dw_1 )

dw_3.accepttext()
dw_area.accepttext()

ls_year  = string(year(date(em_1.text)))
ls_month = string(month(date(em_1.text)),"00")
//if cbx_day.checked = true then
//	ls_sdate = em_1.text
//else
	ls_sdate = string(date(em_1.text), "yyyy/mm/01")
//end if
ls_edate = em_1.text

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

if ls_sdate < "2014/01/01" then
	em_1.text = "2014/01/01"
	MessageBox("확인", "기초재고일(2014/01/01) 이전자료는 조회할 수 없습니다.")
	RETURN
end if

if ls_area <> "S0001" then
	SELECT def_loc INTO :ls_defno FROM area WHERE area_no = :ls_area;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

// 입고
if cbx_i01.checked = true then ls_ralls[1] = "Y"		// 생산
if cbx_i02.checked = true then ls_ralls[2] = "Y"		// 대체
if cbx_i03.checked = true then ls_ralls[3] = "Y"		// 저장소이동
if cbx_i04.checked = true then ls_ralls[4] = "Y"		// 반품
if cbx_i05.checked = true then ls_ralls[5] = "Y"		// 무상
if cbx_i06.checked = true then ls_ralls[6] = "Y"		// 가공
if cbx_i07.checked = true then ls_ralls[7] = "Y"		// 가입고
for ll_iX = 1 to upperbound(ls_ralls)
	if ls_ralls[ll_iX] = "Y" then
		ls_rall = ls_rall + "Y"
	else
		ls_rall = ls_rall + "N"
	end if
next

/* 입고: 생산입고RW, 대체입고RA, 저장소이동입고RK, 반품입고RF, 무상입고RT, 가공입고RO,RP, 가입고  NYYYYNY  */
ls_rtype = "'RX', "
for ll_ix = 1 to 7
	choose case ll_ix
		case 1
			ls_rtype = ls_rtype + "'RW', "
		case 2
			ls_rtype = ls_rtype + "'RA', "
		case 3
			ls_rtype = ls_rtype + "'RK', "
		case 4
			ls_rtype = ls_rtype + "'RF', "
		case 5
			ls_rtype = ls_rtype + "'RT', "
		case 6
			ls_rtype = ls_rtype + "'RO', 'RP', "
		case 7
			ls_rtype = ls_rtype + " "
	end choose
next
if LenA(ls_rtype) > 1 then
	ls_rtype = LeftA(ls_rtype, LenA(ls_rtype) - 3)
end if

// 출고
if cbx_o01.checked = true then ls_ialls[1] = "Y"		// 정상
if cbx_o02.checked = true then ls_ialls[2] = "Y"		// 대체
if cbx_o03.checked = true then ls_ialls[3] = "Y"		// 저장소이동
if cbx_o04.checked = true then ls_ialls[4] = "Y"		// 샘플
if cbx_o05.checked = true then ls_ialls[5] = "Y"		// 폐기
if cbx_o06.checked = true then ls_ialls[6] = "Y"		// 가공
if cbx_o07.checked = true then ls_ialls[7] = "Y"		// 가출고
if cbx_o08.checked = true then ls_ialls[8] = "Y"		// 작업일보사용
if cbx_o09.checked = true then ls_ialls[9] = "Y"		// 재고생산출고
for ll_iX = 1 to upperbound(ls_ialls)
	if ls_ialls[ll_iX] = "Y" then
		ls_iall = ls_iall + "Y"
	else
		ls_iall = ls_iall + "N"
	end if
next

/* 출고: 정상출고IS, 대체출고IA, 저장소이동출고IK, 샘플출고IQ, 폐기IB, 가공출고IO,IP, 가출고, 작업일보사용IW, 재고생산출고 YYYYYNNN */
ls_itype = ""
for ll_ix = 1 to 9
	choose case ll_ix
		case 1
			ls_itype = ls_itype + "'IS', "
		case 2
			ls_itype = ls_itype + "'IA', "
		case 3
			ls_itype = ls_itype + "'IK', "
		case 4
			ls_itype = ls_itype + "'IQ', "
		case 5
			ls_itype = ls_itype + "'IB', "
		case 6
			ls_itype = ls_itype + "'IO', 'IP', "
		case 7
			ls_itype = ls_itype + " "
		case 8
			ls_itype = ls_itype + "'IW', "
		case 9
			ls_itype = ls_itype + " "
	end choose
next
if LenA(ls_itype) > 1 then
	ls_itype = LeftA(ls_itype, LenA(ls_itype) - 3)
end if

if LenA(ls_itype) > 1 then
	ls_ritype = " iotype in ( " + ls_rtype + ", " + ls_itype + " ) "
else
	ls_ritype = " iotype in ( " + ls_rtype + " ) "
end if
is_ritype = ls_ritype

// 원본보기
cbx_2.checked = false
cbx_2.triggerevent( clicked! )

// 입출내역
if rb_1.checked = true then
	dw_1.visible = true
	is_dw = "dw_1"
	dw_1.reset()
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	
	dw_1.retrieve( ls_locno, ls_year, ls_month, ls_sdate, ls_edate )
end if

// 재고조정
if rb_2.checked = true then
	dw_4.visible = true
	is_dw = "dw_4"
	dw_4.reset()
	GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
	dw_4.retrieve( ls_locno, ls_year, ls_month, ls_sdate, ls_edate )
end if

end event

type gb_3 from w_inheritance`gb_3 within w_irlocationstock_m2
integer x = 3022
integer y = 16
integer width = 503
integer height = 212
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_2 from w_inheritance`gb_2 within w_irlocationstock_m2
integer x = 2107
integer y = 16
integer width = 896
integer height = 212
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "저장소"
end type

type gb_1 from w_inheritance`gb_1 within w_irlocationstock_m2
integer x = 3543
integer y = 16
integer width = 1019
integer height = 212
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_irlocationstock_m2
integer x = 910
integer y = 4
integer width = 146
integer height = 100
string dataobject = "d_ineoday_loc"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_2"

end event

type dw_3 from datawindow within w_irlocationstock_m2
integer x = 2135
integer y = 96
integer width = 855
integer height = 92
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;//// 저장소
//string ls_area, ls_locno, ls_loc
//
//this.accepttext()
//pb_save.enabled = false	// 저장
//pb_ewol.enabled = false	// 지점재고_이월
//
//ls_loc = this.object.loc_no[currentrow]
//
//SELECT area_no INTO :ls_area FROM location WHERE loc_no = :ls_loc AND use_yn = 'Y';
//if ls_area <> gs_area then
//	MessageBox("확인","다른 저장소의 지점재고 관리는 작업할 수 없습니다.")
//	RETURN
//end if
//
end event

event itemchanged;// 저장소
string ls_area, ls_locno, ls_loc

this.accepttext()
debugbreak()

pb_save.enabled = false	// 저장
pb_ewol.enabled = false	// 지점재고_이월

ls_loc = data

SELECT area_no INTO :ls_area FROM location WHERE loc_no = :ls_loc AND use_yn = 'Y';
if ls_area <> gs_area then
	MessageBox("확인","다른 저장소의 지점재고 관리는 작업할 수 없습니다.")
	RETURN
end if

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_save.enabled = true		// 저장
else
	if ls_locno = data then
		pb_save.enabled = true	// 저장
	end if
end if

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_이월작업' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_ewol.enabled = true		// 지점재고_이월
else
	if ls_locno = data then
		pb_ewol.enabled = true	// 지점재고_이월
	end if
end if

end event

type em_1 from editmask within w_irlocationstock_m2
integer x = 3072
integer y = 104
integer width = 411
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;// FROM
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_irlocationstock_m2
integer x = 55
integer y = 728
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

type ddlb_dwtitles from dropdownlistbox within w_irlocationstock_m2
integer x = 274
integer y = 724
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

type st_4 from statictext within w_irlocationstock_m2
integer x = 713
integer y = 728
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

type ddlb_op from dropdownlistbox within w_irlocationstock_m2
integer x = 882
integer y = 712
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

type sle_value from singlelineedit within w_irlocationstock_m2
integer x = 1202
integer y = 720
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

type cb_1 from commandbutton within w_irlocationstock_m2
integer x = 1774
integer y = 720
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_irlocationstock_m2
integer x = 1938
integer y = 720
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_irlocationstock_m2
integer x = 2103
integer y = 720
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_irlocationstock_m2
integer x = 2267
integer y = 720
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_fld from dropdownlistbox within w_irlocationstock_m2
integer x = 242
integer y = 712
integer width = 443
integer height = 632
integer taborder = 90
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

type st_7 from statictext within w_irlocationstock_m2
integer x = 1285
integer y = 116
integer width = 233
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
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_irlocationstock_m2
integer x = 1518
integer y = 100
integer width = 549
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 사업장
string ls_area, ls_locno, ls_loc

this.accepttext()
dw_3.accepttext()

ls_area = dw_area.object.area[1]
SELECT def_loc INTO :ls_loc FROM area  WHERE area_no = :ls_area;
if isnull(ls_loc) or ls_loc = "" then ls_loc = "WS00000000"

dw_3.object.loc_no[1] = ls_loc		// "WS00000000" // 기본값을 변경 is_loc

pb_ewol.enabled = false	// 지점재고 이월작업
pb_save.enabled = false	// 저장

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_관리' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_save.enabled = true	// 저장
else		
	if ls_locno = ls_loc then
		pb_save.enabled = true	// 저장
	end if	
end if	

setnull( ls_locno )
SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '지점재고_이월작업' AND item_cd = :gs_userid AND use_yn = 'Y';
if ls_locno = "ALL" then
	pb_ewol.enabled = true	// 지점재고 이월작업
else
	if ls_locno = ls_loc then
		pb_ewol.enabled = true	// 지점재고 이월작업
	end if	
end if	

end event

type cbx_iall from checkbox within w_irlocationstock_m2
integer x = 82
integer y = 320
integer width = 379
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "입고전체"
end type

event clicked;// 입고전체
string ls_area

ls_area = dw_area.object.area[1]

if this.checked = true then	
	cbx_i01.checked = false		// 생산
	cbx_i02.checked = true		// 대체
	cbx_i03.checked = true		// 저장소이동
	cbx_i04.checked = true		// 반품
	cbx_i05.checked = true		// 무상
	cbx_i06.checked = false		// 가공
	cbx_i07.checked = true		// 가입고
else
	cbx_i01.checked = false
	cbx_i02.checked = false
	cbx_i03.checked = false
	cbx_i04.checked = false
	cbx_i05.checked = false
	cbx_i06.checked = false
	cbx_i07.checked = false
end if

end event

type cbx_i01 from checkbox within w_irlocationstock_m2
integer x = 503
integer y = 320
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "생산"
end type

type cbx_i02 from checkbox within w_irlocationstock_m2
integer x = 786
integer y = 320
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "대체"
end type

type cbx_i03 from checkbox within w_irlocationstock_m2
integer x = 1079
integer y = 320
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "저장소이동"
end type

type cbx_i04 from checkbox within w_irlocationstock_m2
integer x = 1527
integer y = 320
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "반품"
end type

type cbx_i05 from checkbox within w_irlocationstock_m2
integer x = 1810
integer y = 320
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "무상"
end type

type cbx_i06 from checkbox within w_irlocationstock_m2
integer x = 2103
integer y = 320
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "가공"
end type

type cbx_i07 from checkbox within w_irlocationstock_m2
integer x = 2405
integer y = 320
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "기타입고"
end type

type cbx_oall from checkbox within w_irlocationstock_m2
integer x = 82
integer y = 400
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고전체"
end type

event clicked;// 출고전체
if this.checked = true then
	cbx_o01.checked = true		// 정상
	cbx_o02.checked = true		// 대체
	cbx_o03.checked = true		// 저장소이동
	cbx_o04.checked = true		// 샘플
	cbx_o05.checked = true		// 폐기
	cbx_o06.checked = false		// 가공
	cbx_o07.checked = true		// 가출고
	cbx_o08.checked = false		// 작업일보사용
	cbx_o09.checked = false		// 재고생산출고
else
	cbx_o01.checked = false
	cbx_o02.checked = false
	cbx_o03.checked = false
	cbx_o04.checked = false
	cbx_o05.checked = false
	cbx_o06.checked = false
	cbx_o07.checked = false
	cbx_o08.checked = false
	cbx_o09.checked = false
end if

end event

type cbx_o01 from checkbox within w_irlocationstock_m2
integer x = 503
integer y = 400
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "정상"
end type

type cbx_o02 from checkbox within w_irlocationstock_m2
integer x = 786
integer y = 400
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "대체"
end type

type cbx_o03 from checkbox within w_irlocationstock_m2
integer x = 1079
integer y = 400
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "저장소이동"
end type

type cbx_o04 from checkbox within w_irlocationstock_m2
integer x = 1527
integer y = 400
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "샘플"
end type

type cbx_o05 from checkbox within w_irlocationstock_m2
integer x = 1810
integer y = 400
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "폐기"
end type

type cbx_o06 from checkbox within w_irlocationstock_m2
integer x = 2103
integer y = 400
integer width = 293
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "가공"
end type

type cbx_o07 from checkbox within w_irlocationstock_m2
integer x = 2405
integer y = 400
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고의뢰"
end type

type cbx_o08 from checkbox within w_irlocationstock_m2
integer x = 2789
integer y = 400
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "작업일보사용"
end type

type cbx_o09 from checkbox within w_irlocationstock_m2
integer x = 3291
integer y = 400
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "재고생산출고"
end type

type gb_4 from groupbox within w_irlocationstock_m2
integer x = 1271
integer y = 16
integer width = 818
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "사업장"
end type

type gb_5 from groupbox within w_irlocationstock_m2
integer x = 32
integer y = 256
integer width = 4530
integer height = 244
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "입,출고 형태"
end type

type gb_6 from groupbox within w_irlocationstock_m2
integer x = 32
integer y = 668
integer width = 4530
integer height = 1760
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type pb_1 from picturebutton within w_irlocationstock_m2
event mousemove pbm_mousemove
integer x = 3771
integer y = 64
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

choose case	is_dw
	case "dw_1"		// 입출내역
		dwxls = dw_1

	case "dw_4"		// 재고조정
		dwxls = dw_4

	case "dw_5"		// 재고조정 보기
		dwxls = dw_5
end choose

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

type pb_3 from picturebutton within w_irlocationstock_m2
integer x = 4142
integer y = 708
integer width = 389
integer height = 104
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "돋움체"
string text = "다중추가"
vtextalign vtextalign = vcenter!
end type

event clicked;// 다중추가
gs_where2 lstr_where

long    ll_row, ll_cnt, ll_skip
string  ls_area, ls_loc, ls_itemno, ls_qa, ls_uom, ls_custno

ls_area = dw_area.object.area[1]
SELECT DEF_LOC INTO :ls_loc FROM AREA WHERE AREA_NO = :ls_area;

/////////////////////////////////////////////////////////////////
// 다중추가 화면
/////////////////////////////////////////////////////////////////
lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ls_loc
lstr_where.str8[1] = em_1.text
OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )
lstr_where = Message.PowerObjectParm
/////////////////////////////////////////////////////////////////

if lstr_where.chk <> "Y" then RETURN

ll_skip  = dw_4.rowcount()
//=============================================================//
// 다중추가 품목 반영하기
//=============================================================//
for ll_row = 1 to UpperBound(lstr_where.str1)                  
   ls_itemno = trim(lstr_where.str1[ll_row])
   ls_qa     = trim(lstr_where.str2[ll_row])
   ls_uom    = trim(lstr_where.str3[ll_row])
	
   ll_cnt = dw_4.InsertRow(0)
   dw_4.Object.cdate[ll_cnt]     = em_1.text                    	// 일자
   dw_4.Object.item_no[ll_cnt]   = Trim(lstr_where.str1[ll_row])	// 품목
   dw_4.Object.item_nm[ll_cnt]   = Trim(lstr_where.name[ll_row])	// 품명
   dw_4.Object.qa[ll_cnt]        = Trim(lstr_where.str2[ll_row])	// 규격
   dw_4.Object.qoh[ll_cnt]       = 0										// 지점재고
   dw_4.Object.in_qty[ll_cnt]    = 0										// 입고
   dw_4.Object.out_qty[ll_cnt]   = 0										// 출고
   dw_4.Object.base_qty[ll_cnt]  = 1										// 금일재고
next
//=============================================================//

dw_4.ScrollToRow( ll_skip + 1 )
//idwc_qa.SetFilter("item_no = '" + Trim(lstr_where.str1[1]) + "'")
//idwc_qa.Filter()

dw_4.SetColumn('base_qty')
dw_4.SetFocus()

end event

type cbx_iotype from checkbox within w_irlocationstock_m2
integer x = 64
integer y = 248
integer width = 526
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "입,출고 형태"
end type

event clicked;//
string ls_ritype

if this.checked = true then
	ls_ritype = is_ritype
	dw_1.setfilter( ls_ritype ) 
else
	ls_ritype = ""
	dw_1.setfilter( ls_ritype ) 
end if
dw_1.filter()

end event

type st_1 from statictext within w_irlocationstock_m2
integer x = 46
integer y = 528
integer width = 1618
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
string text = "1) 지점에서 절단가공한 경우는 ~"물품대체 작업~"."
boolean focusrectangle = false
end type

type st_2 from statictext within w_irlocationstock_m2
integer x = 46
integer y = 600
integer width = 2240
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "※ 거래처물품 보관목적으로 입고한 후 전용판매한 경우는 반품처리."
boolean focusrectangle = false
end type

type st_5 from statictext within w_irlocationstock_m2
integer x = 1691
integer y = 528
integer width = 1582
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
string text = "2) 저장소이동시 발생한 불량품은 ~"불량품입고~"."
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_irlocationstock_m2
integer x = 4005
integer y = 308
integer width = 315
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
string text = "현재고"
boolean checked = true
end type

event clicked;// 입출내역
if this.checked = true then
	dw_1.visible = true
	dw_4.visible = false

   pb_3.enabled  = false		// 다중추가	
end if

end event

type rb_2 from radiobutton within w_irlocationstock_m2
integer x = 4005
integer y = 380
integer width = 384
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "재고조정"
end type

event clicked;// 재고관리
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = true

   pb_3.enabled  = true		// 다중추가
end if

end event

type st_6 from statictext within w_irlocationstock_m2
integer x = 41
integer y = 196
integer width = 379
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "지점재고_관리"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_irlocationstock_m2
event ue_key pbm_dwnkey
integer x = 251
integer y = 1072
integer width = 4073
integer height = 1176
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_irlocationstock_lv1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;//
debugbreak()

if key = KeyEnter! then
	this.accepttext()
	
	if this.getcolumnname() = "base_qty" then
		this.setcolumn("iotype")
		this.setfocus()
	end if
end if

end event

event clicked;//
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

setnull(is_itemno)
setnull(is_qa)

end event

event doubleclicked;// 상세조회
string ls_area, ls_locno, ls_sdate, ls_edate, ls_defno
string ls_itemno, ls_qa, ls_iall, ls_oall,  ls_ialls[7], ls_oalls[9], ls_col
long   ll_iX

dw_3.accepttext()
dw_area.accepttext()

// 상세조회 품목, 규격
ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]
ls_edate = em_1.text
if cbx_day.checked = false then	// 당일조회
	ls_sdate = string(date(em_1.text),"yyyy/mm/01")
	dw_6.title = "원본보기: " + ls_sdate + " ─ " + ls_edate
else
	ls_sdate = em_1.text
	dw_6.title = "원본보기: " + ls_sdate + " ─ " + ls_edate
end if

is_itemno= this.object.item_no[row]
is_qa    = this.object.qa[row]

if ls_area <> "S0001" then
	SELECT def_loc INTO :ls_defno FROM area WHERE area_no = :ls_area;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

// 입고
if cbx_i01.checked = true then ls_ialls[1] = "Y"
if cbx_i02.checked = true then ls_ialls[2] = "Y"
if cbx_i03.checked = true then ls_ialls[3] = "Y"
if cbx_i04.checked = true then ls_ialls[4] = "Y"
if cbx_i05.checked = true then ls_ialls[5] = "Y"
if cbx_i06.checked = true then ls_ialls[6] = "Y"
if cbx_i07.checked = true then ls_ialls[7] = "Y"
for ll_iX = 1 to upperbound(ls_ialls)
	if ls_ialls[ll_iX] = "Y" then
		ls_iall = ls_iall + "Y"
	else
		ls_iall = ls_iall + "N"
	end if
next
// 출고
if cbx_o01.checked = true then ls_oalls[1] = "Y"
if cbx_o02.checked = true then ls_oalls[2] = "Y"
if cbx_o03.checked = true then ls_oalls[3] = "Y"
if cbx_o04.checked = true then ls_oalls[4] = "Y"
if cbx_o05.checked = true then ls_oalls[5] = "Y"
if cbx_o06.checked = true then ls_oalls[6] = "Y"
if cbx_o07.checked = true then ls_oalls[7] = "Y"
if cbx_o08.checked = true then ls_oalls[8] = "Y"
if cbx_o09.checked = true then ls_oalls[9] = "Y"
for ll_iX = 1 to upperbound(ls_oalls)
	if ls_oalls[ll_iX] = "Y" then
		ls_oall = ls_oall + "Y"
	else
		ls_oall = ls_oall + "N"
	end if
next

// 원본보기
dw_6.reset()
dw_6.setredraw( false )
dw_6.retrieve( ls_locno, ls_sdate, ls_edate, is_itemno, is_qa )
dw_6.setredraw( true )

if dw_6.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터 존재하지 않습니다.")
else
	GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
	cbx_2.checked = true
	dw_6.visible  = true	
	ls_col = dwo.name
end if

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체

this.accepttext()

choose case dwo.name
	case "base_qty"
		this.SelectText(1, LenA(GetText()) + 2)		// 전체선택
end choose

end event

type cbx_day from checkbox within w_irlocationstock_m2
integer x = 3045
integer y = 12
integer width = 357
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "당일조회"
end type

event clicked;//
dw_4.setredraw( false )

dw_4.object.jaego.visible      = false
dw_4.object.base_qty.visible   = false
dw_4.object.iotype.visible     = false
dw_4.object.cust_no.visible    = false
dw_4.object.bigo.visible       = false

if this.checked = true then
	dw_4.object.qoh.visible     = false
	dw_4.object.in_qty.visible  = false
	dw_4.object.out_qty.visible = false

	dw_4.object.bf_qoh.visible     = true
	dw_4.object.trcpt_qty.visible  = true
	dw_4.object.tissue_qty.visible = true
	
	dw_4.object.jaego.visible      = true
	dw_4.object.base_qty.visible   = true
	dw_4.object.iotype.visible     = true
	dw_4.object.cust_no.visible    = true
	dw_4.object.bigo.visible       = true
else
	dw_4.object.qoh.visible     = true
	dw_4.object.in_qty.visible  = true
	dw_4.object.out_qty.visible = true

	dw_4.object.bf_qoh.visible     = false
	dw_4.object.trcpt_qty.visible  = false
	dw_4.object.tissue_qty.visible = false
	
	dw_4.object.jaego.visible      = true
	dw_4.object.base_qty.visible   = true
	dw_4.object.iotype.visible     = true
	dw_4.object.cust_no.visible    = true
	dw_4.object.bigo.visible       = true
end if
dw_4.setredraw( true )

end event

type dw_5 from datawindow within w_irlocationstock_m2
integer x = 448
integer y = 1276
integer width = 3643
integer height = 756
integer taborder = 50
boolean bringtotop = true
string title = "재고조정내용"
string dataobject = "d_irlocationstock_sos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_5"

setnull(is_itemno)
setnull(is_qa)

end event

type cbx_1 from checkbox within w_irlocationstock_m2
integer x = 3973
integer y = 524
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "재고조정 보기"
end type

event clicked;//
string ls_locno, ls_edate

ls_locno = dw_3.object.loc_no[1]
ls_edate = em_1.text

// 재고조정 내용
if this.checked = true then
	dw_5.visible = true
	is_dw = "dw_5"
	dw_5.reset()
	GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )
	dw_5.retrieve( ls_locno, ls_edate )
else
	dw_5.visible = false	
end if

end event

type dw_6 from datawindow within w_irlocationstock_m2
string tag = "d_irlocationstock_l"
integer x = 750
integer y = 1412
integer width = 3035
integer height = 416
integer taborder = 60
boolean bringtotop = true
boolean titlebar = true
string title = "원본보기"
string dataobject = "d_irlocationstock_l"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_6"

end event

type cbx_2 from checkbox within w_irlocationstock_m2
integer x = 3973
integer y = 596
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "원본보기"
end type

event clicked;// 상세조회
string ls_area, ls_locno, ls_sdate, ls_edate, ls_defno
string ls_itemno, ls_qa, ls_iall, ls_oall,  ls_ialls[7], ls_oalls[9], ls_col
long   ll_iX

dw_3.accepttext()
dw_area.accepttext()

// 상세조회 품목, 규격
ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]
ls_edate = em_1.text

if cbx_day.checked = false then	// 당일조회
	ls_sdate = string(date(em_1.text),"yyyy/mm/01")
	dw_6.title = "원본보기: " + ls_sdate + " ─ " + ls_edate
else
	ls_sdate = em_1.text
	dw_6.title = "원본보기: " + ls_sdate + " ─ " + ls_edate
end if
ls_itemno= "%"
ls_qa    = "%"

if ls_area <> "S0001" then
	SELECT def_loc INTO :ls_defno FROM area WHERE area_no = :ls_area;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

// 입고
if cbx_i01.checked = true then ls_ialls[1] = "Y"
if cbx_i02.checked = true then ls_ialls[2] = "Y"
if cbx_i03.checked = true then ls_ialls[3] = "Y"
if cbx_i04.checked = true then ls_ialls[4] = "Y"
if cbx_i05.checked = true then ls_ialls[5] = "Y"
if cbx_i06.checked = true then ls_ialls[6] = "Y"
if cbx_i07.checked = true then ls_ialls[7] = "Y"
for ll_iX = 1 to upperbound(ls_ialls)
	if ls_ialls[ll_iX] = "Y" then
		ls_iall = ls_iall + "Y"
	else
		ls_iall = ls_iall + "N"
	end if
next
// 출고
if cbx_o01.checked = true then ls_oalls[1] = "Y"
if cbx_o02.checked = true then ls_oalls[2] = "Y"
if cbx_o03.checked = true then ls_oalls[3] = "Y"
if cbx_o04.checked = true then ls_oalls[4] = "Y"
if cbx_o05.checked = true then ls_oalls[5] = "Y"
if cbx_o06.checked = true then ls_oalls[6] = "Y"
if cbx_o07.checked = true then ls_oalls[7] = "Y"
if cbx_o08.checked = true then ls_oalls[8] = "Y"
if cbx_o09.checked = true then ls_oalls[9] = "Y"
for ll_iX = 1 to upperbound(ls_oalls)
	if ls_oalls[ll_iX] = "Y" then
		ls_oall = ls_oall + "Y"
	else
		ls_oall = ls_oall + "N"
	end if
next

// 원본보기
if this.checked = true then
	dw_6.reset()
	dw_6.setredraw( false )
	dw_6.retrieve( ls_locno, ls_sdate, ls_edate, ls_itemno, ls_qa )
	dw_6.setredraw( true )
	
	if dw_6.rowcount() < 1 then
		MessageBox("확인", "해당하는 조건의 데이터 존재하지 않습니다.")
	else
		dw_6.visible  = true
		GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
	end if
else
	dw_6.visible  = false
end if

end event

type st_8 from statictext within w_irlocationstock_m2
integer x = 2459
integer y = 736
integer width = 1147
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "※ 행 더블클릭시 해당품목만 조회"
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_irlocationstock_m2
integer x = 2290
integer y = 592
integer width = 983
integer height = 68
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type pb_ewol from picturebutton within w_irlocationstock_m2
integer x = 3291
integer y = 576
integer width = 654
integer height = 100
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "지점재고 이월작업"
vtextalign vtextalign = vcenter!
end type

event clicked;// 전일재고 집계작업
string  ls_area, ls_yyyy, ls_mm, ls_uom, ls_yyyymm, ls_sdate, ls_date
string  ls_locno, ls_errtext, ls_itemno, ls_qa, ls_workno, ls_defno
decimal ld_bfqty, ld_rqty, ld_iqty, ld_qoh
long    ll_row, ll_cnt

decimal balbf
decimal R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, RQTY
decimal I01, I02, I03, I04, I05, I06, I07, I08, I09, I10, I11, I12, IQTY
datetime ld_date

dw_3.accepttext()			// 저장소
dw_area.accepttext()		// 사업장

ls_sdate  = em_1.text
ls_yyyy   = LeftA(em_1.text,4)		// yyyy
ls_yyyymm = LeftA(em_1.text,7)		// yyyy/mm
ls_area   = dw_area.object.area[1]
ls_locno  = dw_3.object.loc_no[1]

//debugbreak()
//SELECT top 1 dateadd(month, -1, :ls_sdate) INTO :ld_date FROM login;
ls_date  = string(date(ls_sdate),"yyyymm01")
SELECT top 1 dbo.UF_GETLASTDAY( :ls_date ) INTO :ls_date FROM login;
if ls_date <> ls_sdate then
	MessageBox("확인","이월작업 일자를 확인 하시기 바랍니다.~n~n(마지막일자: " + ls_date + ") ")
	em_1.setfocus()
	RETURN
end if

if ls_area <> "S0001" then
	SELECT def_loc INTO :ls_defno FROM area WHERE area_no = :ls_area;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

SELECT rtrim(bigo) INTO :ls_workno FROM codemst 
 WHERE type = '지점재고_이월작업' AND item_cd = :gs_userid AND use_yn = 'Y';
if isnull(ls_workno) or ls_workno = "" then 
	MessageBox("확인","지점재고_이월작업 권한이 존재하지 않습니다.")
	RETURN
end if

if ls_workno = "ALL" then
else
	if ls_workno <> ls_locno then 
		MessageBox("확인","해당하는 저장소 지점재고_이월작업 권한이 존재하지 않습니다.")
		RETURN
	end if
end if

ll_row = dw_2.retrieve( ls_locno, ls_yyyymm )
if ll_row < 1 then
	MessageBox("확인","해당하는 일자의 저장소 데이터가 존재하지 않습니다.")
	RETURN
else
	cbx_3.visible = true
//	cbx_3.checked = true
//	cbx_3.triggerevent( clicked! )		// 이월 데이터 보기

	if MessageBox("확인", "이월작업을 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		//EXECUTE EWOL_INEOYM_LOC( :ls_locno, :ls_yyyymm );
		
		hpb_1.visible = true
		for ll_row = 1 to dw_2.rowcount()
			hpb_1.position = (ll_row / dw_2.rowcount()) * 100			

			ls_locno    = dw_2.object.loc_no[ll_row] 
			// loc_name
			ls_yyyy     = dw_2.object.yyyy[ll_row] 
			ls_mm       = dw_2.object.mm[ll_row] 
			ls_itemno   = dw_2.object.item_no[ll_row] 
			// item_name
			ls_qa       = dw_2.object.qa[ll_row] 
			ls_uom      = dw_2.object.uom[ll_row] 
			ld_rqty     = dw_2.object.rcpt_qty[ll_row] 
			ld_iqty     = dw_2.object.issue_qty[ll_row] 

         SELECT count(*) INTO :ll_cnt FROM INEOYM_LOC 
			 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa;
			if ll_cnt = 0 then
				R01 = 0; R02 = 0; R03 = 0; R04 = 0; R05 = 0; R06 = 0; R07 = 0; R08 = 0; R09 = 0; R10 = 0; R11 = 0; R12 = 0
				I01 = 0; I02 = 0; I03 = 0; I04 = 0; I05 = 0; I06 = 0; I07 = 0; I08 = 0; I09 = 0; I10 = 0; I11 = 0; I12 = 0
				
				choose case ls_mm
					case '01'
						R01 = ld_rqty; I01 = ld_iqty 
					
					case '02'
						R02 = ld_rqty; I02 = ld_iqty 
					
					case '03'
						R03 = ld_rqty; I03 = ld_iqty 
					
					case '04'
						R04 = ld_rqty; I04 = ld_iqty 
					
					case '05'
						R05 = ld_rqty; I05 = ld_iqty 
					
					case '06'
						R06 = ld_rqty; I06 = ld_iqty 
					
					case '07'
						R07 = ld_rqty; I07 = ld_iqty 
					
					case '08'
						R08 = ld_rqty; I08 = ld_iqty 
					
					case '09'
						R09 = ld_rqty; I09 = ld_iqty 
					
					case '10'
						R10 = ld_rqty; I10 = ld_iqty 
					
					case '11'
						R11 = ld_rqty; I11 = ld_iqty 
					
					case '12'
						R12 = ld_rqty; I12 = ld_iqty 
				end choose

				INSERT INTO INEOYM_LOC ( loc_no, yyyy, item_no, qa, uom, balbf_qty, rcpt01, rcpt02, rcpt03, rcpt04, rcpt05, rcpt06
				       , rcpt07, rcpt08, rcpt09, rcpt10, rcpt11, rcpt12
						 , issue01, issue02, issue03, issue04, issue05, issue06, issue07, issue08, issue09, issue10, issue11, issue12
						 , make_date )
				VALUES ( :ls_locno, :ls_yyyy, :ls_itemno, :ls_qa, :ls_uom, 0, :R01, :R02, :R03, :R04, :R05, :R06
				       , :R07, :R08, :R09, :R10, :R11, :R12
						 , :I01, :I02, :I03, :I04, :I05, :I06, :I07, :I08, :I09, :I10, :I11, :I12, getdate() );
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","지점재고(INEOYM_LOC) 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					RETURN
				else
					COMMIT;
				end if		
			elseif ll_cnt = 1 then
				choose case ls_mm
					case '01'
						UPDATE INEOYM_LOC 
							SET rcpt01 = :ld_rqty, issue01 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
									
					case '02'
						UPDATE INEOYM_LOC 
							SET rcpt02 = :ld_rqty, issue02 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '03'
						UPDATE INEOYM_LOC 
							SET rcpt03 = :ld_rqty, issue03 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '04'
						UPDATE INEOYM_LOC 
							SET rcpt04 = :ld_rqty, issue04 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '05'
						UPDATE INEOYM_LOC 
							SET rcpt05 = :ld_rqty, issue05 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '06'
						UPDATE INEOYM_LOC 
							SET rcpt06 = :ld_rqty, issue06 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '07'
						UPDATE INEOYM_LOC 
							SET rcpt07 = :ld_rqty, issue07 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '08'
						UPDATE INEOYM_LOC 
							SET rcpt08 = :ld_rqty, issue08 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '09'
						UPDATE INEOYM_LOC 
							SET rcpt09 = :ld_rqty, issue09 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '10'
						UPDATE INEOYM_LOC 
							SET rcpt10 = :ld_rqty, issue10 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '11'
						UPDATE INEOYM_LOC 
							SET rcpt11 = :ld_rqty, issue11 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
					
					case '12'
						UPDATE INEOYM_LOC 
							SET rcpt12 = :ld_rqty, issue12 = :ld_iqty, make_date = getdate()
						 WHERE loc_no = :ls_locno AND yyyy = :ls_yyyy AND item_no = :ls_itemno AND qa = :ls_qa; 
				end choose
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","지점재고 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					RETURN
				else
					COMMIT;
				end if		
			else
				Messagebox("확인"," loc_no = "+ls_locno+" AND yyyy = "+ls_yyyy+" AND item_no = "+ls_itemno+" AND qa = "+ls_qa)
				
			end if		
		next

//		cbx_3.checked = false
//		cbx_3.triggerevent( clicked! )

		hpb_1.visible = false
		MessageBox("확인","지점재고 이월작업 완료")
	end if
end if

end event

type cbx_3 from checkbox within w_irlocationstock_m2
integer x = 3291
integer y = 512
integer width = 626
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "이월데이터 보기"
end type

event clicked;//

if this.checked = true then
	if dw_1.visible = true then
		idw_view = dw_1
	elseif dw_4.visible = true then
		idw_view = dw_4
	elseif dw_5.visible = true then
		idw_view = dw_5
	elseif dw_6.visible = true then
		idw_view = dw_6
	end if

	dw_1.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = false
	
	dw_2.visible = true
else
	idw_view.visible = true
end if


end event

type cb_4 from commandbutton within w_irlocationstock_m2
integer x = 3739
integer y = 708
integer width = 389
integer height = 104
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이력보기"
end type

event clicked;// 이력
string ls_itemno, ls_itemnm, ls_qa, ls_locno
long ll_row
int  ls_a

gs_where lst_where

debugbreak()

dw_3.accepttext()

ls_locno = dw_3.object.loc_no[1]

if cbx_1.checked = false then			// 재고조정 보기
	ll_row    = dw_4.getrow()
	ls_itemno = dw_4.object.item_no[ll_row]
	ls_itemnm = dw_4.object.item_nm[ll_row]
	ls_qa     = dw_4.object.qa[ll_row]
else
	if cbx_2.checked = false then		// 재고조정 보기
		ll_row    = dw_5.getrow()
		ls_itemno = dw_5.object.item_no[ll_row]
		ls_itemnm = dw_5.object.item_nm[ll_row]
		ls_qa     = dw_5.object.qa[ll_row]
	else										// 원본보기
		ll_row    = dw_6.getrow()
		ls_itemno = dw_6.object.item_no[ll_row]
		ls_itemnm = dw_6.object.item_nm[ll_row]
		ls_qa     = dw_6.object.qa[ll_row]
	end if
end if
if ll_row < 1 then return

lst_where.str1 = ls_itemno
lst_where.str2 = ls_qa
lst_where.str3 = ls_locno
lst_where.name = ls_itemnm
lst_where.chk  = "DO"

gs_print_control = "INAUDIT"
if gs_print_control = 'INAUDIT' then
	OpenWithParm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

