$PBExportHeader$w_cdcurrrate_m.srw
$PBExportComments$환율관리(1998/02/01,곽용덕)
forward 
global type w_cdcurrrate_m from w_inheritance
end type
type dw_3 from datawindow within w_cdcurrrate_m
end type
end forward

global type w_cdcurrrate_m from w_inheritance
integer width = 2729
integer height = 2128
string title = "환율관리(w_cdcurrrate_m)"
long backcolor = 79220952
dw_3 dw_3
end type
global w_cdcurrrate_m w_cdcurrrate_m

type variables
string is_sql
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
is_sql = dw_3.describe("datawindow.table.select")

dw_2.insertrow(0)
dw_2.object.curr_type[1] = 'USD'
dw_2.accepttext()
dw_1.retrieve('USD')

end event

on w_cdcurrrate_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
end on

on w_cdcurrrate_m.destroy
call super::destroy
destroy(this.dw_3)
end on

type pb_save from w_inheritance`pb_save within w_cdcurrrate_m
integer x = 2263
integer y = 56
end type

event pb_save::clicked;if dw_1.rowcount() < 1 then return
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdcurrrate_m
integer x = 55
integer y = 284
integer width = 2578
integer height = 1688
string dataobject = "d_cdcurrrate_m"
boolean hscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_cdcurrrate_m
integer width = 1280
string text = "환율 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcurrrate_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcurrrate_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcurrrate_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcurrrate_m
integer x = 2455
integer y = 56
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcurrrate_m
integer x = 2071
integer y = 56
end type

event pb_print::clicked;st_currate lst_curr
w_repsuper w_print
st_print l_print
//==========================================================================

if dw_1.rowcount() < 1 then
	return
end if

openwithparm(w_whcurrprint_w, lst_curr)

lst_curr = message.powerobjectparm

if lst_curr.flag = 'N' then
	return
else
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================
	dw_2.accepttext()
	if lst_curr.all_part = 'A' then
		dw_3.dataobject = 'd_cdcurrrate_r'
		dw_3.settransobject(sqlca)
		dw_3.retrieve(dw_2.getitemstring(dw_2.getrow(), "curr_type"))
	else
		dw_3.dataobject = 'd_cdcurrrate_r1'
		dw_3.settransobject(sqlca)
		dw_3.retrieve(dw_2.getitemstring(dw_2.getrow(), "curr_type"), lst_curr.start_date, lst_curr.end_date)
		
		dw_3.object.startdate[1] = string(lst_curr.start_date, 'YYYY/MM/DD')
		dw_3.object.enddate[1] = string(lst_curr.end_date, 'YYYY/MM/DD')
	end if
	
	l_print.st_datawindow = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc = " 이 프로그램은 환율을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4

	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
   	                'Datawindow.Zoom=100'
	opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcurrrate_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdcurrrate_m
boolean visible = false
integer x = 1902
integer y = 56
end type

type pb_insert from w_inheritance`pb_insert within w_cdcurrrate_m
integer x = 1879
integer y = 56
end type

event pb_insert::clicked;call super::clicked;long ll_row
string ls_currcode

dw_2.accepttext()
ls_currcode = dw_2.object.curr_type[1]
ll_row = dw_1.insertrow(1)
dw_1.ScrollToRow(ll_row)
dw_1.object.curr_date[ll_row] = wf_today()
dw_1.object.curr_code[ll_row] = ls_currcode
dw_1.setcolumn('exp_rate')  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcurrrate_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_cdcurrrate_m
integer x = 1390
integer y = 16
integer width = 411
integer height = 204
end type

type gb_2 from w_inheritance`gb_2 within w_cdcurrrate_m
integer x = 27
integer y = 232
integer width = 2638
integer height = 1768
end type

type gb_1 from w_inheritance`gb_1 within w_cdcurrrate_m
integer x = 1856
integer y = 16
integer width = 814
end type

type dw_2 from w_inheritance`dw_2 within w_cdcurrrate_m
integer x = 1408
integer y = 60
integer width = 375
integer height = 148
string dataobject = "d_cdcurrrate_s"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type dw_3 from datawindow within w_cdcurrrate_m
boolean visible = false
integer x = 1335
integer y = 108
integer width = 46
integer height = 76
integer taborder = 51
boolean bringtotop = true
string dataobject = "d_cdcurrrate_r"
boolean livescroll = true
end type

