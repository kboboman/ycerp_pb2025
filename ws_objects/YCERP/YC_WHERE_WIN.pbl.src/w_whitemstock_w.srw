$PBExportHeader$w_whitemstock_w.srw
$PBExportComments$장기재고조회(2003/08/26,이인호)
forward 
global type w_whitemstock_w from window
end type
type cbx_openclose from checkbox within w_whitemstock_w
end type
type cb_7 from commandbutton within w_whitemstock_w
end type
type cbx_all from checkbox within w_whitemstock_w
end type
type cb_6 from commandbutton within w_whitemstock_w
end type
type cb_5 from commandbutton within w_whitemstock_w
end type
type cb_4 from commandbutton within w_whitemstock_w
end type
type cb_3 from commandbutton within w_whitemstock_w
end type
type sle_value from singlelineedit within w_whitemstock_w
end type
type ddlb_op from dropdownlistbox within w_whitemstock_w
end type
type st_9 from statictext within w_whitemstock_w
end type
type ddlb_fld from dropdownlistbox within w_whitemstock_w
end type
type st_7 from statictext within w_whitemstock_w
end type
type em_1 from editmask within w_whitemstock_w
end type
type st_8 from statictext within w_whitemstock_w
end type
type dw_area from datawindow within w_whitemstock_w
end type
type cbx_3 from checkbox within w_whitemstock_w
end type
type st_location from statictext within w_whitemstock_w
end type
type st_6 from statictext within w_whitemstock_w
end type
type em_2 from editmask within w_whitemstock_w
end type
type dw_3 from datawindow within w_whitemstock_w
end type
type st_2 from statictext within w_whitemstock_w
end type
type dw_2 from datawindow within w_whitemstock_w
end type
type cbx_1 from checkbox within w_whitemstock_w
end type
type st_1 from statictext within w_whitemstock_w
end type
type em_3 from editmask within w_whitemstock_w
end type
type pb_1 from picturebutton within w_whitemstock_w
end type
type cb_cancel from commandbutton within w_whitemstock_w
end type
type pb_ok from picturebutton within w_whitemstock_w
end type
type dw_1 from datawindow within w_whitemstock_w
end type
type gb_1 from groupbox within w_whitemstock_w
end type
type gb_2 from groupbox within w_whitemstock_w
end type
type gb_3 from groupbox within w_whitemstock_w
end type
type gb_4 from groupbox within w_whitemstock_w
end type
type cb_2 from commandbutton within w_whitemstock_w
end type
type cb_1 from commandbutton within w_whitemstock_w
end type
type ddlb_dwtitles from dropdownlistbox within w_whitemstock_w
end type
end forward

global type w_whitemstock_w from window
integer x = 873
integer y = 476
integer width = 4256
integer height = 2428
boolean titlebar = true
string title = "장기재고조회(w_whitemstock_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cbx_openclose cbx_openclose
cb_7 cb_7
cbx_all cbx_all
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
sle_value sle_value
ddlb_op ddlb_op
st_9 st_9
ddlb_fld ddlb_fld
st_7 st_7
em_1 em_1
st_8 st_8
dw_area dw_area
cbx_3 cbx_3
st_location st_location
st_6 st_6
em_2 em_2
dw_3 dw_3
st_2 st_2
dw_2 dw_2
cbx_1 cbx_1
st_1 st_1
em_3 em_3
pb_1 pb_1
cb_cancel cb_cancel
pb_ok pb_ok
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
cb_2 cb_2
cb_1 cb_1
ddlb_dwtitles ddlb_dwtitles
end type
global w_whitemstock_w w_whitemstock_w

type variables
gs_where2 istr_where
string is_loc

datawindowchild idwc_area

end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_whitemstock_w.create
this.cbx_openclose=create cbx_openclose
this.cb_7=create cb_7
this.cbx_all=create cbx_all
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_9=create st_9
this.ddlb_fld=create ddlb_fld
this.st_7=create st_7
this.em_1=create em_1
this.st_8=create st_8
this.dw_area=create dw_area
this.cbx_3=create cbx_3
this.st_location=create st_location
this.st_6=create st_6
this.em_2=create em_2
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_2=create dw_2
this.cbx_1=create cbx_1
this.st_1=create st_1
this.em_3=create em_3
this.pb_1=create pb_1
this.cb_cancel=create cb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_dwtitles=create ddlb_dwtitles
this.Control[]={this.cbx_openclose,&
this.cb_7,&
this.cbx_all,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.sle_value,&
this.ddlb_op,&
this.st_9,&
this.ddlb_fld,&
this.st_7,&
this.em_1,&
this.st_8,&
this.dw_area,&
this.cbx_3,&
this.st_location,&
this.st_6,&
this.em_2,&
this.dw_3,&
this.st_2,&
this.dw_2,&
this.cbx_1,&
this.st_1,&
this.em_3,&
this.pb_1,&
this.cb_cancel,&
this.pb_ok,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.cb_2,&
this.cb_1,&
this.ddlb_dwtitles}
end on

on w_whitemstock_w.destroy
destroy(this.cbx_openclose)
destroy(this.cb_7)
destroy(this.cbx_all)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_9)
destroy(this.ddlb_fld)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.st_8)
destroy(this.dw_area)
destroy(this.cbx_3)
destroy(this.st_location)
destroy(this.st_6)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.em_3)
destroy(this.pb_1)
destroy(this.cb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_dwtitles)
end on

event open;//
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

//
datetime ldt_sdate, ldt_edate

SELECT top 1 DateAdd(month, -3, getdate()), DateAdd(day, -1, getdate()) 
  INTO :ldt_sdate, :ldt_edate 
  FROM login;

em_1.text = string(ldt_sdate, "yyyy/mm/dd")
em_2.text = string(ldt_edate, "yyyy/mm/dd")

//
string ls_location, ls_area

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_2.visible  = false
dw_3.visible  = false

cb_1.visible  = false
cb_2.visible  = false
cbx_3.visible = false

istr_where = Message.PowerObjectParm

is_loc = istr_where.chk

SELECT area_no, loc_name INTO :ls_area, :ls_location FROM location WHERE loc_no = :is_loc;
st_location.text = ls_location

// 사업장
dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = ls_area
dw_area.enabled = false


end event

type cbx_openclose from checkbox within w_whitemstock_w
integer x = 2633
integer y = 56
integer width = 375
integer height = 64
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
boolean checked = true
end type

type cb_7 from commandbutton within w_whitemstock_w
integer x = 3246
integer y = 320
integer width = 320
integer height = 84
integer taborder = 60
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
long   ll_row, ll_cnt

ll_row    = dw_1.getrow()

ls_wcno   = dw_1.object.wc_no[ll_row]
ls_saleno = dw_1.object.sale_no[ll_row]
ls_seqno  = string(dw_1.object.seq_no[ll_row])

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

end event

type cbx_all from checkbox within w_whitemstock_w
integer x = 64
integer y = 332
integer width = 219
integer height = 64
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
	for ll_row = 1 to dw_1.rowcount()
		dw_1.SelectRow( ll_row, Not dw_1.IsSelected(ll_row) )
	next
else
	dw_1.SelectRow( 0, false )
end if

end event

type cb_6 from commandbutton within w_whitemstock_w
integer x = 2578
integer y = 320
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_whitemstock_w
integer x = 2414
integer y = 320
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_4 from commandbutton within w_whitemstock_w
integer x = 2249
integer y = 320
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_whitemstock_w
integer x = 2085
integer y = 320
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
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type sle_value from singlelineedit within w_whitemstock_w
integer x = 1513
integer y = 320
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

type ddlb_op from dropdownlistbox within w_whitemstock_w
integer x = 1193
integer y = 316
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

type st_9 from statictext within w_whitemstock_w
integer x = 1024
integer y = 336
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

type ddlb_fld from dropdownlistbox within w_whitemstock_w
integer x = 526
integer y = 316
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

type st_7 from statictext within w_whitemstock_w
integer x = 338
integer y = 336
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

type em_1 from editmask within w_whitemstock_w
integer x = 1714
integer y = 136
integer width = 407
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type st_8 from statictext within w_whitemstock_w
integer x = 1106
integer y = 56
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

type dw_area from datawindow within w_whitemstock_w
integer x = 1102
integer y = 140
integer width = 526
integer height = 80
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type cbx_3 from checkbox within w_whitemstock_w
integer x = 119
integer width = 261
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "none"
boolean checked = true
end type

event clicked;//
if this.checked = true then
	dw_1.dataobject = "d_mpsfcdo_r"
else
	dw_1.dataobject = "d_whitemstock_s"
end if

dw_1.SetTransObject( SQLCA )

end event

type st_location from statictext within w_whitemstock_w
integer x = 50
integer y = 204
integer width = 681
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "저장소"
boolean focusrectangle = false
end type

type st_6 from statictext within w_whitemstock_w
integer x = 32
integer y = 28
integer width = 997
integer height = 140
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "저장소 재고조회"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type em_2 from editmask within w_whitemstock_w
integer x = 2130
integer y = 136
integer width = 407
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_whitemstock_w
integer x = 933
integer y = 188
integer width = 82
integer height = 68
integer taborder = 50
string title = "none"
string dataobject = "d_irusersilsa_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_whitemstock_w
integer x = 1714
integer y = 56
integer width = 823
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "수주일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_whitemstock_w
integer x = 837
integer y = 188
integer width = 82
integer height = 68
integer taborder = 40
string title = "none"
string dataobject = "d_whitemstock_s2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_whitemstock_w
integer x = 2770
integer y = 332
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
string text = "선택후 클릭"
end type

event clicked;//dw_1.selectrow(0,this.checked)

end event

type st_1 from statictext within w_whitemstock_w
integer x = 2807
integer y = 144
integer width = 242
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일 경과"
boolean focusrectangle = false
end type

type em_3 from editmask within w_whitemstock_w
integer x = 2633
integer y = 124
integer width = 151
integer height = 92
integer taborder = 30
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "15"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type pb_1 from picturebutton within w_whitemstock_w
integer x = 3081
integer y = 84
integer width = 233
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
vtextalign vtextalign = vcenter!
end type

event clicked;// 조회
string   ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime 
datetime ldt_date, ldt_sdate, ldt_edate
date     ld_date 
int      li_int
string   ls_flag

debugbreak()

ls_flag = '%'

SELECT top 1 getdate() INTO :ldt_date FROM login;

ld_date = date(ldt_date)
ld_date = date(string(ld_date, 'yyyy/mm/dd'))
li_int  = integer(em_3.text) * -1
ld_date = RelativeDate(ld_date, li_int)

//
ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.accepttext()
ls_area     = dw_area.object.area[1]

// 담당자
//dw_4.accepttext()
ls_salesman = "%"		// dw_4.object.user[1]

// 마감제외
if cbx_openclose.checked = true then
	ls_openclose = "O"
else
	ls_openclose = ""
end if

// 경과
ls_calctime = em_3.text

if cbx_3.checked = true then
	dw_1.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime )
	if dw_1.rowcount() < 1 then
		MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
	else
		MessageBox("확인","조회완료")
	end if
else
	dw_1.retrieve( is_loc, ld_date, ls_flag )
end if


end event

type cb_cancel from commandbutton within w_whitemstock_w
integer x = 3566
integer y = 84
integer width = 233
integer height = 120
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;//
istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type pb_ok from picturebutton within w_whitemstock_w
integer x = 3323
integer y = 84
integer width = 233
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
vtextalign vtextalign = vcenter!
end type

event clicked;// 확인
long ll_row, ll_cnt

debugbreak()

istr_where.chk = "Y"

ll_cnt = 0
for ll_row = 1 to dw_1.rowcount()
	if dw_1.IsSelected(ll_row) = true then
		ll_cnt = ll_cnt + 1
		
		istr_where.str1[ll_cnt] = dw_1.object.item_no[ll_row]
		istr_where.str2[ll_cnt] = dw_1.object.qa[ll_row]
		if dw_1.dataobject = "d_whitemstock_s" then
			istr_where.str3[ll_cnt] = string(dw_1.object.qoh[ll_row])
		else
			istr_where.str3[ll_cnt] = string(dw_1.object.order_qty[ll_row] - dw_1.object.ship_qty[ll_row])
		end if
		istr_where.name[ll_cnt] = dw_1.object.item_name[ll_row]
	end if
next

if ll_cnt = 0 then 
	istr_where.chk = "N"
end if

CloseWithReturn(parent, istr_where)

end event

type dw_1 from datawindow within w_whitemstock_w
string tag = "d_whitemstock_s"
integer x = 32
integer y = 444
integer width = 4178
integer height = 1868
integer taborder = 30
string title = "d_mpsfcdo_r"
string dataobject = "d_mpsfcdo_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

//
if isnull(row) OR row < 1 then return

this.scrolltorow(row)

// 선택
if cbx_1.checked = true then
	dw_1.selectrow(row, not dw_1.isselected(row))
end if

end event

type gb_1 from groupbox within w_whitemstock_w
integer x = 1074
integer y = 16
integer width = 585
integer height = 220
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_whitemstock_w
integer x = 2597
integer y = 16
integer width = 1239
integer height = 220
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_whitemstock_w
integer x = 32
integer y = 268
integer width = 4178
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_whitemstock_w
integer x = 1682
integer y = 16
integer width = 891
integer height = 220
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_2 from commandbutton within w_whitemstock_w
integer x = 448
integer width = 238
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;// 조회
string ls_item, ls_qa
date   ld_date
long   ll_row

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then return

ls_item = dw_1.object.item_no[ll_row]
ls_qa   = dw_1.object.qa[ll_row]
ld_date = date(em_2.text)

dw_2.retrieve( ld_date, is_loc, ls_item, ls_qa )

end event

type cb_1 from commandbutton within w_whitemstock_w
integer x = 699
integer width = 238
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
end type

event clicked;// 조회
long   ll_day,  ll_row
string ls_item, ls_qa, ls_loc

ll_row = dw_1.getrow()
if isnull(ll_row) OR ll_row < 1 then return

ls_item = dw_1.object.item_no[ll_row]
ls_qa   = dw_1.object.qa[ll_row]

dw_3.retrieve( date(em_2.text), RelativeDate(today(), 1), em_2.text, ls_item, ls_qa, is_loc )

end event

type ddlb_dwtitles from dropdownlistbox within w_whitemstock_w
integer x = 567
integer y = 324
integer width = 311
integer height = 88
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
end type

