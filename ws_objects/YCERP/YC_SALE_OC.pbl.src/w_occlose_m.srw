$PBExportHeader$w_occlose_m.srw
$PBExportComments$년마감 (1998/04/09, 정재수)
forward
global type w_occlose_m from w_inheritance
end type
type em_1 from editmask within w_occlose_m
end type
type st_1 from statictext within w_occlose_m
end type
type hpb_1 from hprogressbar within w_occlose_m
end type
type st_2 from statictext within w_occlose_m
end type
type st_3 from statictext within w_occlose_m
end type
type st_4 from statictext within w_occlose_m
end type
type st_vertical from u_splitbar_vertical within w_occlose_m
end type
type st_5 from statictext within w_occlose_m
end type
type ddlb_fld from dropdownlistbox within w_occlose_m
end type
type ddlb_dwtitles from dropdownlistbox within w_occlose_m
end type
type st_6 from statictext within w_occlose_m
end type
type sle_value from singlelineedit within w_occlose_m
end type
type cb_3 from commandbutton within w_occlose_m
end type
type cb_4 from commandbutton within w_occlose_m
end type
type cb_5 from commandbutton within w_occlose_m
end type
type cb_6 from commandbutton within w_occlose_m
end type
type ddlb_op from dropdownlistbox within w_occlose_m
end type
end forward

global type w_occlose_m from w_inheritance
integer width = 3826
integer height = 1272
string title = "매출 년마감(w_occlose_m)"
boolean resizable = false
boolean center = true
em_1 em_1
st_1 st_1
hpb_1 hpb_1
st_2 st_2
st_3 st_3
st_4 st_4
st_vertical st_vertical
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
ddlb_op ddlb_op
end type
global w_occlose_m w_occlose_m

type variables
string is_dw

end variables

on w_occlose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.hpb_1=create hpb_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_vertical=create st_vertical
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.hpb_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_vertical
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.ddlb_fld
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cb_6
this.Control[iCurrent+17]=this.ddlb_op
end on

on w_occlose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.hpb_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_vertical)
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string  ls_name
long    ll_year

//
hpb_1.visible  = false
hpb_1.position = 0

ll_year   = long(string(today(), 'YYYY')) - 1
em_1.text = string(ll_year)

if em_1.text = string(today(), 'YYYY') then
	MessageBox("확인","당해년도 작업불가 합니다.")
	RETURN
end if

if GF_Permission("매출_년마감", gs_userid) = "Y" then
else
	pb_compute.enabled = false
end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth - (gb_3.x * 2)

dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.y      = dw_1.y
dw_2.width  = newwidth - dw_2.x - gb_3.x
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_occlose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_occlose_m
integer x = 32
integer y = 448
integer width = 3054
integer height = 708
integer taborder = 50
string dataobject = "d_occlose_h"
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_occlose_m
integer x = 32
integer y = 24
integer width = 1271
integer height = 140
string text = "매출 년마감(이월)"
end type

type st_tips from w_inheritance`st_tips within w_occlose_m
end type

type pb_compute from w_inheritance`pb_compute within w_occlose_m
integer x = 2341
integer y = 64
integer taborder = 90
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
vtextalign vtextalign = top!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"년마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//
datetime ldt_close, ldt_make_date
string   ls_close_date, ls_cust_no
long     ll_next_year, ll_row, ll_current_year, ll_cnt
decimal  lr_balance_amt
real     lr_ole_cnt, lr_ole_add

if em_1.text = '' then
	MessageBox("확인","년도를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

if MessageBox("마감","년마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

ll_next_year  = long(em_1.text) + 1
ls_close_date = string(ll_next_year) + '/01/01'
ldt_close     = datetime(date(ls_close_date))
hpb_1.position = 0

ll_current_year = long(em_1.text)

lr_ole_cnt = 100 / dw_1.rowcount()	
for ll_row = 1 to dw_1.rowcount()
	ls_cust_no     = dw_1.getitemstring(ll_row, "cust_no")
	lr_balance_amt = dw_1.getitemdecimal(ll_row, "balance_amt")
	
	SELECT count(*) INTO :ll_cnt FROM opeom
	 WHERE cust_no = :ls_cust_no
	  AND datepart(year, eom_year) = :ll_next_year;		
	if ll_cnt <= 0 then
		INSERT INTO opeom
	   VALUES(:ls_cust_no, :ldt_close, :lr_balance_amt,0,0,0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0,0,0, :ldt_make_date, :gs_userid);
	else
		UPDATE opeom 
			SET balbf_amount = :lr_balance_amt, make_date = :ldt_make_date,
				 make_user = :gs_userid
		 WHERE cust_no = :ls_cust_no
			AND datepart(year, eom_year) = :ll_next_year;
	end if	
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("마감","년마감도중 오류가 발생하였습니다.",exclamation!)
		RETURN
	end if
	
	lr_ole_add = lr_ole_add + lr_ole_cnt
	if lr_ole_add > 99 then
		hpb_1.position = 99
	else
		hpb_1.position = lr_ole_add
	end if
next
COMMIT;

hpb_1.position = 100
MessageBox("마감","년마감(이월)이 작업완료.",information!)


// 선수금
hpb_1.position = 0 ; ll_cnt = 0 ; lr_ole_add = 0 ; lr_ole_cnt = 0
if dw_2.rowcount() <= 0 then
	MessageBox("확인","등록된 선수금 거래처가 없습니다.",information!)
	return
end if

lr_ole_cnt = 100 / dw_2.rowcount()	
for ll_row = 1 to dw_2.rowcount()
	ls_cust_no     = dw_2.getitemstring(ll_row, "cust_no")
	lr_balance_amt = dw_2.getitemdecimal(ll_row, "balance_amt")
	
	SELECT count(*) INTO :ll_cnt FROM opeom_beamt
	 WHERE cust_no = :ls_cust_no
	  AND datepart(year, eom_year) = :ll_next_year;
		
	if ll_cnt <= 0 then
		INSERT INTO opeom_beamt
		VALUES(:ls_cust_no, :ldt_close, :lr_balance_amt,0,0,0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0,0,0, :ldt_make_date, :gs_userid);
	else
		UPDATE opeom_beamt 
			SET balbf_amount = :lr_balance_amt, make_date = :ldt_make_date,
				 make_user = :gs_userid
		 WHERE cust_no = :ls_cust_no
			AND datepart(year, eom_year) = :ll_next_year;
	end if	
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("마감","선수금 년마감도중 오류가 발생하였습니다.",exclamation!)
		RETURN
	end if
	
	lr_ole_add = lr_ole_add + lr_ole_cnt
	if lr_ole_add > 99 then
		hpb_1.position = 99
	else
		hpb_1.position = lr_ole_add
	end if
next
COMMIT;
hpb_1.position = 100
MessageBox("마감","선수금 년마감(이월)이 작업완료.",information!)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type pb_print_part from w_inheritance`pb_print_part within w_occlose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_occlose_m
integer x = 2533
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_occlose_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_occlose_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_occlose_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_occlose_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_occlose_m
integer x = 2149
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
datetime ldt_close, ldt_make_date
string   ls_close_date, ls_cust_no
long     ll_next_year, ll_row, ll_current_year, ll_cnt
decimal  lr_balance_amt
real     lr_ole_cnt, lr_ole_add

if em_1.text = "" then
	MessageBox("확인","년도를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

ll_next_year  = long(em_1.text) + 1
ls_close_date = string(ll_next_year) + '/01/01'
ldt_close     = datetime(date(ls_close_date))

ll_current_year = long(em_1.text)
dw_1.retrieve( ll_current_year )	// 마감년도
dw_2.retrieve( ll_current_year )	// 마감년도(선수금)

if dw_1.rowcount() <= 0 then
	MessageBox("확인","등록된 판매거래처가 없습니다.",information!)
	return
end if

end event

type gb_3 from w_inheritance`gb_3 within w_occlose_m
integer x = 32
integer y = 244
integer width = 3749
integer height = 188
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_occlose_m
integer x = 1362
integer y = 16
integer width = 727
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_occlose_m
integer x = 2112
integer y = 16
integer width = 649
integer height = 216
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_occlose_m
integer x = 3145
integer y = 448
integer width = 635
integer height = 708
integer taborder = 60
string dataobject = "d_occlose_beh"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_occlose_m
integer x = 1819
integer y = 56
integer width = 219
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
string displaydata = ""
end type

type st_1 from statictext within w_occlose_m
integer x = 1403
integer y = 72
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "년마감년도"
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_occlose_m
integer x = 2437
integer y = 312
integer width = 1317
integer height = 76
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_2 from statictext within w_occlose_m
integer x = 50
integer y = 192
integer width = 864
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "거래처 여신현황 기초잔액 만들기"
boolean focusrectangle = false
end type

type st_3 from statictext within w_occlose_m
integer x = 937
integer y = 188
integer width = 402
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "매출_년마감"
boolean focusrectangle = false
end type

type st_4 from statictext within w_occlose_m
integer x = 1413
integer y = 160
integer width = 635
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "선수금 년마감 포함"
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_occlose_m
integer x = 3095
integer y = 448
integer height = 708
boolean bringtotop = true
end type

type st_5 from statictext within w_occlose_m
integer x = 73
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

type ddlb_fld from dropdownlistbox within w_occlose_m
integer x = 261
integer y = 308
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

type ddlb_dwtitles from dropdownlistbox within w_occlose_m
integer x = 293
integer y = 320
integer width = 311
integer height = 88
integer taborder = 140
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

type st_6 from statictext within w_occlose_m
integer x = 731
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

type sle_value from singlelineedit within w_occlose_m
integer x = 1221
integer y = 312
integer width = 526
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_occlose_m
integer x = 1755
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_occlose_m
integer x = 1920
integer y = 312
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_occlose_m
integer x = 2085
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_occlose_m
integer x = 2249
integer y = 312
integer width = 160
integer height = 76
integer taborder = 150
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
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_op from dropdownlistbox within w_occlose_m
integer x = 905
integer y = 304
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

