$PBExportHeader$w_cdcon_m2.srw
$PBExportComments$종건사(건설사) (2000/11/07,서재복)
forward
global type w_cdcon_m2 from w_inheritance
end type
type cb_1 from commandbutton within w_cdcon_m2
end type
type cb_2 from commandbutton within w_cdcon_m2
end type
type sle_1 from singlelineedit within w_cdcon_m2
end type
type st_1 from statictext within w_cdcon_m2
end type
type cb_3 from commandbutton within w_cdcon_m2
end type
end forward

global type w_cdcon_m2 from w_inheritance
integer y = 248
integer width = 3630
integer height = 2032
string title = "건설사등록(w_cdcon_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
cb_1 cb_1
cb_2 cb_2
sle_1 sle_1
st_1 st_1
cb_3 cb_3
end type
global w_cdcon_m2 w_cdcon_m2

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
int ii_sort = 1
gst_bdwhere ist_where

end variables

event open;call super::open;//dw_1.SetTransObject(SQLCA)
ist_where = Message.PowerObjectParm
sle_1.text = ist_where.str2
pb_retrieve.triggerevent(clicked!)
end event

on w_cdcon_m2.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.sle_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_3
end on

on w_cdcon_m2.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_3)
end on

type pb_save from w_inheritance`pb_save within w_cdcon_m2
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

type dw_1 from w_inheritance`dw_1 within w_cdcon_m2
integer x = 41
integer y = 308
integer width = 3520
integer height = 1600
string dataobject = "d_bdcom_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dw_1.getrow() > 0 then
	cb_3.triggerevent(clicked!)
end if
end event

type dw_2 from w_inheritance`dw_2 within w_cdcon_m2
boolean visible = false
integer x = 1211
integer y = 56
integer width = 187
integer height = 144
string dataobject = "d_cdbank_excel_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdcon_m2
integer y = 36
integer width = 1138
integer height = 132
integer textsize = -20
string text = "건설사 등록"
end type

type st_tips from w_inheritance`st_tips within w_cdcon_m2
end type

type pb_compute from w_inheritance`pb_compute within w_cdcon_m2
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcon_m2
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcon_m2
integer x = 3365
integer y = 68
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;//close(parent)
ist_where.okflag = false
closewithreturn(parent, ist_where)
end event

type pb_print from w_inheritance`pb_print within w_cdcon_m2
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

type pb_cancel from w_inheritance`pb_cancel within w_cdcon_m2
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdcon_m2
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

type pb_insert from w_inheritance`pb_insert within w_cdcon_m2
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
			messagebox("입력오류", string(ll_count) + " 번째 건설사코드을 입력하십시오")
			dw_1.setcolumn("comcode")
			dw_1.setfocus()
			return
		END IF
		IF isnull(dw_1.object.comname[ll_count]) OR dw_1.object.comname[ll_count] <= "" THEN
			messagebox("입력오류", string(ll_count) + " 번째 건설사명을 입력하십시오")
			dw_1.setcolumn("comname")
			dw_1.setfocus()
			return
		END IF
	END IF
NEXT
int  li_int

//ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
//dw_1.scrolltorow(ll_row)
//if ll_row = 1 then
//	li_int = 0
//else
//	li_int = integer(mid(dw_1.object.comcode[ll_row - 1] ,2 ))
//end if
//dw_1.object.comcode[ll_row] = 'C' + right( "000" + string( li_int + 1), 3)
//dw_1.setcolumn('comname')
//dw_1.setfocus()

string ls_comcode
select isnull(max(comcode),'C001') into :ls_comcode
from bdcom
where comcode like 'C%';

ll_row = dw_1.insertrow(dw_1.rowcount() + 1)
dw_1.scrolltorow(ll_row)
//if ll_row = 1 then
//	li_int = 0
//else
	li_int = integer(MidA(ls_comcode, 2))
//end if
dw_1.object.comcode[ll_row] = 'C' + RightA( "000" + string( li_int + 1), 3)
dw_1.setcolumn('comname')
dw_1.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcon_m2
integer x = 2405
integer y = 68
integer taborder = 140
boolean default = true
end type

event pb_retrieve::clicked;call super::clicked;if trim(sle_1.text) = "" then
	dw_1.setfilter("")
	dw_1.filter()
else
	dw_1.setfilter(" comname like '%" + trim(sle_1.text) + "%'")
	dw_1.filter()
end if
dw_1.retrieve('C%')
end event

type gb_3 from w_inheritance`gb_3 within w_cdcon_m2
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdcon_m2
integer x = 27
integer y = 260
integer width = 3557
integer height = 1668
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcon_m2
integer x = 2377
integer y = 28
integer width = 1202
long textcolor = 0
long backcolor = 79416533
end type

type cb_1 from commandbutton within w_cdcon_m2
integer x = 215
integer y = 200
integer width = 402
integer height = 84
integer taborder = 70
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

type cb_2 from commandbutton within w_cdcon_m2
integer x = 55
integer y = 200
integer width = 155
integer height = 84
integer taborder = 70
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

type sle_1 from singlelineedit within w_cdcon_m2
integer x = 1541
integer y = 100
integer width = 763
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_cdcon_m2
integer x = 1303
integer y = 116
integer width = 238
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79416533
string text = "회사명:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cdcon_m2
integer x = 1957
integer y = 200
integer width = 347
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "회사선택"
end type

event clicked;if dw_1.getrow() > 0 then
	ist_where.str1 = dw_1.object.comcode[dw_1.getrow()]
	ist_where.str2 = dw_1.object.comname[dw_1.getrow()]
	
	ist_where.okflag = true
	closewithreturn(parent, ist_where)
end if

end event

