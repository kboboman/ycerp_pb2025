$PBExportHeader$w_cdprog_m.srw
$PBExportComments$진행(확정)구분코드[2001/01/20,서재복]
forward
global type w_cdprog_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdprog_m
end type
end forward

global type w_cdprog_m from w_inheritance
integer x = 320
integer y = 552
integer width = 3643
integer height = 2072
string title = "진행(확정)구분코드등록(w_cdprog_m)"
boolean resizable = false
cb_3 cb_3
end type
global w_cdprog_m w_cdprog_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//dw_1.SetTransObject(SQLCA)
//dw_1.retrieve()
pb_retrieve.triggerevent(clicked!)

end event

on w_cdprog_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
end on

on w_cdprog_m.destroy
call super::destroy
destroy(this.cb_3)
end on

event closequery;call super::closequery;//integer li_chk, li_count
//
//dw_2.Accepttext()
//li_count = wf_modifycount(dw_2)
//IF li_count >= 1 THEN
//   li_chk = MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, YesNoCancel!, 3)
//   IF li_chk = 1 THEN 
//		dw_2.object.bank_id[dw_2.getrow()] = "xxxxxxxxxxxxxxxxxxxx"
//	   wf_update1(dw_2, 'Y')
//	ELSEIF li_chk = 3 THEN
//		message.returnvalue = 1
//   END IF
//END IF
end event

type pb_save from w_inheritance`pb_save within w_cdprog_m
integer x = 3195
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()

if dw_1.rowcount() < 1 then return

FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.prog_code[ll_count]) OR dw_1.object.prog_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 코드를 입력하십시오")
		return
	END IF
	IF isnull(dw_1.object.prog_name[ll_count]) OR dw_1.object.prog_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 구분명을 입력하십시오")
		return
	END IF
NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//		 IF dw_1.object.prog_code[li_cnt1] = dw_1.object.prog_code[li_cnt2] THEN
//			 messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//						" 번째 코드가 중복되었습니다.")
//			 return
//		END IF
//		 IF dw_1.object.prog_name[li_cnt1] = dw_1.object.prog_name[li_cnt2] THEN
//			 messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//						" 번째 구분명이 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT

wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdprog_m
integer x = 46
integer y = 272
integer width = 3538
integer height = 1640
string dataobject = "dw_prog_m"
boolean hscrollbar = false
boolean border = false
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

event dw_1::itemchanged;call super::itemchanged;choose case dwo.name
	case 'prog_cls'
		choose case data
			case '3'
				this.object.p_sort[row] = 1
			case '1'
				this.object.p_sort[row] = 2
			case '2'
				this.object.p_sort[row] = 3
			case '4'
				this.object.p_sort[row] = 4
			case '0'
				this.object.p_sort[row] = 0
		end choose
end choose
end event

type st_title from w_inheritance`st_title within w_cdprog_m
integer y = 36
integer width = 1632
integer height = 164
integer textsize = -20
string text = "진행(확정)구분코드 등록"
end type

type st_tips from w_inheritance`st_tips within w_cdprog_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdprog_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdprog_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdprog_m
integer x = 3387
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdprog_m
integer x = 3003
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

type pb_cancel from w_inheritance`pb_cancel within w_cdprog_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdprog_m
integer x = 2811
integer taborder = 130
end type

event pb_delete::clicked;string ls_prog_code, ls_organ_check
int li_count
if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

ls_prog_code = dw_1.object.prog_code[dw_1.getrow()]
select count(*) into :li_count from bdinfodet
   where ( sale_prog = :ls_prog_code )
		or ( com_prog  = :ls_prog_code )
		or ( design_prog = :ls_prog_code );
IF li_count > 0 THEN
	Messagebox("에러", "설계영업진행관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdprog_m
integer x = 2619
integer taborder = 150
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.prog_code[ll_count]) OR dw_1.object.prog_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 코드를 입력하십시오")
		dw_1.setcolumn("prog_code")
		dw_1.setfocus()
		return
	END IF
	IF isnull(dw_1.object.prog_name[ll_count]) OR dw_1.object.prog_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 구분명을 입력하십시오")
		dw_1.setcolumn("prog_name")
		dw_1.setfocus()
		return
	END IF
NEXT
ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('prog_cls')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdprog_m
integer x = 2427
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdprog_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdprog_m
integer x = 27
integer width = 3575
integer height = 1700
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdprog_m
integer x = 2395
integer width = 1207
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdprog_m
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

type cb_3 from commandbutton within w_cdprog_m
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

