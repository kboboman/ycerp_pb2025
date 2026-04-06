$PBExportHeader$w_irusersilsa_m.srw
$PBExportComments$담당자별실사(2001/09/14,이인호)
forward 
global type w_irusersilsa_m from w_inheritance
end type
type dw_4 from datawindow within w_irusersilsa_m
end type
type dw_3 from datawindow within w_irusersilsa_m
end type
type em_1 from editmask within w_irusersilsa_m
end type
type st_3 from statictext within w_irusersilsa_m
end type
type ddlb_2 from dropdownlistbox within w_irusersilsa_m
end type
type rb_4 from radiobutton within w_irusersilsa_m
end type
type rb_3 from radiobutton within w_irusersilsa_m
end type
type sle_1 from singlelineedit within w_irusersilsa_m
end type
type cb_1 from commandbutton within w_irusersilsa_m
end type
type ddlb_1 from dropdownlistbox within w_irusersilsa_m
end type
type dw_6 from datawindow within w_irusersilsa_m
end type
end forward

global type w_irusersilsa_m from w_inheritance
integer y = 112
integer width = 3872
integer height = 2104
string title = "담당자별 실사관리(w_irusersilsa_m)"
dw_4 dw_4
dw_3 dw_3
em_1 em_1
st_3 st_3
ddlb_2 ddlb_2
rb_4 rb_4
rb_3 rb_3
sle_1 sle_1
cb_1 cb_1
ddlb_1 ddlb_1
dw_6 dw_6
end type
global w_irusersilsa_m w_irusersilsa_m

type variables
st_print i_print
datawindowchild  idwc_qa, idwc_item
int ii_sel = 0, ii_sel1 = 1, ii_sw = 0
end variables

forward prototypes
public subroutine wf_fil ()
end prototypes

public subroutine wf_fil ();string ls_filter, ls_fil1, ls_fil2

CHOOSE CASE ii_sel1
	CASE 1
		ls_fil1 = ''
	CASE 2
		ls_fil1 = 'qoh <> 0'
	CASE 3
		ls_fil1 = 'eom_qoh <> 0'
	CASE 4
		ls_fil1 = 'qoh <> 0 or eom_qoh <> 0'
	CASE 5
		ls_fil1 = 'qoh = 0'
	CASE 6
		ls_fil1 = 'def <> 0'
END CHOOSE
ls_fil2 = ''
if sle_1.text = '' then
else
	if ls_fil1 <> '' then ls_fil2 = ' and '
	CHOOSE CASE rb_3.checked
		CASE true
			ls_fil2 = ls_fil2 + '(item_no like "' + trim(sle_1.text) + '%")'
		CASE ELSE
			ls_fil2 = ls_fil2 + '(groupitem_item_name like "%' + trim(sle_1.text) + '%")'
	END CHOOSE
end if
ls_filter = ls_fil1 + ls_fil2
dw_3.setfilter(ls_filter)
dw_3.filter()
cb_1.DEFAULT = false
dw_3.setfocus()

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_loc

dw_3.settransobject(sqlca)
dw_6.settransobject(sqlca)

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday
SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), "YYYY/MM")
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "YYYY/MM")	// 전달말일
end if


dw_1.insertrow(1)
dw_1.setitem(1,'user_id',gs_userid)

dw_2.insertrow(1)

SELECT def_loc INTO :ls_loc FROM area WHERE area_no = :gs_area;
dw_2.object.loc_no[1] = ls_loc

ddlb_1.text = '전체'
ddlb_2.text = '--'
dw_4.visible = false
dw_6.visible = false

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_3.sharedata(dw_4)

end event

on w_irusersilsa_m.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.dw_3=create dw_3
this.em_1=create em_1
this.st_3=create st_3
this.ddlb_2=create ddlb_2
this.rb_4=create rb_4
this.rb_3=create rb_3
this.sle_1=create sle_1
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.dw_6=create dw_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_2
this.Control[iCurrent+6]=this.rb_4
this.Control[iCurrent+7]=this.rb_3
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.ddlb_1
this.Control[iCurrent+11]=this.dw_6
end on

on w_irusersilsa_m.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.ddlb_2)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.dw_6)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x


end event

type pb_save from w_inheritance`pb_save within w_irusersilsa_m
integer x = 3278
integer y = 60
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
dw_3.accepttext()
if gs_userid <> '1999010s' and gs_userid <> 'root' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 변경하실 수 있습니다")
	return
end if

long ll_row
for ll_row = 1 to dw_3.rowcount()
	if dw_3.object.stock[ll_row] <> dw_3.object.stock_qty[ll_row] then
		dw_3.object.stock_qty[ll_row] = dw_3.object.stock[ll_row]
	end if
next

dw_3.accepttext()
if wf_update1(dw_3,"Y") = true then
end if

end event

type dw_1 from w_inheritance`dw_1 within w_irusersilsa_m
integer x = 1765
integer y = 128
integer width = 631
integer height = 80
integer taborder = 60
string dataobject = "d_userid_c2"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::losefocus;call super::losefocus;dw_1.accepttext()

end event

event dw_1::itemchanged;call super::itemchanged;dw_3.reset()
end event

type st_title from w_inheritance`st_title within w_irusersilsa_m
integer x = 37
integer y = 24
integer width = 1202
integer height = 136
string text = "담당자별 실사관리"
end type

type st_tips from w_inheritance`st_tips within w_irusersilsa_m
end type

type pb_compute from w_inheritance`pb_compute within w_irusersilsa_m
integer x = 1358
integer y = 56
integer width = 174
integer taborder = 120
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "참조추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_compute::clicked;call super::clicked;gs_where2 lstr_where
long   ll_row, ll_cnt, ll_row1, ll_dw3row
string ls_loc

// 가입고, 작업일보, 물품이동등 선작업 CHECK 후 진행해야 함.
dw_1.accepttext()
if gs_userid <> '1999010s' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 추가하실 수 있습니다")
	return
end if

dw_2.accepttext()
dw_3.accepttext()
ls_loc = trim(dw_2.object.loc_no[1])
if trim(ls_loc) = '' or isnull(ls_loc) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.str1[1] = em_1.text
lstr_where.str2[1] = dw_1.object.user_id[1]
lstr_where.str3[1] = ls_loc
openwithparm(w_whusersilsa_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

dw_3.setredraw(false)
ll_dw3row = dw_3.rowcount()
for ll_row = 1 to UpperBound(lstr_where.str1)						
	for ll_row1 = 1 to ll_dw3row
		if dw_3.object.item_no[ll_row1] = trim(lstr_where.str1[ll_row]) &
			and dw_3.object.qa[ll_row1] = trim(lstr_where.str2[ll_row]) then
			continue
		end if
	next
	ll_cnt = dw_3.insertrow(0)
	dw_3.object.cyear[ll_cnt] = MidA(em_1.text,1,4)
	dw_3.object.cmon[ll_cnt]  = MidA(em_1.text,6,2)
	dw_3.object.user_id[ll_cnt] = gs_userid
	dw_3.object.loc_no[ll_cnt]  = ls_loc
	dw_3.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_3.object.qa[ll_cnt]  = trim(lstr_where.str2[ll_row])
	dw_3.object.uom[ll_cnt] = trim(lstr_where.str3[ll_row])
	dw_3.object.eom_qoh[ll_row] = dec(lstr_where.str4[ll_row])
	dw_3.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_3.scrolltorow(ll_cnt)
idwc_qa.setfilter("item_no = '" + dw_3.object.item_no[ll_cnt] + "'")
idwc_qa.filter()
dw_3.setcolumn('qoh')
dw_3.setfocus()
dw_3.setredraw(true)

end event

event pb_compute::mousemove;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_irusersilsa_m
integer x = 1545
integer y = 56
integer width = 174
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "다중추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;call super::clicked;string ls_loc
long   ll_row, ll_cnt, ll_row1, ll_dw3row
gs_where2 lstr_where

dw_1.accepttext()
if gs_userid <> '1999010s' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 추가하실 수 있습니다")
	return
end if

dw_2.accepttext()
dw_3.accepttext()
ls_loc = trim(dw_2.object.loc_no[1])
if trim(ls_loc) = '' or isnull(ls_loc) then
	messagebox("확인","저장소를 선택하십시요")
	return
end if

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = dw_2.object.loc_no[1]
openwithparm(w_whitemlocqohmulti_w, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

Open(W_ICPROCESS)
dw_3.setredraw(false)
ll_dw3row = dw_3.rowcount()
for ll_row = 1 to UpperBound(lstr_where.str1)						
	w_icprocess.hpb_1.position = (ll_row / UpperBound(lstr_where.str1)) * 100
	for ll_row1 = 1 to ll_dw3row
		if dw_3.object.item_no[ll_row1] = trim(lstr_where.str1[ll_row]) &
			and dw_3.object.qa[ll_row1] = trim(lstr_where.str2[ll_row]) then
			continue
		end if
	next
	
	ll_cnt = dw_3.insertrow(0)
	dw_3.object.cyear[ll_cnt] = MidA(em_1.text,1,4)
	dw_3.object.cmon[ll_cnt] = MidA(em_1.text,6,2)
	dw_3.object.user_id[ll_cnt] = gs_userid
	dw_3.object.loc_no[ll_cnt] = ls_loc
	dw_3.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
	dw_3.object.qa[ll_cnt] = trim(lstr_where.str2[ll_row])
	dw_3.object.eom_qoh[ll_row] = 0
	if trim(lstr_where.str3[ll_row]) = 'M' or trim(lstr_where.str3[ll_row]) = 'M2' then 
		dw_3.object.uom[ll_cnt] = 'EA'
	else
		dw_3.object.uom[ll_cnt] = trim(lstr_where.str3[ll_row])
	end if
	dw_3.object.groupitem_item_name[ll_cnt] = trim(lstr_where.name[ll_row])
next

dw_3.scrolltorow(ll_cnt)
idwc_qa.setfilter("item_no = '" + dw_3.object.item_no[ll_cnt] + "'")
idwc_qa.filter()
dw_3.setcolumn('qoh')
dw_3.setfocus()
dw_3.setredraw(true)
close(w_icprocess)

end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_irusersilsa_m
integer x = 3470
integer y = 60
integer taborder = 150
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irusersilsa_m
integer x = 3086
integer y = 60
integer taborder = 160
string text = " "
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
if dw_1.rowcount() < 1 then return

i_print.st_datawindow  = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 담당자별 실사관리를 출력합니다." 
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=96'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_irusersilsa_m
integer x = 3488
integer y = 288
integer height = 92
integer taborder = 170
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "처리"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_cancel::clicked;call super::clicked;long ll_row

dw_1.accepttext()
dw_3.accepttext()
if gs_userid <> '1999010s' and gs_userid <> 'root' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 처리하실 수 있습니다")
	return
end if

dw_3.setredraw(false)
choose case ii_sel
	case 2
		if messagebox("확인","실사수량을 전부 0 으로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 1 then 
			for ll_row = 1 to dw_3.rowcount()
				dw_3.object.qoh[ll_row] = 0
			next
		end if

	case 3
		if messagebox("확인","실사수량을 전부 월말재고로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 1 then 
			for ll_row = 1 to dw_3.rowcount()
				dw_3.object.qoh[ll_row] = dw_3.object.eom_qoh[ll_row]
			next
		end if

	case 4
		if messagebox("확인","실사수량을 전부 월말재고로 만드시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 1 then 
			for ll_row = dw_3.rowcount() to 1 step -1
				if dw_3.object.qoh[ll_row] = 0 and dw_3.object.eom_qoh[ll_row] = 0 then
					dw_3.deleterow(ll_row)
				end if
			next
		end if

//	case 3 //0보다 작은 월말재고만
//		if messagebox("확인","실사수량이 없는 실사수량을 전부 월말재고로 만드시겠습니까?", &
//				Exclamation!, OKCancel!, 2) = 1 then 
//			for ll_row = 1 to dw_3.rowcount()
//				if dw_3.object.eom_qoh[ll_row] > 0 &
//					and (isnull(dw_3.object.qoh[ll_row]) or dw_3.object.qoh[ll_row] = 0 )then
//					dw_3.object.qoh[ll_row] = dw_3.object.eom_qoh[ll_row]
//				end if
//			next
//			messagebox("확인","작업이 완료되었습니다.")
//		end if
//	case 4 //실사를 0 (0>월말재고만)
//		if messagebox("확인","0보다 작은 월말재고만 실사수량을 0으로 만드시겠습니까?", &
//				Exclamation!, OKCancel!, 2) = 1 then 
//			for ll_row = 1 to dw_3.rowcount()
//				if dw_3.object.eom_qoh[ll_row] <> 0 and isnull(dw_3.object.qoh[ll_row])then
//					dw_3.object.qoh[ll_row] = 0
//				end if
//			next
//			messagebox("확인","작업이 완료되었습니다.")
//		end if
//	case 5 //실사를 0 (월말<>0,실사없는것) 
//		if messagebox("확인","월말재고가 0이아니면서 실사수량 없는 실사수량을 0으로 만드시겠습니까?", &
//				Exclamation!, OKCancel!, 2) = 1 then 
//			for ll_row = 1 to dw_3.rowcount()
//				if dw_3.object.eom_qoh[ll_row] <> 0 and isnull(dw_3.object.qoh[ll_row])then
//					dw_3.object.qoh[ll_row] = 0
//				end if
//			next
//			messagebox("확인","작업이 완료되었습니다.")
//		end if
end choose

ddlb_2.text = '--'
ii_sel = 1
dw_3.setfocus()
if dw_3.rowcount() > 0 then dw_3.scrolltorow(1)

dw_3.setredraw(true)
dw_3.accepttext()

end event

type pb_delete from w_inheritance`pb_delete within w_irusersilsa_m
integer x = 2894
integer y = 60
integer taborder = 180
end type

event pb_delete::clicked;dw_1.accepttext()
dw_3.accepttext()
if gs_userid <> '1999010s' and gs_userid <> 'root' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 삭제하실 수 있습니다")
	return
end if
if dw_3.getrow() < 1 then return

dw_3.deleterow(dw_3.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_irusersilsa_m
integer x = 2702
integer y = 60
integer taborder = 210
end type

event pb_insert::clicked;long ll_row
string ls_item_no, ls_location

dw_3.accepttext()
dw_2.accepttext()
dw_1.accepttext()
if gs_userid <> '1999010s' and gs_userid <> 'root' and gs_userid <> dw_1.object.user_id[1] then
	messagebox("확인","담당자만이 추가하실 수 있습니다")
	return
end if
dw_3.setredraw(false)
if dw_3.getrow() < 1 then
	ll_row = 0
else
	ll_row = dw_3.getrow() + 1
end if 

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

ll_row = dw_3.insertrow(ll_row)

if ll_row > 1 then
	dw_3.object.item_no[ll_row] = dw_3.object.item_no[ll_row - 1]
	dw_3.object.groupitem_item_name[ll_row] = dw_3.object.groupitem_item_name[ll_row - 1]
	dw_3.object.uom[ll_row] = dw_3.object.uom[ll_row - 1]

	dw_3.getchild("qa", idwc_qa)
	gs_ds_qaall.ShareData(idwc_qa)
end if
dw_3.object.cyear[ll_row] = MidA(em_1.text,1,4)
dw_3.object.cmon[ll_row] = MidA(em_1.text,6,2)
dw_3.object.user_id[ll_row] = gs_userid
dw_3.object.loc_no[ll_row] = dw_2.object.loc_no[1]
dw_3.object.eom_qoh[ll_row] = 0
dw_3.scrolltorow(ll_row)
ls_item_no = dw_3.object.item_no[ll_row]
idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
idwc_qa.filter()
dw_3.setcolumn('qa')
dw_3.setfocus()
dw_3.setredraw(true)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_irusersilsa_m
integer x = 2510
integer y = 60
integer taborder = 190
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_id,ls_loc

dw_1.accepttext()
dw_2.accepttext()

ls_id  = dw_1.object.user_id[1]
ls_loc = dw_2.object.loc_no[1]

if (isnull(ls_id) or ls_id = '') or (isnull(ls_loc) or ls_loc = '') then
	MessageBox('알림','담당자와 저장소를 선택하십시오')
	return
end if

dw_3.reset()
dw_3.setfilter('')
dw_3.filter()
dw_3.retrieve(MidA(em_1.text,1,4),MidA(em_1.text,6,2), ls_loc, ls_id)

MessageBox("확인","조회완료")

end event

type gb_3 from w_inheritance`gb_3 within w_irusersilsa_m
integer x = 32
integer y = 244
integer width = 3767
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_irusersilsa_m
integer x = 1307
integer y = 16
integer width = 1129
integer height = 208
integer taborder = 110
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_irusersilsa_m
integer x = 2469
integer y = 16
integer width = 1216
integer height = 208
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_irusersilsa_m
integer x = 73
integer width = 841
integer height = 84
integer taborder = 70
string dataobject = "d_irlocno_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::losefocus;call super::losefocus;dw_2.accepttext()

end event

event dw_2::itemchanged;call super::itemchanged;dw_3.reset()
end event

type dw_4 from datawindow within w_irusersilsa_m
integer x = 50
integer y = 180
integer width = 87
integer height = 64
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_irusersilsa_r"
boolean livescroll = true
end type

type dw_3 from datawindow within w_irusersilsa_m
integer x = 32
integer y = 424
integer width = 3767
integer height = 1540
integer taborder = 90
string title = "d_irusersilsa_m"
string dataobject = "d_irusersilsa_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row

ll_row = this.getrow()

if ll_row < 1 then return

this.SelectRow(0,  false)
this.SelectRow(ll_row,  true)

end event

event clicked;//if row < 1 then
//	gf_sort_random(This, True)   
//	Return
//end if

string ls_sort, ls_sort_sub, ls_dwo_nm

if this.RowCount() < 2 then return

if row > 0 then
	this.scrolltorow(row)
	
	string  ls_item_no
	
	if dwo.name = 'qa' then
		this.getchild("qa", idwc_qa)
		idwc_qa.setredraw(false)
		gs_ds_qaall.ShareData(idwc_qa)
	
		this.accepttext()
		ls_item_no = this.object.item_no[row]
		if ls_item_no = '' or isnull(ls_item_no) then
			return
		else
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
		end if
		this.setcolumn('qa')
		idwc_qa.setredraw(true)
		this.setredraw(true)
	end if
elseif (row = 0 and PosA(string(dwo.name),'_t') > 0) then
	setpointer(Hourglass!)
	this.SetRedraw(false)

	IF string(dwo.font.Underline) = '1' THEN
		dwo.font.Underline = 0
		ls_sort_sub = ' A'
	ELSE
		dwo.font.Underline = 1
		ls_sort_sub = ' D'
	END IF

	ls_sort = THIS.object.DataWindow.Table.sort
	ls_dwo_nm = LeftA(string(dwo.name),LenA(string(dwo.name)) - 2)
	THIS.SetSort(ls_dwo_nm + ls_sort_sub)
	this.Sort()
	this.GroupCalc()
	this.SetRedraw(true)
	setpointer(Arrow!)
	this.event rowfocuschanged(1)
end if

//if row < 1 then return
//this.scrolltorow(row)
//
//string  ls_item_no
//
//if dwo.name = 'qa' then
//	this.getchild("qa", idwc_qa)
//	idwc_qa.setredraw(false)
//	gs_ds_qaall.ShareData(idwc_qa)
//
//	this.accepttext()
//	ls_item_no = this.object.item_no[row]
//	if ls_item_no = '' or isnull(ls_item_no) then
//		return
//	else
//		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
//		idwc_qa.filter()
//	end if
//	this.setcolumn('qa')
//	idwc_qa.setredraw(true)
//	this.setredraw(true)
//end if
//
end event

event itemchanged;long ll_row, ll_row1, ll_found, ll_cnt
string ls_item_no, ls_qa, ls_date, ls_item_name,  ls_data, ls_uom

this.accepttext()
dw_2.accepttext()
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

choose case dwo.name
	case 'item_no'
		this.object.qa[ll_row] = ''
		this.object.qa.tabsequence = 0
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select count(*) into :ll_cnt from groupitem
		 where item_no = :ls_data
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 품목은 사용불가된 품목입니다. ~r~n" &
								+ "정확한 품목을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if

		select item_name, uom into :ls_item_name, :ls_uom from groupitem 
		 where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if
		this.object.groupitem_item_name[ll_row] = ls_item_name
		this.object.uom[ll_row] = ls_uom
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
//			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
				this.setcolumn("qa")
				this.setfocus()
			else
				this.object.qa.tabsequence = 0
				this.setcolumn("item_no")
				this.setfocus()
			end if
		end if

	case 'qa'
		ls_data = data
		select count(*) into :ll_cnt from item
		 where item_no = :ls_item_no
			and qa = :ls_data
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)

		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if
end choose

end event

event itemerror;string ls_null

setnull(ls_null)
CHOOSE CASE dwo.name
	CASE 'item_no'
			this.object.item_no[row] = ls_null
	CASE 'qa'
			this.object.qa[row] = ls_null
END CHOOSE
		
return 2
end event

event doubleclicked;//
gs_where lstr_where

//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

if isnull(row) OR row < 1 then return

dw_1.accepttext()

lstr_where.str1 = this.object.loc_no[row]
lstr_where.str2 = this.object.item_no[row]
lstr_where.str3 = this.object.qa[row]
lstr_where.str4 = this.object.uom[row]
lstr_where.str5 = string(this.object.stock[row])
lstr_where.name = this.object.groupitem_item_name[row]
lstr_where.chk  = "Y"

OpenWithParm( w_whitemstock_m, lstr_where )
lstr_where = Message.PowerObjectParm

end event

event rbuttondown;if row < 1 then return
gs_where lst_where

this.scrolltorow(row)
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
int ls_a
ls_a = this.GetClickedColumn()

lst_where.str1 = trim(this.object.item_no[row])
lst_where.str2 = trim(this.object.qa[row])
lst_where.str3 = trim(this.object.loc_no[row])
lst_where.name = trim(this.object.groupitem_item_name[row])

m_manager NewMenu
int li_int

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_inaudit .PopMenu(parent.parentwindow().PointerX(), parent.parentwindow().PointerY())

lst_where.chk = "DO"
if gs_print_control = 'INAUDIT' then
	openwithparm(w_whinaudit_w, lst_where)
	w_whinaudit_w.WindowState = Normal!
	lst_where = message.powerobjectparm
end if

end event

type em_1 from editmask within w_irusersilsa_m
integer x = 1769
integer y = 48
integer width = 357
integer height = 76
integer taborder = 350
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
end type

event modified;dw_3.reset()
end event

event rbuttondown;// 년월
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm),"yyyy/mm")
end if

end event

type st_3 from statictext within w_irusersilsa_m
integer x = 2144
integer y = 60
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "월말"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_irusersilsa_m
integer x = 2770
integer y = 296
integer width = 704
integer height = 492
integer taborder = 330
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"--","   0    =>실사수량","월말재고=>실사수량","월말/실사 =0 인것 삭제"}
integer accelerator = 48
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_sel = index
end event

type rb_4 from radiobutton within w_irusersilsa_m
integer x = 960
integer y = 284
integer width = 165
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "명"
boolean checked = true
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "groupitem_item_name A, item_no A, qa A "
else
	ii_sw = 0
	ls_sort = "groupitem_item_name D, item_no A, qa A "
end if
dw_3.SetSort(ls_sort)
dw_3.Sort( )
	
end event

type rb_3 from radiobutton within w_irusersilsa_m
integer x = 960
integer y = 340
integer width = 210
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
string text = "코드"
end type

event clicked;string ls_sort

IF ii_sw = 0 then
	ii_sw = 1
	ls_sort = "item_no A, qa A, groupitem_item_name A "
else
	ii_sw = 0
	ls_sort = "item_no D, qa A, groupitem_item_name A "
end if
dw_3.SetSort(ls_sort)
dw_3.Sort( )
	
end event

type sle_1 from singlelineedit within w_irusersilsa_m
integer x = 1216
integer y = 296
integer width = 507
integer height = 84
integer taborder = 330
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;cb_1.DEFAULT = true

end event

type cb_1 from commandbutton within w_irusersilsa_m
integer x = 1742
integer y = 292
integer width = 178
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;wf_fil()
sle_1.setfocus()
end event

type ddlb_1 from dropdownlistbox within w_irusersilsa_m
integer x = 1938
integer y = 296
integer width = 809
integer height = 628
integer taborder = 340
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"전체","실사수량이 0 이 아닌것만","월말재고가 0 이 아닌것만","둘중하나가 0 이 아닌것만","실사수량이 0 인 것만","차이수량이 0 이 아닌것만"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ii_sel1 = index
wf_fil()
end event

type dw_6 from datawindow within w_irusersilsa_m
integer x = 192
integer y = 180
integer width = 87
integer height = 64
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_irusersilsa_s"
end type

