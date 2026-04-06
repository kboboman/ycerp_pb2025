$PBExportHeader$w_cdcustomer_r.srw
$PBExportComments$판매거래처마스터조회(1998/03/13,성삼지)
forward
global type w_cdcustomer_r from w_inheritance
end type
type dw_3 from datawindow within w_cdcustomer_r
end type
type tab_1 from tab within w_cdcustomer_r
end type
type tabpage_1 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type dw_rem_i from datawindow within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_5 cb_5
dw_rem_i dw_rem_i
dw_5 dw_5
cb_4 cb_4
cb_2 cb_2
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
cb_3 cb_3
end type
type tabpage_4 from userobject within tab_1
end type
type st_1 from statictext within tabpage_4
end type
type st_2 from statictext within tabpage_4
end type
type gb_5 from groupbox within tabpage_4
end type
type gb_4 from groupbox within tabpage_4
end type
type st_3 from statictext within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type pb_exinsert from picturebutton within tabpage_4
end type
type pb_exdelete from picturebutton within tabpage_4
end type
type pb_exsave from picturebutton within tabpage_4
end type
type dw_17 from datawindow within tabpage_4
end type
type pb_2 from picturebutton within tabpage_4
end type
type pb_3 from picturebutton within tabpage_4
end type
type tabpage_4 from userobject within tab_1
st_1 st_1
st_2 st_2
gb_5 gb_5
gb_4 gb_4
st_3 st_3
dw_8 dw_8
pb_exinsert pb_exinsert
pb_exdelete pb_exdelete
pb_exsave pb_exsave
dw_17 dw_17
pb_2 pb_2
pb_3 pb_3
end type
type tabpage_3 from userobject within tab_1
end type
type gb_8 from groupbox within tabpage_3
end type
type gb_7 from groupbox within tabpage_3
end type
type dw_6 from datawindow within tabpage_3
end type
type dw_7 from datawindow within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type st_5 from statictext within tabpage_3
end type
type st_6 from statictext within tabpage_3
end type
type st_7 from statictext within tabpage_3
end type
type em_1 from editmask within tabpage_3
end type
type dw_21 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
gb_8 gb_8
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
dw_21 dw_21
end type
type tabpage_5 from userobject within tab_1
end type
type st_8 from statictext within tabpage_5
end type
type ddlb_1 from dropdownlistbox within tabpage_5
end type
type pb_9 from picturebutton within tabpage_5
end type
type pb_8 from picturebutton within tabpage_5
end type
type pb_6 from picturebutton within tabpage_5
end type
type pb_5 from picturebutton within tabpage_5
end type
type dw_19 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
st_8 st_8
ddlb_1 ddlb_1
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
pb_5 pb_5
dw_19 dw_19
end type
type tab_1 from tab within w_cdcustomer_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
end type
type dw_9 from datawindow within w_cdcustomer_r
end type
type dw_10 from datawindow within w_cdcustomer_r
end type
type dw_11 from datawindow within w_cdcustomer_r
end type
type dw_12 from datawindow within w_cdcustomer_r
end type
type dw_13 from datawindow within w_cdcustomer_r
end type
type cb_1 from commandbutton within w_cdcustomer_r
end type
type dw_14 from datawindow within w_cdcustomer_r
end type
type dw_15 from datawindow within w_cdcustomer_r
end type
type pb_1 from picturebutton within w_cdcustomer_r
end type
type dw_16 from datawindow within w_cdcustomer_r
end type
type dw_rem from datawindow within w_cdcustomer_r
end type
type dw_24 from datawindow within w_cdcustomer_r
end type
type pb_4 from picturebutton within w_cdcustomer_r
end type
type dw_18 from datawindow within w_cdcustomer_r
end type
type pb_7 from picturebutton within w_cdcustomer_r
end type
type cbx_open from checkbox within w_cdcustomer_r
end type
type cbx_salesman from checkbox within w_cdcustomer_r
end type
type dw_20 from datawindow within w_cdcustomer_r
end type
type dw_28 from datawindow within w_cdcustomer_r
end type
type pb_10 from picturebutton within w_cdcustomer_r
end type
type st_22 from statictext within w_cdcustomer_r
end type
type dw_salesman from datawindow within w_cdcustomer_r
end type
type pb_11 from picturebutton within w_cdcustomer_r
end type
type cbx_2 from checkbox within w_cdcustomer_r
end type
type cb_bemat from commandbutton within w_cdcustomer_r
end type
type cbx_zero from checkbox within w_cdcustomer_r
end type
type pb_12 from picturebutton within w_cdcustomer_r
end type
type pb_13 from picturebutton within w_cdcustomer_r
end type
type dw_29 from datawindow within w_cdcustomer_r
end type
type gb_6 from groupbox within w_cdcustomer_r
end type
end forward

global type w_cdcustomer_r from w_inheritance
integer width = 5111
integer height = 3704
string title = "판매거래처 마스터(w_cdcustomer_r)"
boolean hscrollbar = true
boolean vscrollbar = true
long backcolor = 79416533
dw_3 dw_3
tab_1 tab_1
dw_9 dw_9
dw_10 dw_10
dw_11 dw_11
dw_12 dw_12
dw_13 dw_13
cb_1 cb_1
dw_14 dw_14
dw_15 dw_15
pb_1 pb_1
dw_16 dw_16
dw_rem dw_rem
dw_24 dw_24
pb_4 pb_4
dw_18 dw_18
pb_7 pb_7
cbx_open cbx_open
cbx_salesman cbx_salesman
dw_20 dw_20
dw_28 dw_28
pb_10 pb_10
st_22 st_22
dw_salesman dw_salesman
pb_11 pb_11
cbx_2 cbx_2
cb_bemat cb_bemat
cbx_zero cbx_zero
pb_12 pb_12
pb_13 pb_13
dw_29 dw_29
gb_6 gb_6
end type
global w_cdcustomer_r w_cdcustomer_r

type variables
public string is_custno, is_custname
st_print i_print

datawindowchild idwc_cust, idwc_mgrtype
datawindowchild idwc_user, idwc_user1
datawindowchild idwc_cust_name, idwc_icube

string is_select, is_where, is_clause, is_select1, is_dwsql, is_custdorsql
string is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman, is_rem_old

end variables

on w_cdcustomer_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.tab_1=create tab_1
this.dw_9=create dw_9
this.dw_10=create dw_10
this.dw_11=create dw_11
this.dw_12=create dw_12
this.dw_13=create dw_13
this.cb_1=create cb_1
this.dw_14=create dw_14
this.dw_15=create dw_15
this.pb_1=create pb_1
this.dw_16=create dw_16
this.dw_rem=create dw_rem
this.dw_24=create dw_24
this.pb_4=create pb_4
this.dw_18=create dw_18
this.pb_7=create pb_7
this.cbx_open=create cbx_open
this.cbx_salesman=create cbx_salesman
this.dw_20=create dw_20
this.dw_28=create dw_28
this.pb_10=create pb_10
this.st_22=create st_22
this.dw_salesman=create dw_salesman
this.pb_11=create pb_11
this.cbx_2=create cbx_2
this.cb_bemat=create cb_bemat
this.cbx_zero=create cbx_zero
this.pb_12=create pb_12
this.pb_13=create pb_13
this.dw_29=create dw_29
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_9
this.Control[iCurrent+4]=this.dw_10
this.Control[iCurrent+5]=this.dw_11
this.Control[iCurrent+6]=this.dw_12
this.Control[iCurrent+7]=this.dw_13
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.dw_14
this.Control[iCurrent+10]=this.dw_15
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.dw_16
this.Control[iCurrent+13]=this.dw_rem
this.Control[iCurrent+14]=this.dw_24
this.Control[iCurrent+15]=this.pb_4
this.Control[iCurrent+16]=this.dw_18
this.Control[iCurrent+17]=this.pb_7
this.Control[iCurrent+18]=this.cbx_open
this.Control[iCurrent+19]=this.cbx_salesman
this.Control[iCurrent+20]=this.dw_20
this.Control[iCurrent+21]=this.dw_28
this.Control[iCurrent+22]=this.pb_10
this.Control[iCurrent+23]=this.st_22
this.Control[iCurrent+24]=this.dw_salesman
this.Control[iCurrent+25]=this.pb_11
this.Control[iCurrent+26]=this.cbx_2
this.Control[iCurrent+27]=this.cb_bemat
this.Control[iCurrent+28]=this.cbx_zero
this.Control[iCurrent+29]=this.pb_12
this.Control[iCurrent+30]=this.pb_13
this.Control[iCurrent+31]=this.dw_29
this.Control[iCurrent+32]=this.gb_6
end on

on w_cdcustomer_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.tab_1)
destroy(this.dw_9)
destroy(this.dw_10)
destroy(this.dw_11)
destroy(this.dw_12)
destroy(this.dw_13)
destroy(this.cb_1)
destroy(this.dw_14)
destroy(this.dw_15)
destroy(this.pb_1)
destroy(this.dw_16)
destroy(this.dw_rem)
destroy(this.dw_24)
destroy(this.pb_4)
destroy(this.dw_18)
destroy(this.pb_7)
destroy(this.cbx_open)
destroy(this.cbx_salesman)
destroy(this.dw_20)
destroy(this.dw_28)
destroy(this.pb_10)
destroy(this.st_22)
destroy(this.dw_salesman)
destroy(this.pb_11)
destroy(this.cbx_2)
destroy(this.cb_bemat)
destroy(this.cbx_zero)
destroy(this.pb_12)
destroy(this.pb_13)
destroy(this.dw_29)
destroy(this.gb_6)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_open, ls_zero, ls_salesman
long   ll_row

if gs_rank_no = '235' then
     pb_4.enabled = false
     pb_10.enabled = false	  
     pb_11.enabled = false	  	  
	pb_compute.enabled = false
	cb_bemat.enabled = false
	tab_1.tabpage_2.enabled = false
	tab_1.tabpage_3.enabled = false	
	tab_1.tabpage_4.enabled = false		
	tab_1.tabpage_5.enabled = false			
end if


pb_1.visible  = false	// 공사예상현장
pb_7.visible  = false	// 거래처리스트
pb_12.visible = false	// 리스트 출력
pb_13.visible = false	//  여신  리스트

dw_2.visible  = false ; dw_10.visible = false ; dw_11.visible = false
dw_12.visible = false ; dw_13.visible = false ; dw_14.visible = false
dw_15.visible = false ; dw_16.visible = false ; dw_18.visible = false
dw_20.visible = false	// 매출계획

dw_15.visible = false	// PRINT
dw_15.x       = 229
dw_15.y       = 776
dw_15.width   = 4288
dw_15.height  = 1444

dw_24.visible = false	// 순수거래처
dw_24.x       = 2446		
dw_24.y       = 456
dw_24.width   = 2226
dw_24.height  = 1456

dw_28.visible = false	// 영업담당 이력(수주기준)
dw_28.x       = 3479	
dw_28.y       = 456
dw_28.width   = 1152
dw_28.height  = 2496

dw_29.visible = false	// 주차 매출금액

dw_rem.visible = false	// 거래처 비고 History
dw_rem.x       = 992		
dw_rem.y       = 700
dw_rem.width   = 2642
dw_rem.height  = 1328

tab_1.tabpage_1.dw_5.Object.open_close.TabSequence  = 0
tab_1.tabpage_1.dw_5.object.cust_name.tabsequence   = 0
tab_1.tabpage_1.dw_5.object.register_no.tabsequence = 0

dw_1.SetTransObject(sqlca)
dw_2.SetTransObject(SQLCA)

tab_1.tabpage_2.dw_4.SetTransObject(sqlca)
tab_1.tabpage_1.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_17.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_8.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_7.SetTransObject(SQLCA)		// 어음상세
tab_1.tabpage_3.dw_21.SetTransObject(SQLCA)		// 어음상세
tab_1.tabpage_5.dw_19.SetTransObject(SQLCA)		// 매출계획
dw_20.SetTransObject(SQLCA)							// 매출계획 출력

dw_15.SetTransObject(SQLCA)

dw_10.settransobject(sqlca)
is_dwsql = dw_10.describe("datawindow.table.select")

dw_11.settransobject(sqlca)
is_dovcsql = dw_11.describe("datawindow.table.select")

dw_12.settransobject(sqlca)
is_teamsql = dw_12.describe("datawindow.table.select")

dw_13.settransobject(sqlca)
is_mansql = dw_13.describe("datawindow.table.select")

dw_16.settransobject(sqlca)
is_custdorsql = dw_16.describe("datawindow.table.select")

dw_9.settransobject(sqlca)
dw_28.SetTransObject(SQLCA)


if GF_PERMISSION("판매거래처관리OPEN", gs_userid) = "Y" then
	if gs_username = "조용재" then
		cbx_open.checked = true
	else
		cbx_open.checked = false
	end if
else
	cbx_open.checked = true
end if

///////////////////////////////////////////
// 담당자별 거래처
///////////////////////////////////////////
dw_salesman.settransobject(sqlca)	
dw_salesman.insertrow(1)
dw_salesman.getchild("user",idwc_user)

idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_salesman.object.user[1] = "%"

///////////////////////////////////////////
// 관리분류
///////////////////////////////////////////
tab_1.tabpage_1.dw_5.getchild("mgr_type", idwc_mgrtype)
idwc_mgrtype.settransobject(sqlca)
idwc_mgrtype.retrieve("MGR_TYPE")

///////////////////////////////////////////
// 어음 상세보기
///////////////////////////////////////////
cbx_2.checked = false    // 어음 상세보기
cbx_2.postevent( clicked! )

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
ls_salesman = "%"		// dw_salesman.object.user[1]

///////////////////////////////////////////
// 초성검색(dw_1)
///////////////////////////////////////////
// 거래처코드
dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
if idwc_cust.rowcount() = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort("cust_no, cust_name")
idwc_cust.sort()

// 거래처명
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort("cust_name, cust_no")
idwc_cust_name.sort()

// 더존코드
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
ll_row = idwc_icube.retrieve( ls_open)
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort("icube_no, cust_name")
idwc_icube.sort()
///////////////////////////////////////////

pb_insert.enabled = true

dw_18.SetTransObject(SQLCA)	// 거래처 엑셀	
dw_24.SetTransObject(SQLCA)   // 판매거래처 리스트 (090403)
dw_29.SetTransObject(SQLCA)   
dw_14.settransobject(sqlca)
dw_14.retrieve()

tab_1.tabpage_3.dw_7.modify("datawindow.readonly=yes")
tab_1.tabpage_3.dw_21.modify("datawindow.readonly=yes")
tab_1.tabpage_4.dw_8.modify("datawindow.readonly=yes")
tab_1.tabpage_4.dw_17.modify("datawindow.readonly=yes")

if LeftA(gs_print_control,1) = "V" then
	string ls_custno
	ls_custno = MidA(gs_print_control,2,4)
	tab_1.tabpage_1.dw_5.retrieve(ls_custno)
end if

dw_1.setcolumn("cust_name")
dw_1.setfocus()


end event

event resize;call super::resize;//
tab_1.width  = newwidth  - 73
tab_1.height = newheight - 532

// 매출수금내역
tab_1.tabpage_3.gb_8.width   = tab_1.width  - 50
tab_1.tabpage_3.gb_8.height  = tab_1.height - 1072

// 발생
tab_1.tabpage_3.dw_7.width   = (tab_1.width  - 87) / 2
tab_1.tabpage_3.dw_7.height  = tab_1.height - 1124
// 회수
tab_1.tabpage_3.dw_21.x      = tab_1.tabpage_3.dw_7.x + tab_1.tabpage_3.dw_7.width + 10
tab_1.tabpage_3.dw_21.width  = (tab_1.width  - 87) / 2
tab_1.tabpage_3.dw_21.height = tab_1.height - 1124

// 매출계획
tab_1.tabpage_5.dw_19.width  = tab_1.width  - 50
tab_1.tabpage_5.dw_19.height = tab_1.height - 248

dw_15.x  = tab_1.x
dw_15.y  = tab_1.y
dw_15.width  = tab_1.width
dw_15.height = tab_1.height

end event

type pb_save from w_inheritance`pb_save within w_cdcustomer_r
boolean visible = false
integer x = 3163
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_cdcustomer_r
integer x = 55
integer y = 256
integer width = 2423
integer height = 196
integer taborder = 70
string title = "d_custddw_c <<old"
string dataobject = "d_cdcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
string ls_custno, ls_custnm, ls_icubeno
string ls_salesman, ls_colllevel, ls_userid
long   ll_cnt,  ll_find

///////////////////////////////////////////
// 매출조직별 거래처 CHECK
///////////////////////////////////////////
choose case dwo.name
	case "cust_no"  
		ls_custno = Trim(data)

	case "cust_name"
		ls_custnm = Trim(data)
end choose


/*2019.08.06 jowonsuk 외형을 볼수 있게 로직 변경, 마스터는 항상 볼수 있고, 담당자도 볼수 있도록 변경  */
tab_1.tabpage_1.dw_5.height = 2176

if GF_PERMISSION("판매거래처 마스터(ALL)", gs_userid) = "Y" then
	/*2019.08.06 jowonsuk 외형을 볼수 있게 로직 변경 */
	tab_1.tabpage_1.dw_5.height = 2324
else
	dw_2.retrieve( gs_userid )
	if dw_2.rowcount() < 1 then
		MessageBox("확인","매출조직별 거래처 대상에 존재하지 않습니다.")
		RETURN
	else
		ll_find = dw_2.find( "cust_name = '" + ls_custnm + "' ", 1, dw_2.rowcount() )
		if ll_find > 0 then
			// 매출조직거래처
			/*2019.08.06 jowonsuk 외형을 볼수 있게 로직 변경 */
			tab_1.tabpage_1.dw_5.height = 2324
		else			
			
			select a.user_name salesman_name
				 into :ls_salesman
			from customer left outer join login a on customer.salesman = a.user_id
			where (cust_no = :ls_custno or cust_name = :ls_custnm) ;			
			
			MessageBox("확인","해당하는 거래처의 담당자는 [" + ls_salesman + "] 입니다.~n~n거래처 열람할 수 없습니다.")
			RETURN
		end if
	end if
end if
///////////////////////////////////////////


choose case dwo.name
	case "cust_no"  
		ls_custno = Trim(data)
		
		setnull(ls_custnm)
		
/*		SELECT count(*) INTO :ll_cnt FROM customer WHERE cust_no  =  :ls_custno;	*/ /*2018.03.19 조원석 count(*) -> cust_name */
		SELECT cust_name INTO :ls_custnm FROM customer WHERE cust_no  =  :ls_custno;        /*2018.03.19 조원석 count(*) -> cust_name */

		
/*		if ll_cnt <= 0 then						*/  /*2018.03.19 조원석 주석처리 */
		if isnull(ls_custnm) then
			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			Messagebox("확인","입력하신 거래처코드의 거래처는 존재하지 않습니다.")
			RETURN
		else
			this.object.cust_name[1] = ""
			this.object.cust_name[1] = ls_custnm /*idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")	2018.03.19 조원석 주석처리 ls_custnm 반영 */
			this.object.icube_no[1]  = ""
			this.object.icube_no[1]  = idwc_cust.getitemstring(idwc_cust.getrow(), "icube_no")

			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			
			tab_1.tabpage_1.dw_5.setfocus()
/*			
			2018.03.19 조원석 주석처리 
			tab_1.tabpage_1.dw_5.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
			tab_1.tabpage_2.dw_4.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
			tab_1.tabpage_4.dw_17.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_7.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_21.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_6.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"), &
													integer(string(wf_today(),"YYYY")))													
			tab_1.tabpage_5.dw_19.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
*/

			/*2018.03.19 조원석 ls_custno로 반영 시작 */
			tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			tab_1.tabpage_3.dw_21.retrieve(ls_custno)
			tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),"YYYY")))													
			tab_1.tabpage_5.dw_19.retrieve(ls_custno)
			/*2018.03.19 조원석 ls_custno로 반영  끝 */			
		end if
		
	case "cust_name"
		ls_custnm = Trim(data)
		/* 2018.03.19 조원석 수정 
			idwc_cust_name.getrow() 제대로 작동을 하지 않음.
			cust_no 를 구하고 이걸 반영하는걸로 수정 
			
		*/
/*		SELECT count(*) INTO :ll_cnt FROM customer WHERE cust_name  =  :ls_custnm;*/ /*2018.03.19 변경 count(*) -> cust_no */

		setnull(ls_custno)		/*2018.03.19 조원석 주석처리*/

		SELECT cust_no INTO :ls_custno FROM customer WHERE cust_name  =  :ls_custnm; 
			 
			 
/*		if ll_cnt <= 0 then 	 						*/
		if isnull(ls_custno) then                          /*2018.03.19 조원석 신규반영*/		
			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			Messagebox("확인","입력하신 거래처명의 거래처는 존재하지 않습니다.")
			RETURN
		else
			this.object.cust_name[1]  = ""						/*2018.03.19 조원석 추가 */
			this.object.cust_name[1]  =ls_custnm				/*2018.03.19 조원석 추가 */
			this.object.cust_no[1]  = ""
			this.object.cust_no[1]  = ls_custno /*2018.03.19 조원석 신규반영*/ /*idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")	*/ /*2018.03.19 조원석 주석처리*/
			this.object.icube_no[1] = ""
			this.object.icube_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "icube_no")

			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			
			tab_1.tabpage_1.dw_5.setfocus()
/*
			 /*2018.03.19 조원석 주석처리*/
			tab_1.tabpage_1.dw_5.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
			tab_1.tabpage_2.dw_4.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
			tab_1.tabpage_4.dw_17.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_7.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_21.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_6.retrieve(idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no"), &
													integer(string(wf_today(),"YYYY")))
			tab_1.tabpage_5.dw_19.retrieve(idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no"))
*/			
			/*2018.03.19 조원석 ls_custno로 반영 시작 */
			tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			tab_1.tabpage_3.dw_21.retrieve(ls_custno)
			tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),"YYYY")))
			tab_1.tabpage_5.dw_19.retrieve(ls_custno)
			/*2018.03.19 조원석 ls_custno로 반영 끝  */
		end if

	case "icube_no"
		ls_icubeno = Trim(data)
		SELECT count(*) INTO :ll_cnt FROM customer WHERE icube_no = :ls_icubeno;
			 
		if ll_cnt <= 0 then
			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			Messagebox("확인","입력한 더존코드의 거래처는 존재하지 않습니다.")
			RETURN
		elseif ll_cnt > 1 then
			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			Messagebox("확인","입력한 더존코드의 거래처는 " + string(ll_cnt) + " 존재 합니다.")
			RETURN
		else
			this.object.cust_no[1]   = ""
			this.object.cust_no[1]   = idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no")
			this.object.cust_name[1] = ""
			this.object.cust_name[1] = idwc_icube.getitemstring(idwc_icube.getrow(), "cust_name")

			tab_1.tabpage_1.dw_5.reset()
			tab_1.tabpage_2.dw_4.reset()
			tab_1.tabpage_3.dw_6.reset()
			tab_1.tabpage_3.dw_7.reset()
			tab_1.tabpage_3.dw_21.reset()
			
			tab_1.tabpage_1.dw_5.setfocus()
			tab_1.tabpage_1.dw_5.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
			tab_1.tabpage_2.dw_4.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
			tab_1.tabpage_4.dw_17.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_7.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_21.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
			tab_1.tabpage_3.dw_6.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"), &
													integer(string(wf_today(),"YYYY")))
			tab_1.tabpage_5.dw_19.retrieve(idwc_icube.getitemstring(idwc_icube.getrow(), "cust_no"))
		end if
end choose		

tab_1.tabpage_4.st_2.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_4.st_3.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]
tab_1.tabpage_3.st_5.text = tab_1.tabpage_1.dw_5.object.cust_no[getrow()]
tab_1.tabpage_3.st_6.text = tab_1.tabpage_1.dw_5.object.cust_name[getrow()]

is_salesman = tab_1.tabpage_1.dw_5.object.salesman[getrow()]
tab_1.tabpage_3.em_1.text = string(wf_today(),"YYYY")
tab_1.tabpage_1.dw_5.object.cust_no.protect = true

dw_15.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), tab_1.tabpage_3.st_5.text)
dw_28.retrieve(tab_1.tabpage_3.st_5.text)


end event

event dw_1::clicked;call super::clicked;pb_insert.enabled = true
dw_24.Visible = False

dw_15.visible = false

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
		dw_24.Retrieve( 'A%',  ls_open, ls_zero, ls_salesman )
	case else
		dw_24.Visible  =  False
end choose

dw_24.setsort( "aname, del" )
dw_24.sort()

end event

type st_title from w_inheritance`st_title within w_cdcustomer_r
integer x = 37
integer y = 0
integer width = 1230
string text = "판매거래처 마스터"
end type

type st_tips from w_inheritance`st_tips within w_cdcustomer_r
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustomer_r
integer x = 2450
integer y = 48
integer width = 197
integer taborder = 250
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;//
DataWindowChild ldwc_dw3, ldwc_dw6 

if dw_15.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 여신현황이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_15.Modify("dw_2.width = 4978")		// 당년
dw_15.Modify("dw_1.width = 2336")		// 상세정보(발생)
dw_15.Modify("dw_3.width = 2619")		// 상세정보(수금)

// 어음 상세보기
dw_15.getchild('dw_1', ldwc_dw3)
if cbx_2.checked = true then
	ldwc_dw3.setfilter( "" )
else
	ldwc_dw3.setfilter( "set_view <> 'Y'" )
end if
ldwc_dw3.filter()
ldwc_dw3.groupcalc()

// 어음 상세보기
dw_15.getchild('dw_3', ldwc_dw6)
if ldwc_dw6.rowcount() < 1 then ldwc_dw6.insertrow( 0 )

if cbx_2.checked = true then
	ldwc_dw6.setfilter( "" )
else
	ldwc_dw6.setfilter( "set_view <> 'Y'" )
end if
ldwc_dw6.filter()
ldwc_dw6.groupcalc()


dw_15.visible = true
dw_15.title = "이프로그램은 여신현황을 출력합니다."

i_print.st_datawindow = dw_15
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 여신현황을 출력합니다." 
OpenWithParm(w_printsetup, i_print) 

end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustomer_r
boolean visible = false
integer x = 2912
integer y = 44
integer width = 306
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdcustomer_r
integer x = 2661
integer y = 48
integer taborder = 330
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustomer_r
boolean visible = false
integer x = 3744
integer y = 48
integer width = 261
integer taborder = 350
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdcustomer_r
boolean visible = false
integer x = 2427
integer taborder = 370
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustomer_r
boolean visible = false
integer x = 1947
integer y = 44
integer taborder = 380
end type

event pb_delete::clicked;call super::clicked;//string ls_custno
//
//if dw_2.rowcount() < 1 then return	
//
//if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
//	return
//end if	
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//ls_custno = dw_1.object.cust_no[dw_1.getrow()]
//if ls_custno = dw_2.object.cust_no[dw_2.getrow()] then
//	dw_2.deleterow(0)
//	wf_update1(dw_2,"Y")
//   dw_1.deleterow(dw_1.getrow())
//else
//	dw_2.deleterow(0)
//	dw_2.retrieve(ls_custno)
//end if	
//
end event

type pb_insert from w_inheritance`pb_insert within w_cdcustomer_r
boolean visible = false
integer x = 2386
integer y = 60
integer taborder = 400
integer weight = 400
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustomer_r
boolean visible = false
integer x = 1851
integer taborder = 390
end type

type gb_3 from w_inheritance`gb_3 within w_cdcustomer_r
boolean visible = false
integer x = 1010
integer y = 232
integer width = 2514
integer height = 1560
integer taborder = 220
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustomer_r
integer x = 37
integer y = 224
integer width = 4603
integer height = 236
integer taborder = 240
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustomer_r
integer x = 2053
integer y = 0
integer width = 832
integer height = 220
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustomer_r
integer x = 46
integer y = 148
integer width = 165
integer height = 88
integer taborder = 200
string dataobject = "d_cdmycustomer_s"
boolean vscrollbar = false
end type

type dw_3 from datawindow within w_cdcustomer_r
boolean visible = false
integer x = 1568
integer y = 52
integer width = 64
integer height = 72
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdcustomer_r"
boolean livescroll = true
end type

type tab_1 from tab within w_cdcustomer_r
integer x = 32
integer y = 468
integer width = 4599
integer height = 2596
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_4=create tabpage_4
this.tabpage_3=create tabpage_3
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_4,&
this.tabpage_3,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_4)
destroy(this.tabpage_3)
destroy(this.tabpage_5)
end on

event clicked;dw_24.Visible = False
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4562
integer height = 2472
long backcolor = 79416533
string text = "판매거래처 헤더"
long tabtextcolor = 16711680
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
cb_5 cb_5
dw_rem_i dw_rem_i
dw_5 dw_5
cb_4 cb_4
cb_2 cb_2
end type

on tabpage_1.create
this.cb_5=create cb_5
this.dw_rem_i=create dw_rem_i
this.dw_5=create dw_5
this.cb_4=create cb_4
this.cb_2=create cb_2
this.Control[]={this.cb_5,&
this.dw_rem_i,&
this.dw_5,&
this.cb_4,&
this.cb_2}
end on

on tabpage_1.destroy
destroy(this.cb_5)
destroy(this.dw_rem_i)
destroy(this.dw_5)
destroy(this.cb_4)
destroy(this.cb_2)
end on

type cb_5 from commandbutton within tabpage_1
integer x = 3209
integer y = 2344
integer width = 379
integer height = 120
integer taborder = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "비고 내역"
end type

event clicked;// 비고 History
long   ll_cnt
string ls_cust_no

dw_rem.settransobject(sqlca)
ls_cust_no = dw_1.object.cust_no[1]
ll_cnt     = dw_rem.retrieve(ls_cust_no)
dw_rem.visible = true
dw_rem.setfocus()
if ll_cnt > 0 then 
	dw_rem.scrolltorow(ll_cnt)
end if
end event

type dw_rem_i from datawindow within tabpage_1
integer x = 18
integer y = 2336
integer width = 2949
integer height = 140
integer taborder = 102
string title = "none"
string dataobject = "d_cdcustomer_det_i"
boolean border = false
boolean livescroll = true
end type

type dw_5 from datawindow within tabpage_1
event editchanged pbm_dwnchanging
event itemchanged pbm_dwnitemchange
integer x = 18
integer y = 8
integer width = 4352
integer height = 2176
integer taborder = 1
string dataobject = "d_cdcustomer_m1"
boolean border = false
boolean livescroll = true
end type

event editchanged;//tab_1.tabpage_2.dw_4.object.custinfo_cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_2.dw_4.object.customer_cust_name[row] = this.object.cust_name[row]
//tab_1.tabpage_3.dw_6.object.cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_3.dw_6.object.eom_year[row] = wf_today()
//tab_1.tabpage_3.dw_6.object.make_date[row] = wf_today()
//tab_1.tabpage_3.dw_6.object.make_user[row] = gs_userid
//tab_1.tabpage_4.dw_8.object.cust_no[row] = this.object.cust_no[row]
////tab_1.tabpage_3.dw_6.object.name[row] = this.object.cust_name[row]
//tab_1.tabpage_4.st_2.text = this.object.cust_no[row]
//tab_1.tabpage_4.st_3.text = this.object.cust_name[row]
//tab_1.tabpage_3.st_5.text = this.object.cust_no[row]
//tab_1.tabpage_3.st_6.text = this.object.cust_name[row]
//
end event

event itemchanged;//
this.accepttext()

tab_1.tabpage_2.dw_4.object.custinfo_cust_no[row] = this.object.cust_no[row]
tab_1.tabpage_2.dw_4.object.customer_cust_name[row] = this.object.cust_name[row]
tab_1.tabpage_3.dw_6.object.cust_no[row] = this.object.cust_no[row]
tab_1.tabpage_3.dw_6.object.eom_year[row] = wf_today()
tab_1.tabpage_3.dw_6.object.make_date[row] = wf_today()
tab_1.tabpage_3.dw_6.object.make_user[row] = gs_userid
tab_1.tabpage_4.dw_8.object.cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_3.dw_6.object.name[row] = this.object.cust_name[row]
tab_1.tabpage_4.st_2.text = this.object.cust_no[row]
tab_1.tabpage_4.st_3.text = this.object.cust_name[row]
tab_1.tabpage_3.st_5.text = this.object.cust_no[row]
tab_1.tabpage_3.st_6.text = this.object.cust_name[row]

end event

event itemfocuschanged;//this.accepttext()
//tab_1.tabpage_2.dw_4.object.custinfo_cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_2.dw_4.object.customer_cust_name[row] = this.object.cust_name[row]
//tab_1.tabpage_3.dw_6.object.cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_3.dw_6.object.eom_year[row] = wf_today()
//tab_1.tabpage_3.dw_6.object.make_date[row] = wf_today()
//tab_1.tabpage_3.dw_6.object.make_user[row] = gs_userid
//tab_1.tabpage_4.dw_8.object.cust_no[row] = this.object.cust_no[row]
//tab_1.tabpage_4.st_2.text = this.object.cust_no[row]
//tab_1.tabpage_4.st_3.text = this.object.cust_name[row]
//tab_1.tabpage_3.st_5.text = this.object.cust_no[row]
//tab_1.tabpage_3.st_6.text = this.object.cust_name[row]
//
end event

event retrieveend;//
string ls_cust_no, ls_rem

ls_cust_no = tab_1.tabpage_1.dw_5.object.cust_no[1]
tab_1.tabpage_1.dw_rem_i.insertrow(0)

SELECT top 1 isnull(rem,'') INTO :ls_rem 
  FROM customer_det 
 WHERE cust_no = :ls_cust_no 
 ORDER BY idate desc, seq desc;

is_rem_old = ls_rem
tab_1.tabpage_1.dw_rem_i.object.rem[1] = ls_rem

end event

event buttonclicked;//
if dwo.name = 'b_1' then
	open(w_cdcustlevel_w)
end if
end event

type cb_4 from commandbutton within tabpage_1
integer x = 2967
integer y = 2344
integer width = 229
integer height = 120
integer taborder = 122
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;// 저장
dwitemstatus l_status_rem
string   ls_rem, ls_cust_no
integer  li_seq
datetime ldt_today

dw_rem_i.accepttext()
l_status_rem = tab_1.tabpage_1.dw_rem_i.getitemstatus(1, 0, primary!)

if l_status_rem <> NotModified! then
	ls_cust_no = ""
	ls_rem     = tab_1.tabpage_1.dw_rem_i.object.rem[1]
	ls_cust_no = tab_1.tabpage_1.dw_5.object.cust_no[1]
	
	SELECT top 1 convert(datetime, convert(varchar(10), getdate(), 111))
     INTO :ldt_today
	  FROM login;

	SELECT count(*) + 1 INTO :li_seq
	  FROM customer_det
	 WHERE cust_no = :ls_cust_no AND idate   = :ldt_today;

	if isnull(ls_rem) or trim(ls_rem) = "" then ls_rem = ""
	
	if is_rem_old <> ls_rem then
		INSERT INTO customer_det (cust_no, idate, seq, rem, iuser) 
		VALUES (:ls_cust_no, getdate(), :li_seq, :ls_rem, :gs_userid);
		COMMIT;
		is_rem_old = ls_rem
	end if
end if

end event

type cb_2 from commandbutton within tabpage_1
integer x = 4320
integer y = 8
integer width = 256
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<= 출력"
end type

event clicked;//
gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where

if dw_5.rowcount() < 1 then
  	messagebox("확인", "판매거래처를 선택하십시요.",information!)
	return
end if

dw_5.object.addr2[1] = ""
dw_5.object.addr3[1] = ""
dw_5.object.bus_addr2[1] = ""
dw_5.object.bus_addr3[1] = ""

l_print.st_datawindow  = dw_5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처 마스터를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Margin.Top=500 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4562
integer height = 2472
long backcolor = 79416533
string text = "판매거래처 상세"
long tabtextcolor = 16711680
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
dw_4 dw_4
cb_3 cb_3
end type

on tabpage_2.create
this.dw_4=create dw_4
this.cb_3=create cb_3
this.Control[]={this.dw_4,&
this.cb_3}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.cb_3)
end on

type dw_4 from datawindow within tabpage_2
integer x = 18
integer y = 4
integer width = 2734
integer height = 1628
integer taborder = 1
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdcustomer_m2"
boolean border = false
boolean livescroll = true
end type

type cb_3 from commandbutton within tabpage_2
integer x = 3575
integer y = 92
integer width = 320
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "<= 출력"
end type

event clicked;gs_codere_str lst_code
w_repsuper w_print
st_print l_print
string ls_sql, ls_where

if dw_4.rowcount() < 1 then
  	messagebox("확인", "판매거래처를 선택하십시요.",information!)
	return
end if
l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 판매거래처 마스터상세내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=120'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4562
integer height = 2472
long backcolor = 79220952
string text = "공사예상현장"
long tabtextcolor = 16711680
long tabbackcolor = 79220952
long picturemaskcolor = 536870912
st_1 st_1
st_2 st_2
gb_5 gb_5
gb_4 gb_4
st_3 st_3
dw_8 dw_8
pb_exinsert pb_exinsert
pb_exdelete pb_exdelete
pb_exsave pb_exsave
dw_17 dw_17
pb_2 pb_2
pb_3 pb_3
end type

on tabpage_4.create
this.st_1=create st_1
this.st_2=create st_2
this.gb_5=create gb_5
this.gb_4=create gb_4
this.st_3=create st_3
this.dw_8=create dw_8
this.pb_exinsert=create pb_exinsert
this.pb_exdelete=create pb_exdelete
this.pb_exsave=create pb_exsave
this.dw_17=create dw_17
this.pb_2=create pb_2
this.pb_3=create pb_3
this.Control[]={this.st_1,&
this.st_2,&
this.gb_5,&
this.gb_4,&
this.st_3,&
this.dw_8,&
this.pb_exinsert,&
this.pb_exdelete,&
this.pb_exsave,&
this.dw_17,&
this.pb_2,&
this.pb_3}
end on

on tabpage_4.destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.st_3)
destroy(this.dw_8)
destroy(this.pb_exinsert)
destroy(this.pb_exdelete)
destroy(this.pb_exsave)
destroy(this.dw_17)
destroy(this.pb_2)
destroy(this.pb_3)
end on

type st_1 from statictext within tabpage_4
integer x = 46
integer y = 40
integer width = 389
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_4
integer x = 430
integer y = 40
integer width = 178
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_5 from groupbox within tabpage_4
integer x = 18
integer y = 1104
integer width = 3049
integer height = 1296
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "세부사항"
end type

type gb_4 from groupbox within tabpage_4
integer x = 14
integer width = 2254
integer height = 140
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
end type

type st_3 from statictext within tabpage_4
integer x = 617
integer y = 40
integer width = 1618
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_8 from datawindow within tabpage_4
integer x = 46
integer y = 1168
integer width = 2766
integer height = 1208
integer taborder = 51
boolean bringtotop = true
string dataobject = "d_cdexscenedet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//long ll_row
//string ls_cust_no,ls_ex_name
//datetime ls_ex_year
//
//this.accepttext()
//
//ll_row = tab_1.tabpage_4.dw_8.rowcount()
//ls_cust_no = tab_1.tabpage_4.st_2.text
//tab_1.tabpage_4.dw_8.object.cust_no[ll_row] = ls_cust_no
//
//ls_ex_year = tab_1.tabpage_4.dw_17.getitemdatetime(tab_1.tabpage_4.dw_17.rowcount(), "ex_year")
//tab_1.tabpage_4.dw_8.object.ex_year[ll_row] = 	ls_ex_year
//
//ls_ex_name = tab_1.tabpage_4.dw_17.getitemstring(tab_1.tabpage_4.dw_17.rowcount(), "ex_name")
//tab_1.tabpage_4.dw_8.object.ex_name[ll_row] = ls_ex_name
//
//tab_1.tabpage_4.dw_8.object.ex_seq[ll_row] = 1
// 
end event

type pb_exinsert from picturebutton within tabpage_4
boolean visible = false
integer x = 2395
integer y = 4
integer width = 187
integer height = 144
integer taborder = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = left!
end type

type pb_exdelete from picturebutton within tabpage_4
boolean visible = false
integer x = 2592
integer y = 4
integer width = 187
integer height = 144
integer taborder = 61
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = left!
end type

type pb_exsave from picturebutton within tabpage_4
boolean visible = false
integer x = 2784
integer y = 8
integer width = 187
integer height = 144
integer taborder = 81
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
string disabledname = "c:\bmp\save.bmp"
alignment htextalign = left!
end type

type dw_17 from datawindow within tabpage_4
integer x = 37
integer y = 156
integer width = 3461
integer height = 916
integer taborder = 62
boolean bringtotop = true
string dataobject = "d_cdexscene_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount() > 0 then
   tab_1.tabpage_4.dw_8.retrieve(this.object.cust_no[this.getrow()], this.object.ex_year[this.getrow()],this.object.ex_name[this.getrow()] )
end if
 
 
	
end event

type pb_2 from picturebutton within tabpage_4
boolean visible = false
integer x = 2825
integer y = 984
integer width = 187
integer height = 144
integer taborder = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = left!
end type

event clicked;long ll_row 
string ls_ex_item, ls_seq, ls_ex_qa 

tab_1.tabpage_4.dw_17.accepttext()
ll_row = tab_1.tabpage_4.dw_17.getrow()
if ll_row < 1 then
		messagebox("확인","공사명을 입력하세요!",information!)
	return
end if

tab_1.tabpage_4.dw_8.accepttext()
ll_row = tab_1.tabpage_4.dw_8.getrow()
if ll_row > 0 then
	ls_ex_item = tab_1.tabpage_4.dw_8.getitemstring(tab_1.tabpage_4.dw_8.rowcount(), "ex_item")
	ls_ex_qa = tab_1.tabpage_4.dw_8.getitemstring(tab_1.tabpage_4.dw_8.rowcount(), "ex_qa")
	if isnull(ls_ex_item) or ls_ex_item = ""  then
		messagebox("확인","공종명을 입력하세요!",information!)
		tab_1.tabpage_4.dw_8.scrolltorow(tab_1.tabpage_4.dw_8.rowcount())
		tab_1.tabpage_4.dw_8.setcolumn("ex_item")
		tab_1.tabpage_4.dw_8.setfocus()
		return
	elseif isnull(ls_ex_qa) or ls_ex_qa = "" then
		messagebox("확인","규 격을 입력하세요!",information!)
		tab_1.tabpage_4.dw_8.scrolltorow(tab_1.tabpage_4.dw_8.rowcount())
		tab_1.tabpage_4.dw_8.setcolumn("ex_qa")
		tab_1.tabpage_4.dw_8.setfocus()
		return
	end if
end if
ll_row = tab_1.tabpage_4.dw_8.insertrow(0)
tab_1.tabpage_4.dw_8.object.cust_no[ll_row] = dw_1.getitemstring(dw_1.getrow(), "cust_no")
tab_1.tabpage_4.dw_8.object.ex_year[ll_row] = tab_1.tabpage_4.dw_17.getitemdatetime(tab_1.tabpage_4.dw_17.getrow(), "ex_year")
tab_1.tabpage_4.dw_8.object.ex_name[ll_row] = tab_1.tabpage_4.dw_17.getitemstring(tab_1.tabpage_4.dw_17.getrow(), "ex_name")
tab_1.tabpage_4.dw_8.scrolltorow(ll_row)
tab_1.tabpage_4.dw_8.setcolumn("ex_item")
tab_1.tabpage_4.dw_8.setfocus()



end event

type pb_3 from picturebutton within tabpage_4
boolean visible = false
integer x = 2825
integer y = 1140
integer width = 187
integer height = 144
integer taborder = 82
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = left!
end type

event clicked;tab_1.tabpage_4.dw_8.deleterow(0)

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4562
integer height = 2472
long backcolor = 79220952
string text = "매출/수금내역"
long tabtextcolor = 16711680
long tabbackcolor = 79220952
long picturemaskcolor = 536870912
gb_8 gb_8
gb_7 gb_7
dw_6 dw_6
dw_7 dw_7
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
em_1 em_1
dw_21 dw_21
end type

on tabpage_3.create
this.gb_8=create gb_8
this.gb_7=create gb_7
this.dw_6=create dw_6
this.dw_7=create dw_7
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.em_1=create em_1
this.dw_21=create dw_21
this.Control[]={this.gb_8,&
this.gb_7,&
this.dw_6,&
this.dw_7,&
this.st_4,&
this.st_5,&
this.st_6,&
this.st_7,&
this.em_1,&
this.dw_21}
end on

on tabpage_3.destroy
destroy(this.gb_8)
destroy(this.gb_7)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.dw_21)
end on

type gb_8 from groupbox within tabpage_3
integer x = 9
integer y = 916
integer width = 4553
integer height = 1480
integer taborder = 81
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
end type

type gb_7 from groupbox within tabpage_3
integer x = 9
integer width = 3369
integer height = 900
integer taborder = 111
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "전년이월금액(수금관리->매출 년마감)"
end type

type dw_6 from datawindow within tabpage_3
event ue_spin pbm_enchange
integer x = 41
integer y = 124
integer width = 3323
integer height = 768
integer taborder = 111
boolean bringtotop = true
string dataobject = "d_cdinvcoll_q"
boolean border = false
boolean livescroll = true
end type

event ue_spin;//this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

event editchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))

end event

event itemchanged;this.retrieve(this.object.cust_no[row], integer(string(this.object.eom_year[row],'YYYY')))
end event

event doubleclicked;string ls_cust_no, ls_name, ls_yyyymm

ls_name = LeftA( trim(dwo.name), 3)
ls_yyyymm = trim(em_1.text)+MidA( trim(dwo.name), 5,2)
ls_cust_no = trim(this.object.cust_no[row])

if ls_name = 'inv' then
	
	
	dw_29.reset()
	dw_29.title = MidA( trim(dwo.name), 5,2) + "월 매출금액"
	
	dw_29.setredraw( false )
	dw_29.visible    = true 
	dw_29.bringtotop = true
	dw_29.retrieve(ls_yyyymm, ls_cust_no)
	dw_29.setredraw( true )		
	
	
	
	
end if
end event

type dw_7 from datawindow within tabpage_3
string tag = "d_cdglbill_q21"
integer x = 23
integer y = 952
integer width = 2199
integer height = 1424
integer taborder = 82
boolean bringtotop = true
string title = "d_cdglbill_q1"
string dataobject = "d_cdglbill_q21"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;///////////////////////////////////////////////////////////////////////////////
// 2012/12/05 this.getitemstring(this.getrow(), "vc_no") 오류 확인 Event 제거
///////////////////////////////////////////////////////////////////////////////

//int    li_count
//string ls_vc_no
//
//this.accepttext()
//dw_1.accepttext()
//
//if this.rowcount() < 1 then
//	messagebox("확인", "어음내역이 없습니다!",information!)
//	return
//end if
//
//ls_vc_no = this.getitemstring(this.getrow(), "vc_no")
//if ls_vc_no = '' or isnull(ls_vc_no) then
//	messagebox("확인", "어음내역이 없습니다!",information!)
//	return
//else
//	dw_9.retrieve(ls_vc_no)	
//	li_count = dw_9.rowcount()
//	if dw_9.rowcount() > 0 then
//     	openwithparm(w_cdbilldet_m, ls_vc_no)
//   else
//		messagebox("", ls_vc_no + string(li_count))
//	end if
//end if
//
end event

type st_4 from statictext within tabpage_3
integer x = 41
integer y = 44
integer width = 384
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "판매거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_3
integer x = 425
integer y = 44
integer width = 242
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_3
integer x = 667
integer y = 44
integer width = 1275
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_3
integer x = 2130
integer y = 44
integer width = 315
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within tabpage_3
event us_modified pbm_enchange
integer x = 2446
integer y = 44
integer width = 261
integer height = 76
integer taborder = 141
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
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event us_modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
end event

event modified;tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
//tab_1.tabpage_3.dw_6.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text))
dw_15.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), tab_1.tabpage_3.st_5.text)


end event

type dw_21 from datawindow within tabpage_3
integer x = 2235
integer y = 952
integer width = 2309
integer height = 1424
integer taborder = 210
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdglbill_q22"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 108
integer width = 4562
integer height = 2472
long backcolor = 79416533
string text = "매출계획"
long tabtextcolor = 128
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
st_8 st_8
ddlb_1 ddlb_1
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
pb_5 pb_5
dw_19 dw_19
end type

on tabpage_5.create
this.st_8=create st_8
this.ddlb_1=create ddlb_1
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_6=create pb_6
this.pb_5=create pb_5
this.dw_19=create dw_19
this.Control[]={this.st_8,&
this.ddlb_1,&
this.pb_9,&
this.pb_8,&
this.pb_6,&
this.pb_5,&
this.dw_19}
end on

on tabpage_5.destroy
destroy(this.st_8)
destroy(this.ddlb_1)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.dw_19)
end on

type st_8 from statictext within tabpage_5
integer x = 869
integer y = 32
integer width = 82
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "월"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_5
integer x = 965
integer y = 12
integer width = 270
integer height = 804
integer taborder = 220
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"01월","02월","03월","04월","05월","06월","07월","08월","09월","10월","11월","12월","전체"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// 월
integer  ll_col, ll_mon

for ll_col = 1 to 12
	dw_19.Modify("mon" + string(ll_col) + ".width=329")					
	if ll_col = index then
	else
	   dw_19.Modify("mon" + string(ll_col) + ".width=0")					
	end if
next

end event

type pb_9 from picturebutton within tabpage_5
integer x = 558
integer y = 8
integer width = 160
integer height = 100
integer taborder = 121
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\print.bmp"
end type

event clicked;//
String	ls_str

ls_str = tab_1.tabpage_5.ddlb_1.text
if isNULL(ls_str) then ls_str = ''

if (ls_str = '') or (tab_1.tabpage_5.ddlb_1.text = '전체') then
	messagebox("확인", "출력 월을 지정해 주시기 바랍니다.",information!)
   return
end if


////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================

ls_str = LeftA(tab_1.tabpage_5.ddlb_1.text,2)
dw_20.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), integer(ls_str))

if dw_20.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 매출계획이 없습니다.",information!)
   return
end if

dw_20.visible = true
dw_20.title = "이프로그램은 여신현황을 출력합니다."


i_print.st_datawindow = dw_20
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 여신현황을 출력합니다." 
OpenWithParm(w_printsetup, i_print) 



end event

type pb_8 from picturebutton within tabpage_5
integer x = 389
integer y = 8
integer width = 160
integer height = 100
integer taborder = 121
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
end type

event clicked;// 저장

wf_update1(dw_19, "Y")

end event

type pb_6 from picturebutton within tabpage_5
integer x = 206
integer y = 8
integer width = 160
integer height = 100
integer taborder = 121
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;// 삭제

dw_19.deleterow(dw_19.getrow())

end event

type pb_5 from picturebutton within tabpage_5
integer x = 27
integer y = 8
integer width = 160
integer height = 100
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
end type

event clicked;// 추가
long   ll_row
string ls_custno

ls_custno = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_no")
if isnull(ls_custno) or ls_custno = "" then return

ll_row = dw_19.insertrow(0)
dw_19.scrolltorow(ll_row)

dw_19.object.cust_no[ll_row] = ls_custno
dw_19.object.seq[ll_row]     = dw_19.getrow()


end event

type dw_19 from datawindow within tabpage_5
integer x = 18
integer y = 112
integer width = 4539
integer height = 2280
integer taborder = 60
string title = "none"
string dataobject = "d_cdcustomer_doplan"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_9 from datawindow within w_cdcustomer_r
boolean visible = false
integer x = 1518
integer y = 24
integer width = 489
integer height = 360
integer taborder = 320
boolean bringtotop = true
string dataobject = "d_cdglbilldet_m"
boolean livescroll = true
end type

type dw_10 from datawindow within w_cdcustomer_r
integer x = 379
integer y = 148
integer width = 91
integer height = 68
integer taborder = 300
boolean bringtotop = true
string dataobject = "d_cdcustm_r"
boolean livescroll = true
end type

type dw_11 from datawindow within w_cdcustomer_r
integer x = 485
integer y = 148
integer width = 91
integer height = 68
integer taborder = 260
boolean bringtotop = true
string dataobject = "d_cdaroivc_r"
boolean livescroll = true
end type

type dw_12 from datawindow within w_cdcustomer_r
integer x = 585
integer y = 148
integer width = 91
integer height = 68
integer taborder = 280
boolean bringtotop = true
string dataobject = "d_cdteamvc_r"
boolean livescroll = true
end type

type dw_13 from datawindow within w_cdcustomer_r
integer x = 686
integer y = 148
integer width = 91
integer height = 68
integer taborder = 290
boolean bringtotop = true
string dataobject = "d_cdmanvc_r"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_cdcustomer_r
boolean visible = false
integer x = 1609
integer y = 48
integer width = 187
integer height = 144
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
end type

event clicked;w_repsuper w_print
st_print l_print

   l_print.st_datawindow = dw_14
   l_print.st_print_sheet = " 프린트용지 : A4"
   l_print.st_print_desc = " 이 프로그램은 판매거래처의 리스트를 출력합니다." 

   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                      'Datawindow.Zoom=100'
   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type dw_14 from datawindow within w_cdcustomer_r
integer x = 791
integer y = 148
integer width = 91
integer height = 68
integer taborder = 170
boolean bringtotop = true
string dataobject = "d_cdcustomer_pr1"
boolean livescroll = true
end type

type dw_15 from datawindow within w_cdcustomer_r
string tag = "d_cdglbill_r2"
integer x = 2295
integer y = 1416
integer width = 2126
integer height = 1008
integer taborder = 130
boolean bringtotop = true
boolean titlebar = true
string title = "d_cdglbill_r1"
string dataobject = "d_cdglbill_r1"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type pb_1 from picturebutton within w_cdcustomer_r
integer x = 859
integer y = 136
integer width = 379
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "공사예상현장"
vtextalign vtextalign = vcenter!
end type

event clicked;gs_custdo_str lst_code
string ls_sql, ls_where
date ld_start, ld_end
long ll_count
w_repsuper w_print
st_print l_print


openwithparm(w_whcustdor_w, lst_code)

lst_code = message.powerobjectparm

if lst_code.okcancel = 'N' then
	return
end if

//messagebox('',string (lst_code.start_date))
//ld_start = date(string(lst_code.start_date,"yyyy/mm/dd"))
//ld_end = date(lst_code.end_date)
 
if lst_code.sel_flag = 'A' then
   ls_where = " and exscene.ex_year between ~~'" + &
	           string(lst_code.start_date) + "~~' and " + "~~'" + string(lst_code.end_date) + "~~'"		
else
   ls_where = " and exscene.ex_year between ~~'" + string(lst_code.start_date) + "~~' and ~~'" + &
	           string(lst_code.end_date) + "~~' and exscene.cust_no between ~~'" + &				
	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
end if

ls_sql = "datawindow.table.select = '" + is_custdorsql + ls_where + "'"
dw_16.settransobject(sqlca)
dw_16.modify(ls_sql)
dw_16.retrieve()
//dw_2.object.bus_tel[1] = date(ld_start)
//dw_2.object.tel_no[1] = date(ld_end)
//
if dw_16.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

l_print.name = 'd_cdcustexscene_r'
l_print.st_datawindow = dw_16
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 판매거래처별 공사예상현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type dw_16 from datawindow within w_cdcustomer_r
integer x = 901
integer y = 148
integer width = 91
integer height = 68
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdcustexscene_r"
boolean livescroll = true
end type

type dw_rem from datawindow within w_cdcustomer_r
integer x = 1262
integer y = 1184
integer width = 2642
integer height = 1328
integer taborder = 230
boolean bringtotop = true
boolean titlebar = true
string title = "비고 내역"
string dataobject = "d_cdcustomer_det_s"
boolean controlmenu = true
boolean vscrollbar = true
string icon = "Database!"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 
this.scrolltorow( row )

end event

type dw_24 from datawindow within w_cdcustomer_r
integer x = 2098
integer y = 1332
integer width = 1637
integer height = 1456
integer taborder = 150
boolean bringtotop = true
boolean titlebar = true
string title = "순수 거래처명"
string dataobject = "d_cdcustlist_r"
boolean controlmenu = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event doubleclicked;//
string ls_custno, ls_custnm, ls_salesman, ls_colllevel
long   ll_row, ll_find

dw_24.AcceptText()

ll_row    = dw_24.GetRow()
ls_custno = dw_24.Object.cid[ll_row]
ls_custnm = dw_24.Object.fname[ll_row]

///////////////////////////////////////////
// 매출조직별 거래처 CHECK
///////////////////////////////////////////
if GF_PERMISSION("판매거래처 마스터(ALL)", gs_userid) = "Y" then
else
	dw_2.retrieve( gs_userid )
	if dw_2.rowcount() < 1 then
		MessageBox("확인","매출조직별 거래처 대상에 존재하지 않습니다.")
		RETURN
	else
		ll_find = dw_2.find( "cust_name = '" + ls_custnm + "' ", 1, dw_2.rowcount() )
		if ll_find > 0 then
			// 매출조직거래처
		else				
			MessageBox("확인","해당하는 거래처의 담당자는 [" + ls_salesman + "] 입니다.~n~n거래처 열람할 수 없습니다.")
			RETURN
		end if
	end if
end if
///////////////////////////////////////////

if isnull(ls_custno) OR ls_custno = "" then
else
	dw_1.Object.cust_no[1]   = ls_custno
	dw_1.Object.cust_name[1] = ls_custnm
	dw_24.Visible  =  False
	tab_1.tabpage_1.dw_5.reset()
	tab_1.tabpage_2.dw_4.reset()
	tab_1.tabpage_3.dw_6.reset()
	tab_1.tabpage_3.dw_7.reset()
	tab_1.tabpage_1.dw_5.setfocus()
	tab_1.tabpage_1.dw_5.retrieve(ls_custno)
	tab_1.tabpage_2.dw_4.retrieve(ls_custno)
	tab_1.tabpage_4.dw_17.retrieve(ls_custno)
	tab_1.tabpage_3.dw_7.retrieve(ls_custno)
	tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
	tab_1.tabpage_4.st_2.text = tab_1.tabpage_1.dw_5.object.cust_no[1]
	tab_1.tabpage_4.st_3.text = tab_1.tabpage_1.dw_5.object.cust_name[1]
	tab_1.tabpage_3.st_5.text = tab_1.tabpage_1.dw_5.object.cust_no[1]
	tab_1.tabpage_3.st_6.text = tab_1.tabpage_1.dw_5.object.cust_name[1]
	is_salesman = tab_1.tabpage_1.dw_5.object.salesman[1]
	tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
	tab_1.tabpage_1.dw_5.object.cust_no.protect = true
	dw_15.retrieve(tab_1.tabpage_3.st_5.text, integer(tab_1.tabpage_3.em_1.text), tab_1.tabpage_3.st_5.text)
end if

end event

type pb_4 from picturebutton within w_cdcustomer_r
integer x = 2085
integer y = 48
integer width = 361
integer height = 144
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현장관리"
vtextalign vtextalign = vcenter!
end type

event clicked;// 현장관리
if IsValid(w_o_main) then 
	OpenSheet(w_cdscene_m,  w_o_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdscene_m,  w_all_main, 5, original!)
end if

end event

type dw_18 from datawindow within w_cdcustomer_r
integer x = 1006
integer y = 148
integer width = 91
integer height = 68
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_list"
boolean livescroll = true
end type

type pb_7 from picturebutton within w_cdcustomer_r
integer x = 4023
integer y = 48
integer width = 489
integer height = 144
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처리스트"
vtextalign vtextalign = vcenter!
end type

event clicked;long    ll_row
string  ls_Docname, ls_Named, ls_ExpandName, ls_open
integer ls_Value, li_Pos, li_value
DataWindow dwxls

if MessageBox("확인","거래처리스트를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 2 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

ll_row = dw_18.Retrieve( ls_open, '%', '%' )
dwxls = dw_18
if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
else
	MessageBox("확인",string(ll_row,"#,##0") + " 건의 엑셀 파일을 생성하였습니다.")	
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//						dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
	
end if   

MessageBox("확인","엑셀파일 작업완료.")

end event

type cbx_open from checkbox within w_cdcustomer_r
integer x = 3515
integer y = 260
integer width = 544
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

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

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
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
ll_row = idwc_icube.retrieve( ls_open)
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

end event

type cbx_salesman from checkbox within w_cdcustomer_r
integer x = 4073
integer y = 324
integer width = 558
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "영업담당 이력"
end type

event clicked;//
string ls_custno

ls_custno = dw_1.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	MessageBox("확인","거래처를 선택 하시요.")
	this.checked = false
	return
end if

dw_28.bringtotop = true
if this.checked = true then
	dw_28.visible = true
	dw_28.retrieve( ls_custno )
else
	dw_28.visible = false
end if

end event

type dw_20 from datawindow within w_cdcustomer_r
integer x = 265
integer y = 148
integer width = 91
integer height = 68
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_doplan_r"
boolean livescroll = true
end type

type dw_28 from datawindow within w_cdcustomer_r
integer x = 2025
integer y = 624
integer width = 1152
integer height = 2140
integer taborder = 270
boolean bringtotop = true
boolean titlebar = true
string title = "영업담당 이력(수주기준)"
string dataobject = "d_sale_salesman"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_10 from picturebutton within w_cdcustomer_r
integer x = 2976
integer y = 352
integer width = 471
integer height = 88
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이력카드"
vtextalign vtextalign = vcenter!
end type

event clicked;// 거래처 이력카드
string ls_custno, ls_custname

if IsValid(w_o_main) then 
	OpenSheet(w_cdcustomer_base_m, w_o_main,   5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcustomer_base_m, w_all_main, 5, original!)
end if

ls_custno   = dw_1.object.cust_no[1]
ls_custname = dw_1.object.cust_name[1]
if isnull(ls_custno) or ls_custno = "" then
else
	w_cdcustomer_base_m.dw_1.object.cust_no[1]   = ls_custno
	w_cdcustomer_base_m.dw_1.object.cust_name[1] = ls_custname
	w_cdcustomer_base_m.pb_retrieve.triggerevent( clicked! )		// 실행 OK
end if

end event

type st_22 from statictext within w_cdcustomer_r
integer x = 1349
integer y = 40
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

type dw_salesman from datawindow within w_cdcustomer_r
integer x = 1344
integer y = 116
integer width = 672
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "담당자"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
long   ll_row
string ls_open, ls_zero, ls_salesman

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
	ls_zero = "O"
else
	ls_zero = "%"
end if

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

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
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
ll_row = idwc_icube.retrieve( ls_open)
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

end event

type pb_11 from picturebutton within w_cdcustomer_r
integer x = 2976
integer y = 264
integer width = 471
integer height = 88
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "채권카드"
vtextalign vtextalign = vcenter!
end type

event clicked;// 거래처 채권카드
string ls_custno, ls_custname

if IsValid(w_o_main) then 
	OpenSheet(w_cdcustomer_credit_m, w_o_main,   5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcustomer_credit_m, w_all_main, 5, original!)
end if

ls_custno   = dw_1.object.cust_no[1]
ls_custname = dw_1.object.cust_name[1]
if isnull(ls_custno) or ls_custno = "" then
else
	w_cdcustomer_credit_m.dw_1.object.cust_no[1]   = ls_custno
	w_cdcustomer_credit_m.dw_1.object.cust_name[1] = ls_custname
	w_cdcustomer_credit_m.pb_retrieve.triggerevent( clicked! )		// 실행 OK
end if

end event

type cbx_2 from checkbox within w_cdcustomer_r
integer x = 4073
integer y = 388
integer width = 558
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
	tab_1.tabpage_3.dw_7.setfilter( "" )
else
	tab_1.tabpage_3.dw_7.setfilter( "set_view <> 'Y'" )
end if
tab_1.tabpage_3.dw_7.filter()
tab_1.tabpage_3.dw_7.groupcalc()

// 어음 상세보기
if this.checked = true then
	tab_1.tabpage_3.dw_21.setfilter( "" )
else
	tab_1.tabpage_3.dw_21.setfilter( "set_view <> 'Y'" )
end if
tab_1.tabpage_3.dw_21.filter()
tab_1.tabpage_3.dw_21.groupcalc()

end event

type cb_bemat from commandbutton within w_cdcustomer_r
integer x = 2496
integer y = 264
integer width = 471
integer height = 176
integer taborder = 410
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선수금현황"
end type

event clicked;// 선수금현황
gs_where        lstr_where
string ls_cust_no, ls_cust_name
long   ll_row

ll_row  = dw_1.getrow()
ls_cust_no   = dw_1.object.cust_no[ll_row]
ls_cust_name = dw_1.object.cust_name[ll_row]

lstr_where.str1 = ls_cust_no
lstr_where.name = ls_cust_name
openwithparm(w_whopeom_beamt_w, lstr_where)

end event

type cbx_zero from checkbox within w_cdcustomer_r
integer x = 4073
integer y = 260
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
end type

event clicked;long   ll_row
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

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

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
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
ll_row = idwc_icube.retrieve( ls_open)
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
///////////////////////////////////////////

end event

type pb_12 from picturebutton within w_cdcustomer_r
integer x = 3749
integer y = 48
integer width = 261
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "리스트 출력"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;//
gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

openwithparm(w_whcust_w, lst_code)

lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

if lst_code.flag = 'A' then
	ls_sql = "datawindow.table.select = '" + is_dwsql + "'"
else
	ls_where = " where customer.cust_no between ~~'" + lst_code.start_no + "~~' and " + &
				  "~~'" + lst_code.end_no + "~~'"
	ls_sql = "datawindow.table.select = '" + is_dwsql + ls_where + "'"
end if

dw_10.settransobject(sqlca)
dw_10.modify(ls_sql)
dw_10.retrieve()

if dw_10.rowcount() < 1 then
  	messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)
	return
end if

l_print.name = 'd_cdcustm_r'
l_print.st_datawindow = dw_10
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 판매거래처 리스트를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_13 from picturebutton within w_cdcustomer_r
integer x = 3438
integer y = 48
integer width = 306
integer height = 144
integer taborder = 360
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = " 여신  리스트"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;//
gs_dovc_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where
long   ll_year

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

openwithparm(w_whvcdo_w, lst_code)

lst_code = message.powerobjectparm

if lst_code.okcancel = 'N' then
	return
end if
ll_year = long(lst_code.dovc_year)
if lst_code.order_flag = '1' then
   if lst_code.sel_flag = 'A' then
	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year) + ""
	   ls_sql = "datawindow.table.select = '" + is_dovcsql + ls_where + "'"
   else
	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
	   ls_sql = "datawindow.table.select = '" + is_dovcsql + ls_where + "'"
   end if
   dw_11.settransobject(sqlca)
   dw_11.modify(ls_sql)
   dw_11.retrieve()

   if dw_11.rowcount() < 1 then
  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
	   return
   end if

   l_print.st_datawindow = dw_11
   l_print.st_print_sheet = " 프린트용지 : B4"
   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 

   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                      'Datawindow.Zoom=100'
   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
elseif lst_code.order_flag = '2' then
   if lst_code.sel_flag = 'A' then
	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year) + ""
	   ls_sql = "datawindow.table.select = '" + is_teamsql + ls_where + "'"
   else
	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
	   ls_sql = "datawindow.table.select = '" + is_teamsql + ls_where + "'"
   end if
   dw_12.settransobject(sqlca)
   dw_12.modify(ls_sql)
   dw_12.retrieve()

   if dw_12.rowcount() < 1 then
  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
	   return
   end if
   l_print.name = 'd_cdteamvc_r'
   l_print.st_datawindow = dw_12
   l_print.st_print_sheet = " 프린트용지 : B4"
   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 

   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                      'Datawindow.Zoom=100'
   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
else
   if lst_code.sel_flag = 'A' then
	   ls_where = " AND datepart(year,opeom.eom_year) = " + string(ll_year)// + ""
	   ls_sql = "datawindow.table.select = '" + is_mansql + ls_where + "'"
   else
	   ls_where = " AND datepart(year, opeom.eom_year) = " + string(ll_year) + " and opeom.cust_no between ~~'" + &
	              lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
	   ls_sql = "datawindow.table.select = '" + is_mansql + ls_where + "'"
   end if
   dw_13.settransobject(sqlca)
   dw_13.modify(ls_sql)
   dw_13.retrieve()

   if dw_13.rowcount() < 1 then
  	   messagebox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
	   return
   end if
   l_print.name = 'd_cdmanvc_r'
   l_print.st_datawindow = dw_13
   l_print.st_print_sheet = " 프린트용지 : B4"
   l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 

   gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + & 
                      'Datawindow.Zoom=100'
   opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if


end event

type dw_29 from datawindow within w_cdcustomer_r
integer x = 1545
integer y = 1088
integer width = 1454
integer height = 1384
integer taborder = 100
boolean bringtotop = true
boolean titlebar = true
string title = "주차 매출금액"
string dataobject = "d_cdcustomer_week_r"
boolean controlmenu = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within w_cdcustomer_r
integer x = 1317
integer width = 722
integer height = 220
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

