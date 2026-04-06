$PBExportHeader$w_mpsfcday_r.srw
$PBExportComments$생산일보 조회(1998/05/06, 이인호)
forward
global type w_mpsfcday_r from w_inheritance
end type
type tab_1 from tab within w_mpsfcday_r
end type
type tabpage_1 from userobject within tab_1
end type
type rb_6 from radiobutton within tabpage_1
end type
type rb_5 from radiobutton within tabpage_1
end type
type rb_4 from radiobutton within tabpage_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type cbx_rate from checkbox within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cbx_rate cbx_rate
st_5 st_5
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type st_vertical from u_splitbar_vertical within tabpage_2
end type
type dw_9 from datawindow within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type rb_all from radiobutton within tabpage_2
end type
type rb_day from radiobutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_vertical st_vertical
dw_9 dw_9
dw_4 dw_4
rb_all rb_all
rb_day rb_day
end type
type tabpage_3 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_4 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_4
end type
type pb_3 from picturebutton within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type em_calc from editmask within tabpage_4
end type
type pb_4 from picturebutton within tabpage_4
end type
type cbx_7 from checkbox within tabpage_4
end type
type cbx_edit from checkbox within tabpage_4
end type
type cbx_all from checkbox within tabpage_4
end type
type dw_7 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cbx_1 cbx_1
pb_3 pb_3
dw_8 dw_8
em_calc em_calc
pb_4 pb_4
cbx_7 cbx_7
cbx_edit cbx_edit
cbx_all cbx_all
dw_7 dw_7
end type
type tab_1 from tab within w_mpsfcday_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type gb_15 from groupbox within w_mpsfcday_r
end type
type em_1 from editmask within w_mpsfcday_r
end type
type em_2 from editmask within w_mpsfcday_r
end type
type dw_area from datawindow within w_mpsfcday_r
end type
type dw_5 from datawindow within w_mpsfcday_r
end type
type pb_1 from picturebutton within w_mpsfcday_r
end type
type pb_2 from picturebutton within w_mpsfcday_r
end type
type cbx_2 from checkbox within w_mpsfcday_r
end type
type st_6 from statictext within w_mpsfcday_r
end type
type st_4 from statictext within w_mpsfcday_r
end type
type ddlb_fld from dropdownlistbox within w_mpsfcday_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcday_r
end type
type st_3 from statictext within w_mpsfcday_r
end type
type ddlb_op from dropdownlistbox within w_mpsfcday_r
end type
type sle_value from singlelineedit within w_mpsfcday_r
end type
type cb_3 from commandbutton within w_mpsfcday_r
end type
type cb_1 from commandbutton within w_mpsfcday_r
end type
type cb_5 from commandbutton within w_mpsfcday_r
end type
type cb_6 from commandbutton within w_mpsfcday_r
end type
end forward

global type w_mpsfcday_r from w_inheritance
integer width = 4421
integer height = 2352
string title = "생산일보 조회(w_mpsfcday_r)"
tab_1 tab_1
gb_15 gb_15
em_1 em_1
em_2 em_2
dw_area dw_area
dw_5 dw_5
pb_1 pb_1
pb_2 pb_2
cbx_2 cbx_2
st_6 st_6
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_3 st_3
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_1 cb_1
cb_5 cb_5
cb_6 cb_6
end type
global w_mpsfcday_r w_mpsfcday_r

type prototypes

end prototypes

type variables
//
datawindow dw3, dw4, dw6, dw7, dw8, dw9
datawindowchild idwc_wc
st_print i_print

string   is_dw, is_mess , is_wcno
date     id_start, id_end


end variables

on w_mpsfcday_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.gb_15=create gb_15
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.dw_5=create dw_5
this.pb_1=create pb_1
this.pb_2=create pb_2
this.cbx_2=create cbx_2
this.st_6=create st_6
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_3=create st_3
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_5=create cb_5
this.cb_6=create cb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.gb_15
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.dw_5
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_1
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.cb_6
end on

on w_mpsfcday_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.gb_15)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.cbx_2)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_3)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_5)
destroy(this.cb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_2.st_vertical.of_set_leftobject( tab_1.tabpage_2.dw_4 )
tab_1.tabpage_2.st_vertical.of_set_rightobject( tab_1.tabpage_2.dw_9 )
tab_1.tabpage_2.st_vertical.of_set_minsize(250, 250)

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
tab_1.tabpage_1.cbx_rate.visible = false

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw9 = tab_1.tabpage_2.dw_9
dw6 = tab_1.tabpage_3.dw_6
dw7 = tab_1.tabpage_4.dw_7
dw8 = tab_1.tabpage_4.dw_8

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_9.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_7.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_8.SetTransObject(SQLCA)	// 계산식 목록

tab_1.tabpage_4.dw_8.x = tab_1.tabpage_4.pb_3.x
tab_1.tabpage_4.dw_8.visible = false
tab_1.tabpage_4.dw_8.retrieve()

// 일자
em_1.text = string(RelativeDate( today(), - 7 ), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

id_start  = date(em_1.text)
id_end    = date(em_2.text)

dw_2.visible = false
dw_5.visible = false

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

// 작업장
dw_1.insertrow(1)
dw_1.getchild('wc_no',idwc_wc)

idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no','%')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.setitem(1,'area_no',  gs_area)
idwc_wc.accepttext()

idwc_wc.setfilter( "area_no = '" + gs_area + "'" )
idwc_wc.filter()
idwc_wc.setsort( "work_type A, wc_no A" )
idwc_wc.sort()
dw_1.object.wc_no[1] = "%"

is_wcno = ""

//
tab_1.tabpage_4.cbx_edit.checked = false
tab_1.tabpage_4.cbx_edit.triggerevent( clicked! )

end event

event resize;call super::resize;//
long  ll_width, ll_height

gb_2.width   = newwidth  - (gb_2.x * 2)

tab_1.width  = newwidth  - (gb_2.x * 2)
tab_1.height = newheight - tab_1.y - gb_2.x

ll_width  = tab_1.tabpage_1.width
ll_height = tab_1.tabpage_1.height

tab_1.tabpage_1.dw_3.width  = ll_width
tab_1.tabpage_1.dw_3.height = ll_height - tab_1.tabpage_1.dw_3.y

//
tab_1.tabpage_2.dw_4.width  = ll_width * 0.52
tab_1.tabpage_2.dw_4.height = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_2.st_vertical.x      = tab_1.tabpage_2.dw_4.x + tab_1.tabpage_2.dw_4.width
tab_1.tabpage_2.st_vertical.height = tab_1.tabpage_2.dw_4.height

tab_1.tabpage_2.dw_9.x      = tab_1.tabpage_2.st_vertical.x + tab_1.tabpage_2.st_vertical.width
tab_1.tabpage_2.dw_9.width  = ll_width - tab_1.tabpage_2.dw_9.x
tab_1.tabpage_2.dw_9.height = tab_1.tabpage_1.dw_3.height

//
tab_1.tabpage_3.dw_6.width  = tab_1.tabpage_1.dw_3.width
tab_1.tabpage_3.dw_6.height = tab_1.tabpage_1.dw_3.height

//
tab_1.tabpage_4.dw_7.width  = tab_1.tabpage_1.dw_3.width
tab_1.tabpage_4.dw_7.height = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_4.dw_8.x      = (tab_1.tabpage_4.dw_7.width  - tab_1.tabpage_4.dw_8.width)  / 2
tab_1.tabpage_4.dw_8.y      = (tab_1.tabpage_4.dw_7.height - tab_1.tabpage_4.dw_8.height) / 2

end event

type pb_save from w_inheritance`pb_save within w_mpsfcday_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcday_r
integer x = 1079
integer y = 136
integer width = 859
integer height = 80
integer taborder = 30
string dataobject = "d_mpwcno_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;//
long ll_row

this.accepttext()
is_wcno = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) 

if is_wcno = '전체' then is_wcno = ''


end event

type st_title from w_inheritance`st_title within w_mpsfcday_r
integer x = 0
integer y = 0
integer width = 983
integer height = 140
string text = "생산일보 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcday_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcday_r
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcday_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_mpsfcday_r
integer x = 3534
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcday_r
integer x = 3145
integer y = 60
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string ls_sql, ls_where, ls_source

if tab_1.selectedtab = 1 then
//	if tab_1.tabpage_1.rb_1.checked = true then	// 거래처별 합계
//		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
//		dw_2.dataobject  = 'd_mpsfcday_r'
//
//	elseif tab_1.tabpage_1.rb_2.checked = true then		// 작업장별 합계
//		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.top = 304'
//		dw_2.dataobject  = 'd_mpsfcday_r2'
//
//	elseif tab_1.tabpage_1.rb_3.checked = true then		// 일자별
//		// 엑셀양식으로 
//		RETURN
//		//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.top = 304'
//		//dw_2.dataobject  = 'd_mpsfcday_r3'
//
//	elseif tab_1.tabpage_1.rb_4.checked = true then		// 리스트
//		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95  DataWindow.print.margin.left = 304'
//		dw_2.dataobject  = 'd_mpsfcday_t4'
//	end if

	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_1.dw_3.sharedata(dw_2)
	
elseif tab_1.selectedtab = 2 then
	if tab_1.tabpage_2.rb_all.checked = true then
		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=85  DataWindow.print.margin.left = 304'
		dw_2.dataobject  = 'd_mpsfcday2_t'
	elseif tab_1.tabpage_2.rb_day.checked = true then
		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
	   dw_2.dataobject  = 'd_mpsfcday2_t2'
	END if
	
	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_2.dw_4.sharedata(dw_2)
	
else
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
	dw_2.dataobject  = 'd_mpsfcday_use'
	
	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_3.dw_6.sharedata(dw_2)
end if

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 생산일보 및 사용내역을 출력합니다." 

OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcday_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcday_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcday_r
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcday_r
integer x = 2953
integer y = 60
integer taborder = 80
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_wcno, ls_workno, ls_worknm, ls_itemno, ls_qa, ls_sdate, ls_edate
long   ll_row,  ll_qty, ll_ret
dec    ld_calc

// 일자
ls_sdate     = em_1.text
ls_edate     = em_2.text

// 사업장
dw_area.accepttext()
ls_area      = dw_area.object.area[1]

// 작업장
dw_1.accepttext()
ls_wcno      = dw_1.object.wc_no[1]

ls_workno    = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_no')) 
ls_worknm    = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) 
if ls_workno = "%"    then ls_workno = "%"
if ls_worknm = "전체" then ls_worknm = ""

//if left(ls_worknm, 4) = "도장" OR left(ls_worknm, 4) = "절곡" then
//	if cbx_2.checked = true then		// 물품그룹
//		tab_1.tabpage_1.dw_3.dataobject = "d_mpsfcday_t_imsi"
//	else
//		tab_1.tabpage_1.dw_3.dataobject = "d_mpsfcday_t"
//	end if
//else
//	if cbx_2.checked = true then		// 물품그룹
//		tab_1.tabpage_1.dw_3.dataobject = "d_mpsfcday_t3_imsi"
//	else
//		tab_1.tabpage_1.dw_3.dataobject = "d_mpsfcday_t3"
//	end if
//end if

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)


choose case tab_1.SelectedTab
	case 1
		ll_row = tab_1.tabpage_1.dw_3.retrieve( is_wcno, ls_sdate, ls_edate, ls_area )
		if ll_row < 1  then
			MessageBox("에러","[일일생산일보내역]~n조회한 자료가 없습니다",Exclamation!)
		end if
		
	case 2
		tab_1.tabpage_2.dw_9.reset()
//		ll_row = tab_1.tabpage_2.dw_4.retrieve( ls_area, is_wcno, em_1.text, em_2.text )
		ll_row = tab_1.tabpage_2.dw_4.retrieve( ls_area, ls_wcno, em_1.text, em_2.text )
		if ll_row < 1  then
			MessageBox("에러","[일일사용자재내역]~n조회한 자료가 없습니다",Exclamation!)
		end if
		
	case 3
		ll_row = tab_1.tabpage_3.dw_6.retrieve( ls_area, ls_worknm, em_1.text, em_2.text )
		if ll_row < 1 then
			MessageBox("에러","[생산일보 및 사용자재]~n조회한 자료가 없습니다",Exclamation!)
		end if

	case 4
		ll_row = tab_1.tabpage_4.dw_7.retrieve( is_wcno, ls_sdate, ls_edate, ls_area )
		if ll_row < 1  then
			MessageBox("확인","계산식 설정된 품목이 없습니다",Exclamation!)
		end if
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcday_r
integer x = 2002
integer y = 0
integer width = 887
integer height = 240
integer taborder = 120
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcday_r
integer y = 252
integer width = 4297
integer height = 192
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcday_r
integer x = 2907
integer y = 0
integer width = 855
integer height = 240
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcday_r
integer x = 50
integer y = 168
integer width = 101
integer height = 72
integer taborder = 70
string title = "d_mpsfcday_r3"
string dataobject = "d_mpsfcday_r3"
boolean vscrollbar = false
boolean livescroll = false
end type

type tab_1 from tab within w_mpsfcday_r
integer x = 32
integer y = 460
integer width = 4297
integer height = 1732
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4261
integer height = 1604
long backcolor = 79741120
string text = "일일생산일보내역"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "Project!"
long picturemaskcolor = 553648127
rb_6 rb_6
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cbx_rate cbx_rate
st_5 st_5
dw_3 dw_3
end type

on tabpage_1.create
this.rb_6=create rb_6
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_rate=create cbx_rate
this.st_5=create st_5
this.dw_3=create dw_3
this.Control[]={this.rb_6,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cbx_rate,&
this.st_5,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_rate)
destroy(this.st_5)
destroy(this.dw_3)
end on

type rb_6 from radiobutton within tabpage_1
boolean visible = false
integer x = 2053
integer y = 24
integer width = 480
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "생산상세내역"
boolean automatic = false
end type

event clicked;// 수주별 합계
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_t3'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_5 from radiobutton within tabpage_1
integer x = 1664
integer y = 20
integer width = 379
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "CHK리스트"
end type

event clicked;// CHK리스트
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_plansos'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_4 from radiobutton within tabpage_1
integer x = 1371
integer y = 20
integer width = 283
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "리스트"
end type

event clicked;// 리스트
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_t4'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_3 from radiobutton within tabpage_1
integer x = 1079
integer y = 20
integer width = 283
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일자별"
end type

event clicked;// 일자별
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_t3'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_2 from radiobutton within tabpage_1
integer x = 562
integer y = 20
integer width = 507
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "작업장별 합계"
end type

event clicked;// 작업장별 합계
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_t2'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_1 from radiobutton within tabpage_1
integer x = 50
integer y = 20
integer width = 503
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "거래처별 합계"
boolean checked = true
end type

event clicked;// 거래처별 합계
cbx_rate.visible = false

dw_3.dataobject = 'd_mpsfcday_t'
dw_3.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type cbx_rate from checkbox within tabpage_1
integer x = 4279
integer y = 20
integer width = 448
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "집계보기"
end type

event clicked;//

if this.checked = true then
	dw3.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw3.Modify("DataWindow.Trailer.2.Height=0")		// 출고번호 소계
//	dw3.Modify("DataWindow.Trailer.1.Height=68")	// 거래처 소계
else
	dw3.Modify("DataWindow.Detail.Height=72")		// Detail
//	dw3.Modify("DataWindow.Trailer.2.Height=68")	// 출고번호 소계
//	dw3.Modify("DataWindow.Trailer.1.Height=68")	// 거래처 소계
end if

end event

type st_5 from statictext within tabpage_1
integer x = 2789
integer y = 24
integer width = 1029
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "일자별 조회시 주야간 실적 구분함"
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_1
string tag = "d_mpsfcday_t3 d_mpsfcday_t3"
integer y = 96
integer width = 4224
integer height = 1508
integer taborder = 31
string title = "d_mpsfcday_t"
string dataobject = "d_mpsfcday_t"
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
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4261
integer height = 1604
long backcolor = 79741120
string text = "일일사용자재내역"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "ArrangeIcons!"
long picturemaskcolor = 553648127
st_vertical st_vertical
dw_9 dw_9
dw_4 dw_4
rb_all rb_all
rb_day rb_day
end type

on tabpage_2.create
this.st_vertical=create st_vertical
this.dw_9=create dw_9
this.dw_4=create dw_4
this.rb_all=create rb_all
this.rb_day=create rb_day
this.Control[]={this.st_vertical,&
this.dw_9,&
this.dw_4,&
this.rb_all,&
this.rb_day}
end on

on tabpage_2.destroy
destroy(this.st_vertical)
destroy(this.dw_9)
destroy(this.dw_4)
destroy(this.rb_all)
destroy(this.rb_day)
end on

type st_vertical from u_splitbar_vertical within tabpage_2
integer x = 3707
integer y = 96
integer height = 1508
end type

type dw_9 from datawindow within tabpage_2
integer x = 3744
integer y = 96
integer width = 535
integer height = 1508
integer taborder = 60
string title = "none"
string dataobject = "d_mpsfcday2_t3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within tabpage_2
integer y = 96
integer width = 3689
integer height = 1508
integer taborder = 1
boolean bringtotop = true
string title = "d_mpsfcday2_t2"
string dataobject = "d_mpsfcday2_t"
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
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

//
string ls_area, ls_wcno, ls_itemno, ls_qa, ls_sdate, ls_edate, ls_coilno

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

dw_1.accepttext()
ls_wcno  = dw_1.object.wc_no[1]

if rb_all.checked = true then
	ls_sdate  = em_1.text
	ls_edate  = em_2.text
	ls_coilno = this.object.coil_no[this.getrow()]
else
	ls_sdate  = this.object.cdate[this.getrow()]
	ls_edate  = this.object.cdate[this.getrow()]
	ls_coilno = "%"
end if

ls_itemno = this.object.item_no[this.getrow()]
ls_qa     = this.object.qa[this.getrow()]

dw_9.retrieve( ls_area, is_wcno, ls_itemno, ls_qa, ls_coilno, ls_sdate, ls_edate )

end event

type rb_all from radiobutton within tabpage_2
integer x = 41
integer y = 12
integer width = 256
integer height = 72
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
boolean checked = true
end type

event clicked;//
dw_4.dataobject = 'd_mpsfcday2_t'
dw_4.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type rb_day from radiobutton within tabpage_2
integer x = 302
integer y = 12
integer width = 288
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일자별"
end type

event clicked;//
dw_4.dataobject = 'd_mpsfcday2_t2'
dw_4.SetTransObject(SQLCA)

pb_retrieve.triggerevent('clicked')

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4261
integer height = 1604
long backcolor = 78160032
string text = "생산일보 및 사용자재"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "CrossTab!"
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_3.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_3.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_3
integer y = 96
integer width = 4224
integer height = 1508
integer taborder = 20
string title = "none"
string dataobject = "d_mpsfcday_use"
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
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4261
integer height = 1604
long backcolor = 78160032
string text = "계산식설정"
long tabtextcolor = 128
long tabbackcolor = 78160032
string picturename = "Custom043!"
long picturemaskcolor = 536870912
cbx_1 cbx_1
pb_3 pb_3
dw_8 dw_8
em_calc em_calc
pb_4 pb_4
cbx_7 cbx_7
cbx_edit cbx_edit
cbx_all cbx_all
dw_7 dw_7
end type

on tabpage_4.create
this.cbx_1=create cbx_1
this.pb_3=create pb_3
this.dw_8=create dw_8
this.em_calc=create em_calc
this.pb_4=create pb_4
this.cbx_7=create cbx_7
this.cbx_edit=create cbx_edit
this.cbx_all=create cbx_all
this.dw_7=create dw_7
this.Control[]={this.cbx_1,&
this.pb_3,&
this.dw_8,&
this.em_calc,&
this.pb_4,&
this.cbx_7,&
this.cbx_edit,&
this.cbx_all,&
this.dw_7}
end on

on tabpage_4.destroy
destroy(this.cbx_1)
destroy(this.pb_3)
destroy(this.dw_8)
destroy(this.em_calc)
destroy(this.pb_4)
destroy(this.cbx_7)
destroy(this.cbx_edit)
destroy(this.cbx_all)
destroy(this.dw_7)
end on

type cbx_1 from checkbox within tabpage_4
integer x = 1134
integer y = 24
integer width = 238
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "규격"
end type

type pb_3 from picturebutton within tabpage_4
integer x = 581
integer y = 4
integer width = 370
integer height = 88
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식목록"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
string ls_wcno, ls_wcname
long   ll_row, ll_chk

ll_chk = 0
for ll_row = 1 to dw_7.rowcount()
	if dw_7.object.chk[ll_row] = "Y" then
		ll_chk = ll_chk + 1
		EXIT
	end if
next

if ll_chk = 0 then 
	MessageBox("확인","대상 품목의 첫번째 컬럼을 선택 하시기 바랍니다.")
	RETURN
end if

ls_wcno  = dw_1.object.wc_no[1]
//SELECT work_name INTO :ls_wcname FROM wc WHERE wc_no = :ls_wcno;
if ls_wcno = "B01" then
	ls_wcname = "절곡반"
else
	ls_wcname = "도장반"
end if

tab_1.tabpage_4.dw_8.visible = true
tab_1.tabpage_4.dw_8.setfilter("item_nm ='" + ls_wcname + "'")
tab_1.tabpage_4.dw_8.filter()

end event

type dw_8 from datawindow within tabpage_4
string tag = "d_cditemcalc_pub_c"
integer x = 1262
integer y = 332
integer width = 2441
integer height = 920
integer taborder = 70
boolean titlebar = true
string title = "계산식(TYPE)"
string dataobject = "d_cdcalc_pub_list"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
string icon = "Information!"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if this.rowcount() < 1 then RETURN

tab_1.tabpage_4.em_calc.text = string(dw_8.object.sort[row])

dw_8.visible = false

end event

event doubleclicked;//
string ls_sort

if isnull(row) OR row < 1 then RETURN

ls_sort = string(dw_8.object.sort[row])

tab_1.tabpage_4.em_calc.text = ls_sort

tab_1.tabpage_4.cbx_7.checked = true
tab_1.tabpage_4.cbx_7.triggerevent( clicked! )

this.visible = false
MessageBox("확인","확인 후 계산식저장 버튼을 클릭하시기 바랍니다.", Exclamation!)

end event

type em_calc from editmask within tabpage_4
integer x = 965
integer y = 12
integer width = 146
integer height = 76
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
string mask = "#0"
end type

type pb_4 from picturebutton within tabpage_4
integer x = 1623
integer y = 4
integer width = 343
integer height = 88
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식저장"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;/*
  1. CODEMST(계산식_관리(도장,절곡) 계산식 등록
  2. UF_GetItemCalc_PUB, UF_GetItemCalc_PUB2 SQL 함수 등록

  IF @item_no = 'PZAARMDB0Z' AND @qa4 = 0            BEGIN /* R-몰딩(도장) 3가지 계산식 */
  IF @item_no = 'PZZZACCZZZ' AND @qa4 = 0            BEGIN /* SELF-CLEANING COATING 에서 길이가 = ZERO */
  IF substring(@item_no,1,6) = 'PCWSVR' AND @qa4 = 0 BEGIN /* 스마트패널(벽체용) 류에서 길이가 = ZERO */
  IF charindex('STL 절곡판넬', @item_name) > 0 AND @qa4 = 0 BEGIN    /* STL 절곡판넬 류에서 길이가 = ZERO */
  
  PS: 품목하나에 규격별로 여러가지 계산식이 존재할 경우는 함수에서 별도처리
      품목에 하나의 계산식이 존재할 경우 자유규격('999X9999X9999X99999') 만 등록
*/
dec    ld_value
int    li_calc
long   ll_row, ll_qty, ll_cnt, ll_item999
string ls_chk, ls_workno,  ls_itemno, ls_itemnm, ls_qa, ls_formula, ls_errtext

if MessageBox("확인","계산식을 저장 하시겠습니까?", Exclamation!, OKCancel!, 1) = 2 then RETURN

debugbreak()

ll_cnt  = 0
dw_7.accepttext()

for ll_row = dw_7.rowcount() to 1 step -1
	ls_chk     = dw_7.object.chk[ll_row] 		   // 선택
	ls_formula = dw_7.object.formula[ll_row]		// 계산식
	
	if ls_formula = "" OR isnull(ls_formula) then
	else
		if ls_chk = "Y" then
			ls_workno   = dw_7.object.wc_no[ll_row] 
			ls_itemno   = dw_7.object.item_no[ll_row]
			if cbx_1.checked = true then
				ls_qa    = "999X9999X9999X99999"
			else
				ls_qa    = dw_7.object.qa[ll_row]
			end if
			
			ls_itemnm   = dw_7.object.item_name[ll_row]		
			li_calc     = integer(em_calc.text)
			ll_qty      = dw_7.object.qty[ll_row]	
			ls_formula  = ""
			
	      SELECT bigo INTO :ls_formula FROM codemst 
			 WHERE type = '계산식_관리(도장,절곡)' AND item_cd = :ls_workno AND sort = :li_calc;
			
			// 품목의 자유규격이 존재하면 등록안함 
			ll_item999  = 0
			SELECT count(*) INTO :ll_item999  
			  FROM itemcalc_pub a
			       LEFT OUTER JOIN groupitem b  ON a.item_no = b.item_no
			 WHERE a.work_no = :ls_workno  AND a.item_no = :ls_itemno AND a.qa = '999X9999X9999X99999';
			/*
            AND NOT ( a.item_no = 'PZAARMDB0Z' OR a.item_no = 'PZZZACCZZZ' OR substring(a.item_no,1,6) = 'PCWSVR' OR
                      charindex('STL 절곡판넬', b.item_name) > 0
                    );
         */
			if ll_item999 = 0 then
				INSERT INTO itemcalc_pub (work_no, item_no, qa, item_name, formula, calc)
				VALUES (:ls_workno, :ls_itemno, :ls_qa, :ls_itemnm, :ls_formula, :li_calc);
				if SQLCA.SQLCode = 0 then
					COMMIT;
					ll_cnt = ll_cnt + 1
				else
					ls_errtext = SQLCA.SQLErrText
					ROLLBACK;
					MessageBox("확인","계산식 저장 중 ERROR가 발생하였습니다.~n~n" + ls_errtext)						
				end if
			else
				MessageBox("확인","품목의 자유규격('999X9999X9999X99999')이 이미 존재함")
			end if
	
			dw_7.scrolltorow(ll_row)			
		end if
	end if
next

cbx_1.checked = false
if ll_cnt > 0 then
	if MessageBox("확인",string(ll_cnt,"#,##0") + "건 저장완료. 다시 조회합니까?", Exclamation!, OKCancel!, 1) = 1 then
		pb_retrieve.triggerevent( clicked! )
	end if
else
	MessageBox("확인","저장된 품목이 없습니다.", Exclamation!)
end if

end event

type cbx_7 from checkbox within tabpage_4
integer x = 1381
integer y = 24
integer width = 242
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "적용"
end type

event clicked;//
long   ll_row, ll_find, ll_calc, ll_qty, ll_chk
dec    ld_calvalue
string ls_workno, ls_itemno, ls_qa, ls_formula

if this.checked = true then
	for ll_row = 1 to dw_7.rowcount()
		if dw_7.object.chk[ll_row]  = "Y" then
			ll_chk = ll_chk + 1
		end if
	next
	if ll_chk < 1 then 
		MessageBox("확인","적용대상을 먼저 선택하시기 바랍니다.", Exclamation!)
		this.checked = false
		RETURN
	end if
	
	//
	ll_calc    = integer(em_calc.text)
	ll_find    = dw_8.find( "sort = "+string(ll_calc)+"", 1, dw_8.rowcount() )
	if ll_find > 0 then
		ls_formula = dw_8.object.bigo[ll_find]
	end if

	for ll_row = 1 to dw_7.rowcount()
		if dw_7.object.chk[ll_row] = "Y" then
			ls_workno   = dw_7.object.wc_no[ll_row] 
			ls_itemno   = dw_7.object.item_no[ll_row]
			ls_qa       = dw_7.object.qa[ll_row]
			ll_qty      = dw_7.object.qty[ll_row]
			if ll_qty = 0 then ll_qty = 1

			SELECT top 1 dbo.UF_GetItemCalc_PUB2(:ls_workno, :ls_itemno, :ls_qa, :ll_qty, :ll_calc) 
			  INTO :ld_calvalue 
			  FROM itemcalc_pub;
			if ld_calvalue < 1 then
				MessageBox("확인","[UF_GetItemCalc_PUB2] 해당하는 계산식이 존재하지 않습니다.")
			else
				dw_7.object.calvalue[ll_row] = ld_calvalue		
				dw_7.object.calc[ll_row]     = ll_calc		
				dw_7.object.formula[ll_row]  = ls_formula				
			end if
		end if
	next
	
	this.checked = false
end if

end event

type cbx_edit from checkbox within tabpage_4
integer x = 343
integer y = 24
integer width = 242
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "편집"
end type

event clicked;//
if this.checked = true then	// 편집모드
	tab_1.tabpage_4.dw_7.object.calc.protect  = false
else
	tab_1.tabpage_4.dw_7.object.calc.protect  = true
end if

end event

type cbx_all from checkbox within tabpage_4
integer x = 41
integer y = 24
integer width = 238
integer height = 56
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

event clicked;long ll_row

for ll_row = 1 to dw_7.rowcount()
	if this.checked = true then
		dw_7.object.chk[ll_row] = "Y"
	else
		dw_7.object.chk[ll_row] = "N"
	end if
next
end event

type dw_7 from datawindow within tabpage_4
integer y = 96
integer width = 4224
integer height = 1508
integer taborder = 20
string title = "none"
string dataobject = "d_mpsfcday_calc_check"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

end event

type gb_15 from groupbox within w_mpsfcday_r
integer x = 1042
integer width = 937
integer height = 240
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type em_1 from editmask within w_mpsfcday_r
integer x = 2030
integer y = 52
integer width = 425
integer height = 76
integer taborder = 10
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

event modified;id_start = date(this.text)

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

end event

type em_2 from editmask within w_mpsfcday_r
integer x = 2030
integer y = 136
integer width = 425
integer height = 76
integer taborder = 20
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

event modified;id_end = date(this.text)

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

end event

type dw_area from datawindow within w_mpsfcday_r
integer x = 1294
integer y = 52
integer width = 521
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

/////////////////////////////////////
// 사업장변경시 작업장 필터링
/////////////////////////////////////
DataWindowChild ldwc_wc1
string ls_area

ls_area = trim(data)

// 작업 필터링
dw_1.getchild("wc_no", ldwc_wc1)
ldwc_wc1.settransobject(sqlca)
ldwc_wc1.setfilter( "wc_no = '%' OR area_no = '" + ls_area + "'" )
ldwc_wc1.filter()
ldwc_wc1.setsort( "work_type A, wc_no A" )
ldwc_wc1.sort()

end event

type dw_5 from datawindow within w_mpsfcday_r
integer x = 192
integer y = 168
integer width = 105
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcday_t4_ex"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_mpsfcday_r
event mousemove pbm_mousemove
integer x = 3337
integer y = 60
integer width = 187
integer height = 144
integer taborder = 70
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

choose case tab_1.SelectedTab
	case 1
		if tab_1.tabpage_1.rb_5.checked = true then	// 리스트
			dw_dest = dw_5
		else
			dw_dest = tab_1.tabpage_1.dw_3
		end if
	
	case 2
		dw_dest = tab_1.tabpage_2.dw_4

	case 3
		dw_dest = tab_1.tabpage_3.dw_6		

	case 4
		if tab_1.tabpage_4.dw_8.visible = true then
			dw_dest = tab_1.tabpage_4.dw_8
		else
			dw_dest = tab_1.tabpage_4.dw_7		
		end if
end choose

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type pb_2 from picturebutton within w_mpsfcday_r
integer x = 2469
integer y = 60
integer width = 393
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식관리"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
string ls_wcno

ls_wcno = dw_1.object.wc_no[1]

if IsValid(w_o_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_all_main, 5, original!)
end if

if isnull(ls_wcno) or ls_wcno = "" then
else
	w_cdcalc_pub_m.dw_3.object.wc_no[1] = ls_wcno
end if

//w_cdcalc_pub_m.WindowState = Normal!

end event

type cbx_2 from checkbox within w_mpsfcday_r
boolean visible = false
integer x = 599
integer y = 168
integer width = 389
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
boolean enabled = false
string text = "물품그룹"
boolean automatic = false
end type

type st_6 from statictext within w_mpsfcday_r
integer x = 1083
integer y = 52
integer width = 210
integer height = 80
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

type st_4 from statictext within w_mpsfcday_r
integer x = 69
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_mpsfcday_r
integer x = 256
integer y = 316
integer width = 480
integer height = 632
integer taborder = 60
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

type ddlb_dwtitles from dropdownlistbox within w_mpsfcday_r
integer x = 311
integer y = 332
integer width = 311
integer height = 88
integer taborder = 130
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

type st_3 from statictext within w_mpsfcday_r
integer x = 773
integer y = 332
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

type ddlb_op from dropdownlistbox within w_mpsfcday_r
integer x = 942
integer y = 316
integer width = 297
integer height = 512
integer taborder = 70
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_mpsfcday_r
integer x = 1262
integer y = 324
integer width = 512
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_mpsfcday_r
integer x = 1783
integer y = 324
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_6"
		arg_dw  = dw6
	case "dw_7"
		arg_dw  = dw7
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_1 from commandbutton within w_mpsfcday_r
integer x = 1947
integer y = 324
integer width = 160
integer height = 76
integer taborder = 120
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_6"
		arg_dw  = dw6
	case "dw_7"
		arg_dw  = dw7
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_mpsfcday_r
integer x = 2112
integer y = 324
integer width = 160
integer height = 76
integer taborder = 130
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_6"
		arg_dw  = dw6
	case "dw_7"
		arg_dw  = dw7
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_mpsfcday_r
integer x = 2277
integer y = 324
integer width = 160
integer height = 76
integer taborder = 140
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

choose case is_dw
	case "dw_3"
		arg_dw  = dw3
	case "dw_4"
		arg_dw  = dw4
	case "dw_6"
		arg_dw  = dw6
	case "dw_7"
		arg_dw  = dw7
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

