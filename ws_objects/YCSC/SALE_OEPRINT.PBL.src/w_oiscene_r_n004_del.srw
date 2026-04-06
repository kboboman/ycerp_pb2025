$PBExportHeader$w_oiscene_r_n004_del.srw
$PBExportComments$현장별 자재투입현황(1998/05/16, 정재수)
forward
global type w_oiscene_r_n004_del from w_inheritance
end type
type gb_6 from groupbox within w_oiscene_r_n004_del
end type
type gb_5 from groupbox within w_oiscene_r_n004_del
end type
type gb_4 from groupbox within w_oiscene_r_n004_del
end type
type em_1 from editmask within w_oiscene_r_n004_del
end type
type em_2 from editmask within w_oiscene_r_n004_del
end type
type st_1 from statictext within w_oiscene_r_n004_del
end type
type dw_3 from datawindow within w_oiscene_r_n004_del
end type
type rb_1 from radiobutton within w_oiscene_r_n004_del
end type
type rb_2 from radiobutton within w_oiscene_r_n004_del
end type
type dw_4 from datawindow within w_oiscene_r_n004_del
end type
type cbx_1 from checkbox within w_oiscene_r_n004_del
end type
end forward

global type w_oiscene_r_n004_del from w_inheritance
integer y = 112
integer width = 3630
integer height = 2172
string title = "현장별 자재투입현황(w_oiscene_r)"
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
em_1 em_1
em_2 em_2
st_1 st_1
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
dw_4 dw_4
cbx_1 cbx_1
end type
global w_oiscene_r_n004_del w_oiscene_r_n004_del

type variables
string is_dw3sql, is_dw4sql
datawindowchild idwc_cust
//transaction SQLCA2

end variables

on w_oiscene_r_n004_del.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_4=create dw_4
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.gb_5
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.rb_2
this.Control[iCurrent+10]=this.dw_4
this.Control[iCurrent+11]=this.cbx_1
end on

on w_oiscene_r_n004_del.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_4)
destroy(this.cbx_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

SQLCA2 = CREATE Transaction // 적당한 위치에서.. 예를 들면 App의 Open Event.. 

SQLCA2.DBMS       = 'MSS Microsoft SQL Server 6.x'
SQLCA2.Database   = 'yccon'
SQLCA2.LogID      = 'db_user'
SQLCA2.LogPass    = ""
SQLCA2.ServerName = "203.229.212.12"
SQLCA2.UserID     = ""
SQLCA2.DBPass     = ""
SQLCA2.Lock       = ""
SQLCA2.DbParm     = "CursorLock='ReadOnly'"

SQLCA2.Lock = "ReadOnly"
CONNECT using SQLCA2;

IF SQLCA2.SQLCode = -1 THEN
	MessageBox("오류", "Database와 연결이 되지 않습니다.~r~n" + &
              "에러코드: " + String(SQLCA2.SQLDBCode ) + "~r~n" + &
              "에러내용: " + SQLCA2.SQLErrText, StopSign!, OK!, 1 )
END IF
this.x = 1
this.y = 1
//dw_1.SetTransObject(SQLCA2)
dw_2.SetTransObject(SQLCA2)
dw_3.settransobject(SQLCA2)
dw_4.settransobject(SQLCA2)

dw_1.insertrow(0)  //춘 19
dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)


em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

is_dw3sql = dw_3.describe("datawindow.table.select")
is_dw4sql = dw_4.describe("datawindow.table.select")
dw_4.visible = false
end event

type pb_save from w_inheritance`pb_save within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 40
end type

type dw_1 from w_inheritance`dw_1 within w_oiscene_r_n004_del
integer x = 41
integer y = 712
integer width = 864
integer height = 92
integer taborder = 60
string dataobject = "d_oiscenecust_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;call super::itemchanged;string ls_cust_no
date ld_start, ld_end

if rb_2.checked = true then
	if em_1.text = '' then
		messagebox("확인","조회기간을 입력하세요!",information!)
		return 1
	elseif em_2.text = '' then
		messagebox("확인","조회기간을 입력하세요!",information!)
		return 1
	elseif em_1.text > em_2.text then
		messagebox("확인","조회기간을 잘못 입력하였습니다!",information!)
		return 1
	end if
	
	ld_start = date(em_1.text)
	ld_end = date(em_2.text)
	this.accepttext()
	ls_cust_no = this.getitemstring(this.getrow(), "cust_no")
	
	dw_2.retrieve(ls_cust_no, ld_start, ld_end)
end if
end event

event dw_1::itemerror;call super::itemerror;this.object.cust_no[1] = ''

if em_1.text = '' then
	em_1.setfocus()
elseif em_2.text = '' then
	em_2.setfocus()
elseif em_1.text > em_2.text then
	em_1.setfocus()
end if

return 2
end event

type dw_2 from w_inheritance`dw_2 within w_oiscene_r_n004_del
integer x = 37
integer y = 896
integer width = 869
integer height = 1136
integer taborder = 70
string dataobject = "d_oiscene_s"
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;if row < 1 then return
if cbx_1.checked = false then 
	pb_retrieve.postevent(clicked!)
else
	this.SelectRow(row, NOT this.IsSelected(row))
end if

end event

event dw_2::rowfocuschanged;if currentrow < 1 then return
if cbx_1.checked = false then 
	pb_retrieve.postevent(clicked!)
end if

end event

type st_title from w_inheritance`st_title within w_oiscene_r_n004_del
integer width = 1550
string text = "현장별 자재투입현황"
end type

type st_tips from w_inheritance`st_tips within w_oiscene_r_n004_del
end type

type pb_compute from w_inheritance`pb_compute within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiscene_r_n004_del
integer x = 3355
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiscene_r_n004_del
integer x = 3163
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print
string ls_cust_no, ls_scene_code[100], ls_scene, ls_dono
date ld_start, ld_end
long ll_row, ll_count, ll_idx, ll_cnt
int li_int
dec ld_chk

dw_1.accepttext()
dw_2.accepttext()

ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if


ld_start = date(em_1.text)
ld_end = date(em_2.text)

if rb_1.checked = true then
	dw_4.dataobject = 'd_oiscenerep_r1'
	dw_4.settransobject(SQLCA2)
	dw_4.retrieve(ls_cust_no, ld_start, ld_end)
else
	if dw_2.rowcount() < 1 then return
	
	ll_count = 0
	FOR ll_cnt = 1 to dw_2.rowcount()
		if DW_2.isselected(ll_cnt) then
   	   ll_count ++
		end if
	next
	for ll_cnt = 1 to 100
		ls_scene_code[ll_cnt] = ''
	next
	if ll_count < 1 then
		ls_scene_code[1] = trim(dw_2.object.spot_code[dw_2.getrow()])
	ELSE
		for ll_cnt = 1 to dw_2.rowcount()
			if dw_2.isselected(ll_cnt) then
				ls_scene_code[ll_cnt] = ls_scene_code[ll_cnt] + trim(dw_2.object.spot_code[ll_cnt]) 
			end if
		next
//		ls_scene_code = trim(ls_scene_code)
//		li_int = len(ls_scene_code)
//		ls_scene_code = "(" + left(ls_scene_code[], li_int -1 ) + ")"
	END IF
	dw_4.dataobject = 'd_oiscenerep_r2'
	dw_4.settransobject(SQLCA2)
	dw_4.retrieve(ls_cust_no, ls_scene_code, ld_start, ld_end)
end if

if dw_4.rowcount() < 1 then return

dw_4.GroupCalc()

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=80'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

event constructor;//w_repsuper w_print
//st_print l_print
//string ls_cust_no, ls_scene_code, ls_scene, ls_dono
//date ld_start, ld_end
//long ll_row, ll_count, ll_idx
//dec ld_chk
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
//if isnull(ls_cust_no) or ls_cust_no = '' then
//	messagebox("확인","거래처를 선택하세요!",information!)
//	dw_1.setfocus()
//	return
//end if
//
//if em_1.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_1.setfocus()
//	return
//elseif em_2.text = '' then
//	messagebox("확인","출고기간을 입력하세요!",information!)
//	em_2.setfocus()
//	return
//elseif em_1.text > em_2.text then
//	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
//	em_1.setfocus()
//	return
//end if
//
//dw_4.SetRedraw(false)
//
//
//
//ld_start = date(em_1.text)
//ld_end = date(em_2.text)
//
//if rb_1.checked = true then
//	dw_4.dataobject = 'd_oiscenerep_r1'
//	dw_4.settransobject(SQLCA2)
//	dw_4.retrieve(ls_cust_no, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next	
//else
//	if dw_2.rowcount() < 1 then return
//	
//	ls_scene_code = dw_2.object.spot_code[dw_2.getrow()]
//	dw_4.dataobject = 'd_oiscenerep_r2'
//	dw_4.settransobject(SQLCA2)
//	dw_4.retrieve(ls_cust_no, ls_scene_code, ld_start, ld_end)
////   dw_4.object.do_do_rate[1] = dw_4.object.do_cash[1] 
////	dw_4.object.do_do_total[1] = dw_4.object.do_cash[1] 
////	ls_dono = dw_4.object.do_do_no[1] 
////	ls_scene = dw_4.object.do_spot_code[1] 
////	ld_chk = dw_4.object.do_ship_amount[1]
////	for ll_count = 1 to dw_4.rowcount()
////		dw_4.object.scene_scene_code[ll_count] = em_1.text
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text
////	   dw_4.object.scene_scene_code[ll_count] =  dw_2.object.spot_code[dw_2.getrow()]
////		dw_4.object.scene_scene_charge[ll_count] = em_2.text 
////		if ls_scene <> dw_4.object.do_spot_code[ll_count] then
////			dw_4.object.do_do_rate[ll_count] = 0
////			ls_scene = dw_4.object.do_spot_code[ll_count] 
////		end if	
////		ll_idx = ll_count - 1
////		if ls_dono <> dw_4.object.do_do_no[ll_count] then
////   		dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] + &
////	   	                                   (dw_4.object.do_cash[ll_count] * 1.1)
////		  	dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] + &
////			                                     (dw_4.object.do_cash[ll_count] * 1.1)
////	   	ls_dono = dw_4.object.do_do_no[ll_count] 
////		ELSE
////			dw_4.object.do_do_rate[ll_count] = dw_4.object.do_do_rate[ll_idx] 
////			dw_4.object.do_do_total[ll_count] = dw_4.object.do_do_total[ll_idx] 
////		end if
////	next		
//end if
//
//if dw_4.rowcount() < 1 then return
//
//
//	dw_4.object.cc_start[1] = string(em_1.text)
//	dw_4.object.cc_end[1] = string(em_2.text)
//
//l_print.st_datawindow = dw_4
//l_print.st_print_sheet = " 프린트용지 : B4"
//l_print.st_print_desc = " 이 프로그램은 현장별 자재투입현황을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
//                   'Datawindow.Zoom=100'
//dw_4.SetRedraw(TRUE)
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_oiscene_r_n004_del
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiscene_r_n004_del
integer x = 713
integer y = 480
integer taborder = 80
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_cust_no, ls_start, ls_end, ls_scene_code, ls_where, ls_sql
long ll_count, ll_cnt
int li_int

dw_1.accepttext()
dw_2.accepttext()

ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if em_1.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

ls_start = em_1.text
ls_end = em_2.text

if rb_1.checked = true then
	ls_where = " and do.cust_no = ~~'" + ls_cust_no + "~~'" + &
				  " and do.do_date between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
else
	if dw_2.rowcount() < 1 then return
	
	ll_count = 0
	FOR ll_cnt = 1 to dw_2.rowcount()
		if DW_2.isselected(ll_cnt) then
   	   ll_count ++
		end if
	next
	if ll_count < 1 then
		ls_scene_code = "~~'" + trim(dw_2.object.spot_code[dw_2.getrow()]) + "~~'"
	ELSE
		ls_scene_code = ''
		for ll_cnt = 1 to dw_2.rowcount()
			if dw_2.isselected(ll_cnt) then
				ls_scene_code = ls_scene_code + "~~'" + trim(dw_2.object.spot_code[ll_cnt]) + "~~', "
			end if
		next
		ls_scene_code = trim(ls_scene_code)
		li_int = LenA(ls_scene_code)
		ls_scene_code = LeftA(ls_scene_code, li_int -1 )
	END IF
	ls_where = " and do.cust_no = ~~'" + ls_cust_no + "~~'" + &
				  " and do.spot_code IN (" + ls_scene_code + ")" + &	
				  " and do.do_date between ~~'" + ls_start + "~~' and ~~'" + ls_end + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
end if
dw_3.settransobject(SQLCA2)
dw_3.modify(ls_sql)
dw_3.retrieve()
dw_3.GroupCalc()

	
end event

type gb_3 from w_inheritance`gb_3 within w_oiscene_r_n004_del
integer x = 23
integer y = 832
integer width = 896
integer height = 1220
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "현장"
end type

type gb_2 from w_inheritance`gb_2 within w_oiscene_r_n004_del
integer x = 23
integer y = 660
integer width = 896
integer height = 152
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "판매거래처"
end type

type gb_1 from w_inheritance`gb_1 within w_oiscene_r_n004_del
integer x = 3131
integer width = 434
integer taborder = 0
end type

type gb_6 from groupbox within w_oiscene_r_n004_del
integer x = 23
integer y = 224
integer width = 896
integer height = 152
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type gb_5 from groupbox within w_oiscene_r_n004_del
integer x = 928
integer y = 224
integer width = 2638
integer height = 1828
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type gb_4 from groupbox within w_oiscene_r_n004_del
integer x = 23
integer y = 384
integer width = 896
integer height = 264
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "출고기간"
end type

type em_1 from editmask within w_oiscene_r_n004_del
integer x = 73
integer y = 440
integer width = 357
integer height = 80
integer taborder = 30
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
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oiscene_r_n004_del
integer x = 270
integer y = 536
integer width = 357
integer height = 80
integer taborder = 50
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
string displaydata = "himage"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_oiscene_r_n004_del
integer x = 137
integer y = 520
integer width = 110
integer height = 76
boolean bringtotop = true
integer textsize = -22
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oiscene_r_n004_del
integer x = 946
integer y = 276
integer width = 2601
integer height = 1756
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_oiscenerep_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_oiscene_r_n004_del
integer x = 133
integer y = 280
integer width = 283
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_2.reset()
dw_3.reset()




end event

type rb_2 from radiobutton within w_oiscene_r_n004_del
integer x = 544
integer y = 280
integer width = 265
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "부분"
end type

event clicked;string ls_cust_no
date ld_start, ld_end

dw_2.reset()
dw_3.reset()

dw_1.accepttext()
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
if ls_cust_no = '' or isnull(ls_cust_no) then
	return
else
	if em_1.text = '' then
		return 
	elseif em_2.text = '' then
		return 
	elseif em_1.text > em_2.text then
		return 
	end if
	
	ld_start = date(em_1.text)
	ld_end = date(em_2.text)
	dw_2.retrieve(ls_cust_no, ld_start, ld_end)
end if
	




end event

type dw_4 from datawindow within w_oiscene_r_n004_del
integer x = 1728
integer y = 56
integer width = 101
integer height = 96
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_oiscenerep_r1"
boolean livescroll = true
end type

type cbx_1 from checkbox within w_oiscene_r_n004_del
integer x = 407
integer y = 828
integer width = 384
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
string text = "복수선택"
end type

event clicked;if this.checked = false then
	dw_2.SelectRow(0, false)
end if
end event

