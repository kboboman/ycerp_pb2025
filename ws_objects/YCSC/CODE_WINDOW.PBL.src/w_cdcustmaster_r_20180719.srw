$PBExportHeader$w_cdcustmaster_r_20180719.srw
$PBExportComments$거래처 여신현황
forward
global type w_cdcustmaster_r_20180719 from w_inheritance
end type
type em_1 from editmask within w_cdcustmaster_r_20180719
end type
type st_1 from statictext within w_cdcustmaster_r_20180719
end type
type cb_1 from commandbutton within w_cdcustmaster_r_20180719
end type
type dw_3 from datawindow within w_cdcustmaster_r_20180719
end type
type dw_4 from datawindow within w_cdcustmaster_r_20180719
end type
type cbx_1 from checkbox within w_cdcustmaster_r_20180719
end type
type dw_5 from datawindow within w_cdcustmaster_r_20180719
end type
type gb_4 from groupbox within w_cdcustmaster_r_20180719
end type
type dw_6 from datawindow within w_cdcustmaster_r_20180719
end type
type dw_7 from datawindow within w_cdcustmaster_r_20180719
end type
type cbx_open from checkbox within w_cdcustmaster_r_20180719
end type
type dw_24 from datawindow within w_cdcustmaster_r_20180719
end type
type cb_2 from commandbutton within w_cdcustmaster_r_20180719
end type
type dw_8 from datawindow within w_cdcustmaster_r_20180719
end type
type st_salesman from statictext within w_cdcustmaster_r_20180719
end type
type dw_9 from datawindow within w_cdcustmaster_r_20180719
end type
type cbx_2 from checkbox within w_cdcustmaster_r_20180719
end type
type dw_10 from datawindow within w_cdcustmaster_r_20180719
end type
type cb_auto from commandbutton within w_cdcustmaster_r_20180719
end type
type st_2 from statictext within w_cdcustmaster_r_20180719
end type
type dw_salesman from datawindow within w_cdcustmaster_r_20180719
end type
type cbx_zero from checkbox within w_cdcustmaster_r_20180719
end type
end forward

global type w_cdcustmaster_r_20180719 from w_inheritance
integer width = 4421
integer height = 2968
string title = "거래처 여신현황(w_cdcustmaster_r)"
em_1 em_1
st_1 st_1
cb_1 cb_1
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
dw_5 dw_5
gb_4 gb_4
dw_6 dw_6
dw_7 dw_7
cbx_open cbx_open
dw_24 dw_24
cb_2 cb_2
dw_8 dw_8
st_salesman st_salesman
dw_9 dw_9
cbx_2 cbx_2
dw_10 dw_10
cb_auto cb_auto
st_2 st_2
dw_salesman dw_salesman
cbx_zero cbx_zero
end type
global w_cdcustmaster_r_20180719 w_cdcustmaster_r_20180719

type variables
public string is_custno,is_custname
st_print i_print
DataWindowChild idwc_cust, idwc_user, idwc_icube, idwc_cust_name, idwc_custhis

string  is_select,  is_where, is_clause, is_select1, is_dwsql,is_custdorsql
string  is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman
string  is_uflag = 'update'
boolean ib_cancel

end variables

on w_cdcustmaster_r_20180719.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.gb_4=create gb_4
this.dw_6=create dw_6
this.dw_7=create dw_7
this.cbx_open=create cbx_open
this.dw_24=create dw_24
this.cb_2=create cb_2
this.dw_8=create dw_8
this.st_salesman=create st_salesman
this.dw_9=create dw_9
this.cbx_2=create cbx_2
this.dw_10=create dw_10
this.cb_auto=create cb_auto
this.st_2=create st_2
this.dw_salesman=create dw_salesman
this.cbx_zero=create cbx_zero
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.gb_4
this.Control[iCurrent+9]=this.dw_6
this.Control[iCurrent+10]=this.dw_7
this.Control[iCurrent+11]=this.cbx_open
this.Control[iCurrent+12]=this.dw_24
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.dw_8
this.Control[iCurrent+15]=this.st_salesman
this.Control[iCurrent+16]=this.dw_9
this.Control[iCurrent+17]=this.cbx_2
this.Control[iCurrent+18]=this.dw_10
this.Control[iCurrent+19]=this.cb_auto
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.dw_salesman
this.Control[iCurrent+22]=this.cbx_zero
end on

on w_cdcustmaster_r_20180719.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.gb_4)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.cbx_open)
destroy(this.dw_24)
destroy(this.cb_2)
destroy(this.dw_8)
destroy(this.st_salesman)
destroy(this.dw_9)
destroy(this.cbx_2)
destroy(this.dw_10)
destroy(this.cb_auto)
destroy(this.st_2)
destroy(this.dw_salesman)
destroy(this.cbx_zero)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_open, ls_zero, ls_salesman
long   ll_row

cb_1.visible  = false	// ALL
cbx_1.visible = false	// 거래처 상세보기
dw_6.visible  = false	// 거래처 상세
dw_7.visible  = false   // 거래처 비고내역
dw_2.visible  = false	// 여신현황
dw_8.visible  = false	// 이력카드
dw_10.visible = false	// 잔액제로 제외

dw_24.visible = false	// 순수거래처
dw_24.x       = 2446		
dw_24.y       = 456
dw_24.width   = 2222
dw_24.height  = 1456

em_1.text     = string(today(),'yyyy')

if GF_PERMISSION("거래처_이력카드(출력)", gs_userid) = "Y" then
	cb_2.enabled = true
else
	cb_2.enabled = false
end if

if GF_PERMISSION("거래처여신현황_상세보기", gs_userid) = "Y" then
	cbx_1.visible    = true
	cbx_1.checked    = true
	dw_6.visible     = true
	dw_7.visible     = true    // 거래처 비고내역
	cbx_open.checked = true		// 사용불가 제외
end if

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

pb_insert.visible = false
pb_delete.visible = false
pb_save.visible   = false
if GF_PERMISSION("거래처_이력카드(저장)", gs_userid) = "Y" then
	pb_insert.visible = true
	pb_delete.visible = true
	pb_save.visible   = true
end if

pb_save.Enabled   = false	//Insert 버튼 클릭 전에는 비활성화

dw_3.SetTransObject(SQLCA)		// 어음상세(발생)
dw_9.SetTransObject(SQLCA)		// 어음상세(회수)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)		
dw_8.SetTransObject(SQLCA)		
dw_10.SetTransObject(SQLCA)	// 잔액제로 제외
dw_24.SetTransObject(SQLCA)   // 판매거래처 리스트 (090403)

// 담당자
dw_salesman.settransobject(sqlca)	
dw_salesman.insertrow(1)
dw_salesman.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_salesman.object.user[1] = '%'

// 담당자
ls_salesman = "%"		// dw_salesman.object.user[1]

// 거래처
dw_1.settransobject(SQLCA)
dw_1.insertrow(0)
//================================//
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort('cust_no, cust_name')
idwc_cust.sort()
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort('cust_name, cust_no')
idwc_cust_name.sort()
//================================//
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
//================================//

dw_1.setcolumn("cust_name")
dw_1.setfocus()


end event

event resize;call super::resize;//
dw_3.width  = (newwidth  - 123) / 2
dw_3.height = newheight - 1816

dw_9.x      = dw_3.x + dw_3.width + 10
dw_9.width  = (newwidth  - 123) / 2
dw_9.height = newheight - 1816

dw_2.x  = 55
dw_2.y  = 416
dw_2.width  = dw_3.width * 2
dw_2.height = dw_3.height + dw_5.height

dw_8.x  = dw_2.x
dw_8.y  = dw_2.y
dw_8.width  = dw_2.width
dw_8.height = dw_2.height

dw_7.x  = 4320		// 비고내역
dw_7.y  = dw_6.y
dw_7.height = 1244

// 잔액존재업체
dw_10.x  = dw_7.x
dw_10.y  = dw_7.y
dw_10.width  = dw_7.width
dw_10.height = dw_7.height

end event

type pb_save from w_inheritance`pb_save within w_cdcustmaster_r_20180719
integer x = 3877
integer y = 60
end type

event pb_save::clicked;call super::clicked;string ls_custno, ls_rem5
long	 ll_row

if dw_6.RowCount() < 1 then return

dw_6.AcceptText()

ls_custno = dw_6.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	MessageBox('확인','거래처 정보가 존재하지 않습니다.')
	return
end if

ls_rem5 = dw_6.Object.custinfo_rem5[1]

if wf_nullchk(dw_7) = false then return

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,2) = 2 then return

if is_uflag = "INSERT" then
	ll_row = dw_7.insertrow(1)
	
	dw_7.Object.cust_no[1] = ls_custno
	dw_7.Object.idate[1]   = date(gf_today())
	dw_7.Object.rem[1]     = ls_rem5
	dw_7.Object.iuser[1]   = gs_userID
else
	ll_row = dw_7.GetRow()
	if ll_row < 1 or ll_row > dw_7.rowcount() then
	else
		dw_7.Object.rem[ll_row]   = ls_rem5	
	end if
end if

dw_7.AcceptText()
if	wf_update1(dw_7, 'Y') = FALSE THEN RETURN

dw_7.Modify("rem.Tabsequence = 0")
is_uflag = "UPDATE"	//Default

dw_6.SetRedraw(false) ; dw_7.SetRedraw(false)
pb_retrieve.Triggerevent( Clicked! )

pb_save.Enabled = false

dw_7.SetRow(ll_row)
dw_6.SetRedraw(true) ; dw_7.SetRedraw(true)


end event

type dw_1 from w_inheritance`dw_1 within w_cdcustmaster_r_20180719
string tag = "d_custddw_c"
integer x = 82
integer y = 280
integer width = 2423
integer height = 188
string title = "d_cdcustomer_s"
string dataobject = "d_cdcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name, ls_icubeno, ls_username
long   ad_date, ll_cnt

st_security lst_security

dw_4.reset()
dw_5.reset()

ad_date = integer(string(today(), 'yyyy')) - 1
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
		ls_icubeno   = idwc_cust.getitemstring(idwc_cust.getrow(), "icube_no")
		this.object.cust_name[1] = ""
		this.object.cust_name[1] = ls_cust_name
		this.object.icube_no[1]  = ""
		this.object.icube_no[1]  = ls_icubeno
		
	case 'cust_name'
		this.getchild("cust_name", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no   = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_icubeno   = idwc_cust.getitemstring(idwc_cust.getrow(), "icube_no")
		this.object.cust_no[1]  = ""
		this.object.cust_no[1]  = ls_cust_no
		this.object.icube_no[1] = ""
		this.object.icube_no[1] = ls_icubeno

	case 'icube_no'
		ls_icubeno = Trim(data)
		SELECT count(*) INTO :ll_cnt FROM customer WHERE icube_no = :ls_icubeno;
			 
		if ll_cnt <= 0 then
			Messagebox('확인','입력한 더존코드의 거래처는 존재하지 않습니다.')
			Return
		elseif ll_cnt > 1 then
			Messagebox('확인','입력한 더존코드의 거래처는 ' + string(ll_cnt) + ' 존재 합니다.')
			Return
		else
			ls_cust_no   = idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no")
			ls_cust_name = idwc_icube.getitemstring(idwc_icube.getrow(), "cust_name")
			this.object.cust_no[1]   = ls_cust_no
			this.object.cust_name[1] = ls_cust_name
		end if
end choose

SELECT user_name = (case when customer.salesman = 'leesy2' then '법무:' + a.user_name else b.user_name end)
  INTO :ls_username
  FROM customer
       LEFT OUTER JOIN (SELECT top 1  a.cust_no, b.user_name 
                          FROM SALE a
                               LEFT OUTER JOIN LOGIN b  ON a.salesman = b.user_id
                         WHERE a.cust_no  = :ls_cust_no ORDER BY order_date desc
                       ) A      ON customer.cust_no = a.cust_no
       LEFT OUTER JOIN LOGIN B  ON customer.salesman  = b.user_id
 WHERE ( customer.cust_no = :ls_cust_no );
st_salesman.text = ls_username	// 출력시 전년도 거래없는 경우사용


string ls_level_userid
int    li_count
choose case gs_level
	case 'A', 'B'
		pb_retrieve.enabled = true
		
	case 'C'		
		select count(*) into :li_count
		  from customer 
		 where cust_no = :ls_cust_no and salesman = :gs_userid;
		if sqlca.sqldbcode <> 0 then
			pb_retrieve.visible = false
			return
		end if
		
		if li_count > 0 then
			pb_retrieve.enabled = true
		else
			pb_retrieve.enabled = false
		end if
end choose

//
pb_retrieve.triggerevent( clicked! )

end event

event dw_1::buttonclicked;call super::buttonclicked;string ls_open, ls_zero, ls_salesman

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

// 담당자
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

choose case dwo.name
	case 'b_1'
		dw_24.Visible  =  True
		dw_24.Retrieve( '가%', ls_open, ls_zero, ls_salesman )
	case 'b_2'
		dw_24.Visible  =  True
		dw_24.Retrieve( '나%', ls_open, ls_zero, ls_salesman )
	case 'b_3'
		dw_24.Visible  =  True
		dw_24.Retrieve( '다%', ls_open, ls_zero, ls_salesman )
	case 'b_4'
		dw_24.Visible  =  True
		dw_24.Retrieve( '라%', ls_open, ls_zero, ls_salesman )
	case 'b_5'
		dw_24.Visible  =  True
		dw_24.Retrieve( '마%', ls_open, ls_zero, ls_salesman )
	case 'b_6'
		dw_24.Visible  =  True
		dw_24.Retrieve( '바%', ls_open, ls_zero, ls_salesman )
	case 'b_7'
		dw_24.Visible  =  True
		dw_24.Retrieve( '사%', ls_open, ls_zero, ls_salesman )
	case 'b_8'
		dw_24.Visible  =  True
		dw_24.Retrieve( '아%', ls_open, ls_zero, ls_salesman )
	case 'b_9'
		dw_24.Visible  =  True
		dw_24.Retrieve( '자%', ls_open, ls_zero, ls_salesman )
	case 'b_10'
		dw_24.Visible  =  True
		dw_24.Retrieve( '차%', ls_open, ls_zero, ls_salesman )
	case 'b_11'
		dw_24.Visible  =  True
		dw_24.Retrieve( '카%', ls_open, ls_zero, ls_salesman )
	case 'b_12'
		dw_24.Visible  =  True
		dw_24.Retrieve( '타%', ls_open, ls_zero, ls_salesman )
	case 'b_13'
		dw_24.Visible  =  True
		dw_24.Retrieve( '파%', ls_open, ls_zero, ls_salesman )
	case 'b_14'
		dw_24.Visible  =  True
		dw_24.Retrieve( '하%', ls_open, ls_zero, ls_salesman )
	case 'b_16'
		dw_24.Visible  =  True
		dw_24.Retrieve( 'A%', ls_open, ls_zero, ls_salesman )
	case else
		dw_24.Visible  =  False
end choose
dw_24.setfocus()

end event

event dw_1::clicked;call super::clicked;//
dw_24.Visible = False

end event

type dw_2 from w_inheritance`dw_2 within w_cdcustmaster_r_20180719
integer x = 87
integer y = 1068
integer width = 1111
integer height = 452
integer taborder = 100
boolean titlebar = true
string title = "여신현황"
string dataobject = "d_cdglbill_r2"
boolean controlmenu = true
boolean hscrollbar = true
boolean resizable = true
boolean border = false
boolean hsplitscroll = true
end type

type st_title from w_inheritance`st_title within w_cdcustmaster_r_20180719
integer x = 73
integer y = 40
integer height = 128
string text = "거래처 여신현황"
end type

type st_tips from w_inheritance`st_tips within w_cdcustmaster_r_20180719
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustmaster_r_20180719
boolean visible = false
integer x = 2181
integer y = 56
integer width = 197
integer taborder = 130
string disabledname = "c:\bmp\computr3.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustmaster_r_20180719
boolean visible = false
integer x = 2583
integer y = 68
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdcustmaster_r_20180719
integer x = 4069
integer y = 60
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustmaster_r_20180719
integer x = 3685
integer y = 60
integer taborder = 150
end type

event pb_print::clicked;//
w_repsuper w_print
DataWindowChild ldwc_dw3, ldwc_dw6 

if dw_2.rowcount() < 1 then
   MessageBox("확인", "조회조건에 만족하는 여신현황이 없습니다.",information!)
   RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.Modify("dw_2.width = 1687")		// 전년
dw_2.Modify("dw_1.width = 1687")		// 당년
dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)
dw_2.Modify("dw_6.width = 2619")		// 상세정보(수금)
dw_2.Modify("dw_5.width = 4997")		// REMARK

// 거래처 상세보기
if cbx_1.visible = true AND cbx_1.checked = true then		
	dw_2.Modify("dw_4.width   = 1550")
	dw_2.Modify("dw_4.visible = 1")
	dw_2.Modify("dw_5.visible = 1")
else
	dw_2.Modify("dw_4.visible = 0")
	dw_2.Modify("dw_5.visible = 0")
end if

// 어음 상세보기
dw_2.getchild('dw_3', ldwc_dw3)
if cbx_2.checked = true then
	ldwc_dw3.setfilter( "" )
else
	ldwc_dw3.setfilter( "set_view <> 'Y'" )
end if
ldwc_dw3.filter()
ldwc_dw3.groupcalc()

// 어음 상세보기
dw_2.getchild('dw_6', ldwc_dw6)
if ldwc_dw6.rowcount() < 1 then ldwc_dw6.insertrow( 0 )

if cbx_2.checked = true then
	ldwc_dw6.setfilter( "" )
else
	ldwc_dw6.setfilter( "set_view <> 'Y'" )
end if
ldwc_dw6.filter()
ldwc_dw6.groupcalc()

dw_2.visible = true
dw_2.title = "이프로그램은 여신현황을 출력합니다."

i_print.st_datawindow    = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 여신현황을 출력합니다." 

OpenWithParm(w_printsetup, i_print) 

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustmaster_r_20180719
boolean visible = false
integer x = 2427
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustmaster_r_20180719
integer x = 3493
integer y = 60
integer taborder = 170
end type

event pb_delete::clicked;call super::clicked;string ls_custno

if (dw_6.rowcount() < 1) or (dw_7.rowcount() < 1) then return	

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_7.accepttext()

dw_7.deleterow(dw_7.getrow())
wf_update1(dw_7,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cdcustmaster_r_20180719
integer x = 3301
integer y = 60
integer taborder = 190
integer weight = 400
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;String	ls_Null

if dw_6.RowCount() < 1 then return

SetNull(ls_Null)

dw_6.Object.custinfo_rem5[1] = ls_Null
dw_6.SetFocus()
dw_6.SetColumn("custinfo_rem5")

is_uFlag = 'INSERT'

pb_save.Enabled = true
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustmaster_r_20180719
integer x = 3109
integer y = 60
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindowchild idwc_opeom
string ls_open, ls_zero, ls_salesman, ls_username, ls_cust, ls_custnm
int    li_year

pb_save.Enabled = false			// 조회,저장 후 저장버튼 비활성화

dw_1.accepttext()

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

///////////////////////////////////////////
// 담당자 
///////////////////////////////////////////
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

ls_cust   = dw_1.object.cust_no[1]
ls_custnm = dw_1.object.cust_name[1]
li_year   = integer(em_1.text)

dw_5.retrieve(ls_cust, li_year - 1)				// 전년
dw_4.retrieve(ls_cust, li_year)					// 당년
dw_6.retrieve(ls_cust)								// 거래처 상세보기
dw_7.retrieve(ls_cust)								// 비고 History

dw_3.retrieve(ls_cust)								// 어음내역(발생)
dw_9.retrieve(ls_cust)								// 어음내역(회수)
dw_2.retrieve(ls_cust, li_year, gs_userID)	// 여신현황

SELECT user_name INTO :ls_username
  FROM customer 
       LEFT OUTER JOIN login ON customer.salesman = login.user_id
 WHERE customer.cust_no  = :ls_cust;
 
dw_10.Retrieve( ls_open, ls_salesman, li_year )

// 여신현황 전년 거래가 없는 경우
if dw_5.rowcount() < 1 then			
	dw_5.insertrow(0)				
   dw_5.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))

	dw_2.getchild("dw_2", idwc_opeom)	// 전년
	idwc_opeom.insertrow(0)
	idwc_opeom.SetItem(1, "cust_name", ls_custnm)
	idwc_opeom.SetItem(1, "user_name", ls_username)
	idwc_opeom.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))
end if

//// 여신현황 전년거래가 없는 경우
//if dw_5.rowcount() < 1 then			
//	dw_5.insertrow(0)				
//   dw_5.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))
////
////	dw_2.getchild("dw_2", idwc_opeom)
////	idwc_opeom.insertrow(0)
////   idwc_opeom.SetItem(1, "cust_name", ls_custnm)
////   idwc_opeom.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))
//end if
//
end event

type gb_3 from w_inheritance`gb_3 within w_cdcustmaster_r_20180719
integer x = 2030
integer y = 16
integer width = 1024
integer height = 212
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustmaster_r_20180719
integer x = 50
integer y = 240
integer width = 2866
integer height = 240
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustmaster_r_20180719
integer x = 3067
integer y = 16
integer width = 1234
integer height = 212
integer weight = 400
end type

type em_1 from editmask within w_cdcustmaster_r_20180719
integer x = 3273
integer y = 304
integer width = 288
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
end type

event modified;// 기준년도
pb_retrieve.postevent(clicked!)
end event

type st_1 from statictext within w_cdcustmaster_r_20180719
integer x = 2976
integer y = 304
integer width = 288
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
string text = "기준년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_cdcustmaster_r_20180719
integer x = 1202
integer y = 12
integer width = 224
integer height = 104
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "ALL"
end type

event clicked;//// 전체
//int    li_seq
//string ls_cust
//
//declare c_1 cursor for
// select c, cust from a_test order by c;
//open c_1;
//
//FETCH c_1 into :li_seq, :ls_cust;
//DO WHILE sqlca.sqlcode = 0
//
//	dw_2.retrieve(ls_cust, 2004)
//	dw_2.print()
//	sleep(1)
//	FETCH c_1 INTO :li_seq, :ls_cust;
//LOOP
//close c_1;
//
end event

type dw_3 from datawindow within w_cdcustmaster_r_20180719
integer x = 50
integer y = 1764
integer width = 2199
integer height = 968
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdglbill_q21"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_cdcustmaster_r_20180719
integer x = 1490
integer y = 504
integer width = 1426
integer height = 1244
integer taborder = 50
string dataobject = "d_cdinvcoll_q1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_cdcustmaster_r_20180719
integer x = 3639
integer y = 292
integer width = 626
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
string text = "거래처 상세보기"
end type

event clicked;if this.checked = true then
	dw_6.visible = true
else
	dw_6.visible = false
end if
end event

type dw_5 from datawindow within w_cdcustmaster_r_20180719
integer x = 50
integer y = 504
integer width = 1426
integer height = 1244
integer taborder = 90
string dataobject = "d_cdinvcoll_q2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_cdcustmaster_r_20180719
integer x = 2930
integer y = 240
integer width = 1376
integer height = 240
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
end type

type dw_6 from datawindow within w_cdcustmaster_r_20180719
integer x = 2930
integer y = 504
integer width = 1376
integer height = 1244
integer taborder = 110
string title = "none"
string dataobject = "d_cdinvcoll_q4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within w_cdcustmaster_r_20180719
integer x = 1221
integer y = 808
integer width = 2181
integer height = 836
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdinvcoll_q5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_rem

if currentrow < 1 Or currentrow > this.rowcount() then RETURN

ls_rem = this.Object.rem[currentrow]
if dw_6.rowcount() = 1 then
	dw_6.Object.custinfo_rem5[1] = ls_rem
end if
is_uflag = "UPDATE"

end event

type cbx_open from checkbox within w_cdcustmaster_r_20180719
integer x = 3639
integer y = 352
integer width = 626
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
string text = "사용불가 제외"
end type

event clicked;long   ll_row
string ls_open

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if this.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort('cust_no, cust_name')
idwc_cust.sort()
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort('cust_name, cust_no')
idwc_cust_name.sort()
//================================//
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
ll_row = idwc_icube.retrieve( ls_open )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

end event

type dw_24 from datawindow within w_cdcustmaster_r_20180719
integer x = 1961
integer y = 916
integer width = 1751
integer height = 1456
integer taborder = 102
boolean bringtotop = true
boolean titlebar = true
string title = "순수 거래처명"
string dataobject = "d_cdcustlist_r"
boolean controlmenu = true
boolean vscrollbar = true
boolean border = false
string icon = "Database!"
boolean livescroll = true
end type

event doubleclicked;string ls_custno, ls_custnm, ls_icubeno, ls_username
long   ll_row

dw_24.AcceptText()

ll_row     = dw_24.GetRow()

ls_custno  = dw_24.Object.cid[ll_row]
ls_custnm  = dw_24.Object.fname[ll_row]


if isnull(ls_custno) or ls_custno = "" then
else
	dw_1.Object.cust_no[1]   = ls_custno
	dw_1.Object.cust_name[1] = ls_custnm
	dw_24.Visible  =  False	

	SELECT user_name = (case when customer.salesman = 'leesy2' then '법무:' + a.user_name else b.user_name end)
	  INTO :ls_username
	  FROM customer
			 LEFT OUTER JOIN (SELECT top 1  a.cust_no, b.user_name 
									  FROM SALE a
											 LEFT OUTER JOIN LOGIN b  ON a.salesman = b.user_id
									 WHERE a.cust_no  = :ls_custno ORDER BY order_date desc
								  ) A      ON customer.cust_no = a.cust_no
			 LEFT OUTER JOIN LOGIN B  ON customer.salesman  = b.user_id
	 WHERE ( customer.cust_no = :ls_custno );
	st_salesman.text = ls_username	// 출력시 전년도 거래없는 경우사용
	
	pb_retrieve.triggerevent( clicked! )
end if

end event

type cb_2 from commandbutton within w_cdcustmaster_r_20180719
integer x = 2514
integer y = 292
integer width = 366
integer height = 168
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "이력카드"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

DataWindowChild ldwc_custbase1, ldwc_custbase2, ldwc_custbase3
w_repsuper w_print
st_print   l_print

string ls_custno
long   ll_row

dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]

dw_8.retrieve( ls_custno )
dw_8.getchild("dw_2", ldwc_custbase1)
dw_8.getchild("dw_1", ldwc_custbase2)
dw_8.getchild("dw_3", ldwc_custbase3)
if ldwc_custbase1.rowcount() < 1 and ldwc_custbase2.rowcount() < 1 and ldwc_custbase3.rowcount() < 1 then
	MessageBox("확인", "거래처 이력카드 데이터가 없습니다.")
	return
end if

dw_8.visible = true
dw_8.title   = " 이 프로그램은 거래처_이력카드를 출력합니다."

l_print.st_datawindow    = dw_8
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 거래처_이력카드를 출력합니다." 

OpenWithParm(w_printsetup, l_print) 

end event

type dw_8 from datawindow within w_cdcustmaster_r_20180719
integer x = 87
integer y = 640
integer width = 1111
integer height = 400
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "이력카드"
string dataobject = "d_cdcustomer_base_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

type st_salesman from statictext within w_cdcustmaster_r_20180719
integer x = 50
integer y = 192
integer width = 581
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
string text = "none"
boolean focusrectangle = false
end type

type dw_9 from datawindow within w_cdcustmaster_r_20180719
integer x = 2249
integer y = 1764
integer width = 2057
integer height = 968
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdglbill_q22"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_cdcustmaster_r_20180719
integer x = 3639
integer y = 408
integer width = 626
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
string text = "어음 상세보기"
end type

event clicked;// 어음 상세보기
string ls_null

setnull( ls_null )

if this.checked = true then
	dw_3.setfilter( "" )
else
	dw_3.setfilter( "set_view <> 'Y'" )
end if
dw_3.filter()
dw_3.groupcalc()

// 어음 상세보기
if this.checked = true then
	dw_9.setfilter( "" )
else
	dw_9.setfilter( "set_view <> 'Y'" )
end if
dw_9.filter()
dw_9.groupcalc()

end event

type dw_10 from datawindow within w_cdcustmaster_r_20180719
integer x = 1454
integer y = 28
integer width = 375
integer height = 156
integer taborder = 20
boolean bringtotop = true
string title = "잔액존재업체"
string dataobject = "d_cdcustmaster_r_sales"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_auto from commandbutton within w_cdcustmaster_r_20180719
integer x = 2729
integer y = 60
integer width = 297
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일괄출력"
end type

event clicked;// 잔액이 존재하는 업체 일괄출력: Yield
string	ls_custno, ls_custnm, ls_card, ls_username
long		ll_row, ll_col, ll_custsort, ll_found
integer  li_prt

w_repsuper w_print
DataWindowChild ldwc_dw2, ldwc_dw3, ldwc_dw6

dw_10.visible = true		// 전체보기

// 일괄출력 작업 출력취소
if cb_auto.text = "출력취소" then
	ib_cancel = true
	RETURN
else
	if MessageBox("확인",string(dw_10.rowcount(),"#,##0") + " 건 출력작업을 계속 하시겠습니까?~r~r" + &
	              "(Tip: 출력중 취소시에는 출력취소)", Exclamation!, YesNo!, 2) = 2 then
		ib_cancel = true
		dw_10.visible = false	// 전체보기
		RETURN
	else
		li_prt = PrintSetup()
		if li_prt < 1 then
			ib_cancel = true
			RETURN
		end if
	end if
end if	

cb_auto.text = "출력취소"
ib_cancel = false

if GF_PERMISSION("거래처여신현황_상세보기", gs_userid) = "Y" then
	dw_2.Modify("dw_4.visible = 1")
	dw_2.Modify("dw_5.visible = 1")
else
	dw_2.Modify("dw_4.visible = 0")
	dw_2.Modify("dw_5.visible = 0")
end if

for ll_row = 1 to dw_10.rowcount()
	Yield()		// 반복문 안에서 다른 오브젝트나 어플리케이션의 메세지가 발생검사
	Yield()
	
if ll_row = 2 then
	debugbreak()
end if
	
	dw_10.scrolltorow( ll_row )
	
	ls_custno   = dw_10.Object.customer_cust_no[ll_row]
	ls_custnm   = dw_10.Object.customer_cust_name[ll_row]
	ls_username = dw_10.Object.login_user_name[ll_row]

	if ib_cancel = true then	// Interrupted!"
		ib_cancel = false
		EXIT
	else								// Some processing		
		dw_1.Object.cust_no[1]   = ls_custno
		dw_1.Object.cust_name[1] = ls_custnm
		
		pb_retrieve.TriggerEvent(Clicked!)

		// 전년
		dw_2.getchild('dw_2', ldwc_dw2)
		if ldwc_dw2.rowcount() > 0 then
		else
			ldwc_dw2.setitem(1, "user_name", ls_username)
		end if
		
		dw_2.Modify("dw_2.width = 1687")		// 전년
		dw_2.Modify("dw_1.width = 1687")		// 당년
		dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)
		dw_2.Modify("dw_6.width = 2619")		// 상세정보(수금)
		dw_2.Modify("dw_5.width = 4997")		// REMARK
		if cbx_1.visible = true AND cbx_1.checked = true then    // 거래처 상세
			dw_2.Modify("dw_4.width   = 1550")
			dw_2.Modify("dw_4.visible = 1")
		else
			dw_2.Modify("dw_4.visible = 0")
		end if
		
		dw_2.visible = true
		
		// 어음 상세보기
		dw_2.getchild('dw_3', ldwc_dw3)
		if cbx_2.checked = true then
			ldwc_dw3.setfilter( "" )
		else
			ldwc_dw3.setfilter( "set_view <> 'Y'" )
		end if
		ldwc_dw3.filter()
		ldwc_dw3.groupcalc()

		// 어음 상세보기
		dw_2.getchild('dw_6', ldwc_dw6)
		if ldwc_dw6.rowcount() < 1 then ldwc_dw6.insertrow( 0 )
		
		if cbx_2.checked = true then
			ldwc_dw6.setfilter( "" )
		else
			ldwc_dw6.setfilter( "set_view <> 'Y'" )
		end if
		ldwc_dw6.filter()
		ldwc_dw6.groupcalc()

		dw_2.title = "이프로그램은 여신현황을 출력합니다."		
		dw_2.print()	
	end if
next

dw_10.visible = true		// 전체보기
dw_2.visible  = false
cb_auto.text  = "일괄출력"
MessageBox("확인","일괄출력 작업완료")

end event

type st_2 from statictext within w_cdcustmaster_r_20180719
integer x = 2057
integer y = 56
integer width = 658
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_salesman from datawindow within w_cdcustmaster_r_20180719
integer x = 2053
integer y = 128
integer width = 672
integer height = 84
integer taborder = 30
boolean bringtotop = true
string title = "담당자"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;// 담당자
int    li_year
long   ll_row
string ls_open, ls_zero, ls_salesman, ls_username

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

//// 일괄출력
//if data = "%" then 	// 전체사용자
//	cb_auto.enabled = false
//else
//	if ls_salesman = gs_userid then	// 로긴담당자 
//		cb_auto.enabled = true
//	else
//		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
//			cb_auto.enabled = true
//		else
//			cb_auto.enabled = false
//		end if
//	end if
//end if

// 년도
li_year   = integer(em_1.text)

//================================//
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort('cust_no, cust_name')
idwc_cust.sort()
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort('cust_name, cust_no')
idwc_cust_name.sort()
//================================//
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

// 잔액(카드)존재 업체
dw_10.title = "잔액 존재업체"
dw_10.dataobject = "d_cdcustmaster_r_sales"
dw_10.SetTransObject(SQLCA)

// 잔액제로 제외
ll_row = dw_10.Retrieve( ls_open, ls_salesman, li_year )
if cbx_zero.checked = true then		
	dw_10.setfilter( "opeom_amt <> 0" )
else
	dw_10.setfilter( "" )
end if
dw_10.filter()

if ll_row < 1 then
	MessageBox("확인","잔액 존재업체가 존재하지 않습니다.")
	return	
end if

SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
//st_salesman.text = ls_username 	// 현재담당자


end event

type cbx_zero from checkbox within w_cdcustmaster_r_20180719
integer x = 2981
integer y = 400
integer width = 558
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
string text = "잔액제로 제외"
boolean checked = true
end type

event clicked;// 잔액제로 제외
long   ll_row
string ls_open, ls_zero, ls_salesman

if dw_24.visible = true then dw_24.visible = false

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

// 잔액제로 제외
if cbx_zero.checked = true then		
	dw_10.setfilter( "opeom_amt <> 0" )
else
	dw_10.setfilter( "" )
end if
dw_10.filter()


// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

//================================//
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort('mgr_sort, cust_no, cust_name')
idwc_cust.sort()
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
idwc_cust_name.sort()
//================================//
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

end event

