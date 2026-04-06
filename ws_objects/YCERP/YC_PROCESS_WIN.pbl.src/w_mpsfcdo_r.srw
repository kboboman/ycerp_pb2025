$PBExportHeader$w_mpsfcdo_r.srw
$PBExportComments$생산미출고 현황
forward
global type w_mpsfcdo_r from w_inheritance
end type
type em_1 from editmask within w_mpsfcdo_r
end type
type em_2 from editmask within w_mpsfcdo_r
end type
type dw_area from datawindow within w_mpsfcdo_r
end type
type pb_1 from pb_print within w_mpsfcdo_r
end type
type pb_2 from picturebutton within w_mpsfcdo_r
end type
type st_3 from statictext within w_mpsfcdo_r
end type
type ddlb_fld from dropdownlistbox within w_mpsfcdo_r
end type
type st_4 from statictext within w_mpsfcdo_r
end type
type ddlb_op from dropdownlistbox within w_mpsfcdo_r
end type
type sle_value from singlelineedit within w_mpsfcdo_r
end type
type cb_1 from commandbutton within w_mpsfcdo_r
end type
type cb_2 from commandbutton within w_mpsfcdo_r
end type
type cb_3 from commandbutton within w_mpsfcdo_r
end type
type cb_5 from commandbutton within w_mpsfcdo_r
end type
type gb_4 from groupbox within w_mpsfcdo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r
end type
type st_2 from statictext within w_mpsfcdo_r
end type
type st_1 from statictext within w_mpsfcdo_r
end type
type cb_4 from commandbutton within w_mpsfcdo_r
end type
type st_7 from statictext within w_mpsfcdo_r
end type
type dw_4 from datawindow within w_mpsfcdo_r
end type
type st_5 from statictext within w_mpsfcdo_r
end type
type cbx_openclose from checkbox within w_mpsfcdo_r
end type
type em_3 from editmask within w_mpsfcdo_r
end type
type st_6 from statictext within w_mpsfcdo_r
end type
type cb_6 from commandbutton within w_mpsfcdo_r
end type
type st_8 from statictext within w_mpsfcdo_r
end type
type ddlb_term from dropdownlistbox within w_mpsfcdo_r
end type
type dw_3 from datawindow within w_mpsfcdo_r
end type
type rb_1 from radiobutton within w_mpsfcdo_r
end type
type rb_2 from radiobutton within w_mpsfcdo_r
end type
type ddlb_wc from dropdownlistbox within w_mpsfcdo_r
end type
type st_9 from statictext within w_mpsfcdo_r
end type
type dw_5 from datawindow within w_mpsfcdo_r
end type
type st_10 from statictext within w_mpsfcdo_r
end type
type gb_5 from groupbox within w_mpsfcdo_r
end type
type gb_6 from groupbox within w_mpsfcdo_r
end type
type dw_6 from datawindow within w_mpsfcdo_r
end type
end forward

global type w_mpsfcdo_r from w_inheritance
integer width = 6295
integer height = 2528
string title = "생산미출고 현황(w_mpsfcdo_r)"
em_1 em_1
em_2 em_2
dw_area dw_area
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
st_1 st_1
cb_4 cb_4
st_7 st_7
dw_4 dw_4
st_5 st_5
cbx_openclose cbx_openclose
em_3 em_3
st_6 st_6
cb_6 cb_6
st_8 st_8
ddlb_term ddlb_term
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
ddlb_wc ddlb_wc
st_9 st_9
dw_5 dw_5
st_10 st_10
gb_5 gb_5
gb_6 gb_6
dw_6 dw_6
end type
global w_mpsfcdo_r w_mpsfcdo_r

type variables
st_print i_print
datawindowchild idwc_area, idwc_user
long i_row

end variables

on w_mpsfcdo_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.st_1=create st_1
this.cb_4=create cb_4
this.st_7=create st_7
this.dw_4=create dw_4
this.st_5=create st_5
this.cbx_openclose=create cbx_openclose
this.em_3=create em_3
this.st_6=create st_6
this.cb_6=create cb_6
this.st_8=create st_8
this.ddlb_term=create ddlb_term
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.ddlb_wc=create ddlb_wc
this.st_9=create st_9
this.dw_5=create dw_5
this.st_10=create st_10
this.gb_5=create gb_5
this.gb_6=create gb_6
this.dw_6=create dw_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.cbx_openclose
this.Control[iCurrent+24]=this.em_3
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.cb_6
this.Control[iCurrent+27]=this.st_8
this.Control[iCurrent+28]=this.ddlb_term
this.Control[iCurrent+29]=this.dw_3
this.Control[iCurrent+30]=this.rb_1
this.Control[iCurrent+31]=this.rb_2
this.Control[iCurrent+32]=this.ddlb_wc
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.dw_5
this.Control[iCurrent+35]=this.st_10
this.Control[iCurrent+36]=this.gb_5
this.Control[iCurrent+37]=this.gb_6
this.Control[iCurrent+38]=this.dw_6
end on

on w_mpsfcdo_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.st_5)
destroy(this.cbx_openclose)
destroy(this.em_3)
destroy(this.st_6)
destroy(this.cb_6)
destroy(this.st_8)
destroy(this.ddlb_term)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.ddlb_wc)
destroy(this.st_9)
destroy(this.dw_5)
destroy(this.st_10)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.dw_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
//dw_7.settransobject(sqlca)

dw_6.insertrow(0)

dw_2.visible = false

datetime ldt_sdate, ldt_edate

SELECT top 1 DateAdd(month, -1, getdate()), DateAdd(day, -1, getdate()) 
  INTO :ldt_sdate, :ldt_edate 
  FROM login;

em_1.text = string(ldt_sdate, "yyyy/mm/dd")
em_2.text = string(ldt_edate, "yyyy/mm/dd")

// 사업장
dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = 'S0001'  // gs_area
//dw_area.enabled = false

// 담당자
dw_4.insertrow(1)
dw_4.getchild("user",idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_4.object.user[1] = "%"

ddlb_term.text = ' 7일이후'

ddlb_wc.text = '전체         %'


if gf_permission('생산미출고현황_수주삭제권한', gs_userid) = 'Y' then
	cb_6.enabled = true
else
	cb_6.enabled = false	
end if 


if gf_permission('생산미출고현황_사유등록권한', gs_userid) = 'Y' then
	dw_6.visible = true
	st_10.visible = true
else
	dw_6.visible = false
	st_10.visible = false
end if

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_5.x   = (newwidth - dw_5.width)  / 2		// 미출고 사유등록


end event

type pb_save from w_inheritance`pb_save within w_mpsfcdo_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcdo_r
integer x = 32
integer y = 424
integer width = 4498
integer height = 1912
integer taborder = 60
string dataobject = "d_mpsfcdo_r"
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;string ls_order_no, ls_item_no, ls_qa
long l_seqno

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
this.ScrollToRow( row )
this.SelectRow( row, NOT this.IsSelected(row) )

i_row = row

if isnull(row) OR row < 1 OR row > dw_1.rowcount() then RETURN 

ls_order_no  = dw_1.Object.sale_no[row]
l_seqno  = dw_1.Object.seq_no[row]
ls_item_no  = dw_1.Object.item_no[row]
ls_qa  = dw_1.Object.qa[row]

//dw_7.retrieve(ls_order_no, l_seqno, ls_item_no, ls_qa)
//
//if dw_7.rowcount() < 1 THEN
//	dw_7.InsertRow(0)
//	dw_7.Object.order_no[1]  = ls_order_no
//	dw_7.Object.seq_no[1]  = l_seqno
//	dw_7.Object.item_no[1]   = ls_item_no
//	dw_7.Object.qa[1]        = ls_qa
//end if

this.scrolltorow( row )

end event

event dw_1::doubleclicked;call super::doubleclicked;////
//gs_where2 lst_str 
//string ls_saleno, ls_seqno
//long   ll_row
//
//
//ls_saleno  = dw_1.object.sale_no[row]
//ls_seqno   = string(dw_1.object.seq_no[row])
//
//if ls_saleno = "" OR isnull(ls_saleno) OR len(ls_saleno) <> 14  then RETURN
//
//lst_str.str1[1] = ls_saleno
//lst_str.str2[1] = ls_seqno
//
//OpenWithParm(w_whsaleall_w, lst_str)	

string ls_order_no, ls_item_no, ls_qa, ls_loc_no
dec    ld_order_qty, ld_qoh
long   ll_row, l_seqno

dw_1.AcceptText()


if gf_permission('생산미출고현황_사유등록권한', gs_userid) = 'Y' then
	if isnull(row) OR row < 1 OR row > dw_1.rowcount() then RETURN 
	
	ls_order_no  = dw_1.Object.sale_no[row]
	l_seqno  = dw_1.Object.seq_no[row]
	ls_item_no  = dw_1.Object.item_no[row]
	ls_qa  = dw_1.Object.qa[row]
	
	i_row = row
	dw_5.visible = true
	dw_5.retrieve(ls_order_no, l_seqno, ls_item_no, ls_qa)
	
	if dw_5.rowcount() < 1 THEN
		dw_5.InsertRow(0)
		dw_5.Object.order_no[1]  = ls_order_no
		dw_5.Object.seq_no[1]  = l_seqno
		dw_5.Object.item_no[1]   = ls_item_no
		dw_5.Object.qa[1]        = ls_qa
	end if
	
	
	dw_5.setcolumn('do_plan_date')
	dw_5.setfocus()
else
end if 
end event

type st_title from w_inheritance`st_title within w_mpsfcdo_r
integer x = 32
integer y = 28
integer width = 1088
integer height = 144
string text = "생산미출고 현황"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcdo_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcdo_r
boolean visible = false
integer taborder = 340
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcdo_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcdo_r
integer x = 5733
integer y = 72
integer taborder = 250
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcdo_r
integer x = 5527
integer y = 72
integer taborder = 220
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//gs_print_str lstr_print
//datawindow dw_print
//string ls_sql, ls_where, ls_source
//
//if dw_3.getrow() <= 0 then RETURN
//
//if rb_3.checked = true then
//	if rb_1.checked = true then
//		dw_2.dataobject = 'd_mpsfcwc_r1'
//	else
//		dw_2.dataobject = 'd_mpsfcwc_r2'
//	end if
//	dw_2.SetTransObject(SQLCA)
//	
//	dw_3.sharedata(dw_2)
//	dw_print = dw_2
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//else
//	dw_print = dw_4
//	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//end if
//
//i_print.st_datawindow = dw_print
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 작업장별 생산현황을 출력합니다." 
//
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcdo_r
boolean visible = false
integer taborder = 350
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcdo_r
boolean visible = false
integer taborder = 360
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcdo_r
boolean visible = false
integer taborder = 370
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcdo_r
integer x = 5129
integer y = 72
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_sdate, ls_edate, ls_salesman, ls_area, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ls_sdate = em_1.text
ls_edate = em_2.text

  /*해당 생산기간중의 맨처음 수주번호를 가져와서 매출쪽을 조회한다. */
//  select substring(MIN(SUBSTRING(sfcday.SALE_NO,3,8)), 1,4)+'/'+substring(MIN(SUBSTRING(sfcday.SALE_NO,3,8)),5,2) + '/' + substring(MIN(SUBSTRING(sfcday.SALE_NO,3,8)),7,2)
//    INTO :ls_ssale_date
//  from sfcday with(nolock)
//  where sfcday.sfc_date between :ls_sdate + ' 00:00:00' AND :ls_edate + ' 23:59:59' 
//	 and sfcday.item_no = sfcday.assembly
//	 and sfcday.qa = sfcday.assembly_qa
//	 and sfcday.type = 'C'
//	 and sfcday.cust_no  <> ''  
//	 AND ISNULL(sfcday.MAKE_QTY,0) > 0;
select  substring(a.ls_date,1,4) + '/' + substring(a.ls_date,5,2) + '/' + substring(a.ls_date,7,2) lsdate
   into :ls_ssale_date
from 
(   
    select MIN(SUBSTRING(sfcday.SALE_NO,3,8)) ls_date
      from sfcday with(nolock)
      where sfcday.sfc_date between :ls_sdate + ' 00:00:00' AND :ls_edate + ' 23:59:59' 
    	 and sfcday.item_no = sfcday.assembly
    	 and sfcday.qa = sfcday.assembly_qa
    	 and sfcday.type = 'C'
    	 and sfcday.cust_no  <> ''  
    	 AND ISNULL(sfcday.MAKE_QTY,0) > 0
) a;


// 사업장
dw_area.accepttext()
ls_area     = dw_area.object.area[1]

if ls_area <> '%' then
	ls_area = '%'+ls_area+'%'
end if

// 담당자
dw_4.accepttext()
ls_salesman = dw_4.object.user[1]

//if ls_salesman <> '%' then
//	ls_salesman = '%'+ls_salesman+'%'
//end if

// 마감제외
if cbx_openclose.checked = true then
	ls_openclose = "O"
else
	ls_openclose = ""
end if

// 경과
//ls_calctime = em_3.text

ls_calctime = trim(LeftA(ddlb_term.text,2))

ls_wc_no = trim(RightA(ddlb_wc.text,3))

ls_wc_no = LeftA(ls_wc_no,1)+'%'

//
if rb_1.checked then
	dw_1.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no)
	//엑셀 출력용 2017.12.13 조원석 추가 
	dw_3.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no)	
else	
	dw_1.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no)
	//엑셀 출력용 2017.12.13 조원석 추가 
	dw_3.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no)
end if


if dw_1.rowcount() < 1 then
	MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
else
	MessageBox("확인","조회완료")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcdo_r
integer x = 1166
integer y = 16
integer width = 581
integer height = 232
integer taborder = 310
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcdo_r
integer x = 1760
integer y = 16
integer width = 800
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcdo_r
integer x = 5088
integer y = 16
integer width = 864
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcdo_r
integer x = 105
integer y = 148
integer width = 105
integer height = 72
integer taborder = 80
string dataobject = "d_mpsfcwc_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpsfcdo_r
integer x = 1792
integer y = 144
integer width = 361
integer height = 72
integer taborder = 120
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

//
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type em_2 from editmask within w_mpsfcdo_r
integer x = 2162
integer y = 144
integer width = 361
integer height = 72
integer taborder = 200
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

//
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type dw_area from datawindow within w_mpsfcdo_r
integer x = 1193
integer y = 140
integer width = 526
integer height = 80
integer taborder = 330
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from pb_print within w_mpsfcdo_r
boolean visible = false
integer x = 2386
integer y = 40
integer taborder = 90
boolean bringtotop = true
string picturename = "CrossTab!"
end type

type pb_2 from picturebutton within w_mpsfcdo_r
integer x = 5326
integer y = 72
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

//2017.12.13일 조원석 변경
//dwxls = dw_1
dwxls = dw_3

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			//	dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_3 from statictext within w_mpsfcdo_r
integer x = 105
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_mpsfcdo_r
integer x = 293
integer y = 308
integer width = 448
integer height = 632
integer taborder = 30
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

type st_4 from statictext within w_mpsfcdo_r
integer x = 791
integer y = 324
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

type ddlb_op from dropdownlistbox within w_mpsfcdo_r
integer x = 960
integer y = 308
integer width = 297
integer height = 512
integer taborder = 40
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

type sle_value from singlelineedit within w_mpsfcdo_r
integer x = 1280
integer y = 316
integer width = 567
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_mpsfcdo_r
integer x = 1851
integer y = 316
integer width = 160
integer height = 76
integer taborder = 190
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

type cb_2 from commandbutton within w_mpsfcdo_r
integer x = 2016
integer y = 316
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcdo_r
integer x = 2181
integer y = 316
integer width = 160
integer height = 76
integer taborder = 230
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcdo_r
integer x = 2345
integer y = 316
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_mpsfcdo_r
integer x = 183
integer y = 260
integer width = 4343
integer height = 152
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r
integer x = 334
integer y = 320
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

type st_2 from statictext within w_mpsfcdo_r
integer x = 1193
integer y = 60
integer width = 521
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

type st_1 from statictext within w_mpsfcdo_r
integer x = 1792
integer y = 60
integer width = 731
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "생산일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_mpsfcdo_r
integer x = 2533
integer y = 308
integer width = 421
integer height = 84
integer taborder = 270
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주내역"
end type

event clicked;//
gs_where2 lst_str 
string ls_saleno, ls_seqno
long   ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then RETURN

ls_saleno  = dw_1.object.sale_no[ll_row]
ls_seqno   = string(dw_1.object.seq_no[ll_row])

if ls_saleno = "" OR isnull(ls_saleno) OR LenA(ls_saleno) <> 14  then RETURN

lst_str.str1[1] = ls_saleno
lst_str.str2[1] = ls_seqno

OpenWithParm(w_whsaleall_w, lst_str)	

end event

type st_7 from statictext within w_mpsfcdo_r
integer x = 2601
integer y = 60
integer width = 658
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_mpsfcdo_r
integer x = 2597
integer y = 140
integer width = 663
integer height = 84
integer taborder = 280
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_5 from statictext within w_mpsfcdo_r
integer x = 91
integer y = 256
integer width = 1545
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "출고수량은 반품수량을 포함하지 않음.(물품이동 포함)"
boolean focusrectangle = false
end type

type cbx_openclose from checkbox within w_mpsfcdo_r
integer x = 4242
integer y = 64
integer width = 375
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "마감제외"
end type

type em_3 from editmask within w_mpsfcdo_r
boolean visible = false
integer x = 4818
integer y = 464
integer width = 183
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "15"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type st_6 from statictext within w_mpsfcdo_r
integer x = 3319
integer y = 64
integer width = 416
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
string text = "생산일기준"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_mpsfcdo_r
integer x = 2967
integer y = 308
integer width = 320
integer height = 84
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "행삭제"
end type

event clicked;// 행삭제
string ls_wcsaleseq, ls_wcno, ls_saleno, ls_seqno
long   ll_row, ll_cnt, l_net

ll_row    = dw_1.getrow()

ls_wcno   = dw_1.object.WC_CODE[ll_row]
ls_saleno = dw_1.object.sale_no[ll_row]
ls_seqno  = string(dw_1.object.seq_no[ll_row])

l_net = MessageBox("확인", "해당 데이터를 미출고 내역에서 제외 하실건가요?", Exclamation!, OKCancel!, 2)

if l_net = 1 then

		ls_wcsaleseq  = ls_wcno + ls_saleno + ls_seqno
		SELECT count(*) INTO :ll_cnt FROM dodet_not WHERE wc_sale_seq = :ls_wcsaleseq;
		if ll_cnt > 0 then
			MessageBox("확인","해당하는 데이터는 [dodet_not] 이미 존재합니다.")
		else
			INSERT INTO dodet_not ( wc_sale_seq ) VALUES ( :ls_wcsaleseq );
			if sqlca.sqlcode < 0 then
				ROLLBACK;
				MessageBox("등록","등록중 오류가 발생하였습니다!",exclamation!)
				RETURN
			else
				COMMIT;
				dw_1.DeleteRow( ll_row )
			end if			
		end if

end if

end event

type st_8 from statictext within w_mpsfcdo_r
integer x = 3319
integer y = 320
integer width = 1536
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
string text = "※미출고현황에서 제외시킬때 행삭제 버튼 클릭"
boolean focusrectangle = false
end type

type ddlb_term from dropdownlistbox within w_mpsfcdo_r
integer x = 3739
integer y = 64
integer width = 475
integer height = 428
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean sorted = false
string item[] = {" 3일이후"," 5일이후"," 7일이후","15일이후","30일이후"}
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_mpsfcdo_r
boolean visible = false
integer x = 4567
integer y = 788
integer width = 686
integer height = 400
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_mpsfcdo_excel_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_mpsfcdo_r
integer x = 4690
integer y = 68
integer width = 366
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
string text = "담당자순"
boolean checked = true
end type

event clicked;//dw_4.dataobject = 'd_cdcust_eva_m'
//dw_4.settrans( sqlca )
dw_1.dataobject = 'd_mpsfcdo_r'
dw_3.dataobject = 'd_mpsfcdo_excel_r'

dw_1.settrans( sqlca )
dw_3.settrans( sqlca )


ddlb_wc.text = '전체         %'

//ddlb_wc.enabled = false
//st_9.enabled = false
ddlb_wc.enabled = true
st_9.enabled = true
end event

type rb_2 from radiobutton within w_mpsfcdo_r
integer x = 4690
integer y = 148
integer width = 302
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
string text = "제품순"
end type

event clicked;dw_1.dataobject = 'd_mpsfcdo2_r'
dw_3.dataobject = 'd_mpsfcdo_excel2_r'

dw_1.settrans( sqlca )
dw_3.settrans( sqlca )


dw_4.object.user[1] = "%"
dw_4.enabled = false

ddlb_wc.enabled = true
st_9.enabled = true

end event

type ddlb_wc from dropdownlistbox within w_mpsfcdo_r
integer x = 3739
integer y = 152
integer width = 475
integer height = 920
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체         %","절곡         B00","성형         F00","도장         P00","유압         U00","화성         T00","YSP         Y00","",""}
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_mpsfcdo_r
integer x = 3319
integer y = 152
integer width = 416
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
string text = "생산처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_mpsfcdo_r
boolean visible = false
integer x = 2153
integer y = 864
integer width = 2450
integer height = 1080
integer taborder = 120
boolean bringtotop = true
boolean titlebar = true
string title = "사유등록"
string dataobject = "d_mpnodo"
boolean controlmenu = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//
Date   ld_date
String ls_date, ls_lendate2, ls_lendate, ls_rem

choose case dwo.name
	case "b_save"
		if MessageBox("확인","사유를 저장하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			dw_5.accepttext()

			ls_rem  = trim(dw_5.object.rem[1])
			ls_date  = trim(dw_5.object.do_plan_date[1])
			
			if ls_rem  = '' or isnull(ls_rem) = true then
				messagebox('확인','사유는 필수 입력 사항입니다.')
				dw_5.reset()
				dw_5.visible = FALSE
			else
				if dw_5.Update() = 1 then
					COMMIT Using Sqlca;
					Messagebox("확인","저장하였습니다.")
					dw_5.visible = False
					
					/*dw_5.visible  = true 할때  row값을 i_row에 넘겨줌. */
					dw_1.object.rem[i_row] = ls_rem
					dw_1.object.do_plan_date[i_row] = ls_date
			
				else
					ROLLBACK Using sqlca;
					Messagebox("확인","저장실패 하였습니다.")
					Return
				end if								
			end if

		else
			Return
		end if
		
	case "b_delete"
		if MessageBox("확인","사유를 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			if dw_5.deleterow(0) = 1 then
				dw_5.Update()
				COMMIT Using Sqlca;
				Messagebox("확인","삭제하였습니다.")
				dw_5.visible = FALSE
				
				/*dw_5.visible  = true 할때  row값을 i_row에 넘겨줌. */
				dw_1.object.rem[i_row] = ''
				dw_1.object.do_plan_date[i_row] = ''
					
			else
				ROLLBACK Using sqlca;
				Messagebox("확인","삭제실패 하였습니다.")
				Return
			end if	
		else
			Return
			dw_5.Visible = FALSE
		end if
		
	case "b_exit"
		dw_5.reset()
		dw_5.visible = FALSE
end choose

end event

type st_10 from statictext within w_mpsfcdo_r
integer x = 4878
integer y = 308
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12639424
string text = "사유등록"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_mpsfcdo_r
integer x = 2578
integer y = 16
integer width = 713
integer height = 232
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

type gb_6 from groupbox within w_mpsfcdo_r
integer x = 3305
integer y = 16
integer width = 1765
integer height = 232
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

type dw_6 from datawindow within w_mpsfcdo_r
boolean visible = false
integer x = 5271
integer y = 288
integer width = 763
integer height = 116
integer taborder = 130
string title = "사유등록"
string dataobject = "d_mpnodo"
boolean controlmenu = true
boolean border = false
boolean livescroll = true
end type

event buttonclicked;//
Date   ld_date
String ls_date, ls_lendate2, ls_lendate, ls_rem
string ls_order_no, ls_item_no, ls_qa
long   l_seqno, l_row, ll_row
dwItemStatus l_status

if isnull(i_row) OR i_row < 1 OR i_row > dw_1.rowcount() then RETURN 

//ls_order_no  = dw_1.Object.sale_no[i_row]
//l_seqno  = dw_1.Object.seq_no[i_row]
//ls_item_no  = dw_1.Object.item_no[i_row]
//ls_qa  = dw_1.Object.qa[i_row]

//dw_6.retrieve(ls_order_no, l_seqno, ls_item_no, ls_qa)
//
//if dw_6.rowcount() < 1 THEN
//	dw_6.InsertRow(0)
//	dw_6.Object.order_no[1]  = ls_order_no
//	dw_6.Object.seq_no[1]  = l_seqno
//	dw_6.Object.item_no[1]   = ls_item_no
//	dw_6.Object.qa[1]        = ls_qa
//end if


choose case dwo.name
	case "b_save"
		if MessageBox("확인","사유를 저장하시겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
			
			dw_1.accepttext()
			
			for l_row = 1 to dw_1.rowcount()													
				/* 2019.06.11 jowonsuk order_no 신규번호 생성 */
				l_status = dw_1.GetItemStatus(l_row, 0, Primary!)
				
				if l_status = dataModified! or l_status = NewModified! then
				
					ls_rem  = trim(dw_1.object.rem[l_row])
					ls_date  = trim(dw_1.object.do_plan_date[l_row])			
					ls_order_no  = dw_1.Object.sale_no[l_row]
					l_seqno  = dw_1.Object.seq_no[l_row]
					ls_item_no  = dw_1.Object.item_no[l_row]
					ls_qa  = dw_1.Object.qa[l_row]
					
					if ls_rem  = '' or isnull(ls_rem) = true then
						messagebox('확인', string(l_row) + '행의 사유가 없습니다. 사유는 필수 입력 사항입니다.')
						return
					else
					
//						ll_row = dw_7.insertrow(0)
//						
//						dw_7.Object.order_no[ll_row]  = ls_order_no
//						dw_7.Object.seq_no[ll_row]  = l_seqno
//						dw_7.Object.item_no[ll_row]   = ls_item_no
//						dw_7.Object.qa[ll_row]        = ls_qa				
//						dw_7.Object.rem[ll_row]   = ls_rem
//						dw_7.Object.do_plan_date[ll_row] = ls_date	

						insert into sale_nodo (order_no, seq_no, rem, do_plan_date) 
						values (:ls_order_no, :l_seqno, :ls_rem, :ls_date);
						
						if sqlca.sqlcode < 0 then
							
							update sale_nodo
							    set rem = :ls_rem,
								    do_plan_date = :ls_date
							where order_no = :ls_order_no
							    and seq_no = :l_seqno;
								 
							if sqlca.sqlcode < 0 then	 
								rollback;
								Messagebox("확인","저장을 실패하였습니다.")
								exit
							end if
							
						end if

					end if
				end if
			next			
			
			if sqlca.sqlcode = 0 then	 
				commit;
				Messagebox("확인","저장하였습니다.")
			end if
			
//			if dw_7.Update() = 1 then
//				COMMIT Using Sqlca;
//				Messagebox("확인","저장하였습니다.")
//			else
//				ROLLBACK Using sqlca;
//				Messagebox("확인","저장실패 하였습니다.")
//				Return
//			end if											

		else
			Return
		end if
		
	case "b_delete"
		
//		dw_7.retrieve(ls_order_no, l_seqno, ls_item_no, ls_qa)
//		
//		if dw_7.rowcount() < 1 THEN
//			dw_7.InsertRow(0)
//			dw_7.Object.order_no[1]  = ls_order_no
//			dw_7.Object.seq_no[1]  = l_seqno
//			dw_7.Object.item_no[1]   = ls_item_no
//			dw_7.Object.qa[1]        = ls_qa
//		end if		
		
		if MessageBox("확인","사유를 삭제하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			
			
			dw_1.accepttext()
			
			for l_row = 1 to dw_1.rowcount()				
			
				if dw_1.isselected(l_row) then
					
					ls_order_no  = dw_1.Object.sale_no[l_row]
					l_seqno  = dw_1.Object.seq_no[l_row]
					ls_item_no  = dw_1.Object.item_no[l_row]
					ls_qa  = dw_1.Object.qa[l_row]					
			
					delete sale_nodo
					where order_no = :ls_order_no
						 and seq_no = :l_seqno;
						 
					if sqlca.sqlcode = 0 then	
						dw_1.object.rem[l_row] = ''
						dw_1.object.do_plan_date[l_row] = ''						
					else
						rollback;
						Messagebox("확인","삭제실패 하였습니다.")
						exit
					end if
					
				end if
				
			next
			
			if sqlca.sqlcode = 0 then
				commit;
				Messagebox("확인","삭제하였습니다.")					
			else
			end if
						
//			if dw_7.deleterow(0) = 1 then
//				dw_7.Update()
//				COMMIT Using Sqlca;
//				Messagebox("확인","삭제하였습니다.")				
//				/*dw_5.visible  = true 할때  row값을 i_row에 넘겨줌. */
//				dw_7.InsertRow(0)
//				dw_1.object.rem[i_row] = ''
//				dw_1.object.do_plan_date[i_row] = ''
//					
//			else
//				ROLLBACK Using sqlca;
//				Messagebox("확인","삭제실패 하였습니다.")
//				Return
//			end if	
		else
			Return
		end if		
end choose

end event

