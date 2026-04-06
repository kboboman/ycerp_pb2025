$PBExportHeader$w_whroutstatus_m.srw
$PBExportComments$생산현황표
forward 
global type w_whroutstatus_m from w_inheritance
end type
type st_4 from statictext within w_whroutstatus_m
end type
type ddlb_fld from dropdownlistbox within w_whroutstatus_m
end type
type ddlb_dwtitles from dropdownlistbox within w_whroutstatus_m
end type
type st_6 from statictext within w_whroutstatus_m
end type
type ddlb_op from dropdownlistbox within w_whroutstatus_m
end type
type sle_value from singlelineedit within w_whroutstatus_m
end type
type cb_2 from commandbutton within w_whroutstatus_m
end type
type cb_3 from commandbutton within w_whroutstatus_m
end type
type cb_4 from commandbutton within w_whroutstatus_m
end type
type cb_5 from commandbutton within w_whroutstatus_m
end type
type st_7 from statictext within w_whroutstatus_m
end type
type ddlb_time from dropdownlistbox within w_whroutstatus_m
end type
type em_day from editmask within w_whroutstatus_m
end type
type st_1 from statictext within w_whroutstatus_m
end type
type cb_1 from commandbutton within w_whroutstatus_m
end type
type rb_1 from radiobutton within w_whroutstatus_m
end type
type rb_2 from radiobutton within w_whroutstatus_m
end type
type cb_6 from commandbutton within w_whroutstatus_m
end type
type rb_3 from radiobutton within w_whroutstatus_m
end type
type rb_4 from radiobutton within w_whroutstatus_m
end type
type cbx_all from checkbox within w_whroutstatus_m
end type
end forward

global type w_whroutstatus_m from w_inheritance
integer x = 599
integer y = 864
integer width = 4050
integer height = 2296
string title = "생산현황 상세(w_whroutstatus_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
st_7 st_7
ddlb_time ddlb_time
em_day em_day
st_1 st_1
cb_1 cb_1
rb_1 rb_1
rb_2 rb_2
cb_6 cb_6
rb_3 rb_3
rb_4 rb_4
cbx_all cbx_all
end type
global w_whroutstatus_m w_whroutstatus_m

type variables
gs_where ist_where
string is_user
end variables

on w_whroutstatus_m.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.st_7=create st_7
this.ddlb_time=create ddlb_time
this.em_day=create em_day
this.st_1=create st_1
this.cb_1=create cb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cb_6=create cb_6
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cbx_all=create cbx_all
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.ddlb_time
this.Control[iCurrent+13]=this.em_day
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.rb_1
this.Control[iCurrent+17]=this.rb_2
this.Control[iCurrent+18]=this.cb_6
this.Control[iCurrent+19]=this.rb_3
this.Control[iCurrent+20]=this.rb_4
this.Control[iCurrent+21]=this.cbx_all
end on

on w_whroutstatus_m.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.st_7)
destroy(this.ddlb_time)
destroy(this.em_day)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cb_6)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cbx_all)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string  ls_area, ls_wcno, ls_wcname, ls_wcuse, ls_orderno, ls_itemno, ls_duedate, ls_purtype, ls_colx
long    ll_seqno, ll_row, ll_dw1cnt, ll_found

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ist_where  = Message.PowerObjectparm
ls_wcno    = ist_where.str1
ls_itemno  = ist_where.str2
ls_duedate = ist_where.str3
ls_purtype = ist_where.str4

em_day.text = string(gf_today(), "yyyy/mm/dd")

SELECT rtrim(work_name), use_yn INTO :ls_wcname, :ls_wcuse FROM wc WHERE work_no = :ls_wcno;
if isnull(ls_wcname) OR ls_wcname = "" then
else
	rb_2.text = ls_wcname
end if
if ls_wcuse = "Y" then 
	pb_save.enabled = true
else
	pb_save.enabled = false
	MessageBox("확인", "가상집합 작업장에서는 공정입고일을 관리할 수 없습니다.")
end if

dw_2.visible = false
dw_2.settransobject(sqlca)

dw_1.settransobject(sqlca)
dw_1.setredraw(false)

DEBUGBREAK()
dw_2.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )
dw_1.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )


if dw_1.rowcount() < 1 then
	for ll_row = 1 to dw_2.rowcount()
		ls_orderno = dw_2.object.order_no[ll_row]
		ll_seqno   = dw_2.object.seq_no[ll_row]
		
      ll_found   = dw_1.Find("sale_no = '" + ls_orderno + "' AND seq_no = " + string(ll_seqno) + " ", 1, dw_1.RowCount() )		
		
		if ll_found > 0 then
			// 수량만 UPDATE 함
			dw_1.object.order_qty[ll_found]   = dw_2.object.order_qty[ll_row] 
			dw_1.object.rlse_qty[ll_found]    = dw_2.object.rlse_qty[ll_row]  
			dw_1.object.remains_qty[ll_found] = dw_2.object.jan_qty[ll_row]   
			dw_1.object.calc_qty[ll_found]    = dw_2.object.calc_qty[ll_row]   
		else
			ll_dw1cnt = dw_1.insertrow(0)
			
			dw_1.object.work_no[ll_dw1cnt]    = dw_2.object.wc_no[ll_row]     
			dw_1.object.item_no[ll_dw1cnt]    = dw_2.object.item_no[ll_row]          
			dw_1.object.item_name[ll_dw1cnt]  = dw_2.object.item_name[ll_row]          
			dw_1.object.sale_no[ll_dw1cnt]    = dw_2.object.order_no[ll_row]  
			dw_1.object.seq_no[ll_dw1cnt]     = dw_2.object.seq_no[ll_row]    
			dw_1.object.due_date[ll_dw1cnt]   = dw_2.object.due_date[ll_row]  
			dw_1.object.cust_no[ll_dw1cnt]    = dw_2.object.cust_no[ll_row]   
			dw_1.object.cust_name[ll_dw1cnt]  = dw_2.object.cust_name[ll_row]   
			dw_1.object.scene_code[ll_dw1cnt] = dw_2.object.scene_code[ll_row]
			dw_1.object.scene_desc[ll_dw1cnt] = dw_2.object.scene_desc[ll_row]
			dw_1.object.job1[ll_dw1cnt]       = dw_2.object.wc1[ll_row]       
			dw_1.object.job1_nm[ll_dw1cnt]    = dw_2.object.wc1_nm[ll_row]       
			dw_1.object.job2[ll_dw1cnt]       = dw_2.object.wc2[ll_row]       
			dw_1.object.job2_nm[ll_dw1cnt]    = dw_2.object.wc2_nm[ll_row]       
			dw_1.object.job3[ll_dw1cnt]       = dw_2.object.wc3[ll_row]       
			dw_1.object.job3_nm[ll_dw1cnt]    = dw_2.object.wc3_nm[ll_row]       
			dw_1.object.order_qty[ll_dw1cnt]  = dw_2.object.order_qty[ll_row] 
			dw_1.object.rlse_qty[ll_dw1cnt]   = dw_2.object.rlse_qty[ll_row]  
			dw_1.object.remains_qty[ll_dw1cnt]= dw_2.object.jan_qty[ll_row]   
			dw_1.object.calc_qty[ll_dw1cnt]   = dw_2.object.calc_qty[ll_row]   
		end if
	next
end if

dw_1.accepttext()
dw_1.setredraw(true)
dw_1.setfocus()

ls_colx = string(integer(dw_1.object.sale_no.x))
if ls_colx = "0" then
else
	dw_1.object.datawindow.horizontalscrollsplit = ls_colx
end if		


end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whroutstatus_m
integer x = 2761
integer y = 76
integer width = 430
integer height = 116
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장후 닫기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_wcno, ls_itemno, ls_duedate, ls_purtype
long   ll_seq

dwItemStatus l_status

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

ist_where.chk = 'Y'
if wf_update1(dw_1,"N") = false then
	return
end if

// 생산계획표(납기일) - 상세보기
if IsValid( w_mpplansale_r ) = true then
   ls_wcno    = w_mpplansale_r.is_wcno
	ls_itemno  = w_mpplansale_r.is_itemno
	ls_duedate = w_mpplansale_r.is_duedate
	ls_purtype = w_mpplansale_r.is_purtype

	w_mpplansale_r.dw8.setredraw( false )
	w_mpplansale_r.dw8.retrieve( ls_wcno, ls_itemno, ls_duedate, ls_purtype )
	w_mpplansale_r.dw8.setredraw( true )
end if

CloseWithReturn(parent, ist_where)

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whroutstatus_m
integer x = 32
integer y = 420
integer width = 3968
integer height = 1760
integer taborder = 30
string dataobject = "d_routestatus_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::losefocus;call super::losefocus;//
this.accepttext()
end event

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event dw_1::doubleclicked;call super::doubleclicked;//
gs_where2 lst_str 
string ls_itemno, ls_itemnm, ls_duedate, ls_title, ls_saleno
long   ll_row, ll_col

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_saleno = this.object.sale_no[ll_row]

if ls_saleno = "" OR isnull(ls_saleno) OR LenA(ls_saleno) <> 14  then RETURN
lst_str.str1[1] = ls_saleno

OpenWithParm( w_whsaleall2_w, lst_str )	

end event

type st_title from w_inheritance`st_title within w_whroutstatus_m
integer x = 32
integer y = 24
integer width = 1074
integer height = 132
string text = "공정입고일 관리"
end type

type st_tips from w_inheritance`st_tips within w_whroutstatus_m
end type

type pb_compute from w_inheritance`pb_compute within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_whroutstatus_m
integer x = 3200
integer y = 76
integer width = 430
integer height = 116
integer taborder = 10
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;//
ist_where.chk = "N"
closewithreturn(parent, ist_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type pb_delete from w_inheritance`pb_delete within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type pb_insert from w_inheritance`pb_insert within w_whroutstatus_m
boolean visible = false
integer x = 1202
integer y = 952
integer width = 366
integer height = 104
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::mousemove;//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whroutstatus_m
boolean visible = false
integer taborder = 0
end type

type gb_3 from w_inheritance`gb_3 within w_whroutstatus_m
integer x = 1166
integer y = 16
integer width = 1536
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whroutstatus_m
integer y = 244
integer width = 3968
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_whroutstatus_m
integer x = 2720
integer y = 16
integer width = 946
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_whroutstatus_m
integer x = 59
integer y = 176
integer width = 101
integer height = 88
integer taborder = 0
string dataobject = "d_routestatus_list"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_whroutstatus_m
integer x = 352
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_whroutstatus_m
integer x = 539
integer y = 300
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_whroutstatus_m
integer x = 571
integer y = 312
integer width = 311
integer height = 88
integer taborder = 110
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

type st_6 from statictext within w_whroutstatus_m
integer x = 1010
integer y = 316
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

type ddlb_op from dropdownlistbox within w_whroutstatus_m
integer x = 1179
integer y = 300
integer width = 297
integer height = 512
integer taborder = 110
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

type sle_value from singlelineedit within w_whroutstatus_m
integer x = 1499
integer y = 304
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

type cb_2 from commandbutton within w_whroutstatus_m
integer x = 2071
integer y = 304
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_whroutstatus_m
integer x = 2235
integer y = 304
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

type cb_4 from commandbutton within w_whroutstatus_m
integer x = 2400
integer y = 304
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_whroutstatus_m
integer x = 2565
integer y = 304
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_7 from statictext within w_whroutstatus_m
integer x = 1696
integer y = 152
integer width = 197
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "시간:"
boolean focusrectangle = false
end type

type ddlb_time from dropdownlistbox within w_whroutstatus_m
integer x = 1906
integer y = 136
integer width = 462
integer height = 408
integer taborder = 91
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"오전(12:00)","오후(17:30)","야간(22:30)"}
end type

type em_day from editmask within w_whroutstatus_m
integer x = 1906
integer y = 48
integer width = 462
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = ""
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_whroutstatus_m
integer x = 1696
integer y = 64
integer width = 206
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "일자:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whroutstatus_m
integer x = 2382
integer y = 56
integer width = 293
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "적용"
end type

event clicked;// 적용
string   ls_wcno, ls_itemno, ls_duedate, ls_datetime, ls_date, ls_time, ls_job, ls_column, ls_type
long     ll_row, ll_col, ll_cnt
datetime ldt_date

ls_wcno    = ist_where.str1
ls_itemno  = ist_where.str2
ls_duedate = ist_where.str3

choose case ddlb_time.text
	case "오전(12:00)"
		ls_time = "12:00:00"
	case "오후(17:30)"
		ls_time = "17:30:00"
	case "야간(22:30)"
		ls_time = "22:30:00"
end choose

ls_date   = em_day.text
ldt_date  = datetime(date(ls_date), time(ls_time))

// 공정입고일, 납기일 CHK
if ls_date > ls_duedate then
	if MessageBox("납기오류","공정일자가 납기일자 이후 입니다.~n~n" + &
	              "그래도 작업을 계속 진행 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

// 입고일자, 확인일자
if rb_3.checked = true then
	ls_type = "_in"
else
	ls_type = "_inchk"
end if

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_row] = "Y" then
		ll_cnt = ll_cnt + 1
		
		for ll_col = 1 to 3
			ls_job    = dw_1.getitemstring( ll_row, "job" + string(ll_col) )
			
			if ls_wcno = ls_job then
				if rb_1.checked = true then		// 전 공정
					ls_column = "job" + string(ll_col - 1) + ls_type
					dw_1.setitem( ll_row, ls_column, ldt_date )
					exit
				else										// 현 공정
					ls_column = "job" + string(ll_col) + ls_type
					dw_1.setitem( ll_row, ls_column, ldt_date )
					exit
				end if
			end if
		next
	end if
next

if ll_cnt > 0 then
	MessageBox("확인","적용완료")
else
	MessageBox("확인","적용할 대상을 먼저 선택하시기 바랍니다.")
end if

end event

type rb_1 from radiobutton within w_whroutstatus_m
integer x = 1207
integer y = 72
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "앞 공정"
boolean checked = true
end type

type rb_2 from radiobutton within w_whroutstatus_m
integer x = 1207
integer y = 148
integer width = 466
integer height = 52
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79741120
string text = "현재공정"
end type

type cb_6 from commandbutton within w_whroutstatus_m
integer x = 2382
integer y = 136
integer width = 293
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "초기"
end type

event clicked;// 초기
string   ls_datetime, ls_date, ls_time, ls_wcno, ls_job, ls_column, ls_type
long     ll_row, ll_col
datetime ldt_date

ls_wcno   = ist_where.str1

choose case ddlb_time.text
	case "오전"
		ls_time = "10:00:00"
	case "오후"
		ls_time = "15:00:00"
	case "야간"
		ls_time = "19:00:00"
end choose


ls_date   = em_day.text
ldt_date  = datetime(date(ls_date), time(ls_time))
setnull( ldt_date )

// 입고일자, 확인일자
if rb_3.checked = true then
	ls_type = "_in"
else
	ls_type = "_inchk"
end if

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_row] = "Y" then
		for ll_col = 1 to 3
			ls_job    = dw_1.getitemstring( ll_row, "job" + string(ll_col) )
			
			if ls_wcno = ls_job then
				if rb_1.checked = true then		// 전 공정
					ls_column = "job" + string(ll_col - 1) + ls_type
					dw_1.setitem( ll_row, ls_column, ldt_date )
					exit
				else										// 현 공정
					ls_column = "job" + string(ll_col) + ls_type
					dw_1.setitem( ll_row, ls_column, ldt_date )
					exit
				end if
			end if
		next
	end if
next
end event

type rb_3 from radiobutton within w_whroutstatus_m
integer x = 2757
integer y = 312
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "입고일자"
end type

type rb_4 from radiobutton within w_whroutstatus_m
integer x = 3227
integer y = 312
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "확인일자"
boolean checked = true
end type

type cbx_all from checkbox within w_whroutstatus_m
integer x = 78
integer y = 312
integer width = 224
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
string text = "전체"
end type

event clicked;// 전체
string ls_chk
long   ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_row] = ls_chk
next
end event

