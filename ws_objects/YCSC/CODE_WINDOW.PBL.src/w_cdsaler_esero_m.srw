$PBExportHeader$w_cdsaler_esero_m.srw
$PBExportComments$전자세금계산서(영업담당자)
forward
global type w_cdsaler_esero_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdsaler_esero_m
end type
type st_8 from statictext within w_cdsaler_esero_m
end type
type ddlb_fld from dropdownlistbox within w_cdsaler_esero_m
end type
type st_9 from statictext within w_cdsaler_esero_m
end type
type ddlb_op from dropdownlistbox within w_cdsaler_esero_m
end type
type sle_value from singlelineedit within w_cdsaler_esero_m
end type
type cb_filteron from commandbutton within w_cdsaler_esero_m
end type
type cb_filteroff from commandbutton within w_cdsaler_esero_m
end type
type cb_1 from commandbutton within w_cdsaler_esero_m
end type
type cb_2 from commandbutton within w_cdsaler_esero_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsaler_esero_m
end type
type st_1 from statictext within w_cdsaler_esero_m
end type
end forward

global type w_cdsaler_esero_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4288
integer height = 2120
string title = "전자세금계산서(관리담당)(w_cdsaler_esero_m)"
cb_3 cb_3
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
ddlb_dwtitles ddlb_dwtitles
st_1 st_1
end type
global w_cdsaler_esero_m w_cdsaler_esero_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_1.SetTransObject(SQLCA)
pb_retrieve.triggerevent(clicked!)

if gf_permission('영업사원HP관리', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled = false
end if
	
end event

on w_cdsaler_esero_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_filteron
this.Control[iCurrent+8]=this.cb_filteroff
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_1
end on

on w_cdsaler_esero_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ddlb_dwtitles)
destroy(this.st_1)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 55
dw_1.height = newheight - 452

end event

type pb_save from w_inheritance`pb_save within w_cdsaler_esero_m
integer x = 3803
integer y = 64
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()

if dw_1.rowcount() < 1 then return

FOR ll_count = 1 TO dw_1.rowcount()
	CHOOSE CASE trim(dw_1.object.saler_bizno[ll_count])
		CASE "305-85-36093"	// 대전
			IF dw_1.object.area[ll_count] = "ZD" THEN
			ELSE
				messagebox("입력오류", string(ll_count) + " 번째 수주항목을 확인 하십시오")
				dw_1.setcolumn("area")
				dw_1.setfocus()
				dw_1.scrolltorow(ll_count)
				return
			END IF
		CASE "140-81-48198"	// 시흥
			IF dw_1.object.area[ll_count] = "DD" THEN
			ELSE
				messagebox("입력오류", string(ll_count) + " 번째 수주항목을 확인 하십시오")
				dw_1.setcolumn("area")
				dw_1.setfocus()
				dw_1.scrolltorow(ll_count)
				return
			END IF
		CASE "109-85-29811"	// 화곡
			IF dw_1.object.area[ll_count] = "HD" THEN
			ELSE
				messagebox("입력오류", string(ll_count) + " 번째 수주항목을 확인 하십시오")
				dw_1.setcolumn("area")
				dw_1.setfocus()
				dw_1.scrolltorow(ll_count)
				return
			END IF
      CASE ELSE
			messagebox("입력오류", string(ll_count) + " 번째 사업자번호 항목을 확인 하십시오")
			dw_1.setcolumn("saler_bizno")
			dw_1.setfocus()
			dw_1.scrolltorow(ll_count)
   END CHOOSE
NEXT

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdsaler_esero_m
integer x = 27
integer y = 424
integer width = 4183
integer height = 1556
string dataobject = "d_cdsaler_esero_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_cdsaler_esero_m
boolean visible = false
integer x = 1851
integer y = 4
integer width = 187
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdsaler_esero_m
integer width = 1499
string text = "전자세금계산서(관리담당)"
end type

type st_tips from w_inheritance`st_tips within w_cdsaler_esero_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsaler_esero_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsaler_esero_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdsaler_esero_m
integer x = 3995
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsaler_esero_m
integer x = 3611
integer y = 64
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;//w_repsuper w_print
//st_print l_print
//
//if dw_1.rowcount() < 1 then
//	return
//end if
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//l_print.st_datawindow = dw_1
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 영업사원 HP 리스트를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsaler_esero_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdsaler_esero_m
integer x = 3419
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;//string ls_driver, ls_bank_check
//int li_count
//if dw_1.rowcount() < 1 then return	
//
//if left(dw_1.object.user_id[dw_1.getrow()],8) = 'chulha_t' then
//	messagebox('확인', '삭제 할수 없는 항목입니다. 전산실에 문의하세요', information!)
//	return
//end if
//
if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdsaler_esero_m
integer x = 3227
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;long ll_row //, ll_count

dw_1.accepttext()

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn("id")
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsaler_esero_m
integer x = 3035
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdsaler_esero_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdsaler_esero_m
integer x = 27
integer y = 236
integer width = 4183
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdsaler_esero_m
integer x = 2999
integer y = 24
integer width = 1211
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdsaler_esero_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_8 from statictext within w_cdsaler_esero_m
integer x = 87
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_cdsaler_esero_m
integer x = 270
integer y = 292
integer width = 480
integer height = 580
integer taborder = 10
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

type st_9 from statictext within w_cdsaler_esero_m
integer x = 786
integer y = 312
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

type ddlb_op from dropdownlistbox within w_cdsaler_esero_m
integer x = 960
integer y = 292
integer width = 261
integer height = 500
integer taborder = 20
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_cdsaler_esero_m
integer x = 1239
integer y = 296
integer width = 581
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

type cb_filteron from commandbutton within w_cdsaler_esero_m
integer x = 1829
integer y = 292
integer width = 197
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdsaler_esero_m
integer x = 2030
integer y = 292
integer width = 197
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

arg_dw  = dw_1
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdsaler_esero_m
integer x = 2231
integer y = 292
integer width = 183
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
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
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdsaler_esero_m
integer x = 2418
integer y = 292
integer width = 183
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
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
//arg_dw.groupcalc()

end event

type ddlb_dwtitles from dropdownlistbox within w_cdsaler_esero_m
integer x = 329
integer y = 300
integer width = 306
integer height = 92
integer taborder = 10
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

type st_1 from statictext within w_cdsaler_esero_m
integer x = 1563
integer y = 160
integer width = 1422
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
string text = "수주항목은 세금계산서 발행번호 앞자리 2개"
boolean focusrectangle = false
end type

