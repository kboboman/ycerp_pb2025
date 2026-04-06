$PBExportHeader$w_cdwc_m.srw
$PBExportComments$작업장관리(98/02/03, 성삼지)
forward
global type w_cdwc_m from w_inheritance
end type
type dw_3 from datawindow within w_cdwc_m
end type
type st_1 from statictext within w_cdwc_m
end type
type st_2 from statictext within w_cdwc_m
end type
type rb_1 from radiobutton within w_cdwc_m
end type
type rb_2 from radiobutton within w_cdwc_m
end type
type rb_3 from radiobutton within w_cdwc_m
end type
type st_8 from statictext within w_cdwc_m
end type
type st_9 from statictext within w_cdwc_m
end type
type sle_value from singlelineedit within w_cdwc_m
end type
type cb_filteron from commandbutton within w_cdwc_m
end type
type cb_filteroff from commandbutton within w_cdwc_m
end type
type cb_11 from commandbutton within w_cdwc_m
end type
type cb_12 from commandbutton within w_cdwc_m
end type
type st_3 from statictext within w_cdwc_m
end type
type ddlb_fld from dropdownlistbox within w_cdwc_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdwc_m
end type
type ddlb_op from dropdownlistbox within w_cdwc_m
end type
end forward

global type w_cdwc_m from w_inheritance
integer width = 4722
integer height = 2252
string title = "작업장관리(w_cdwc_m)"
dw_3 dw_3
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_8 st_8
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
end type
global w_cdwc_m w_cdwc_m

type variables
st_print  i_print
datawindowchild idwc_team

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission("생산관리_조회", GS_userid) = "Y" then
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
	
	long ll_Y ; string ls_value, ls_val[]
	GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
	for ll_Y = 1 to ddlb_dwtitles.totalitems()
		ls_value  = ddlb_dwtitles.text( ll_Y )

		GF_Split(ls_value, "|", ls_val)		
		dw_1.Modify( ls_val[3] + ".Protect=1")
	next
end if

dw_3.SetTransObject(SQLCA)

pb_retrieve.PostEvent( clicked! )

end event

on w_cdwc_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_8=create st_8
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.st_8
this.Control[iCurrent+8]=this.st_9
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_filteron
this.Control[iCurrent+11]=this.cb_filteroff
this.Control[iCurrent+12]=this.cb_11
this.Control[iCurrent+13]=this.cb_12
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.ddlb_fld
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.ddlb_op
end on

on w_cdwc_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

end event

type pb_save from w_inheritance`pb_save within w_cdwc_m
integer x = 2514
integer y = 64
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1,"Y")
// 작업지시서 출력시.
//	if ls_fact = '1'  then
//		dw_1.dataobject = 'd_mpsfcrel_r'// 생산수량 입력 불가능.
//	else
////		dw_1.dataobject = 'd_mpsfcrel_r2'  // 생산수량 입력 가능.
//		dw_1.dataobject = 'd_mpsfcrel_r3'  // 생산수량 입력 가능.
//	end if
//end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdwc_m
integer x = 37
integer y = 476
integer width = 4608
integer height = 1648
string dataobject = "d_cdwc_m"
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdwc_m
integer x = 32
integer y = 24
integer width = 987
integer height = 140
string text = "작업장 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdwc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdwc_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdwc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdwc_m
integer x = 2706
integer y = 64
integer width = 183
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdwc_m
integer x = 2322
integer y = 64
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_3.retrieve()
i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 작업장 내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdwc_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdwc_m
integer x = 2130
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;// 삭제
integer li_count
string  ls_work_no

ls_work_no = dw_1.getitemstring(dw_1.getrow(), "work_no")

SELECT COUNT(*) INTO :li_count FROM rout WHERE wc_no = :ls_work_no;
if li_count > 0 then
	Messagebox("확인", "제품별공정관리 에서 이 작업장을 사용하고 있어 삭제할수 없습니다.", exclamation!, ok!)
else
   dw_1.deleterow(0)
end if



end event

type pb_insert from w_inheritance`pb_insert within w_cdwc_m
integer x = 1938
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;//
long ll_row

ll_row = dw_1.insertrow( dw_1.getrow() )
dw_1.ScrollToRow(ll_row)

dw_1.setcolumn(1)  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdwc_m
integer x = 1733
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.reset()
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdwc_m
integer x = 1070
integer y = 16
integer width = 590
integer height = 216
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
string text = "작업장"
end type

type gb_2 from w_inheritance`gb_2 within w_cdwc_m
integer x = 37
integer y = 272
integer width = 4608
integer height = 192
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdwc_m
integer x = 1687
integer y = 16
integer width = 1230
integer height = 216
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdwc_m
boolean visible = false
integer x = 1664
integer y = 60
integer width = 480
integer height = 148
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type dw_3 from datawindow within w_cdwc_m
boolean visible = false
integer x = 1714
integer y = 44
integer width = 146
integer height = 144
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_cdwc_r"
boolean livescroll = true
end type

type st_1 from statictext within w_cdwc_m
integer x = 2958
integer y = 148
integer width = 1390
integer height = 124
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "유형이 ~"외주~"인것은 생산계획작성시에 외주(가공/발주)대상 항목으로 넘어 갑니다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdwc_m
integer x = 2958
integer y = 332
integer width = 1326
integer height = 104
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "공장구분 1 이면 작업지시서에 생산수량수기 기록란이 없는 폼이 출력됨"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_cdwc_m
integer x = 1129
integer y = 68
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;dw_1.setfilter('')
dw_1.filter()
end event

type rb_2 from radiobutton within w_cdwc_m
integer x = 1371
integer y = 68
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사내"
end type

event clicked;dw_1.setfilter('work_type = "D"')
dw_1.filter()
end event

type rb_3 from radiobutton within w_cdwc_m
integer x = 1371
integer y = 144
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "외주"
end type

event clicked;dw_1.setfilter('work_type = "S"')
dw_1.filter()
end event

type st_8 from statictext within w_cdwc_m
integer x = 78
integer y = 360
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

type st_9 from statictext within w_cdwc_m
integer x = 754
integer y = 360
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdwc_m
integer x = 1230
integer y = 344
integer width = 498
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

type cb_filteron from commandbutton within w_cdwc_m
integer x = 1742
integer y = 344
integer width = 270
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

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_filteroff from commandbutton within w_cdwc_m
integer x = 2016
integer y = 344
integer width = 270
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""
GF_DW2UnFilter( arg_dw )

end event

type cb_11 from commandbutton within w_cdwc_m
integer x = 2290
integer y = 344
integer width = 270
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_12 from commandbutton within w_cdwc_m
integer x = 2565
integer y = 344
integer width = 270
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_3 from statictext within w_cdwc_m
integer x = 2962
integer y = 28
integer width = 1211
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "MES : 생산현장 프로그램에서 작업장 선택정렬 목록으로 사용"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cdwc_m
integer x = 251
integer y = 340
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_cdwc_m
integer x = 293
integer y = 352
integer width = 311
integer height = 88
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

type ddlb_op from dropdownlistbox within w_cdwc_m
integer x = 928
integer y = 340
integer width = 288
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

