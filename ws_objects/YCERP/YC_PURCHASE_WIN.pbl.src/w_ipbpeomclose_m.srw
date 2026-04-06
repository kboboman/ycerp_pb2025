$PBExportHeader$w_ipbpeomclose_m.srw
$PBExportComments$조업자재년마감 (1999/06/10, 이인호)
forward 
global type w_ipbpeomclose_m from w_inheritance
end type
type em_1 from editmask within w_ipbpeomclose_m
end type
type st_1 from statictext within w_ipbpeomclose_m
end type
type hpb_1 from hprogressbar within w_ipbpeomclose_m
end type
type st_4 from statictext within w_ipbpeomclose_m
end type
type ddlb_fld from dropdownlistbox within w_ipbpeomclose_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipbpeomclose_m
end type
type st_7 from statictext within w_ipbpeomclose_m
end type
type ddlb_op from dropdownlistbox within w_ipbpeomclose_m
end type
type sle_value from singlelineedit within w_ipbpeomclose_m
end type
type cb_1 from commandbutton within w_ipbpeomclose_m
end type
type cb_2 from commandbutton within w_ipbpeomclose_m
end type
type cb_3 from commandbutton within w_ipbpeomclose_m
end type
type cb_4 from commandbutton within w_ipbpeomclose_m
end type
end forward

global type w_ipbpeomclose_m from w_inheritance
integer width = 3319
integer height = 1900
string title = "조업자재 년마감(w_ipbpeomclose_m)"
boolean resizable = false
boolean center = true
em_1 em_1
st_1 st_1
hpb_1 hpb_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
end type
global w_ipbpeomclose_m w_ipbpeomclose_m

on w_ipbpeomclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.hpb_1=create hpb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.hpb_1
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.ddlb_op
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_4
end on

on w_ipbpeomclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.hpb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

em_1.text     = string(today(), 'YYYY')
hpb_1.visible = false


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_ipbpeomclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipbpeomclose_m
integer x = 32
integer y = 420
integer width = 3232
integer height = 1360
integer taborder = 50
string dataobject = "d_ipbpeomclose_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = StyleLowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ipbpeomclose_m
integer x = 32
integer y = 20
integer width = 1157
integer height = 140
string text = "조업자재 년마감"
end type

type st_tips from w_inheritance`st_tips within w_ipbpeomclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipbpeomclose_m
integer x = 2277
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

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string   ls_close_date, ls_supp_no
long     ll_year, ll_row, ll_cnt
decimal  lr_balance_amt
datetime ldt_close, ldt_make_date

if MessageBox("확인","년마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then RETURN

hpb_1.visible  = true
hpb_1.position = 0

ll_year  = long(em_1.text) + 1

for ll_row = 1 to dw_1.rowcount()
	hpb_1.position = (ll_row / dw_1.rowcount()) * 100
	
	ls_supp_no     = dw_1.getitemstring(ll_row, "supp_no")
	lr_balance_amt = dw_1.getitemdecimal(ll_row, "balance_amt")
	
	SELECT count(*) INTO :ll_cnt FROM bpeom WHERE area_no = :gs_area AND supp_no = :ls_supp_no AND eom_year = :ll_year;		
	if ll_cnt <= 0 then
		INSERT INTO bpeom
		VALUES(:gs_area, :ls_supp_no, :ll_year, :lr_balance_amt,0,0,0,0,0,0,0,0,0,0,0,0,
             0,0,0,0,0,0,0,0,0,0,0,0, :ldt_make_date, :gs_userid);
	else
		UPDATE bpeom 
			SET balbf_amount = :lr_balance_amt, make_date = :ldt_make_date, make_user = :gs_userid
		 WHERE area_no = :gs_area AND supp_no = :ls_supp_no AND eom_year = :ll_year;
	end if	
	if sqlca.sqlcode <> 0 then
		ROLLBACK;
		MessageBox("확인","년마감도중 오류가 발생하였습니다. ~r~n" + sqlca.sqlerrtext, exclamation!)
		RETURN
	end if
next
COMMIT;
hpb_1.visible = false

MessageBox("확인","년마감 작업완료",information!)


end event

type pb_print_part from w_inheritance`pb_print_part within w_ipbpeomclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipbpeomclose_m
integer x = 2464
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbpeomclose_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipbpeomclose_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ipbpeomclose_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ipbpeomclose_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipbpeomclose_m
integer x = 2075
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
long  ll_year, ll_cyear

if em_1.text = "" then
	MessageBox("확인","년도를 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

ll_year  = long(em_1.text) + 1
ll_cyear = long(em_1.text)

dw_1.retrieve( gs_area, ll_cyear )
if dw_1.rowcount() < 1 then
	MessageBox("확인","등록된 조업자재 거래처가 없습니다.",information!)
	RETURN
end if


end event

type gb_3 from w_inheritance`gb_3 within w_ipbpeomclose_m
integer x = 32
integer y = 244
integer width = 3232
integer height = 168
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ipbpeomclose_m
integer x = 1243
integer y = 16
integer width = 768
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipbpeomclose_m
integer x = 2034
integer y = 16
integer width = 658
integer height = 216
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ipbpeomclose_m
boolean visible = false
integer x = 439
integer y = 260
integer taborder = 60
end type

type em_1 from editmask within w_ipbpeomclose_m
integer x = 1723
integer y = 88
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

type st_1 from statictext within w_ipbpeomclose_m
integer x = 1307
integer y = 100
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

type hpb_1 from hprogressbar within w_ipbpeomclose_m
integer x = 2341
integer y = 296
integer width = 850
integer height = 88
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_4 from statictext within w_ipbpeomclose_m
integer x = 87
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_ipbpeomclose_m
integer x = 265
integer y = 300
integer width = 393
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

type ddlb_dwtitles from dropdownlistbox within w_ipbpeomclose_m
integer x = 288
integer y = 308
integer width = 270
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

type st_7 from statictext within w_ipbpeomclose_m
integer x = 681
integer y = 320
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

type ddlb_op from dropdownlistbox within w_ipbpeomclose_m
integer x = 864
integer y = 300
integer width = 293
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

type sle_value from singlelineedit within w_ipbpeomclose_m
integer x = 1166
integer y = 304
integer width = 475
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

type cb_1 from commandbutton within w_ipbpeomclose_m
integer x = 1650
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

type cb_2 from commandbutton within w_ipbpeomclose_m
integer x = 1815
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ipbpeomclose_m
integer x = 1979
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_ipbpeomclose_m
integer x = 2144
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

