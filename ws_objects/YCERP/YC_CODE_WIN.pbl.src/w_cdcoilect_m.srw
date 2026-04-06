$PBExportHeader$w_cdcoilect_m.srw
$PBExportComments$코일특기사항관리(2001/08/08, 이대준)
forward 
global type w_cdcoilect_m from w_inheritance
end type
end forward

global type w_cdcoilect_m from w_inheritance
integer width = 1440
integer height = 1396
string title = "특기사항코드관리(w_cdcoilect_m)"
end type
global w_cdcoilect_m w_cdcoilect_m

on w_cdcoilect_m.create
call super::create
end on

on w_cdcoilect_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

type pb_save from w_inheritance`pb_save within w_cdcoilect_m
integer x = 1166
integer y = 572
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count
dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.etc_no[ll_count]) OR dw_1.object.etc_no[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 특기사항코드를 입력하십시오")
		return
	END IF
	IF isnull(dw_1.object.etc_name[ll_count]) OR dw_1.object.etc_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 특기사항을 입력하십시오")
		return
	END IF
NEXT
FOR li_cnt1 = 1 TO dw_1.rowcount()
	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
	    IF dw_1.object.etc_no[li_cnt1] = dw_1.object.etc_no[li_cnt2] THEN
		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
		            " 번째 특기사항코드가 중복되었습니다.")
			 return
		END IF
   NEXT
NEXT		            
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1, "Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdcoilect_m
integer y = 284
integer width = 1083
integer height = 972
string dataobject = "d_cdcoiletc_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdcoilect_m
integer y = 28
integer width = 1147
string text = "특기사항관리"
end type

type st_tips from w_inheritance`st_tips within w_cdcoilect_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcoilect_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcoilect_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcoilect_m
integer x = 1166
integer y = 716
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcoilect_m
boolean visible = false
integer x = 1294
integer y = 76
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdcoilect_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdcoilect_m
integer x = 1166
integer y = 428
end type

event pb_delete::clicked;string ls_etc_no, ls_color_check, ls_color
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()
//ls_etc_no = dw_1.object.etc_no[dw_1.getrow()]
//setnull(ls_color)
//select color into :ls_color from saledet 
// where color = :ls_etc_no;
//IF isnull(ls_color) or ls_color = '' THEN
//ELSE
//	Messagebox("에러", "주문된 물품중에 이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
//	return
//END IF
//setnull(ls_color)
//select color into :ls_color from saledetysp 
// where color = :ls_etc_no;
//IF isnull(ls_color) or ls_color = '' THEN
//ELSE
//	Messagebox("에러", "주문된 Y.S.P물품중에 이미 색상을 사용하고 있기 때문에~r~n " + "삭제할수 없습니다.")
//	return
//END IF
//
//ls_color = dw_1.object.etc_no[dw_1.getrow()]
//ls_color = left(ls_color, 1)

//if ls_color <> 'Z' then
//	messagebox("확인","기본색상은 삭제할 수 없습니다.",information!)
//	return
//end if

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdcoilect_m
integer x = 1166
integer y = 284
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
FOR ll_count = 1 TO dw_1.rowcount()
	IF isnull(dw_1.object.etc_no[ll_count]) OR dw_1.object.etc_no[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 특기사항코드를 입력하십시오")
		dw_1.setcolumn("etc_no")
		return
	END IF
	IF isnull(dw_1.object.etc_name[ll_count]) OR dw_1.object.etc_name[ll_count] <= "" THEN
		messagebox("입력오류", string(ll_count) + " 번째 특기사항명를 입력하십시오")
		dw_1.setcolumn("etc_name")
		return
	END IF
NEXT
ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('etc_no')
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcoilect_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_cdcoilect_m
boolean visible = false
integer x = 997
integer y = 20
integer width = 155
integer height = 168
end type

type gb_2 from w_inheritance`gb_2 within w_cdcoilect_m
integer x = 37
integer width = 1339
integer height = 1048
end type

type gb_1 from w_inheritance`gb_1 within w_cdcoilect_m
boolean visible = false
end type

type dw_2 from w_inheritance`dw_2 within w_cdcoilect_m
boolean visible = false
integer x = 1047
integer y = 60
integer width = 69
integer height = 48
end type

