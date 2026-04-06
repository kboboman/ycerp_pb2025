$PBExportHeader$w_iractio_r.srw
$PBExportComments$실사차이보고서(2000/09/04,이인호)
forward
global type w_iractio_r from w_inheritance
end type
type dw_4 from datawindow within w_iractio_r
end type
type sle_1 from singlelineedit within w_iractio_r
end type
type rb_1 from radiobutton within w_iractio_r
end type
type rb_2 from radiobutton within w_iractio_r
end type
type st_2 from statictext within w_iractio_r
end type
type rb_3 from radiobutton within w_iractio_r
end type
type rb_4 from radiobutton within w_iractio_r
end type
type ddlb_3 from dropdownlistbox within w_iractio_r
end type
type rb_5 from radiobutton within w_iractio_r
end type
type rb_6 from radiobutton within w_iractio_r
end type
type em_1 from editmask within w_iractio_r
end type
type st_4 from statictext within w_iractio_r
end type
type cbx_1 from checkbox within w_iractio_r
end type
type pb_excel from picturebutton within w_iractio_r
end type
type cb_1 from commandbutton within w_iractio_r
end type
type em_2 from editmask within w_iractio_r
end type
type st_3 from statictext within w_iractio_r
end type
type ddlb_fld from dropdownlistbox within w_iractio_r
end type
type ddlb_dwtitles from dropdownlistbox within w_iractio_r
end type
type st_1 from statictext within w_iractio_r
end type
type ddlb_op from dropdownlistbox within w_iractio_r
end type
type sle_value from singlelineedit within w_iractio_r
end type
type cb_2 from commandbutton within w_iractio_r
end type
type cb_3 from commandbutton within w_iractio_r
end type
type cb_4 from commandbutton within w_iractio_r
end type
type cb_5 from commandbutton within w_iractio_r
end type
type dw_3 from datawindow within w_iractio_r
end type
type gb_4 from groupbox within w_iractio_r
end type
type dw_5 from datawindow within w_iractio_r
end type
type cbx_edit from checkbox within w_iractio_r
end type
type dw_6 from datawindow within w_iractio_r
end type
type st_vertical from u_splitbar_vertical within w_iractio_r
end type
type st_horizontal from u_splitbar_horizontal within w_iractio_r
end type
type gb_5 from groupbox within w_iractio_r
end type
type gb_6 from groupbox within w_iractio_r
end type
end forward

global type w_iractio_r from w_inheritance
integer y = 36
integer width = 4046
integer height = 2492
string title = "실사차이 보고서(w_iractio_r)"
dw_4 dw_4
sle_1 sle_1
rb_1 rb_1
rb_2 rb_2
st_2 st_2
rb_3 rb_3
rb_4 rb_4
ddlb_3 ddlb_3
rb_5 rb_5
rb_6 rb_6
em_1 em_1
st_4 st_4
cbx_1 cbx_1
pb_excel pb_excel
cb_1 cb_1
em_2 em_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
dw_3 dw_3
gb_4 gb_4
dw_5 dw_5
cbx_edit cbx_edit
dw_6 dw_6
st_vertical st_vertical
st_horizontal st_horizontal
gb_5 gb_5
gb_6 gb_6
end type
global w_iractio_r w_iractio_r

type variables
//
datawindowchild idwc_loc

st_print  i_print
int ii_fil = 0, ii_sw = 0, iWidth
string  is_dw

end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();// 필터링
string ls_filter, ls_add

ls_filter = ""
choose case ii_fil
	case 0, 1
		ls_filter = ""
	case 2
		ls_filter = " (qoh <> 0 or eom_qoh <> 0) "
	case 3
		ls_filter = " (eom_qoh <> 0) "
	case 4
		ls_filter = " (qoh <> 0) "
	case 5
		ls_filter = " (def_qty <> 0) "
end choose

//
if cbx_1.checked = true then		// 차이수량이
	if trim(ls_filter) = "" or isnull(ls_filter) then
		ls_add = ""
	else
		ls_add = " and "
	end if
	ls_filter = ls_filter + ls_add + "abs(def_qty) >= integer('" + em_1.text + "')"
end if

dw_1.setfilter(ls_filter)
dw_1.filter()

end subroutine

on w_iractio_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.sle_1=create sle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.ddlb_3=create ddlb_3
this.rb_5=create rb_5
this.rb_6=create rb_6
this.em_1=create em_1
this.st_4=create st_4
this.cbx_1=create cbx_1
this.pb_excel=create pb_excel
this.cb_1=create cb_1
this.em_2=create em_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_3=create dw_3
this.gb_4=create gb_4
this.dw_5=create dw_5
this.cbx_edit=create cbx_edit
this.dw_6=create dw_6
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.ddlb_3
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.em_1
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.cbx_1
this.Control[iCurrent+14]=this.pb_excel
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.em_2
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.ddlb_fld
this.Control[iCurrent+19]=this.ddlb_dwtitles
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.ddlb_op
this.Control[iCurrent+22]=this.sle_value
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cb_4
this.Control[iCurrent+26]=this.cb_5
this.Control[iCurrent+27]=this.dw_3
this.Control[iCurrent+28]=this.gb_4
this.Control[iCurrent+29]=this.dw_5
this.Control[iCurrent+30]=this.cbx_edit
this.Control[iCurrent+31]=this.dw_6
this.Control[iCurrent+32]=this.st_vertical
this.Control[iCurrent+33]=this.st_horizontal
this.Control[iCurrent+34]=this.gb_5
this.Control[iCurrent+35]=this.gb_6
end on

on w_iractio_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.sle_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.ddlb_3)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.em_1)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.pb_excel)
destroy(this.cb_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.gb_4)
destroy(this.dw_5)
destroy(this.cbx_edit)
destroy(this.dw_6)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

/////////////////////////////////////////////////////////////////////////////////////
// register objects with vertical splitbar
st_vertical.of_set_leftobject(dw_1)

st_vertical.of_set_rightobject(dw_3)
st_vertical.of_set_rightobject(dw_6)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_6 )
st_horizontal.of_set_bottomobject( dw_3 )
st_horizontal.of_set_minsize(250, 250)
/////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_defloc, ls_locno

SELECT def_loc INTO :ls_defloc FROM area WHERE area_no = :gs_area;

ddlb_3.text    = "전체"
ddlb_3.enabled = false
//cbx_2.enabled = false		// 중점관리품목만

// 실사전
rb_5.checked = true
rb_5.triggerevent( clicked! )

pb_save.visible  = false		// 저장
cbx_edit.visible = false		// 조정

if GF_PERMISSION("저장소재고_ZERO권한", gs_userid) = "Y" then
	SELECT rtrim(bigo) INTO :ls_locno
	  FROM codemst 
	 WHERE type = '저장소재고_ZERO권한' AND use_yn = 'Y' AND item_cd = :gs_userid;
	if isnull(ls_locno) OR ls_locno = "" then
	else
		if ls_defloc = ls_locno OR ls_locno = "ALL" then cbx_edit.visible = true
	end if

	st_vertical.visible   = true
	st_horizontal.visible = true
	
	dw_3.visible   = true		// 월별재고
	dw_3.object.loc_name.width = 0
	
	dw_5.visible   = false		// 일별재고
	dw_5.object.loc_name.width = 0
	
	dw_6.visible   = true		// 일별재고(조정)
	dw_6.object.loc_name.width = 0	
else
	st_vertical.visible   = false
	st_horizontal.visible = false
	
	dw_3.visible   = false		// 월별재고
	dw_5.visible   = false		// 일별재고
	dw_6.visible   = false		// 일별재고(조정)
end if

dw_4.visible   = false		// 출력

dw_4.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)

// 저장소
dw_2.settransobject(sqlca)
dw_2.insertrow(0)  
dw_2.getchild("loc_no", idwc_loc)

idwc_loc.settransobject(sqlca)
if GF_PERMISSION("실사차이_보고서(전체)", gs_userid) = 'Y' then
	idwc_loc.insertrow(1)
	idwc_loc.setitem(1,"loc_no",  "%")
	idwc_loc.setitem(1,"loc_name","전체")
	idwc_loc.setitem(1,"loc_type","N")
	idwc_loc.accepttext()
end if
idwc_loc.setfilter("loc_type = 'N'")	// 사내 필터링
idwc_loc.filter()

dw_2.object.loc_no[1] = ls_defloc
dw_2.accepttext()

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT TOP 1 convert(char(10),dateadd(day, -1, dateadd(month, 1,(convert(char(6),getdate(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM login;

if Day(today()) > 10 then
	em_2.text = string(today(),"yyyy/mm")
else
	em_2.text = string( RelativeDate(today(), - Day(today()) ),"yyyy/mm")	// 전달말일
end if


end event

event resize;call super::resize;//
gb_5.width  = newwidth  - (gb_5.x * 2)

iWidth      = newwidth  - (gb_5.x * 2)

if GF_PERMISSION("저장소재고_ZERO권한", gs_userid) = "Y" then
	dw_1.width  = iWidth * 0.51
else
	dw_1.width  = iWidth
end if
dw_1.height = newheight - dw_1.y - gb_5.x

st_vertical.x      = dw_1.x + (iWidth * 0.51)
st_vertical.height = dw_1.height

// 일별재고(조정)
dw_6.x      = st_vertical.x + st_vertical.width		// (dw_1.width * 0.5)
dw_6.y      = dw_1.y
dw_6.width  = newwidth - dw_6.x - gb_5.x
dw_6.height = dw_1.height / 2

st_horizontal.x      = st_vertical.x + st_vertical.width
st_horizontal.y      = dw_6.y + dw_6.height
st_horizontal.width  = dw_6.width

// 월별재고
dw_3.x      = dw_6.x
dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = dw_6.width
dw_3.height = newheight - dw_3.y - gb_3.x

// 일별재고
dw_5.x      = dw_6.x
dw_5.y      = dw_6.y
dw_5.width  = dw_6.width
dw_5.height = dw_6.height


end event

type pb_save from w_inheritance`pb_save within w_iractio_r
integer x = 3730
integer y = 272
integer taborder = 30
end type

event pb_save::clicked;call super::clicked;// 저장
long     ll_row, ll_dw3cnt, ll_dw6cnt, ll_itemloc
boolean  lb_save
string   ls_locno, ls_itemno, ls_itemnm, ls_qa, ls_cyear, ls_cmon, ls_sdate, ls_edate
decimal  ld_receiptqty, ld_issueqty, ld_qoh
datetime ldt_date

// 저장소
dw_2.accepttext()

ls_locno = trim(dw_2.object.loc_no[1])
if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("오류","저장소를 입력하십시오.",exclamation!)
	return	
end if

// 실사년월
ls_cyear = LeftA(em_2.text,4)
ls_cmon  = RightA(em_2.text,2)
ldt_date = datetime( date(ls_cyear + "/" + ls_cmon + "/" + "01"), time("00:00:000") )

// 시작일,종료일 월말일자 계산하기(한달더하고 하루빼기)
ls_sdate = string(ldt_date,"yyyymmdd")
SELECT top 1 DATEAdd(day,  -1, DATEAdd(month, 1, :ldt_date) ) INTO :ldt_date FROM login;
ls_edate = string(ldt_date, "yyyymmdd")

// 품목
ll_row    = dw_1.getrow()
ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_name[ll_row]


ll_dw3cnt = 0 ; ll_dw6cnt = 0

// 저장소재고(월별)
dw_3.accepttext()
for ll_row = 1 to dw_3.rowcount()
	if dw_3.object.rcpt_qty[ll_row] <> dw_3.object.rcptqty[ll_row] then
		ll_dw3cnt = ll_dw3cnt + 1
	end if

	if dw_3.object.issue_qty[ll_row] <> dw_3.object.issueqty[ll_row] then
		ll_dw3cnt = ll_dw3cnt + 1
	end if
	
	if dw_3.object.qoh[ll_row] <> dw_3.object.qohqty[ll_row] then
		ll_dw3cnt = ll_dw3cnt + 1
	end if
next

// dw_5 : 저장소재고(일별) 합계

// 저장소재고(일별)
dw_6.accepttext()
for ll_row = 1 to dw_6.rowcount()
	if dw_6.object.rcpt_qty[ll_row] <> dw_6.object.rcptqty[ll_row] then
		ll_dw6cnt = ll_dw6cnt + 1
	end if

	if dw_6.object.issue_qty[ll_row] <> dw_6.object.issueqty[ll_row] then
		ll_dw6cnt = ll_dw6cnt + 1
	end if
next

if MessageBox("확인","저장 하시겠습니까?.", Exclamation!, YesNo!, 2) = 1 then
	if WF_Update2( dw_6, dw_3, "N" ) = true then
		for ll_itemloc = 1 to dw_3.rowcount()
			ls_itemno     = dw_3.object.item_no[ll_itemloc]
			ls_qa         = dw_3.object.qa[ll_itemloc]
			
			ld_receiptqty = dw_3.object.rcpt_qty[ll_itemloc]
			ld_issueqty   = dw_3.object.issue_qty[ll_itemloc]
			ld_qoh        = dw_3.object.qoh[ll_itemloc]
			
			if isnull(ls_itemno) OR ls_itemno = "" OR isnull(ls_qa) OR ls_qa = "" then
			else
				UPDATE itemloc
					SET receipt_qty = :ld_receiptqty, issue_qty = :ld_issueqty, qoh = :ld_qoh
				 WHERE loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa;
				if sqlca.sqlcode = 0 then
					COMMIT;
				else
					ROLLBACK;
					MessageBox("오류","itemloc UPDATE중 DB오류 발생.",exclamation!)
					RETURN
				end if
			end if
		next
		MessageBox("확인","저장완료")
		dw_3.retrieve( ls_locno, ls_cyear, ls_cmon,  ls_itemno, ls_qa )	// INYEOYM
		dw_6.retrieve( ls_locno, ls_sdate, ls_edate, ls_itemno, ls_qa )	// INYEODAY
	else
		MessageBox("확인","저장실패")					
	end if
end if

cbx_edit.checked = false
cbx_edit.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_iractio_r
string tag = "d_iractio_s"
integer x = 32
integer y = 620
integer width = 3045
integer taborder = 50
string title = "d_iractio_s3"
string dataobject = "d_iractio_s3"
boolean hsplitscroll = true
end type

event dw_1::rbuttondown;call super::rbuttondown;//
if isnull(row) OR row < 1 then RETURN

gs_where lst_where
int li_col

li_col = this.GetClickedColumn()

lst_where.str1 = trim(this.object.item_no[row])
lst_where.str2 = trim(this.object.qa[row])
lst_where.str3 = trim(dw_2.object.loc_no[1])
lst_where.name = trim(this.object.item_name[row])

m_manager NewMenu
int li_int

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_inaudit.PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
if gs_print_control = "INAUDIT" then
	OpenWithParm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = Message.PowerObjectParm
end if

end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 
string   ls_locno, ls_itemno, ls_qa, ls_cyear, ls_cmon, ls_sdate, ls_edate
long     ll_row, ll_find
datetime ldt_date

if isnull(row) OR row < 1 then RETURN

// 저장소
dw_2.accepttext()
ls_locno = trim(dw_2.object.loc_no[1])
if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("오류","저장소를 입력하십시오.",exclamation!)
	RETURN
end if

// 실사년월
ls_cyear = LeftA(em_2.text,4)
ls_cmon  = RightA(em_2.text,2)
ldt_date = datetime( date(ls_cyear + "/" + ls_cmon + "/" + "01"), time("00:00:000") )

// 시작일
ls_sdate = string(ldt_date,"yyyymmdd")
// 종료일 월말일자 계산하기(한달더하고 하루빼기)
SELECT top 1 DATEAdd(day,  -1, DATEAdd(month, 1, :ldt_date) ) INTO :ldt_date FROM login;
ls_edate = string(ldt_date, "yyyymmdd")

// 품목, 규격
ls_itemno = this.object.item_no[row]
ls_qa     = this.object.qa[row]

dw_3.reset() ; dw_6.reset()
dw_3.retrieve( ls_locno, ls_cyear, ls_cmon,  ls_itemno, ls_qa )	// INYEOYM
dw_6.retrieve( ls_locno, ls_sdate, ls_edate, ls_itemno, ls_qa )	// INYEODAY	

end event

event dw_1::getfocus;call super::getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event dw_1::losefocus;call super::losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)

end event

type st_title from w_inheritance`st_title within w_iractio_r
integer x = 32
integer y = 20
integer width = 1179
string text = "실사차이 보고서"
end type

type st_tips from w_inheritance`st_tips within w_iractio_r
end type

type pb_compute from w_inheritance`pb_compute within w_iractio_r
boolean visible = false
integer x = 1687
integer y = 68
integer height = 140
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_iractio_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iractio_r
integer x = 3081
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iractio_r
integer x = 2889
integer taborder = 150
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow  = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 실사결과 보고서를 출력합니다." 
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95'
OpensheetWithParm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iractio_r
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_iractio_r
boolean visible = false
integer x = 2967
integer y = 48
integer taborder = 170
end type

type pb_insert from w_inheritance`pb_insert within w_iractio_r
boolean visible = false
integer x = 2775
integer y = 48
integer taborder = 190
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iractio_r
integer x = 2487
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string   ls_itemno,  ls_qa,  ls_name, ls_pyear, ls_pmon
string   ls_locno, ls_cyear, ls_cmon,  ls_sdate, ls_edate
long     ll_row
datetime ldt_date

ddlb_3.text    = "전체"
ddlb_3.enabled = true

pb_save.visible = false

// 저장소
dw_2.accepttext()

ls_locno = trim(dw_2.object.loc_no[1])
if isnull(ls_locno) OR ls_locno = "" then
	MessageBox("오류","저장소를 입력하십시오.",exclamation!)
	RETURN	
end if

// 실사년월
ls_cyear = LeftA(em_2.text,4)
ls_cmon  = RightA(em_2.text,2)
ldt_date = datetime( date(ls_cyear + "/" + ls_cmon + "/" + "01"), time("00:00:000") )

// 시작일
ls_sdate = string(ldt_date,"yyyymmdd")
// 월말일자 계산하기(한달더하고 하루빼기)
SELECT top 1 DATEAdd(day,  -1, DATEAdd(month, 1, :ldt_date) ) INTO :ldt_date FROM login;
// 종료일 
ls_edate = string(ldt_date, "yyyymmdd")

// 품명/코드
if rb_1.checked = true then	// 코드
	ls_itemno = sle_1.text + "%"
	ls_name = "%"
else									// 품명
	ls_itemno = "%"
	if isnull(sle_1.text) OR trim(sle_1.text) = "" then
		ls_name = "%"
	else
		ls_name = "%" + sle_1.text + "%"
	end if
end if

if ls_cmon = "01" then
	ls_pyear = string(integer(ls_cyear) - 1)
	ls_pmon  = "12"
else
	ls_pyear = ls_cyear
	ls_pmon  = RightA("00" + string(integer(ls_cmon) - 1),2)
end if

dw_3.reset()
dw_6.reset()
dw_1.retrieve(ls_locno, ls_cyear, ls_cmon, ls_itemno, ls_name )		// ITEMLOC
dw_1.ShareData(dw_4)

dw_5.retrieve( ls_locno, ls_sdate, ls_edate, ls_itemno, ls_name )	// INYEODAY

MessageBox("확인","조회완료")

end event

type gb_3 from w_inheritance`gb_3 within w_iractio_r
integer x = 32
integer width = 1637
integer height = 208
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iractio_r
integer x = 1705
integer width = 2254
integer height = 208
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 16711680
string text = "실사후"
end type

type gb_1 from w_inheritance`gb_1 within w_iractio_r
integer x = 2446
integer y = 8
integer width = 864
integer height = 212
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_iractio_r
integer x = 91
integer y = 324
integer width = 983
integer height = 88
integer taborder = 60
string dataobject = "d_irsilsainput_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
string ls_defloc, ls_locno

this.accepttext()

// 조정
cbx_edit.visible = false

ls_defloc = trim(data)

SELECT rtrim(bigo) INTO :ls_locno
  FROM codemst 
 WHERE type = '저장소재고_ZERO권한' AND use_yn = 'Y' AND item_cd = :gs_userid;
if isnull(ls_locno) OR ls_locno = "" then
else
	if ls_defloc = ls_locno OR ls_locno = "ALL" then cbx_edit.visible = true		// 조정
end if

pb_retrieve.triggerevent( clicked! )

end event

type dw_4 from datawindow within w_iractio_r
integer x = 46
integer y = 164
integer width = 96
integer height = 68
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_iractio_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_iractio_r
integer x = 1723
integer y = 116
integer width = 667
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S"
OpenWithParm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  Message.PowerObjectParm

//istr_select.str1[ll_cnt] = dw_1.object.item_no[ll_row]
//istr_select.str2[ll_cnt] = dw_1.object.uom[ll_row]
//istr_select.name[ll_cnt] = dw_1.object.item_name[ll_row]

if lst_whitemret.chk = "Y" then
	//this.text = lst_whitemret.str1[1]		// item_no
	this.text = lst_whitemret.name[1]		// item_name
end if
this.setfocus()

end event

type rb_1 from radiobutton within w_iractio_r
integer x = 1742
integer y = 56
integer width = 215
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
string text = "코드"
end type

event clicked;string ls_sort

if ii_sw = 0 then
	ii_sw = 1
	ls_sort = "itemloc_item_no A, itemloc_qa A, groupitem_item_name A "
else
	ii_sw = 0
	ls_sort = "itemloc_item_no D, itemloc_qa A, groupitem_item_name A "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type rb_2 from radiobutton within w_iractio_r
integer x = 2021
integer y = 56
integer width = 215
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
string text = "명"
boolean checked = true
end type

event clicked;string ls_sort

if ii_sw = 0 then
	ii_sw = 1
	ls_sort = "groupitem_item_name A, itemloc_item_no A, itemloc_qa A "
else
	ii_sw = 0
	ls_sort = "groupitem_item_name D, itemloc_item_no A, itemloc_qa A "
end if
dw_1.SetSort(ls_sort)
dw_1.Sort( )
	
end event

type st_2 from statictext within w_iractio_r
integer x = 1093
integer y = 340
integer width = 155
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
boolean enabled = false
string text = "년월"
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_iractio_r
integer x = 87
integer y = 268
integer width = 233
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
string text = "사내"
boolean checked = true
end type

event clicked;// 사내
dw_2.object.loc_no[1] = ""
idwc_loc.setfilter("loc_type = 'N'")
idwc_loc.filter()

end event

type rb_4 from radiobutton within w_iractio_r
integer x = 320
integer y = 268
integer width = 233
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
string text = "외주"
end type

event clicked;// 외주
dw_2.object.loc_no[1] = ""
idwc_loc.setfilter("loc_type = 'Y'")
idwc_loc.filter()

end event

type ddlb_3 from dropdownlistbox within w_iractio_r
integer x = 2427
integer y = 312
integer width = 1061
integer height = 604
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","월말재고or실사수량이 있는것만","월말재고가 0 이아닌것","실사수량이 0 이 아닌것","차이수량이 0 이 아닌것"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
ii_fil = index
wf_fil()
end event

type rb_5 from radiobutton within w_iractio_r
integer x = 1344
integer y = 60
integer width = 302
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
string text = "실사전"
boolean checked = true
end type

event clicked;// 실사전
dw_1.dataobject = "d_iractio_s3"
dw_1.settransobject(sqlca)

end event

type rb_6 from radiobutton within w_iractio_r
integer x = 1344
integer y = 136
integer width = 302
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
string text = "실사후"
end type

event clicked;// 실사후
dw_1.dataobject = "d_iractio_s"
dw_1.settransobject(sqlca)

end event

type em_1 from editmask within w_iractio_r
integer x = 1746
integer y = 340
integer width = 402
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0"
end type

event modified;
wf_fil()
end event

type st_4 from statictext within w_iractio_r
integer x = 2199
integer y = 308
integer width = 215
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "이상인제품만"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_iractio_r
integer x = 1746
integer y = 284
integer width = 407
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
string text = "차이수량이"
end type

event clicked;
wf_fil()
end event

type pb_excel from picturebutton within w_iractio_r
event mousemove pbm_mousemove
integer x = 2697
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
datawindow dwxls

dwxls = dw_1

if dwxls.rowcount() < 1 then RETURN

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dwxls.SaveAsascii(ls_DocName)
	end if
end if

end event

type cb_1 from commandbutton within w_iractio_r
integer x = 2523
integer y = 504
integer width = 526
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;//
string ls_sdate, ls_edate
long   ll_row
int    ls_a
gs_where lst_where

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_a = dw_1.GetClickedColumn()

ls_sdate = em_2.text + "/01"
SELECT top 1 dbo.UF_GETLASTDAY( replace(:ls_sdate,'/','') ) INTO :ls_edate FROM login;

lst_where.str1 = trim(dw_1.object.item_no[ll_row])
lst_where.str2 = trim(dw_1.object.qa[ll_row])
lst_where.str3 = trim(dw_2.object.loc_no[1])

lst_where.str4 = ls_sdate  // 시작일
lst_where.str5 = ls_edate	// 종료일
lst_where.name = trim(dw_1.object.item_name[ll_row])
lst_where.chk  = "DO"

gs_print_control = "INAUDIT"
if gs_print_control = 'INAUDIT' then
	OpenWithParm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

type em_2 from editmask within w_iractio_r
integer x = 1280
integer y = 316
integer width = 357
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 65535
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

event modified;//
pb_retrieve.triggerevent( clicked! )

end event

type st_3 from statictext within w_iractio_r
integer x = 78
integer y = 512
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

type ddlb_fld from dropdownlistbox within w_iractio_r
integer x = 265
integer y = 496
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

type ddlb_dwtitles from dropdownlistbox within w_iractio_r
integer x = 306
integer y = 508
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

type st_1 from statictext within w_iractio_r
integer x = 763
integer y = 512
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

type ddlb_op from dropdownlistbox within w_iractio_r
integer x = 933
integer y = 496
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

type sle_value from singlelineedit within w_iractio_r
integer x = 1253
integer y = 504
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

type cb_2 from commandbutton within w_iractio_r
integer x = 1824
integer y = 504
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

	case "dw_3"
		arg_dw  = dw_3

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_iractio_r
integer x = 1989
integer y = 504
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

	case "dw_3"
		arg_dw  = dw_3

	case "dw_5"
		arg_dw  = dw_5
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_iractio_r
integer x = 2153
integer y = 504
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

	case "dw_3"
		arg_dw  = dw_3

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_iractio_r
integer x = 2318
integer y = 504
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

	case "dw_3"
		arg_dw  = dw_3

	case "dw_5"
		arg_dw  = dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_iractio_r
integer x = 3141
integer y = 1512
integer width = 818
integer height = 840
integer taborder = 120
boolean bringtotop = true
string title = "저장소재고(월별)"
string dataobject = "d_iractio_ym"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()) + 2)		// 선택

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 찾기
long   ll_row, ll_find
string ls_itemno, ls_qa, ls_find

ls_itemno = this.object.item_no[row]
ls_qa     = this.object.qa[row]

//ls_find = "itemloc_item_no = '" + ls_itemno + "' AND itemloc_qa = '" + ls_qa + "' "
//ll_find = dw_1.find( ls_find, 1, dw_1.rowcount() )
//if ll_find > 0 then
//	dw_1.scrolltorow( ll_find )
//end if

ls_find = "item_no = '" + ls_itemno + "' AND qa = '" + ls_qa + "' "
ll_find = dw_5.find( ls_find, 1, dw_5.rowcount() )
if ll_find > 0 then
	dw_5.scrolltorow( ll_find )
end if

end event

event getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)

end event

type gb_4 from groupbox within w_iractio_r
integer x = 1303
integer y = 8
integer width = 366
integer height = 212
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_5 from datawindow within w_iractio_r
integer x = 174
integer y = 164
integer width = 96
integer height = 68
integer taborder = 50
boolean bringtotop = true
string title = "저장소재고(일별)"
string dataobject = "d_iractio_daysum"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()) + 2)		// 선택

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_5"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)

end event

type cbx_edit from checkbox within w_iractio_r
integer x = 3662
integer y = 508
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "조정"
end type

event clicked;// 조정
if dw_1.rowcount() < 1 then
	this.checked = false
	RETURN
end if

if this.checked = true then
	dw_2.enabled    = false
	dw_2.object.loc_no.Background.Color = 67108864

	pb_save.visible = true	

	dw_3.object.rcpt_qty.TabSequence  = 10
	dw_3.object.issue_qty.TabSequence = 20
	dw_3.object.qoh.TabSequence       = 30
	
	dw_6.object.loc_name.width = 0
	dw_6.object.rcpt_qty.TabSequence  = 10
	dw_6.object.issue_qty.TabSequence = 20	
else
	dw_2.enabled    = true
	dw_2.object.loc_no.Background.Color = rgb(255, 255, 255)
	
	pb_save.visible = false

	dw_3.object.rcpt_qty.TabSequence  = 0
	dw_3.object.issue_qty.TabSequence = 0
	dw_3.object.qoh.TabSequence       = 0
	
	dw_6.object.loc_name.width = 0
	dw_6.object.rcpt_qty.TabSequence  = 0
	dw_6.object.issue_qty.TabSequence = 0	
end if

end event

type dw_6 from datawindow within w_iractio_r
integer x = 3141
integer y = 620
integer width = 818
integer height = 816
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_iractio_day"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
this.Object.DataWindow.Color = rgb(215, 228, 188)

end event

event losefocus;//
this.Object.DataWindow.Color = rgb(255,255,255)

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

is_dw = "dw_6"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event itemfocuschanged;// DataWinodw AutoSelection = true 대체
this.SelectText(1, LenA(GetText()) + 2)		// 선택

end event

type st_vertical from u_splitbar_vertical within w_iractio_r
integer x = 3099
integer y = 620
integer height = 1736
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
st_horizontal.width = dw_3.width

end event

type st_horizontal from u_splitbar_horizontal within w_iractio_r
integer x = 3141
integer y = 1456
integer width = 818
boolean bringtotop = true
end type

type gb_5 from groupbox within w_iractio_r
integer x = 32
integer y = 448
integer width = 3927
integer height = 160
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type gb_6 from groupbox within w_iractio_r
integer x = 1701
integer y = 8
integer width = 718
integer height = 212
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

