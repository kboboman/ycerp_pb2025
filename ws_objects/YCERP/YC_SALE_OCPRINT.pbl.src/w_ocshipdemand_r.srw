$PBExportHeader$w_ocshipdemand_r.srw
$PBExportComments$운반비청구내역조회(2002/08/28,이인호)
forward
global type w_ocshipdemand_r from w_inheritance
end type
type em_1 from editmask within w_ocshipdemand_r
end type
type em_2 from editmask within w_ocshipdemand_r
end type
type dw_area from datawindow within w_ocshipdemand_r
end type
type ddlb_1 from dropdownlistbox within w_ocshipdemand_r
end type
type rb_4 from radiobutton within w_ocshipdemand_r
end type
type rb_5 from radiobutton within w_ocshipdemand_r
end type
type rb_3 from radiobutton within w_ocshipdemand_r
end type
type dw_3 from datawindow within w_ocshipdemand_r
end type
type gb_4 from groupbox within w_ocshipdemand_r
end type
type rb_6 from radiobutton within w_ocshipdemand_r
end type
type rb_7 from radiobutton within w_ocshipdemand_r
end type
type st_1 from statictext within w_ocshipdemand_r
end type
type ddlb_2 from dropdownlistbox within w_ocshipdemand_r
end type
type st_3 from statictext within w_ocshipdemand_r
end type
type cb_1 from commandbutton within w_ocshipdemand_r
end type
type st_4 from statictext within w_ocshipdemand_r
end type
type pb_1 from picturebutton within w_ocshipdemand_r
end type
type cbx_1 from checkbox within w_ocshipdemand_r
end type
type st_2 from statictext within w_ocshipdemand_r
end type
type st_5 from statictext within w_ocshipdemand_r
end type
type cbx_prtsort from checkbox within w_ocshipdemand_r
end type
type dw_4 from datawindow within w_ocshipdemand_r
end type
type cb_2 from commandbutton within w_ocshipdemand_r
end type
type em_yyyymm from editmask within w_ocshipdemand_r
end type
type st_6 from statictext within w_ocshipdemand_r
end type
type rb_1 from radiobutton within w_ocshipdemand_r
end type
type rb_2 from radiobutton within w_ocshipdemand_r
end type
type rb_8 from radiobutton within w_ocshipdemand_r
end type
type rb_9 from radiobutton within w_ocshipdemand_r
end type
type rb_10 from radiobutton within w_ocshipdemand_r
end type
type gb_5 from groupbox within w_ocshipdemand_r
end type
type gb_6 from groupbox within w_ocshipdemand_r
end type
end forward

global type w_ocshipdemand_r from w_inheritance
integer width = 7406
integer height = 2176
string title = "운반비청구 내역조회(w_ocshipdemand_r)"
em_1 em_1
em_2 em_2
dw_area dw_area
ddlb_1 ddlb_1
rb_4 rb_4
rb_5 rb_5
rb_3 rb_3
dw_3 dw_3
gb_4 gb_4
rb_6 rb_6
rb_7 rb_7
st_1 st_1
ddlb_2 ddlb_2
st_3 st_3
cb_1 cb_1
st_4 st_4
pb_1 pb_1
cbx_1 cbx_1
st_2 st_2
st_5 st_5
cbx_prtsort cbx_prtsort
dw_4 dw_4
cb_2 cb_2
em_yyyymm em_yyyymm
st_6 st_6
rb_1 rb_1
rb_2 rb_2
rb_8 rb_8
rb_9 rb_9
rb_10 rb_10
gb_5 gb_5
gb_6 gb_6
end type
global w_ocshipdemand_r w_ocshipdemand_r

type variables
st_print i_print
int    ii_sel = 1, i_index  =1
string is_con ="O", is_car = '', is_sdate, is_edate
datawindowchild idwc_area

end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();//
string ls_filter

CHOOSE CASE ii_sel
	CASE 1
		if rb_4.checked = true then			// 대여
			ls_filter = 'do_ship_flag = "D"'
		elseif rb_5.checked = true then		// 부담
			ls_filter = 'do_ship_flag = "B"'
		elseif rb_6.checked = true then		// 공사
			ls_filter = 'do_ship_flag = "A"'
		elseif rb_7.checked = true then		// 재료
			ls_filter = 'do_ship_flag = "R"'
		else
			ls_filter = ''
		end if
		
	CASE 2
		if rb_4.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "B"'
		elseif rb_6.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "A"'
		elseif rb_7.checked = true then
			ls_filter = 'ship_amount <> 0 and do_ship_flag = "R"'
		else
			ls_filter = 'ship_amount <> 0'
		end if
		
	CASE 3
		if rb_4.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "D"'
		elseif rb_5.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "B"'
		elseif rb_6.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "A"'
		elseif rb_7.checked = true then
			ls_filter = 'ship_amount = 0 and do_ship_flag = "R"'
		else
			ls_filter = 'ship_amount = 0'
		end if
END CHOOSE

if trim(is_car) <> '' then
	if ls_filter <> '' then
		ls_filter = ls_filter + ' and do_driver = "' + is_car + '"'
	else
		ls_filter = 'do_driver = "' + is_car + '"'
	end if
end if

dw_2.setredraw(false)
dw_1.setfilter(ls_filter)
dw_1.filter()

dw_2.setfilter(ls_filter)
dw_2.filter()
dw_1.groupcalc()
dw_2.groupcalc()
dw_2.setredraw(true)

end subroutine

on w_ocshipdemand_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.ddlb_1=create ddlb_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_3=create rb_3
this.dw_3=create dw_3
this.gb_4=create gb_4
this.rb_6=create rb_6
this.rb_7=create rb_7
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.st_3=create st_3
this.cb_1=create cb_1
this.st_4=create st_4
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.st_2=create st_2
this.st_5=create st_5
this.cbx_prtsort=create cbx_prtsort
this.dw_4=create dw_4
this.cb_2=create cb_2
this.em_yyyymm=create em_yyyymm
this.st_6=create st_6
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_8=create rb_8
this.rb_9=create rb_9
this.rb_10=create rb_10
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.rb_5
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.gb_4
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.rb_7
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.ddlb_2
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.pb_1
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.cbx_prtsort
this.Control[iCurrent+22]=this.dw_4
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.em_yyyymm
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.rb_1
this.Control[iCurrent+27]=this.rb_2
this.Control[iCurrent+28]=this.rb_8
this.Control[iCurrent+29]=this.rb_9
this.Control[iCurrent+30]=this.rb_10
this.Control[iCurrent+31]=this.gb_5
this.Control[iCurrent+32]=this.gb_6
end on

on w_ocshipdemand_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.ddlb_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_3)
destroy(this.dw_3)
destroy(this.gb_4)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.cbx_prtsort)
destroy(this.dw_4)
destroy(this.cb_2)
destroy(this.em_yyyymm)
destroy(this.st_6)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.rb_10)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), THIS.Title )
//=============================================================================================
long l_row
string ls_yyyymm

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_area.settransobject(sqlca)

dw_area.insertrow(1)
dw_area.getchild("area",idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,"area_no","%")
idwc_area.setitem(1,"area_name","전체")
idwc_area.accepttext()

dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

dw_1.visible = false
if day(today()) > 10 then
	em_1.text = string(wf_today(), "yyyy/mm/01")
	em_2.text = string(wf_today(), "yyyy/mm/dd")
	em_yyyymm.text = string(wf_today(), "yyyy/mm")
else
	em_1.text = string(RelativeDate(today(), - day(today()) ),"yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - day(today()) ),"yyyy/mm/dd")
	em_yyyymm.text = string(RelativeDate(today(), - day(today()) ),"yyyy/mm")
end if

	ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)

cbx_prtsort.enabled = false		// 출력물 송장번호 SORT

ddlb_1.text = "운반비 0인것 제외"
ddlb_2.text = "운전자+운송방법+거래처명+출고번호"
ii_sel = 2

datawindowchild ldwc_car
dw_3.insertrow(0)
dw_3.getchild("driver",ldwc_car)
ldwc_car.insertrow(1)
ldwc_car.setitem(1,"driver"," ")
ldwc_car.setitem(1,"name","전체")
ldwc_car.accepttext()
ldwc_car.scrolltorow(1)


string ls_sdate, ls_edate, ls_area, ls_button_text1, ls_button_text2
long   l_count

ls_area  = LeftA(dw_area.object.area[1],1)
ls_sdate = em_1.text
ls_edate = em_2.text
is_sdate = em_1.text
is_edate = em_2.text
is_con   = "%"          

l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm = :ls_yyyymm
and seq = 1;

ls_button_text1 = ''

select  '1차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text1
from dual;


l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm = :ls_yyyymm
and seq = 2;

ls_button_text2 = ''

select  '2차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text2
from dual;

datawindowchild ldwc_chasu
dw_4.insertrow(0)
dw_4.getchild("chasu",ldwc_chasu)
ldwc_chasu.setitem(1,"chasu", ls_button_text1)
ldwc_chasu.insertrow(0)
ldwc_chasu.setitem(2,"chasu", ls_button_text2)
ldwc_chasu.accepttext()
ldwc_chasu.scrolltorow(1)

dw_4.object.chasu[1] = ls_button_text1
end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_2.width  = newwidth  - (gb_4.x * 2)
dw_2.height = newheight - dw_2.y - gb_4.x


end event

type pb_save from w_inheritance`pb_save within w_ocshipdemand_r
event ue_print pbm_custom01
boolean visible = false
integer x = 3680
integer y = 40
integer taborder = 70
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocshipdemand_r
integer x = 50
integer y = 176
integer width = 91
integer height = 76
integer taborder = 10
string title = "d_ocshipclose_r2"
string dataobject = "d_ocshipclose_r"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocshipdemand_r
integer x = 32
integer y = 32
integer width = 1330
string text = "운반비청구 내역조회"
end type

type st_tips from w_inheritance`st_tips within w_ocshipdemand_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipdemand_r
boolean visible = false
integer x = 2341
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipdemand_r
boolean visible = false
integer x = 6286
integer y = 40
integer width = 526
integer height = 152
integer taborder = 50
string text = "수주상황접수부 시화출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;////w_repsuper w_print
////
////i_print.st_datawindow = dw_3
////i_print.st_print_sheet = " 프린트용지 : A4"
////i_print.st_print_desc = " 이 프로그램은 판매거래처 마스터를 출력합니다." 
////
////gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=64'
////opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
////
////
////
//if dw_4.getrow() < 1 then
//	MessageBox("출력", "수주조회후에 출력하십시요!")
//	return
//end if
//
//if MessageBox("수주상황접수부 출력", "수주상황접수부를 시화프린터로 직접 출력합니다 ~r~n" &
//											+ "출력하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
//	return
//end if
//
//dw_5.settransobject(sqlca)
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm
//
//dw_5.Modify('DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//	                   'Datawindow.Zoom=100' )
//dw_5.retrieve(dw_4.object.order_no[dw_4.getrow()])
//wf_multiprint()
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x - 70
li_y = this.y + 156

f_usetips(st_tips,"수주상황접수부 시화출력  ",parent, li_x, li_y)


end event

type pb_close from w_inheritance`pb_close within w_ocshipdemand_r
integer x = 6053
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipdemand_r
integer x = 5861
integer y = 56
integer taborder = 200
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
string	  ls_area, ls_sdate, ls_edate, ls_prtflag, ls_day, ls_change

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

ls_sdate = em_1.text
ls_edate = em_2.text
is_con   = '%'

//-- 2012-06-25(이재형) : 운반비 청구내역서 출력시 전체인 경우 "구분"항목 제어
//								  운반비청구마감과 출력화면 같이 사용하는 부분이
//								  있어서 병행작업함(w_ocshipclose_m)

if rb_3.checked = true then	// 전체
	ls_prtflag = '1'
else
	ls_prtflag = '0'
end if

ls_area = LeftA(dw_area.object.area[1],1)
//if dw_1.retrieve(ls_area, ls_sdate, ls_edate, is_con, ls_prtflag) < 1 then
//	messagebox("확인","내역이 없습니다.")
//	return
//end if


/*2018.10.31 jowonsuk 확정조회 추가로직 */
string ls_yyyymm, ls_seq

ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
ls_day	   = em_yyyymm.text

if LeftA(dw_4.object.chasu[1],1) = '1' then
	ls_seq = '1'
else
	ls_seq = '2'
end if

if ls_seq = '1' then /* 1차 */
	select :ls_day+'/01', :ls_day+'/15'
	into :ls_sdate, :ls_edate
	from dual;
else						    /* 2차 */	
	select :ls_day+'/16',  convert(char(10), dateadd(day,-1, dateadd( month,1, convert(datetime, :ls_day+'/01') ) ),111 )
	into :ls_sdate, :ls_edate
	from dual;		
end if

	
if rb_1.checked then		
	
//	dw_1.dataobject = 'd_ocshipclose_r'
//	dw_1.SetTransObject(SQLCA)
	
	ls_sdate = em_1.text	
	ls_edate = em_2.text

	if dw_1.retrieve(ls_area, ls_sdate, ls_edate, is_con, ls_prtflag) < 1 then
		messagebox("확인","내역이 없습니다.")
		return
	end if		
	
elseif rb_2.checked then			
	
//	dw_1.dataobject = 'd_ocshipclose_r'	
//	dw_1.SetTransObject(SQLCA)
	
	if dw_1.retrieve( ls_area, ls_yyyymm,  ls_seq, is_con, ls_prtflag) < 1 then
		messagebox("확인","내역이 없습니다.")
		return
	end if		
	
elseif rb_8.checked then
	
	is_con   = "%"
	
	ls_change = '%'
	
	if rb_9.checked then
		ls_change = '%'		
	else
		ls_change = '수정'		
	end if
	
	if dw_2.retrieve( ls_area, ls_yyyymm,  ls_seq, ls_sdate, ls_edate, is_con, ls_change )  < 1 then
		messagebox("확인","내역이 없습니다.")
		return
	end if		
	
end if


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if rb_8.checked = false then
	l_print.st_datawindow  = dw_1
	l_print.st_print_desc  = " 이 프로그램은 운반비 청구내역서를 출력합니다." 
	l_print.st_print_sheet = " 프린트용지 : A4"
	gs_print_control       = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90'	
else
	l_print.st_datawindow  = dw_2
	l_print.st_print_desc  = " 이 프로그램은 운반비 청구내역서를 출력합니다." 
	l_print.st_print_sheet = " 프린트용지 : A4"
	gs_print_control       = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=47'	
end if


// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipdemand_r
boolean visible = false
integer x = 3077
integer y = 40
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipdemand_r
boolean visible = false
integer x = 3077
integer y = 40
integer taborder = 240
end type

type pb_insert from w_inheritance`pb_insert within w_ocshipdemand_r
boolean visible = false
integer x = 3269
integer y = 40
integer taborder = 250
string text = " "
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipdemand_r
integer x = 5467
integer y = 56
integer taborder = 20
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//
string ls_area, ls_sdate, ls_edate, ls_day, ls_change
long   ll_row

if em_1.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_2.text = "" then
	MessageBox("확인","조회기간을 입력하세요!",information!)
	return 1
elseif em_1.text > em_2.text then
	MessageBox("확인","조회기간을 잘못 입력하였습니다!",information!)
	return 1
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================



/*2018.10.31 jowonsuk 확정조회 추가로직 */
string ls_yyyymm, ls_seq


ls_area  = LeftA(dw_area.object.area[1],1)
ls_yyyymm =  LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
ls_day         =  em_yyyymm.text

if LeftA(dw_4.object.chasu[1],1) = '1' then
	ls_seq = '1'
else
	ls_seq = '2'
end if


if ls_seq = '1' then /* 1차 */
	select :ls_day+'/01', :ls_day+'/15'
	into :ls_sdate, :ls_edate
	from dual;
else						    /* 2차 */	
	select :ls_day+'/16',  convert(char(10), dateadd(day,-1, dateadd( month,1, convert(datetime, :ls_day+'/01') ) ),111 )
	into :ls_sdate, :ls_edate
	from dual;		
end if
	
	
if rb_1.checked then
	ls_sdate = em_1.text
	ls_edate = em_2.text
	is_con   = "%"

	ll_row = dw_2.retrieve( ls_area, ls_sdate, ls_edate, is_con )
	
elseif rb_2.checked then
	
	ll_row = dw_2.retrieve( ls_area, ls_yyyymm,  ls_seq, is_con )	
	
elseif rb_8.checked then	
	is_con   = "%"
	
	ls_change = '%'
	
	if rb_9.checked then
		ls_change = '%'		
	else
		ls_change = '수정'		
	end if
	
	
	ll_row = dw_2.retrieve( ls_area, ls_yyyymm,  ls_seq, ls_sdate, ls_edate, is_con, ls_change )		
	
end if

if ll_row < 1 then
	MessageBox("확인","내역이 없습니다.")
else
	if rb_8.checked = false then	
		wf_fil()
	end if		
end if

cbx_prtsort.enabled = true		// 출력물 송장번호 SORT

end event

type gb_3 from w_inheritance`gb_3 within w_ocshipdemand_r
integer x = 2871
integer y = 16
integer width = 1330
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipdemand_r
integer x = 2117
integer y = 16
integer width = 741
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipdemand_r
integer x = 5431
integer y = 16
integer width = 837
integer taborder = 80
end type

type dw_2 from w_inheritance`dw_2 within w_ocshipdemand_r
integer x = 32
integer y = 420
integer width = 4535
integer height = 1628
integer taborder = 40
string title = "d_ocshipdemand_s2"
string dataobject = "d_ocshipdemand_s"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::rbuttondown;call super::rbuttondown;//
if row < 1 then return

this.scrolltorow(row)
m_dynamic lm_Addmenu
string ls_chk, ls_text, ls_value
int    li_end, li_find, li_int

DESTROY m_dynamic

choose case dwo.name
	case "do_do_no"
		lm_Addmenu = CREATE m_dynamic
		ls_text    = trim(this.object.do_do_no[row])
		if ls_text = '' or isnull(ls_text) then return
		
		ls_chk  = 'Y'
		li_find = 1
		li_int  = 0
//		Do While ls_chk = 'Y'
//			li_end = pos(ls_text, ",", li_find)
//			if li_end = 0 or isnull(li_end) then exit
//			
			ls_value = ls_text
			if trim(ls_value) = '' or isnull(ls_value) or (LenA(trim(ls_value)) <> 14) then
			else			
				li_int = li_int + 1
				lm_Addmenu.item[li_int].Text = ls_value
				lm_Addmenu.item[li_int].Tag = string(li_int)
				lm_Addmenu.item[li_int].visible = true
			end if
//		Loop
		
		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
		if lm_Addmenu.tag = "" then return
		
		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
		OpenSheet(w_oidoupdate_m,  w_o_main, 5, original!)	//	Normal!
		w_oidoupdate_m.setredraw(false)
		w_oidoupdate_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
		w_oidoupdate_m.setredraw(true)

	case else
		lm_Addmenu = CREATE m_dynamic
		ls_text    = trim(this.object.sale_no[row])
		if ls_text = '' or isnull(ls_text) then return
		
		ls_chk  = 'Y'
		li_find = 1
		li_int  = 0
		Do While ls_chk = 'Y'	// 다중 수주번호 메뉴에 등록하기
			li_end = PosA(ls_text, ",", li_find)
			if li_end = 0 or isnull(li_end) then exit
			
			ls_value = MidA(ls_text, li_find, 14)
			if trim(ls_value) = '' or isnull(ls_value) then exit
			
			li_int = li_int + 1
			lm_Addmenu.item[li_int].Text = ls_value
			lm_Addmenu.item[li_int].Tag = string(li_int)
			lm_Addmenu.item[li_int].visible = true
			li_find = li_end + 2
		Loop
		
		lm_Addmenu.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())
		if lm_Addmenu.tag = "" then return
		
		ls_value = lm_Addmenu.item[integer(lm_Addmenu.tag)].text
		OpenSheet(w_orsale_m,  w_o_main, 5, original!)
		w_orsale_m.setredraw(false)
		w_orsale_m.em_3.text = LeftA(ls_value,10) 
		w_orsale_m.em_4.text = string(integer(RightA(ls_value,3)))
		w_orsale_m.pb_cancel.postevent(clicked!)
		w_orsale_m.setredraw(true)
end choose



//m_manager.m_dynamic.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
//ls_sale = m_manager.m_dynamic.tag
//m_dynamic  lm_Addmenu
//// 메뉴추가시작
//lm_Addmenu = Create m_dynamic
//lm_Addmenu.item[1].Text = '메뉴명'
//lm_Addmenu.item[1].Tag =  '태그내용 또는 window id'
//
//// ll_level1, ll_level2는 사용가능 메뉴의 구성에 따라 적당하게 조정하셔야 합니다.         
//m_main.Item[ll_level1].Item[ll_level2] = lm_Addmenu.Item[1]
// 메뉴추가끝 - 메뉴추가시작 부분 반복 -> 사용가능한 메뉴항목까지 반복
//m_manager NewMenu
//
//NewMenu = CREATE m_manager
//m_manager.m_mpmodify.PopMenu(parentwindow().PointerX(),  parentwindow().PointerY())
//CHOOSE CASE m_manager.m_mpmodify.tag
//	CASE 'rout_D', 'rout_U'
//		gs_where istr_where
		
//		istr_where.str1 = ls_sale
//		istr_where.str2 = trim(string(this.object.seq_no[row],"###"))
//		istr_where.str3 = trim(this.object.assy_item[row])
//		istr_where.str4 = trim(this.object.groupitem_item_name[row])
//		istr_where.str5 = trim(this.object.assy_qa[row])
//		istr_where.name = trim(this.object.customer_cust_name[row])
//		
//		openwithparm(w_mpjaegoc_m, istr_where)
//
//		istr_where = message.powerobjectparm
//		if istr_where.chk = "N" then
//			return
//		end if
//		ls_wc = dw6.object.wc_no[row]
//		li_seq = dw6.object.seq_no[row]
//		ll_operation = dw6.object.operation[row]
//		ll_division = dw6.object.division[row]
//END CHOOSE

end event

event dw_2::doubleclicked;call super::doubleclicked;
if row < 1 then return
this.scrolltorow(row)

gs_where2 lst_str 
string ls_text, ls_chk, ls_sale
int li_find, li_int,li_end

ls_text = trim(this.object.sale_no[row])
if ls_text = '' or isnull(ls_text) then return
ls_chk = 'Y'
li_find = 1
li_int = 0
do while ls_chk = 'Y'
	li_end = PosA(ls_text, ",", li_find)
	if li_end = 0 or isnull(li_end) then exit
	
	ls_sale = MidA(ls_text, li_find, 14)
	if trim(ls_sale) = '' or isnull(ls_sale) then exit
	
	li_int = li_int + 1
	lst_str.str1[li_int] = ls_sale
	lst_str.str2[li_int] = "1"
	li_find = li_end + 2
loop

OpenWithParm(w_whsaleall_w, lst_str)

end event

type em_1 from editmask within w_ocshipdemand_r
integer x = 3429
integer y = 124
integer width = 366
integer height = 76
integer taborder = 150
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

event modified;//string ls_sdate, ls_edate, ls_area, ls_button_text1, ls_button_text2
//long   l_count
//
//ls_area  = left(dw_area.object.area[1],1)
//is_sdate = em_1.text
//is_edate = em_2.text
//ls_sdate = em_1.text
//ls_edate = em_2.text
//is_con   = "%"          
//		
//select count(*)
//into :l_count
//from do_carry
//where area_no = :ls_area+'0001'
//and yyyymm = SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6)
//and seq = 1;
//
//ls_button_text1 = ''
//
//select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월1차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
//into :ls_button_text1
//from dual;
//
//select count(*)
//into :l_count
//from do_carry
//where area_no = :ls_area+'0001'
//and yyyymm = SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6)
//and seq = 2;
//
//ls_button_text2 = ''
//
//select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월2차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
//into :ls_button_text2
//from dual;
//
//datawindowchild ldwc_chasu
//
//dw_4.getchild("chasu",ldwc_chasu)
//ldwc_chasu.setitem(1,"chasu", ls_button_text1)
//ldwc_chasu.setitem(2,"chasu", ls_button_text2)
//ldwc_chasu.accepttext()
//ldwc_chasu.scrolltorow(1)
//
//dw_4.object.chasu[1] = ls_button_text1

end event

type em_2 from editmask within w_ocshipdemand_r
integer x = 3808
integer y = 124
integer width = 366
integer height = 76
integer taborder = 160
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_ocshipdemand_r
integer x = 2903
integer y = 124
integer width = 521
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long l_count
string ls_button_text1, ls_button_text2, ls_area, ls_yyyymm
this.accepttext()
dw_2.reset()


ls_area = LeftA(this.object.area[1],1)
ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)


l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm = :ls_yyyymm
and seq = '1';

ls_button_text1 = ''

/*
select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월1차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
into :ls_button_text1
from dual;
*/

select   '1차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text1
from dual;


l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm =:ls_yyyymm
and seq = '2';

ls_button_text2 = ''

select   '2차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text2
from dual;

datawindowchild ldwc_chasu

dw_4.getchild("chasu",ldwc_chasu)
ldwc_chasu.setitem(1,"chasu", ls_button_text1)
ldwc_chasu.setitem(2,"chasu", ls_button_text2)
ldwc_chasu.accepttext()
ldwc_chasu.scrolltorow(1)

dw_4.object.chasu[1] = ls_button_text1
end event

type ddlb_1 from dropdownlistbox within w_ocshipdemand_r
integer x = 78
integer y = 296
integer width = 686
integer height = 628
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","운반비 0인것 제외","운반비 0인것만"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_sel = index

if rb_8.checked = false then
	wf_fil()
end if	
end event

type rb_4 from radiobutton within w_ocshipdemand_r
integer x = 2501
integer y = 300
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "대여"
end type

event clicked;// 대여
wf_fil()
end event

type rb_5 from radiobutton within w_ocshipdemand_r
integer x = 2697
integer y = 300
integer width = 197
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부담"
end type

event clicked;// 부담
wf_fil()
end event

type rb_3 from radiobutton within w_ocshipdemand_r
integer x = 2304
integer y = 300
integer width = 197
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;// 전체
wf_fil()

end event

type dw_3 from datawindow within w_ocshipdemand_r
integer x = 768
integer y = 296
integer width = 539
integer height = 88
integer taborder = 90
string dataobject = "d_whdocar_s"
boolean border = false
end type

event itemchanged;//
this.accepttext()

is_car = this.object.driver[1]

if rb_8.checked = false then
	wf_fil()
end if	

end event

type gb_4 from groupbox within w_ocshipdemand_r
integer x = 32
integer y = 244
integer width = 4535
integer height = 160
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_6 from radiobutton within w_ocshipdemand_r
integer x = 2894
integer y = 300
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "공사"
end type

event clicked;wf_fil()
end event

type rb_7 from radiobutton within w_ocshipdemand_r
integer x = 3095
integer y = 300
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "재료"
end type

event clicked;// 재료
wf_fil()
end event

type st_1 from statictext within w_ocshipdemand_r
integer x = 3342
integer y = 288
integer width = 1243
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*더블클릭=>수주조회, *오른쪽마우스=>수주관리,"
boolean focusrectangle = false
end type

event clicked;this.visible = false
end event

type ddlb_2 from dropdownlistbox within w_ocshipdemand_r
integer x = 1486
integer y = 296
integer width = 795
integer height = 300
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"운전자+운송방법+거래처명+출고번호","운송일자+운전자+출고번호"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;/*2018.10.31 jowonsuk 인덱스값을 저장하고 어떤 위에 기존, 확정에서 정렬방법 확인용 */
i_index = index

if rb_1.checked then 

	if index = 1 then
		dw_1.dataobject = 'd_ocshipclose_r'
		dw_2.dataobject = 'd_ocshipdemand_s'
	else
		dw_1.dataobject = 'd_ocshipclose_r2'
		dw_2.dataobject = 'd_ocshipdemand_s2'
	end if
	
elseif rb_2.checked then
	
	if i_index = 1 then
		dw_1.dataobject = 'd_ocshipclose_r1'
		dw_2.dataobject = 'd_ocshipdemand_s1'
	else
		dw_1.dataobject = 'd_ocshipclose_r3'
		dw_2.dataobject = 'd_ocshipdemand_s3'
	end if

elseif rb_8.checked then
	
	if i_index = 1 then
	//	dw_1.dataobject = 'd_ocshipclose_r1'
		dw_2.dataobject = 'd_ocshipdemand_s4'
	else
	//	dw_1.dataobject = 'd_ocshipclose_r3'
		dw_2.dataobject = 'd_ocshipdemand_s5'
	end if	

end if

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)

if rb_8.checked = false then
	wf_fil()
end if	


end event

type st_3 from statictext within w_ocshipdemand_r
integer x = 1335
integer y = 316
integer width = 151
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "정렬:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_ocshipdemand_r
integer x = 4590
integer y = 296
integer width = 640
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 수정/삭제"
end type

event clicked;string   ls_value
datetime ldt_shipdate
long     ll_row

if dw_2.rowcount() < 1 then RETURN

ll_row   = dw_2.getrow()
ls_value = dw_2.object.do_do_no[ll_row]
ldt_shipdate = dw_2.object.do_ship_date[ll_row]

if GF_PERMISSION("거래명세서_수정/삭제", gs_userid) = "Y" then	
	if IsValid(w_o_main) then
		OpenSheet(w_oidoupdate_m, w_o_main, 5, original!)
	else
		OpenSheet(w_oidoupdate_m, w_all_main, 5, original!)
	end if
	
	if LenA(ls_value) = 14 then		// 거래명세서 작성
		w_oidoupdate_m.setredraw(false)
		w_oidoupdate_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oidoupdate_m.cb_1.postevent(clicked!)				// 조회
		w_oidoupdate_m.setredraw(true)
	else									// 물품이동
		w_oigiaskcancel_m.setredraw(false)
		w_oigiaskcancel_m.em_1.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiaskcancel_m.pb_retrieve.postevent(clicked!)				// 조회
		w_oigiaskcancel_m.setredraw(true)
	end if
else
	if IsValid(w_o_main) then
		OpenSheet(w_oigiprint_m, w_o_main, 5, original!)
	else
		OpenSheet(w_oigiprint_m, w_all_main, 5, original!)
	end if
	
	if LenA(ls_value) = 14 then		// 거래명세서 작성
		w_oigiprint_m.setredraw(false)
		w_oigiprint_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiprint_m.pb_compute.postevent(clicked!)				// 조회
		w_oigiprint_m.setredraw(true)
	else									// 물품이동
		w_oigiaskcancel_m.setredraw(false)
		w_oigiaskcancel_m.em_1.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiaskcancel_m.pb_retrieve.postevent(clicked!)				// 조회
		w_oigiaskcancel_m.setredraw(true)
	end if
end if

end event

type st_4 from statictext within w_ocshipdemand_r
integer x = 3365
integer y = 344
integer width = 1024
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "출고번호 컬럼 =>거래명세서 수정/삭제"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocshipdemand_r
integer x = 5669
integer y = 56
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_2.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_2.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_2.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type cbx_1 from checkbox within w_ocshipdemand_r
integer x = 2153
integer y = 144
integer width = 503
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
string text = "운송구분 제외"
end type

event clicked;if rb_8.checked = true then
		ddlb_1.enabled = false
		dw_3.enabled = false
		rb_3.enabled = false
		rb_4.enabled = false
		rb_5.enabled = false
		rb_6.enabled = false
		rb_7.enabled = false		
else
	
		ddlb_1.enabled = true
		dw_3.enabled = true
		rb_3.enabled = true
		rb_4.enabled = true
		rb_5.enabled = true
		rb_6.enabled = true
		rb_7.enabled = true	

	if this.checked = true then
		ddlb_2.text = "운송일자+운전자+출고번호"
		ddlb_2.Event SelectionChanged(2)
		rb_3.checked = true
		rb_3.Event Clicked()
		ddlb_2.enabled = false
		rb_4.enabled = false
		rb_5.enabled = false
		rb_6.enabled = false
		rb_7.enabled = false
	else
		ddlb_2.enabled = true
		rb_4.enabled = true
		rb_5.enabled = true
		rb_6.enabled = true
		rb_7.enabled = true
	end if

end if
	
end event

type st_2 from statictext within w_ocshipdemand_r
integer x = 2903
integer y = 48
integer width = 521
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ocshipdemand_r
integer x = 3429
integer y = 48
integer width = 745
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
string text = "운송일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_prtsort from checkbox within w_ocshipdemand_r
integer x = 2153
integer y = 68
integer width = 672
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력물 송장번호 SORT"
end type

event clicked;// 출력물 송장번호 SORT
if rb_8.checked = false then
	if dw_1.dataobject = "d_ocshipclose_r" or dw_1.dataobject = "d_ocshipclose_r1" then
		if this.checked = true then
			dw_1.setsort( "do_do_no A" )
		else
			dw_1.setsort( "docar_name A, do_ship_flag A, customer_cust_name A, do_do_no A" )
		end if
	else
		if this.checked = true then
			dw_1.setsort( "do_do_no A" )
		else
			dw_1.setsort( "do_ship_date A, docar_name A, do_do_no A" )
		end if
	end if
	dw_1.sort()
end if


end event

type dw_4 from datawindow within w_ocshipdemand_r
integer x = 4238
integer y = 120
integer width = 750
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_button_text"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//string ls_area, ls_sdate, ls_edate
//LONG L_COUNT, l_Net
//STRING ls_button_text
//
//	ls_area  = left(dw_area.object.area[1],1)
//	ls_sdate = em_1.text
//	ls_edate = em_2.text
//	is_con   = "%"              
//
//	L_COUNT = 0
//	
//	SELECT COUNT(*)
//	into :l_count
//	FROM do_carry
//	where area_no = :ls_area+'0001'
//	and yyyymm = SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6)
//	and seq = (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END );
//	
//	IF l_count > 0 then
//		l_Net = MessageBox("알림", '확정되었습니다. 재확정하시겠습니까?', Exclamation!, OKCancel!, 2)		
//	end if
//				  
//	if l_Net = 1 then
//		
//			delete do_carry
//			where area_no = :ls_area+'0001'
//			and yyyymm = SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6)
//			and seq = (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END );
//						  
//						  
//			insert into do_carry          
//			SELECT   :ls_area+'0001' area_no
//				 ,  SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6) yyyymm
//				 , (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END ) seq
//				 ,  do.do_no                                       
//				 , do.ship_flag                                     
//				 , do.log_date
//				 , isnull(do.driver,'') driver
//				 , do.ship_amount                                                        
//				 , do.shipamt_case                                  
//				 , docar.name                                       
//				 , docar.cargo_name                                 
//				 , customer.cust_name                               
//				 , scene.scene_desc                                 
//				 , do.ship_close                                    
//				 , do.do_cash do_cash
//				 , do.do_rate                                       
//				 , do.do_total do_total
//				 , do.ship_date ship_date
//				 , do.close_user                                 
//				 , sale_no    = dbo.uf_getdosaleno(do.do_no)        
//				 , sdate      = (case when :ls_sdate = '' then '          ' else :ls_sdate end)
//				 , edate      = (case when :ls_edate = '' then '          ' else :ls_edate end)
//				 , budam_desc = do.budam_desc                    
//				 , car_gbn    = (select item_nm from codemst where type = 'car_gbn' and item_cd = do.car_gbn)
//				 , salesman   = login.user_name
//				 , area       = do.area_no
//				 , customer.register_no                               
//				 , docar.icube_no                  
//			  FROM  do with(nolock) inner join customer with(nolock) on do.cust_no = customer.cust_no
//																	 left outer  join scene with(nolock) on do.spot_code  = scene.scene_code
//																	 left outer  join docar with(nolock) on do.driver  = docar.driver 
//																	 left outer  join login with(nolock) on customer.salesman   = login.user_id
//			  
//			  WHERE  ( ( do.do_no           LIKE :ls_area + '%'        ) AND  
//					  ( convert(char(10),do.ship_date,111)    BETWEEN :ls_sdate and :ls_edate ) AND  
//					  ( do.ship_flag         IN ('D' , 'B', 'A', 'R') ) AND  
//					  ( do.ship_close      LIKE :is_con ) 
//					)   
//				 union all
//				 SELECT :ls_area+'0001' area_no
//				 , SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6) yyyymm
//				 , (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END ) seq  
//				 , ask_head.ask_no                                  
//				 , ship_flag     = 'B'               
//				 , log_date      = ask_head.ship_date                             
//				 , isnull(ask_head.driver,'') driver
//				 , ask_head.ship_amount                                                
//				 , shipamt_case  = ''                             
//				 , docar.name                                       
//				 , docar.cargo_name                                 
//				 , cust_name     = '(주)유창'                        
//				 , scene_desc    = '시화사업장'                     
//				 , ask_head.ship_close                           
//				 , 0                                                
//				 , 0                                                
//				 , 0                                                
//				 , ask_head.ship_date                                         
//				 , ask_head.close_user                           
//				 , ''                                            
//				 , sdate      = :ls_sdate
//				 , edate      = :ls_edate
//				 , budam_desc = ''                               
//				 , car_gbn    = ''  
//				 , salesman   = ''
//				 , area       = ''
//				 , register_no= ''
//				 , docar.icube_no                                 
//			
//			  FROM ask_head with(nolock) left outer join docar with(nolock) on ask_head.driver  = docar.driver     
//			  WHERE  ( 
//									  ( :ls_area                  = 'S'                   ) and  
//									  ( convert(char(10),ask_head.ship_date,111)  BETWEEN :ls_sdate and :ls_edate ) and  
//									  (  ask_head.ship_close    LIKE :is_con              ) 
//								  ) 
//			 union all
//			  SELECT :ls_area+'0001' area_no
//				 , SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6) yyyymm
//				 , (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END ) seq
//				 , (case when doshipetc.do_no is not null then doshipetc.do_no else dbo.uf_getdatestring(doshipetc.etc_date) end ) do_no
//				 , doshipetc.ship_flag           
//				 , log_date   = doshipetc.etc_date              
//				 , isnull(doshipetc.driver, '') driver
//				 , doshipetc.ship_amount                                             
//				 , doshipetc.shipamt_case                           
//				 , doshipetc.drv_name                               
//				 , doshipetc.cargo_name                             
//				 , customer.cust_name                               
//				 , scene.scene_desc                                 
//				 , doshipetc.ship_close                             
//				 , 0                                                
//				 , 0                                                
//				 , 0                                                
//				 , doshipetc.etc_date                               
//				 , doshipetc.user_id                             
//				 , doshipetc.sale_no
//				 , sdate      = :ls_sdate
//				 , edate      = :ls_edate
//				 , budam_desc = do.budam_desc                    
//				 , car_gbn    = (select item_nm from codemst where type = 'car_gbn' and item_cd = do.car_gbn)       
//				 , salesman   = login.user_name
//				 , area       = doshipetc.etc_area
//				 , customer.register_no                               
//				 , docar.icube_no        
//			from doshipetc with(nolock) inner join customer with(nolock) on doshipetc.cust_no          = customer.cust_no
//												  left outer join scene with(nolock) on doshipetc.scene_code   = scene.scene_code
//												  left outer join docar with(nolock) on doshipetc.driver            = docar.driver
//												  left outer join login with(nolock) on customer.salesman       = login.user_id
//												  left outer join do with(nolock) on doshipetc.do_no                =  do.do_no
//			WHERE 
//				(
//					  ( doshipetc.etc_area      LIKE :ls_area + '%'        ) and  
//					  ( convert(char(10),doshipetc.etc_date,111)   BETWEEN :ls_sdate and :ls_edate ) and  
//					  ( doshipetc.ship_close    LIKE :is_con              ) and
//					  ( doshipetc.doship_req       = 'Y'                   )
//				) ;
//				
//		commit;
//		
//		messagebox('알림', '확정했습니다.')
//	
//		L_COUNT = 0
//		
//		select count(*)
//		into :l_count
//		from do_carry
//		where area_no = :ls_area+'0001'
//		and yyyymm = SUBSTRING( REPLACE(:ls_sdate,'/', ''), 1, 6)
//		and seq = (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END );
//		
//		select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월' + (CASE WHEN SUBSTRING( REPLACE(:ls_sdate,'/', ''), 7, 2) = '01' THEN '1' ELSE '2' END )+'차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
//		into :ls_button_text
//		from dual;
//		
//		dw_4.object.b_button_text.text = ls_button_text
//		
//	end if	
end event

type cb_2 from commandbutton within w_ocshipdemand_r
integer x = 5015
integer y = 44
integer width = 366
integer height = 160
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확정생성"
end type

event clicked;string ls_area, ls_sdate, ls_edate, ls_month, ls_yyyymm, ls_seq, ls_day
LONG L_COUNT, l_Net
STRING ls_button_text


	ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
	ls_day         = em_yyyymm.text
	
	if LeftA(dw_4.object.chasu[1],1) = '1' then
		ls_seq = '1'
	else
		ls_seq = '2'
	end if
	
	ls_area  = LeftA(dw_area.object.area[1],1)
	is_con   = "%"              

	if ls_seq = '1' then /* 1차 */
		select :ls_day+'/01', :ls_day+'/15'
		into :ls_sdate, :ls_edate
		from dual;
	else						    /* 2차 */	
		select :ls_day+'/16',  convert(char(10), dateadd(day,-1, dateadd( month,1, convert(datetime, :ls_day+'/01') ) ),111 )
		into :ls_sdate, :ls_edate
		from dual;		
	end if

	L_COUNT = 0
	
	SELECT COUNT(*)
	into :l_count
	FROM do_carry
	where area_no = :ls_area+'0001'
	and yyyymm = :ls_yyyymm
	and seq =:ls_seq;
	
	IF l_count > 0 then
		l_Net = MessageBox("알림", '확정되었습니다. 재확정하시겠습니까?', Exclamation!, OKCancel!, 2)		
	elseif l_count = 0 then
		l_Net = 1
	end if
				  
	if l_Net = 1 then
		
			delete do_carry
			where area_no = :ls_area+'0001'
			and yyyymm = :ls_yyyymm
			and seq = :ls_seq;
						  
						  
			insert into do_carry          
			SELECT   :ls_area+'0001' area_no
				 , :ls_yyyymm yyyymm
				 , :ls_seq seq
				 ,  do.do_no                                       
				 , do.ship_flag                                     
				 , do.log_date
				 , isnull(do.driver,'') driver
				 , do.ship_amount                                                        
				 , do.shipamt_case                                  
				 , docar.name                                       
				 , docar.cargo_name          
				 , do.cust_no
				 , customer.cust_name                               
				 , scene.scene_desc                                 
				 , do.ship_close                                    
				 , do.do_cash do_cash
				 , do.do_rate                                       
				 , do.do_total do_total
				 , do.ship_date ship_date
				 , do.close_user                                 
				 , sale_no    = dbo.uf_getdosaleno(do.do_no)        
				 , sdate      = (case when :ls_sdate = '' then '          ' else :ls_sdate end)
				 , edate      = (case when :ls_edate = '' then '          ' else :ls_edate end)
				 , budam_desc = do.budam_desc                    
				 , car_gbn    = (select item_nm from codemst where type = 'car_gbn' and item_cd = do.car_gbn)
				 , salesman   = login.user_name
				 , area       = do.area_no
				 , customer.register_no                               
				 , docar.icube_no                  
			  FROM  do with(nolock) inner join customer with(nolock) on do.cust_no = customer.cust_no
																	 left outer  join scene with(nolock) on do.spot_code  = scene.scene_code
																	 left outer  join docar with(nolock) on do.driver  = docar.driver 
																	 left outer  join login with(nolock) on customer.salesman   = login.user_id
			  
			  WHERE  ( ( do.do_no           LIKE :ls_area + '%'        ) AND  
					  ( convert(char(10),do.ship_date,111)    BETWEEN :ls_sdate and :ls_edate ) AND  
					  ( do.ship_flag         IN ('D' , 'B', 'A', 'R') ) AND  
					  ( do.ship_close      LIKE :is_con ) 
					)
				 union all
				 SELECT :ls_area+'0001' area_no
				 , :ls_yyyymm yyyymm
				 , :ls_seq seq  
				 , ask_head.ask_no                                  
				 , ship_flag     = 'B'               
				 , log_date      = ask_head.ship_date                             
				 , isnull(ask_head.driver,'') driver
				 , ask_head.ship_amount                                                
				 , shipamt_case  = ''                             
				 , docar.name                                       
				 , docar.cargo_name            
 				 , null cust_no
				 , cust_name     = '(주)유창'                        
				 , scene_desc    = '시화사업장'                     
				 , ask_head.ship_close                           
				 , 0                                                
				 , 0                                                
				 , 0                                                
				 , ask_head.ship_date                                         
				 , ask_head.close_user                           
				 , ''                                            
				 , sdate      = :ls_sdate
				 , edate      = :ls_edate
				 , budam_desc = ''                               
				 , car_gbn    = ''  
				 , salesman   = ''
				 , area       = ''
				 , register_no= ''
				 , docar.icube_no                                 			
			  FROM ask_head with(nolock) left outer join docar with(nolock) on ask_head.driver  = docar.driver     
			  WHERE  ( 
									  ( :ls_area                  = 'S'                   ) and  
									  ( convert(char(10),ask_head.ship_date,111)  BETWEEN :ls_sdate and :ls_edate ) and  
									  (  ask_head.ship_close    LIKE :is_con              ) 
								  ) 
			 union all
			  SELECT :ls_area+'0001' area_no
				 , :ls_yyyymm yyyymm
				 , :ls_seq seq
				 , (case when doshipetc.do_no is not null then doshipetc.do_no else dbo.uf_getdatestring(doshipetc.etc_date) end ) do_no
				 , doshipetc.ship_flag           
				 , log_date   = doshipetc.etc_date              
				 , isnull(doshipetc.driver, '') driver
				 , doshipetc.ship_amount                                             
				 , doshipetc.shipamt_case                           
				 , doshipetc.drv_name                               
				 , doshipetc.cargo_name   
				 , doshipetc.cust_no
				 , customer.cust_name                               
				 , scene.scene_desc                                 
				 , doshipetc.ship_close                             
				 , 0                                                
				 , 0                                                
				 , 0                                                
				 , doshipetc.etc_date                               
				 , doshipetc.user_id                             
				 , doshipetc.sale_no
				 , sdate      = :ls_sdate
				 , edate      = :ls_edate
				 , budam_desc = do.budam_desc                    
				 , car_gbn    = (select item_nm from codemst where type = 'car_gbn' and item_cd = do.car_gbn)       
				 , salesman   = login.user_name
				 , area       = doshipetc.etc_area
				 , customer.register_no                               
				 , docar.icube_no        
			from doshipetc with(nolock) inner join customer with(nolock) on doshipetc.cust_no          = customer.cust_no
												  left outer join scene with(nolock) on doshipetc.scene_code   = scene.scene_code
												  left outer join docar with(nolock) on doshipetc.driver            = docar.driver
												  left outer join login with(nolock) on customer.salesman       = login.user_id
												  left outer join do with(nolock) on doshipetc.do_no                =  do.do_no
			WHERE 
				(
					  ( doshipetc.etc_area      LIKE :ls_area + '%'        ) and  
					  ( convert(char(10),doshipetc.etc_date,111)   BETWEEN :ls_sdate and :ls_edate ) and  
					  ( doshipetc.ship_close    LIKE :is_con              ) and
					  ( doshipetc.doship_req       = 'Y'                   )
				) ;
				
		commit;
		
		messagebox('알림', '확정했습니다.')
	
		L_COUNT = 0
		
		string ls_button_text1, ls_button_text2
		
		ls_area  = LeftA(dw_area.object.area[1],1)
		ls_sdate = em_1.text
		ls_edate = em_2.text
		is_con   = "%"          
				
		select count(*)
		into :l_count
		from do_carry
		where area_no = :ls_area+'0001'
		and yyyymm = :ls_yyyymm
		and seq = '1';
		
		ls_button_text1 = ''
		
		select   '1차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
		into :ls_button_text1
		from dual;
		
		select count(*)
		into :l_count
		from do_carry
		where area_no = :ls_area+'0001'
		and yyyymm = :ls_yyyymm
		and seq = '2';
		
		ls_button_text2 = ''
		
		select   '2차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
		into :ls_button_text2
		from dual;
		
		datawindowchild ldwc_chasu
		
		dw_4.getchild("chasu",ldwc_chasu)
		ldwc_chasu.setitem(1,"chasu", ls_button_text1)
		ldwc_chasu.setitem(2,"chasu", ls_button_text2)
		ldwc_chasu.accepttext()
		ldwc_chasu.scrolltorow(1)
		
		dw_4.object.chasu[1] = ls_button_text1
		
	end if	
end event

type em_yyyymm from editmask within w_ocshipdemand_r
integer x = 4622
integer y = 44
integer width = 366
integer height = 76
integer taborder = 170
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
string mask = "yyyy/mm"
boolean autoskip = true
end type

event modified;string ls_sdate, ls_edate, ls_area, ls_button_text1, ls_button_text2, ls_yyyymm
long   l_count

ls_area  = LeftA(dw_area.object.area[1],1)
ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
is_con   = "%"          

l_count = 0
		
select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm = :ls_yyyymm
and seq = '1';

ls_button_text1 = ''

/*
select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월1차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
into :ls_button_text1
from dual;
*/

select   '1차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text1
from dual;

l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm =:ls_yyyymm
and seq = '2';

ls_button_text2 = ''

select   '2차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text2
from dual;

datawindowchild ldwc_chasu

dw_4.getchild("chasu",ldwc_chasu)
ldwc_chasu.setitem(1,"chasu", ls_button_text1)
ldwc_chasu.setitem(2,"chasu", ls_button_text2)
ldwc_chasu.accepttext()
ldwc_chasu.scrolltorow(1)

dw_4.object.chasu[1] = ls_button_text1

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

string ls_sdate, ls_edate, ls_area, ls_button_text1, ls_button_text2, ls_yyyymm
long   l_count

ls_area  = LeftA(dw_area.object.area[1],1)
ls_yyyymm = LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
is_con   = "%"          

l_count = 0
		
select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm = :ls_yyyymm
and seq = '1';

ls_button_text1 = ''

/*
select   rtrim(ltrim(convert(char(2), convert(numeric, SUBSTRING( REPLACE(:ls_sdate,'/', ''), 5, 2))))) + '월1차' + (case when :l_count > 0 then ' 확정함' else ' 미확정' end )
into :ls_button_text1
from dual;
*/

select   '1차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text1
from dual;

l_count = 0

select count(*)
into :l_count
from do_carry
where area_no = :ls_area+'0001'
and yyyymm =:ls_yyyymm
and seq = '2';

ls_button_text2 = ''

select   '2차' + (case when :l_count > 0 then ' [확정함]' else ' [미확정]' end )
into :ls_button_text2
from dual;

datawindowchild ldwc_chasu

dw_4.getchild("chasu",ldwc_chasu)
ldwc_chasu.setitem(1,"chasu", ls_button_text1)
ldwc_chasu.setitem(2,"chasu", ls_button_text2)
ldwc_chasu.accepttext()
ldwc_chasu.scrolltorow(1)

dw_4.object.chasu[1] = ls_button_text1

end event

type st_6 from statictext within w_ocshipdemand_r
integer x = 4238
integer y = 44
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
long backcolor = 15780518
string text = "확정년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocshipdemand_r
integer x = 1463
integer y = 68
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "실시간"
boolean checked = true
end type

event clicked;if i_index = 1 then
	dw_1.dataobject = 'd_ocshipclose_r'
	dw_2.dataobject = 'd_ocshipdemand_s'
else
	dw_1.dataobject = 'd_ocshipclose_r2'
	dw_2.dataobject = 'd_ocshipdemand_s2'
end if

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
 wf_fil()
 
 ddlb_1.enabled = true
dw_3.enabled = true
rb_3.enabled = true
rb_4.enabled = true
rb_5.enabled = true
rb_6.enabled = true
rb_7.enabled = true
pb_print.enabled = true

ddlb_1.visible = true
dw_3.visible = true
rb_3.visible = true
rb_4.visible = true
rb_5.visible = true
rb_6.visible = true
rb_7.visible = true

rb_9.visible = false
rb_10.visible = false
end event

type rb_2 from radiobutton within w_ocshipdemand_r
integer x = 1463
integer y = 136
integer width = 315
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "확정분"
end type

event clicked;if i_index = 1 then
	dw_1.dataobject = 'd_ocshipclose_r1'
	dw_2.dataobject = 'd_ocshipdemand_s1'
else
	dw_1.dataobject = 'd_ocshipclose_r3'
	dw_2.dataobject = 'd_ocshipdemand_s3'
end if

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
 wf_fil()
 
 ddlb_1.enabled = true
dw_3.enabled = true
rb_3.enabled = true
rb_4.enabled = true
rb_5.enabled = true
rb_6.enabled = true
rb_7.enabled = true
pb_print.enabled = true

ddlb_1.visible = true
dw_3.visible = true
rb_3.visible = true
rb_4.visible = true
rb_5.visible = true
rb_6.visible = true
rb_7.visible = true

rb_9.visible = false
rb_10.visible = false
end event

type rb_8 from radiobutton within w_ocshipdemand_r
integer x = 1806
integer y = 136
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "비교"
end type

event clicked;if i_index = 1 then
//	dw_1.dataobject = 'd_ocshipclose_r1'
	dw_2.dataobject = 'd_ocshipdemand_s4'
else
//	dw_1.dataobject = 'd_ocshipclose_r3'
	dw_2.dataobject = 'd_ocshipdemand_s5'
end if

dw_2.settransobject(sqlca)
// wf_fil()
	
ddlb_1.enabled = false
dw_3.enabled = false
rb_3.enabled = false
rb_4.enabled = false
rb_5.enabled = false
rb_6.enabled = false
rb_7.enabled = false
pb_print.enabled = true

ddlb_1.visible = false
dw_3.visible = false
rb_3.visible = false
rb_4.visible = false
rb_5.visible = false
rb_6.visible = false
rb_7.visible = false

rb_9.visible = true
rb_10.visible = true


rb_9.x = 2304
rb_9.y = 300

rb_10.x = 2510
rb_10.y = 300

string ls_seq, ls_sdate, ls_edate, ls_day, ls_yyyymm

ls_yyyymm =  LeftA(em_yyyymm.text,4) + RightA(em_yyyymm.text,2)
ls_day         =  em_yyyymm.text


if LeftA(dw_4.object.chasu[1],1) = '1' then
	ls_seq = '1'
else
	ls_seq = '2'
end if

if ls_seq = '1' then /* 1차 */
	select :ls_day+'/01', :ls_day+'/15'
	into :ls_sdate, :ls_edate
	from dual;
else						    /* 2차 */	
	select :ls_day+'/16',  convert(char(10), dateadd(day,-1, dateadd( month,1, convert(datetime, :ls_day+'/01') ) ),111 )
	into :ls_sdate, :ls_edate
	from dual;		
end if

em_1.text = ls_sdate
em_2.text = ls_edate

end event

type rb_9 from radiobutton within w_ocshipdemand_r
boolean visible = false
integer x = 2304
integer y = 548
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

type rb_10 from radiobutton within w_ocshipdemand_r
boolean visible = false
integer x = 2510
integer y = 548
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수정분"
end type

type gb_5 from groupbox within w_ocshipdemand_r
integer x = 4206
integer y = 12
integer width = 1202
integer height = 208
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_6 from groupbox within w_ocshipdemand_r
integer x = 1435
integer y = 8
integer width = 667
integer height = 216
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력선택"
end type

