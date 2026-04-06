$PBExportHeader$w_mpjaego_r2.srw
$PBExportComments$수주물픔에대한재고(1998/09/26,곽용덕)
forward
global type w_mpjaego_r2 from w_inheritance
end type
type cbx_1 from checkbox within w_mpjaego_r2
end type
type st_3 from statictext within w_mpjaego_r2
end type
type st_2 from statictext within w_mpjaego_r2
end type
type sle_2 from singlelineedit within w_mpjaego_r2
end type
type st_1 from statictext within w_mpjaego_r2
end type
type gb_15 from groupbox within w_mpjaego_r2
end type
type gb_4 from groupbox within w_mpjaego_r2
end type
type dw_locno from datawindow within w_mpjaego_r2
end type
type dw_4 from datawindow within w_mpjaego_r2
end type
type dw_6 from datawindow within w_mpjaego_r2
end type
type dw_7 from datawindow within w_mpjaego_r2
end type
type dw_8 from datawindow within w_mpjaego_r2
end type
type pb_1 from picturebutton within w_mpjaego_r2
end type
type dw_9 from datawindow within w_mpjaego_r2
end type
type dw_10 from datawindow within w_mpjaego_r2
end type
type cb_2 from commandbutton within w_mpjaego_r2
end type
type dw_11 from datawindow within w_mpjaego_r2
end type
type dw_12 from datawindow within w_mpjaego_r2
end type
type dw_13 from datawindow within w_mpjaego_r2
end type
type dw_confirm from datawindow within w_mpjaego_r2
end type
type dw_rlseyn from datawindow within w_mpjaego_r2
end type
type cb_3 from commandbutton within w_mpjaego_r2
end type
type dw_17 from datawindow within w_mpjaego_r2
end type
type gb_5 from groupbox within w_mpjaego_r2
end type
type gb_6 from groupbox within w_mpjaego_r2
end type
type gb_7 from groupbox within w_mpjaego_r2
end type
type gb_8 from groupbox within w_mpjaego_r2
end type
type gb_9 from groupbox within w_mpjaego_r2
end type
type gb_10 from groupbox within w_mpjaego_r2
end type
type gb_11 from groupbox within w_mpjaego_r2
end type
type gb_12 from groupbox within w_mpjaego_r2
end type
type gb_13 from groupbox within w_mpjaego_r2
end type
type dw_16 from datawindow within w_mpjaego_r2
end type
type dw_3 from datawindow within w_mpjaego_r2
end type
type cb_4 from commandbutton within w_mpjaego_r2
end type
type cbx_chk from checkbox within w_mpjaego_r2
end type
type st_13 from statictext within w_mpjaego_r2
end type
type st_14 from statictext within w_mpjaego_r2
end type
type ddlb_op from dropdownlistbox within w_mpjaego_r2
end type
type sle_value from singlelineedit within w_mpjaego_r2
end type
type cb_10 from commandbutton within w_mpjaego_r2
end type
type cb_14 from commandbutton within w_mpjaego_r2
end type
type cb_15 from commandbutton within w_mpjaego_r2
end type
type cb_16 from commandbutton within w_mpjaego_r2
end type
type rb_1 from radiobutton within w_mpjaego_r2
end type
type rb_2 from radiobutton within w_mpjaego_r2
end type
type rb_3 from radiobutton within w_mpjaego_r2
end type
type gb_14 from groupbox within w_mpjaego_r2
end type
type ddlb_fld from dropdownlistbox within w_mpjaego_r2
end type
type ddlb_dwtitles from dropdownlistbox within w_mpjaego_r2
end type
type cb_5 from commandbutton within w_mpjaego_r2
end type
type dw_filter from datawindow within w_mpjaego_r2
end type
type cbx_import from checkbox within w_mpjaego_r2
end type
type dw_18 from datawindow within w_mpjaego_r2
end type
type cb_6 from commandbutton within w_mpjaego_r2
end type
type cbx_new from checkbox within w_mpjaego_r2
end type
type dw_5 from datawindow within w_mpjaego_r2
end type
type cbx_2 from checkbox within w_mpjaego_r2
end type
type cb_1 from commandbutton within w_mpjaego_r2
end type
end forward

global type w_mpjaego_r2 from w_inheritance
integer width = 5417
integer height = 2780
string title = "수주물품별 재고현황(NEW)(w_mpjaego_r2)"
cbx_1 cbx_1
st_3 st_3
st_2 st_2
sle_2 sle_2
st_1 st_1
gb_15 gb_15
gb_4 gb_4
dw_locno dw_locno
dw_4 dw_4
dw_6 dw_6
dw_7 dw_7
dw_8 dw_8
pb_1 pb_1
dw_9 dw_9
dw_10 dw_10
cb_2 cb_2
dw_11 dw_11
dw_12 dw_12
dw_13 dw_13
dw_confirm dw_confirm
dw_rlseyn dw_rlseyn
cb_3 cb_3
dw_17 dw_17
gb_5 gb_5
gb_6 gb_6
gb_7 gb_7
gb_8 gb_8
gb_9 gb_9
gb_10 gb_10
gb_11 gb_11
gb_12 gb_12
gb_13 gb_13
dw_16 dw_16
dw_3 dw_3
cb_4 cb_4
cbx_chk cbx_chk
st_13 st_13
st_14 st_14
ddlb_op ddlb_op
sle_value sle_value
cb_10 cb_10
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_14 gb_14
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
cb_5 cb_5
dw_filter dw_filter
cbx_import cbx_import
dw_18 dw_18
cb_6 cb_6
cbx_new cbx_new
dw_5 dw_5
cbx_2 cbx_2
cb_1 cb_1
end type
global w_mpjaego_r2 w_mpjaego_r2

type variables
st_print      i_print
gs_codere_str ist_code
gs_itembaldo_str  ist_itemcode

string is_dw, is_select,is_where,is_clause, is_dw5sql, is_column, is_sort
long   il_selectrow, il_height

end variables

forward prototypes
public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value)
end prototypes

public subroutine wf_dwfilter (datawindow arg_dw, string arg_col, string arg_column, string arg_value);//
string ls_itemno, ls_itemno_save, ls_itemnm, ls_itemnm_save
string ls_filter, ls_value, ls_val[], ls_valtemp, ls_itemtemp
long   ll_row, ll_dwcnt, ll_cnt, ll_i, ll_len

if dw_3.rowcount() < 1 then RETURN

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
	dw_3.setredraw( false )
	
	dw_filter.setfilter("") ; dw_filter.filter()
	dw_filter.reset()
	
	// 값
	if ll_cnt = 0 then
		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = "(ALL)"
		dw_filter.object.item_name[ll_dwcnt] = "(모두 선택)"
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		//	
		ls_itemno_save = dw_3.GetItemString( 1, arg_col )
		ls_itemnm_save = dw_3.GetItemString( 1, arg_column )

		ll_dwcnt  = dw_filter.insertrow( 0 )
		dw_filter.object.item_no[ll_dwcnt]   = ls_itemno_save
		dw_filter.object.item_name[ll_dwcnt] = ls_itemnm_save
		dw_filter.object.chk[ll_dwcnt]       = "Y"
		
		for ll_row = 1 to dw_3.rowcount()
			ls_itemno  = dw_3.GetItemString( ll_row, arg_col )
			ls_itemnm  = dw_3.GetItemString( ll_row, arg_column )
			
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
		ls_itemno_save = dw_3.GetItemString( 1, arg_col )
		ls_itemnm_save = dw_3.GetItemString( 1, arg_column )
		
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
		for ll_row = 1 to dw_3.rowcount()
			ls_itemno  = dw_3.GetItemString( ll_row, arg_col )
			ls_itemnm  = dw_3.GetItemString( ll_row, arg_column )
			
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
	dw_3.setredraw( true )
	
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

on w_mpjaego_r2.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.st_3=create st_3
this.st_2=create st_2
this.sle_2=create sle_2
this.st_1=create st_1
this.gb_15=create gb_15
this.gb_4=create gb_4
this.dw_locno=create dw_locno
this.dw_4=create dw_4
this.dw_6=create dw_6
this.dw_7=create dw_7
this.dw_8=create dw_8
this.pb_1=create pb_1
this.dw_9=create dw_9
this.dw_10=create dw_10
this.cb_2=create cb_2
this.dw_11=create dw_11
this.dw_12=create dw_12
this.dw_13=create dw_13
this.dw_confirm=create dw_confirm
this.dw_rlseyn=create dw_rlseyn
this.cb_3=create cb_3
this.dw_17=create dw_17
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_7=create gb_7
this.gb_8=create gb_8
this.gb_9=create gb_9
this.gb_10=create gb_10
this.gb_11=create gb_11
this.gb_12=create gb_12
this.gb_13=create gb_13
this.dw_16=create dw_16
this.dw_3=create dw_3
this.cb_4=create cb_4
this.cbx_chk=create cbx_chk
this.st_13=create st_13
this.st_14=create st_14
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_10=create cb_10
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_14=create gb_14
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.cb_5=create cb_5
this.dw_filter=create dw_filter
this.cbx_import=create cbx_import
this.dw_18=create dw_18
this.cb_6=create cb_6
this.cbx_new=create cbx_new
this.dw_5=create dw_5
this.cbx_2=create cbx_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.gb_15
this.Control[iCurrent+7]=this.gb_4
this.Control[iCurrent+8]=this.dw_locno
this.Control[iCurrent+9]=this.dw_4
this.Control[iCurrent+10]=this.dw_6
this.Control[iCurrent+11]=this.dw_7
this.Control[iCurrent+12]=this.dw_8
this.Control[iCurrent+13]=this.pb_1
this.Control[iCurrent+14]=this.dw_9
this.Control[iCurrent+15]=this.dw_10
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.dw_11
this.Control[iCurrent+18]=this.dw_12
this.Control[iCurrent+19]=this.dw_13
this.Control[iCurrent+20]=this.dw_confirm
this.Control[iCurrent+21]=this.dw_rlseyn
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.dw_17
this.Control[iCurrent+24]=this.gb_5
this.Control[iCurrent+25]=this.gb_6
this.Control[iCurrent+26]=this.gb_7
this.Control[iCurrent+27]=this.gb_8
this.Control[iCurrent+28]=this.gb_9
this.Control[iCurrent+29]=this.gb_10
this.Control[iCurrent+30]=this.gb_11
this.Control[iCurrent+31]=this.gb_12
this.Control[iCurrent+32]=this.gb_13
this.Control[iCurrent+33]=this.dw_16
this.Control[iCurrent+34]=this.dw_3
this.Control[iCurrent+35]=this.cb_4
this.Control[iCurrent+36]=this.cbx_chk
this.Control[iCurrent+37]=this.st_13
this.Control[iCurrent+38]=this.st_14
this.Control[iCurrent+39]=this.ddlb_op
this.Control[iCurrent+40]=this.sle_value
this.Control[iCurrent+41]=this.cb_10
this.Control[iCurrent+42]=this.cb_14
this.Control[iCurrent+43]=this.cb_15
this.Control[iCurrent+44]=this.cb_16
this.Control[iCurrent+45]=this.rb_1
this.Control[iCurrent+46]=this.rb_2
this.Control[iCurrent+47]=this.rb_3
this.Control[iCurrent+48]=this.gb_14
this.Control[iCurrent+49]=this.ddlb_fld
this.Control[iCurrent+50]=this.ddlb_dwtitles
this.Control[iCurrent+51]=this.cb_5
this.Control[iCurrent+52]=this.dw_filter
this.Control[iCurrent+53]=this.cbx_import
this.Control[iCurrent+54]=this.dw_18
this.Control[iCurrent+55]=this.cb_6
this.Control[iCurrent+56]=this.cbx_new
this.Control[iCurrent+57]=this.dw_5
this.Control[iCurrent+58]=this.cbx_2
this.Control[iCurrent+59]=this.cb_1
end on

on w_mpjaego_r2.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.st_1)
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.dw_locno)
destroy(this.dw_4)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.pb_1)
destroy(this.dw_9)
destroy(this.dw_10)
destroy(this.cb_2)
destroy(this.dw_11)
destroy(this.dw_12)
destroy(this.dw_13)
destroy(this.dw_confirm)
destroy(this.dw_rlseyn)
destroy(this.cb_3)
destroy(this.dw_17)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_7)
destroy(this.gb_8)
destroy(this.gb_9)
destroy(this.gb_10)
destroy(this.gb_11)
destroy(this.gb_12)
destroy(this.gb_13)
destroy(this.dw_16)
destroy(this.dw_3)
destroy(this.cb_4)
destroy(this.cbx_chk)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_10)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_14)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.cb_5)
destroy(this.dw_filter)
destroy(this.cbx_import)
destroy(this.dw_18)
destroy(this.cb_6)
destroy(this.cbx_new)
destroy(this.dw_5)
destroy(this.cbx_2)
destroy(this.cb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

cbx_2.visible = false		// check

gb_6.visible = false
dw_6.visible = false
dw_5.visible = false

rb_1.enabled = false
rb_2.enabled = false
rb_3.enabled = false

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
dw_locno.SetTransObject(sqlca)
dw_confirm.SetTransObject(SQLCA)
dw_rlseyn.SetTransObject(SQLCA)

dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(sqlca)
dw_7.SetTransObject(sqlca)
dw_9.SetTransObject(SQLCA)
dw_11.SetTransObject(SQLCA)
dw_12.SetTransObject(SQLCA)
dw_13.SetTransObject(SQLCA)
dw_17.SetTransObject(SQLCA)
dw_18.SetTransObject(SQLCA)

dw_locno.insertrow(0)
dw_confirm.insertrow(0)
dw_rlseyn.insertrow(0)

dw_4.insertrow(0)
dw_6.insertrow(0)
dw_9.insertrow(0)
dw_11.insertrow(0)
dw_12.insertrow(0)
dw_13.insertrow(0)
dw_17.insertrow(0)

dw_7.Visible  = false
dw_8.Visible  = false
dw_10.Visible = false
dw_16.Visible = false
dw_18.Visible = false
dw_filter.visible = false	// DW Filter용

is_sort       = ""
cb_2.enabled  = false	// 수주상황부출력
cb_4.enabled  = false	// 발주등록 관리
cb_1.enabled  = false	// 발주등록 관리(new)

dw_4.Object.sujuyy[1]  = string(RelativeDate(today(), - 2),"yyyy/mm/dd")
dw_4.Object.sujuyy2[1] = string(today(),"yyyy/mm/dd")

dw_9.Object.suju[1]    = "HD" + string(today(), "yyyy") + "       "

dw_17.Object.en_date1[1] = today()
dw_17.Object.en_date2[1] = RelativeDate(today(), 7)

//
datawindowchild ldwc_loc3

dw_locno.getchild('loc_no',ldwc_loc3)
//ldwc_loc3.insertrow(1)
//ldwc_loc3.setitem(1, "loc_no", "WS00000000")
//ldwc_loc3.setitem(1, "loc_name", "전체")
dw_locno.Object.loc_no[1] = 'WS00000000'

is_dw5sql  =  dw_10.GetSQLSelect()
//dw_6.setitem(1,'user_id',gs_userid)

end event

event resize;call super::resize;//
gb_14.width = newwidth  - (gb_14.x * 2)

dw_3.width  = newwidth  - (gb_14.x * 2)
dw_3.height = newheight - dw_3.y - gb_14.x

il_height   = dw_3.height

dw_7.x   = (newwidth - dw_7.width)  / 2		// 재고관련메모
dw_16.x  = (newwidth - dw_16.width) / 2		// 입고예정정보

dw_18.x      = dw_16.x
dw_18.y      = dw_16.y
dw_18.width  = dw_16.width
dw_18.height = dw_16.height

dw_5.x = dw_3.x ; dw_5.y = dw_3.y ; dw_5.width = dw_3.width ; dw_5.height = dw_3.height

end event

event activate;call super::activate;// 선택한 행으로 이동하기

if dw_3.rowcount() < 1 or il_selectrow > dw_3.rowcount() then RETURN

dw_3.scrolltorow( il_selectrow )


end event

type pb_save from w_inheritance`pb_save within w_mpjaego_r2
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_mpjaego_r2
boolean visible = false
integer x = 3826
integer y = 80
integer width = 192
integer height = 116
integer taborder = 290
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpjaego_r2
boolean visible = false
integer x = 1906
integer y = 40
integer width = 178
integer height = 156
integer taborder = 320
boolean bringtotop = true
string dataobject = "d_ipnotrcpt_r"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_mpjaego_r2
integer x = 37
integer y = 24
integer width = 1559
long backcolor = 8421376
string text = "수주물품별 재고현황(NEW)"
end type

type st_tips from w_inheritance`st_tips within w_mpjaego_r2
end type

type pb_compute from w_inheritance`pb_compute within w_mpjaego_r2
boolean visible = false
integer taborder = 400
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpjaego_r2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpjaego_r2
integer x = 4814
integer y = 48
integer taborder = 340
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpjaego_r2
integer x = 4416
integer y = 48
integer taborder = 300
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow  = dw_8
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 수주물품별 재고현황을 출력합니다."

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpjaego_r2
boolean visible = false
integer taborder = 420
end type

type pb_delete from w_inheritance`pb_delete within w_mpjaego_r2
boolean visible = false
integer taborder = 440
end type

type pb_insert from w_inheritance`pb_insert within w_mpjaego_r2
boolean visible = false
integer taborder = 450
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpjaego_r2
integer x = 4219
integer y = 48
integer taborder = 120
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date1, ls_date2, ls_user, ls_sql3, ls_where
string ls_locno, ls_orderno, ls_item1, ls_item2, ls_custno, ls_scene, ls_confirm, ls_conf[], ls_rlseyn
date   ld_sdate, ld_edate
int    iday

//
dw_8.dataobject = "d_mpjaego_p1"
dw_8.SetTransObject(SQLCA)

rb_1.enabled = true		// 소계숨김
rb_2.enabled = true		// 소계보기
rb_3.enabled = true		// 전체보기

// 저장소
dw_locno.accepttext()
ls_locno     = dw_locno.Object.loc_no[1]

// 물품담당자
dw_6.AcceptText()
ls_user     = dw_6.Object.user_id[1]		
if IsNull(ls_user) OR ls_user = "" then ls_user = "%"

// 수주일자
dw_4.AcceptText()
ls_date1    = dw_4.Object.sujuyy1[1]		// 수주일자 1
ls_date2    = dw_4.Object.sujuyy2[1]      // 수주일자 2
ld_sdate    = date(ls_date1)
ld_edate    = date(ls_date2)
//
SELECT top 1 datediff(day, :ld_sdate, :ld_edate) INTO :iday FROM login;
if iday > 30 then
	if Messagebox("확인",string(iday) + " 일 이상의 수주기간 조회는 많은시간이 소요됩니다.~r~r" + &
	              "계속 하시겠습니까?",Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

if ls_date1 = "" OR IsNull(ls_date1) then	ls_date1 = string(today(),'yyyymmdd')
if ls_date2 = "" OR IsNull(ls_date2) then	ls_date2 = string(today(),'yyyymmdd')
if Long(ls_date1) > Long(ls_date2) then
	Messagebox('확인','조회 기간의 정보가 바르지 않습니다. 확인바랍니다.')
	RETURN
end if

// 수주번호
dw_9.accepttext()
ls_orderno  = trim(MidA(dw_9.Object.suju[1],1,10) +'-'+MidA(dw_9.Object.suju[1],11,3))
if LenA(ls_orderno) <> 14 then ls_orderno = "%"

// 품명
dw_11.AcceptText()
ls_item1  = dw_11.Object.item_no[1]		// 품명 1
ls_item2  = dw_11.Object.item_no2[1]    // 품명 2
if isnull(ls_item1) OR ls_item1 = "" then ls_item1 = "%"
if isnull(ls_item2) OR ls_item2 = "" then ls_item2 = "%"

// 거래처
dw_12.AcceptText()
ls_custno   = dw_12.Object.cust_no[1]		
if ls_custno = "" OR IsNull(ls_custno) then ls_custno = "%"

// 현장
dw_13.AcceptText()
ls_scene    = dw_13.Object.scene_desc[1]	
if ls_scene = "" OR IsNull(ls_scene)  then ls_scene  = "%"

// 출고여부
dw_rlseyn.AcceptText()
ls_rlseyn	= dw_rlseyn.Object.rlse_yn[1]		   

// 확정유무
dw_confirm.AcceptText()
ls_confirm  = dw_confirm.Object.confirm_yn[1]	

choose case ls_confirm
	case "%" 	// 전체
		ls_conf[1] = "N"
		ls_conf[2] = "T"
		ls_conf[3] = "Y"
	case "Y"		// 확정
		ls_conf[1] = "T"
		ls_conf[2] = "Y"
	case "N"		// 미확정
		ls_conf[1] = "N"
end choose

//
dw_3.SetTransObject(SQLCA)
if dw_3.rowcount() > 0 then
	if MessageBox("확인","해당하는 조건의 데이터를 다시 조회합니까?",Exclamation!, OKCancel!, 2) = 2 then
		//
	else
		dw_3.setredraw( false )
		dw_3.dataobject = "d_mpjaego_r2"
		dw_3.SetTransObject(SQLCA)
		ls_sql3  = dw_3.GetSQLSelect()

		dw_3.retrieve( ls_locno, ls_custno, ls_scene, ls_orderno, ls_item1, ls_item2, ld_sdate, ld_edate, ls_conf, ls_rlseyn )
		dw_3.GroupCalc()	
		dw_3.ShareData( dw_8 )	
		dw_3.setredraw( true )
	end if
else
	dw_3.setredraw( false )
	dw_3.retrieve( ls_locno, ls_custno, ls_scene, ls_orderno, ls_item1, ls_item2, ld_sdate, ld_edate, ls_conf, ls_rlseyn )
	dw_3.GroupCalc()	
	dw_3.ShareData( dw_8 )	
	dw_3.setredraw( true )
end if
if dw_3.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
else
	cb_2.enabled  = true	// 수주상황부출력
end if

// 소계숨김
rb_1.checked = true

dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
dw_3.setfocus()

if cbx_new.checked = true then
	dw_5.setredraw( false )
	dw_5.retrieve( ls_locno, ls_custno, ls_scene, ls_orderno, ls_item1, ls_item2, ld_sdate, ld_edate, ls_conf, ls_rlseyn )
	dw_5.GroupCalc()	

	dw_5.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_5.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
	dw_5.setredraw( true )
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpjaego_r2
boolean visible = false
integer x = 2624
integer y = 20
integer width = 82
integer height = 84
integer taborder = 390
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_mpjaego_r2
boolean visible = false
integer x = 4443
integer y = 16
integer width = 142
integer height = 60
integer taborder = 150
end type

type gb_1 from w_inheritance`gb_1 within w_mpjaego_r2
integer x = 2331
integer y = 8
integer width = 2693
integer taborder = 180
integer textsize = -10
integer weight = 400
end type

type cbx_1 from checkbox within w_mpjaego_r2
boolean visible = false
integer x = 4000
integer y = 244
integer width = 608
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "중간공정만 조회"
end type

event clicked;if this.checked then
	dw_1.dataobject = 'd_mpjaego_r1'
	dw_1.SetTransObject(SQLCA)
else
	dw_1.dataobject = 'd_mpjaego_r'
	dw_1.SetTransObject(SQLCA)
end if

end event

type st_3 from statictext within w_mpjaego_r2
boolean visible = false
integer x = 1408
integer y = 284
integer width = 297
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
string text = "제품명"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mpjaego_r2
boolean visible = false
integer x = 2510
integer y = 284
integer width = 297
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
string text = "제품코드"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_mpjaego_r2
boolean visible = false
integer x = 2866
integer y = 264
integer width = 608
integer height = 92
integer taborder = 380
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_data

ls_data = trim(this.text)

if isnull(ls_data) or ls_data = '' then
	dw_1.setfilter("")
	dw_1.filter()
else
	ls_data = ls_data + "%"
	dw_1.setfilter("saledet_item_no like '" + ls_data + "'")
	dw_1.filter()
end if

end event

type st_1 from statictext within w_mpjaego_r2
boolean visible = false
integer x = 1211
integer y = 284
integer width = 274
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
boolean enabled = false
string text = "검색 :"
boolean focusrectangle = false
end type

type gb_15 from groupbox within w_mpjaego_r2
integer x = 1650
integer y = 8
integer width = 658
integer height = 204
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "저장소"
end type

type gb_4 from groupbox within w_mpjaego_r2
boolean visible = false
integer x = 1143
integer y = 220
integer width = 2418
integer height = 156
integer taborder = 270
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_locno from datawindow within w_mpjaego_r2
integer x = 1664
integer y = 80
integer width = 631
integer height = 92
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_mpjaego_s2"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_mpjaego_r2
integer x = 69
integer y = 272
integer width = 777
integer height = 100
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;////
//gs_calendar lstr_calendar
//
//lstr_calendar.sdate = dw_4.object.sujuyy[1]
//lstr_calendar.edate = dw_4.object.sujuyy2[1]
//OpenWithParm(w_calendar2, lstr_calendar)
//lstr_calendar = Message.PowerObjectParm
//
//if lstr_calendar.chk <> 'N' then
//	dw_4.object.sujuyy[1]  = lstr_calendar.sdate
//	dw_4.object.sujuyy2[1] = lstr_calendar.edate
//end if
//this.accepttext()



end event

type dw_6 from datawindow within w_mpjaego_r2
integer x = 3438
integer y = 268
integer width = 434
integer height = 100
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_mpjaego_h1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
dw_6.AcceptText()

string ls_user

ls_user = dw_6.Object.user_id[1]
if ls_user = "" then
	cbx_chk.visible   = true
else	
	cbx_chk.visible   = false
	dw_11.Object.item_no[1]  = ""
	dw_11.Object.item_no2[1] = ""
END IF

end event

type dw_7 from datawindow within w_mpjaego_r2
integer x = 1582
integer y = 960
integer width = 1737
integer height = 1336
integer taborder = 370
boolean bringtotop = true
boolean titlebar = true
string title = "입고관련메모"
string dataobject = "d_mpjaego_s3"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event buttonclicked;//
Date   ld_date
String ls_date, ls_lendate2, ls_lendate

choose case dwo.name
	case "b_save"
		if MessageBox("확인","입고관련메모를 저장하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			dw_7.accepttext()

			ls_lendate  = dw_7.object.len_date[1]
			ls_lendate2 = string(year(today())) + '/' + MidA(ls_lendate,1,2) +'/' + MidA(ls_lendate,3,2)
			ld_date     = date(ls_lendate2)
			dw_7.object.en_date[1] = datetime(ld_date)						
			
			if dw_7.Update() = 1 then
				COMMIT Using Sqlca;
				Messagebox("확인","입고관련메모를 저장하였습니다.")
				dw_7.visible = False
			else
				ROLLBACK Using sqlca;
				Messagebox("확인","저장실패 하였습니다.")
				Return
			end if
		else
			Return
		end if
		
	case "b_delete"
		if MessageBox("확인","입고관련메모를 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			if dw_7.deleterow(0) = 1 then
				dw_7.Update()
				COMMIT Using Sqlca;
				Messagebox("확인","입고관련메모를 삭제하였습니다.")
				dw_7.visible = FALSE
			else
				ROLLBACK Using sqlca;
				Messagebox("확인","삭제실패 하였습니다.")
				Return
			end if	
		else
			Return
			dw_7.Visible = FALSE
		end if
		
	case "b_exit"
		dw_7.reset()
		dw_7.visible = FALSE
end choose

end event

event retrieveend;String ls_endate

IF rowcount() > 0  THEN
	ls_endate  =  String(dw_7.Object.en_date[1],'YYYYMMDD')
	dw_7.Object.len_date[1]  =  MidA(ls_endate,5,2) + MidA(ls_endate,7,2)
END IF

end event

type dw_8 from datawindow within w_mpjaego_r2
integer x = 343
integer y = 172
integer width = 78
integer height = 68
integer taborder = 350
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_p1"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_mpjaego_r2
event mousemove pbm_mousemove
integer x = 4613
integer y = 48
integer width = 187
integer height = 144
integer taborder = 330
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
DataWindow dw_xls

choose case is_dw
	case "dw_3"
		dw_xls  = dw_3
		
	case "dw_16"
		dw_xls  = dw_16
end choose

if dw_xls.rowcount() < 1 then RETURN

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_xls.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dw_xls.SaveAs(ls_DocName, CSV!, TRUE)
	end if
	
	MessageBox("확인","작업완료")
end if


end event

type dw_9 from datawindow within w_mpjaego_r2
integer x = 914
integer y = 272
integer width = 846
integer height = 100
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
this.selecttext( 7, 8 )

//
pb_retrieve.default = true

end event

type dw_10 from datawindow within w_mpjaego_r2
integer x = 439
integer y = 172
integer width = 78
integer height = 68
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_mpjaego_print2"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_mpjaego_r2
integer x = 3579
integer y = 48
integer width = 553
integer height = 148
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부출력"
end type

event clicked;w_repsuper w_print
st_print   l_print
string ls_where, ls_sql
long   ll_row

dw_3.AcceptText() 
ll_row = dw_3.GetRow()
	
if dw_3.getrow() > 0 then
	ist_itemcode.start_no   = dw_3.object.order_no[ll_row]
	ist_itemcode.end_no     = dw_3.object.order_no[ll_row]
	ist_itemcode.start_date = string(dw_3.object.sale_order_date[ll_row],"yyyy/mm/dd")
	ist_itemcode.end_date   = string(dw_3.object.sale_order_date[ll_row],"yyyy/mm/dd")
end if

openwithparm(w_whsaledet_w, ist_itemcode)
ist_itemcode = message.powerobjectparm
if ist_itemcode.okcancel = 'N' then	return


dw_10.settransobject(sqlca)

if ist_itemcode.order_flag = 'O' then
	ls_where  =  " and sale.order_no     between '"+ ist_itemcode.start_no + "'" 
	ls_where +=  " and '" + ist_itemcode.end_no + "'"  
	ls_where +=  " and sale.confirm_flag    like '" + ist_itemcode.do_flag + "'"
	ls_sql =  is_dw5sql + ls_where

	dw_10.SetSqlSelect(is_dw5sql + ls_where)
	dw_10.retrieve()
else
	ls_where  =  " and sale.order_date   between '"+ ist_itemcode.start_date + "'" 
	ls_where +=  " and '" + ist_itemcode.end_no + "'"  
	ls_where +=  " and sale.confirm_flag    like '" + ist_itemcode.do_flag + "'"	
//	ls_sql =  is_dw5sql + ls_where
	dw_10.SetSqlSelect(is_dw5sql + ls_where)
	dw_10.retrieve()
end if

l_print.st_datawindow  = dw_10
l_print.st_print_sheet = " 프린트용지 : A5"
gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type dw_11 from datawindow within w_mpjaego_r2
integer x = 1833
integer y = 268
integer width = 1545
integer height = 100
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//
gs_where2 lst_whitemret

choose case dwo.name
	case 'item_no'		
		lst_whitemret.chk = "S"		
		openwithparm(w_whitemselectmulti_w2, lst_whitemret)
		lst_whitemret =  message.powerobjectparm

		if lst_whitemret.chk = 'Y' then
			dw_11.Object.item_no[1]  = lst_whitemret.str1[1]
			dw_11.Object.item_no2[1] = lst_whitemret.str1[1]
		end if
		dw_11.SetFocus()
		dw_11.SetColumn("item_no2")

	case 'item_no2'		
		lst_whitemret.chk = "S"		
		openwithparm(w_whitemselectmulti_w2, lst_whitemret)
		lst_whitemret =  message.powerobjectparm

		if lst_whitemret.chk = 'Y' then
			dw_11.Object.item_no2[1] = lst_whitemret.str1[1]
		end if

		dw_12.SetFocus()
end choose
end event

event itemfocuschanged;
String ls_itemno


ls_itemno  =  dw_11.Object.item_no[1]
if ls_itemno = '' or IsNull(ls_itemno) then
else
	dw_6.Object.user_id[1] = ''
end if
end event

type dw_12 from datawindow within w_mpjaego_r2
integer x = 50
integer y = 448
integer width = 827
integer height = 100
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h5"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_13 from datawindow within w_mpjaego_r2
integer x = 946
integer y = 448
integer width = 814
integer height = 100
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h6"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_confirm from datawindow within w_mpjaego_r2
integer x = 2752
integer y = 448
integer width = 905
integer height = 100
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h7"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 발주등록 관리(확정만 가능)
this.accepttext()

if data = "Y" then
	cb_4.enabled = true
	cb_1.enabled = true	
else
	cb_4.enabled = false
	cb_1.enabled = false
end if
//pb_retrieve.triggerevent( clicked! )

end event

type dw_rlseyn from datawindow within w_mpjaego_r2
integer x = 1819
integer y = 448
integer width = 905
integer height = 100
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h8"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_mpjaego_r2
integer x = 4457
integer y = 456
integer width = 274
integer height = 88
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "입고예정"
end type

event clicked;//
date   ld_date,   ld_endate1, ld_endate2
string sz_Frdate, sz_Todate

dw_16.SetTransObject(SQLCA)
dw_17.AcceptText()

ld_date    = today()
ld_endate1 = date(dw_17.Object.en_date1[1])
ld_endate2 = date(dw_17.Object.en_date2[1])

sz_Frdate  = string(ld_endate1,'yyyymmdd')
sz_Todate  = string(ld_endate2,'yyyymmdd')

if long(sz_Frdate) > long(sz_Todate) then
	Messagebox('확인','조회 기간의 정보가 바르지 않습니다. 확인바랍니다.')
	Return
end if

if dw_16.visible = true then
	dw_16.visible = false
else
	dw_16.visible = true
	
	dw_16.Retrieve(ld_endate1, ld_endate2)
	if dw_16.rowcount() < 1 then
		Messagebox("확인","해당하는 조건의 데티어가 존재하지 않습니다.")
	end if
end if

end event

type dw_17 from datawindow within w_mpjaego_r2
integer x = 3698
integer y = 448
integer width = 745
integer height = 100
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpjaego_h9"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//
CHOOSE CASE dwo.name
	CASE 'en_date1'
		dw_16.Visible = False
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_17.object.en_date1[1] = datetime(date(message.stringparm))
		end if
	CASE 'en_date2'
		dw_16.Visible = False
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			dw_17.object.en_date2[1] = datetime(date(message.stringparm))
		end if
END CHOOSE
this.accepttext()

end event

type gb_5 from groupbox within w_mpjaego_r2
integer x = 41
integer y = 224
integer width = 832
integer height = 164
integer taborder = 240
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주일자"
end type

type gb_6 from groupbox within w_mpjaego_r2
integer x = 3419
integer y = 220
integer width = 475
integer height = 168
integer taborder = 280
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "물품담당자"
end type

type gb_7 from groupbox within w_mpjaego_r2
integer x = 896
integer y = 224
integer width = 887
integer height = 164
integer taborder = 200
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수주번호"
end type

type gb_8 from groupbox within w_mpjaego_r2
integer x = 1806
integer y = 220
integer width = 1605
integer height = 168
integer taborder = 190
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "물품명"
end type

type gb_9 from groupbox within w_mpjaego_r2
integer x = 32
integer y = 400
integer width = 864
integer height = 168
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처명"
end type

type gb_10 from groupbox within w_mpjaego_r2
integer x = 928
integer y = 400
integer width = 850
integer height = 168
integer taborder = 230
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "현장명"
end type

type gb_11 from groupbox within w_mpjaego_r2
integer x = 2743
integer y = 400
integer width = 933
integer height = 168
integer taborder = 250
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "확정유무"
end type

type gb_12 from groupbox within w_mpjaego_r2
integer x = 1806
integer y = 400
integer width = 933
integer height = 168
integer taborder = 260
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고여부"
end type

type gb_13 from groupbox within w_mpjaego_r2
integer x = 3680
integer y = 400
integer width = 1079
integer height = 168
integer taborder = 290
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "입고예정일자"
end type

type dw_16 from datawindow within w_mpjaego_r2
integer x = 530
integer y = 864
integer width = 3867
integer height = 1292
integer taborder = 430
boolean titlebar = true
string title = "입고예정정보"
string dataobject = "d_mpjaego_r4"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string sz_Name

this.AcceptText()

if row = 0 Then
	choose case dwo.type
		case "text"
			sz_Name = dwo.name
			sz_Name = LeftA(sz_Name, LenA(sz_Name) - 2)
	
			this.SetSort(sz_Name)
			this.Sort()
	end choose
	return
end if

if string(dwo.type) <> "column" then return

if this.RowCount() < 1 then return
	
this.SelectRow(0, FALSE)
this.SelectRow(row, TRUE)

end event

event doubleclicked;string ls_order_no,  ls_item_no, ls_qa, ls_loc_no
dec    ld_order_qty, ld_qoh
long   ll_row

dw_16.AcceptText()

ll_row       = dw_16.GetRow()
ls_order_no  = dw_16.Object.order_no[ll_row]
ls_item_no   = dw_16.Object.item_no[ll_row]
ls_qa        = dw_16.Object.qa[ll_row]
ld_order_qty = dw_16.Object.order_qty[ll_row]
ld_qoh       = dw_16.Object.qoh[ll_row]
ls_loc_no    = dw_locno.Object.loc_no[1]

dw_7.visible = True
dw_16.visible= False

if dw_7.Retrieve(ls_order_no, ls_item_no, ls_qa, ld_order_qty) <= 0 then
	if MessageBox("확인", "입력한 정보가 없습니다. 신규 입력 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
		dw_7.InsertRow(0)
		dw_7.Object.order_no[1]  = ls_order_no
		dw_7.Object.item_no[1]   = ls_item_no
		dw_7.Object.qa[1]        = ls_qa
		dw_7.Object.order_qty[1] = ld_order_qty
		dw_7.Object.qoh[1]       = ld_qoh
		dw_7.Object.loc_no[1]    = ls_loc_no
	else
		dw_7.visible = FALSE
		return
	end if
end if

end event

type dw_3 from datawindow within w_mpjaego_r2
integer x = 32
integer y = 768
integer width = 4640
integer height = 1556
integer taborder = 410
string dataobject = "d_mpjaego_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string ls_order_no, ls_item_no, ls_qa, ls_loc_no
dec    ld_order_qty, ld_qoh
long   ll_row

dw_3.AcceptText()
if isnull(row) OR row < 1 OR row > dw_3.rowcount() then return 

ls_loc_no    = dw_locno.Object.loc_no[1]

ls_order_no  = dw_3.Object.order_no[row]
ls_item_no   = dw_3.Object.item_no[row]
ls_qa        = dw_3.Object.qa[row]
ld_qoh       = dw_3.Object.qoh[row]
ld_order_qty = dw_3.Object.saledet_order_qty[row]

dw_7.visible = true

if dw_7.retrieve(ls_order_no, ls_item_no, ls_qa, ld_order_qty) < 1 THEN
	if MessageBox("확인", "등록된 데이터가 없습니다. 등록 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 THEN
		dw_7.InsertRow(0)
		dw_7.Object.order_no[1]  = ls_order_no
		dw_7.Object.item_no[1]   = ls_item_no
		dw_7.Object.qa[1]        = ls_qa
		dw_7.Object.order_qty[1] = ld_order_qty
		dw_7.Object.qoh[1]       = ld_qoh
		dw_7.Object.loc_no[1]    = ls_loc_no
	else
		dw_7.visible = FALSE
		RETURN
	end if
end if

end event

event clicked;//
if isnull(row) OR row < 1 then RETURN
//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

dw_7.visible = false

this.AcceptText()
if this.object.tchk[1] = 0 then cbx_chk.checked = false

il_selectrow = row


//
string ls_order
long   ll_seqno, ll_find

if cbx_new.checked = true then
	ls_order  = this.object.order_no[row]
	ll_seqno  = this.object.seq_no[row]
	
	ll_find   = dw_5.find( "order_no = '"+ls_order+"' AND seq_no = "+string(ll_seqno)+"", 1, dw_5.rowcount() )
	if ll_find > 0 then
		dw_5.scrolltorow( ll_find )
	end if
end if

end event

event rowfocuschanged;//
this.AcceptText()
if this.RowCount() < 1 then RETURN	

end event

type cb_4 from commandbutton within w_mpjaego_r2
integer x = 2363
integer y = 48
integer width = 521
integer height = 148
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주등록 관리"
end type

event clicked;//// 발주등록 관리
//long  ll_row, ll_cnt, ll_delcnt, ll_copy
//
//if dw_3.rowcount() < 1 then return
//
//if MessageBox("확인", "선택한 품목들은 반드시 상품으로 해야 하며,~r~r" + &
//              "반제품은 '생산계획 조정관리'에서 작업해야 합니다.", Exclamation!, OKCancel!, 1) = 2 then RETURN
//
//for ll_row = 1 to dw_3.rowcount()
//	if dw_3.object.chk[ll_row] = "Y" then
//		ll_cnt = ll_cnt + 1
//	end if
//next
//
//if ll_cnt = 0 then 
//	MessageBox("확인","발주등록할 품목이 선택되지 않았습니다.")
//	return
//else
//	MessageBox("확인",string(ll_cnt) + " 건을 선택하였습니다.")
//end if
//
//if IsValid(w_ippurchasenew_m) = False then			
//	OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
//	Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 				
//else
//	if MessageBox("확인", "작업중인 '발주등록 관리' 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
//		Parent.arrangesheets( Layer! )
//		Return
//	else
//		close(w_ippurchasenew_m)
//		OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
//		Parent.arrangesheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
//	end if
//end if
//
////
//if IsValid(w_ippurchasenew_m) = true then
//	if w_ippurchasenew_m.dw_jaego.dataobject = "d_mpjaego_r2" then
//		// 정상
//	else
//		w_ippurchasenew_m.dw_jaego.dataobject = "d_mpjaego_r2"
//		w_ippurchasenew_m.dw_jaego.SetTransObject(SQLCA)
//	end if
//	
//	w_ippurchasenew_m.dw_jaego.InsertRow(0)
//	dw_3.RowsCopy(1, dw_3.RowCount(), Primary!, w_ippurchasenew_m.dw_jaego, 1, Primary!)
//	
//	ll_cnt  = 0	
//	ll_copy = w_ippurchasenew_m.dw_jaego.rowcount()
//	for ll_row = ll_copy to 1 step -1 
//		if w_ippurchasenew_m.dw_jaego.object.chk[ll_row] = "Y" then
//			ll_cnt = ll_cnt + 1
//		else
//			w_ippurchasenew_m.dw_jaego.deleterow(ll_row)
//		end if
//	next	
//	w_ippurchasenew_m.is_tabcheck = '4'
//	w_ippurchasenew_m.tab_1.selecttab(4)							// 수주내역 
//	w_ippurchasenew_m.tab_1.tabpage_4.cb_18.enabled = true	// 수주물품별 재고현황(NEW) 가져오기
//	MessageBox("확인","발주등록할 품목 " + string(ll_cnt,"#,##0") + " 건을 복사 하였습니다.")
//end if	
end event

type cbx_chk from checkbox within w_mpjaego_r2
integer x = 265
integer y = 832
integer width = 69
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;//
long ll_row

dw_3.setredraw( false )
if this.checked = true then
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.chk[ll_row] = "Y"
	next
else
	for ll_row = 1 to dw_3.rowcount()
		dw_3.object.chk[ll_row] = ""
	next
end if
dw_3.setredraw( true )

end event

type st_13 from statictext within w_mpjaego_r2
integer x = 78
integer y = 660
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

type st_14 from statictext within w_mpjaego_r2
integer x = 695
integer y = 660
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

type ddlb_op from dropdownlistbox within w_mpjaego_r2
integer x = 864
integer y = 644
integer width = 279
integer height = 512
integer taborder = 20
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

type sle_value from singlelineedit within w_mpjaego_r2
integer x = 1157
integer y = 644
integer width = 910
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_10 from commandbutton within w_mpjaego_r2
integer x = 2208
integer y = 644
integer width = 146
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_3
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
arg_dw.groupcalc()


end event

type cb_14 from commandbutton within w_mpjaego_r2
integer x = 2359
integer y = 644
integer width = 146
integer height = 76
integer taborder = 50
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
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw = dw_3
GF_DW2UnFilter( arg_dw )
arg_dw.groupcalc()

//pb_retrieve.triggerevent(clicked!)
dw_3.scrolltorow(1)

// DW Filter 해지
long ll_row

dw_filter.visible = false
for ll_row = 1 to dw_filter.rowcount()
	dw_filter.object.chk[ll_row] = "N"
next

end event

type cb_15 from commandbutton within w_mpjaego_r2
integer x = 2510
integer y = 644
integer width = 146
integer height = 76
integer taborder = 60
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
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type cb_16 from commandbutton within w_mpjaego_r2
integer x = 2656
integer y = 644
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
arg_dw.groupcalc()

end event

type rb_1 from radiobutton within w_mpjaego_r2
integer x = 2843
integer y = 628
integer width = 352
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
string text = "소계숨김"
boolean checked = true
end type

event clicked;// 소계숨김
if this.checked = true then
	dw_3.setredraw( false )
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계 숨김
	dw_3.setredraw( true )
end if

end event

type rb_2 from radiobutton within w_mpjaego_r2
integer x = 2843
integer y = 680
integer width = 352
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
string text = "소계보기"
end type

event clicked;// 소계보기
if this.checked = true then
	dw_3.setredraw( false )
	dw_3.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=76")	// 소계
	dw_3.setredraw( true )
end if

end event

type rb_3 from radiobutton within w_mpjaego_r2
integer x = 3223
integer y = 628
integer width = 352
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
string text = "전체보기"
end type

event clicked;// 전체보기
if this.checked = true then
	dw_3.setredraw( false )
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=76")	// 소계
	dw_3.setredraw( true )
end if

end event

type gb_14 from groupbox within w_mpjaego_r2
integer x = 32
integer y = 588
integer width = 4640
integer height = 164
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_fld from dropdownlistbox within w_mpjaego_r2
integer x = 251
integer y = 644
integer width = 402
integer height = 532
integer taborder = 10
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
end type

type ddlb_dwtitles from dropdownlistbox within w_mpjaego_r2
integer x = 288
integer y = 652
integer width = 265
integer height = 88
integer taborder = 20
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
end type

type cb_5 from commandbutton within w_mpjaego_r2
integer x = 2075
integer y = 644
integer width = 119
integer height = 76
integer taborder = 200
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
WF_DWFilter( dw_3, "item_no", "item_item_name", sle_value.text )

end event

type dw_filter from datawindow within w_mpjaego_r2
integer x = 411
integer y = 1156
integer width = 1065
integer height = 668
integer taborder = 300
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
string ls_filter, ls_val, ls_itemno, ls_itemnm
long   ll_row, ll_tchk

ll_tchk = this.object.tchk[1]

if ll_tchk > 0 then
	// (모두 선택)
	for ll_row = 2 to this.rowcount()
		if this.object.chk[ll_row] = "Y" then
			ls_itemno = this.object.item_no[ll_row] 
			ls_itemnm = this.object.item_name[ll_row] 
			
			ls_val    = ls_val + ls_itemno + ","
			ls_filter = ls_filter + "'" + ls_itemno + "',"
		end if
	next
	ls_filter = LeftA(ls_filter, LenA(ls_filter) - 1)
	
	dw_3.setredraw( false )
	dw_3.setfilter( "item_no IN (" + ls_filter + ")" )
	dw_3.filter()
	dw_3.setredraw( true )
	
	// 가져오기
	if cbx_import.checked = true then
		GF_ReplaceAll(ls_filter, "'", "")

		if LenA(ls_val) > 4096 then
			MessageBox("확인","필터링 대상이 4096 Byte 초과 합니다.")
			SetProfileString("YCERP.INI", "MPGAEGO", "FILTER",  ls_val)		
		else
			SetProfileString("YCERP.INI", "MPGAEGO", "FILTER",  ls_val)		
		end if
	end if
	
	this.visible = false
end if

end event

type cbx_import from checkbox within w_mpjaego_r2
integer x = 2103
integer y = 584
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

type dw_18 from datawindow within w_mpjaego_r2
integer x = 3401
integer y = 1156
integer width = 1065
integer height = 668
integer taborder = 300
boolean bringtotop = true
boolean titlebar = true
string title = "발주내역 조회"
string dataobject = "d_mpjaego_r5"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_mpjaego_r2
integer x = 3607
integer y = 636
integer width = 544
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주내역 조회"
end type

event clicked;// 발주내역 조회
string ls_orderno
long   ll_row

ll_row  = dw_3.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

ls_orderno  = dw_3.object.order_no[ll_row]
if isnull(ls_orderno) OR ls_orderno = "" then RETURN

dw_18.visible = true
dw_18.retrieve( ls_orderno )

end event

type cbx_new from checkbox within w_mpjaego_r2
integer x = 37
integer y = 172
integer width = 210
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
string text = "TEST"
end type

event clicked;//
if this.checked = true then
	cbx_2.checked = false
	cbx_2.visible = true
	
	dw_3.height  = il_height / 2

	dw_5.visible = true
	dw_5.y       = dw_3.y + dw_3.height
	dw_5.height  = il_height / 2
else
	cbx_2.checked = false
	cbx_2.visible = false

	dw_3.height  = il_height

	dw_5.visible = false
end if

end event

type dw_5 from datawindow within w_mpjaego_r2
integer x = 535
integer y = 172
integer width = 78
integer height = 68
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_mpjaego_r21"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_mpjaego_r2
integer x = 265
integer y = 172
integer width = 78
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
end type

event clicked;//
string ls_order
long   ll_row, ll_seqno, ll_find, ll_save

if this.checked = true then
	for ll_row = 1 to dw_3.rowcount()
		dw_3.scrolltorow( ll_row )
	
		ls_order  = dw_3.object.order_no[ll_row]
		ll_seqno  = dw_3.object.seq_no[ll_row]
		
		ll_find   = dw_5.find( "order_no = '"+ls_order+"' AND seq_no = "+string(ll_seqno)+"", 1, dw_5.rowcount() )
		if ll_find > 0 then
			ll_save = ll_find
		else
			dw_5.scrolltorow( ll_save + 1 )

			//dw_5.SelectRow(0, FALSE)
			//dw_5.SelectRow(ll_save + 1, TRUE)			
			EXIT
		end if
	next
end if

this.checked = false

end event

type cb_1 from commandbutton within w_mpjaego_r2
integer x = 2907
integer y = 48
integer width = 658
integer height = 148
integer taborder = 340
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주등록 관리(new)"
end type

event clicked;//// 발주등록 관리
//long  ll_row, ll_cnt, ll_delcnt, ll_copy
//
//if dw_3.rowcount() < 1 then return
//
//if MessageBox("확인", "선택한 품목들은 반드시 상품으로 해야 하며,~r~r" + &
//              "반제품은 '생산계획 조정관리'에서 작업해야 합니다.", Exclamation!, OKCancel!, 1) = 2 then RETURN
//
//for ll_row = 1 to dw_3.rowcount()
//	if dw_3.object.chk[ll_row] = "Y" then
//		ll_cnt = ll_cnt + 1
//	end if
//next
//
//if ll_cnt = 0 then 
//	MessageBox("확인","발주등록할 품목이 선택되지 않았습니다.")
//	return
//else
//	MessageBox("확인",string(ll_cnt) + " 건을 선택하였습니다.")
//end if
//
//
//if IsValid(w_ippurchasenew_m) = False then			
//	OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
//	Parent.ArrangeSheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 				
//else
//	if MessageBox("확인", "작업중인 '발주등록 관리' 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
//		Parent.arrangesheets( Layer! )
//		Return
//	else
//		close(w_ippurchasenew_m)
//		OpenSheet(w_ippurchasenew_m, parent.parentwindow(), 6, Layered!) // Layered! , Cascaded!
//		Parent.arrangesheets( Layer! )  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
//	end if
//end if
//
////
//if IsValid(w_ippurchasenew_m) = true then
//	if w_ippurchasenew_m.dw_jaego.dataobject = "d_mpjaego_r2" then
//		// 정상
//	else
//		w_ippurchasenew_m.dw_jaego.dataobject = "d_mpjaego_r2"
//		w_ippurchasenew_m.dw_jaego.SetTransObject(SQLCA)
//	end if
//	
//	w_ippurchasenew_m.dw_jaego.InsertRow(0)
//	dw_3.RowsCopy(1, dw_3.RowCount(), Primary!, w_ippurchasenew_m.dw_jaego, 1, Primary!)
//	
//	ll_cnt  = 0	
//	ll_copy = w_ippurchasenew_m.dw_jaego.rowcount()
//	
//	for ll_row = ll_copy to 1 step -1 
//		if w_ippurchasenew_m.dw_jaego.object.chk[ll_row] = "Y" then
//			ll_cnt = ll_cnt + 1
//		else
//			w_ippurchasenew_m.dw_jaego.deleterow(ll_row)
//		end if
//	next	
//	
//	w_ippurchasenew_m.is_tabcheck = '8'
//	w_ippurchasenew_m.tab_1.selecttab(8)							// 수주내역 
//	w_ippurchasenew_m.tab_1.tabpage_8.cb_30.enabled = true	// 수주물품별 재고현황(NEW) 가져오기
//	MessageBox("확인","발주등록할 품목 " + string(ll_cnt,"#,##0") + " 건을 복사 하였습니다.")
//end if
end event

