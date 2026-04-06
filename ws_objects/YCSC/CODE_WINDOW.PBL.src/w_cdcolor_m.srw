$PBExportHeader$w_cdcolor_m.srw
$PBExportComments$칼라관리(1998/5/5,성삼지)
forward
global type w_cdcolor_m from w_inheritance
end type
type cb_2 from commandbutton within w_cdcolor_m
end type
type cb_1 from commandbutton within w_cdcolor_m
end type
end forward

global type w_cdcolor_m from w_inheritance
integer x = 320
integer y = 552
integer width = 1271
integer height = 1496
string title = "색상관리(w_cdcolor_m)"
boolean maxbox = false
windowstate windowstate = normal!
long backcolor = 79220952
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_cdcolor_m w_cdcolor_m

type variables
boolean ib_check
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.retrieve()
DW_2.VISIBLE = FALSE

end event

on w_cdcolor_m.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
end on

on w_cdcolor_m.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

type pb_save from w_inheritance`pb_save within w_cdcolor_m
integer x = 983
integer y = 952
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.color_code[ll_count]) OR dw_1.object.color_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상코드를 입력하십시오")
		return
	END IF
	IF isnull(dw_1.object.color_name[ll_count]) OR dw_1.object.color_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상명을 입력하십시오")
		return
	END IF
NEXT
FOR li_cnt1 = 1 TO dw_1.rowcount()
	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
	    IF dw_1.object.color_code[li_cnt1] = dw_1.object.color_code[li_cnt2] THEN
		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 색상코드가 중복되었습니다.")
			 return
		END IF
   NEXT
NEXT		            
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdcolor_m
integer x = 41
integer y = 360
integer width = 928
integer height = 984
string dataobject = "d_cdcolor_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdcolor_m
integer x = 1321
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
string dataobject = "d_cdcolor_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdcolor_m
integer width = 1138
string text = "색상관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcolor_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcolor_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcolor_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcolor_m
integer x = 983
integer y = 1100
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcolor_m
integer x = 983
integer y = 804
integer taborder = 110
string text = " "
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print


if dw_1.rowcount() < 1 then
	return
end if

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
dw_2.retrieve()
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 색상코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcolor_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdcolor_m
integer x = 983
integer y = 656
integer taborder = 130
end type

event pb_delete::clicked;string ls_color_code, ls_color_check, ls_color
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()
ls_color_code = dw_1.object.color_code[dw_1.getrow()]
setnull(ls_color)
select color into :ls_color from saledet 
 where color = :ls_color_code;
IF isnull(ls_color) or ls_color = '' THEN
ELSE
	Messagebox("에러", "주문된 물품중에 이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF
setnull(ls_color)
select color into :ls_color from sale 
 where color = :ls_color_code;
IF isnull(ls_color) or ls_color = '' THEN
ELSE
	Messagebox("에러", "이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF

ls_color = dw_1.object.color_code[dw_1.getrow()]
ls_color = LeftA(ls_color, 1)

if ls_color <> 'Z' then
	messagebox("확인","기본색상은 삭제할 수 없습니다.",information!)
	return
end if

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdcolor_m
integer x = 983
integer y = 508
integer taborder = 150
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.color_code[ll_count]) OR dw_1.object.color_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상코드를 입력하십시오")
		dw_1.setcolumn("color_code")
		return
	END IF
	IF isnull(dw_1.object.color_name[ll_count]) OR dw_1.object.color_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 색상명을 입력하십시오")
		dw_1.setcolumn("color_name")
		return
	END IF
NEXT
ll_row = dw_1.insertrow(dw_1.getrow())
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('color_code')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcolor_m
integer x = 983
integer y = 360
integer taborder = 140
end type

event pb_retrieve::clicked;dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdcolor_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcolor_m
integer y = 220
integer width = 1170
integer height = 1156
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcolor_m
boolean visible = false
integer x = 1134
integer y = 244
integer width = 233
integer height = 636
long textcolor = 0
long backcolor = 79416533
end type

type cb_2 from commandbutton within w_cdcolor_m
integer x = 334
integer y = 280
integer width = 539
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "명 정 렬"
end type

event clicked;string ls_sort

IF  ib_check = TRUE THEN
    ls_sort = "color_name A"
	 ib_check = FALSE
ELSE
    ls_sort = "color_name D"
	 ib_check = TRUE
END IF
wf_sort(dw_1, ls_sort)

end event

type cb_1 from commandbutton within w_cdcolor_m
integer x = 46
integer y = 280
integer width = 283
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "코드정렬"
end type

event clicked;string ls_sort

IF  ib_check = TRUE THEN
    ls_sort = "color_code A"
	 ib_check = FALSE
ELSE
    ls_sort = "color_code D"
	 ib_check = TRUE
END IF
wf_sort(dw_1, ls_sort)

end event

