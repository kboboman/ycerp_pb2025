$PBExportHeader$w_cdcustmaster_r.srw
$PBExportComments$거래처 여신현황2
forward
global type w_cdcustmaster_r from w_inheritance
end type
type em_1 from editmask within w_cdcustmaster_r
end type
type st_1 from statictext within w_cdcustmaster_r
end type
type cb_1 from commandbutton within w_cdcustmaster_r
end type
type dw_3 from datawindow within w_cdcustmaster_r
end type
type dw_4 from datawindow within w_cdcustmaster_r
end type
type cbx_1 from checkbox within w_cdcustmaster_r
end type
type gb_4 from groupbox within w_cdcustmaster_r
end type
type dw_6 from datawindow within w_cdcustmaster_r
end type
type dw_7 from datawindow within w_cdcustmaster_r
end type
type cbx_open from checkbox within w_cdcustmaster_r
end type
type cb_2 from commandbutton within w_cdcustmaster_r
end type
type st_salesman from statictext within w_cdcustmaster_r
end type
type dw_salesman from datawindow within w_cdcustmaster_r
end type
type st_2 from statictext within w_cdcustmaster_r
end type
type dw_9 from datawindow within w_cdcustmaster_r
end type
type cb_auto from commandbutton within w_cdcustmaster_r
end type
type st_3 from statictext within w_cdcustmaster_r
end type
type cb_3 from commandbutton within w_cdcustmaster_r
end type
type dw_10 from datawindow within w_cdcustmaster_r
end type
type cbx_2 from checkbox within w_cdcustmaster_r
end type
type dw_28 from datawindow within w_cdcustmaster_r
end type
type cbx_6 from checkbox within w_cdcustmaster_r
end type
type dw_11 from datawindow within w_cdcustmaster_r
end type
type cbx_card from checkbox within w_cdcustmaster_r
end type
type cbx_3 from checkbox within w_cdcustmaster_r
end type
type gb_5 from groupbox within w_cdcustmaster_r
end type
type dw_12 from datawindow within w_cdcustmaster_r
end type
type cb_bemat from commandbutton within w_cdcustmaster_r
end type
type dw_24 from datawindow within w_cdcustmaster_r
end type
type cbx_zero from checkbox within w_cdcustmaster_r
end type
type dw_8 from datawindow within w_cdcustmaster_r
end type
type dw_13 from datawindow within w_cdcustmaster_r
end type
type dw_5 from datawindow within w_cdcustmaster_r
end type
type dw_14 from datawindow within w_cdcustmaster_r
end type
type dw_15 from datawindow within w_cdcustmaster_r
end type
type dw_16 from datawindow within w_cdcustmaster_r
end type
type pb_auto from picturebutton within w_cdcustmaster_r
end type
type ddlb_1 from dropdownlistbox within w_cdcustmaster_r
end type
type cb_4 from commandbutton within w_cdcustmaster_r
end type
type dw_17 from datawindow within w_cdcustmaster_r
end type
type pb_cash from picturebutton within w_cdcustmaster_r
end type
type dw_18 from datawindow within w_cdcustmaster_r
end type
type cbx_4 from checkbox within w_cdcustmaster_r
end type
type gb_6 from groupbox within w_cdcustmaster_r
end type
end forward

global type w_cdcustmaster_r from w_inheritance
integer width = 9006
integer height = 4768
string title = "거래처 여신현황(w_cdcustmaster_r)"
boolean hscrollbar = true
boolean vscrollbar = true
em_1 em_1
st_1 st_1
cb_1 cb_1
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
gb_4 gb_4
dw_6 dw_6
dw_7 dw_7
cbx_open cbx_open
cb_2 cb_2
st_salesman st_salesman
dw_salesman dw_salesman
st_2 st_2
dw_9 dw_9
cb_auto cb_auto
st_3 st_3
cb_3 cb_3
dw_10 dw_10
cbx_2 cbx_2
dw_28 dw_28
cbx_6 cbx_6
dw_11 dw_11
cbx_card cbx_card
cbx_3 cbx_3
gb_5 gb_5
dw_12 dw_12
cb_bemat cb_bemat
dw_24 dw_24
cbx_zero cbx_zero
dw_8 dw_8
dw_13 dw_13
dw_5 dw_5
dw_14 dw_14
dw_15 dw_15
dw_16 dw_16
pb_auto pb_auto
ddlb_1 ddlb_1
cb_4 cb_4
dw_17 dw_17
pb_cash pb_cash
dw_18 dw_18
cbx_4 cbx_4
gb_6 gb_6
end type
global w_cdcustmaster_r w_cdcustmaster_r

type variables
public string is_custno,is_custname
st_print i_print

DataWindowChild idwc_cust, idwc_user, idwc_icube, idwc_cust_name, idwc_custhis
string is_select,  is_where, is_clause, is_select1, is_dwsql,is_custdorsql
string is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman
string is_uflag = 'update'
string is_filter = '', is_pbauto_filter = ''
boolean ib_cancel
end variables

on w_cdcustmaster_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.gb_4=create gb_4
this.dw_6=create dw_6
this.dw_7=create dw_7
this.cbx_open=create cbx_open
this.cb_2=create cb_2
this.st_salesman=create st_salesman
this.dw_salesman=create dw_salesman
this.st_2=create st_2
this.dw_9=create dw_9
this.cb_auto=create cb_auto
this.st_3=create st_3
this.cb_3=create cb_3
this.dw_10=create dw_10
this.cbx_2=create cbx_2
this.dw_28=create dw_28
this.cbx_6=create cbx_6
this.dw_11=create dw_11
this.cbx_card=create cbx_card
this.cbx_3=create cbx_3
this.gb_5=create gb_5
this.dw_12=create dw_12
this.cb_bemat=create cb_bemat
this.dw_24=create dw_24
this.cbx_zero=create cbx_zero
this.dw_8=create dw_8
this.dw_13=create dw_13
this.dw_5=create dw_5
this.dw_14=create dw_14
this.dw_15=create dw_15
this.dw_16=create dw_16
this.pb_auto=create pb_auto
this.ddlb_1=create ddlb_1
this.cb_4=create cb_4
this.dw_17=create dw_17
this.pb_cash=create pb_cash
this.dw_18=create dw_18
this.cbx_4=create cbx_4
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_4
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.gb_4
this.Control[iCurrent+8]=this.dw_6
this.Control[iCurrent+9]=this.dw_7
this.Control[iCurrent+10]=this.cbx_open
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.st_salesman
this.Control[iCurrent+13]=this.dw_salesman
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.dw_9
this.Control[iCurrent+16]=this.cb_auto
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.dw_10
this.Control[iCurrent+20]=this.cbx_2
this.Control[iCurrent+21]=this.dw_28
this.Control[iCurrent+22]=this.cbx_6
this.Control[iCurrent+23]=this.dw_11
this.Control[iCurrent+24]=this.cbx_card
this.Control[iCurrent+25]=this.cbx_3
this.Control[iCurrent+26]=this.gb_5
this.Control[iCurrent+27]=this.dw_12
this.Control[iCurrent+28]=this.cb_bemat
this.Control[iCurrent+29]=this.dw_24
this.Control[iCurrent+30]=this.cbx_zero
this.Control[iCurrent+31]=this.dw_8
this.Control[iCurrent+32]=this.dw_13
this.Control[iCurrent+33]=this.dw_5
this.Control[iCurrent+34]=this.dw_14
this.Control[iCurrent+35]=this.dw_15
this.Control[iCurrent+36]=this.dw_16
this.Control[iCurrent+37]=this.pb_auto
this.Control[iCurrent+38]=this.ddlb_1
this.Control[iCurrent+39]=this.cb_4
this.Control[iCurrent+40]=this.dw_17
this.Control[iCurrent+41]=this.pb_cash
this.Control[iCurrent+42]=this.dw_18
this.Control[iCurrent+43]=this.cbx_4
this.Control[iCurrent+44]=this.gb_6
end on

on w_cdcustmaster_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.gb_4)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.cbx_open)
destroy(this.cb_2)
destroy(this.st_salesman)
destroy(this.dw_salesman)
destroy(this.st_2)
destroy(this.dw_9)
destroy(this.cb_auto)
destroy(this.st_3)
destroy(this.cb_3)
destroy(this.dw_10)
destroy(this.cbx_2)
destroy(this.dw_28)
destroy(this.cbx_6)
destroy(this.dw_11)
destroy(this.cbx_card)
destroy(this.cbx_3)
destroy(this.gb_5)
destroy(this.dw_12)
destroy(this.cb_bemat)
destroy(this.dw_24)
destroy(this.cbx_zero)
destroy(this.dw_8)
destroy(this.dw_13)
destroy(this.dw_5)
destroy(this.dw_14)
destroy(this.dw_15)
destroy(this.dw_16)
destroy(this.pb_auto)
destroy(this.ddlb_1)
destroy(this.cb_4)
destroy(this.dw_17)
destroy(this.pb_cash)
destroy(this.dw_18)
destroy(this.cbx_4)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_open, ls_zero, ls_salesman, ls_filter, ls_user, ls_user_id
long   ll_row, l_count

DECLARE opeom_org_cursor CURSOR FOR 
select  user_id
from opeom_org
where area_mgr = :gs_userid or sector_mgr = :gs_userid or team_mgr = :gs_userid or user_id = :gs_userid and user_id <> :gs_userid;

cb_1.visible  = false	// ALL
cbx_1.visible = false	// 거래처 상세보기

dw_6.visible  = false	// 거래처 상세
dw_7.visible  = false   // 거래처 비고내역
dw_2.visible  = false	// 여신현황
dw_8.visible  = false	// 이력카드
dw_9.visible  = false	// 일괄출력
dw_10.visible   = false	// 채권카드
dw_11.visible   = false	// 채권카드 존재업체
dw_14.visible   = false	// 거래처순서(일괄출력)
dw_15.visible   = false	// 매출조직거래처
dw_16.visible   = false	// 업체유형
dw_18.visible   = false	// 고액채권

cb_auto.enabled = false // 일괄출력 버튼
pb_auto.enabled = false // 유형일괄 출력
//pb_cash.enabled = false // 고액채권 일괄

dw_24.visible = false	// 순수거래처
dw_24.x       = 2446		
dw_24.y       = 456
dw_24.width   = 2226
dw_24.height  = 1456

dw_28.visible = false	// 영업사원이력
dw_28.x       = dw_6.x + dw_6.width - dw_28.width		
dw_28.y       = dw_6.y
//dw_28.width   = 1637
//dw_28.height  = 1456

ddlb_1.text   = "% 전체"
//ddlb_1.enabled= false

em_1.text     = string(today(),'yyyy')
st_salesman.text = ""

if GF_Permission("거래처_이력카드(출력)", gs_userid) = "Y" then
	cb_2.enabled = true
else
	cb_2.enabled = false
end if

if GF_Permission("거래처_채권카드(출력)", gs_userid) = "Y" then
	cb_3.enabled = true
else
	cb_3.enabled = false
end if

if GF_Permission("거래처여신현황_상세보기", gs_userid) = "Y" then
	cbx_1.visible    = true
	cbx_1.checked = true
	dw_6.visible     = true    		// 거래처 상세
	dw_7.visible     = true    		// 거래처 비고내역
	cbx_open.checked = true		// 사용불가 제외
end if


/*2020-08-26 jowonsuk 법무팀 신규권한 반영*/
if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
	cbx_1.visible = true	// 법무팀
	cbx_1.checked = true	// 법무팀
	dw_6.visible = true // 거래처 상세보기
	dw_7.visible  = true // 거래처 비고내역
end if		

pb_insert.visible = false
pb_delete.visible = false
pb_save.visible   = false		

if GF_Permission("거래처_이력카드(저장)", gs_userid) = "Y" then
	pb_insert.visible = true
	pb_delete.visible = true
	pb_save.visible   = true
end if

pb_save.Enabled   = false	/*    		2018.03.22 조원석 숨김기능 때문에 주석처리 		*/

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)
dw_9.SetTransObject(SQLCA)
dw_10.SetTransObject(SQLCA)
dw_12.SetTransObject(SQLCA)
dw_13.SetTransObject(SQLCA)
dw_14.SetTransObject(SQLCA)	// 거래처순서(일괄출력)
dw_15.SetTransObject(SQLCA)	// 나의거래처
dw_16.SetTransObject(SQLCA)	// 업체유형
dw_17.SetTransObject(SQLCA)	// 업체외형
dw_17.object.cust_name.visible = false
dw_18.SetTransObject(SQLCA)

//
string ls_mon
long   ll_mon

for ll_row = 8 to 20
	ll_mon  = ll_mon + 1
	ls_mon  = string(ll_mon)
	
     dw_17.Modify("s_rate"+ls_mon+"_t.text = '"+ls_mon+".비중'")
	dw_17.Modify("s_amt" +ls_mon+"_t.text = '"+ls_mon+".금액'")
	dw_17.Modify("s_rate"+ls_mon+".width=256")
	dw_17.Modify("s_amt" +ls_mon+".width=256")

	//
	if mod(ll_mon, 2) = 0 then
		dw_17.Modify("s_rate"+ls_mon+"_t.Background.color="+string(rgb(198,195,198))+"" )
		dw_17.Modify("s_amt" +ls_mon+"_t.Background.color="+string(rgb(198,195,198))+"" )
	else
		dw_17.Modify("s_rate"+ls_mon+"_t.Background.color="+string(rgb(235,235,235))+"" )
		dw_17.Modify("s_amt" +ls_mon+"_t.Background.color="+string(rgb(235,235,235))+"" )
	end if
next

dw_24.SetTransObject(SQLCA)   // 판매거래처 리스트 (090403)
dw_28.SetTransObject(SQLCA)	// 영업사원이력

l_count  = 0

select  count(user_id)
   into :l_count
from opeom_org
where area_mgr = :gs_userid or sector_mgr = :gs_userid or team_mgr = :gs_userid or user_id = :gs_userid;

if l_count > 0 then
	ls_user = " user_id in ( "
	
	OPEN opeom_org_cursor;
			
		FETCH opeom_org_cursor INTO :ls_user_id;
		
		if isnull(ls_user_id) or ls_user_id = '' then ls_user = ''
		
		ls_user = ls_user + "'" + ls_user_id + "',"
		
		do While sqlca.sqlcode = 0
			
			FETCH opeom_org_cursor INTO :ls_user_id;
			
			ls_user = ls_user + "'" + ls_user_id + "',"
		
		loop
	
	CLOSE opeom_org_cursor;
	
	ls_user = LeftA(ls_user,LenA(ls_user)-1) + ')'
else
	ls_user = ''
end if

if GF_Permission("거래처_여신현황(일괄)", gs_userid) = "Y" then

	dw_salesman.settransobject(sqlca)	// 담당자별 거래처
	dw_salesman.insertrow(1)
	dw_salesman.getchild('user',idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_salesman.object.user[1] = '%'

else
	
	dw_salesman.settransobject(sqlca)	// 담당자별 거래처
	dw_salesman.insertrow(1)
	dw_salesman.getchild('user',idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id', gs_userid)
	idwc_user.setitem(1,'user_name', gs_username)
	
	if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
		idwc_user.accepttext()
		dw_salesman.object.user[1] = gs_userid		
		dw_salesman.enabled = false
	else
		
		idwc_user.setfilter(ls_user)
		idwc_user.filter()	
		idwc_user.accepttext()
		dw_salesman.object.user[1] = gs_userid
		
		if l_count > 0 then
			dw_salesman.enabled = true
		else
			dw_salesman.enabled = false		
		end if		
		
	end if		

	dw_salesman.triggerevent(itemchanged!)
	
end if 

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

/*2020-08-26 jowonsuk  법무팀에서 C등급은 전부 볼 수 있어야 한다. 필터처리
                                        상급자는 하급자꺼를 볼 수 있어야한다. salehp에서 커서를 통해 하급자 가져옴, 
                                         필터에 붙임. 시작
*/
ls_salesman = dw_salesman.object.user[1]


//l_count  = 0
//
//select  count(user_id)
//   into :l_count
//from opeom_org
//where area_mgr = :ls_salesman or sector_mgr = :ls_salesman or team_mgr = :ls_salesman or user_id = :ls_salesman;
//
//if l_count > 0 then
//	ls_user = " salesman in ( "
//	
//	OPEN opeom_org_cursor;
//			
//		FETCH opeom_org_cursor INTO :ls_user_id;
//		
//		if isnull(ls_user_id) or ls_user_id = '' then ls_user = ''
//		
//		ls_user = ls_user + "'" + ls_user_id + "',"
//		
//		do While sqlca.sqlcode = 0
//			
//			FETCH opeom_org_cursor INTO :ls_user_id;
//			
//			ls_user = ls_user + "'" + ls_user_id + "',"
//		
//		loop
//	
//	CLOSE opeom_org_cursor;
//	
//	ls_user = left(ls_user,len(ls_user)-1) + ')'
//else
//	ls_user = ''
//end if

if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
	is_filter = "top_level IN ( 'C大', 'C中', 'C小', 'CX' )"
else
	
	if GF_Permission("거래처_여신현황(일괄)", gs_userid) = "Y" then
		ls_user = "len(salesman) <> 0 "
		is_filter = ls_user		
	else
//		ls_user = "salesman = '" + ls_salesman + "'"
		ls_user = "(salesman = '" + ls_salesman + "' or imwon_user_id = '" + ls_salesman + "')"
		is_filter = ls_user
	end if
	
end if	

/* 2020-08-26 jowonsuk  법무팀에서 C등급은 전부 볼 수 있어야 한다. 필터처리
*/

ls_salesman = '%' /*2020-08-26 jowonsuk  필터로 처리해서 데이터원도우 조회시에는 제약을 하지 않음. */

dw_1.settransobject(SQLCA)
dw_1.insertrow(0)
//================================//
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )

/*2020-08-26 jowonsuk 필터처리 */
idwc_cust.setfilter(is_filter)
idwc_cust.filter()

if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust.setsort('mgr_sort, cust_no, cust_name')
idwc_cust.sort()
//================================//
dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )

/*2020-08-26 jowonsuk 필터처리 */
idwc_cust_name.setfilter(is_filter)
idwc_cust_name.filter()

if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
idwc_cust_name.sort()
//================================//
dw_1.getchild("icube_no", idwc_icube)
idwc_icube.settransobject(sqlca)
ll_row = idwc_icube.retrieve( ls_open, ls_salesman )

/*2020-08-26 jowonsuk 필터처리 */
idwc_icube.setfilter(is_filter)
idwc_icube.filter()

if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

idwc_icube.setsort('icube_no, cust_name')
idwc_icube.sort()
//================================//

dw_1.setcolumn("cust_name")
dw_1.setfocus()

end event

event resize;call super::resize;//
long  ll_width, ll_height

// 전전년
dw_13.x = 37
dw_13.y = 504
// 전년
dw_5.x  = 640
dw_5.y  = 504
// 당년
dw_4.x  = 2071
dw_4.y  = 504
// 거래처상세
dw_6.x  = 3502
dw_6.y  = 504
// 비고작성
dw_7.x  = 5280	// dw_6.x + dw_6.width
dw_7.y  = 504
dw_7.width   = newwidth  - dw_7.x - gb_2.x

// 어음발생
dw_3.width   = (newwidth  - 123) / 2
dw_3.height  = newheight - dw_3.y - gb_2.x
// 어음회수
dw_12.x      = dw_3.x + dw_3.width + 10
dw_12.width  = newwidth  - dw_12.x - gb_2.x
dw_12.height = newheight - dw_12.y - gb_2.x
// 여신현황(출력)
dw_2.x  = 55
dw_2.y  = 416
dw_2.width  = dw_3.width * 2
dw_2.height = dw_3.height + dw_5.height
// 이력카드(출력)
dw_8.x  = dw_2.x
dw_8.y  = dw_2.y
dw_8.width  = dw_2.width
dw_8.height = dw_2.height
// 채권카드(출력)
dw_10.x  = dw_2.x
dw_10.y  = dw_2.y
dw_10.width  = dw_2.width
dw_10.height = dw_2.height
// 잔액존재업체
dw_9.x  = dw_7.x
dw_9.y  = dw_7.y
dw_9.width  = dw_7.width
dw_9.height = dw_7.height

// 고액업체
dw_18.x  = dw_7.x
dw_18.y  = dw_7.y
dw_18.width  = dw_7.width
dw_18.height = dw_7.height

// 업체유형
dw_16.x  = dw_7.x
dw_16.y  = dw_7.y
dw_16.width  = dw_7.width
dw_16.height = dw_7.height

// 업체외형
dw_17.width  = newwidth  - dw_17.x - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdcustmaster_r
integer x = 4608
integer y = 60
end type

event pb_save::clicked;call super::clicked;string ls_custno, ls_rem5
long	 ll_row

if dw_6.RowCount() < 1 then RETURN

dw_6.AcceptText()

ls_custno = dw_6.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then
	MessageBox('확인','거래처 정보가 존재하지 않습니다.')
	return
end if

ls_rem5 = dw_6.Object.custinfo_rem5[1]

if wf_nullchk(dw_7) = false then RETURN

if MessageBox("저장","저장 하시겠습니까?",question!,okcancel!,2) = 2 then RETURN

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
if	WF_Update1(dw_7, 'Y') = FALSE THEN RETURN

dw_7.Modify("rem.Tabsequence = 0")  //			2018.03.22 조원석 주석처리
is_uflag = "UPDATE"	//Default

dw_6.SetRedraw(false) ; dw_7.SetRedraw(false)
pb_retrieve.Triggerevent( Clicked! )	/*2018.03.22 조원석 주석처리*/

pb_save.Enabled = false				/*2018.03.22 조원석 주석처리*/

dw_7.SetRow(ll_row)
dw_6.SetRedraw(true) ; dw_7.SetRedraw(true)


end event

type dw_1 from w_inheritance`dw_1 within w_cdcustmaster_r
string tag = "d_custddw_c"
integer x = 69
integer y = 280
integer width = 2423
integer height = 188
integer taborder = 200
string title = "d_cdcustomer_s"
string dataobject = "d_cdcustomer_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;//
datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name, ls_icubeno,  ls_username
string ls_custno,  ls_custnm,    ls_salesman, ls_colllevel
long   ad_date,    ll_cnt,       ll_find
string ls_db
///////////////////////////////////////////
// 매출조직별 거래처 CHECK
///////////////////////////////////////////
choose case dwo.name
	case "cust_no"  
		ls_custno = Trim(data)

	case "cust_name"
		ls_custnm = Trim(data)
end choose

/*YCSC, YCYC 주석처리 */
ls_db      = ProfileString("YCSC.INI", "Database", "DataBase", " ")

if upper(trim(ls_db)) = "YC" then 
		if GF_Permission("판매거래처 마스터(ALL)", gs_userid) = "Y" then
		else
	//		if gs_team = "13000" then
			/*2020-08-26 jowonsuk 법무팀 신규권한 반영 gs_team = "13000" ->  거래처_여신현황(법무팀) */
			if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
				cbx_1.visible = true	// 법무팀
				dw_7.visible  = true // 거래처 비고내역
			end if				
		
			dw_15.retrieve( gs_userid )
			if dw_15.rowcount() < 1 then
				MessageBox("확인","매출조직별 거래처 대상에 존재하지 않습니다.")
				RETURN
			else
				ll_find = dw_15.find( "cust_name = '" + ls_custnm + "' ", 1, dw_15.rowcount() )
				if ll_find > 0 then
					// 매출조직거래처
				else				
					MessageBox("확인","해당하는 거래처의 담당자는 [" + ls_salesman + "] 입니다.~n~n거래처 열람할 수 없습니다.")
					RETURN
				end if
			end if
		end if
END IF		
/*YCSC, YCYC 주석처리 */
///////////////////////////////////////////

dw_4.reset() ; dw_5.reset()

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
 st_salesman.text = ls_username 	// 현재담당자


string ls_level_userid
int    li_count
choose case gs_level
	case 'A', 'B'
		pb_retrieve.enabled = true
		
	case 'C'		
		SELECT count(*) INTO :li_count FROM customer WHERE cust_no = :ls_cust_no and salesman = :gs_userid;
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

event dw_1::buttonclicked;call super::buttonclicked;//
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
	ls_zero = "Y"
else
	ls_zero = "%"
end if


// 담당자
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

dw_24.setredraw( false )
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

dw_24.setredraw( true )
////////////////////////////////////////////////////////////
// 법무지원 제외 2019.02.14 jowonsuk
////////////////////////////////////////////////////////////
if cbx_4.checked = true then
	dw_24.setfilter( "salesman <> 'leesy2' ")
else
	dw_24.setfilter( "")
end if
dw_24.filter()

dw_24.setfocus()

end event

event dw_1::clicked;call super::clicked;//
dw_24.Visible = False

end event

type st_title from w_inheritance`st_title within w_cdcustmaster_r
integer x = 59
integer y = 40
integer width = 1106
integer height = 128
string text = "거래처 여신현황"
end type

type st_tips from w_inheritance`st_tips within w_cdcustmaster_r
end type

type pb_compute from w_inheritance`pb_compute within w_cdcustmaster_r
boolean visible = false
integer x = 2181
integer y = 56
integer width = 197
integer taborder = 370
string disabledname = "c:\bmp\computr3.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcustmaster_r
boolean visible = false
integer x = 2583
integer y = 68
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdcustmaster_r
integer x = 4800
integer y = 60
integer taborder = 380
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcustmaster_r
integer x = 4416
integer y = 60
integer taborder = 390
end type

event pb_print::clicked;//
w_repsuper w_print
DataWindowChild ldwc_dw1, ldwc_dw2, ldwc_dw3, ldwc_dw6

if dw_2.rowcount() < 1 then
   MessageBox("확인", "조회조건에 만족하는 여신현황이 없습니다.",information!)
   RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.Modify("dw_7.x     =   9")		// 전전년
dw_2.Modify("dw_7.width = 677")		// 전전년

dw_2.Modify("dw_2.x     = 690")		// 전년
dw_2.Modify("dw_2.width = 1312")		// 전년

dw_2.Modify("dw_1.x     = 2011")		// 당년
dw_2.Modify("dw_1.width = 1431")		// 당년

dw_2.Modify("dw_4.x     = 3451")		// 거래처상세
dw_2.Modify("dw_4.width = 1426")		// 거래처상세

//dw_2.Modify("dw_8.x     = 4891")		// 거래처외형
//dw_2.Modify("dw_8.width = 2062")		// 거래처외형

dw_2.Modify("dw_3.x     =    9")		// 상세정보(발생)
dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)

dw_2.Modify("dw_6.x     = 2354")		// 상세정보(수금)
dw_2.Modify("dw_6.width = 2523")		// 상세정보(수금)

dw_2.Modify("dw_5.x     =    9")		// REMARK
dw_2.Modify("dw_5.width = 4869")		// REMARK

// 거래처 상세보기
if cbx_1.visible = true AND cbx_1.checked = true then		
	dw_2.Modify("dw_4.width   = 1522")
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
if cbx_2.checked = true then
	ldwc_dw6.setfilter( "" )
else
	ldwc_dw6.setfilter( "set_view <> 'Y'" )
end if
ldwc_dw6.filter()
ldwc_dw6.groupcalc()

// 어음 발생분 존재하고 회수분이 없는 경우
if ldwc_dw3.rowcount() > 0 then
	if ldwc_dw6.rowcount() < 1 then ldwc_dw6.insertrow( 0 )
end if

dw_2.visible = true
dw_2.title = "이프로그램은 여신현황을 출력합니다."

i_print.st_datawindow    = dw_2
//dw_2.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=8')		//  Datawindow.Zoom=95
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 여신현황을 출력합니다." 
//is_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=96'

OpenWithParm(w_printsetup, i_print) 

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcustmaster_r
boolean visible = false
integer x = 2427
integer taborder = 410
end type

type pb_delete from w_inheritance`pb_delete within w_cdcustmaster_r
integer x = 4224
integer y = 60
integer taborder = 420
end type

event pb_delete::clicked;call super::clicked;//
long  ll_row

if (dw_6.rowcount() < 1) OR (dw_7.rowcount() < 1) then RETURN	

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	RETURN
end if	

dw_7.accepttext()

for ll_row = dw_7.rowcount() to 1 step -1
	if dw_7.object.chk[ll_row] = "Y" then
		dw_7.DeleteRow( ll_row )
	end if
next
WF_Update1( dw_7, "Y" )

string ls_rem

if dw_7.rowcount() > 0 then
	ls_rem = dw_7.Object.rem[1]
	if dw_6.rowcount() = 1 then
		dw_6.Object.custinfo_rem5[1] = ls_rem
	end if
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cdcustmaster_r
integer x = 4032
integer y = 60
integer taborder = 460
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

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcustmaster_r
integer x = 3840
integer y = 60
integer taborder = 440
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindowchild idwc_opeom
string ls_cust, ls_custnm, ls_salesman, ls_username
long   ll_row, ll_dw13cnt, ll_dw5cnt, ll_dw4cnt
int    li_year

pb_save.Enabled = false

dw_1.accepttext()
ls_cust     = dw_1.object.cust_no[1]
ls_custnm   = dw_1.object.cust_name[1]
li_year     = integer(em_1.text)

dw_salesman.AcceptText()
ls_salesman = dw_salesman.object.user[1]

// 여신현황
ll_dw13cnt = dw_13.retrieve(ls_cust, li_year - 2)	// 전전년
if ll_dw13cnt < 1 then
	// 여신현황 전전년 거래가 없는 경우
	dw_13.insertrow(0)				
   dw_13.SetItem(1, "eom_year",  date(string(li_year - 2) + '/01/01'))
end if

ll_dw5cnt  = dw_5.retrieve( ls_cust, li_year - 1)	// 전년
if ll_dw5cnt < 1 then 
	// 여신현황 전년 거래가 없는 경우
	dw_5.insertrow(0)				
   dw_5.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))
end if

ll_dw4cnt  = dw_4.retrieve( ls_cust, li_year)		// 당년
if ll_dw4cnt < 1 then dw_4.insertrow(0)

dw_6.retrieve(ls_cust)								// 거래처 상세보기
dw_7.retrieve(ls_cust)								// 비고 History

dw_3.retrieve(ls_cust)								// 어음내역(발생)
dw_12.retrieve(ls_cust)								// 어음내역(회수)

//
dw_17.retrieve( ls_salesman, ls_cust, li_year )				// 업체외형

SELECT user_name INTO :ls_username
  FROM customer 
       LEFT OUTER JOIN login ON customer.salesman = login.user_id
 WHERE customer.cust_no  = :ls_cust;
 
// 여신현황(출력)
dw_2.retrieve( ls_cust, li_year, gs_userID )	
//if ll_dw13cnt < 1 then
//	dw_2.getchild("dw_7", idwc_opeom)	// 전전년 
//	idwc_opeom.insertrow(0)
//	idwc_opeom.SetItem(1, "cust_name", ls_custnm)
//	idwc_opeom.SetItem(1, "user_name", ls_username)
//	idwc_opeom.SetItem(1, "eom_year",  date(string(li_year - 2) + '/01/01'))
//end if

//if ll_dw5cnt < 1 then 
//	dw_2.getchild("dw_2", idwc_opeom)	// 전년
//	idwc_opeom.insertrow(0)
//	idwc_opeom.SetItem(1, "cust_name", ls_custnm)
//	idwc_opeom.SetItem(1, "user_name", ls_username)
//	idwc_opeom.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))
//end if

// 거래처순서
dw_14.retrieve()										

// 어음 상세보기
//cbx_2.postevent( clicked! )

//// 어음 발생분 존재하고 회수분이 없는 경우
//if dw_3.rowcount() < 1 then
//	if dw_12.rowcount() < 1 then dw_12.insertrow( 0 )
//end if
//
end event

type gb_3 from w_inheritance`gb_3 within w_cdcustmaster_r
boolean visible = false
integer x = 1010
integer y = 1500
integer width = 2514
integer height = 1560
integer taborder = 340
end type

type gb_2 from w_inheritance`gb_2 within w_cdcustmaster_r
integer x = 37
integer y = 240
integer width = 2866
integer height = 240
integer taborder = 360
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcustmaster_r
integer x = 3342
integer y = 16
integer width = 1691
integer height = 212
integer taborder = 100
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdcustmaster_r
integer x = 73
integer y = 1212
integer width = 1111
integer height = 400
integer taborder = 320
boolean titlebar = true
string title = "여신현황"
string dataobject = "d_cdglbill_r2"
boolean controlmenu = true
boolean hscrollbar = true
boolean resizable = true
boolean border = false
boolean hsplitscroll = true
end type

type em_1 from editmask within w_cdcustmaster_r
integer x = 3259
integer y = 304
integer width = 288
integer height = 76
integer taborder = 260
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

type st_1 from statictext within w_cdcustmaster_r
integer x = 2962
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

type cb_1 from commandbutton within w_cdcustmaster_r
integer width = 119
integer height = 72
integer taborder = 430
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

type dw_3 from datawindow within w_cdcustmaster_r
integer x = 37
integer y = 1764
integer width = 2199
integer height = 968
integer taborder = 290
boolean bringtotop = true
string title = "d_cdglbill_q21, 22"
string dataobject = "d_cdglbill_q21"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;// 여신현황 어음보기 
string ls_billno, ls_billclass, ls_closedate
long   ll_found

if row < 1 or row > this.rowcount() then RETURN

if gf_permission('어음관리_저장', gs_userid) = 'Y' then	
	ls_billno    = this.object.bill_no[row]
	ls_billclass = this.object.bill_class[row]
	ls_closedate = this.object.close_date[row]
	
	if IsValid(w_o_main) then 
		OpenSheet(w_ocglbill_m,  w_o_main, 5, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_ocglbill_m,  w_all_main, 6, original!)
	end if
	
	w_ocglbill_m.setredraw(false)
	w_ocglbill_m.em_1.text = ls_closedate	// 만기일자
	w_ocglbill_m.em_2.text = ls_closedate	// 만기일자
	w_ocglbill_m.ddlb_1.text = ls_billclass + "어음"
	w_ocglbill_m.pb_retrieve.triggerevent(clicked!)
	w_ocglbill_m.setredraw(true)
	if w_ocglbill_m.dw_3.rowcount() > 0 then
		ll_found = w_ocglbill_m.dw_3.Find("bill_no = '" + ls_billno + "'", 1, w_ocglbill_m.dw_3.RowCount() )
		if ll_found > 0 then
			w_ocglbill_m.dw_3.scrolltorow( ll_found )
		end if
	end if
end if

end event

type dw_4 from datawindow within w_cdcustmaster_r
integer x = 2071
integer y = 504
integer width = 1426
integer height = 1244
integer taborder = 250
string dataobject = "d_cdinvcoll_q1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_cdcustmaster_r
integer x = 3579
integer y = 348
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

type gb_4 from groupbox within w_cdcustmaster_r
integer x = 2917
integer y = 240
integer width = 2117
integer height = 240
integer taborder = 210
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
end type

type dw_6 from datawindow within w_cdcustmaster_r
integer x = 3502
integer y = 504
integer width = 1774
integer height = 1244
integer taborder = 350
string title = "none"
string dataobject = "d_cdinvcoll_q4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within w_cdcustmaster_r
integer x = 5280
integer y = 504
integer width = 1595
integer height = 1244
integer taborder = 280
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdinvcoll_q5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//string ls_rem
//
//if currentrow < 1 Or currentrow > this.rowcount() then RETURN
//
//ls_rem = this.Object.rem[currentrow]
//if dw_6.rowcount() = 1 then
//	dw_6.Object.custinfo_rem5[1] = ls_rem
//end if
//is_uflag = "UPDATE"
//


end event

event clicked;string ls_rem

//if currentrow < 1 Or currentrow > this.rowcount() then RETURN

IF ROW < 1 Or ROW > this.rowcount() then RETURN


ls_rem = this.Object.rem[row]
if dw_6.rowcount() = 1 then
	dw_6.Object.custinfo_rem5[1] = ls_rem
end if
is_uflag = "UPDATE"

end event

event itemchanged;string ls_cust, ls_hidden_yn

ls_cust     = dw_1.object.cust_no[1]

dw_7.accepttext( )

choose case dwo.name
	case "hidden_yn"
		
			SELECT isnull(customer_rem_his.hidden_yn, 'N')
			into :ls_hidden_yn
			  FROM customer_rem_his   
			 WHERE customer_rem_his.cust_no = :ls_cust;		
		
		     if (dw_7.object.hidden_yn[row] = 'N' and ls_hidden_yn = 'N') or (dw_7.object.hidden_yn[row] = 'Y' and ls_hidden_yn = 'Y') then
				pb_save.Enabled = true
			else
				pb_save.Enabled = false
			end if
			
	case  "chk"
		
		     if dw_7.object.chk[row] = 'N' then
				pb_save.Enabled = true
			else
				pb_save.Enabled = false
			end if		
		
end choose
end event

type cbx_open from checkbox within w_cdcustmaster_r
integer x = 3579
integer y = 288
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
string ls_open, ls_zero, ls_salesman

if dw_24.visible = true then dw_24.visible = false

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

idwc_cust.setfilter(is_pbauto_filter)
idwc_cust.filter()

idwc_cust_name.setfilter(is_pbauto_filter)
idwc_cust_name.filter()

idwc_icube.setfilter(is_pbauto_filter)
idwc_icube.filter()


//long   ll_row
//string ls_open, ls_zero, ls_salesman
//
//if dw_24.visible = true then dw_24.visible = false
//
/////////////////////////////////////////////
//// 사용불가 제외
/////////////////////////////////////////////
//is_pbauto_filter = is_filter
//
//if cbx_open.checked = true then
//	ls_open = "O"
//	
//	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
//	
//else
//	ls_open = "%"
//end if
//
/////////////////////////////////////////////
//// 잔액제로 제외
/////////////////////////////////////////////
//if cbx_zero.checked = true then
//	ls_zero = "Y"
//	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
//else
//	ls_zero = "%"
//end if
//
//// 담당자 
//dw_salesman.accepttext()
//ls_salesman = dw_salesman.object.user[1]
//
//////================================//
////dw_1.getchild("cust_no", idwc_cust)
////idwc_cust.settransobject(sqlca)
////ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
////	idwc_cust.setfilter( "salesman <> 'leesy2' ")
//else
////	idwc_cust.setfilter( "")
//end if
//idwc_cust.setfilter(is_pbauto_filter)
//idwc_cust.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
//////================================//
////dw_1.getchild("cust_name", idwc_cust_name)
////idwc_cust_name.settransobject(sqlca)
////ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
////if cbx_4.checked = true then
////	idwc_cust_name.setfilter("salesman <> 'leesy2' ")
////else
////	idwc_cust_name.setfilter( "")
////end if
//idwc_cust_name.setfilter(is_pbauto_filter)
//idwc_cust_name.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
////dw_1.getchild("icube_no", idwc_icube)
////idwc_icube.settransobject(sqlca)
////ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
////if cbx_4.checked = true then
////	idwc_icube.setfilter( "salesman <> 'leesy2' ")
////else
////	idwc_icube.setfilter( "")
////end if
//idwc_icube.setfilter(is_pbauto_filter)
//idwc_icube.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
/////////////////////////////////////////////

end event

type cb_2 from commandbutton within w_cdcustmaster_r
integer x = 2501
integer y = 288
integer width = 366
integer height = 88
integer taborder = 30
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

type st_salesman from statictext within w_cdcustmaster_r
integer x = 2971
integer y = 392
integer width = 590
integer height = 72
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

type dw_salesman from datawindow within w_cdcustmaster_r
integer x = 1257
integer y = 132
integer width = 672
integer height = 84
integer taborder = 40
boolean bringtotop = true
string title = "담당자"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
int    li_year
long   ll_row, l_count
string ls_open, ls_zero, ls_salesman, ls_username, ls_user, ls_user_id
decimal ll_custsort
long   ll_col, ll_found
string ls_custno, ls_rcust_name, ls_sqlerrtext

DECLARE opeom_org_cursor CURSOR FOR 
select  user_id
from opeom_org
where area_mgr = :ls_salesman or sector_mgr = :ls_salesman or team_mgr = :ls_salesman or user_id = :ls_salesman and user_id <> :ls_salesman;

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

//l_count  = 0
//
//select  count(user_id)
//   into :l_count
//from opeom_org
//where area_mgr = :ls_salesman or sector_mgr = :ls_salesman or team_mgr = :ls_salesman or user_id = :ls_salesman;
//
//if l_count > 0 then
//	
//	ls_user = " salesman in ( "
//	
//	OPEN opeom_org_cursor;
//			
//		FETCH opeom_org_cursor INTO :ls_user_id;
//		
//		if isnull(ls_user_id) or ls_user_id = '' then ls_user = ''
//		
//		ls_user = ls_user + "'" + ls_user_id + "',"
//		
//		do While sqlca.sqlcode = 0
//			
//			FETCH opeom_org_cursor INTO :ls_user_id;
//			
//			ls_user = ls_user + "'" + ls_user_id + "',"
//		
//		loop
//	
//	CLOSE opeom_org_cursor;
//	
//	ls_user = left(ls_user,len(ls_user)-1) + ')'
//else
//	ls_user = ''
//end if

if isnull(data) then
	data = ls_salesman
end if

if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
	is_filter = "top_level IN ( 'C大', 'C中', 'C小', 'CX' )"
else
	if data = '%' then
		ls_user = "len(salesman) <> 0 "
		is_filter = ls_user		
	else
//		ls_user = "salesman = '" + ls_salesman + "'"
		ls_user = "(salesman = '" + ls_salesman + "' or imwon_user_id = '" + ls_salesman + "')"		
		is_filter = ls_user
	end if
end if	


// 일괄출력
if data = "%" then 	// 전체사용자
	cb_auto.enabled = false
else
	if ls_salesman = gs_userid then	// 로긴담당자 
		cb_auto.enabled = true
	else
		if GF_Permission("거래처_여신현황(일괄)", gs_userid) = "Y" then
			cb_auto.enabled = true
		else
				
				l_count = 0;
				
                     SELECT count(*)
		 			into :l_count
                       FROM (
								 SELECT user_id, rank FROM opeom_org WHERE area_mgr   = :gs_userid   /* 권역장 */
								 UNION ALL
								 SELECT user_id, rank FROM opeom_org WHERE sector_mgr = :gs_userid   /* 본부장 */
								 UNION ALL
								 SELECT user_id, rank FROM opeom_org WHERE team_mgr   = :gs_userid   /* 팀장   */
								 UNION ALL
								 SELECT user_id, rank FROM opeom_org WHERE user_id    = :gs_userid   /* 담당   */
                                   ) A inner join login on a.user_id = login.user_id
                      WHERE (:gs_userid <> 'insite' AND a.user_id <> 'insite')
                          and a.user_id = :ls_salesman;								  
								  
				if l_count > 0 then
					cb_auto.enabled = true					
				else
					cb_auto.enabled = false
				end if
		end if
	end if
end if

// 년도
li_year   = integer(em_1.text)

////================================//
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)
//ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_cust.setfilter("salesman <> 'leesy2' ")
//else
//	idwc_cust.setfilter( "")
//end if
//idwc_cust.filter()
//
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
////================================//
//dw_1.getchild("cust_name", idwc_cust_name)
//idwc_cust_name.settransobject(sqlca)
//ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_cust_name.setfilter("salesman <> 'leesy2' ")
//else
//	idwc_cust_name.setfilter( "")
//end if
//idwc_cust_name.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
//dw_1.getchild("icube_no", idwc_icube)
//idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_icube.setfilter( "salesman <> 'leesy2' ")
//else
//	idwc_icube.setfilter( "")
//end if
//idwc_icube.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
///////////////////////////////////////////

ls_salesman = '%'

// 잔액(카드)존재 업체
if cbx_card.checked = true then
	dw_9.title = "카드 등록업체"
	dw_9.dataobject = "d_cdcustmaster_r_cards"
	dw_9.SetTransObject(SQLCA)
	ll_row = dw_9.Retrieve( ls_salesman, li_year )
else
	dw_9.title = "잔액 존재업체"
	dw_9.dataobject = "d_cdcustmaster_r_sales"
	dw_9.SetTransObject(SQLCA)
	ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year )
end if

dw_14.retrieve()										// 거래처순서

//// 잔액제로 제외
//if cbx_zero.checked = true then		
//	//dw_9.setfilter( "opeom_amt <> 0" )
//	if cbx_4.checked = true then		
//		dw_9.setfilter( "opeom_amt <> 0 and customer_salesman <> 'leesy2'" )
//	else
//		dw_9.setfilter( "opeom_amt <> 0" )
//	end if	
//	
//else
//	//dw_9.setfilter( "" )
//	if cbx_4.checked = true then		
//		dw_9.setfilter( "customer_salesman <> 'leesy2' " )
//	else
//		dw_9.setfilter( "" )
//	end if	
//	
//end if
//dw_9.filter()

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

idwc_cust.setfilter(is_pbauto_filter)
idwc_cust.filter()

idwc_cust_name.setfilter(is_pbauto_filter)
idwc_cust_name.filter()

idwc_icube.setfilter(is_pbauto_filter)
idwc_icube.filter()


if ll_row < 1 then
	if cbx_card.checked = true then
		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
		return	
	else
		MessageBox("확인","잔액 존재업체가 존재하지 않습니다.")
		return	
	end if
end if

ls_salesman = dw_salesman.object.user[1]
SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
st_salesman.text = ls_username 	// 현재담당자

///////////////////////////////////////////////////////////////////
// 거래처정렬 순서 변경하기
///////////////////////////////////////////////////////////////////

dw_14.retrieve()								// 거래처순서

//dw_9.SetSort("toplevel A, salesman A, customer_cust_name A")	
//dw_9.Sort()

ll_custsort = 0
for ll_row = 1 to dw_9.rowcount()		// 잔액존재업체
	dw_9.object.cust_sort[ll_row] = 9999
next

/*2020-11-04 jowonsuk 계열사 소트 오류로 주석처리 */
//for ll_row = 1 to dw_14.rowcount()		// 거래처순서
//	for ll_col = 1 to 2
//		choose case ll_col
//			case 1
//				ls_custno = dw_14.object.customer_grp_cust_no[ll_row]
//
//			case 2
//				ls_custno = dw_14.object.customer_grp_rcust_no[ll_row]
//		end choose
//		
//		if isnull(ls_custno) OR ls_custno = "" then
//		else
//			ll_found = dw_9.find( "customer_cust_no = '" + ls_custno + "' ", 1, dw_9.rowcount() )
//			if isnull(ll_found) OR ll_found < 1 then
//			else
//				ll_custsort = ll_custsort + 1
//				dw_9.object.cust_sort[ll_found] = ll_custsort
//
//				dw_9.object.customer_cust_name[ll_found] = "*" + dw_9.object.customer_cust_name[ll_found]
//			end if
//		end if
//	next
//next
/*2020-11-04 jowonsuk 계열사 소트 */
//DECLARE rcust_no_cursor CURSOR FOR
//      SELECT b.cust_name
//      FROM customer_grp a with(nolock) inner join customer b with(nolock) on a.rcust_no = b.cust_no
//      		                                                  inner join customer c with(nolock) on a.cust_no = c.cust_no
//      WHERE a.cust_no = :ls_custno
//order by  a.nrow asc;

DECLARE rcust_no_cursor CURSOR FOR
select a.cust_name
from 
(
SELECT a.cust_no, a.rcust_no, b.cust_name, a.nrow
FROM customer_grp a  with(nolock) inner join customer b with(nolock) on a.rcust_no = b.cust_no
union all
SELECT a.rcust_no, a.cust_no, b.cust_name, a.nrow
FROM customer_grp a  with(nolock) inner join customer b  with(nolock) on a.cust_no = b.cust_no
) a
where a.cust_no = :ls_custno
order by  a.nrow asc;

ll_custsort = 0

for ll_row = 1 to dw_9.rowcount()
	     ll_custsort = truncate( ll_custsort,0)
		  
		if LeftA(dw_9.object.customer_cust_name[ll_row],1) <> '*' then
			
			ll_custsort = ll_custsort + 1
			dw_9.object.cust_sort[ll_row] = ll_custsort
		
		end if
	
		ls_custno = trim(dw_9.object.customer_cust_no[ll_row])
	
		OPEN rcust_no_cursor;
		
			FETCH rcust_no_cursor INTO :ls_rcust_name;
		
			Do While sqlca.sqlcode = 0	
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[customer_grp] customer_grp 조회중  DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
				
				if isnull(ls_rcust_name) OR ls_rcust_name = "" then
				else
					ll_found = dw_9.find( "customer_cust_name = '" + ls_rcust_name + "' ", 1, dw_9.rowcount() )
					if isnull(ll_found) OR ll_found < 1 then
						//
					else
							ll_custsort = ll_custsort + 0.1						
							dw_9.object.cust_sort[ll_found] = ll_custsort
							
							if LeftA(dw_9.object.customer_cust_name[ll_row],1) <> '*' then
								dw_9.object.customer_cust_name[ll_row] = "*" + dw_9.object.customer_cust_name[ll_row]			
							end if
							
							dw_9.object.customer_cust_name[ll_found] = "*" + dw_9.object.customer_cust_name[ll_found]
						
					end if
				end if				
			
					
				FETCH rcust_no_cursor INTO :ls_rcust_name;
					
			Loop
		
		CLOSE rcust_no_cursor;	

next


//dw_9.SetSort("cust_idx A, customer_salesman A, mgr_sort A, cust_sort A, customer_cust_name A")	
//dw_9.SetSort("salesman A, toplevel A, cust_sort A, cust_sort A, custname_sort A")	
dw_9.SetSort("login_user_name A, toplevel A, cust_sort A, custname_sort A")

dw_9.Sort()
dw_9.groupcalc()
///////////////////////////////////////////////////////////////////

end event

type st_2 from statictext within w_cdcustmaster_r
integer x = 1262
integer y = 60
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

type dw_9 from datawindow within w_cdcustmaster_r
string tag = "d_cdcustmaster_r_cards"
integer x = 238
integer y = 16
integer width = 224
integer height = 164
integer taborder = 220
boolean bringtotop = true
boolean titlebar = true
string title = "잔액존재업체"
string dataobject = "d_cdcustmaster_r_sales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_auto from commandbutton within w_cdcustmaster_r
integer x = 1938
integer y = 120
integer width = 366
integer height = 88
integer taborder = 400
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "일괄출력"
end type

event clicked;// 잔액이 존재하는 업체 일괄출력: Yield
string	ls_custno, ls_custnm, ls_card, ls_salesman, ls_open, ls_username, ls_print_yn, ls_print_ok, ls_print_no
long		ll_row, ll_col, ll_found, l_count, li_year
integer  li_prt
decimal ll_custsort

w_repsuper w_print
DataWindowChild ldwc_dw3, ldwc_dw6

///////////////////////////////////////////////////////////////////
// 거래처정렬 순서 변경하기
///////////////////////////////////////////////////////////////////


ls_salesman = '%'

ls_salesman = dw_salesman.object.user[1]
SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
st_salesman.text = ls_username 	// 현재담당자

if cbx_open.checked = true then
	ls_open = "O"
else
	ls_open = "%"
end if

li_year   = integer(em_1.text)


// 잔액(카드)존재 업체
if cbx_card.checked = true then
	dw_9.title = "카드 등록업체"
	dw_9.dataobject = "d_cdcustmaster_r_cards"
	dw_9.SetTransObject(SQLCA)
	ll_row = dw_9.Retrieve( ls_salesman, li_year )
else
	dw_9.title = "잔액 존재업체"
	dw_9.dataobject = "d_cdcustmaster_r_sales"
	dw_9.SetTransObject(SQLCA)
	ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year )
end if

//dw_9.SetSort("toplevel A, salesman A, customer_cust_name A")	
//dw_9.Sort()

dw_9.object.toplevel.visible = 0
dw_9.object.mgr_type.visible = 0

ll_custsort = 0
for ll_row = 1 to dw_9.rowcount()		// 잔액존재업체
	dw_9.object.cust_sort[ll_row] = 9999
next

//for ll_row = 1 to dw_14.rowcount()		// 거래처순서
//	for ll_col = 1 to 2
//		choose case ll_col
//			case 1
//				ls_custno = dw_14.object.customer_grp_cust_no[ll_row]
//
//			case 2
//				ls_custno = dw_14.object.customer_grp_rcust_no[ll_row]
//		end choose
//		
//		if isnull(ls_custno) OR ls_custno = "" then
//		else
//			ll_found = dw_9.find( "customer_cust_no = '" + ls_custno + "' ", 1, dw_9.rowcount() )
//			if isnull(ll_found) OR ll_found < 1 then
//				//
//			else
//				ll_custsort = ll_custsort + 1
//				dw_9.object.cust_sort[ll_found] = ll_custsort
//
//				if left(dw_9.object.customer_cust_name[ll_found],1) = "*" then
//					//
//				else
//					dw_9.object.customer_cust_name[ll_found] = "*" + dw_9.object.customer_cust_name[ll_found]
//				end if
//			end if
//		end if
//	next
//next

string ls_rcust_name, ls_sqlerrtext

//DECLARE rcust_no_cursor CURSOR FOR
//      SELECT b.cust_name
//      FROM customer_grp a with(nolock) inner join customer b with(nolock) on a.rcust_no = b.cust_no
//      		                                                  inner join customer c with(nolock) on a.cust_no = c.cust_no
//      WHERE a.cust_no = :ls_custno
//order by  a.nrow asc;

DECLARE rcust_no_cursor CURSOR FOR
select a.cust_name
from 
(
SELECT a.cust_no, a.rcust_no, b.cust_name, a.nrow
FROM customer_grp a  with(nolock) inner join customer b with(nolock) on a.rcust_no = b.cust_no
union all
SELECT a.rcust_no, a.cust_no, b.cust_name, a.nrow
FROM customer_grp a  with(nolock) inner join customer b  with(nolock) on a.cust_no = b.cust_no
) a
where a.cust_no = :ls_custno
order by  a.nrow asc;

ll_custsort = 0

for ll_row = 1 to dw_9.rowcount()
	     ll_custsort = truncate( ll_custsort,0)
		  
		if LeftA(dw_9.object.customer_cust_name[ll_row],1) <> '*' then
			
			ll_custsort = ll_custsort + 1
			dw_9.object.cust_sort[ll_row] = ll_custsort
		
		end if
	
		ls_custno = trim(dw_9.object.customer_cust_no[ll_row])
	
		OPEN rcust_no_cursor;
		
			FETCH rcust_no_cursor INTO :ls_rcust_name;
		
			Do While sqlca.sqlcode = 0	
			
				if sqlca.sqlcode < 0 then
					ls_sqlerrtext = string(sqlca.sqlerrtext)
					ROLLBACK;				
					MessageBox('오류32','[customer_grp] customer_grp 조회중  DB오류가 발생했습니다.~r~n' + ls_sqlerrtext, exclamation!)
					RETURN 0
				end if					 
				
				if isnull(ls_rcust_name) OR ls_rcust_name = "" then
				else
					ll_found = dw_9.find( "customer_cust_name = '" + ls_rcust_name + "' ", 1, dw_9.rowcount() )
					if isnull(ll_found) OR ll_found < 1 then
						//
					else
							ll_custsort = ll_custsort + 0.1						
							dw_9.object.cust_sort[ll_found] = ll_custsort
							
							if LeftA(dw_9.object.customer_cust_name[ll_row],1) <> '*' then
								dw_9.object.customer_cust_name[ll_row] = "*" + dw_9.object.customer_cust_name[ll_row]			
							end if
							
							dw_9.object.customer_cust_name[ll_found] = "*" + dw_9.object.customer_cust_name[ll_found]
						
					end if
				end if				
			
					
				FETCH rcust_no_cursor INTO :ls_rcust_name;
					
			Loop
		
		CLOSE rcust_no_cursor;	

next


//dw_9.SetSort("salesman A, toplevel A, custname_sort A")	
//dw_9.SetSort("customer_salesman A, toplevel A, custname_sort A")	
dw_9.SetSort("login_user_name A, toplevel A, cust_sort A, custname_sort A") 
dw_9.Sort()
dw_9.groupcalc()
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

idwc_cust.setfilter(is_pbauto_filter)
idwc_cust.filter()

idwc_cust_name.setfilter(is_pbauto_filter)
idwc_cust_name.filter()

idwc_icube.setfilter(is_pbauto_filter)
idwc_icube.filter()


dw_9.visible = true		// 전체보기

// 일괄출력 작업 출력취소
if cb_auto.text = "출력취소" then
	ib_cancel = true
	RETURN
else
	if MessageBox("확인",string(dw_9.rowcount(),"#,##0") + " 건 출력작업을 계속 하시겠습니까?~r~r" + &
	              "(Tip: 출력중 취소시에는 출력취소)", Exclamation!, YesNo!, 2) = 2 then
		ib_cancel = true
		
			dw_9.visible = true	// 전체보기
//			dw_9.visible = false	// 전체보기 2018.02.27 원래
		RETURN
	else
		
		li_prt = PrintSetup()
		if li_prt < 1 then
			ib_cancel = true
			RETURN
		end if
		
		/*2021.10.13 jowonsuk 담당(부)가 있는지 체크하고 담당(부)가 있을때 출력을 어떻게 할지 물어보는 로직. 시작*/
		ls_print_no = 'no'
				
		for ll_row = 1 to dw_9.rowcount()
			IF dw_9.Object.print_yn[ll_row] = 'N' THEN
				ls_print_no = 'yes'
				exit
			END IF			
		NEXT

		if ls_print_no = 'yes' then
			if MessageBox("확인", " 담당(정)만출력하시겠습니까?~r~r", Exclamation!, YesNo!, 2) = 2 then
				ls_print_yn = 'N'			
			else		
				ls_print_yn = 'Y'						
			end if
		else
			ls_print_yn = 'N'	
		end if
		/*2021.10.13 jowonsuk 담당(부)가 있는지 체크하고 담당(부)가 있을때 출력을 어떻게 할지 물어보는 로직. 끝*/		
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

// 채권카드 일괄출력
if cbx_card.checked = true then
	ls_card = "Y"
else
	ls_card = "N"
end if

for ll_row = 1 to dw_9.rowcount()
	Yield()		// 반복문 안에서 다른 오브젝트나 어플리케이션의 메세지가 발생검사
	Yield()
	
	dw_9.scrolltorow( ll_row )
	
	if ib_cancel = true then	// Interrupted!"
		ib_cancel = false
		EXIT
	else								// Some processing
		ls_custno = dw_9.Object.customer_cust_no[ll_row]
		ls_custnm = dw_9.Object.customer_cust_name[ll_row]
		
		IF ls_print_yn = 'Y' THEN // 2021.10.13 jownsuk 일괄출력 대상 체크항목만 출력 Y 담당(정)만출력, N 모두 출력
		
			if dw_9.Object.print_yn[ll_row] = 'Y' then // 2021.10.13 jownsuk 일괄출력 대상 체크항목만 출력
				ls_print_ok = 'Y'
			else
				ls_print_ok = 'N'			
			end if
		
		else
			ls_print_ok = 'Y'	
		end if
		
		if ls_print_ok = 'Y' then
			
				dw_1.Object.cust_no[1]   = ls_custno
				dw_1.Object.cust_name[1] = ls_custnm
				
				pb_retrieve.TriggerEvent(Clicked!)
		
				if ls_card = "Y" then	// 채권카드 일괄출력
					cb_3.triggerevent( clicked! )
				else
					dw_2.Modify("dw_1.width = 1687")		// 전년
					dw_2.Modify("dw_2.width = 1687")		// 당년
					dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)
					dw_2.Modify("dw_6.width = 2619")		// 상세정보(수금)
					dw_2.Modify("dw_5.width = 4997")		// REMARK
					if cbx_1.visible = true and cbx_1.checked = true then    // 거래처 상세
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
		
		
					if ls_card = "Y" then	// 채권카드 일괄출력
						dw_2.title = "이프로그램은 채권카드를 출력합니다."		
					else
						dw_2.title = "이프로그램은 여신현황을 출력합니다."		
					end if
					dw_2.print()	
				end if
		end if
	end if
next

dw_9.visible = true		// 전체보기
dw_2.visible = false
cb_auto.text = "일괄출력"



MessageBox("확인","일괄출력 작업완료")

end event

type st_3 from statictext within w_cdcustmaster_r
integer x = 59
integer y = 208
integer width = 741
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래처_여신현황(일괄)"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cdcustmaster_r
integer x = 2501
integer y = 376
integer width = 366
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "채권카드"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

DataWindowChild ldwc_custbase1, ldwc_custbase2, ldwc_custbase3
w_repsuper w_print
st_print   l_print

string ls_custno, ls_custnm, ls_telno, ls_faxno, ls_usernm
long   ll_row

dw_1.accepttext()
ls_custno = dw_1.object.cust_no[1]
ls_custnm = dw_1.Object.cust_name[1]

dw_10.retrieve( ls_custno )
dw_10.getchild("dw_2", ldwc_custbase1)
dw_10.getchild("dw_1", ldwc_custbase2)
dw_10.getchild("dw_3", ldwc_custbase3)
if ldwc_custbase1.rowcount() < 1 and ldwc_custbase2.rowcount() < 1 and ldwc_custbase3.rowcount() < 1 then
	if cb_auto.text = "출력취소" then
	else
		MessageBox("확인", "거래처 채권카드 데이터가 없습니다.")
	end if
	RETURN
else
	//dw_10.getchild("dw_2", ldwc_dw2)
	if ldwc_custbase1.rowcount() < 1 then
		ldwc_custbase1.insertrow(0)
		
		SELECT c.tel_no, c.fax_no, l.user_name INTO :ls_telno, :ls_faxno, :ls_usernm
		  FROM customer c 
				 LEFT OUTER JOIN login l ON c.salesman = l.user_id
		 WHERE c.cust_no = :ls_custno;
	
		ldwc_custbase1.SetItem(1, "scene_cust_no",   ls_custno)
		ldwc_custbase1.SetItem(1, "tel_no",          ls_telno)
		ldwc_custbase1.SetItem(1, "fax_no",          ls_faxno)
		ldwc_custbase1.SetItem(1, "salesman",        ls_usernm)
	end if
end if

ldwc_custbase1.Modify("t_scene_cust_no.text='" + ls_custnm + "'")

dw_10.visible = true
dw_10.title   = " 이 프로그램은 거래처_채권카드를 출력합니다."

l_print.st_datawindow    = dw_10
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 거래처_채권카드를 출력합니다." 

if cb_auto.text = "출력취소" then
	dw_10.print()	
else
	OpenWithParm(w_printsetup, l_print) 
end if

end event

type dw_10 from datawindow within w_cdcustmaster_r
integer x = 73
integer y = 1804
integer width = 1111
integer height = 400
integer taborder = 120
boolean bringtotop = true
boolean titlebar = true
string title = "채권카드"
string dataobject = "d_cdcustomer_credit_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

type cbx_2 from checkbox within w_cdcustmaster_r
integer x = 3579
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
	dw_12.setfilter( "" )
else
	dw_12.setfilter( "set_view <> 'Y'" )
end if
dw_12.filter()
dw_12.groupcalc()

end event

type dw_28 from datawindow within w_cdcustmaster_r
event mousemove pbm_dwnmousemove
integer x = 3520
integer y = 632
integer width = 1152
integer height = 1948
integer taborder = 270
boolean bringtotop = true
boolean titlebar = true
string title = "영업담당 이력(수주기준)"
string dataobject = "d_sale_salesman"
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;///////////////////////////////////////////
// Event ID   : pbm_dwnmousemove
// Event Name : mousemove
///////////////////////////////////////////
// Background Color : if ( getrow() = currentrow(), rgb(255,228,202), rgb(255,255,255) )

if row < 1 then return

this.scrolltorow(row)

end event

type cbx_6 from checkbox within w_cdcustmaster_r
integer x = 4210
integer y = 404
integer width = 558
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
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

if this.checked = true then
	dw_28.visible = true
	dw_28.retrieve( ls_custno )
else
	dw_28.visible = false
end if

end event

type dw_11 from datawindow within w_cdcustmaster_r
integer x = 5
integer y = 16
integer width = 224
integer height = 164
integer taborder = 450
boolean bringtotop = true
boolean titlebar = true
string title = "카드존재업체"
string dataobject = "d_cdcustmaster_r_cards"
boolean livescroll = true
end type

type cbx_card from checkbox within w_cdcustmaster_r
integer x = 1934
integer y = 56
integer width = 366
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
string text = "채권카드"
end type

event clicked;//
debugbreak()
dw_salesman.triggerevent( itemchanged! )

end event

type cbx_3 from checkbox within w_cdcustmaster_r
integer x = 800
integer y = 200
integer width = 384
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
string text = "전체보기"
end type

event clicked;//
if this.checked = true then
	dw_9.visible = true
else
	dw_9.visible = false
end if

end event

type gb_5 from groupbox within w_cdcustmaster_r
integer x = 1234
integer y = 16
integer width = 1097
integer height = 212
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_12 from datawindow within w_cdcustmaster_r
integer x = 2249
integer y = 1764
integer width = 2542
integer height = 968
integer taborder = 130
string title = "none"
string dataobject = "d_cdglbill_q22"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_bemat from commandbutton within w_cdcustmaster_r
integer x = 3369
integer y = 60
integer width = 457
integer height = 148
integer taborder = 300
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

type dw_24 from datawindow within w_cdcustmaster_r
integer x = 2437
integer y = 920
integer width = 2226
integer height = 1456
integer taborder = 330
boolean bringtotop = true
boolean titlebar = true
string title = "순수 거래처명"
string dataobject = "d_cdcustlist_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
string icon = "Database!"
boolean livescroll = true
end type

event doubleclicked;//
string ls_custno, ls_custnm, ls_icubeno, ls_username, ls_salesman, ls_colllevel, ls_userid, ls_db
long   ll_row, ll_find

dw_24.AcceptText()

ll_row     = dw_24.GetRow()
ls_custno  = dw_24.Object.cid[ll_row]
ls_custnm  = dw_24.Object.fname[ll_row]

///////////////////////////////////////////
// 매출조직별 거래처 CHECK
///////////////////////////////////////////
ls_db      = ProfileString("YCSC.INI", "Database", "DataBase", " ")

if upper(trim(ls_db)) = "YC" then 
	
	if GF_PERMISSION("판매거래처 마스터(ALL)", gs_userid) = "Y" then
	else
//		if gs_team = "13000" then
		/*2020-08-26 jowonsuk 법무팀 신규권한 반영 gs_team = "13000" ->  거래처_여신현황(법무팀) */
		if GF_Permission("거래처_여신현황(법무팀)", gs_userid) = "Y" then
			cbx_1.visible = true	// 법무팀
			dw_7.visible  = true // 거래처 비고내역
		end if				
	
		dw_15.retrieve( gs_userid )
		if dw_15.rowcount() < 1 then
			MessageBox("확인","매출조직별 거래처 대상에 존재하지 않습니다.")
			RETURN
		else
			ll_find = dw_15.find( "cust_name = '" + ls_custnm + "' ", 1, dw_15.rowcount() )
			if ll_find > 0 then
				// 매출조직거래처
			else				
				MessageBox("확인","해당하는 거래처의 담당자는 [" + ls_salesman + "] 입니다.~n~n거래처 열람할 수 없습니다.")
				RETURN
			end if
		end if
	end if
end if	
///////////////////////////////////////////

if isnull(ls_custno) OR ls_custno = "" then
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
	st_salesman.text = ls_username 	// 현재담당자
	 
	pb_retrieve.triggerevent( clicked! )
end if

end event

type cbx_zero from checkbox within w_cdcustmaster_r
integer x = 4210
integer y = 276
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
is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

idwc_cust.setfilter(is_pbauto_filter)
idwc_cust.filter()

idwc_cust_name.setfilter(is_pbauto_filter)
idwc_cust_name.filter()

idwc_icube.setfilter(is_pbauto_filter)
idwc_icube.filter()


end event

type dw_8 from datawindow within w_cdcustmaster_r
integer x = 73
integer y = 784
integer width = 1111
integer height = 400
integer taborder = 50
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

type dw_13 from datawindow within w_cdcustmaster_r
integer x = 37
integer y = 504
integer width = 599
integer height = 1244
integer taborder = 140
string title = "none"
string dataobject = "d_cdinvcoll_q0"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_cdcustmaster_r
integer x = 640
integer y = 504
integer width = 1426
integer height = 1244
integer taborder = 310
string dataobject = "d_cdinvcoll_q2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_14 from datawindow within w_cdcustmaster_r
integer x = 471
integer y = 16
integer width = 224
integer height = 164
integer taborder = 150
boolean bringtotop = true
string title = "거래처순서"
string dataobject = "d_cdcustomer_grp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_15 from datawindow within w_cdcustmaster_r
integer x = 704
integer y = 16
integer width = 224
integer height = 164
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdmycustomer_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_16 from datawindow within w_cdcustmaster_r
integer x = 937
integer y = 16
integer width = 224
integer height = 164
integer taborder = 60
boolean bringtotop = true
boolean titlebar = true
string title = "업체유형"
string dataobject = "d_cdcustmaster_r_class"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_auto from picturebutton within w_cdcustmaster_r
integer x = 3031
integer y = 56
integer width = 274
integer height = 152
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "판정일괄출력"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;//
int    li_year
long   ll_row
string ls_open, ls_zero, ls_salesman, ls_username, ls_class

///////////////////////////////////////////
// 업체유형 제외
///////////////////////////////////////////
ls_class  = trim(LeftA(ddlb_1.text,3))

if ls_class = "%" then
	dw_9.visible = false

	// 잔액(카드)존재 업체
	if cbx_card.checked = true then
		dw_9.title = "카드 등록업체"
		dw_9.dataobject = "d_cdcustmaster_r_cards"
		dw_9.SetTransObject(SQLCA)
	else
		dw_9.title = "잔액 존재업체"
		dw_9.dataobject = "d_cdcustmaster_r_sales"
		dw_9.SetTransObject(SQLCA)
	end if
else
	dw_9.title = "업체유형"
	dw_9.dataobject = "d_cdcustmaster_r_class"
	dw_9.SetTransObject(SQLCA)
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

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

// 일괄출력
if trim(LeftA(ddlb_1.text,3)) = "%" then 	// 전체사용자
	pb_auto.enabled = false
else
	if ls_salesman = gs_userid then	// 로긴담당자 
		pb_auto.enabled = true
	else
		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
			pb_auto.enabled = true
		else
			pb_auto.enabled = false
		end if
	end if
end if

// 년도
li_year   = integer(em_1.text)

// 잔액(카드)존재 업체
if cbx_card.checked = true then
	dw_9.title = "카드 등록업체"
	dw_9.dataobject = "d_cdcustmaster_r_cards"
	dw_9.SetTransObject(SQLCA)
else
	dw_9.title = "업체유형"
	dw_9.dataobject = "d_cdcustmaster_r_class"
	dw_9.SetTransObject(SQLCA)
end if

ls_salesman = '%'
ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year, ls_class )

////////////////////////////////////////////////////////////
// 법무지원 제외 2019.02.14 jowonsuk
////////////////////////////////////////////////////////////
is_pbauto_filter = is_filter

if cbx_4.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and salesman <> 'leesy2' "
end if
	
///////////////////////////////////////////
// 잔액제로 제외 2019.05.14 jowonsuk 추가 
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and opeomamt <> 0"
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

if ll_row < 1 then
	if cbx_card.checked = true then
		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
		return	
	else
		MessageBox("확인","업체유형 데이터가 존재하지 않습니다.")
		return	
	end if
end if

ls_salesman = dw_salesman.object.user[1]
SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
st_salesman.text = ls_username 	// 현재담당자


// 잔액이 존재하는 업체 일괄출력: Yield
string	ls_custno, ls_custnm, ls_card
long	ll_col, ll_custsort, ll_found
integer  li_prt


w_repsuper w_print
DataWindowChild ldwc_dw3, ldwc_dw6

dw_9.visible = true		// 전체보기

// 일괄출력 작업 출력취소
if pb_auto.text = "출력취소" then
	ib_cancel = true
	RETURN
else
	if MessageBox("확인",string(dw_9.rowcount(),"#,##0") + " 건 출력작업을 계속 하시겠습니까?~r~r" + &
	              "(Tip: 출력중 취소시에는 출력취소)", Exclamation!, YesNo!, 2) = 2 then
		ib_cancel = true
		dw_9.visible = false	// 전체보기
		RETURN
	else
		li_prt = PrintSetup()
		if li_prt < 1 then
			ib_cancel = true
			RETURN
		end if
	end if
end if	

pb_auto.text = "출력취소"
ib_cancel = false

if GF_Permission("거래처여신현황_상세보기", gs_userid) = "Y" then
	dw_2.Modify("dw_4.visible = 1")
	dw_2.Modify("dw_5.visible = 1")
else
	dw_2.Modify("dw_4.visible = 0")
	dw_2.Modify("dw_5.visible = 0")
end if

// 채권카드 일괄출력
if cbx_card.checked = true then
	ls_card = "Y"
else
	ls_card = "N"
end if

for ll_row = 1 to dw_9.rowcount()
	Yield()		// 반복문 안에서 다른 오브젝트나 어플리케이션의 메세지가 발생검사
	Yield()
	
	dw_9.scrolltorow( ll_row )
	
	if ib_cancel = true then	// Interrupted!"
		ib_cancel = false
		EXIT
	else								// Some processing
		ls_custno = dw_9.Object.customer_cust_no[ll_row]
		ls_custnm = dw_9.Object.customer_cust_name[ll_row]
		
		dw_1.Object.cust_no[1]   = ls_custno
		dw_1.Object.cust_name[1] = ls_custnm
		
		pb_retrieve.TriggerEvent(Clicked!)

		if ls_card = "Y" then	// 채권카드 일괄출력
			cb_3.triggerevent( clicked! )
		else
			dw_2.Modify("dw_1.width = 1687")		// 전년
			dw_2.Modify("dw_2.width = 1687")		// 당년
			dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)
			dw_2.Modify("dw_6.width = 2619")		// 상세정보(수금)
			dw_2.Modify("dw_5.width = 4997")		// REMARK
			if cbx_1.visible = true and cbx_1.checked = true then    // 거래처 상세
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


			if ls_card = "Y" then	// 채권카드 일괄출력
				dw_2.title = "이프로그램은 채권카드를 출력합니다."		
			else
				dw_2.title = "이프로그램은 여신현황을 출력합니다."		
			end if
			dw_2.print()	
		end if
	end if
next

dw_9.visible = true		// 전체보기
dw_2.visible = false
pb_auto.text = "판정일괄출력"
MessageBox("확인","판정일괄출력 작업완료")

end event

type ddlb_1 from dropdownlistbox within w_cdcustmaster_r
integer x = 2651
integer y = 132
integer width = 366
integer height = 944
integer taborder = 170
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
integer limit = 7
string item[] = {"%  전체","A大 등급","A中 등급","A小 등급","B大 등급","B中 등급","B신 등급","C大 등급","C中 등급","C小 등급","CX  등급"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
int    li_year
long   ll_row
string ls_open, ls_zero, ls_salesman, ls_username, ls_class

///////////////////////////////////////////
// 업체유형 제외
///////////////////////////////////////////
ls_class  = trim(LeftA(ddlb_1.text,3))
if ls_class = "%" then
	dw_9.visible = false

	// 잔액(카드)존재 업체
	if cbx_card.checked = true then
		dw_9.title = "카드 등록업체"
		dw_9.dataobject = "d_cdcustmaster_r_cards"
		dw_9.SetTransObject(SQLCA)
	else
		dw_9.title = "잔액 존재업체"
		dw_9.dataobject = "d_cdcustmaster_r_sales"
		dw_9.SetTransObject(SQLCA)
	end if
else
	dw_9.title = "업체유형"
	dw_9.dataobject = "d_cdcustmaster_r_class"
	dw_9.SetTransObject(SQLCA)
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

// 담당자 
dw_salesman.accepttext()
ls_salesman = dw_salesman.object.user[1]

// 일괄출력
if trim(LeftA(ddlb_1.text,3)) = "%" then 	// 전체사용자
	pb_auto.enabled = false
else
	if ls_salesman = gs_userid then	// 로긴담당자 
		pb_auto.enabled = true
	else
		if GF_PERMISSION("거래처_여신현황(일괄)", gs_userid) = "Y" then
			pb_auto.enabled = true
		else
			pb_auto.enabled = false
		end if
	end if
end if

// 년도
li_year   = integer(em_1.text)

////================================//
//dw_1.getchild("cust_no", idwc_cust)
//idwc_cust.settransobject(sqlca)
//ll_row = idwc_cust.retrieve( ls_open, ls_zero, ls_salesman )
//
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_cust.setfilter( "salesman <> 'leesy2' ")
//else
//	idwc_cust.setfilter( "")
//end if
//idwc_cust.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust.setsort('mgr_sort, cust_no, cust_name')
//idwc_cust.sort()
////================================//
//dw_1.getchild("cust_name", idwc_cust_name)
//idwc_cust_name.settransobject(sqlca)
//ll_row = idwc_cust_name.retrieve( ls_open, ls_zero, ls_salesman )
//
//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_cust_name.setfilter( "salesman <> 'leesy2' ")
//else
//	idwc_cust_name.setfilter( "")
//end if
//idwc_cust_name.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_cust_name.setsort('mgr_sort, cust_name, cust_no')
//idwc_cust_name.sort()
////================================//
//dw_1.getchild("icube_no", idwc_icube)
//idwc_icube.settransobject(sqlca)
//ll_row = idwc_icube.retrieve( ls_open, ls_salesman )

//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	idwc_icube.setfilter( "salesman <> 'leesy2' ")
//else
//	idwc_icube.setfilter( "")
//end if
//idwc_icube.filter()
//
//if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")
//
//idwc_icube.setsort('icube_no, cust_name')
//idwc_icube.sort()
///////////////////////////////////////////

ls_salesman = '%'

// 잔액(카드)존재 업체
if cbx_card.checked = true then
	dw_9.title = "카드 등록업체"
	dw_9.dataobject = "d_cdcustmaster_r_cards"
	dw_9.SetTransObject(SQLCA)
else
	dw_9.title = "업체유형"
	dw_9.dataobject = "d_cdcustmaster_r_class"
	dw_9.SetTransObject(SQLCA)
end if

if cbx_card.checked = true then

	ll_row = dw_9.Retrieve( ls_salesman, li_year)
else
	ll_row = dw_9.Retrieve( ls_open, ls_salesman, li_year, ls_class )	
end if

//////////////////////////////////////////////////////////////
//// 법무지원 제외 2019.02.14 jowonsuk
//////////////////////////////////////////////////////////////
//if cbx_4.checked = true then
//	dw_9.setfilter( "customer_salesman <> 'leesy2' ")
//else
//	dw_9.setfilter( "")
//end if
//dw_9.filter()

is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()


if ll_row < 1 then
	if cbx_card.checked = true then
		MessageBox("확인","카드 등록업체가 존재하지 않습니다.")
		return	
	else
		MessageBox("확인","업체유형 데이터가 존재하지 않습니다.")
		return	
	end if
end if

ls_salesman = dw_salesman.object.user[1]

SELECT user_name INTO :ls_username FROM login WHERE user_id = :ls_salesman;
st_salesman.text = ls_username 	// 현재담당자


end event

type cb_4 from commandbutton within w_cdcustmaster_r
integer x = 2651
integer y = 52
integer width = 366
integer height = 76
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "업체판정"
end type

event clicked;//
string ls_msg

ls_msg  = "A1 : 사월회~n"
ls_msg += "A2 : 공략업체~n"
ls_msg += "A3 : 우량,중점업체~n"
ls_msg += "~n"
ls_msg += "B1 : 유통업체~n"
ls_msg += "B2 : 년간단가(입찰)업체~n"
ls_msg += "B3 : 생산업체~n"
ls_msg += "~n"
ls_msg += "C1 : 매출순위 중간(결제양호)~n"
ls_msg += "C11: 매출순위 중간(불량)~n"
ls_msg += "C2 : 소액업체(양호)~n"
ls_msg += "C22: 소액업체(불량)~n"
ls_msg += "~n"
ls_msg += "D  : 고액/장기미수 유지업체~n"
ls_msg += "~n"
ls_msg += "X1 : 단발,건별(수출)공사,특수품~n"
ls_msg += "X2 : 채권회수업체~n"
ls_msg += "X3 : 관망,거래대기~n"

MessageBox("확인",ls_msg)
end event

type dw_17 from datawindow within w_cdcustmaster_r
integer x = 5051
integer y = 36
integer width = 745
integer height = 444
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdcustomer_outamt"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_cash from picturebutton within w_cdcustmaster_r
integer x = 2363
integer y = 56
integer width = 274
integer height = 152
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "고액채권일괄"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;//
string ls_userid
date   ld_date

debugbreak()

dw_salesman.accepttext()
ls_userid = dw_salesman.object.user[1]

ld_date   = today()

dw_18.retrieve( ld_date, ls_userid, "%" )

// 잔액이 존재하는 업체 일괄출력: Yield
string	ls_custno, ls_custnm, ls_card
long		ll_row, ll_col, ll_custsort, ll_found
integer  li_prt

w_repsuper w_print
DataWindowChild ldwc_dw3, ldwc_dw6

dw_18.visible = true		// 전체보기

// 일괄출력 작업 출력취소
if pb_cash.text = "출력취소" then
	ib_cancel = true
	RETURN
else
	if MessageBox("확인",string(dw_18.rowcount(),"#,##0") + " 건 출력작업을 계속 하시겠습니까?~r~r" + &
	              "(Tip: 출력중 취소시에는 출력취소)", Exclamation!, YesNo!, 2) = 2 then
		ib_cancel = true
		dw_18.visible = false	// 전체보기
		RETURN
	else
		li_prt = PrintSetup()
		if li_prt < 1 then
			ib_cancel = true
			RETURN
		end if
	end if
end if	

pb_cash.text = "출력취소"
ib_cancel = false

if GF_Permission("거래처여신현황_상세보기", gs_userid) = "Y" then
	dw_2.Modify("dw_4.visible = 1")
	dw_2.Modify("dw_5.visible = 1")
else
	dw_2.Modify("dw_4.visible = 0")
	dw_2.Modify("dw_5.visible = 0")
end if

// 채권카드 일괄출력
if cbx_card.checked = true then
	ls_card = "Y"
else
	ls_card = "N"
end if

for ll_row = 1 to dw_18.rowcount()
	Yield()		// 반복문 안에서 다른 오브젝트나 어플리케이션의 메세지가 발생검사
	Yield()
	
	dw_18.scrolltorow( ll_row )
	
	if ib_cancel = true then	// Interrupted!"
		ib_cancel = false
		EXIT
	else								// Some processing
		ls_custno = dw_18.Object.cust_no[ll_row]
		ls_custnm = dw_18.Object.cust_name[ll_row]
		
		dw_1.Object.cust_no[1]   = ls_custno
		dw_1.Object.cust_name[1] = ls_custnm
		
		pb_retrieve.TriggerEvent(Clicked!)

		if ls_card = "Y" then	// 채권카드 일괄출력
			cb_3.triggerevent( clicked! )
		else
			dw_2.Modify("dw_1.width = 1687")		// 전년
			dw_2.Modify("dw_2.width = 1687")		// 당년
			dw_2.Modify("dw_3.width = 2336")		// 상세정보(발생)
			dw_2.Modify("dw_6.width = 2619")		// 상세정보(수금)
			dw_2.Modify("dw_5.width = 4997")		// REMARK
			if cbx_1.visible = true and cbx_1.checked = true then    // 거래처 상세
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


			if ls_card = "Y" then	// 채권카드 일괄출력
				dw_2.title = "이프로그램은 채권카드를 출력합니다."		
			else
				dw_2.title = "이프로그램은 여신현황을 출력합니다."		
			end if
			dw_2.print()	
		end if
	end if
next

dw_18.visible = true		// 전체보기
dw_2.visible  = false
pb_cash.text  = "고액채권일괄"
MessageBox("확인","고액채권일괄출력 작업완료")

end event

type dw_18 from datawindow within w_cdcustmaster_r
integer x = 1184
integer y = 16
integer width = 224
integer height = 164
integer taborder = 190
boolean bringtotop = true
boolean titlebar = true
string title = "고액채권업체"
string dataobject = "d_cdreceivable_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_4 from checkbox within w_cdcustmaster_r
integer x = 4210
integer y = 336
integer width = 626
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
string text = "법무관리 제외"
end type

event clicked;long   ll_row
string ls_open, ls_zero, ls_salesman

if dw_24.visible = true then dw_24.visible = false

///////////////////////////////////////////
// 사용불가 제외
///////////////////////////////////////////
is_pbauto_filter = is_filter

if cbx_open.checked = true then
	is_pbauto_filter = is_pbauto_filter + " and OPEN_CLOSE = 'O' "
end if

///////////////////////////////////////////
// 잔액제로 제외
///////////////////////////////////////////
if cbx_zero.checked = true then
	is_pbauto_filter = is_pbauto_filter + " AND opeomamt <> 0"
end if

if cbx_4.checked = true then		
	is_pbauto_filter = is_pbauto_filter + " AND salesman <> 'leesy2' "
end if	

dw_9.setfilter(is_pbauto_filter)
dw_9.filter()

idwc_cust.setfilter(is_pbauto_filter)
idwc_cust.filter()

idwc_cust_name.setfilter(is_pbauto_filter)
idwc_cust_name.filter()

idwc_icube.setfilter(is_pbauto_filter)
idwc_icube.filter()

end event

type gb_6 from groupbox within w_cdcustmaster_r
integer x = 2341
integer y = 16
integer width = 992
integer height = 212
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

