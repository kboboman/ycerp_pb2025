$PBExportHeader$w_ipcust_unit_m.srw
$PBExportComments$거래처별입고내역(1998/05/13,곽용덕)
forward
global type w_ipcust_unit_m from w_inheritance
end type
type dw_3 from datawindow within w_ipcust_unit_m
end type
type rb_2 from radiobutton within w_ipcust_unit_m
end type
type rb_1 from radiobutton within w_ipcust_unit_m
end type
type rb_3 from radiobutton within w_ipcust_unit_m
end type
type st_2 from statictext within w_ipcust_unit_m
end type
type dw_area from datawindow within w_ipcust_unit_m
end type
type pb_1 from picturebutton within w_ipcust_unit_m
end type
type rb_4 from radiobutton within w_ipcust_unit_m
end type
type rb_5 from radiobutton within w_ipcust_unit_m
end type
type rb_6 from radiobutton within w_ipcust_unit_m
end type
type rb_7 from radiobutton within w_ipcust_unit_m
end type
type rb_8 from radiobutton within w_ipcust_unit_m
end type
type rb_9 from radiobutton within w_ipcust_unit_m
end type
type st_3 from statictext within w_ipcust_unit_m
end type
type ddlb_fld from dropdownlistbox within w_ipcust_unit_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipcust_unit_m
end type
type st_4 from statictext within w_ipcust_unit_m
end type
type ddlb_op from dropdownlistbox within w_ipcust_unit_m
end type
type sle_value from singlelineedit within w_ipcust_unit_m
end type
type cb_1 from commandbutton within w_ipcust_unit_m
end type
type cb_2 from commandbutton within w_ipcust_unit_m
end type
type cb_3 from commandbutton within w_ipcust_unit_m
end type
type cb_5 from commandbutton within w_ipcust_unit_m
end type
type cb_close from commandbutton within w_ipcust_unit_m
end type
type cb_close_cancel from commandbutton within w_ipcust_unit_m
end type
type em_month from editmask within w_ipcust_unit_m
end type
type st_1 from statictext within w_ipcust_unit_m
end type
type st_5 from statictext within w_ipcust_unit_m
end type
type em_value from editmask within w_ipcust_unit_m
end type
type cb_4 from commandbutton within w_ipcust_unit_m
end type
type gb_4 from groupbox within w_ipcust_unit_m
end type
end forward

global type w_ipcust_unit_m from w_inheritance
integer width = 5787
integer height = 2324
string title = "입고단가 일괄반영 관리(w_ipcust_unit_m)"
dw_3 dw_3
rb_2 rb_2
rb_1 rb_1
rb_3 rb_3
st_2 st_2
dw_area dw_area
pb_1 pb_1
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
rb_9 rb_9
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_close cb_close
cb_close_cancel cb_close_cancel
em_month em_month
st_1 st_1
st_5 st_5
em_value em_value
cb_4 cb_4
gb_4 gb_4
end type
global w_ipcust_unit_m w_ipcust_unit_m

type variables
st_print i_print
string is_dw, is_supp
date   id_date1, id_date2
datawindowchild idwc_cust, idwc_area, idwc_loc
end variables

forward prototypes
public subroutine wf_calc (long arg_row)
end prototypes

public subroutine wf_calc (long arg_row);//
string ls_qa, ls_uom
string ls_draw_no /*추가*/
dec{6} ld_rate
dec ld_mk
long ia_rate, is_rate
string ls_round, ls_supp

dw_1.accepttext()

//ls_qa  = trim(dw_1.object.inspdet_qa[arg_row])
//ls_uom = trim(dw_1.object.com_uom[arg_row])
//ls_draw_no =  trim(dw_1.object.draw_no[arg_row])
//ls_round =  trim(dw_1.object.supp_round[arg_row])
//
//SELECT al_rate, st_rate INTO :ia_rate, :is_rate FROM globals;
//
//choose case ls_uom
//	case 'M'
//		dw_1.object.inspdet_comqty[arg_row] = (real(mid(ls_qa,15,5)) / 1000.0) * dw_1.object.inspdet_rcpt_qty[arg_row]
//	case 'M2'
//		dw_1.object.inspdet_comqty[arg_row] = (real(mid(ls_qa, 5,4)) / 1000.0) * (real(mid(ls_qa,10,4)) / 1000.0) * dw_1.object.inspdet_rcpt_qty[arg_row]
//	case 'KG'
//		if dw_1.object.uom[arg_row]  = 'SH' then
//			if mid(dw_1.object.groupitem_item_no[arg_row], 3, 1 )= 'A' then
//				ld_rate =  ia_rate
//			else
//				ld_rate =  is_rate
//			end if
//			
//			dw_1.object.inspdet_comqty[arg_row] = ld_rate * (real(mid(ls_qa,1,3)) / 100.0) * (real(mid(ls_qa,5,4)) / 1000.0) * (real(mid(ls_qa,10,4)) / 1000.0) * dw_1.object.inspdet_rcpt_qty[arg_row]
//		 	dw_1.object.inspdet_cnt[arg_row]     = dw_1.object.inspdet_rcpt_qty[arg_row] 
//			dw_1.accepttext()
//			if Not isnull(dw_1.object.inspdet_rcpt_qty[arg_row]) and dw_1.object.inspdet_rcpt_qty[arg_row] <> 0 then
//		 		dw_1.object.unit_qty[arg_row] = truncate(dw_1.object.inspdet_comqty[arg_row] / dw_1.object.inspdet_cnt[arg_row] , 4)
//			end if
//		else
//							
//				select MK
//				INTO :ld_mk
//				from suppdraw
//				where draw_no = :ls_draw_no;
//				
//				if isnull(ld_mk) or ld_mk = 0 then
//					
//					dw_1.object.inspdet_comqty[arg_row] = dw_1.object.inspdet_rcpt_qty[arg_row] 
//				
//				else
//	
//					dw_1.object.inspdet_comqty[arg_row] = ld_mk*real(mid(ls_qa,15,5)) / 1000.0 * dw_1.object.inspdet_rcpt_qty[arg_row]
//					
//				end if
//
//		end if
//		
//	case else
//		dw_1.object.inspdet_comqty[arg_row] = dw_1.object.inspdet_rcpt_qty[arg_row] 
//end choose
//
//dw_1.accepttext()

if ls_round = 'Y' then
//	dw_1.object.amt[arg_row] = round(dw_1.object.inspdet_comqty[arg_row]    * dw_1.object.inspdet_price[arg_row],0 )
	dw_1.object.inspdet_rate_cash[arg_row] = dw_1.object.amt[arg_row]*0.1
else
//	dw_1.object.amt[arg_row] = truncate(dw_1.object.inspdet_comqty[arg_row] * dw_1.object.inspdet_price[arg_row],0 )
	dw_1.object.inspdet_rate_cash[arg_row] = dw_1.object.amt[arg_row]*0.1	
end if

//dw_1.object.ori_inspdet_price[arg_row] = dw_1.object.inspdet_price[arg_row]
end subroutine

on w_ipcust_unit_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.rb_3=create rb_3
this.st_2=create st_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.rb_9=create rb_9
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_close=create cb_close
this.cb_close_cancel=create cb_close_cancel
this.em_month=create em_month
this.st_1=create st_1
this.st_5=create st_5
this.em_value=create em_value
this.cb_4=create cb_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.rb_4
this.Control[iCurrent+9]=this.rb_5
this.Control[iCurrent+10]=this.rb_6
this.Control[iCurrent+11]=this.rb_7
this.Control[iCurrent+12]=this.rb_8
this.Control[iCurrent+13]=this.rb_9
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.cb_close
this.Control[iCurrent+25]=this.cb_close_cancel
this.Control[iCurrent+26]=this.em_month
this.Control[iCurrent+27]=this.st_1
this.Control[iCurrent+28]=this.st_5
this.Control[iCurrent+29]=this.em_value
this.Control[iCurrent+30]=this.cb_4
this.Control[iCurrent+31]=this.gb_4
end on

on w_ipcust_unit_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.rb_3)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_close)
destroy(this.cb_close_cancel)
destroy(this.em_month)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.em_value)
destroy(this.cb_4)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = FALSE
//dw_4.visible = FALSE
//dw_5.visible = FALSE
dw_1.sharedata(dw_2)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = gs_area

// 전체거래처
dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild("supp_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

dw_3.object.ymd1[1] = date(string(today(),"yyyy/mm/01"))
dw_3.object.ymd2[1] = date(string(today(),"yyyy/mm/dd"))
id_date1 = dw_3.object.ymd1[1]
id_date2 = dw_3.object.ymd2[1]

em_month.text = string(gf_today() ,'yyyy mm dd') 


idwc_loc.insertrow(1)
idwc_loc.setitem(1, "supp_no", "%")
idwc_loc.setitem(1, "supp_name", "전체")

//if left(gs_team,1) = "9" then
	dw_3.object.supp_no[1] = "%"
//end if


if GF_PERMISSION("입고단가일괄반영단가확정", gs_userid) = "Y" then
	cb_close.visible = true
	cb_close_cancel.visible = true	
else
	cb_close.visible = false
	cb_close_cancel.visible = false
end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32


end event

type pb_save from w_inheritance`pb_save within w_ipcust_unit_m
boolean visible = false
integer x = 3058
end type

type dw_1 from w_inheritance`dw_1 within w_ipcust_unit_m
integer x = 32
integer y = 428
integer width = 5641
integer height = 1768
integer taborder = 60
string title = "d_ipcust_unit_m"
string dataobject = "d_ipcust_unit_m"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemchanged;call super::itemchanged;wf_calc(row)
end event

type st_title from w_inheritance`st_title within w_ipcust_unit_m
integer x = 32
integer y = 0
integer width = 1367
integer height = 144
string text = "입고단가 일괄반영 관리"
end type

type st_tips from w_inheritance`st_tips within w_ipcust_unit_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipcust_unit_m
boolean visible = false
integer x = 1714
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcust_unit_m
boolean visible = false
integer x = 2866
end type

type pb_close from w_inheritance`pb_close within w_ipcust_unit_m
integer x = 4576
integer taborder = 190
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcust_unit_m
integer x = 4197
integer taborder = 240
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//string ls_supp,ls_order
//long   ll_row
//
//i_print.st_datawindow  = dw_2
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc  = " 이 프로그램은 거래처별 입고내역 보고서를 출력합니다."
//
//if rb_1.checked = true then
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'
//else
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=79'
//end if
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcust_unit_m
boolean visible = false
integer x = 2482
integer taborder = 270
end type

type pb_delete from w_inheritance`pb_delete within w_ipcust_unit_m
boolean visible = false
integer x = 2290
integer taborder = 280
end type

type pb_insert from w_inheritance`pb_insert within w_ipcust_unit_m
boolean visible = false
integer x = 2098
integer taborder = 300
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcust_unit_m
integer x = 4005
integer taborder = 290
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
string ls_area, ls_category

dw_3.accepttext()

ls_area = LeftA(dw_area.object.area[1],1)
if ls_area = "" then ls_area = "%"
if is_supp = "" then is_supp = "%"

if rb_4.checked = true then		// 전체
	ls_category = "%"
elseif rb_5.checked = true then	// 원자재
	ls_category = "W"
elseif rb_6.checked = true then	// 상품
	ls_category = "S"
elseif rb_7.checked = true then	// 부자재
	ls_category = "B"
elseif rb_8.checked = true then	// 외주가공
	ls_category = "Y"
elseif rb_8.checked = true then	// 공사원가
	ls_category = "A"
end if

dw_1.reset()

if GF_PERMISSION("입고단가일괄반영단가확정", gs_userid) = "Y" then
	ll_row = dw_1.retrieve( is_supp, id_date1, id_date2, ls_area, ls_category, '%')
else	
	ll_row = dw_1.retrieve( is_supp, id_date1, id_date2, ls_area, ls_category, gs_userid)	
end if	

if ll_row < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipcust_unit_m
integer x = 32
integer width = 5641
integer height = 184
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 77897888
end type

type gb_2 from w_inheritance`gb_2 within w_ipcust_unit_m
integer x = 1440
integer y = 8
integer width = 1902
integer height = 216
integer taborder = 120
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipcust_unit_m
integer x = 3977
integer y = 8
integer width = 823
integer height = 216
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_ipcust_unit_m
integer x = 41
integer y = 164
integer width = 101
integer height = 76
integer taborder = 70
string dataobject = "d_ipcust_unit_sum"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_ipcust_unit_m
integer x = 1993
integer y = 48
integer width = 1056
integer height = 156
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ipsupp_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
dw_1.reset()
this.accepttext()

id_date1 = this.object.ymd1[1]
id_date2 = this.object.ymd2[1]
is_supp  = trim(this.object.supp_no[1])


end event

event rbuttondown;//
gs_calendar lstr_calendar

choose case dwo.name
	case "ymd1", "ymd2"
		lstr_calendar.sdate = string(this.object.ymd1[1])
		lstr_calendar.edate = string(this.object.ymd2[1])
		OpenWithParm(w_calendar2, lstr_calendar)
		lstr_calendar = Message.PowerObjectParm
		
		if lstr_calendar.chk <> 'N' then
			this.object.ymd1[1] = date(lstr_calendar.sdate)
			this.object.ymd2[1] = date(lstr_calendar.edate)
		end if
end choose

this.postevent(itemchanged!)


end event

event itemfocuschanged;//
choose case dwo.name
	case "supp_no"
		this.SelectText(1, LenA(GetText()))
end choose

end event

type rb_2 from radiobutton within w_ipcust_unit_m
integer x = 3067
integer y = 108
integer width = 238
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
boolean enabled = false
string text = "집계1"
end type

event clicked;// 집계1
dw_1.dataobject = 'd_ipcustpur_t2'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r2'
dw_1.sharedata(dw_2)


//if this.checked then
//	cbx_2.enabled = false
//end if
end event

type rb_1 from radiobutton within w_ipcust_unit_m
integer x = 3067
integer y = 52
integer width = 238
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
string text = "상세"
boolean checked = true
end type

event clicked;// 상세
dw_1.dataobject = 'd_ipcust_unit_m'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r'
dw_1.sharedata(dw_2)


//if this.checked then
//	cbx_2.enabled = true
//end if
//
end event

type rb_3 from radiobutton within w_ipcust_unit_m
integer x = 3067
integer y = 156
integer width = 238
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
string text = "집계"
end type

event clicked;// 집계2
dw_1.dataobject = 'd_ipcustpur_t3'
dw_1.settransobject(sqlca)
dw_2.dataobject = 'd_ipcustpur_r3'
dw_1.sharedata(dw_2)


//if this.checked then
//	cbx_2.enabled = false
//end if
end event

type st_2 from statictext within w_ipcust_unit_m
integer x = 1467
integer y = 48
integer width = 521
integer height = 72
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

type dw_area from datawindow within w_ipcust_unit_m
integer x = 1467
integer y = 124
integer width = 521
integer height = 84
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

type pb_1 from picturebutton within w_ipcust_unit_m
event mousemove pbm_mousemove
integer x = 4384
integer y = 52
integer width = 187
integer height = 144
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string ls_area
long ll_row
dwItemStatus l_status
////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//string ls_Docname, ls_Named, ls_ExpandName
//integer ls_Value, li_Pos, li_value
//
//if dw_1.rowcount() > 0 then
//	ls_value = GetFileSaveName("Select File",  & 
//		ls_Docname, ls_Named, "XLS",  &
//		"엑셀 (*.XLS), *.XLS," + &
//		"CSV(쉽표로 분리), *.CSV,")
//	li_Pos = Pos(ls_Named, ".")
//	ls_ExpandName = Mid(ls_Named, li_Pos + 1, Len(ls_Named)- li_Pos)
//	if ls_Value = 1 then
//			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
//					dw_1.SaveAsascii(ls_DocName)
//			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
//			end if
//	end if
//end if	

wf_update1(dw_1, 'Y')

//dw_2.retrieve( id_date1, id_date2, '%')

ls_area = trim(dw_area.object.area[1])

/*2019-09-05 JOWONSUK INSP에 업데이트 */
update insp
	set insp_cash = b.insp_cash,
			insp_rate  = b.insp_rate,
			insp_total = isnull(b.insp_cash,0) +  isnull(b.insp_rate,0)
	from insp a join (  
							 SELECT inspdet.insp_no
									    , insp_cash  = sum(isnull((case when supp.round = 'Y' then ROUND(inspdet.comqty * inspdet.price, 0, 0) 
																				 else ROUND(inspdet.comqty * inspdet.price, 0, 1) 
																		end), 0)),
												 insp_rate  = round( sum(isnull((case when supp.round = 'Y' then ROUND(inspdet.comqty * inspdet.price, 0, 0) 
																							     else ROUND(inspdet.comqty * inspdet.price, 0, 1) 
																					 	end), 0)*0.1),0,1)
							  FROM  inspdet with(nolock) inner join insp with(nolock) on  inspdet.insp_no = insp.insp_no
																  inner join purdet with(nolock) on inspdet.pur_no  = purdet.order_no  and  inspdet.seq_no = purdet.seq_no
																  inner join pur with(nolock) on inspdet.pur_no = pur.order_no
																  inner join supp with(nolock) on insp.supp_no  = supp.supp_no
									 WHERE ( insp.insp_date BETWEEN :id_date1 AND :id_date2  )
										  AND  rtrim(ltrim(insp.area_no)) like :ls_area
										  AND  rtrim(ltrim(insp.login_id)) like :gs_userid
										  AND  isnull(insp.close_yn,'N') = 'N'
							  GROUP BY inspdet.insp_no
					   ) b
	on a.insp_no = b.insp_no;

//for ll_row = 1 to dw_1.rowcount()	
//	/*2019.08.14 jowonsuk 마스터, 운전자, 운반비, 이름차량 변경 가능하게 수정  */
//	l_status = dw_1.GetItemStatus(1, 0, Primary!)
//	if l_status = DataModified! then	
//	else
//		MessageBox("확인", "선택한 자료가 없습니다.")	
//	end if
//	return	
//next
end event

type rb_4 from radiobutton within w_ipcust_unit_m
integer x = 3374
integer y = 52
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 77897888
string text = "전체"
boolean checked = true
end type

type rb_5 from radiobutton within w_ipcust_unit_m
integer x = 3374
integer y = 108
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "원자재"
end type

type rb_6 from radiobutton within w_ipcust_unit_m
integer x = 3374
integer y = 156
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "상품"
end type

type rb_7 from radiobutton within w_ipcust_unit_m
integer x = 3643
integer y = 52
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "부자재"
end type

type rb_8 from radiobutton within w_ipcust_unit_m
integer x = 3643
integer y = 108
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "외주"
end type

type rb_9 from radiobutton within w_ipcust_unit_m
integer x = 3643
integer y = 156
integer width = 302
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
string text = "공사원가"
end type

type st_3 from statictext within w_ipcust_unit_m
integer x = 69
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_ipcust_unit_m
integer x = 256
integer y = 288
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ipcust_unit_m
integer x = 288
integer y = 300
integer width = 311
integer height = 88
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
end type

type st_4 from statictext within w_ipcust_unit_m
integer x = 727
integer y = 304
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

type ddlb_op from dropdownlistbox within w_ipcust_unit_m
integer x = 896
integer y = 288
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_ipcust_unit_m
integer x = 1216
integer y = 292
integer width = 567
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_ipcust_unit_m
integer x = 1787
integer y = 292
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
//		arg_dw  = dw_4
	case "dw_5"
//		arg_dw  = dw_5
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_ipcust_unit_m
integer x = 1952
integer y = 292
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
//		arg_dw  = dw_4
	case "dw_5"
//		arg_dw  = dw_5
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipcust_unit_m
integer x = 2117
integer y = 292
integer width = 160
integer height = 76
integer taborder = 180
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
//		arg_dw  = dw_4
	case "dw_5"
//		arg_dw  = dw_5
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ipcust_unit_m
integer x = 2281
integer y = 292
integer width = 160
integer height = 76
integer taborder = 210
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
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
//		arg_dw  = dw_4
	case "dw_5"
//		arg_dw  = dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_close from commandbutton within w_ipcust_unit_m
integer x = 4306
integer y = 280
integer width = 402
integer height = 100
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가확정"
end type

event clicked;string ls_area

ls_area = trim(dw_area.object.area[1])

update insp
	set close_yn = 'Y'
WHERE ( insp_date BETWEEN :id_date1 AND :id_date2  )
  AND  rtrim(ltrim(login_id)) like :gs_userid
  AND  rtrim(ltrim(area_no)) like :ls_area
  AND  isnull(close_yn,'N') = 'N';
  
messagebox('알림','단가확정을 완료하였습니다.')  


pb_retrieve.postevent( clicked!)
end event

type cb_close_cancel from commandbutton within w_ipcust_unit_m
integer x = 4713
integer y = 280
integer width = 494
integer height = 100
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가확정 취소"
end type

event clicked;string ls_area

ls_area = trim(dw_area.object.area[1])

update insp
	set close_yn = 'Y'
WHERE ( insp_date BETWEEN :id_date1 AND :id_date2  )
  AND  rtrim(ltrim(login_id)) like :gs_userid
  AND  rtrim(ltrim(area_no)) like :ls_area
  AND  isnull(close_yn,'N') = 'Y';
  

messagebox('알림','단가확정 취소를 완료하였습니다.')  

pb_retrieve.postevent( clicked!)
end event

type em_month from editmask within w_ipcust_unit_m
boolean visible = false
integer x = 3973
integer y = 288
integer width = 329
integer height = 80
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = trim(message.stringparm)
end if

end event

type st_1 from statictext within w_ipcust_unit_m
boolean visible = false
integer x = 3662
integer y = 288
integer width = 306
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
string text = "마감월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ipcust_unit_m
integer x = 2496
integer y = 288
integer width = 521
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
string text = "일괄반영 금액"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_value from editmask within w_ipcust_unit_m
integer x = 3022
integer y = 288
integer width = 366
integer height = 84
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#,###,##0"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = trim(message.stringparm)
end if

end event

type cb_4 from commandbutton within w_ipcust_unit_m
integer x = 3392
integer y = 280
integer width = 256
integer height = 100
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "실행"
end type

event clicked;string ls_area
long ll_row, ll_cnt, l_value

l_value =  long(em_value.text)


ll_row = dw_1.rowcount()

for ll_cnt = 1 to ll_row
//	l_status = dw_1.GetItemStatus(ll_cnt, 'qoh', Primary!)
//	ls_item  = trim(dw_1.object.itemloc_item_no[ll_cnt])
	dw_1.object.inspdet_price[ll_cnt] = 	(dw_1.object.inspdet_price[ll_cnt]) + l_value
//	
//	if l_status = notmodified! or isnull(ls_item) or trim(ls_item) = '' or &
//		isnull(ls_qa) or trim(ls_qa) = '' then 
//		continue
//	end if

next

  
messagebox('알림','일괄 반영하였습니다.')  
end event

type gb_4 from groupbox within w_ipcust_unit_m
integer x = 3355
integer y = 8
integer width = 608
integer height = 216
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 77897888
end type

