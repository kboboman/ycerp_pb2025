$PBExportHeader$w_oidaydo_r.srw
$PBExportComments$일자별 제품출고현황(1999/6/21,이인호)
forward
global type w_oidaydo_r from w_inheritance
end type
type em_2 from editmask within w_oidaydo_r
end type
type dw_area from datawindow within w_oidaydo_r
end type
type st_2 from statictext within w_oidaydo_r
end type
type pb_1 from picturebutton within w_oidaydo_r
end type
type gb_4 from groupbox within w_oidaydo_r
end type
type em_1 from editmask within w_oidaydo_r
end type
type st_3 from statictext within w_oidaydo_r
end type
type ddlb_fld from dropdownlistbox within w_oidaydo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidaydo_r
end type
type st_4 from statictext within w_oidaydo_r
end type
type sle_value from singlelineedit within w_oidaydo_r
end type
type cb_1 from commandbutton within w_oidaydo_r
end type
type cb_2 from commandbutton within w_oidaydo_r
end type
type cb_3 from commandbutton within w_oidaydo_r
end type
type cb_5 from commandbutton within w_oidaydo_r
end type
type dw_3 from datawindow within w_oidaydo_r
end type
type cbx_sum from checkbox within w_oidaydo_r
end type
type cbx_view from checkbox within w_oidaydo_r
end type
type cbx_fix from checkbox within w_oidaydo_r
end type
type dw_top10 from datawindow within w_oidaydo_r
end type
type cbx_qa from checkbox within w_oidaydo_r
end type
type cbx_inside from checkbox within w_oidaydo_r
end type
type st_1 from statictext within w_oidaydo_r
end type
type st_5 from statictext within w_oidaydo_r
end type
type st_7 from statictext within w_oidaydo_r
end type
type cbx_team from checkbox within w_oidaydo_r
end type
type dw_sales from datawindow within w_oidaydo_r
end type
type st_6 from statictext within w_oidaydo_r
end type
type st_8 from statictext within w_oidaydo_r
end type
type dw_cust from datawindow within w_oidaydo_r
end type
type cb_popup1 from commandbutton within w_oidaydo_r
end type
type dw_team from datawindow within w_oidaydo_r
end type
type st_9 from statictext within w_oidaydo_r
end type
type dw_work from datawindow within w_oidaydo_r
end type
type st_10 from statictext within w_oidaydo_r
end type
type cbx_chk from checkbox within w_oidaydo_r
end type
type cbx_hap from checkbox within w_oidaydo_r
end type
type cb_popup from commandbutton within w_oidaydo_r
end type
type dw_filter from datawindow within w_oidaydo_r
end type
type cbx_import from checkbox within w_oidaydo_r
end type
type dw_5 from datawindow within w_oidaydo_r
end type
type dw_4 from datawindow within w_oidaydo_r
end type
type dw_6 from datawindow within w_oidaydo_r
end type
type dw_7 from datawindow within w_oidaydo_r
end type
type ddlb_op from dropdownlistbox within w_oidaydo_r
end type
type dw_8 from datawindow within w_oidaydo_r
end type
type cbx_1 from checkbox within w_oidaydo_r
end type
type rb_1 from radiobutton within w_oidaydo_r
end type
type rb_2 from radiobutton within w_oidaydo_r
end type
type cbx_2 from checkbox within w_oidaydo_r
end type
type cbx_3 from checkbox within w_oidaydo_r
end type
type gb_5 from groupbox within w_oidaydo_r
end type
end forward

global type w_oidaydo_r from w_inheritance
integer y = 112
integer width = 6199
integer height = 2380
string title = "출고일보(기간별)(w_oidaydo_r)"
em_2 em_2
dw_area dw_area
st_2 st_2
pb_1 pb_1
gb_4 gb_4
em_1 em_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_3 dw_3
cbx_sum cbx_sum
cbx_view cbx_view
cbx_fix cbx_fix
dw_top10 dw_top10
cbx_qa cbx_qa
cbx_inside cbx_inside
st_1 st_1
st_5 st_5
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_6 st_6
st_8 st_8
dw_cust dw_cust
cb_popup1 cb_popup1
dw_team dw_team
st_9 st_9
dw_work dw_work
st_10 st_10
cbx_chk cbx_chk
cbx_hap cbx_hap
cb_popup cb_popup
dw_filter dw_filter
cbx_import cbx_import
dw_5 dw_5
dw_4 dw_4
dw_6 dw_6
dw_7 dw_7
ddlb_op ddlb_op
dw_8 dw_8
cbx_1 cbx_1
rb_1 rb_1
rb_2 rb_2
cbx_2 cbx_2
cbx_3 cbx_3
gb_5 gb_5
end type
global w_oidaydo_r w_oidaydo_r

type variables
//
DataWindowChild idwc_team, idwc_area, idwc_cust, idwc_user, idwc_itemtop, idwc_work

string is_dw, is_ret, is_dw1sql, is_price, is_team_code
date   id_start, id_end

end variables

forward prototypes
public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value)
end prototypes

public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value);//
string ls_itemno, ls_itemno_save, ls_itemnm, ls_itemnm_save
string ls_filter, ls_value, ls_val[], ls_valtemp, ls_itemtemp
long   ll_row, ll_dwcnt, ll_cnt, ll_i, ll_len

if arg_dw.rowcount() < 1 then RETURN

// 가져오기
if cbx_import.checked = true then
	arg_value = ProfileString("YCERP.INI","MPGAEGO","FILTER", " ")
	arg_value = GF_ReplaceAll(arg_value,"'","")
end if
		
if LenA(trim(arg_value)) > 1 then
	if RightA(trim(arg_value),1) = "," then
		ls_value = trim(arg_value)
	else
		ls_value = trim(arg_value) + ","
	end if
end if
ll_cnt = GF_SPLIT(ls_value, ",", ls_val) - 1

//
if dw_filter.visible = false then
	arg_dw.setredraw( false )
	
	dw_filter.setfilter("") ; dw_filter.filter()
	dw_filter.reset()
	
	// 값
	if ll_cnt = 0 then
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = "(ALL)"
		dw_filter.object.item_name[ll_dwcnt] = "(모두 선택)"
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		//	
		ls_itemno_save = arg_dw.GetItemString( 1, arg_col )
		ls_itemnm_save = arg_dw.GetItemString( 1, arg_column )

		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
		dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		for ll_row = 1 to arg_dw.rowcount()
			ls_itemno  = arg_dw.GetItemString( ll_row, arg_col )
			ls_itemnm  = arg_dw.GetItemString( ll_row, arg_column )
			
			if ls_itemno_save = ls_itemno then
				// SKIP
			else
				ls_itemno_save = ls_itemno
				ls_itemnm_save = ls_itemnm
				
				ll_dwcnt = dw_filter.insertrow( 0 )		
				dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
				dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
				dw_filter.object.chk[ll_dwcnt]       = "Y"
			end if
		next		
	// VALUE 필터링
	else
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = "(ALL)"
		dw_filter.object.item_name[ll_dwcnt] = "(모두 선택)"
		dw_filter.object.chk[ll_dwcnt]       = "N"
		
		//
		ls_itemno_save = arg_dw.GetItemString( 1, arg_col )
		ls_itemnm_save = arg_dw.GetItemString( 1, arg_column )
		
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
		dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
		dw_filter.object.chk[ll_dwcnt]       = "N"

		// 첫행체크
		if cbx_import.checked = true then
			ls_valtemp  = trim(ls_val[1])
			ll_len      = LenA( ls_valtemp )			
			ls_itemtemp = LeftA( ls_itemno_save, ll_len )
			
			if ls_itemtemp = ls_valtemp then
				dw_filter.object.chk[ll_dwcnt] = "Y"
			else
				dw_filter.object.chk[ll_dwcnt] = "N"
			end if
		end if
		
		//
		for ll_row = 1 to arg_dw.rowcount()
			ls_itemno  = arg_dw.GetItemString( ll_row, arg_col )
			ls_itemnm  = arg_dw.GetItemString( ll_row, arg_column )
			
			if ls_itemno_save = ls_itemno then
				// SKIP
			else
				ls_itemno_save = ls_itemno
				ls_itemnm_save = ls_itemnm
				
				ll_dwcnt = dw_filter.insertrow( 0 )		
				dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
				dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
				dw_filter.object.chk[ll_dwcnt]       = "N"

				for ll_i = 1 to UpperBound(ls_val)
					if ls_val[ll_i] = "" then CONTINUE
					
					ls_valtemp  = trim(ls_val[ll_i])
					ll_len      = LenA( ls_valtemp )					
					ls_itemtemp = LeftA( ls_itemno_save, ll_len )
					
					if ls_itemtemp = ls_valtemp then
						dw_filter.object.chk[ll_dwcnt] = "Y"
						ll_i = UpperBound(ls_val)			// CONTINUE
					else
						dw_filter.object.chk[ll_dwcnt] = "N"
					end if
				next
			end if
		next
	end if
	arg_dw.setredraw( true )
	
	dw_filter.x      = (ParentWindow().width  - 1710) / 2	// PointerX()
	dw_filter.y      = (ParentWindow().height - 1904) / 2  // PointerY()
	dw_filter.width  = 1710
	dw_filter.height = 1904
	
	if dw_filter.rowcount() - 1 = dw_filter.object.tchk[1] then
		dw_filter.object.chk[1] = "Y"
	end if
	
	dw_filter.visible = true
end if

end subroutine

on w_oidaydo_r.create
int iCurrent
call super::create
this.em_2=create em_2
this.dw_area=create dw_area
this.st_2=create st_2
this.pb_1=create pb_1
this.gb_4=create gb_4
this.em_1=create em_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_3=create dw_3
this.cbx_sum=create cbx_sum
this.cbx_view=create cbx_view
this.cbx_fix=create cbx_fix
this.dw_top10=create dw_top10
this.cbx_qa=create cbx_qa
this.cbx_inside=create cbx_inside
this.st_1=create st_1
this.st_5=create st_5
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_6=create st_6
this.st_8=create st_8
this.dw_cust=create dw_cust
this.cb_popup1=create cb_popup1
this.dw_team=create dw_team
this.st_9=create st_9
this.dw_work=create dw_work
this.st_10=create st_10
this.cbx_chk=create cbx_chk
this.cbx_hap=create cbx_hap
this.cb_popup=create cb_popup
this.dw_filter=create dw_filter
this.cbx_import=create cbx_import
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_6=create dw_6
this.dw_7=create dw_7
this.ddlb_op=create ddlb_op
this.dw_8=create dw_8
this.cbx_1=create cbx_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_2
this.Control[iCurrent+2]=this.dw_area
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.gb_4
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.cbx_sum
this.Control[iCurrent+18]=this.cbx_view
this.Control[iCurrent+19]=this.cbx_fix
this.Control[iCurrent+20]=this.dw_top10
this.Control[iCurrent+21]=this.cbx_qa
this.Control[iCurrent+22]=this.cbx_inside
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.st_7
this.Control[iCurrent+26]=this.cbx_team
this.Control[iCurrent+27]=this.dw_sales
this.Control[iCurrent+28]=this.st_6
this.Control[iCurrent+29]=this.st_8
this.Control[iCurrent+30]=this.dw_cust
this.Control[iCurrent+31]=this.cb_popup1
this.Control[iCurrent+32]=this.dw_team
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.dw_work
this.Control[iCurrent+35]=this.st_10
this.Control[iCurrent+36]=this.cbx_chk
this.Control[iCurrent+37]=this.cbx_hap
this.Control[iCurrent+38]=this.cb_popup
this.Control[iCurrent+39]=this.dw_filter
this.Control[iCurrent+40]=this.cbx_import
this.Control[iCurrent+41]=this.dw_5
this.Control[iCurrent+42]=this.dw_4
this.Control[iCurrent+43]=this.dw_6
this.Control[iCurrent+44]=this.dw_7
this.Control[iCurrent+45]=this.ddlb_op
this.Control[iCurrent+46]=this.dw_8
this.Control[iCurrent+47]=this.cbx_1
this.Control[iCurrent+48]=this.rb_1
this.Control[iCurrent+49]=this.rb_2
this.Control[iCurrent+50]=this.cbx_2
this.Control[iCurrent+51]=this.cbx_3
this.Control[iCurrent+52]=this.gb_5
end on

on w_oidaydo_r.destroy
call super::destroy
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.cbx_sum)
destroy(this.cbx_view)
destroy(this.cbx_fix)
destroy(this.dw_top10)
destroy(this.cbx_qa)
destroy(this.cbx_inside)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_6)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.cb_popup1)
destroy(this.dw_team)
destroy(this.st_9)
destroy(this.dw_work)
destroy(this.st_10)
destroy(this.cbx_chk)
destroy(this.cbx_hap)
destroy(this.cb_popup)
destroy(this.dw_filter)
destroy(this.cbx_import)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.ddlb_op)
destroy(this.dw_8)
destroy(this.cbx_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)

dw_1.visible = false
dw_2.visible = false
dw_3.visible = true
dw_4.visible = false
dw_5.visible = false
dw_6.visible = false
dw_7.visible = false
dw_8.visible = false

dw_filter.visible  = false	// DW Filter용
cb_popup1.enabled  = false
cb_popup.enabled   = false
cbx_import.enabled = false
if GS_UserID = "1999010s" then cb_popup1.enabled = true

SELECT isnull(sale_price,'N'), team_code INTO :is_price, :is_team_code 
  FROM login
 WHERE user_id = :gs_userid; 

// 일자
em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')

// 팀 
string ls_team
dw_team.settransobject(sqlca)
dw_team.insertrow(0)  

dw_team.getchild("team", idwc_team)
idwc_team.settransobject(sqlca)
idwc_team.insertrow(1)
idwc_team.setitem(1, "team", "전체팀")
idwc_team.accepttext()

ls_team = "전체팀"
dw_team.object.team[1] = ls_team

// 대분류
dw_top10.settransobject(sqlca)
dw_top10.insertrow(0)  
dw_top10.object.itemtop10[1] = "%"	// 

dw_top10.getchild("itemtop10", idwc_itemtop)
idwc_itemtop.settransobject(sqlca)
idwc_itemtop.insertrow(1)
idwc_itemtop.setitem(1, 'item_cd', '%')
idwc_itemtop.setitem(1, 'item_nm', '전체 대분류')

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
//dw_1.object.cust_no.Background.Color = 67108864
dw_cust.SetTransObject(SQLCA)
dw_cust.GetChild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if
if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_cust.insertrow(0)  

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.GetChild("user",idwc_user)
idwc_user.SetTransObject(sqlca)

if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	string ls_userid
	long   ll_find
	
	ls_userid = gs_userid
	idwc_user.retrieve( ls_userid )
	if GF_Permission("내부업체열람", gs_userid) = "Y" then
		ls_userid = "killby"
	end if
	
	if idwc_user.find( "user_id = '" + ls_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	dw_sales.object.user[1] = gs_userid
end if

// 작업장 
string ls_work
dw_work.settransobject(sqlca)
dw_work.insertrow(0)  

dw_work.getchild("work_no", idwc_work)
idwc_work.settransobject(sqlca)
idwc_work.insertrow(1)
idwc_work.setitem(1, "work_no", "AA")
idwc_work.setitem(1, "work_name", "성형+화성")

idwc_work.insertrow(1)
idwc_work.setitem(1, "work_no", "%")
idwc_work.setitem(1, "work_name", "전체작업장")
idwc_work.accepttext()

ls_work = "%"	
dw_work.object.work_no[1] = ls_work

// 전체권한
if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	// 단가표시
	if GF_Permission("출고일보(기간별)(단가제외)", gs_userid) = "Y" then
		cbx_sum.enabled = false
		cbx_sum.checked = false
		cbx_sum.triggerevent( clicked! )	
	end if
else
	cbx_sum.enabled = false
	cbx_sum.checked = false
	cbx_sum.triggerevent( clicked! )	
end if

// 품목+담당자
cbx_chk.enabled  = false

//
dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

dw_5.x      = dw_1.x
dw_5.y      = dw_1.y
dw_5.width  = dw_1.width
dw_5.height = dw_1.height

dw_6.x      = dw_1.x
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width
dw_6.height = dw_1.height

dw_7.x      = dw_1.x
dw_7.y      = dw_1.y
dw_7.width  = dw_1.width
dw_7.height = dw_1.height


dw_8.x      = dw_1.x
dw_8.y      = dw_1.y
dw_8.width  = dw_1.width
dw_8.height = dw_1.height
end event

type pb_save from w_inheritance`pb_save within w_oidaydo_r
boolean visible = false
integer taborder = 150
end type

type dw_1 from w_inheritance`dw_1 within w_oidaydo_r
integer x = 32
integer y = 440
integer width = 4471
integer height = 1808
integer taborder = 0
string title = "d_oidaydo_r1"
string dataobject = "d_oidaydo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )

debugbreak()
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oidaydo_r
integer x = 0
integer y = 0
integer width = 1106
integer height = 140
string text = "출고일보(기간별)"
end type

type st_tips from w_inheritance`st_tips within w_oidaydo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidaydo_r
boolean visible = false
integer taborder = 200
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidaydo_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 90
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oidaydo_r
integer x = 5669
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidaydo_r
integer x = 5467
integer y = 60
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if cbx_sum.checked = true then
   MessageBox("확인", "출고집계 조회시에는 출력작업을 지원하지 않습니다.",information!)
   return
end if

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처별 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidaydo_r
boolean visible = false
integer taborder = 270
end type

type pb_delete from w_inheritance`pb_delete within w_oidaydo_r
boolean visible = false
integer taborder = 310
end type

type pb_insert from w_inheritance`pb_insert within w_oidaydo_r
boolean visible = false
integer taborder = 320
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidaydo_r
integer x = 5083
integer y = 60
integer taborder = 30
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_userid, ls_orgteam, ls_team, ls_teamnm, ls_price
string ls_work, ls_itemtop10, ls_inside, ls_yymm, ls_next_ewol_yn, ls_now_ewol_yn
long   ll_row
date   ld_sdate, ld_edate

// 일자
if em_1.text = "" then
	MessageBox("확인","시작일자를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","종료일자를 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","조회일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

// 합계만 보기
cbx_hap.checked = false

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 대분류
dw_top10.accepttext()
if dw_top10.rowcount() > 0 then
	ls_itemtop10 = dw_top10.object.itemtop10[1]
end if

// 매출제외 업체
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

// 사업장
dw_area.AcceptText()
ls_area = dw_area.object.area[1]

// 담당자
dw_sales.AcceptText()
ls_userid = dw_sales.object.user[1]

// 거래처
dw_cust.AcceptText()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 작업장
dw_work.AcceptText()
ls_work = LeftA(dw_work.object.work_no[1],1) + "%"
if ls_work = "%%" then ls_work = "%"

// 팀조회
if cbx_team.checked = true then		
	ls_team = "%"
else
	ls_team = "N"
end if

// 년월별
if cbx_view.checked = true then
	ls_yymm = "Y"
else
	ls_yymm = "N"
end if

// 전체권한
if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	if ls_userid = "%" then ls_team = "%"
end if

// 단가표시
if GF_Permission("출고일보(기간별)(단가제외)", gs_userid) = "Y" then
	ls_price = "N"
else
	ls_price = "%"
end if

// 전체팀, 작업장
dw_team.accepttext()
ls_orgteam = dw_team.object.team[1]

if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	//
else
	if ls_orgteam = "전체팀" then 
		//
	else
		SELECT team INTO :ls_teamnm FROM v_team WHERE user_id = :ls_userid; 
		if ls_orgteam <> ls_teamnm then
			MessageBox("확인","매출조직도에 해당하는 팀이 아닙니다.")
			RETURN
		end if
	end if
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
time lt_stime, lt_etime
long ll_calctime

lt_stime = now()

if dw_1.visible = true then
	dw_1.dataobject = "d_oidaydo_r"
	dw_1.settransobject(sqlca)
	
	
	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if

	dw_1.Retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_userid, ls_orgteam, ls_price, ls_itemtop10 )
	dw_1.GroupCalc()
	dw_1.ShareData( dw_2 )	
	dw_2.GroupCalc()

//		dw_1.dataobject = "d_oidaydo_r1"
//		dw_1.settransobject(sqlca)	
//
//		dw_1.Retrieve( ls_orgteam, ld_sdate, ld_edate, ls_price )
//		dw_1.GroupCalc()
//		dw_1.ShareData( dw_2 )	
//		dw_2.GroupCalc()
end if

if dw_2.visible = true then		// 
	dw_2.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_itemtop10, ls_inside )
end if

if dw_3.visible = true then		// 

	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if


   dw_3.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_userid, ls_orgteam, ls_itemtop10, ls_inside )
end if

if dw_4.visible = true then		// 

	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if
	
	dw_4.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_userid, ls_orgteam,  ls_itemtop10, ls_inside )
end if

if dw_5.visible = true then		// 

	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if

	dw_5.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm,  ls_userid, ls_orgteam, ls_itemtop10, ls_inside )
	
end if

if dw_6.visible = true then
	
	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if
	
	dw_6.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_yymm, ls_userid, ls_orgteam, ls_itemtop10, ls_inside, ls_work )
end if

if dw_7.visible = true then	// 품목+담당자

	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if
	
	dw_7.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_userid, ls_orgteam, ls_itemtop10, ls_inside, ls_work )
end if

if dw_8.visible = true then		// 

	if ls_orgteam = "전체팀" then 
		ls_orgteam = "%"
	END IF
	// 팀조회
//	if cbx_team.checked = true then		
//		SELECT team INTO :ls_orgteam FROM v_team WHERE user_id = :ls_userid; 
//		ls_userid = '%'
//	end if


	if cbx_2.checked then
		ls_now_ewol_yn = 'Y'
	else
		ls_now_ewol_yn = 'N'
	end if
	
	if cbx_3.checked then
		ls_next_ewol_yn = 'Y'
	else
		ls_next_ewol_yn = 'N'		
	end if

   dw_8.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_userid, ls_orgteam, ls_itemtop10, ls_inside, ls_now_ewol_yn, ls_next_ewol_yn )
end if

//
lt_etime = now()
ll_calctime = SecondsAfter(lt_stime, lt_etime)
MessageBox("확인","조회완료[" + string(ll_calctime) + "]초")

end event

type gb_3 from w_inheritance`gb_3 within w_oidaydo_r
integer x = 3739
integer y = 0
integer width = 1285
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oidaydo_r
integer y = 240
integer width = 5495
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oidaydo_r
integer x = 5047
integer y = 0
integer width = 832
integer height = 232
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidaydo_r
integer x = 32
integer y = 172
integer width = 110
integer height = 76
integer taborder = 0
string dataobject = "d_oidayrep_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_2 from editmask within w_oidaydo_r
integer x = 4457
integer y = 48
integer width = 393
integer height = 76
integer taborder = 20
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

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
id_end = date(this.text)
end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

id_end = date(this.text)
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if

end event

type dw_area from datawindow within w_oidaydo_r
integer x = 1440
integer y = 44
integer width = 526
integer height = 84
integer taborder = 230
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type st_2 from statictext within w_oidaydo_r
boolean visible = false
integer x = 146
integer y = 200
integer width = 1294
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
string text = "화곡저장소에서 출고된것만 조회됩니다."
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_oidaydo_r
event mousemove pbm_mousemove
integer x = 5275
integer y = 60
integer width = 187
integer height = 144
integer taborder = 160
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

//
if dw_1.visible = true then dw_dest = dw_1
if dw_2.visible = true then dw_dest = dw_2
if dw_3.visible = true then dw_dest = dw_3
if dw_4.visible = true then dw_dest = dw_4
if dw_5.visible = true then dw_dest = dw_5
if dw_6.visible = true then dw_dest = dw_6
if dw_7.visible = true then dw_dest = dw_7

string  ls_Docname, ls_Named, ls_ExpandName
integer li_Value,   li_Pos

if dw_dest.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsAscII(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인","작업완료")
	end if
else
	MessageBox("확인","Datawindow를 선택하시기 바랍니다.")
end if	

end event

type gb_4 from groupbox within w_oidaydo_r
integer x = 2085
integer width = 1637
integer height = 232
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_1 from editmask within w_oidaydo_r
integer x = 4059
integer y = 48
integer width = 393
integer height = 76
integer taborder = 10
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
string displaydata = ""
end type

event modified;//
em_2.setfocus()

if dw_1.rowcount() > 0 then dw_1.reset()

id_start = date(this.text)

end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

id_start = date(this.text)
////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if

end event

type st_3 from statictext within w_oidaydo_r
integer x = 78
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_oidaydo_r
integer x = 265
integer y = 304
integer width = 443
integer height = 632
integer taborder = 210
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

type ddlb_dwtitles from dropdownlistbox within w_oidaydo_r
integer x = 297
integer y = 316
integer width = 311
integer height = 88
integer taborder = 240
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

type st_4 from statictext within w_oidaydo_r
integer x = 736
integer y = 320
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

type sle_value from singlelineedit within w_oidaydo_r
integer x = 1216
integer y = 308
integer width = 498
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oidaydo_r
integer x = 1847
integer y = 308
integer width = 160
integer height = 76
integer taborder = 170
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidaydo_r
integer x = 2011
integer y = 308
integer width = 160
integer height = 76
integer taborder = 220
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

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_3.visible = true then
	arg_dw = dw_3
else
	RETURN
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

// DW Filter 해지
long ll_row

dw_filter.visible = false
for ll_row = 1 to dw_filter.rowcount()
	dw_filter.object.chk[ll_row] = "N"
next

end event

type cb_3 from commandbutton within w_oidaydo_r
integer x = 2176
integer y = 308
integer width = 160
integer height = 76
integer taborder = 260
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidaydo_r
integer x = 2341
integer y = 308
integer width = 160
integer height = 76
integer taborder = 280
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_oidaydo_r
integer x = 187
integer y = 620
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oidaydo_ct2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_sum from checkbox within w_oidaydo_r
boolean visible = false
integer x = 4754
integer y = 824
integer width = 731
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
boolean enabled = false
string text = "출고집계(출고일자)"
boolean automatic = false
end type

event clicked;// 출고집계(단가 노출로 인한 권한자만 사용함)
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = true  ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	cbx_fix.enabled  = true
     cbx_view.enabled = true
	cbx_qa.enabled   = true
	
	cb_popup.enabled   = false
	cbx_import.enabled = false
else
	dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	/*2019.06.27 jowonsuk 추가 */
	 if dw_team.object.team[1] = "전체팀" then
		dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	else
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = true  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	end if	
	
	cbx_fix.enabled  = false
     cbx_view.enabled = false
	cbx_qa.enabled   = false

	cb_popup.enabled   = true
	cbx_import.enabled = true
end if

cbx_fix.triggerevent( clicked! )

end event

type cbx_view from checkbox within w_oidaydo_r
integer x = 3465
integer y = 288
integer width = 320
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
string text = "년월별"
boolean checked = true
end type

event clicked;////
//if this.checked = true then
//	dw_3.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw_3.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//else
//	dw_3.Modify("DataWindow.Detail.Height=80")		// Detail
//	dw_3.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//end if
//
//
//
end event

type cbx_fix from checkbox within w_oidaydo_r
integer x = 4603
integer y = 348
integer width = 315
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
string text = "틀고정"
end type

event clicked;//
string ls_colx

if rb_1.checked then

	if this.checked = true then
		ls_colx = string(integer(dw_3.object.item_name.x) + integer(dw_3.object.item_name.width))
	else
		ls_colx = "0"
	end if
	dw_3.object.datawindow.horizontalscrollsplit = ls_colx
		
end if

if rb_2.checked then
	
	if this.checked = true then
		ls_colx = string(integer(dw_8.object.item_name.x) + integer(dw_8.object.item_name.width))
	else
		ls_colx = "0"
	end if
	dw_8.object.datawindow.horizontalscrollsplit = ls_colx
	
end if

end event

type dw_top10 from datawindow within w_oidaydo_r
integer x = 2107
integer y = 128
integer width = 594
integer height = 84
integer taborder = 290
boolean bringtotop = true
string title = "none"
string dataobject = "d_cditemtop10_s"
boolean border = false
boolean livescroll = true
end type

type cbx_qa from checkbox within w_oidaydo_r
integer x = 4603
integer y = 288
integer width = 384
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "규격포함"
end type

event clicked;// 규격포함
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = true
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
else
	dw_1.visible = false ; dw_3.visible = true  ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
end if

end event

type cbx_inside from checkbox within w_oidaydo_r
integer x = 4462
integer y = 148
integer width = 539
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "매출제외 업체"
end type

type st_1 from statictext within w_oidaydo_r
integer x = 1207
integer y = 44
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oidaydo_r
integer x = 2112
integer y = 48
integer width = 594
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
string text = "대/중분류"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_oidaydo_r
integer x = 3767
integer y = 136
integer width = 288
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oidaydo_r
boolean visible = false
integer x = 4594
integer y = 316
integer width = 59
integer height = 56
integer taborder = 120
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
boolean automatic = false
boolean lefttext = true
end type

event clicked;//// 팀
//string ls_userid
//
//dw_sales.accepttext()
//ls_userid = dw_sales.object.user[1]
//
//if ls_userid = "%" then
//	// 전체
//else
//	if this.checked = true then
//		idwc_cust.setfilter( "" )
//		idwc_cust.filter()
//	else
//		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
//		idwc_cust.filter()
//	end if
//end if
//
end event

type dw_sales from datawindow within w_oidaydo_r
integer x = 4059
integer y = 132
integer width = 393
integer height = 88
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()

this.accepttext()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.reset()
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.GetChild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("현장별 자재투입현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "%")
//	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
//	idwc_cust.accepttext()
//	dw_1.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_1.object.cust_no[1] = "ALL"
end if

if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_cust.insertrow(0)  

//// 팀
//if cbx_team.checked = true then
//	idwc_cust.setfilter( "" )
//	idwc_cust.filter()
//else
//	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
//	idwc_cust.filter()
//end if

This.AcceptText()

end event

type st_6 from statictext within w_oidaydo_r
integer x = 3767
integer y = 48
integer width = 288
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
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_oidaydo_r
integer x = 1202
integer y = 124
integer width = 233
integer height = 80
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cust from datawindow within w_oidaydo_r
integer x = 1435
integer y = 128
integer width = 613
integer height = 84
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type cb_popup1 from commandbutton within w_oidaydo_r
integer x = 2505
integer y = 308
integer width = 69
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;//		
m_dwgrid_popup NewMenu
string  ls_sort, ls_filter
integer li_int, li_rtn

NewMenu = CREATE m_dwgrid_popup

GS_SortFilter = ""
li_int = NewMenu.m_popup.PopMenu(ParentWindow().PointerX(), ParentWindow().PointerY())

choose case is_dw
	case "dw_1"
		GDW_Client = dw_1
	case "dw_3"
		GDW_Client = dw_3
	case ""
		MessageBox("확인","작업할 대상을 먼저 선택하시기 바랍니다.")
end choose

choose case GS_SortFilter
	case "m_originalfilter"
//		ls_filter = IS_Original_Filter
//		GDW_Client.SetFilter(ls_filter)
//		GDW_Client.Filter()
//		GDW_Client.Sort()

	case "m_originalsort"
//		GS_Sort = IS_Original_Sort
//		GDW_Client.SetSort(GS_Sort)
//		GDW_Client.Sort()

	case "m_specifysort"
		SetNull(ls_sort)
		li_rtn = GDW_Client.SetSort(ls_sort)
		if li_rtn = 1 then
			GS_Sort = GDW_Client.Describe("Datawindow.Table.Sort")
			GDW_Client.Sort()
		end if

	case "m_specifyfilter"
		GDW_Client.SetRedraw(True)
		SetNull(ls_filter)
		li_rtn = GDW_Client.SetFilter(ls_filter)
		if li_rtn = 1 then
			GDW_Client.Filter()
			GDW_Client.Sort()
		end if
				
	case "m_print"
		GDW_Client.Print()
		
	case "m_saveas"
		GDW_Client.SetRedraw(True)
		GDW_Client.SaveAs()
end choose

end event

type dw_team from datawindow within w_oidaydo_r
integer x = 3104
integer y = 48
integer width = 599
integer height = 80
integer taborder = 300
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdvteam_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_team, ls_teamnm, ls_teamcode

dw_team.accepttext()
ls_team  = this.object.team[1]

if ls_team = "전체팀" then
	dw_work.enabled = true
     dw_work.object.work_no.Background.Color = rgb(255, 255, 255)
	  
	/*2019.06.27 jowonsuk 추가 */ 
	dw_sales.enabled = true
     dw_sales.object.user.Background.Color = rgb(255, 255, 255)	  

	if cbx_qa.checked = true then	
		/*2019.06.27 jowonsuk 추가 */
		 if rb_1.checked then
			dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = true
			dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		elseif rb_2.checked then
			dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = true;						
		else
			dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		end if
		
	else
	//	dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
	//	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false
		
		/*2019.06.27 jowonsuk 추가 */
		 if rb_1.checked then
			dw_1.visible = false ; dw_3.visible = true ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		elseif rb_2.checked then
			dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = true;			
		else
			dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		end if
			
	end if
else
	
	/*2019.06.27 jowonsuk 추가 */
	dw_work.enabled = false
	dw_work.object.work_no[1] = "%"
     dw_work.object.work_no.Background.Color = rgb(192, 192, 192)


	if rb_1.checked then
		/*2019.06.27 jowonsuk 추가 */	  
		 if cbx_qa.checked then
			dw_1.visible = false ; dw_3.visible = false; dw_4.visible = true
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		else
			dw_1.visible = false ; dw_3.visible = true ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
		end if
	elseif rb_2.checked then
		/*2019.06.27 jowonsuk 추가 */	  
		 if cbx_qa.checked then
			dw_1.visible = false ; dw_3.visible = false; dw_4.visible = true
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
		else
			dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = true;		
		end if		
	else
			dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
			dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;				
	end if
	
	dw_sales.enabled = false
	dw_sales.object.user[1] = "%"	
     dw_sales.object.user.Background.Color = rgb(192, 192, 192)
	
end if

//
if GF_Permission("출고일보(기간별)(ALL)", gs_userid) = "Y" then
	//
else
	if ls_team = "전체팀" then
		//
	else
		SELECT team INTO :ls_teamnm FROM v_team WHERE user_id = :GS_Userid; 
		if ls_team <> ls_teamnm then
			MessageBox("확인","매출조직도에 해당하는 팀이 아닙니다.")
			RETURN
		end if
	end if
end if

// 품목+담당자
cbx_chk.enabled  = false

pb_retrieve.triggerevent( clicked! )

end event

type st_9 from statictext within w_oidaydo_r
integer x = 2720
integer y = 48
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "매출조직도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_work from datawindow within w_oidaydo_r
boolean visible = false
integer x = 4965
integer y = 596
integer width = 526
integer height = 80
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_cdvwork_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_work

// 대,중분류
dw_top10.accepttext()
dw_top10.object.itemtop10[1] = "%"	// 

//
this.accepttext()
ls_work  = this.object.work_no[row]

if ls_work = "%" then
	if cbx_qa.checked = true then		// 규격포함
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = true
		dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false
	else
		dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false
	end if

	cbx_sum.enabled  = true
	cbx_qa.enabled   = true	
	cbx_chk.enabled  = false
else
	if cbx_chk.checked = true then	// 품목+담당자
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = true	
	else
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false ; dw_6.visible = true  ; dw_7.visible = false	
	end if

	cbx_sum.enabled  = false
	cbx_qa.enabled   = false
	cbx_chk.enabled  = true
end if

//
pb_retrieve.triggerevent( clicked! )

end event

type st_10 from statictext within w_oidaydo_r
boolean visible = false
integer x = 4581
integer y = 596
integer width = 379
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_chk from checkbox within w_oidaydo_r
integer x = 4992
integer y = 288
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "품목+담당자"
end type

event clicked;// 품목+담당자
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = true; dw_8.visible = false;
else
	dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = true  ; dw_7.visible = false; dw_8.visible = false;
end if

end event

type cbx_hap from checkbox within w_oidaydo_r
integer x = 4992
integer y = 348
integer width = 489
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
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_3.visible = true then
	arg_dw = dw_3
elseif dw_4.visible = true then
	arg_dw = dw_4
elseif dw_5.visible = true then
	arg_dw = dw_5
elseif dw_6.visible = true then
	arg_dw = dw_6
elseif dw_7.visible = true then
	arg_dw = dw_7
elseif dw_8.visible = true then
	arg_dw = dw_8
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=72")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type cb_popup from commandbutton within w_oidaydo_r
integer x = 1723
integer y = 308
integer width = 119
integer height = 76
integer taborder = 330
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;// BUG 존재함(첫번째 조회후 DataWindow 클릭시 reset() 되고 두번째 조회후 이상없음)
string ls_itemno, ls_itemnm
DataWindow arg_dw

dw_1.setredraw( false )
dw_1.setsort( "groupitem_item_name A, do_date A, do_cust_no A, do_spot_code A, do_do_no A, dodet_oi_no" )
dw_1.sort()

dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
dw_1.Modify("DataWindow.Trailer.2.Height=0")	   // 소계 숨김
dw_1.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
dw_1.setredraw( true )

arg_dw = dw_1
ls_itemno  = "dodet_item_no"
ls_itemnm  = "groupitem_item_name"
//
pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

WF_DWFilter( arg_dw, ls_itemno, ls_itemnm, sle_value.text )
SetPointer(oldpointer)

end event

type dw_filter from datawindow within w_oidaydo_r
integer x = 1600
integer y = 1136
integer width = 1563
integer height = 748
integer taborder = 320
boolean bringtotop = true
boolean titlebar = true
string title = "확정은 우측마우스 클릭..."
string dataobject = "d_dw_filter"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event clicked;//
long  ll_row

if isnull(row) OR row < 1 then RETURN

if row = 1 then
	choose case dwo.name
		case "chk"
			this.setredraw( false )
			// (모두 선택)
			if this.object.chk[1] = "N" then
				for ll_row = 2 to this.rowcount()
					this.object.chk[ll_row] = "Y"	
				next
			else
				for ll_row = 2 to this.rowcount()
					this.object.chk[ll_row] = "N"	
				next
			end if
			this.setredraw( true )
	end choose
end if

end event

event rbuttondown;//
string ls_filter, ls_filternm, ls_itemnm
long   ll_row, ll_tchk
Datawindow arg_dw

arg_dw = dw_1
ls_filternm = "groupitem_item_name"

//
ll_tchk = this.object.tchk[1]

if ll_tchk > 0 then
	// (모두 선택)
	for ll_row = 2 to this.rowcount()
		if this.object.chk[ll_row] = "Y" then
			ls_itemnm = this.object.item_name[ll_row] 
			
			ls_filter = ls_filter + "'" + ls_itemnm + "',"
		end if
	next
	ls_filter = LeftA(ls_filter, LenA(ls_filter) - 1)
	
	arg_dw.setredraw( false )
	arg_dw.setfilter( ls_filternm + " IN (" + ls_filter + ")" )
	arg_dw.filter()
	arg_dw.setredraw( true )
	
	this.visible = false
end if

end event

type cbx_import from checkbox within w_oidaydo_r
integer x = 1751
integer y = 244
integer width = 439
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "필터 불러오기"
end type

type dw_5 from datawindow within w_oidaydo_r
integer x = 1595
integer y = 620
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_ct4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type dw_4 from datawindow within w_oidaydo_r
integer x = 891
integer y = 620
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_ct3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type dw_6 from datawindow within w_oidaydo_r
integer x = 2299
integer y = 620
integer width = 686
integer height = 400
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_ct5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type dw_7 from datawindow within w_oidaydo_r
integer x = 3003
integer y = 620
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidaydo_ct6"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type ddlb_op from dropdownlistbox within w_oidaydo_r
integer x = 905
integer y = 300
integer width = 302
integer height = 500
integer taborder = 160
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type dw_8 from datawindow within w_oidaydo_r
integer x = 187
integer y = 1072
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_oidaydo_ct8"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_1 from checkbox within w_oidaydo_r
boolean visible = false
integer x = 4754
integer y = 892
integer width = 800
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
boolean enabled = false
string text = "출고집계(영업담당자)"
boolean automatic = false
end type

event clicked;// 출고집계(단가 노출로 인한 권한자만 사용함)
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = true  ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	cbx_fix.enabled  = true
     cbx_view.enabled = true
	cbx_qa.enabled   = true
	
	cb_popup.enabled   = false
	cbx_import.enabled = false
else
	dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	/*2019.06.27 jowonsuk 추가 */
	 if dw_team.object.team[1] = "전체팀" then
		dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	else
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = true  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	end if	
	
	cbx_fix.enabled  = false
     cbx_view.enabled = false
	cbx_qa.enabled   = false

	cb_popup.enabled   = true
	cbx_import.enabled = true
end if

cbx_fix.triggerevent( clicked! )

end event

type rb_1 from radiobutton within w_oidaydo_r
integer x = 2610
integer y = 288
integer width = 731
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
string text = "출고집계(출고일자)"
boolean checked = true
end type

event clicked;// 출고집계(단가 노출로 인한 권한자만 사용함)
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = true  ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	cbx_fix.enabled  = true
     cbx_view.enabled = true
	cbx_qa.enabled   = true
	
	cb_popup.enabled   = false
	cbx_import.enabled = false
	
	cbx_2.enabled = false
	cbx_3.enabled = false
else
	dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	/*2019.06.27 jowonsuk 추가 */
	 if dw_team.object.team[1] = "전체팀" then
		dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	else
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = true  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	end if	
	
	cbx_fix.enabled  = false
     cbx_view.enabled = false
	cbx_qa.enabled   = false

	cb_popup.enabled   = true
	cbx_import.enabled = true
	cbx_2.enabled = false
	cbx_3.enabled = false	
end if

cbx_fix.triggerevent( clicked! )

end event

type rb_2 from radiobutton within w_oidaydo_r
integer x = 2610
integer y = 348
integer width = 800
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
string text = "출고집계(영업담당자)"
end type

event clicked;// 출고집계(단가 노출로 인한 권한자만 사용함)
if this.checked = true then
	dw_1.visible = false ; dw_3.visible = false  ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = true;
	
	cbx_fix.enabled  = true
     cbx_view.enabled = false
	cbx_qa.enabled   = true
	
	cb_popup.enabled   = false
	cbx_import.enabled = false
	cbx_2.enabled = true
	cbx_3.enabled = true
else
	dw_1.visible = true  ; dw_3.visible = false ; dw_4.visible = false
	dw_5.visible = false ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;
	
	/*2019.06.27 jowonsuk 추가 */
	 if dw_team.object.team[1] = "전체팀" then
		dw_1.visible = true ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = false  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	else
		dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false
		dw_5.visible = true  ; dw_6.visible = false ; dw_7.visible = false; dw_8.visible = false;		
	end if	
	
	cbx_fix.enabled  = false
     cbx_view.enabled = false
	cbx_qa.enabled   = false

	cb_popup.enabled   = true
	cbx_import.enabled = true
	
	cbx_2.enabled = false
	cbx_3.enabled = false	
end if

cbx_fix.triggerevent( clicked! )
end event

type cbx_2 from checkbox within w_oidaydo_r
integer x = 3461
integer y = 348
integer width = 521
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
string text = "전월이월반영"
boolean checked = true
end type

type cbx_3 from checkbox within w_oidaydo_r
integer x = 4027
integer y = 348
integer width = 521
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
string text = "당월이월반영"
end type

type gb_5 from groupbox within w_oidaydo_r
integer x = 1179
integer width = 891
integer height = 232
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

