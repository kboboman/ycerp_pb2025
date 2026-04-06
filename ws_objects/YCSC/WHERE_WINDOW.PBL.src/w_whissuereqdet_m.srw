$PBExportHeader$w_whissuereqdet_m.srw
$PBExportComments$출고의뢰추가관리(상세)(2003/08/20, 이인호)
forward
global type w_whissuereqdet_m from w_inheritance
end type
type dw_4 from datawindow within w_whissuereqdet_m
end type
type st_text from statictext within w_whissuereqdet_m
end type
type cb_1 from commandbutton within w_whissuereqdet_m
end type
type st_1 from statictext within w_whissuereqdet_m
end type
type st_4 from statictext within w_whissuereqdet_m
end type
type ddlb_3 from dropdownlistbox within w_whissuereqdet_m
end type
type st_5 from statictext within w_whissuereqdet_m
end type
type ddlb_4 from dropdownlistbox within w_whissuereqdet_m
end type
type sle_1 from singlelineedit within w_whissuereqdet_m
end type
type cb_2 from commandbutton within w_whissuereqdet_m
end type
type cb_3 from commandbutton within w_whissuereqdet_m
end type
type cb_4 from commandbutton within w_whissuereqdet_m
end type
type cb_5 from commandbutton within w_whissuereqdet_m
end type
type ddlb_dwtitles from dropdownlistbox within w_whissuereqdet_m
end type
end forward

global type w_whissuereqdet_m from w_inheritance
string tag = "출고의뢰 내역(w_whissuereqdet_m)"
integer x = 599
integer y = 864
integer width = 4585
integer height = 2476
string title = "출고의뢰 내역(w_whissuereqdet_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
dw_4 dw_4
st_text st_text
cb_1 cb_1
st_1 st_1
st_4 st_4
ddlb_3 ddlb_3
st_5 st_5
ddlb_4 ddlb_4
sle_1 sle_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
end type
global w_whissuereqdet_m w_whissuereqdet_m

type variables
gs_where ist_where
string is_locnosql
long il_scrollpos
end variables

forward prototypes
public subroutine wf_sel ()
public subroutine wf_visfalse ()
end prototypes

public subroutine wf_sel ();long   ll_row
string ls_flag
decimal ld_orderqty, ld_rlseqty, ld_issueqty

ll_row = dw_2.rowcount()
if ll_row < 1 then return

ls_flag = 'A'
for ll_row = 1 to dw_2.rowcount()
	if dw_2.object.sel[ll_row] = 'N' then
		ls_flag = 'P'
		exit
	end if
	
   ld_orderqty = dw_2.object.saledet_order_qty[ll_row]
	ld_rlseqty  = dw_2.object.saledet_rlse_qty[ll_row]
	ld_issueqty = dw_2.object.saledet_issue_qty[ll_row]
	if ld_orderqty - ld_rlseqty >	ld_issueqty then
		ls_flag = 'P'
		exit
	end if
	
	if ld_rlseqty > 0 and ls_flag <> 'R' then
		ls_flag = 'R'
	end if
next

ll_row = dw_1.getrow()
dw_1.object.issuereqdet_issue_flag[ll_row] = ls_flag
dw_1.accepttext()

end subroutine

public subroutine wf_visfalse ();dw_1.enabled = false
pb_insert.enabled = false
pb_delete.enabled = false
cb_1.enabled = false

end subroutine

on w_whissuereqdet_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.st_text=create st_text
this.cb_1=create cb_1
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_3=create ddlb_3
this.st_5=create st_5
this.ddlb_4=create ddlb_4
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.st_text
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.ddlb_3
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.ddlb_4
this.Control[iCurrent+9]=this.sle_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.ddlb_dwtitles
end on

on w_whissuereqdet_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.st_text)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_3)
destroy(this.st_5)
destroy(this.ddlb_4)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
end on

event open;//
ist_where = message.powerobjectparm

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_4.settransobject(sqlca)
dw_4.insertrow(0)

ddlb_dwtitles.visible = false

string ls_loc
dw_4.object.loc_no[1] = 'WS00000000'
if gs_userid = "1999010s" then
else
	dw_4.enabled = false
end if

// issuereqdet.req_flag = 'A' : 출고의뢰 .
// issuereqdet.req_flag = 'B' : "생산확인" text
// issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
// issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
if ist_where.str4 = "A" then
	st_text.text      = "출고의뢰내역"
else
	dw_2.object.sel.protect                    = 1
	dw_2.object.saledet_issue_qty.protect      = 1
	dw_2.object.saledet_stock_issue.protect    = 1
	dw_1.object.issuereqdet_issue_flag.protect = 1
	
	cb_1.enabled      = false
	st_text.backcolor = rgb(0,128,0)
	st_text.text      = "생산확인내역"
end if

integer li_row

li_row = integer(ist_where.str3)
dw_2.object.saledet_loc_no.protect = 1
dw_2.reset()
dw_1.retrieve(date(ist_where.str1), ist_where.str2, li_row, ist_where.str4)
dw_1.scrolltorow( li_row )

if ist_where.chk = "N" then
	pb_retrieve.enabled = false
	pb_delete.enabled   = false
	pb_save.enabled     = false
	pb_insert.enabled   = false
	cb_1.enabled        = false
end if

//
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_3, ddlb_dwtitles )

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whissuereqdet_m
integer x = 3881
integer y = 40
integer width = 338
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장확인"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;//
pb_insert.triggerevent(clicked!)		// 저장

ist_where.chk = 'Y'
CloseWithReturn(parent, ist_where)

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whissuereqdet_m
integer x = 37
integer y = 308
integer width = 4498
integer height = 708
string dataobject = "d_whissuereqdet_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
// issuereqdet.req_flag = 'A' : 출고의뢰 .
// issuereqdet.req_flag = 'B' : "생산확인" text
// issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
// issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
string ls_order
long   ll_row

ll_row = this.getrow()
if ll_row < 1 then 
	dw_2.reset()
	return
end if

//this.selectrow(0, false)
//this.selectrow(ll_row, true)

ls_order = this.object.issuereqdet_sale_no[ll_row]
dw_2.retrieve(ls_order)

end event

event dw_1::doubleclicked;call super::doubleclicked;//
if row < 1 then return

gs_where lstr_where2
lstr_where2.str1 = 'A'
lstr_where2.str2 = dw_1.object.issuereqdet_sale_no[row]
OpenWithParm(w_whsaleheader_w, lstr_where2)

end event

event dw_1::losefocus;call super::losefocus;//
this.accepttext()

end event

event dw_1::itemchanged;call super::itemchanged;//
long ll_rowcnt, ll_row

this.accepttext()
choose case dwo.name
	case 'issuereqdet_issue_flag'
		if data = 'A' or data = 'R' then
			cb_1.postevent(clicked!)
		end if

	case 'issuereqdet_issue_schedule'
		if data ='F' then
			ll_rowcnt = dw_2.rowcount()
			if ll_rowcnt < 1 then return
			for ll_row = 1 to ll_rowcnt
				dw_2.object.saledet_loc_no[ll_row] = 'WS00000007'
			next
			dw_2.accepttext()
		end if 
end choose


end event

event dw_1::retrieveend;call super::retrieveend;//
if rowcount < 1 then return

if this.object.confirm_flag[1] = 'Y' then
	pb_retrieve.enabled = false
	pb_insert.enabled   = false
	pb_delete.enabled   = false
	pb_save.enabled     = false
	cb_1.enabled        = false
else
	pb_retrieve.enabled = true
	pb_insert.enabled   = true
	pb_delete.enabled   = true
	pb_save.enabled     = true
	cb_1.enabled        = true
end if

end event

event dw_1::clicked;call super::clicked;//
if row < 1 then return
GF_DWClick2Info(this, ddlb_3, ddlb_4, sle_1, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_whissuereqdet_m
integer x = 37
integer y = 1032
integer width = 4498
integer height = 1308
string dataobject = "d_whissuereqdet_m2"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;call super::itemchanged;//
string  ls_locno, ls_null
integer ll_row
decimal ld_orderqty, ld_rlseqty, ld_stockqty

this.accepttext()
ll_row = this.getrow()

if dw_1.object.issuereqdet_issue_schedule[dw_1.getrow()] = 'F' then
	ls_locno = 'WS00000007'
else
	ls_locno = dw_4.object.loc_no[1]
end if

setnull(ls_null)
choose case dwo.name
	//1998-09-26 수정(START)	
	case "sel"
		if data = 'Y' then
			this.object.sel[ll_row] = 'Y'
			this.object.saledet_loc_no[ll_row] = ls_locno
         ld_orderqty = this.object.saledet_order_qty[ll_row]
			ld_rlseqty  = this.object.saledet_rlse_qty[ll_row]
         ld_stockqty = this.object.saledet_stock_qty[ll_row]
			if ( ld_orderqty > ld_rlseqty ) then
				this.setitem(ll_row, "saledet_issue_qty", ( ld_orderqty - ld_rlseqty ))
				this.setitem(ll_row, "saledet_stock_issue", ( ld_stockqty - this.object.saledet_stock_do[ll_row] ))
			end if
			this.accepttext()
		else
			this.object.saledet_loc_no[ll_row]      = ls_null
			this.object.saledet_issue_qty[ll_row]   = 0
			this.object.saledet_stock_issue[ll_row] = 0
		end if
		
	case "saledet_stock_issue"
		if this.getitemdecimal(ll_row, "saledet_stock_issue") > this.getitemdecimal(ll_row, "saledet_issue_qty") then
			messagebox("확인", "장기재고수량이 선정수량보다 클수 없습니다.")
			return 1
		end if
end choose

wf_sel()

end event

event dw_2::clicked;call super::clicked;//
if row < 1 then return
this.scrolltorow(row)

end event

event dw_2::itemerror;call super::itemerror;integer ll_row

this.setredraw(false)
ll_row = this.getrow()
choose case dwo.name
	case 'saledet_stock_issue'
		this.object.saledet_stock_issue[ll_row] = 0
	case else
		this.object.saledet_issue_qty[ll_row] = 0
end choose
this.accepttext()
this.setredraw(true)

return 1
end event

event dw_2::losefocus;call super::losefocus;this.accepttext()

end event

type st_title from w_inheritance`st_title within w_whissuereqdet_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whissuereqdet_m
end type

type pb_compute from w_inheritance`pb_compute within w_whissuereqdet_m
boolean visible = false
integer x = 448
integer y = 1704
integer width = 133
integer height = 96
string picturename = ""
end type

type pb_print_part from w_inheritance`pb_print_part within w_whissuereqdet_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whissuereqdet_m
integer x = 4229
integer y = 40
integer width = 274
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
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

type pb_print from w_inheritance`pb_print within w_whissuereqdet_m
boolean visible = false
integer x = 3109
integer y = 24
integer width = 261
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

type pb_cancel from w_inheritance`pb_cancel within w_whissuereqdet_m
boolean visible = false
integer x = 608
integer y = 1704
integer width = 133
integer height = 96
string picturename = ""
end type

type pb_delete from w_inheritance`pb_delete within w_whissuereqdet_m
integer x = 3511
integer y = 40
integer width = 169
integer height = 136
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_delete::clicked;call super::clicked;long ll_row
string ls_order

dw_1.accepttext()

ll_row = dw_1.getrow()

if ll_row < 1 then return
dw_1.setredraw(false)
dw_1.deleterow(ll_row)
if ll_row < 1 or dw_1.rowcount() < 1 then 
	dw_1.setredraw(true)
	return
end if
if dw_1.rowcount() > ll_row then
	ls_order = dw_1.object.issuereqdet_sale_no[ll_row]
	dw_2.retrieve(ls_order)
end if
dw_1.setredraw(true)


end event

type pb_insert from w_inheritance`pb_insert within w_whissuereqdet_m
integer x = 3689
integer y = 40
integer width = 169
integer height = 136
integer textsize = -12
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;//

dw_1.accepttext()
dw_2.accepttext()

// A:출고의뢰내역 P:생산확인요청내역
if ist_where.str4 = 'A' then
	wf_update2(dw_1, dw_2, "N")
else
	wf_update1(dw_1, "N")
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whissuereqdet_m
integer x = 3333
integer y = 40
integer width = 169
integer height = 136
string picturename = "c:\bmp\pencil.bmp"
end type

event pb_retrieve::mousemove;//
end event

event pb_retrieve::clicked;call super::clicked;//
gs_where lstr_where2

lstr_where2.str1 = 'D'
OpenWithParm( w_whsaleheader_w, lstr_where2 )

dw_1.accepttext()
if dw_1.rowcount() < 1 then return

long   ll_row
string ls_order

ll_row   = dw_1.getrow()
ls_order = dw_1.object.issuereqdet_sale_no[ll_row]
dw_2.retrieve( ls_order )

end event

type gb_3 from w_inheritance`gb_3 within w_whissuereqdet_m
boolean visible = false
integer x = 9
integer y = 0
integer width = 142
integer height = 96
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whissuereqdet_m
integer x = 2363
integer y = 0
integer width = 910
integer height = 196
integer textsize = -8
end type

type gb_1 from w_inheritance`gb_1 within w_whissuereqdet_m
integer x = 3291
integer y = 0
integer width = 1243
integer height = 196
integer weight = 400
long textcolor = 0
end type

type dw_4 from datawindow within w_whissuereqdet_m
integer x = 2395
integer y = 64
integer width = 846
integer height = 92
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_text from statictext within w_whissuereqdet_m
integer x = 41
integer y = 32
integer width = 699
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 8388608
string text = "출고의뢰내역"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whissuereqdet_m
integer x = 4174
integer y = 216
integer width = 357
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "전체선택"
end type

event clicked;//
decimal ld_orderqty, ld_rlseqty
long   ll_dw2row, ll_dw5row, ll_cnt
string ls_flag,   ls_locno

if dw_2.rowcount() < 1 then return

if dw_1.object.issuereqdet_issue_schedule[dw_1.getrow()] = "F" then
	ls_locno = "WS00000007"		// 서울화곡저장소
else
	ls_locno = dw_4.object.loc_no[1]
end if

ls_flag = "A"
for ll_dw2row = 1 to dw_2.rowcount()
	dw_2.scrolltorow(ll_dw2row)
	dw_2.object.sel[ll_dw2row]  = "Y"
	dw_2.object.saledet_loc_no[ll_dw2row]      = ls_locno
	dw_2.object.saledet_stock_issue[ll_dw2row] = dw_2.object.saledet_stock_qty[ll_dw2row]

   ld_orderqty = dw_2.object.saledet_order_qty[ll_dw2row]
	ld_rlseqty  = dw_2.object.saledet_rlse_qty[ll_dw2row]
	if ld_rlseqty > 0 and ls_flag <> "R" then
		ls_flag = "R"
	end if

	if ld_orderqty > ld_rlseqty then
		dw_2.setitem(ll_dw2row, "saledet_issue_qty", ( ld_orderqty - ld_rlseqty ))
	end if
next

ll_cnt = dw_1.getrow()
dw_1.object.issuereqdet_issue_flag[ll_cnt] = ls_flag

dw_1.accepttext()
dw_2.accepttext()
pb_insert.postevent(clicked!)		// 저장

end event

type st_1 from statictext within w_whissuereqdet_m
integer x = 773
integer y = 32
integer width = 1079
integer height = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "연락처 입력시 한칸씩 띄어쓰기를 하시면 여러줄로 나옵니다."
boolean focusrectangle = false
end type

event clicked;st_1.visible = false
end event

type st_4 from statictext within w_whissuereqdet_m
integer x = 78
integer y = 224
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
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within w_whissuereqdet_m
integer x = 256
integer y = 208
integer width = 480
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

type st_5 from statictext within w_whissuereqdet_m
integer x = 768
integer y = 224
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

type ddlb_4 from dropdownlistbox within w_whissuereqdet_m
integer x = 937
integer y = 208
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

type sle_1 from singlelineedit within w_whissuereqdet_m
integer x = 1253
integer y = 216
integer width = 567
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_2 from commandbutton within w_whissuereqdet_m
integer x = 1824
integer y = 216
integer width = 160
integer height = 76
integer taborder = 60
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
GF_DW2Filter(arg_dw, ddlb_3, ddlb_4, sle_1, ddlb_dwtitles)

end event

type cb_3 from commandbutton within w_whissuereqdet_m
integer x = 1989
integer y = 216
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_4.text = ""
ddlb_3.text = ""
sle_1.text  = ""

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_4 from commandbutton within w_whissuereqdet_m
integer x = 2153
integer y = 216
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_3, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_whissuereqdet_m
integer x = 2318
integer y = 216
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_3, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_whissuereqdet_m
integer x = 279
integer y = 220
integer width = 480
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

