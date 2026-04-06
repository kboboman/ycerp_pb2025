$PBExportHeader$w_oecustdiary_m.srw
$PBExportComments$고객방문일지(1998/03/23, 정재수)
forward
global type w_oecustdiary_m from w_inheritance
end type
type tab_1 from tab within w_oecustdiary_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_3 cb_3
cb_2 cb_2
dw_4 dw_4
end type
type tabpage_2 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_5 dw_5
cb_1 cb_1
end type
type tab_1 from tab within w_oecustdiary_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type rb_1 from radiobutton within w_oecustdiary_m
end type
type rb_2 from radiobutton within w_oecustdiary_m
end type
type em_2 from editmask within w_oecustdiary_m
end type
type em_1 from editmask within w_oecustdiary_m
end type
type cbx_2 from checkbox within w_oecustdiary_m
end type
type sle_1 from singlelineedit within w_oecustdiary_m
end type
type dw_6 from datawindow within w_oecustdiary_m
end type
type dw_3 from datawindow within w_oecustdiary_m
end type
type rb_3 from radiobutton within w_oecustdiary_m
end type
type cb_4 from commandbutton within w_oecustdiary_m
end type
type dw_7 from datawindow within w_oecustdiary_m
end type
type st_13 from statictext within w_oecustdiary_m
end type
type ddlb_fld from dropdownlistbox within w_oecustdiary_m
end type
type st_14 from statictext within w_oecustdiary_m
end type
type ddlb_op from dropdownlistbox within w_oecustdiary_m
end type
type sle_value from singlelineedit within w_oecustdiary_m
end type
type cb_10 from commandbutton within w_oecustdiary_m
end type
type cb_14 from commandbutton within w_oecustdiary_m
end type
type cb_15 from commandbutton within w_oecustdiary_m
end type
type cb_16 from commandbutton within w_oecustdiary_m
end type
type ddlb_1 from dropdownlistbox within w_oecustdiary_m
end type
end forward

global type w_oecustdiary_m from w_inheritance
integer x = 23
integer y = 84
integer width = 4695
integer height = 2780
string title = "고객방문 일지(w_oecustdiary_m)"
tab_1 tab_1
rb_1 rb_1
rb_2 rb_2
em_2 em_2
em_1 em_1
cbx_2 cbx_2
sle_1 sle_1
dw_6 dw_6
dw_3 dw_3
rb_3 rb_3
cb_4 cb_4
dw_7 dw_7
st_13 st_13
ddlb_fld ddlb_fld
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
ddlb_1 ddlb_1
end type
global w_oecustdiary_m w_oecustdiary_m

type variables
st_print i_print
gst_bdwhere ist_where
string is_scenesql,is_select
datawindowchild idwc_user, idwc_cust, idwc_bdcust
string is_err = '0', is_fil = 'C'

end variables

on w_oecustdiary_m.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.em_2=create em_2
this.em_1=create em_1
this.cbx_2=create cbx_2
this.sle_1=create sle_1
this.dw_6=create dw_6
this.dw_3=create dw_3
this.rb_3=create rb_3
this.cb_4=create cb_4
this.dw_7=create dw_7
this.st_13=create st_13
this.ddlb_fld=create ddlb_fld
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.ddlb_1=create ddlb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.cbx_2
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.dw_3
this.Control[iCurrent+10]=this.rb_3
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.dw_7
this.Control[iCurrent+13]=this.st_13
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.st_14
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_10
this.Control[iCurrent+19]=this.cb_14
this.Control[iCurrent+20]=this.cb_15
this.Control[iCurrent+21]=this.cb_16
this.Control[iCurrent+22]=this.ddlb_1
end on

on w_oecustdiary_m.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.cbx_2)
destroy(this.sle_1)
destroy(this.dw_6)
destroy(this.dw_3)
destroy(this.rb_3)
destroy(this.cb_4)
destroy(this.dw_7)
destroy(this.st_13)
destroy(this.ddlb_fld)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.ddlb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_7.settransobject(sqlca)
tab_1.tabpage_1.dw_4.settransobject(sqlca)
tab_1.tabpage_2.dw_5.settransobject(sqlca)
tab_1.tabpage_1.dw_4.sharedata(tab_1.tabpage_2.dw_5)
tab_1.tabpage_1.dw_4.sharedata(dw_6)

dw_2.insertrow(1)
dw_2.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_2.object.user[1] = '%'
dw_3.visible = false

em_1.text = string( today(),'yyyy/mm/dd')
em_2.text = string( today(),'yyyy/mm/dd')
cbx_2.triggerevent(clicked!)

tab_1.tabpage_1.dw_4.getchild("cust_no", idwc_cust)
tab_1.tabpage_1.dw_4.getchild("bdcust_no", idwc_bdcust)
idwc_bdcust.settransobject(sqlca)
gs_ds_whcustret.sharedata(idwc_cust)
ddlb_1.text = '현장명' //'거래처'
end event

event resize;call super::resize;//
long nheight

nheight = newheight - this.height

gb_2.width  = this.width  - 124
gb_2.height = this.height - 1588

dw_1.width  = this.width  - 192
dw_1.height = this.height - 1752

tab_1.y     = gb_2.y + gb_2.height + 20
tab_1.width = this.width  - 124
tab_1.height= 1188

cb_4.y      = tab_1.y + 7
//gb_2.height = gb_2.height + nheight
//dw_1.height = dw_1.height + nheight
//
end event

type pb_save from w_inheritance`pb_save within w_oecustdiary_m
integer x = 4187
integer y = 68
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

tab_1.tabpage_1.dw_4.accepttext()
if tab_1.tabpage_1.dw_4.rowcount() < 1 then return

wf_update2(dw_1, tab_1.tabpage_1.dw_4, 'Y')
	
end event

type dw_1 from w_inheritance`dw_1 within w_oecustdiary_m
integer x = 69
integer y = 384
integer width = 4503
integer height = 1028
string dataobject = "d_oecustdiary_s0"
end type

event dw_1::rowfocuschanged;string ls_user, ls_cust
date ldt_diary
long ll_row, li_seq

ll_row = this.getrow()
if ll_row < 1 then return

ls_user = this.object.emp_no[ll_row]
li_seq = this.object.seq_no[ll_row]
ldt_diary = date(this.object.diary_date[ll_row])
tab_1.tabpage_1.dw_4.retrieve(ls_user, ldt_diary, li_seq)
//tab_1.tabpage_2.dw_5.retrieve(ls_user, ldt_diary, li_seq)
	
end event

event dw_1::itemchanged;long ll_row
string ls_null, ls_data, ls_data2
datetime ldt_check

setnull(ls_null)
this.accepttext()
this.setredraw(false)
ll_row = this.getrow()
CHOOSE CASE dwo.name
	CASE 'process_flag'
		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
		CHOOSE CASE data
			CASE "Y"
				this.object.approve_top[ll_row] = gs_userid
//				this.object.check_date[1] = wf_today()
			CASE "N"
				//안승환상무 : 19000011
				//조용재이사 : 19840901
				//and gs_userid <> '19000011' and gs_userid <> 'cwj' and gs_userid = 'bj5879' and gs_userid = '470409'
				if ( gs_userid <> '1999010s' and gs_userid <> '19840901'  and gs_userid = 'parkji'  and gs_userid = '19981214' &
				     and gs_userid = 'ssch3015' and gs_userid = 'yun0093' and gs_userid = 'kgyoung' ) and (ls_data = 'Y' ) then
					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
					return 1
				end if
				this.object.approve_top[ll_row] = ls_null
//				setnull(ldt_check)
//				this.object.check_date[1] = ldt_check
		END CHOOSE
	CASE 'chk_team'
		CHOOSE CASE data
			CASE "Y"
				this.object.approve_team[ll_row] = gs_userid
			CASE "N"
				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
				if gs_userid <> ls_data2 and ls_data = 'Y' then
					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
					return 1
				end if
				this.object.approve_team[ll_row] = ls_null
		END CHOOSE
END CHOOSE
this.setredraw(true)


end event

event dw_1::itemerror;string  ls_ori_process_flag

CHOOSE CASE dwo.name
	CASE 'process_flag'
				this.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
				this.object.process_flag[row] = this.getitemstring(row, 'process_flag',  Primary!, TRUE)
					
	CASE 'chk_team'
				this.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
				this.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
	CASE else
END CHOOSE
this.setredraw(true)
return 2


end event

event dw_1::clicked;call super::clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "team_team_name"
		ls_col  = "팀"
		ls_text = string(this.object.team_team_name[row])
	case "login_user_name"
		ls_col  = "담당자"
		ls_text = string(this.object.login_user_name[row])
	case "prt_chk"
		ls_col  = "출력"
		ls_text = string(this.object.prt_chk[row])
	case "diary_date"
		ls_col  = "방문일자"
		ls_text = string(this.object.diary_date[row])
	case "urgent"
		ls_col  = "긴급"
		ls_text = string(this.object.urgent[row])
	case "process_flag"
		ls_col  = "팀장"
		ls_text = string(this.object.process_flag[row])
	case "approve_top"
		ls_col  = "임원"
		ls_text = string(this.object.approve_top[row])
	case "cust_name"
		ls_col  = "현장명"
		ls_text = string(this.object.cust_name[row])
	case "bdcust_name"
		ls_col  = "거래처"
		ls_text = string(this.object.bdcust_name[row])
	case "desc1"
		ls_col  = "제목"
		ls_text = string(this.object.desc1[row])
end choose

choose case ls_col
	case "출력", "방문일자", "긴급", "미입고수량"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_fld.text  = ls_col
sle_value.text = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_oecustdiary_m
integer x = 1577
integer y = 60
integer width = 667
integer height = 76
integer taborder = 80
string dataobject = "d_whlogin_c"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_oecustdiary_m
integer x = 46
integer y = 64
integer width = 1070
integer height = 140
string text = "고객방문 일지"
end type

type st_tips from w_inheritance`st_tips within w_oecustdiary_m
end type

type pb_compute from w_inheritance`pb_compute within w_oecustdiary_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_oecustdiary_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_oecustdiary_m
integer x = 4389
integer y = 68
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oecustdiary_m
boolean visible = false
integer x = 2807
integer y = 60
integer taborder = 150
end type

type pb_cancel from w_inheritance`pb_cancel within w_oecustdiary_m
boolean visible = false
integer x = 2482
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_oecustdiary_m
integer x = 3995
integer y = 68
integer taborder = 170
end type

event pb_delete::clicked;dwitemstatus l_status
long ll_row

if tab_1.tabpage_1.dw_4.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

l_status = tab_1.tabpage_1.dw_4.getitemstatus(1, 0, primary!)
ll_row = dw_1.getrow()
if l_status = newmodified! then
	dw_1.rowsmove(ll_row, ll_row, Primary!, dw_1, 1, Filter!)
else	
	tab_1.tabpage_1.dw_4.deleterow(1)
	if wf_update1(tab_1.tabpage_1.dw_4,"Y") then
		dw_1.rowsmove(ll_row, ll_row, Primary!, dw_1, 1, Filter!)
	else
		return
	end if
end if	
//pb_retrieve.postevent(clicked!)
end event

type pb_insert from w_inheritance`pb_insert within w_oecustdiary_m
integer x = 3803
integer y = 68
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;datetime ld_todate
long   ll_row
int    li_seq
string ls_team


tab_1.tabpage_1.dw_4.reset()
ll_row = tab_1.tabpage_1.dw_4.insertrow(0)
tab_1.tabpage_1.dw_4.scrolltorow(ll_row)
tab_1.tabpage_1.dw_4.setcolumn('diary_date')
tab_1.tabpage_1.dw_4.setfocus()

ll_row = tab_1.tabpage_2.dw_5.reset()
tab_1.tabpage_2.dw_5.insertrow(0)
tab_1.tabpage_2.dw_5.scrolltorow(ll_row)

ld_todate = wf_today()

//dw_3.accepttext()
tab_1.tabpage_1.dw_4.setitem(1,'emp_no',gs_userid)
tab_1.tabpage_1.dw_4.setitem(1,'diary_date',ld_todate)
tab_1.tabpage_1.dw_4.setitem(1,'sys_date',ld_todate)

SELECT max(seq_no) INTO :li_seq FROM custdiary
 WHERE emp_no = :gs_userid  AND diary_date = :ld_todate;
if isnull(li_seq) then li_seq = 0

tab_1.tabpage_1.dw_4.setitem(1,'seq_no',li_seq + 1)
SELECT team_code INTO :ls_team FROM login WHERE user_id = :gs_userid;
tab_1.tabpage_1.dw_4.setitem(1,'team_code',ls_team)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oecustdiary_m
integer x = 3611
integer y = 68
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_emp_no, ls_chk, ls_cust, ls_com, ls_all, ls_title
date ld_start, ld_end

dw_2.accepttext()
ls_emp_no = dw_2.object.user[1]

if rb_1.checked = true then		// 기결
	ls_chk = 'Y'
elseif rb_2.checked = true then	// 미결
	ls_chk = 'N'
else										// 전체
	ls_chk = '%'
end if

if is_fil  = 'C' then
	ls_com   = '%'
	ls_title = '%'
	if trim(sle_1.text) = '' then
		ls_cust = '%'
	else
		ls_cust = '%' + trim(sle_1.text) + '%'
	end if
elseif is_fil  = 'D' then
	ls_cust  = '%'
	ls_title = '%'
	if trim(sle_1.text) = '' then
		ls_com = '%'
	else
		ls_com = '%' + trim(sle_1.text) + '%'
	end if
ELSE
	ls_cust = '%'
   ls_com  = '%'
	if trim(sle_1.text) = '' then
		ls_title = '%'
	else
		ls_title = '%' + trim(sle_1.text) + '%'
	end if
end if

if cbx_2.checked = true then		// 전체기간
	ls_all = 'Y'
else
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	ls_all   = 'N'
end if

dw_1.setredraw(false)
tab_1.tabpage_1.dw_4.setredraw(false)
tab_1.tabpage_2.dw_5.setredraw(false)
dw_1.reset()
tab_1.tabpage_1.dw_4.reset()
tab_1.tabpage_2.dw_5.reset()

dw_1.retrieve(ls_emp_no, ls_chk, ls_cust, ls_com, ld_start, ld_end, ls_all, ls_title)
if ls_emp_no = '%' then
	dw_1.setsort('team_team_name, login_user_name, diary_date D')
else
	dw_1.setsort('diary_date D')
end if
dw_1.sort()
dw_1.setredraw(true)
tab_1.tabpage_1.dw_4.setredraw(true)
tab_1.tabpage_2.dw_5.setredraw(true)
this.default = false

end event

type gb_3 from w_inheritance`gb_3 within w_oecustdiary_m
integer x = 1559
integer y = 20
integer width = 1989
integer height = 216
integer taborder = 90
integer textsize = -9
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_oecustdiary_m
integer x = 41
integer y = 244
integer width = 4571
integer height = 1192
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oecustdiary_m
integer x = 3575
integer y = 20
integer width = 1033
integer height = 216
end type

type tab_1 from tab within w_oecustdiary_m
integer x = 41
integer y = 1456
integer width = 4571
integer height = 1188
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4535
integer height = 1060
long backcolor = 79741120
string text = "방문내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
cb_3 cb_3
cb_2 cb_2
dw_4 dw_4
end type

on tabpage_1.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_4=create dw_4
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_4}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_4)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 3890
integer y = 24
integer width = 311
integer height = 92
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "설계정보"
end type

event clicked;//
if tab_1.tabpage_1.dw_4.getrow() < 1 then return

gs_winname = 'w_oecustdiary'
gs_var1    = tab_1.tabpage_1.dw_4.object.bdcust_name[tab_1.tabpage_1.dw_4.getrow()]
if IsValid(w_bdinfo_m_sale) = true then close(w_bdinfo_m_sale)
openwithparm(w_bdinfo_m_sale, ist_where)

end event

type cb_2 from commandbutton within tabpage_1
integer x = 4206
integer y = 24
integer width = 311
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
end type

event clicked;string ls_user
date ldt_diary
long ll_row, li_seq

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_user = dw_1.object.emp_no[ll_row]
li_seq = dw_1.object.seq_no[ll_row]
ldt_diary = date(dw_1.object.diary_date[ll_row])
dw_3.retrieve(ls_user, ldt_diary, li_seq)

w_repsuper w_print
st_print l_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

//(i_print.class, i_print.sdate, i_print.yymm1)
l_print.name = 'd_oecustdiary_r'
l_print.class = ls_user
l_print.sdate = ldt_diary
l_print.da1 = li_seq

	
l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


//string ls_user
//date ldt_diary
//long ll_row, li_seq
//
//ll_row = dw_1.getrow()
//if ll_row < 1 then return
//
//ls_user = dw_1.object.emp_no[ll_row]
//li_seq = dw_1.object.seq_no[ll_row]
//ldt_diary = date(dw_1.object.diary_date[ll_row])
//dw_3.retrieve(ls_user, ldt_diary, li_seq)
//
//w_repsuper w_print
//st_print l_print
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//if dw_3.rowcount() < 1 then
//	return
//end if
//if messagebox("출력","기본프린터로 바로 출력됩니다. 출력하시겠습니까?",information!, OKCancel!, 2) = 2 then
//	return
//end if
//dw_3.print()



end event

type dw_4 from datawindow within tabpage_1
event clicked pbm_dwnlbuttonclk
event editchanged pbm_dwnchanging
event getfocus pbm_dwnsetfocus
integer x = 64
integer y = 4
integer width = 3488
integer height = 1048
integer taborder = 31
string dataobject = "d_oecustdiary_m"
boolean border = false
end type

event itemchanged;dwitemstatus l_status
date ld_todate
int li_seq
long ll_row

this.accepttext()
l_status = tab_1.tabpage_1.dw_4.getitemstatus(1, 0, primary!)
ll_row = dw_1.getrow()

choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", idwc_cust)
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
		
	case 'bdcust_no'
		this.getchild("bdcust_no", idwc_bdcust)
//		this.object.bdcust_name[1] = idwc_bdcust.getitemstring(idwc_bdcust.getrow(), "comname")
		this.object.bdcust_name[1] = idwc_bdcust.getitemstring(idwc_bdcust.getrow(), "project")
		
	case 'diary_date'
		this.accepttext()
		ld_todate = date(this.object.diary_date[1])
		if ll_row > 0 then
			if l_status = DataModified! then
				dw_1.object.diary_date[ll_row] = ld_todate
			end if
		end if
		select max(seq_no) into :li_seq from custdiary
		 where emp_no = :gs_userid
			and diary_date = :ld_todate;
		if isnull(li_seq) then li_seq = 0
		tab_1.tabpage_1.dw_4.setitem(1,'seq_no', li_seq + 1)
end choose
this.accepttext()


end event

event rbuttondown;gs_whcustret_str lst_whcustret
CHOOSE CASE dwo.name
	CASE 'cust_no'
		
		openwithparm(w_whcustret_w, lst_whcustret)
		lst_whcustret =  message.powerobjectparm
		
		this.object.cust_no[1] = lst_whcustret.cust_no
		this.object.cust_name[1] = lst_whcustret.cust_name
	CASE 'bdcust_no'
		
		openwithparm(w_whbdcustret_w, lst_whcustret)
		lst_whcustret =  message.powerobjectparm
		
		this.object.bdcust_no[1] = lst_whcustret.cust_no
		this.object.bdcust_name[1] = lst_whcustret.cust_name
END CHOOSE

end event

type tabpage_2 from userobject within tab_1
event dragdrop pbm_uondragdrop
integer x = 18
integer y = 112
integer width = 4535
integer height = 1060
long backcolor = 79741120
string text = "결재내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Table!"
long picturemaskcolor = 553648127
dw_5 dw_5
cb_1 cb_1
end type

event dragdrop;int aa

aa = 1
end event

on tabpage_2.create
this.dw_5=create dw_5
this.cb_1=create cb_1
this.Control[]={this.dw_5,&
this.cb_1}
end on

on tabpage_2.destroy
destroy(this.dw_5)
destroy(this.cb_1)
end on

type dw_5 from datawindow within tabpage_2
integer x = 64
integer y = 12
integer width = 3401
integer height = 1048
integer taborder = 1
string dataobject = "d_oecustdiary_m1"
boolean border = false
end type

event itemchanged;//long ll_row
//string ls_null, ls_data, ls_data2
//datetime ldt_check
//
//setnull(ls_null)
//this.accepttext()
//this.setredraw(false)
//ll_row = this.getrow()
//CHOOSE CASE dwo.name
//	CASE 'process_flag'
//		ls_data = this.getitemstring(ll_row, 'process_flag',  Primary!, TRUE)
//		CHOOSE CASE data
//			CASE "Y"
//				this.object.approve_top[ll_row] = gs_userid
////				this.object.check_date[1] = wf_today()
//			CASE "N"
//				//안승환상무 : 19000011
//				//조용재이사 : 19840901
//				if ( gs_userid <> '1999010s' and gs_userid <> '19000011' and gs_userid <> '19840901' ) and (ls_data = 'Y' ) then
//					messagebox("확인","판매 본부장님께서만 변경하실수있습니다..")
//					return 1
//				end if
//				this.object.approve_top[ll_row] = ls_null
//				setnull(ldt_check)
////				this.object.check_date[1] = ldt_check
//		END CHOOSE
//	CASE 'chk_team'
//		CHOOSE CASE data
//			CASE "Y"
//				this.object.approve_team[ll_row] = gs_userid
//			CASE "N"
//				ls_data = this.getitemstring(ll_row, 'chk_team',  Primary!, TRUE)
//				ls_data2 = this.getitemstring(ll_row, 'approve_team',  Primary!, TRUE)
//				if gs_userid <> ls_data2 and ls_data = 'Y' then
//					messagebox("확인","결재하신분이 아니므로 바꿀수가 없습니다.")
//					return 1
//				end if
//				this.object.approve_team[ll_row] = ls_null
//		END CHOOSE
//END CHOOSE
//this.setredraw(true)
//
//
end event

event itemerror;//string  ls_ori_process_flag
//
//CHOOSE CASE dwo.name
//	CASE 'process_flag'
//				this.object.approve_top[row] = this.getitemstring(row, 'approve_top',  Primary!, TRUE)
//				this.object.process_flag[row] = this.getitemstring(row, 'process_flag',  Primary!, TRUE)
//					
//	CASE 'chk_team'
//				this.object.chk_team[row] = this.getitemstring(row, 'chk_team',  Primary!, TRUE)
//				this.object.approve_team[row] = this.getitemstring(row, 'approve_team',  Primary!, TRUE)
//	CASE else
//END CHOOSE
//this.setredraw(true)
//return 2
//
//
end event

type cb_1 from commandbutton within tabpage_2
integer x = 3410
integer y = 4
integer width = 320
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "방문내역"
end type

event clicked;dw_6.visible = true
end event

type rb_1 from radiobutton within w_oecustdiary_m
integer x = 3305
integer y = 156
integer width = 201
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
string text = "기결"
end type

event clicked;tab_1.selecttab(2)
//tab_1.tabpage_1.dw_4.enabled = false
pb_retrieve.postevent(clicked!)

end event

type rb_2 from radiobutton within w_oecustdiary_m
integer x = 3058
integer y = 156
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
string text = "미결"
boolean checked = true
end type

event clicked;tab_1.selecttab(1)
//tab_1.tabpage_1.dw_4.enabled = true
pb_retrieve.postevent(clicked!)

end event

type em_2 from editmask within w_oecustdiary_m
integer x = 2661
integer y = 60
integer width = 352
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if


end event

type em_1 from editmask within w_oecustdiary_m
integer x = 2272
integer y = 60
integer width = 347
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type cbx_2 from checkbox within w_oecustdiary_m
integer x = 3040
integer y = 68
integer width = 352
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
string text = "전체기간"
boolean checked = true
end type

event clicked;em_1.enabled = NOT (this.checked)
em_2.enabled = NOT (this.checked)

end event

type sle_1 from singlelineedit within w_oecustdiary_m
integer x = 2007
integer y = 148
integer width = 773
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_retrieve.default = true
end event

type dw_6 from datawindow within w_oecustdiary_m
boolean visible = false
integer x = 73
integer y = 88
integer width = 3415
integer height = 916
integer taborder = 120
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_oecustdiary_s"
boolean controlmenu = true
boolean resizable = true
boolean livescroll = true
end type

type dw_3 from datawindow within w_oecustdiary_m
integer x = 1376
integer y = 36
integer width = 96
integer height = 76
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oecustdiary_r"
boolean livescroll = true
end type

type rb_3 from radiobutton within w_oecustdiary_m
integer x = 2816
integer y = 156
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
string text = "전체"
end type

event clicked;tab_1.selecttab(1)
//tab_1.tabpage_1.dw_4.enabled = false
pb_retrieve.postevent(clicked!)

end event

type cb_4 from commandbutton within w_oecustdiary_m
integer x = 4256
integer y = 1456
integer width = 315
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택출력"
end type

event clicked;w_repsuper w_print
st_print l_print

long ls_dw1rowcnt, ll_i, ll_j
string ls_esno[]
ls_dw1rowcnt = dw_1.rowcount()
if ls_dw1rowcnt < 1 then return
dw_1.setredraw(false)
dw_2.setredraw(false)
dw_3.setredraw(false)
tab_1.tabpage_1.dw_4.setredraw(false)
tab_1.tabpage_2.dw_5.setredraw(false)
dw_6.setredraw(false)

ll_j = 0
for ll_i = 1 to ls_dw1rowcnt
	if dw_1.object.prt_chk[ll_i] = 'Y' then
		ll_j = ll_j + 1
		ls_esno[ll_j] = trim(string(dw_1.object.diary_date[ll_i], 'yyyymmdd')) + trim(dw_1.object.emp_no[ll_i]) + trim(string(dw_1.object.seq_no[ll_i]))
	end if		
next


//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.setredraw(true)
dw_2.setredraw(true)
dw_3.setredraw(true)
tab_1.tabpage_1.dw_4.setredraw(true)
tab_1.tabpage_2.dw_5.setredraw(true)
dw_6.setredraw(true)
if ll_j = 0 then 
	messagebox('확인', '화면 상단 좌측에서 출력하고자 하는 리스트를 체크하세요.')
	return
end if
dw_7.retrieve(ls_esno)

l_print.st_datawindow = dw_7
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type dw_7 from datawindow within w_oecustdiary_m
boolean visible = false
integer x = 603
integer y = 4
integer width = 87
integer height = 88
integer taborder = 11
boolean bringtotop = true
string title = "none"
string dataobject = "d_oecustdiary_m_prt"
boolean border = false
boolean livescroll = true
end type

type st_13 from statictext within w_oecustdiary_m
integer x = 87
integer y = 308
integer width = 160
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

type ddlb_fld from dropdownlistbox within w_oecustdiary_m
integer x = 261
integer y = 292
integer width = 402
integer height = 532
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"팀","담당자","출력","방문일자","긴급","팀장","임원","현장명","거래처","제목"}
end type

type st_14 from statictext within w_oecustdiary_m
integer x = 681
integer y = 308
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

type ddlb_op from dropdownlistbox within w_oecustdiary_m
integer x = 850
integer y = 292
integer width = 279
integer height = 512
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_oecustdiary_m
integer x = 1143
integer y = 292
integer width = 704
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_oecustdiary_m
integer x = 1856
integer y = 292
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_fld.text) = "" then
	ls_column = ""
else
	string ls_col
	choose case trim(ddlb_fld.text)
		case "팀"
			ls_col  = "team_team_name"
		case "담당자"
			ls_col  = "login_user_name"
		case "출력"
			ls_col  = "prt_chk"
		case "방문일자"
			ls_col  = "diary_date"
		case "긴급"
			ls_col  = "urgent"
		case "팀장"
			ls_col  = "process_flag"
		case "임원"
			ls_col  = "approve_top"
		case "현장명"
			ls_col  = "cust_name"
		case "거래처"
			ls_col  = "bdcust_name"
		case "제목"
			ls_col  = "desc1"
	end choose

	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "diary_date"
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "balqty", "rlse_qty", "janqty"
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_14 from commandbutton within w_oecustdiary_m
integer x = 2007
integer y = 292
integer width = 146
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_fld.text  = "현장명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()
pb_retrieve.postevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_15 from commandbutton within w_oecustdiary_m
integer x = 2158
integer y = 292
integer width = 146
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "팀"
		ls_col  = "team_team_name"
	case "담당자"
		ls_col  = "login_user_name"
	case "출력"
		ls_col  = "prt_chk"
	case "방문일자"
		ls_col  = "diary_date"
	case "긴급"
		ls_col  = "urgent"
	case "팀장"
		ls_col  = "process_flag"
	case "임원"
		ls_col  = "approve_top"
	case "현장명"
		ls_col  = "cust_name"
	case "거래처"
		ls_col  = "bdcust_name"
	case "제목"
		ls_col  = "desc1"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_16 from commandbutton within w_oecustdiary_m
integer x = 2304
integer y = 292
integer width = 146
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "팀"
		ls_col  = "team_team_name"
	case "담당자"
		ls_col  = "login_user_name"
	case "출력"
		ls_col  = "prt_chk"
	case "방문일자"
		ls_col  = "diary_date"
	case "긴급"
		ls_col  = "urgent"
	case "팀장"
		ls_col  = "process_flag"
	case "임원"
		ls_col  = "approve_top"
	case "현장명"
		ls_col  = "cust_name"
	case "거래처"
		ls_col  = "bdcust_name"
	case "제목"
		ls_col  = "desc1"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type ddlb_1 from dropdownlistbox within w_oecustdiary_m
integer x = 1582
integer y = 144
integer width = 416
integer height = 324
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"현장명","거래처","제목"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		is_fil = 'C'
	case 2
		is_fil = 'D'
	case 3
		is_fil = 'T'		
end choose

end event

