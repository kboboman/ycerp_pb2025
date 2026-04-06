$PBExportHeader$w_cdorgan_m.srw
$PBExportComments$관련기관[2001/01/20,서재복]
forward
global type w_cdorgan_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdorgan_m
end type
end forward

global type w_cdorgan_m from w_inheritance
integer x = 320
integer y = 552
integer width = 2309
integer height = 1356
string title = "관련기관코드(w_cdorgan_m)"
boolean resizable = false
cb_3 cb_3
end type
global w_cdorgan_m w_cdorgan_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//dw_1.SetTransObject(SQLCA)
dw_1.retrieve()

end event

on w_cdorgan_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
end on

on w_cdorgan_m.destroy
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

type pb_save from w_inheritance`pb_save within w_cdorgan_m
integer x = 1838
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()

if dw_1.rowcount() < 1 then return

FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.organ_code[ll_count]) OR dw_1.object.organ_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 기관코드를 입력하십시오")
		return
	END IF
	IF isnull(dw_1.object.organ_name[ll_count]) OR dw_1.object.organ_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 기관명을 입력하십시오")
		return
	END IF
NEXT
FOR li_cnt1 = 1 TO dw_1.rowcount()
	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
	    IF dw_1.object.organ_code[li_cnt1] = dw_1.object.organ_code[li_cnt2] THEN
		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 기관코드가 중복되었습니다.")
			 return
		END IF
	    IF dw_1.object.organ_name[li_cnt1] = dw_1.object.organ_name[li_cnt2] THEN
		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 기관명이 중복되었습니다.")
			 return
		END IF
   NEXT
NEXT

wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdorgan_m
integer x = 46
integer y = 272
integer width = 2176
integer height = 932
string dataobject = "dw_organ_m"
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

type dw_2 from w_inheritance`dw_2 within w_cdorgan_m
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

type st_title from w_inheritance`st_title within w_cdorgan_m
integer y = 36
integer width = 1138
integer height = 164
integer textsize = -20
string text = "관련기관코드"
end type

type st_tips from w_inheritance`st_tips within w_cdorgan_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdorgan_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdorgan_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdorgan_m
integer x = 2030
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdorgan_m
integer x = 1646
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

type pb_cancel from w_inheritance`pb_cancel within w_cdorgan_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdorgan_m
integer x = 1454
integer taborder = 130
end type

event pb_delete::clicked;string ls_organ_code, ls_organ_check
int li_count
if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()

ls_organ_code = dw_1.object.organ_code[dw_1.getrow()]
select count(*) into :li_count from bdinfodet
   where organcd = :ls_organ_code;
IF li_count > 0 THEN
	Messagebox("에러", "설계영업진행관리에서 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
	return
END IF

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdorgan_m
integer x = 1262
integer taborder = 150
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.organ_code[ll_count]) OR dw_1.object.organ_code[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 기관코드을 입력하십시오")
		dw_1.setcolumn("organ_code")
		dw_1.setfocus()
		return
	END IF
	IF isnull(dw_1.object.organ_name[ll_count]) OR dw_1.object.organ_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 기관명을 입력하십시오")
		dw_1.setcolumn("organ_name")
		dw_1.setfocus()
		return
	END IF
NEXT
ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('organ_code')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdorgan_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_cdorgan_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdorgan_m
integer x = 27
integer width = 2217
integer height = 996
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdorgan_m
integer x = 1243
integer width = 1001
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdorgan_m
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

