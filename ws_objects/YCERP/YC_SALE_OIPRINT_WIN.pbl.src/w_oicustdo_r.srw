$PBExportHeader$w_oicustdo_r.srw
$PBExportComments$판매거래처별 제품출고현황(1998/5/15,성삼지)
forward
global type w_oicustdo_r from w_inheritance
end type
type rb_1 from radiobutton within w_oicustdo_r
end type
type rb_2 from radiobutton within w_oicustdo_r
end type
type gb_4 from groupbox within w_oicustdo_r
end type
type dw_area from datawindow within w_oicustdo_r
end type
type pb_1 from picturebutton within w_oicustdo_r
end type
type dw_3 from datawindow within w_oicustdo_r
end type
type rb_3 from radiobutton within w_oicustdo_r
end type
type cbx_1 from checkbox within w_oicustdo_r
end type
type rb_4 from radiobutton within w_oicustdo_r
end type
type rb_5 from radiobutton within w_oicustdo_r
end type
type st_3 from statictext within w_oicustdo_r
end type
type st_4 from statictext within w_oicustdo_r
end type
type sle_value from singlelineedit within w_oicustdo_r
end type
type cb_1 from commandbutton within w_oicustdo_r
end type
type cb_2 from commandbutton within w_oicustdo_r
end type
type cb_3 from commandbutton within w_oicustdo_r
end type
type cb_5 from commandbutton within w_oicustdo_r
end type
type ddlb_fld from dropdownlistbox within w_oicustdo_r
end type
type rb_6 from radiobutton within w_oicustdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustdo_r
end type
type cbx_3 from checkbox within w_oicustdo_r
end type
type dw_4 from datawindow within w_oicustdo_r
end type
type cb_4 from commandbutton within w_oicustdo_r
end type
type dw_5 from datawindow within w_oicustdo_r
end type
type dw_7 from datawindow within w_oicustdo_r
end type
type cb_popup1 from commandbutton within w_oicustdo_r
end type
type st_5 from statictext within w_oicustdo_r
end type
type dw_filter from datawindow within w_oicustdo_r
end type
type cb_popup from commandbutton within w_oicustdo_r
end type
type em_1 from editmask within w_oicustdo_r
end type
type em_2 from editmask within w_oicustdo_r
end type
type st_8 from statictext within w_oicustdo_r
end type
type dw_cust from datawindow within w_oicustdo_r
end type
type cbx_hap from checkbox within w_oicustdo_r
end type
type cbx_haphd from checkbox within w_oicustdo_r
end type
type cbx_import from checkbox within w_oicustdo_r
end type
type cb_6 from commandbutton within w_oicustdo_r
end type
type st_7 from statictext within w_oicustdo_r
end type
type dw_sales from datawindow within w_oicustdo_r
end type
type cbx_team from checkbox within w_oicustdo_r
end type
type ddlb_op from dropdownlistbox within w_oicustdo_r
end type
type gb_5 from groupbox within w_oicustdo_r
end type
end forward

global type w_oicustdo_r from w_inheritance
integer y = 112
integer width = 5701
integer height = 2604
string title = "거래처별 물품 출고현황(w_oicustdo_r)"
rb_1 rb_1
rb_2 rb_2
gb_4 gb_4
dw_area dw_area
pb_1 pb_1
dw_3 dw_3
rb_3 rb_3
cbx_1 cbx_1
rb_4 rb_4
rb_5 rb_5
st_3 st_3
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_fld ddlb_fld
rb_6 rb_6
ddlb_dwtitles ddlb_dwtitles
cbx_3 cbx_3
dw_4 dw_4
cb_4 cb_4
dw_5 dw_5
dw_7 dw_7
cb_popup1 cb_popup1
st_5 st_5
dw_filter dw_filter
cb_popup cb_popup
em_1 em_1
em_2 em_2
st_8 st_8
dw_cust dw_cust
cbx_hap cbx_hap
cbx_haphd cbx_haphd
cbx_import cbx_import
cb_6 cb_6
st_7 st_7
dw_sales dw_sales
cbx_team cbx_team
ddlb_op ddlb_op
gb_5 gb_5
end type
global w_oicustdo_r w_oicustdo_r

type variables
//
gs_custdo_str   ist_code

string is_dw, is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret

datawindowchild idwc_area, idwc_cust, idwc_user

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

on w_oicustdo_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_4=create gb_4
this.dw_area=create dw_area
this.pb_1=create pb_1
this.dw_3=create dw_3
this.rb_3=create rb_3
this.cbx_1=create cbx_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.st_3=create st_3
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_fld=create ddlb_fld
this.rb_6=create rb_6
this.ddlb_dwtitles=create ddlb_dwtitles
this.cbx_3=create cbx_3
this.dw_4=create dw_4
this.cb_4=create cb_4
this.dw_5=create dw_5
this.dw_7=create dw_7
this.cb_popup1=create cb_popup1
this.st_5=create st_5
this.dw_filter=create dw_filter
this.cb_popup=create cb_popup
this.em_1=create em_1
this.em_2=create em_2
this.st_8=create st_8
this.dw_cust=create dw_cust
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.cbx_import=create cbx_import
this.cb_6=create cb_6
this.st_7=create st_7
this.dw_sales=create dw_sales
this.cbx_team=create cbx_team
this.ddlb_op=create ddlb_op
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.rb_5
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.ddlb_fld
this.Control[iCurrent+19]=this.rb_6
this.Control[iCurrent+20]=this.ddlb_dwtitles
this.Control[iCurrent+21]=this.cbx_3
this.Control[iCurrent+22]=this.dw_4
this.Control[iCurrent+23]=this.cb_4
this.Control[iCurrent+24]=this.dw_5
this.Control[iCurrent+25]=this.dw_7
this.Control[iCurrent+26]=this.cb_popup1
this.Control[iCurrent+27]=this.st_5
this.Control[iCurrent+28]=this.dw_filter
this.Control[iCurrent+29]=this.cb_popup
this.Control[iCurrent+30]=this.em_1
this.Control[iCurrent+31]=this.em_2
this.Control[iCurrent+32]=this.st_8
this.Control[iCurrent+33]=this.dw_cust
this.Control[iCurrent+34]=this.cbx_hap
this.Control[iCurrent+35]=this.cbx_haphd
this.Control[iCurrent+36]=this.cbx_import
this.Control[iCurrent+37]=this.cb_6
this.Control[iCurrent+38]=this.st_7
this.Control[iCurrent+39]=this.dw_sales
this.Control[iCurrent+40]=this.cbx_team
this.Control[iCurrent+41]=this.ddlb_op
this.Control[iCurrent+42]=this.gb_5
end on

on w_oicustdo_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_4)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.rb_3)
destroy(this.cbx_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_fld)
destroy(this.rb_6)
destroy(this.ddlb_dwtitles)
destroy(this.cbx_3)
destroy(this.dw_4)
destroy(this.cb_4)
destroy(this.dw_5)
destroy(this.dw_7)
destroy(this.cb_popup1)
destroy(this.st_5)
destroy(this.dw_filter)
destroy(this.cb_popup)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_8)
destroy(this.dw_cust)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.cbx_import)
destroy(this.cb_6)
destroy(this.st_7)
destroy(this.dw_sales)
destroy(this.cbx_team)
destroy(this.ddlb_op)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

is_custdosql  = dw_1.describe("datawindow.table.select")
is_custdorsql = dw_2.describe("datawindow.table.select")
dw_3.settransobject(sqlca)
is_custdor1sql = dw_3.describe("datawindow.table.select")

dw_4.settransobject(sqlca)
dw_4.visible = false
dw_5.settransobject(sqlca)
dw_5.visible = false
dw_7.settransobject(sqlca)
dw_7.visible = false

dw_2.visible = false
dw_3.visible = false
dw_4.visible = false

// 일자
em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')

// 사업장
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

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("거래처별_물품_출고현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()

	//
	dw_sales.object.user[1] = "%"
	if	dw_sales.event itemchanged( dw_sales.getrow(), dw_sales.object.user, gs_userid) = 1 then
		dw_sales.event itemerror( dw_sales.getrow(), dw_sales.object.user, gs_userid)
	end if
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
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
	
	//
	dw_sales.object.user[1] = gs_userid
	if	dw_sales.event itemchanged( dw_sales.getrow(), dw_sales.object.user, gs_userid) = 1 then
		dw_sales.event itemerror( dw_sales.getrow(), dw_sales.object.user, gs_userid)
	end if
end if
dw_sales.setfocus()

//
dw_filter.visible = false	// DW Filter용
cb_popup1.enabled = false
if GS_UserID = "1999010s" then cb_popup1.enabled = true

rb_1.checked = true
rb_1.postevent( clicked! )

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

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

dw_7.x      = dw_1.x
dw_7.y      = dw_1.y
dw_7.width  = dw_1.width
dw_7.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_oicustdo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oicustdo_r
integer x = 32
integer y = 460
integer width = 5554
integer height = 1904
integer taborder = 0
string dataobject = "d_oicustdo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oicustdo_r
integer x = 0
integer y = 0
integer width = 1403
integer height = 140
string text = "거래처별 물품출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oicustdo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oicustdo_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicustdo_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 40
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

type pb_close from w_inheritance`pb_close within w_oicustdo_r
integer x = 5559
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustdo_r
integer x = 5367
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
long ll_count

string ls_area, ls_custno, ls_userid, ls_sdate, ls_edate
date ld_sdate, ld_edate

dw_area.accepttext()
ls_area    = trim(LeftA(dw_area.object.area[1],1)) + "%"

// 거래처
dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]

// 담당자
dw_sales.accepttext()
ls_userid  = dw_sales.object.user[1]

// 일자
ld_sdate   = date(em_1.text)
ld_edate   = date(em_2.text)

ls_sdate   = string(ld_sdate, "yyyy/mm/dd")
ls_edate   = string(ld_edate, "yyyy/mm/dd")


dw_2.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_userid )

for ll_count = 1 to dw_2.rowcount()
	dw_2.object.bus_tel[ll_count] = ist_code.start_date
	dw_2.object.tel_no[ll_count]  = ist_code.end_date
next

dw_1.groupcalc()
dw_2.groupcalc()

if dw_2.rowcount() < 1 then
   messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
   return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//l_print.name = 'd_oicustrep_r1'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 판매거래처별 출고현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=89'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_oicustdo_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oicustdo_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oicustdo_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oicustdo_r
integer x = 4983
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_sql, ls_where, ls_issue
string ls_area, ls_userid, ls_custno, ls_custno1, ls_custname, ls_custname1, ls_desc
string ls_sdate, ls_edate
date   ld_sdate, ld_edate

st_security lst_security

//OpenWithParm(w_whcustdo_w, ist_code)
//ist_code = Message.PowerObjectParm
//if ist_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

debugbreak()

// 사업장
dw_area.accepttext()
ls_area    = trim(LeftA(dw_area.object.area[1],1)) + "%"

// 거래처
dw_cust.accepttext()
ls_custno  = dw_cust.object.cust_no[1]

// 담당자
dw_sales.accepttext()
ls_userid  = dw_sales.object.user[1]

// 일자
ld_sdate   = date(em_1.text)
ld_edate   = date(em_2.text)

ls_sdate   = string(ld_sdate, "yyyy/mm/dd")
ls_edate   = string(ld_edate, "yyyy/mm/dd")


//
if rb_1.checked = true then	// 거래처별 현장별
	dw_1.visible = true
	dw_3.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_7.visible = false

	if isnull(ls_custno) OR ls_custno = "" then ls_custno = "%"
	
	dw_1.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_userid )
	dw_1.groupcalc()
	
//	dw_2.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_userid )
//	dw_2.groupcalc()	
	
	if dw_1.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if

//	dw_1.ShareData( dw_2 )		// 출력
//	dw_2.groupcalc()
//	dw_1.setfocus()
	
elseif rb_2.checked = true then	// 거래명세표 발행번호
	dw_3.visible = true
	dw_1.visible = false
	dw_4.visible = false
	dw_5.visible = false
	dw_7.visible = false

	dw_3.retrieve( ls_area, ld_sdate, ld_edate, ls_userid )
	if dw_3.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if

//	dw_3.sharedata(dw_2)		// 출력	
//	dw_2.groupcalc()
	dw_3.setfocus()

elseif rb_3.checked = true then	// 보고용 엑셀
	dw_4.visible = true
	dw_1.visible = false
	dw_3.visible = false
	dw_5.visible = false
	dw_7.visible = false
	
	// 결산집계자료
	dw_4.retrieve( ls_area, ls_custno, ls_userid, ls_sdate, ls_edate)	
	if dw_4.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_4.setfocus()
	
elseif rb_4.checked = true OR rb_6.checked = true then	// 분석, 기타분석
	cbx_haphd.enabled = false	
	cbx_hap.enabled   = false
	
	dw_5.visible = true
	dw_1.visible = false
	dw_3.visible = false
	dw_4.visible = false
	dw_7.visible = false
	
	string ls_etcyn = "N"
	if rb_6.checked = true then ls_etcyn = "Y"
	
	dw_5.retrieve( ls_area, ls_custno, ls_userid, ls_sdate, ls_edate, ls_etcyn )	
	if dw_5.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_5.setfocus()

else									// 거래처 현장목록 
	dw_7.visible = true
	dw_1.visible = false
	dw_3.visible = false
	dw_4.visible = false
	dw_5.visible = false
	
	dw_7.retrieve( ls_area, ls_custno, ls_userid, ld_sdate, ld_edate )
	if dw_7.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_7.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oicustdo_r
integer x = 32
integer y = 256
integer width = 5554
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oicustdo_r
integer x = 1458
integer y = 16
integer width = 809
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oicustdo_r
integer x = 4951
integer y = 16
integer width = 827
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_oicustdo_r
integer x = 55
integer y = 192
integer width = 82
integer height = 56
integer taborder = 0
string dataobject = "d_oicustrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type rb_1 from radiobutton within w_oicustdo_r
integer x = 3241
integer y = 72
integer width = 603
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처별 현장별"
boolean checked = true
end type

event clicked;//
cbx_1.enabled = true
cbx_3.visible = false	// 운반비 포함
dw_1.visible  = true
dw_3.visible  = false
dw_4.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

end event

type rb_2 from radiobutton within w_oicustdo_r
integer x = 3241
integer y = 152
integer width = 626
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래명세표 번호"
end type

event clicked;//
dw_3.visible  = true
cbx_1.enabled = true
cbx_3.visible = false	// 운반비 포함
dw_1.visible  = false
dw_4.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )

end event

type gb_4 from groupbox within w_oicustdo_r
integer x = 3200
integer y = 16
integer width = 1733
integer height = 216
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
end type

type dw_area from datawindow within w_oicustdo_r
integer x = 1719
integer y = 56
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from picturebutton within w_oicustdo_r
event mousemove pbm_mousemove
integer x = 5175
integer y = 60
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

if rb_1.checked = true then
	dwxls  = dw_1
elseif rb_2.checked = true then
	dwxls  = dw_3
elseif rb_3.checked = true then
	dwxls  = dw_4
elseif rb_4.checked = true or rb_6.checked = true then
	dwxls  = dw_5
else
	dwxls  = dw_7	
end if	

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

type dw_3 from datawindow within w_oicustdo_r
integer x = 160
integer y = 676
integer width = 4389
integer height = 1072
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oicustdo_r1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_3 from radiobutton within w_oicustdo_r
integer x = 3877
integer y = 72
integer width = 626
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "보고용 엑셀자료"
end type

event clicked;//
dw_4.visible  = true
cbx_1.enabled = false
cbx_3.visible = false	// 운반비 포함

dw_1.visible  = false
dw_3.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )

end event

type cbx_1 from checkbox within w_oicustdo_r
integer x = 3785
integer y = 304
integer width = 375
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "거래처계"
end type

event clicked;//
if rb_1.checked = false then
	MessageBox("확인","거래처별 현장별 자료에서만 실행됩니다.")
	return
end if

string ls_value

if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.2.Height=0")		// 출고번호 소계
	dw_1.Modify("DataWindow.Trailer.1.Height=68")	// 거래처 소계
else
	dw_1.Modify("DataWindow.Detail.Height=68")		// Detail
	dw_1.Modify("DataWindow.Trailer.2.Height=68")	// 출고번호 소계
	dw_1.Modify("DataWindow.Trailer.1.Height=68")	// 거래처 소계
end if

end event

type rb_4 from radiobutton within w_oicustdo_r
integer x = 4521
integer y = 68
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "분석"
end type

event clicked;//
dw_5.visible  = true
cbx_1.enabled = false
cbx_3.visible = true		// 운반비 포함
dw_1.visible  = false
dw_3.visible  = false
dw_4.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )

end event

type rb_5 from radiobutton within w_oicustdo_r
integer x = 3877
integer y = 152
integer width = 603
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "거래처 현장목록"
end type

event clicked;//
dw_7.visible  = true
cbx_1.enabled = false
cbx_3.visible = false	// 운반비 포함
dw_1.visible  = false
dw_3.visible  = false
dw_4.visible  = false
dw_5.visible  = false

ddlb_fld.enabled = true
ddlb_op.enabled = true
cb_1.enabled   = true		// 필터
cb_2.enabled   = true		// 해지
cb_3.enabled   = true		// 오름
cb_5.enabled   = true		// 내림

GF_DWTitle2ddlb( dw_7, ddlb_fld, ddlb_dwtitles )

end event

type st_3 from statictext within w_oicustdo_r
integer x = 87
integer y = 340
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

type st_4 from statictext within w_oicustdo_r
integer x = 745
integer y = 340
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

type sle_value from singlelineedit within w_oicustdo_r
integer x = 1221
integer y = 328
integer width = 503
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

type cb_1 from commandbutton within w_oicustdo_r
integer x = 1856
integer y = 328
integer width = 160
integer height = 76
integer taborder = 70
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

if rb_1.checked = true then
	arg_dw  = dw_1
elseif rb_2.checked = true then
	arg_dw  = dw_3
elseif rb_3.checked = true then
	arg_dw  = dw_4
elseif rb_4.checked = true then
	arg_dw  = dw_5
else
	arg_dw  = dw_7	
end if	

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oicustdo_r
integer x = 2021
integer y = 328
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if rb_1.checked = true then	   // 거래처별 현장별
	arg_dw = dw_1
elseif rb_2.checked = true then	// 거래명세표 발행번호
	arg_dw = dw_3
elseif rb_3.checked = true then	// 보고용 엑셀
	arg_dw = dw_4
elseif rb_4.checked = true then	// 보고용 엑셀
	arg_dw = dw_5
else
	arg_dw = dw_7
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

type cb_3 from commandbutton within w_oicustdo_r
integer x = 2185
integer y = 328
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if rb_1.checked = true then	   // 거래처별 현장별
	arg_dw = dw_1
elseif rb_2.checked = true then	// 거래명세표 발행번호
	arg_dw = dw_3
elseif rb_3.checked = true then	// 보고용 엑셀
	arg_dw = dw_4
elseif rb_4.checked = true then	// 보고용 엑셀
	arg_dw = dw_5
else
	arg_dw = dw_7
end if

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oicustdo_r
integer x = 2350
integer y = 328
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if rb_1.checked = true then	   // 거래처별 현장별
	arg_dw = dw_1
elseif rb_2.checked = true then	// 거래명세표 발행번호
	arg_dw = dw_3
elseif rb_3.checked = true then	// 보고용 엑셀
	arg_dw = dw_4
elseif rb_4.checked = true then	// 보고용 엑셀
	arg_dw = dw_5
else
	arg_dw = dw_7
end if

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_fld from dropdownlistbox within w_oicustdo_r
integer x = 274
integer y = 324
integer width = 443
integer height = 632
integer taborder = 80
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

type rb_6 from radiobutton within w_oicustdo_r
integer x = 4521
integer y = 152
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "기타분석"
end type

event clicked;//
dw_5.visible  = true
cbx_1.enabled = false
cbx_3.visible = false	// 운반비 포함
dw_1.visible  = false
dw_3.visible  = false
dw_4.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_oicustdo_r
integer x = 306
integer y = 332
integer width = 311
integer height = 88
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

type cbx_3 from checkbox within w_oicustdo_r
integer x = 3785
integer y = 368
integer width = 489
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
string text = "운반비 포함"
end type

event clicked;// 운반비 포함
if this.checked = true then
	dw_5.dataobject = "d_oicustdo_pivot_shipcost"
else
	dw_5.dataobject = "d_oicustdo_pivot"
end if
dw_5.settransobject(sqlca)

end event

type dw_4 from datawindow within w_oicustdo_r
integer x = 343
integer y = 924
integer width = 4078
integer height = 944
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdo_r0"
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

end event

type cb_4 from commandbutton within w_oicustdo_r
integer x = 2619
integer y = 288
integer width = 553
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전략품목 관리"
end type

event clicked;//
if IsValid(w_cditemtop10_m) = False then			
	OpenSheet(w_cditemtop10_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
	Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
	
//	w_cditemtop10_m.dw_1.object.cust_no[1] = ls_custno
//	w_cditemtop10_m.dw_1.accepttext()		
//
//	if	w_cditemtop10_m.dw_1.event itemchanged(w_cditemtop10_m.dw_1.getrow(),w_cditemtop10_m.dw_1.object.cust_no,ls_custno) = 1 then
//		w_cditemtop10_m.dw_1.event itemerror(w_cditemtop10_m.dw_1.getrow(),w_cditemtop10_m.dw_1.object.cust_no,ls_custno)
//		return
//	else
		w_cditemtop10_m.pb_retrieve.triggerevent( clicked! )
//	end if
end if

end event

type dw_5 from datawindow within w_oicustdo_r
string tag = "d_oicustdo_pivot"
integer x = 553
integer y = 1116
integer width = 3675
integer height = 896
integer taborder = 50
boolean bringtotop = true
string title = "d_oicustdo_pivot_shipcost"
string dataobject = "d_oicustdo_pivot"
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

This.SelectRow(0, FALSE)
This.SelectRow( row, NOT This.IsSelected( row ) )

//
cbx_haphd.enabled = true	
cbx_hap.enabled   = true

end event

type dw_7 from datawindow within w_oicustdo_r
integer x = 722
integer y = 1328
integer width = 3351
integer height = 796
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_oicustdo_scene"
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

end event

type cb_popup1 from commandbutton within w_oicustdo_r
integer x = 2514
integer y = 328
integer width = 69
integer height = 76
integer taborder = 80
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

type st_5 from statictext within w_oicustdo_r
integer x = 1481
integer y = 56
integer width = 233
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_filter from datawindow within w_oicustdo_r
integer x = 1829
integer y = 972
integer width = 1563
integer height = 916
integer taborder = 310
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
string ls_filter, ls_filter_name, ls_itemnm
long   ll_row, ll_tchk
Datawindow arg_dw

debugbreak()

if dw_1.visible = true then 
	ls_filter_name = "groupitem_item_name"
	arg_dw = dw_1
elseif dw_3.visible = true then 
	ls_filter_name = "groupitem_item_name"
	arg_dw = dw_3
elseif dw_4.visible = true then 
	ls_filter_name = "groupitem_item_name"
	arg_dw = dw_4
else
	RETURN
end if

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
	arg_dw.setfilter( ls_filter_name + " IN (" + ls_filter + ")" )
	arg_dw.filter()
	arg_dw.setredraw( true )
	
	this.visible = false
end if

end event

type cb_popup from commandbutton within w_oicustdo_r
integer x = 1733
integer y = 328
integer width = 119
integer height = 76
integer taborder = 320
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
string ls_itemno, ls_itemnm
DataWindow arg_dw

debugbreak()

if dw_1.visible = true then 
	ls_itemno = "dodet_item_no"
	ls_itemnm = "groupitem_item_name"
	arg_dw = dw_1
elseif dw_3.visible = true then 
	ls_itemno = "dodet_item_no"
	ls_itemnm = "groupitem_item_name"
	arg_dw = dw_3
elseif dw_4.visible = true then 
	ls_itemno = "dodet_item_no"
	ls_itemnm = "groupitem_item_name"
	arg_dw = dw_4
else
	RETURN
end if

if arg_dw.rowcount() < 1 then RETURN

arg_dw.Modify("DataWindow.Detail.Height=76")		// Detail
arg_dw.Modify("DataWindow.Trailer.2.Height=0")	   // 소계 숨김
arg_dw.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김

arg_dw.setsort( ls_itemnm + " A" )
arg_dw.sort()


pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

//
WF_DWFilter( arg_dw, ls_itemno, ls_itemnm, sle_value.text )

SetPointer(oldpointer)

end event

type em_1 from editmask within w_oicustdo_r
integer x = 2304
integer y = 136
integer width = 421
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
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

//id_start = date(this.text)
////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_start = date(this.text)
//end if

end event

type em_2 from editmask within w_oicustdo_r
integer x = 2729
integer y = 136
integer width = 421
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
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

//id_end = date(this.text)
//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	id_end = date(this.text)
//end if

end event

type st_8 from statictext within w_oicustdo_r
integer x = 2304
integer y = 56
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

type dw_cust from datawindow within w_oicustdo_r
integer x = 2542
integer y = 56
integer width = 613
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type cbx_hap from checkbox within w_oicustdo_r
integer x = 3209
integer y = 304
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

event clicked;// 합계만 보기
DataWindow arg_dw

if rb_1.checked = true then	// 거래처별 현장별
	arg_dw = dw_1
elseif rb_2.checked = true then	// 거래명세표 발행번호
	arg_dw = dw_3
elseif rb_3.checked = true then	// 보고용 엑셀
	arg_dw = dw_4
elseif rb_4.checked = true OR rb_6.checked = true then	// 분석, 기타분석
	arg_dw = dw_5
else									// 거래처 현장목록 
	arg_dw = dw_7
end if
	
cbx_haphd.checked = false
arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			// Detail
	arg_dw.Modify("DataWindow.Trailer.2.Height=72")	// 소계 숨김
	arg_dw.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
else
	arg_dw.Modify("DataWindow.Detail.Height=76")		// Detail
	arg_dw.Modify("DataWindow.Trailer.2.Height=72")	// 소계 숨김
	arg_dw.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
arg_dw.setredraw( true )

end event

type cbx_haphd from checkbox within w_oicustdo_r
integer x = 3209
integer y = 368
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
string text = "합계숨김"
end type

event clicked;// 합계숨김
DataWindow arg_dw

if rb_1.checked = true then	// 거래처별 현장별
	arg_dw = dw_1
elseif rb_2.checked = true then	// 거래명세표 발행번호
	arg_dw = dw_3
elseif rb_3.checked = true then	// 보고용 엑셀
	arg_dw = dw_4
elseif rb_4.checked = true OR rb_6.checked = true then	// 분석, 기타분석
	arg_dw = dw_5
else									// 거래처 현장목록 
	arg_dw = dw_7
end if
	
cbx_hap.checked = false
arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=76")		// Detail
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")	   // 소계 숨김
	arg_dw.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
else
	arg_dw.Modify("DataWindow.Detail.Height=76")		// Detail
	arg_dw.Modify("DataWindow.Trailer.2.Height=72")	// 소계 숨김
	arg_dw.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
arg_dw.setredraw( true )

end event

type cbx_import from checkbox within w_oicustdo_r
integer x = 1760
integer y = 256
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

type cb_6 from commandbutton within w_oicustdo_r
integer x = 2619
integer y = 364
integer width = 553
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신조회"
end type

event clicked;//
DataWindow arg_dw
gs_where lstr_where
long  ll_row

if dw_1.visible = true then 
	arg_dw = dw_1
elseif dw_3.visible = true then 
	arg_dw = dw_3
elseif dw_4.visible = true then 
	arg_dw = dw_4
elseif dw_5.visible = true then 
	arg_dw = dw_5
elseif dw_7.visible = true then 
	arg_dw = dw_7
end if

ll_row  = arg_dw.getrow()
lstr_where.str1 = arg_dw.object.cust_no[ll_row]
lstr_where.name = arg_dw.object.cust_name[ll_row]
OpenWithParm( w_whopeom_w, lstr_where )

end event

type st_7 from statictext within w_oicustdo_r
integer x = 1481
integer y = 140
integer width = 233
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_oicustdo_r
integer x = 1719
integer y = 136
integer width = 329
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
string ls_userid
long   ll_row, ll_seq

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

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
idwc_cust.reset()

if GF_Permission("거래처별_물품_출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "(1.전체거래처)")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "(1.담당전체)")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type cbx_team from checkbox within w_oicustdo_r
integer x = 2057
integer y = 152
integer width = 160
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀"
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if ls_userid = "%" then
	// 전체
else
	if cbx_team.checked = true then
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	else
		idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	end if
end if

end event

type ddlb_op from dropdownlistbox within w_oicustdo_r
integer x = 910
integer y = 320
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

type gb_5 from groupbox within w_oicustdo_r
integer x = 2281
integer y = 16
integer width = 901
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

