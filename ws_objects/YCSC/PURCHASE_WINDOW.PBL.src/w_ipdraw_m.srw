$PBExportHeader$w_ipdraw_m.srw
$PBExportComments$도면번호관리 (2001/07/24, 이인호)
forward
global type w_ipdraw_m from w_inheritance
end type
type st_1 from statictext within w_ipdraw_m
end type
type pb_1 from picturebutton within w_ipdraw_m
end type
type st_4 from statictext within w_ipdraw_m
end type
type ddlb_fld from dropdownlistbox within w_ipdraw_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ipdraw_m
end type
type st_7 from statictext within w_ipdraw_m
end type
type ddlb_op from dropdownlistbox within w_ipdraw_m
end type
type sle_value from singlelineedit within w_ipdraw_m
end type
type cb_19 from commandbutton within w_ipdraw_m
end type
type cb_20 from commandbutton within w_ipdraw_m
end type
type cb_21 from commandbutton within w_ipdraw_m
end type
type cb_22 from commandbutton within w_ipdraw_m
end type
type pb_2 from picturebutton within w_ipdraw_m
end type
type pb_3 from picturebutton within w_ipdraw_m
end type
type pb_4 from picturebutton within w_ipdraw_m
end type
type st_2 from statictext within w_ipdraw_m
end type
type gb_4 from groupbox within w_ipdraw_m
end type
type dw_3 from datawindow within w_ipdraw_m
end type
type st_3 from statictext within w_ipdraw_m
end type
end forward

global type w_ipdraw_m from w_inheritance
integer x = 750
integer y = 4
integer width = 4699
integer height = 2316
string title = "구매처별 도면관리(w_ipdraw_m)"
st_1 st_1
pb_1 pb_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_2 st_2
gb_4 gb_4
dw_3 dw_3
st_3 st_3
end type
global w_ipdraw_m w_ipdraw_m

type variables
st_print  i_print
date id_start, id_end
datawindowchild idwc_supp
end variables

forward prototypes
public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, integer ai_row, integer ai_flag)
end prototypes

public function boolean wf_itemselect (datawindow arg_dw, string arg_ms, integer ai_row, integer ai_flag);// wf_itemselect ( arg_dw datawindow, arg_ms string, ai_row integer, ai_flag integer )
gs_where2 lstr_where
long ll_row, ll_cnt, ll_row1

arg_dw.accepttext()

lstr_where.chk = arg_ms //'M' //M:multi S:single
ll_row1 = arg_dw.rowcount() + 1
if arg_ms = 'S' then
	if arg_dw = dw_3 or ai_flag = 8 then
		lstr_where.str1[1] = arg_dw.object.item_no[ai_row]
		lstr_where.str2[1] = arg_dw.object.qa[ai_row]
	end if
end if

OpenwithParm(w_whitemlocqohmulti_w,lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return false

string ls_supp
dec {3} ld_cost
date ld_date
long ll,kk

ll = UpperBound(lstr_where.str1)
kk = UpperBound(lstr_where.str2)
arg_dw.setredraw( false )
for ll_row = 1 to UpperBound(lstr_where.str1)	
	if arg_ms = 'M' then
		ll_cnt = arg_dw.insertrow(0)
	else
		ll_row1 = ai_row
		ll_cnt  = ai_row
	end if
	
	arg_dw.object.item_no[ll_cnt]   = lstr_where.str1[ll_row]
	arg_dw.object.qa[ll_cnt]        = LeftA(lstr_where.str2[ll_row],13)
	arg_dw.object.item_name[ll_cnt] = lstr_where.name[ll_row]
next

arg_dw.setfocus()
arg_dw.accepttext()
arg_dw.scrolltorow(ll_row1)
arg_dw.setredraw( true )

RETURN TRUE

end function

on w_ipdraw_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.pb_1=create pb_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.st_2=create st_2
this.gb_4=create gb_4
this.dw_3=create dw_3
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_19
this.Control[iCurrent+10]=this.cb_20
this.Control[iCurrent+11]=this.cb_21
this.Control[iCurrent+12]=this.cb_22
this.Control[iCurrent+13]=this.pb_2
this.Control[iCurrent+14]=this.pb_3
this.Control[iCurrent+15]=this.pb_4
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.gb_4
this.Control[iCurrent+18]=this.dw_3
this.Control[iCurrent+19]=this.st_3
end on

on w_ipdraw_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.st_2)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_3.settransobject(sqlca)

dw_2.insertrow(1)

// 전체거래처
dw_2.settransobject(sqlca)

dw_2.insertrow(0)
dw_2.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(SQLCA)

idwc_supp.insertrow(1)
idwc_supp.setitem(1, "supp_no", "%")
idwc_supp.setitem(1, "supp_name", "전체")

dw_2.object.supp_no[1] = "%"

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 73
gb_2.height = newheight - 472

//dw_1.width  = newwidth  - 2043
dw_1.height = newheight - 560

dw_3.width  = newwidth  - 2894
dw_3.height = newheight - 560


end event

type pb_save from w_inheritance`pb_save within w_ipdraw_m
integer x = 4219
integer y = 60
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipdraw_m
integer x = 69
integer y = 488
integer width = 2734
integer height = 1652
string dataobject = "d_ipdraw_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::rowfocuschanging;call super::rowfocuschanging;//
long   ll_row
string ls_suppno, ls_drawno

ll_row = newrow
if ll_row < 1 or ll_row > this.rowcount() then RETURN

ls_suppno = dw_1.object.supp_no[ll_row]
ls_drawno = dw_1.object.draw_no[ll_row]

dw_3.reset()
if dw_3.retrieve( ls_suppno, ls_drawno ) < 1 then
//	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type dw_2 from w_inheritance`dw_2 within w_ipdraw_m
integer x = 2350
integer y = 128
integer width = 1019
integer height = 88
string dataobject = "d_whsupp_s"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_ipdraw_m
integer x = 41
integer y = 52
integer width = 1211
integer height = 132
string text = "구매처별 도면관리"
end type

type st_tips from w_inheritance`st_tips within w_ipdraw_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipdraw_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipdraw_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipdraw_m
integer x = 4411
integer y = 60
integer width = 183
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipdraw_m
boolean visible = false
integer x = 2939
integer y = 60
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipdraw_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ipdraw_m
integer x = 3831
integer y = 60
end type

event pb_delete::clicked;//
long   ll_cnt, ll_row
string ls_suppno, ls_drawno

if dw_1.getrow() < 1 then RETURN

ls_suppno = dw_1.object.supp_no[dw_1.getrow()]
ls_drawno = dw_1.object.draw_no[dw_1.getrow()]

SELECT count(*) INTO :ll_cnt FROM suppdrawdet WHERE supp_no = :ls_suppno AND draw_no = :ls_drawno;
if ll_cnt = 0 then
	dw_1.deleterow(0)
else
	MessageBox("확인", "해당하는 도면번호의 품목과 규격이 존재합니다.")
end if

end event

type pb_insert from w_inheritance`pb_insert within w_ipdraw_m
integer x = 3639
integer y = 60
end type

event pb_insert::clicked;//
long   ll_row
string ls_supp, ls_suppname
 
ls_supp    = dw_2.object.supp_no[dw_2.getrow()]
if isnull(ls_supp) or trim(ls_supp) = "" or ls_supp = "%" then 
	MessageBox("확인", "구매처를 선택하십시요")
	return
end if

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

SELECT supp_name INTO :ls_suppname FROM supp  WHERE supp_no  = :ls_supp;
dw_1.object.supp_no[ll_row]   = ls_supp
dw_1.object.supp_name[ll_row] = ls_suppname

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipdraw_m
integer x = 3447
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_suppno
long   ll_row

dw_1.reset()
dw_2.accepttext()

ls_suppno = dw_2.object.supp_no[1]
if dw_1.retrieve( ls_suppno ) < 1 then
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipdraw_m
integer x = 37
integer width = 4590
integer height = 216
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ipdraw_m
integer x = 37
integer y = 428
integer width = 4590
integer height = 1740
end type

type gb_1 from w_inheritance`gb_1 within w_ipdraw_m
integer x = 3410
integer y = 16
integer width = 1216
integer height = 208
integer weight = 400
end type

type st_1 from statictext within w_ipdraw_m
integer x = 2350
integer y = 52
integer width = 1010
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "구매처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ipdraw_m
event mousemove pbm_mousemove
integer x = 4023
integer y = 60
integer width = 187
integer height = 144
integer taborder = 120
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

dwxls  = dw_1

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

type st_4 from statictext within w_ipdraw_m
integer x = 82
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

type ddlb_fld from dropdownlistbox within w_ipdraw_m
integer x = 261
integer y = 304
integer width = 329
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

type ddlb_dwtitles from dropdownlistbox within w_ipdraw_m
integer x = 283
integer y = 312
integer width = 206
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

type st_7 from statictext within w_ipdraw_m
integer x = 613
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

type ddlb_op from dropdownlistbox within w_ipdraw_m
integer x = 795
integer y = 304
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

type sle_value from singlelineedit within w_ipdraw_m
integer x = 1097
integer y = 312
integer width = 416
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_19 from commandbutton within w_ipdraw_m
integer x = 1527
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_20 from commandbutton within w_ipdraw_m
integer x = 1691
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

type cb_21 from commandbutton within w_ipdraw_m
integer x = 1851
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_22 from commandbutton within w_ipdraw_m
integer x = 2016
integer y = 312
integer width = 160
integer height = 76
integer taborder = 160
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

type pb_2 from picturebutton within w_ipdraw_m
integer x = 4128
integer y = 300
integer width = 146
integer height = 108
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;//
long   ll_row
string ls_suppno, ls_suppname, ls_drawno
 
ls_suppno    = dw_2.object.supp_no[dw_2.getrow()]
if isnull(ls_suppno) or trim(ls_suppno) = "" or ls_suppno = "%" then 
	MessageBox("확인", "구매처를 선택하십시요")
	return
end if

ls_drawno    = dw_1.object.draw_no[dw_1.getrow()]
if isnull(ls_drawno) or trim(ls_drawno) = "" or ls_drawno = "%" then 
	MessageBox("확인", "도면번호를 선택하십시요")
	return
end if

ll_row = dw_3.insertrow(0)
dw_3.scrolltorow(ll_row)

dw_3.object.draw_no[ll_row]   = ls_drawno

SELECT supp_name INTO :ls_suppname FROM supp  WHERE supp_no  = :ls_suppno;
dw_3.object.supp_no[ll_row]   = ls_suppno
dw_3.object.supp_name[ll_row] = ls_suppname

end event

type pb_3 from picturebutton within w_ipdraw_m
integer x = 4283
integer y = 300
integer width = 146
integer height = 108
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;//
dw_3.deleterow(0)

end event

type pb_4 from picturebutton within w_ipdraw_m
integer x = 4439
integer y = 300
integer width = 146
integer height = 108
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_3,"Y")
end event

type st_2 from statictext within w_ipdraw_m
integer x = 2821
integer y = 300
integer width = 1253
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "도면번호 = 반제품 품목+규격"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_ipdraw_m
integer x = 2322
integer y = 16
integer width = 1065
integer height = 208
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_ipdraw_m
integer x = 2821
integer y = 488
integer width = 1769
integer height = 1652
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_ipdrawdet_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
debugbreak()	
choose case dwo.name
	case "item_no", "qa", "item_name"
		wf_itemselect(dw_3,'S', row, 0)
end choose

end event

type st_3 from statictext within w_ipdraw_m
integer x = 2821
integer y = 376
integer width = 1253
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "생산계획시에 표기되는 공정품목(공정관리)."
boolean focusrectangle = false
end type

