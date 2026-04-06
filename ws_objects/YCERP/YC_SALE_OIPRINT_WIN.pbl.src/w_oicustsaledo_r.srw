$PBExportHeader$w_oicustsaledo_r.srw
$PBExportComments$거래처별 수주출고현황
forward
global type w_oicustsaledo_r from w_inheritance
end type
type pb_1 from picturebutton within w_oicustsaledo_r
end type
type em_1 from editmask within w_oicustsaledo_r
end type
type em_2 from editmask within w_oicustsaledo_r
end type
type st_2 from statictext within w_oicustsaledo_r
end type
type st_3 from statictext within w_oicustsaledo_r
end type
type ddlb_fld from dropdownlistbox within w_oicustsaledo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustsaledo_r
end type
type st_4 from statictext within w_oicustsaledo_r
end type
type sle_value from singlelineedit within w_oicustsaledo_r
end type
type cb_1 from commandbutton within w_oicustsaledo_r
end type
type cb_2 from commandbutton within w_oicustsaledo_r
end type
type cb_3 from commandbutton within w_oicustsaledo_r
end type
type cb_5 from commandbutton within w_oicustsaledo_r
end type
type dw_5 from datawindow within w_oicustsaledo_r
end type
type st_5 from statictext within w_oicustsaledo_r
end type
type st_8 from statictext within w_oicustsaledo_r
end type
type dw_6 from datawindow within w_oicustsaledo_r
end type
type cb_4 from commandbutton within w_oicustsaledo_r
end type
type cb_6 from commandbutton within w_oicustsaledo_r
end type
type cbx_1 from checkbox within w_oicustsaledo_r
end type
type cbx_import from checkbox within w_oicustsaledo_r
end type
type dw_filter from datawindow within w_oicustsaledo_r
end type
type cb_popup from commandbutton within w_oicustsaledo_r
end type
type ddlb_op from dropdownlistbox within w_oicustsaledo_r
end type
end forward

global type w_oicustsaledo_r from w_inheritance
integer y = 112
integer width = 4466
integer height = 2556
string title = "거래처별 수주출고 현황(w_oicustsaledo_r)"
pb_1 pb_1
em_1 em_1
em_2 em_2
st_2 st_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_5 dw_5
st_5 st_5
st_8 st_8
dw_6 dw_6
cb_4 cb_4
cb_6 cb_6
cbx_1 cbx_1
cbx_import cbx_import
dw_filter dw_filter
cb_popup cb_popup
ddlb_op ddlb_op
end type
global w_oicustsaledo_r w_oicustsaledo_r

type variables
string is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret
string is_dw

datawindowchild idwc_area, idwc_cust, idwc_user

gs_custdo_str ist_code

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

on w_oicustsaledo_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_5=create dw_5
this.st_5=create st_5
this.st_8=create st_8
this.dw_6=create dw_6
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.cbx_import=create cbx_import
this.dw_filter=create dw_filter
this.cb_popup=create cb_popup
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.dw_5
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.st_8
this.Control[iCurrent+17]=this.dw_6
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.cb_6
this.Control[iCurrent+20]=this.cbx_1
this.Control[iCurrent+21]=this.cbx_import
this.Control[iCurrent+22]=this.dw_filter
this.Control[iCurrent+23]=this.cb_popup
this.Control[iCurrent+24]=this.ddlb_op
end on

on w_oicustsaledo_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_5)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.dw_6)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.cbx_import)
destroy(this.dw_filter)
destroy(this.cb_popup)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_chk

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_filter.visible = false	// DW Filter용
dw_2.visible = false

is_custdosql  = dw_1.describe("datawindow.table.select")
is_custdorsql = dw_2.describe("datawindow.table.select")

// 전체거래처
dw_5.settransobject(sqlca)
dw_5.insertrow(0)  

idwc_cust.setredraw(false)
dw_5.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")

dw_5.object.cust_no[1] = "%"

// 담당자
dw_6.settransobject(sqlca)
dw_6.insertrow(1)

choose case gs_level
	case 'A', 'B'
		ls_chk = 'Y'
	case 'C'
		ls_chk = 'N'
end choose

if ls_chk = 'Y' Then
	is_ret = '%'
	dw_6.getchild('user', idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_6.object.user[1] = '%'
else
	dw_6.object.user[1] = gs_userid
	is_ret = gs_userid
end if

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday, ls_sdate, ls_today, ls_edate		// 전월말일, 시작일, 현재일, 마지막일

SELECT top 1 convert(char(10), dateadd(day, - datepart(dd, getdate()), getdate() ), 111)
     , convert(char(10), dateadd(dd, -1 * day(getdate())+1, getdate()),111)
     , convert(char(10), getdate(), 111)
     , convert(char(10), dateadd(mm, 1, getdate()) - day(getdate()) ,111)
  INTO :ls_lastday, :ls_sdate, :ls_today, :ls_edate
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = ls_sdate		// 시작일
	em_2.text = ls_edate  	// 마지막일
else
	em_1.text = LeftA(ls_lastday,8) + "01"	// 시작일
	em_2.text = ls_lastday	// 전월말일
end if


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_oicustsaledo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oicustsaledo_r
integer x = 27
integer y = 456
integer width = 4366
integer height = 1968
integer taborder = 0
string dataobject = "d_custsaledo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

//This.SelectRow(0,  false)
//This.SelectRow(row, TRUE)

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oicustsaledo_r
integer x = 32
integer y = 20
integer width = 1376
integer height = 136
string text = "거래처별 수주출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_oicustsaledo_r
end type

type pb_compute from w_inheritance`pb_compute within w_oicustsaledo_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oicustsaledo_r
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

type pb_close from w_inheritance`pb_close within w_oicustsaledo_r
integer x = 3799
integer y = 76
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustsaledo_r
integer x = 3593
integer y = 76
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
long ll_count
w_repsuper w_print
st_print   l_print
datawindow dw_prt

// 프린트 담당자계 높이 = 0 만들기
dw_prt = dw_2

l_print.st_datawindow  = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처별 이월내역을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oicustsaledo_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oicustsaledo_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oicustsaledo_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oicustsaledo_r
integer x = 3209
integer y = 76
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_salesman, ls_area, ls_custno, ls_sdate, ls_edate
long   ll_row

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 거래처
dw_5.accepttext()
ls_custno    = dw_5.object.cust_no[1]
if isnull(ls_custno) or ls_custno = "" then ls_custno = "%"

// 담당자
dw_6.accepttext()
ls_salesman    = dw_6.object.user[1]
if isnull(ls_salesman) or ls_salesman = "" then ls_salesman = "%"

ls_sdate = em_1.text
ls_edate = em_2.text

choose case gs_level
	case 'A', 'B'
		is_ret = '%'

	case 'C'
		is_ret = gs_userid
end choose

if cbx_1.checked = true	then	// 수주전체 보기
	ll_row = dw_2.retrieve( ls_salesman, ls_custno, ls_sdate, ls_edate )
	dw_2.setfocus()
	dw_2.groupcalc()
else
	ll_row = dw_1.retrieve( ls_salesman, ls_custno, ls_sdate, ls_edate )
	dw_1.setfocus()
	dw_1.groupcalc()
end if

if ll_row < 1 then
	messagebox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oicustsaledo_r
integer x = 27
integer y = 260
integer width = 4366
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oicustsaledo_r
integer x = 1454
integer y = 16
integer width = 1696
integer height = 228
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oicustsaledo_r
integer x = 3173
integer y = 16
integer width = 850
integer height = 228
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oicustsaledo_r
integer x = 46
integer y = 180
integer width = 119
integer height = 80
integer taborder = 0
string dataobject = "d_custsaledo_all"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if row < 1 then return

//This.SelectRow(0,  false)
//This.SelectRow(row, TRUE)

is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type pb_1 from picturebutton within w_oicustsaledo_r
event mousemove pbm_mousemove
integer x = 3401
integer y = 76
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
integer ls_Value, li_Pos, li_value
long    ll_cnt
DataWindow dwxls

if cbx_1.checked = true then
	dwxls  = dw_2
else
	dwxls  = dw_1
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
	                           "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type em_1 from editmask within w_oicustsaledo_r
integer x = 2734
integer y = 60
integer width = 384
integer height = 80
integer taborder = 40
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
string displaydata = "~r"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_oicustsaledo_r
integer x = 2734
integer y = 144
integer width = 384
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
alignment alignment = center!
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

type st_2 from statictext within w_oicustsaledo_r
integer x = 2441
integer y = 60
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
string text = "수주일자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oicustsaledo_r
integer x = 78
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_oicustsaledo_r
integer x = 265
integer y = 320
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_oicustsaledo_r
integer x = 297
integer y = 332
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

type st_4 from statictext within w_oicustsaledo_r
integer x = 736
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

type sle_value from singlelineedit within w_oicustsaledo_r
integer x = 1225
integer y = 324
integer width = 567
integer height = 80
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

type cb_1 from commandbutton within w_oicustsaledo_r
integer x = 1925
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_2 from commandbutton within w_oicustsaledo_r
integer x = 2089
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

arg_dw.setsort( "cust_name A, scene_desc A, order_no A, seq_no A" )
arg_dw.sort()


end event

type cb_3 from commandbutton within w_oicustsaledo_r
integer x = 2254
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oicustsaledo_r
integer x = 2418
integer y = 328
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_oicustsaledo_r
integer x = 1769
integer y = 144
integer width = 869
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type st_5 from statictext within w_oicustsaledo_r
integer x = 1477
integer y = 148
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
string text = "거래처"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_oicustsaledo_r
integer x = 1477
integer y = 60
integer width = 288
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
string text = "담당자"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_oicustsaledo_r
integer x = 1769
integer y = 56
integer width = 672
integer height = 84
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type cb_4 from commandbutton within w_oicustsaledo_r
integer x = 2601
integer y = 364
integer width = 613
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 조회"
end type

event clicked;// 거래명세서 조회
string ls_dono
long   ll_row
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if


ll_row     = arg_dw.getrow()
if isnull(ll_row) or ll_row < 1 then RETURN

ls_dono = arg_dw.object.do_no[ll_row]
if ls_dono = "" or isnull(ls_dono) then RETURN

if IsValid(w_o_main) then 
	OpenSheet(w_oigiprint_m,  w_o_main, 6, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_oigiprint_m,  w_all_main, 6, original!)
end if

w_oigiprint_m.setredraw(false)
//w_oigiprint_m.pb_save.enabled = false
w_oigiprint_m.em_3.text = LeftA(ls_dono,10) + RightA(ls_dono,3) 			// 출고번호
w_oigiprint_m.pb_compute.postevent(clicked!)
w_oigiprint_m.setredraw(true)

end event

type cb_6 from commandbutton within w_oicustsaledo_r
integer x = 2601
integer y = 292
integer width = 613
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "판매수주관리"
end type

event clicked;string ls_orderno
long   ll_row
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if


ll_row     = arg_dw.getrow()
if isnull(ll_row) or ll_row < 1 then RETURN

ls_orderno = arg_dw.object.order_no[ll_row]
if ls_orderno = "" or isnull(ls_orderno) then return

if IsValid(w_o_main) then 
	OpenSheet(w_orsale_m,  w_o_main, 6, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_orsale_m,  w_all_main, 6, original!)
end if

w_orsale_m.setredraw(false)
//w_orsale_m.pb_save.enabled = false
w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)

end event

type cbx_1 from checkbox within w_oicustsaledo_r
integer x = 3246
integer y = 336
integer width = 901
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "수주전체 보기(마감포함)"
end type

event clicked;// 수주전체 보기
if this.checked = true then
	dw_2.visible = true
	dw_1.visible = false
else
	dw_2.visible = false
	dw_1.visible = true
end if

end event

type cbx_import from checkbox within w_oicustsaledo_r
integer x = 1829
integer y = 260
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

type dw_filter from datawindow within w_oicustsaledo_r
integer x = 1321
integer y = 900
integer width = 1563
integer height = 916
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
string ls_filter, ls_filter_name, ls_itemnm
long   ll_row, ll_tchk
Datawindow arg_dw

debugbreak()

if dw_1.visible = true then 
	ls_filter_name = "item_name"
	arg_dw = dw_1
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

type cb_popup from commandbutton within w_oicustsaledo_r
integer x = 1801
integer y = 328
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

event clicked;//
string ls_itemno, ls_itemnm
DataWindow arg_dw

debugbreak()

if dw_1.visible = true then 
	ls_itemno = "item_no"
	ls_itemnm = "item_name"
	arg_dw = dw_1
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

type ddlb_op from dropdownlistbox within w_oicustsaledo_r
integer x = 914
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

