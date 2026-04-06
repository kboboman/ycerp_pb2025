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
type dw_6 from datawindow within w_oicustdo_r
end type
type pb_1 from picturebutton within w_oicustdo_r
end type
type st_1 from statictext within w_oicustdo_r
end type
type dw_3 from datawindow within w_oicustdo_r
end type
type dw_4 from datawindow within w_oicustdo_r
end type
type rb_3 from radiobutton within w_oicustdo_r
end type
type st_info from statictext within w_oicustdo_r
end type
type cbx_1 from checkbox within w_oicustdo_r
end type
type dw_5 from datawindow within w_oicustdo_r
end type
type rb_4 from radiobutton within w_oicustdo_r
end type
type dw_7 from datawindow within w_oicustdo_r
end type
type rb_5 from radiobutton within w_oicustdo_r
end type
type st_3 from statictext within w_oicustdo_r
end type
type st_4 from statictext within w_oicustdo_r
end type
type ddlb_op from dropdownlistbox within w_oicustdo_r
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
type st_2 from statictext within w_oicustdo_r
end type
type ddlb_fld from dropdownlistbox within w_oicustdo_r
end type
type rb_6 from radiobutton within w_oicustdo_r
end type
type cbx_2 from checkbox within w_oicustdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oicustdo_r
end type
end forward

global type w_oicustdo_r from w_inheritance
integer y = 112
integer width = 4809
integer height = 2488
string title = "거래처별 물품 출고현황(w_oicustdo_r)"
rb_1 rb_1
rb_2 rb_2
gb_4 gb_4
dw_6 dw_6
pb_1 pb_1
st_1 st_1
dw_3 dw_3
dw_4 dw_4
rb_3 rb_3
st_info st_info
cbx_1 cbx_1
dw_5 dw_5
rb_4 rb_4
dw_7 dw_7
rb_5 rb_5
st_3 st_3
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
ddlb_fld ddlb_fld
rb_6 rb_6
cbx_2 cbx_2
ddlb_dwtitles ddlb_dwtitles
end type
global w_oicustdo_r w_oicustdo_r

type variables
string is_sale_flag, is_custdosql, is_custdorsql,is_custdor1sql, is_ret
datawindowchild idwc_area
gs_custdo_str   ist_code
//dropdownlistbox iddlb_dwtitles
end variables

on w_oicustdo_r.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_4=create gb_4
this.dw_6=create dw_6
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.rb_3=create rb_3
this.st_info=create st_info
this.cbx_1=create cbx_1
this.dw_5=create dw_5
this.rb_4=create rb_4
this.dw_7=create dw_7
this.rb_5=create rb_5
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.rb_6=create rb_6
this.cbx_2=create cbx_2
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.st_info
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.dw_5
this.Control[iCurrent+13]=this.rb_4
this.Control[iCurrent+14]=this.dw_7
this.Control[iCurrent+15]=this.rb_5
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.sle_value
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.cb_5
this.Control[iCurrent+24]=this.st_2
this.Control[iCurrent+25]=this.ddlb_fld
this.Control[iCurrent+26]=this.rb_6
this.Control[iCurrent+27]=this.cbx_2
this.Control[iCurrent+28]=this.ddlb_dwtitles
end on

on w_oicustdo_r.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_4)
destroy(this.dw_6)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.rb_3)
destroy(this.st_info)
destroy(this.cbx_1)
destroy(this.dw_5)
destroy(this.rb_4)
destroy(this.dw_7)
destroy(this.rb_5)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.rb_6)
destroy(this.cbx_2)
destroy(this.ddlb_dwtitles)
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

dw_6.settransobject(sqlca)
dw_6.insertrow(0)  
//if left(gs_team,1) = "7" then
//	dw_6.object.area[1] = " "
//else
//	dw_6.object.area[1] = gs_area
//end if
dw_6.object.area[1] = " "

dw_6.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)

dw_2.visible = false
dw_3.visible = false
dw_4.visible = false

dw_3.x  = dw_1.x
dw_3.y  = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

dw_4.x  = dw_1.x
dw_4.y  = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

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
integer y = 500
integer width = 4704
integer height = 1860
integer taborder = 0
string dataobject = "d_oicustdo_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'cust_no' or dwo.name = 'cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oicustdo_r
integer x = 1435
integer y = 16
integer width = 101
integer height = 84
integer taborder = 0
string dataobject = "d_oicustrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_oicustdo_r
integer x = 32
integer y = 20
integer width = 1509
string text = "거래처별 물품 출고현황"
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
integer x = 4526
integer y = 60
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oicustdo_r
integer x = 4334
integer y = 60
integer taborder = 20
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print
long ll_count

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

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
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
integer x = 3950
integer y = 60
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_sql, ls_where
string ls_area, ls_custname, ls_custname1, ls_desc, ls_sdate, ls_edate
date   ld_start, ld_end

OpenWithParm(w_whcustdo_w, ist_code)
ist_code = Message.PowerObjectParm
if ist_code.okcancel = 'N' then RETURN

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_area  = trim(LeftA(dw_6.object.area[dw_6.getrow()],1)) + "%"
ld_start = date(ist_code.start_date)
ld_end   = date(ist_code.end_date)

choose case gs_level
	case 'A', 'B'
		is_ret = '%'
	case 'C'
		is_ret = gs_userid
end choose

if ist_code.sel_flag = 'A' then
   ls_where = " where do.do_date between ~~'" + &
	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"	+ &	
				  " and do.do_no like ~~'" + ls_area  + "~~'" + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"
	ls_desc = '출고기간:' + string(ld_start,"yyyy/mm/dd") + '-' + string(ld_end,"yyyy/mm/dd")  
else
   ls_where = " where do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
	           ist_code.start_no + "~~' and ~~'" + ist_code.end_no + "~~'"	+ &	
				  " and do.do_no like ~~'" + ls_area  + "~~'" + &
				  " and customer.salesman like ~~'" + is_ret + "~~'"
				  
	select cust_name into :ls_custname  from customer where cust_no = :ist_code.start_no;
	select cust_name into :ls_custname1 from customer where cust_no = :ist_code.end_no;
	ls_desc = '출고기간:' + string(ld_start,"yyyy/mm/dd") + ' ~ ' + string(ld_end,"yyyy/mm/dd") + ' 업체:' + ls_custname + ' ~ ' + ls_custname1
end if
ls_sql = "datawindow.table.select = '" + is_custdosql + ls_where + "'"

//
st_info.text = ls_desc
ls_sdate     = string(ld_start,"yyyy/mm/dd")
ls_edate     = string(ld_end,  "yyyy/mm/dd")

if rb_1.checked = true then	// 거래처별 현장별
	dw_1.visible = true
	dw_3.visible = false ; dw_4.visible = false ; dw_5.visible = false ; dw_7.visible = false

	dw_1.modify(ls_sql)
	dw_1.retrieve()
	dw_1.groupcalc()	
	if dw_1.rowcount() < 1 then
		messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if

	dw_1.sharedata(dw_2)
	dw_2.groupcalc()
	dw_1.setfocus()
	
elseif rb_2.checked = true then	// 거래명세표 발행번호
	dw_3.visible = true
	dw_1.visible = false ; dw_4.visible = false ; dw_5.visible = false ; dw_7.visible = false

	dw_3.modify(ls_sql)
	dw_3.retrieve()
	if dw_3.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if

	dw_3.sharedata(dw_2)
	dw_2.groupcalc()
	dw_3.setfocus()

elseif rb_3.checked = true then	// 보고용 엑셀
	dw_4.visible = true
	dw_1.visible = false ; dw_3.visible = false ; dw_5.visible = false ; dw_7.visible = false
	
	// 결산집계자료
	dw_4.retrieve( ls_area, ls_sdate, ls_edate )	
	if dw_4.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_4.setfocus()
	
elseif rb_4.checked = true OR rb_6.checked = true then	// 분석, 기타분석
	dw_5.visible = true
	dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false ; dw_7.visible = false
	
	string ls_etcyn = "N"
	if rb_6.checked = true then ls_etcyn = "Y"
	
	dw_5.retrieve( ls_area, ls_sdate, ls_edate, ls_etcyn )	
	if dw_5.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_5.setfocus()

else									// 거래처 현장목록 
	dw_7.visible = true
	dw_1.visible = false ; dw_3.visible = false ; dw_4.visible = false ; dw_5.visible = false
	
	dw_7.retrieve( ls_area, ls_sdate, ls_edate )
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
integer y = 296
integer width = 4704
integer height = 188
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oicustdo_r
integer x = 1582
integer y = 16
integer width = 576
integer height = 216
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "사업장"
end type

type gb_1 from w_inheritance`gb_1 within w_oicustdo_r
integer x = 3918
integer y = 16
integer width = 818
integer height = 216
integer taborder = 0
end type

type rb_1 from radiobutton within w_oicustdo_r
integer x = 2213
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
st_1.visible  = true
dw_1.visible  = true
dw_3.visible  = false
dw_4.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

end event

type rb_2 from radiobutton within w_oicustdo_r
integer x = 2848
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
long textcolor = 33554432
long backcolor = 67108864
string text = "거래명세표 번호"
end type

event clicked;//
dw_3.visible  = true
cbx_1.enabled = false
st_1.visible  = false
dw_1.visible  = false
dw_4.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_3, ddlb_fld, ddlb_dwtitles )

end event

type gb_4 from groupbox within w_oicustdo_r
integer x = 2171
integer y = 16
integer width = 1733
integer height = 216
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
end type

type dw_6 from datawindow within w_oicustdo_r
integer x = 1605
integer y = 100
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_oicustdo_r
event mousemove pbm_mousemove
integer x = 4142
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

type st_1 from statictext within w_oicustdo_r
integer x = 23
integer y = 252
integer width = 1797
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처 더블클릭시 현황조회됩니다. 보고용에서 대분류는 수작업으로."
boolean focusrectangle = false
end type

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
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_4 from datawindow within w_oicustdo_r
integer x = 343
integer y = 976
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
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_3 from radiobutton within w_oicustdo_r
integer x = 2848
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
long textcolor = 128
long backcolor = 67108864
string text = "보고용 엑셀자료"
end type

event clicked;//
dw_4.visible  = true
cbx_1.enabled = false
st_1.visible  = false
dw_1.visible  = false
dw_3.visible  = false
dw_5.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_4, ddlb_fld, ddlb_dwtitles )

end event

type st_info from statictext within w_oicustdo_r
integer x = 3698
integer y = 252
integer width = 1038
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_oicustdo_r
integer x = 2217
integer y = 16
integer width = 375
integer height = 52
boolean bringtotop = true
integer textsize = -9
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

type dw_5 from datawindow within w_oicustdo_r
integer x = 553
integer y = 1180
integer width = 3675
integer height = 896
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicustdo_pivot"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

This.SelectRow(0, FALSE)
this.SelectRow( row, NOT this.IsSelected( row ) )
end event

type rb_4 from radiobutton within w_oicustdo_r
integer x = 3493
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
st_1.visible  = false
dw_1.visible  = false
dw_3.visible  = false
dw_4.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )

end event

type dw_7 from datawindow within w_oicustdo_r
integer x = 722
integer y = 1316
integer width = 3351
integer height = 876
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
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type rb_5 from radiobutton within w_oicustdo_r
integer x = 2213
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
st_1.visible  = false
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
integer y = 372
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
integer x = 773
integer y = 372
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

type ddlb_op from dropdownlistbox within w_oicustdo_r
integer x = 942
integer y = 356
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oicustdo_r
integer x = 1262
integer y = 364
integer width = 567
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
integer x = 1833
integer y = 364
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
integer x = 1998
integer y = 364
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

end event

type cb_3 from commandbutton within w_oicustdo_r
integer x = 2162
integer y = 364
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
integer x = 2327
integer y = 364
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

type st_2 from statictext within w_oicustdo_r
integer x = 2514
integer y = 384
integer width = 1797
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_oicustdo_r
integer x = 274
integer y = 356
integer width = 480
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
integer x = 3493
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
st_1.visible  = false
dw_1.visible  = false
dw_3.visible  = false
dw_4.visible  = false
dw_7.visible  = false

GF_DWTitle2ddlb( dw_5, ddlb_fld, ddlb_dwtitles )

end event

type cbx_2 from checkbox within w_oicustdo_r
integer x = 3493
integer y = 252
integer width = 256
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
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

if dw_5.visible = true then
	if this.checked = true then
		ls_colx = dw_5.object.cust_name.width
		dw_5.object.datawindow.horizontalscrollsplit= ls_colx
	else
		ls_colx = "0"
		dw_5.object.datawindow.horizontalscrollsplit= ls_colx
	end if
end if
end event

type ddlb_dwtitles from dropdownlistbox within w_oicustdo_r
integer x = 315
integer y = 368
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

