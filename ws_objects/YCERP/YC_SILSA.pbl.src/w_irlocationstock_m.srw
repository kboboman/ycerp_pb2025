$PBExportHeader$w_irlocationstock_m.srw
$PBExportComments$지점재고관리(2013/10/19)
forward 
global type w_irlocationstock_m from w_inheritance
end type
type dw_3 from datawindow within w_irlocationstock_m
end type
type em_1 from editmask within w_irlocationstock_m
end type
type cbx_top15 from checkbox within w_irlocationstock_m
end type
type st_3 from statictext within w_irlocationstock_m
end type
type ddlb_dwtitles from dropdownlistbox within w_irlocationstock_m
end type
type st_4 from statictext within w_irlocationstock_m
end type
type ddlb_op from dropdownlistbox within w_irlocationstock_m
end type
type sle_value from singlelineedit within w_irlocationstock_m
end type
type cb_1 from commandbutton within w_irlocationstock_m
end type
type cb_2 from commandbutton within w_irlocationstock_m
end type
type cb_3 from commandbutton within w_irlocationstock_m
end type
type cb_5 from commandbutton within w_irlocationstock_m
end type
type ddlb_fld from dropdownlistbox within w_irlocationstock_m
end type
type st_7 from statictext within w_irlocationstock_m
end type
type dw_area from datawindow within w_irlocationstock_m
end type
type cbx_iall from checkbox within w_irlocationstock_m
end type
type cbx_i01 from checkbox within w_irlocationstock_m
end type
type cbx_i02 from checkbox within w_irlocationstock_m
end type
type cbx_i03 from checkbox within w_irlocationstock_m
end type
type cbx_i04 from checkbox within w_irlocationstock_m
end type
type cbx_i05 from checkbox within w_irlocationstock_m
end type
type cbx_i06 from checkbox within w_irlocationstock_m
end type
type cbx_i07 from checkbox within w_irlocationstock_m
end type
type cbx_oall from checkbox within w_irlocationstock_m
end type
type cbx_o01 from checkbox within w_irlocationstock_m
end type
type cbx_o02 from checkbox within w_irlocationstock_m
end type
type cbx_o03 from checkbox within w_irlocationstock_m
end type
type cbx_o04 from checkbox within w_irlocationstock_m
end type
type cbx_o05 from checkbox within w_irlocationstock_m
end type
type cbx_o06 from checkbox within w_irlocationstock_m
end type
type cbx_o07 from checkbox within w_irlocationstock_m
end type
type cbx_o08 from checkbox within w_irlocationstock_m
end type
type cbx_o09 from checkbox within w_irlocationstock_m
end type
type gb_4 from groupbox within w_irlocationstock_m
end type
type gb_5 from groupbox within w_irlocationstock_m
end type
type gb_6 from groupbox within w_irlocationstock_m
end type
type dw_5 from datawindow within w_irlocationstock_m
end type
type cbx_2 from checkbox within w_irlocationstock_m
end type
type pb_1 from picturebutton within w_irlocationstock_m
end type
type cbx_3 from checkbox within w_irlocationstock_m
end type
type pb_3 from picturebutton within w_irlocationstock_m
end type
type dw_4 from datawindow within w_irlocationstock_m
end type
type dw_6 from datawindow within w_irlocationstock_m
end type
type cbx_iotype from checkbox within w_irlocationstock_m
end type
type st_1 from statictext within w_irlocationstock_m
end type
type st_2 from statictext within w_irlocationstock_m
end type
type pb_2 from picturebutton within w_irlocationstock_m
end type
type st_5 from statictext within w_irlocationstock_m
end type
type pb_4 from picturebutton within w_irlocationstock_m
end type
type hpb_1 from hprogressbar within w_irlocationstock_m
end type
type dw_7 from datawindow within w_irlocationstock_m
end type
type rb_1 from radiobutton within w_irlocationstock_m
end type
type rb_2 from radiobutton within w_irlocationstock_m
end type
type rb_3 from radiobutton within w_irlocationstock_m
end type
type st_6 from statictext within w_irlocationstock_m
end type
end forward

global type w_irlocationstock_m from w_inheritance
integer width = 4640
integer height = 2572
string title = "지점재고관리(w_irlocationstock_m)"
string icon = "Hand!"
dw_3 dw_3
em_1 em_1
cbx_top15 cbx_top15
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
dw_5 dw_5
cbx_2 cbx_2
pb_1 pb_1
cbx_3 cbx_3
pb_3 pb_3
dw_4 dw_4
dw_6 dw_6
cbx_iotype cbx_iotype
st_1 st_1
st_2 st_2
pb_2 pb_2
st_5 st_5
pb_4 pb_4
hpb_1 hpb_1
dw_7 dw_7
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_6 st_6
end type
global w_irlocationstock_m w_irlocationstock_m

type variables
DataWindowChild idwc_area, idwc_qa
string is_itemno, is_qa, is_dw
// 입,출고 형태
string is_ritype, is_rtype, is_itype


end variables

on w_irlocationstock_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.cbx_top15=create cbx_top15
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
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.cbx_3=create cbx_3
this.pb_3=create pb_3
this.dw_4=create dw_4
this.dw_6=create dw_6
this.cbx_iotype=create cbx_iotype
this.st_1=create st_1
this.st_2=create st_2
this.pb_2=create pb_2
this.st_5=create st_5
this.pb_4=create pb_4
this.hpb_1=create hpb_1
this.dw_7=create dw_7
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.cbx_top15
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.dw_area
this.Control[iCurrent+16]=this.cbx_iall
this.Control[iCurrent+17]=this.cbx_i01
this.Control[iCurrent+18]=this.cbx_i02
this.Control[iCurrent+19]=this.cbx_i03
this.Control[iCurrent+20]=this.cbx_i04
this.Control[iCurrent+21]=this.cbx_i05
this.Control[iCurrent+22]=this.cbx_i06
this.Control[iCurrent+23]=this.cbx_i07
this.Control[iCurrent+24]=this.cbx_oall
this.Control[iCurrent+25]=this.cbx_o01
this.Control[iCurrent+26]=this.cbx_o02
this.Control[iCurrent+27]=this.cbx_o03
this.Control[iCurrent+28]=this.cbx_o04
this.Control[iCurrent+29]=this.cbx_o05
this.Control[iCurrent+30]=this.cbx_o06
this.Control[iCurrent+31]=this.cbx_o07
this.Control[iCurrent+32]=this.cbx_o08
this.Control[iCurrent+33]=this.cbx_o09
this.Control[iCurrent+34]=this.gb_4
this.Control[iCurrent+35]=this.gb_5
this.Control[iCurrent+36]=this.gb_6
this.Control[iCurrent+37]=this.dw_5
this.Control[iCurrent+38]=this.cbx_2
this.Control[iCurrent+39]=this.pb_1
this.Control[iCurrent+40]=this.cbx_3
this.Control[iCurrent+41]=this.pb_3
this.Control[iCurrent+42]=this.dw_4
this.Control[iCurrent+43]=this.dw_6
this.Control[iCurrent+44]=this.cbx_iotype
this.Control[iCurrent+45]=this.st_1
this.Control[iCurrent+46]=this.st_2
this.Control[iCurrent+47]=this.pb_2
this.Control[iCurrent+48]=this.st_5
this.Control[iCurrent+49]=this.pb_4
this.Control[iCurrent+50]=this.hpb_1
this.Control[iCurrent+51]=this.dw_7
this.Control[iCurrent+52]=this.rb_1
this.Control[iCurrent+53]=this.rb_2
this.Control[iCurrent+54]=this.rb_3
this.Control[iCurrent+55]=this.st_6
end on

on w_irlocationstock_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.cbx_top15)
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
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.cbx_3)
destroy(this.pb_3)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.cbx_iotype)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_2)
destroy(this.st_5)
destroy(this.pb_4)
destroy(this.hpb_1)
destroy(this.dw_7)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_6)
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

hpb_1.visible = false
em_1.text = string(today(), 'yyyy/mm/dd')

dw_2.visible = false
dw_4.visible = false
dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
pb_3.enabled = false		// 다중추가

dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)
dw_5.SetTransObject(sqlca)
dw_6.SetTransObject(sqlca)
dw_7.SetTransObject(sqlca)

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

string ls_loc

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;
dw_3.insertrow(1)
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()

// 지점재고_관리
cbx_3.enabled   = false
pb_save.enabled = false
pb_4.enabled    = false		// 전일재고 집계작업
is_dw = "dw_1"

dw_1.Modify("DataWindow.Detail.Height=88")	// Detail
dw_1.Modify("DataWindow.Trailer.1.Height=0")	// 품목 소계

//dw_4.object.base_qty.visible = false		// 조정수량
//dw_4.object.iotype.visible   = false		// 조정형태
//dw_4.object.cust_no.visible  = false		// 거래처
//dw_4.object.bigo.visible     = false		// 비고

cbx_2.visible = true
cbx_3.visible = false

if GF_PERMISSION('지점재고_관리', gs_userid) = "Y" then
	cbx_3.enabled = true		// 지점재고_관리
	pb_save.enabled = true	// 저장
	pb_4.enabled  = true		// 전일재고 집계작업
end if

// 입고전체
cbx_iall.checked = true
cbx_iall.triggerevent( clicked! )

// 출고전체
cbx_oall.checked = true
cbx_oall.triggerevent( clicked! )

// 입출내역
rb_1.checked = true
rb_1.postevent( clicked! )

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

dw_7.x      = dw_1.x
dw_7.y      = dw_1.y
dw_7.width  = dw_1.width
dw_7.height = dw_1.height


dw_5.x      = dw_1.x + (dw_1.width / 2)
dw_5.y      = dw_1.y
dw_5.width  = dw_1.width / 2
dw_5.height = dw_1.height

dw_6.x      = dw_1.x + (dw_1.width / 2)
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width / 2
dw_6.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_irlocationstock_m
integer x = 4155
integer y = 64
end type

event pb_save::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_locno, ls_iodate, ls_iotype, ls_itemno, ls_qa, ls_io, ls_bigo, ls_custno, ls_errtext
long    ll_row, ll_rowsave, ll_qty
decimal ld_rcptqty, ld_issueqty

dw_3.accepttext()
dw_4.accepttext()

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
	
		// 
		if ll_qty <> 0 then	
			ld_rcptqty = 0 ; ld_issueqty = 0
			if ls_io = "R" then
				ld_rcptqty = ll_qty
				ld_issueqty = 0
			else
				ld_rcptqty = 0
				ld_issueqty = ll_qty
			end if
			
			INSERT INTO INAUDIT_LOC (inaudit_time, inaudit_date, inaudit_item, qa, loc_no, inaudit_type, order_no,
			       rcpt_qty, issue_qty, cost, destination, serial_id, rem, unit_qty, cnt, com_qty, user_id)
			VALUES( getdate(), :ls_iodate, :ls_itemno, :ls_qa, :ls_locno, :ls_iotype, :ls_custno,
			       :ld_rcptqty, :ld_issueqty, 0, '', '', :ls_bigo, 0, 0, 0, :gs_userid);
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

//if wf_update1( dw_5, "Y" ) = true then
//end if

end event

type dw_1 from w_inheritance`dw_1 within w_irlocationstock_m
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

type st_title from w_inheritance`st_title within w_irlocationstock_m
integer x = 41
integer y = 48
integer width = 1006
string text = "지점재고 관리"
end type

type st_tips from w_inheritance`st_tips within w_irlocationstock_m
end type

type pb_compute from w_inheritance`pb_compute within w_irlocationstock_m
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

type pb_print_part from w_inheritance`pb_print_part within w_irlocationstock_m
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

type pb_close from w_inheritance`pb_close within w_irlocationstock_m
integer x = 4347
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irlocationstock_m
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

type pb_cancel from w_inheritance`pb_cancel within w_irlocationstock_m
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

type pb_delete from w_inheritance`pb_delete within w_irlocationstock_m
boolean visible = false
integer x = 3771
integer y = 64
end type

type pb_insert from w_inheritance`pb_insert within w_irlocationstock_m
boolean visible = false
integer x = 3579
integer y = 64
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_irlocationstock_m
integer x = 3575
integer y = 64
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_locno, ls_sdate, ls_edate, ls_year, ls_month, ls_defno, ls_top15 = "N"
string ls_itemno = "%", ls_qa = "%",  ls_rall, ls_iall,  ls_ralls[7], ls_ialls[9], ls_ritype, ls_rtype, ls_itype
long   ll_iX

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( dw_1 )
GF_DW2UnFilter( dw_4 )
GF_DW2UnFilter( dw_5 )

dw_3.accepttext()
dw_area.accepttext()

debugbreak()
ls_year  = string(year(date(em_1.text)))
ls_month = string(month(date(em_1.text)),"00")
ls_sdate = string(date(em_1.text), "yyyy/mm/01")
ls_edate = em_1.text

ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

if ls_edate < "2014/01/01" then
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

if cbx_top15.checked = true then ls_top15 = "Y"

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

debugbreak()
if LenA(ls_itype) > 1 then
	ls_ritype = " iotype in ( " + ls_rtype + ", " + ls_itype + " ) "
else
	ls_ritype = " iotype in ( " + ls_rtype + " ) "
end if
is_ritype = ls_ritype

// 입출내역
if rb_1.checked = true then
	dw_1.visible = true
	is_dw = "dw_1"
	dw_1.reset()
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	dw_1.retrieve( ls_locno, ls_year, ls_month, ls_sdate, ls_edate, ls_top15 )
end if

// 재고조정
if rb_2.checked = true then
	dw_4.visible = true
	is_dw = "dw_4"
	dw_4.reset()
	GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
	dw_4.retrieve( ls_edate, ls_locno, ls_top15 )
end if

// 일재고현황
if rb_3.checked = true then
	dw_7.visible = true
	is_dw = "dw_7"
	dw_7.reset()
	GF_DWTitle2ddlb( dw_7, ddlb_fld, ddlb_dwtitles )
	dw_7.retrieve( ls_edate, ls_locno, ls_top15 )
end if	


// SOURCE DATA	
if cbx_2.checked = true then
	dw_5.visible = true
	is_dw = "dw_5"
	dw_5.reset()
	GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )
	dw_5.retrieve( ls_edate, ls_locno, ls_area, ls_top15, ls_rall, ls_iall, ls_itemno, ls_qa )
end if

// 재고조정 내용
if cbx_3.checked = true then
	dw_6.visible = true
	is_dw = "dw_6"
	dw_6.reset()
	GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
	dw_6.retrieve( ls_edate, ls_locno, ls_top15 )
end if

end event

type gb_3 from w_inheritance`gb_3 within w_irlocationstock_m
integer x = 2839
integer y = 16
integer width = 503
integer height = 212
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "조회일자"
end type

type gb_2 from w_inheritance`gb_2 within w_irlocationstock_m
integer x = 1925
integer y = 16
integer width = 896
integer height = 212
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "저장소"
end type

type gb_1 from w_inheritance`gb_1 within w_irlocationstock_m
integer x = 3543
integer y = 16
integer width = 1019
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_irlocationstock_m
integer x = 562
integer y = 0
integer width = 155
integer height = 112
string dataobject = "d_ineoday_loc"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_irlocationstock_m
integer x = 1952
integer y = 96
integer width = 855
integer height = 92
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type em_1 from editmask within w_irlocationstock_m
integer x = 2889
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

type cbx_top15 from checkbox within w_irlocationstock_m
integer x = 4005
integer y = 464
integer width = 535
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
string text = "주요품목(15) "
end type

event clicked;// 주요품목(15) 

pb_retrieve.triggerevent( clicked! )

end event

type st_3 from statictext within w_irlocationstock_m
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

type ddlb_dwtitles from dropdownlistbox within w_irlocationstock_m
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

type st_4 from statictext within w_irlocationstock_m
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

type ddlb_op from dropdownlistbox within w_irlocationstock_m
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

type sle_value from singlelineedit within w_irlocationstock_m
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

type cb_1 from commandbutton within w_irlocationstock_m
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

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5

	case "dw_6"
		arg_dw  = dw_6
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_irlocationstock_m
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

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5

	case "dw_6"
		arg_dw  = dw_6
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_irlocationstock_m
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

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5

	case "dw_6"
		arg_dw  = dw_6
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_irlocationstock_m
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

	case "dw_4"
		arg_dw  = dw_4

	case "dw_5"
		arg_dw  = dw_5

	case "dw_6"
		arg_dw  = dw_6
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_fld from dropdownlistbox within w_irlocationstock_m
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

type st_7 from statictext within w_irlocationstock_m
integer x = 1097
integer y = 112
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

type dw_area from datawindow within w_irlocationstock_m
integer x = 1330
integer y = 96
integer width = 549
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area, ls_locno

this.accepttext()

ls_area = dw_area.object.area[ row ]
SELECT def_loc INTO :ls_locno FROM area  WHERE area_no = :ls_area;
if isnull(ls_locno) or ls_locno = "" then ls_locno = "WS00000000"

dw_3.object.loc_no[1] = ls_locno		// "WS00000000" // 기본값을 변경 is_loc
dw_3.accepttext()

end event

type cbx_iall from checkbox within w_irlocationstock_m
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

type cbx_i01 from checkbox within w_irlocationstock_m
integer x = 503
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
string text = "생산"
end type

type cbx_i02 from checkbox within w_irlocationstock_m
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

type cbx_i03 from checkbox within w_irlocationstock_m
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

type cbx_i04 from checkbox within w_irlocationstock_m
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

type cbx_i05 from checkbox within w_irlocationstock_m
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

type cbx_i06 from checkbox within w_irlocationstock_m
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

type cbx_i07 from checkbox within w_irlocationstock_m
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

type cbx_oall from checkbox within w_irlocationstock_m
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

type cbx_o01 from checkbox within w_irlocationstock_m
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

type cbx_o02 from checkbox within w_irlocationstock_m
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

type cbx_o03 from checkbox within w_irlocationstock_m
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

type cbx_o04 from checkbox within w_irlocationstock_m
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

type cbx_o05 from checkbox within w_irlocationstock_m
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

type cbx_o06 from checkbox within w_irlocationstock_m
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

type cbx_o07 from checkbox within w_irlocationstock_m
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

type cbx_o08 from checkbox within w_irlocationstock_m
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

type cbx_o09 from checkbox within w_irlocationstock_m
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

type gb_4 from groupbox within w_irlocationstock_m
integer x = 1083
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

type gb_5 from groupbox within w_irlocationstock_m
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

type gb_6 from groupbox within w_irlocationstock_m
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

type dw_5 from datawindow within w_irlocationstock_m
string tag = "d_irlocationstock_l"
integer x = 384
integer y = 1060
integer width = 3849
integer height = 764
integer taborder = 50
boolean bringtotop = true
string title = "SOURCE"
string dataobject = "d_irlocationstock_ll"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_5"

end event

type cbx_2 from checkbox within w_irlocationstock_m
integer x = 3328
integer y = 256
integer width = 457
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "SOURCE DATA"
end type

event clicked;// SOURCE DATA
if this.checked = true then
	dw_1.width   = ((parent.width  - 142) / 2) - 26

	dw_5.visible = true
	GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )
else
	dw_1.width   = gb_6.width  - 64
	dw_5.visible = false
end if

pb_retrieve.triggerevent( clicked! )

end event

type pb_1 from picturebutton within w_irlocationstock_m
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

	case "dw_7"		// 일재고현황
		dwxls = dw_7

	case "dw_5"		// SOURCE DATA	
		dwxls = dw_5

	case "dw_6"		// 재고조정 내용
		dwxls = dw_6
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

type cbx_3 from checkbox within w_irlocationstock_m
integer x = 3703
integer y = 256
integer width = 517
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "재고조정 내용"
end type

event clicked;// 재고조정 내용
if this.checked = true then
	dw_4.width   = ((parent.width  - 142) / 2) - 26

	dw_6.visible = true
	GF_DWTitle2ddlb( dw_6, ddlb_fld, ddlb_dwtitles )
else
	dw_4.width   = gb_6.width  - 64
	dw_6.visible = false
end if

pb_retrieve.triggerevent( clicked! )

end event

type pb_3 from picturebutton within w_irlocationstock_m
integer x = 4142
integer y = 708
integer width = 389
integer height = 104
integer taborder = 260
boolean bringtotop = true
integer textsize = -9
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

debugbreak()
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
   dw_4.Object.item_name[ll_cnt] = Trim(lstr_where.name[ll_row])	// 품명
   dw_4.Object.qa[ll_cnt]        = Trim(lstr_where.str2[ll_row])	// 규격
   dw_4.Object.qoh[ll_cnt]       = 0										// 지점재고
   dw_4.Object.in_qty[ll_cnt]    = 0										// 입고
   dw_4.Object.out_qty[ll_cnt]   = 0										// 출고
   dw_4.Object.cqoh[ll_cnt]      = 0										// 전산재고
   dw_4.Object.base_qty[ll_cnt]  = 0										// 금일재고
next
//=============================================================//

dw_4.ScrollToRow(ll_skip + 1)
//idwc_qa.SetFilter("item_no = '" + Trim(lstr_where.str1[1]) + "'")
//idwc_qa.Filter()

dw_4.SetColumn('base_qty')
dw_4.SetFocus()

end event

type dw_4 from datawindow within w_irlocationstock_m
integer x = 658
integer y = 1272
integer width = 3250
integer height = 984
integer taborder = 50
boolean bringtotop = true
string title = "d_irlocationstock_sos"
string dataobject = "d_irlocationstock_lll"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

setnull(is_itemno)
setnull(is_qa)

end event

event doubleclicked;// 상세조회
string ls_area, ls_locno, ls_sdate, ls_edate, ls_defno, ls_top15 = "N"
string ls_itemno, ls_qa, ls_iall, ls_oall,  ls_ialls[7], ls_oalls[9], ls_col
long   ll_iX

dw_3.accepttext()
dw_area.accepttext()

if cbx_3.checked = true then RETURN

// 상세조회 품목, 규격
is_itemno= this.object.item_no[row]
is_qa    = this.object.qa[row]

ls_sdate = em_1.text
ls_locno = dw_3.object.loc_no[1]
ls_area  = dw_area.object.area[1]

if ls_area <> "S0001" then
	SELECT def_loc INTO :ls_defno FROM area WHERE area_no = :ls_area;
	if ls_defno <> ls_locno then
		MessageBox("확인", "사업장과 기본 저장소가 일치하지 않습니다.")
		RETURN
	end if
end if

if cbx_top15.checked = true then ls_top15 = "Y"

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

debugbreak()

dw_1.reset()
dw_1.setredraw( false )
dw_1.retrieve( ls_sdate, ls_edate, ls_locno, ls_area, ls_top15, ls_iall, ls_oall, is_itemno, is_qa )
dw_1.setredraw( true )

if dw_1.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터 존재하지 않습니다.")
else
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	
//	cbx_1.checked = false		// 집계보기
	dw_1.visible  = true
	dw_4.visible  = false	
	
	ls_col = dwo.name
end if

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체

choose case dwo.name
	case "base_qty"
		this.SelectText(1, LenA(GetText()) + 2)		// 전체선택
end choose

end event

type dw_6 from datawindow within w_irlocationstock_m
integer x = 955
integer y = 1512
integer width = 2642
integer height = 484
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocationstock_sos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_6"

setnull(is_itemno)
setnull(is_qa)

end event

type cbx_iotype from checkbox within w_irlocationstock_m
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

type st_1 from statictext within w_irlocationstock_m
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

type st_2 from statictext within w_irlocationstock_m
integer x = 46
integer y = 600
integer width = 2784
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

type pb_2 from picturebutton within w_irlocationstock_m
integer x = 3744
integer y = 708
integer width = 389
integer height = 104
integer taborder = 270
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "돋움체"
string text = "==> 찾기"
vtextalign vtextalign = vcenter!
end type

event clicked;// ==> 찾기
string ls_itemno, ls_qa
long   ll_row, ll_find
datawindow dw_sos, dw_tar

if cbx_2.checked = true then
	dw_sos = dw_1
	dw_tar = dw_5
else
	dw_sos = dw_4
	dw_tar = dw_6
end if

ll_row = dw_sos.getrow()
if ll_row < 1 or ll_row > dw_sos.rowcount() then RETURN

ls_itemno = dw_sos.object.item_no[ll_row]
ls_qa     = dw_sos.object.qa[ll_row]

ll_find = dw_tar.Find( "item_no = '" + ls_itemno + "' and qa = '" + ls_qa + "' " , 1, dw_tar.RowCount() )
if ll_find > 0 then
	dw_tar.scrolltorow( ll_find )
else
	if MessageBox("확인", "동일한 품목과 규격이 존재하지 않습니다.", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	else
		ll_find = dw_tar.Find( "item_no = '" + ls_itemno + "' " , 1, dw_tar.RowCount() )
		if ll_find > 0 then
			dw_tar.scrolltorow( ll_find )
		else
			MessageBox("확인", "동일한 품목이 존재하지 않습니다.")
		end if
	end if
end if

end event

type st_5 from statictext within w_irlocationstock_m
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

type pb_4 from picturebutton within w_irlocationstock_m
integer x = 3744
integer y = 532
integer width = 786
integer height = 140
integer taborder = 280
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전일재고 집계작업"
vtextalign vtextalign = vcenter!
end type

event clicked;// 전일재고 집계작업
string  ls_area, ls_locno, ls_sdate, ls_errtext, ls_itemno, ls_qa
decimal ld_bfqty, ld_rcptqty, ld_issueqty, ld_qoh
long    ll_row, ll_cnt

dw_3.accepttext()
dw_area.accepttext()

ls_sdate = em_1.text
ls_area  = dw_area.object.area[1]
ls_locno = dw_3.object.loc_no[1]

ll_row = dw_2.retrieve( ls_locno, ls_sdate )
if ll_row < 1 then
	MessageBox("확인","해당하는 일자의 저장소 데이터가 존재하지 않습니다.")
	RETURN
else
	dw_2.visible  = true
	if MessageBox("확인", "집계작업을 반영하고 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		hpb_1.visible = true
		for ll_row = 1 to dw_2.rowcount()
			hpb_1.position = (ll_row / dw_2.rowcount()) * 100			
			
			ls_itemno   = dw_2.object.item_no[ll_row]
			ls_qa       = dw_2.object.qa[ll_row]
			ld_bfqty    = dw_2.object.bf_qty[ll_row]
			ld_rcptqty  = dw_2.object.rcpt_qty[ll_row]
			ld_issueqty = dw_2.object.issue_qty[ll_row]
			ld_qoh      = ld_bfqty + ld_rcptqty - ld_issueqty
			
			SELECT count(*) INTO :ll_cnt FROM INEODAY_LOC 
			 WHERE cdate = replace(:ls_sdate,'/','') AND loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa;
			if ll_cnt = 0 then
				INSERT INTO INEODAY_LOC ( cdate, item_no, qa, loc_no, before_qty, rcpt_qty, issue_qty,qoh ) 
				VALUES ( replace(:ls_sdate,'/',''), :ls_itemno, :ls_qa, :ls_locno, :ld_bfqty, :ld_rcptqty, :ld_issueqty, :ld_qoh );
				if sqlca.sqlcode <> 0 then
					ls_errtext = SQLCA.SQLErrText
					rollback;
					MessageBox("확인","지점재고 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)
					RETURN
				else
					COMMIT;
				end if		
			else
				UPDATE INEODAY_LOC 
					SET rcpt_qty = :ld_rcptqty, issue_qty= :ld_issueqty
				 WHERE cdate = replace(:ls_sdate,'/','') AND loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa;
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
		dw_2.visible  = false
		hpb_1.visible = false
		MessageBox("확인","전일재고 집계작업 완료")
	end if
end if

end event

type hpb_1 from hprogressbar within w_irlocationstock_m
integer x = 2446
integer y = 728
integer width = 1280
integer height = 68
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type dw_7 from datawindow within w_irlocationstock_m
integer x = 1184
integer y = 1672
integer width = 2277
integer height = 456
integer taborder = 290
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocationstock_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_7"

setnull(is_itemno)
setnull(is_qa)

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

This.scrolltorow( row )
This.SelectRow(0, False)
This.SelectRow( row, NOT This.IsSelected( row ) )

end event

type rb_1 from radiobutton within w_irlocationstock_m
integer x = 3328
integer y = 332
integer width = 357
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
string text = "입출내역"
boolean checked = true
end type

event clicked;// 입출내역
if this.checked = true then
	dw_1.visible = true
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = false
	
	cbx_2.visible = true		// SOURCE DATA
	cbx_3.visible = false	// 재고조정 내용
	cbx_2.checked = false
	cbx_2.triggerevent( clicked! )
end if

pb_retrieve.postevent( clicked! )

end event

type rb_2 from radiobutton within w_irlocationstock_m
integer x = 3703
integer y = 332
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
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = false

	cbx_2.visible = false	// SOURCE DATA
	cbx_3.visible = true		// 재고조정 내용
	cbx_3.checked = false
	cbx_3.triggerevent( clicked! )
end if

pb_retrieve.postevent( clicked! )

end event

type rb_3 from radiobutton within w_irlocationstock_m
integer x = 4082
integer y = 332
integer width = 453
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
string text = "일재고현황"
end type

event clicked;// 일재고현황
if this.checked = true then
	dw_1.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_6.visible = false
	dw_7.visible = true

	cbx_2.visible = false
	cbx_3.visible = false
end if

pb_retrieve.postevent( clicked! )

end event

type st_6 from statictext within w_irlocationstock_m
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

