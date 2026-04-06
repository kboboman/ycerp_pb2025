$PBExportHeader$w_cdlastcom_m.srw
$PBExportComments$수주사 (낙찰사)관리 (2000/11/07,서재복)
forward
global type w_cdlastcom_m from w_inheritance
end type
type cb_1 from commandbutton within w_cdlastcom_m
end type
type cb_2 from commandbutton within w_cdlastcom_m
end type
end forward

global type w_cdlastcom_m from w_inheritance
integer y = 212
integer width = 3630
integer height = 2060
string title = "수주사관리(w_cdmaster_m)"
boolean resizable = false
cb_1 cb_1
cb_2 cb_2
end type
global w_cdlastcom_m w_cdlastcom_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
int ii_sort = 1
end variables

event open;call super::open;//dw_1.SetTransObject(SQLCA)
dw_1.retrieve('L%')

end event

on w_cdlastcom_m.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_cdlastcom_m.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
end on

type pb_save from w_inheritance`pb_save within w_cdlastcom_m
integer x = 3173
integer y = 68
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()
dwItemStatus l_status

if dw_1.rowcount() < 1 then return

FOR ll_count = 1 TO dw_1.rowcount()
	l_status = dw_1.GetItemStatus(ll_count, 0, Primary!)
	if l_status = newmodified! then
		IF isnull(dw_1.object.comcode[ll_count]) OR dw_1.object.comcode[ll_count] <= "" THEN
			messagebox("입력오류", string(ll_count) + " 번째 회사코드를 입력하십시오")
			return
		END IF
		IF isnull(dw_1.object.comname[ll_count]) OR dw_1.object.comname[ll_count] <= "" THEN
			messagebox("입력오류", string(ll_count) + " 번째 회사명을 입력하십시오")
			return
		END IF
	end if
NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//		IF dw_1.object.comcode[li_cnt1] = dw_1.object.comcode[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 회사코드가 중복되었습니다.")
//			 return
//		END IF
//		IF dw_1.object.comname[li_cnt1] = dw_1.object.comname[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 회사이름이 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT		       

wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdlastcom_m
integer x = 46
integer y = 308
integer width = 3529
integer height = 1624
integer taborder = 50
string dataobject = "d_bdcom_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long ll_row
//string ls_bank_code
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//dw_2.accepttext()
//ls_bank_code = this.object.bank_code[ll_row]
//dw_2.object.bank_code.protect = true
//if isnull(ls_bank_code) or ls_bank_code = "" then
//	dw_1.object.bank_code[ll_row] = is_bank_code
//	dw_1.object.bank_name[ll_row] = is_bank_name
//	dw_1.object.bank_id[ll_row] = is_bank_id
//else
//	dw_2.retrieve(ls_bank_code)
//end if
//

end event

type dw_2 from w_inheritance`dw_2 within w_cdlastcom_m
boolean visible = false
integer x = 1211
integer y = 56
integer width = 187
integer height = 144
integer taborder = 60
string dataobject = "d_cdbank_excel_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdlastcom_m
integer y = 36
integer width = 1175
integer height = 128
integer textsize = -20
string text = "수주사 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlastcom_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdlastcom_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlastcom_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdlastcom_m
integer x = 3365
integer y = 68
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlastcom_m
integer x = 2981
integer y = 68
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;//w_repsuper w_print
//st_print l_print
//
//if dw_1.rowcount() < 1 then
//	return
//else
//	dw_2.retrieve()
//end if
//
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 은행코드를 출력합니다." 
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

type pb_cancel from w_inheritance`pb_cancel within w_cdlastcom_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdlastcom_m
integer x = 2789
integer y = 68
integer taborder = 130
end type

event pb_delete::clicked;string ls_comcode 
int li_count
if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

ls_comcode = dw_1.object.comcode[dw_1.getrow()]
select count(*) into :li_count from bdinfodet 
   where master = :ls_comcode;
IF li_count > 0 THEN
	Messagebox("에러", "건설정보진행현황에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF

//select count(*) into :li_count from bdcom 
//   where comcode = :ls_comcode;
//IF li_count > 0 THEN
//	Messagebox("에러", "수금관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
//	return
//END IF
dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdlastcom_m
integer x = 2597
integer y = 68
integer taborder = 150
end type

event pb_insert::clicked;long ll_row, ll_count
dwItemStatus l_status

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	l_status = dw_1.GetItemStatus(ll_count, 0, Primary!)
	if l_status = newmodified! then
		IF isnull(dw_1.object.comcode[ll_count]) OR dw_1.object.comcode[ll_count] <= "" THEN
			messagebox("입력오류", string(ll_count) + " 번째 단종사코드을 입력하십시오")
			dw_1.setcolumn("comcode")
			dw_1.setfocus()
			return
		END IF
		IF isnull(dw_1.object.comname[ll_count]) OR dw_1.object.comname[ll_count] <= "" THEN
			messagebox("입력오류", string(ll_count) + " 번째 단종사명을 입력하십시오")
			dw_1.setcolumn("comname")
			dw_1.setfocus()
			return
		END IF
	END IF
NEXT
int  li_int

ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
dw_1.scrolltorow(ll_row)
if ll_row = 1 then
	li_int = 0
else
	li_int = integer(MidA(dw_1.object.comcode[ll_row - 1] ,2 ))
end if
dw_1.object.comcode[ll_row] = 'L' + RightA( "000" + string( li_int + 1), 3)
dw_1.setcolumn('comname')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlastcom_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_cdlastcom_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdlastcom_m
integer x = 27
integer y = 260
integer width = 3561
integer height = 1688
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdlastcom_m
integer x = 2578
integer y = 28
integer width = 1001
long textcolor = 0
long backcolor = 79416533
end type

type cb_1 from commandbutton within w_cdlastcom_m
integer x = 215
integer y = 200
integer width = 402
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "회사명정렬"
end type

event clicked;//int ii_sort = 1
if ii_sort = 1 then
	dw_1.setsort('comname D')
	ii_sort = 2
else
	dw_1.setsort('comname A')
	ii_sort = 1
end if
dw_1.sort()

end event

type cb_2 from commandbutton within w_cdlastcom_m
integer x = 55
integer y = 200
integer width = 155
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "코드"
end type

event clicked;//int ii_sort = 1
if ii_sort = 1 then
	dw_1.setsort('comcode D')
	ii_sort = 2
else
	dw_1.setsort('comcode A')
	ii_sort = 1
end if
dw_1.sort()
//
end event

