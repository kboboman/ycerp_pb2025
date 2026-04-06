$PBExportHeader$w_iointemp_m.srw
$PBExportComments$가입고관리(2003/08/05, 이인호)
forward
global type w_iointemp_m from w_inheritance
end type
type em_1 from editmask within w_iointemp_m
end type
type em_2 from editmask within w_iointemp_m
end type
type dw_3 from datawindow within w_iointemp_m
end type
type st_2 from statictext within w_iointemp_m
end type
type rb_1 from radiobutton within w_iointemp_m
end type
type rb_2 from radiobutton within w_iointemp_m
end type
type st_3 from statictext within w_iointemp_m
end type
type st_4 from statictext within w_iointemp_m
end type
type st_5 from statictext within w_iointemp_m
end type
type cbx_1 from checkbox within w_iointemp_m
end type
type hpb_1 from hprogressbar within w_iointemp_m
end type
type st_magam from statictext within w_iointemp_m
end type
type st_8 from statictext within w_iointemp_m
end type
type ddlb_col from dropdownlistbox within w_iointemp_m
end type
type st_9 from statictext within w_iointemp_m
end type
type ddlb_2 from dropdownlistbox within w_iointemp_m
end type
type sle_value from singlelineedit within w_iointemp_m
end type
type cb_filteron from commandbutton within w_iointemp_m
end type
type cb_filteroff from commandbutton within w_iointemp_m
end type
type cb_7 from commandbutton within w_iointemp_m
end type
type cb_4 from commandbutton within w_iointemp_m
end type
type cb_1 from commandbutton within w_iointemp_m
end type
type cb_2 from commandbutton within w_iointemp_m
end type
type cb_3 from commandbutton within w_iointemp_m
end type
type cbx_all from checkbox within w_iointemp_m
end type
end forward

global type w_iointemp_m from w_inheritance
integer width = 4544
integer height = 2656
string title = "가입고 관리(w_iointemp_m)"
em_1 em_1
em_2 em_2
dw_3 dw_3
st_2 st_2
rb_1 rb_1
rb_2 rb_2
st_3 st_3
st_4 st_4
st_5 st_5
cbx_1 cbx_1
hpb_1 hpb_1
st_magam st_magam
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_7 cb_7
cb_4 cb_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cbx_all cbx_all
end type
global w_iointemp_m w_iointemp_m

type variables
datawindowchild idwc_item,idwc_qa
string is_loc
end variables

on w_iointemp_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.cbx_1=create cbx_1
this.hpb_1=create hpb_1
this.st_magam=create st_magam
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_7=create cb_7
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cbx_all=create cbx_all
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.hpb_1
this.Control[iCurrent+12]=this.st_magam
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_col
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.ddlb_2
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_filteron
this.Control[iCurrent+19]=this.cb_filteroff
this.Control[iCurrent+20]=this.cb_7
this.Control[iCurrent+21]=this.cb_4
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cbx_all
end on

on w_iointemp_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.cbx_1)
destroy(this.hpb_1)
destroy(this.st_magam)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cbx_all)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)
dw_3.insertrow(1)

ddlb_col.text = "품명"
ddlb_2.text   = "LIKE"

hpb_1.visible = false
st_magam.text = ""
em_1.text = string(today(), 'yyyy/mm/01')
em_2.text = string(today(), 'yyyy/mm/dd')

SELECT def_loc INTO :is_loc FROM area WHERE area_no = :gs_area; 
dw_3.object.loc_no[1] = is_loc
dw_3.accepttext()

if GF_PERMISSION('가입고관리_저장권한', gs_userid) = 'Y' then	
else
	pb_save.enabled = false
end if

if GF_PERMISSION('가입고관리_규격편집', gs_userid) = 'Y' then	
	dw_1.Modify("qa.dddw.allowedit=yes")
end if

dw_1.getchild('item_no',idwc_item)
GS_DS_ITEMALL.ShareData(idwc_item)

dw_1.getchild('qa',idwc_qa)
GS_DS_QAALL.ShareData(idwc_qa)

rb_2.postevent(clicked!)	// 내자료

end event

event resize;call super::resize;//
dw_1.width  = this.width  - 91

dw_2.width  = this.width  - 91
dw_2.height = this.height - 972

end event

type pb_save from w_inheritance`pb_save within w_iointemp_m
integer x = 4055
integer y = 68
end type

event pb_save::clicked;call super::clicked;long   ll_seq
string ls_tempno
dwItemStatus l_status

dw_1.accepttext()
if dw_1.rowcount() < 1 and dw_2.DeletedCount() < 1 then return

l_status = dw_1.getitemstatus(1, 0, primary!)
if l_status = New! or l_status = NewModified! then
	if wf_nullchk(dw_1) = false then return
	
	SELECT isnull(IDENT_CURRENT ('intemp'), 0) + 1 INTO :ll_seq FROM login WHERE user_id = :gs_userid;	 
	ls_tempno = LeftA(gs_area, 1) + 'T' + string(dw_1.object.intemp_date[1], 'yyyymmdd') + "-" + RightA( "000" + trim(string(ll_seq)),3)
	dw_1.object.intemp_no[1] = ls_tempno
	
	if wf_update1(dw_1, 'Y') = false then return	
elseif dw_2.DeletedCount() > 0 then
	if wf_update1(dw_2, 'Y') = false then return
end if

// 재고에서 수량 플러스는 intemp 의 트리거에 있다.

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type dw_1 from w_inheritance`dw_1 within w_iointemp_m
integer x = 23
integer y = 312
integer width = 4453
integer height = 444
integer taborder = 50
string dataobject = "d_iointemp_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;long ll_row, ll_cnt, ll_row1, ll_found
double ldb_qty, ldb_pri
string ls_item_no, ls_qa, ls_null, ls_data, ls_item_name

this.accepttext()
dw_2.accepttext()
setnull(ls_null)
ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")

Choose case dwo.name
	case 'item_no'
		this.object.qa[ll_row] = ls_null
		this.object.uom[ll_row] = ls_null
		ls_data = data
		select count(*) into :ll_cnt from groupitem
		 where item_no = :ls_item_no
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 코드입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		select item_name into :ls_item_name from groupitem 
		 where item_no = :ls_data
			and use_flag = 'Y';
		if sqlca.sqlcode = 100 then 
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		
		if ls_item_no <> '' then
			select count(*) into :ll_cnt from item
			 where item_no = :ls_item_no
			   and use_flag = 'Y';
			if ll_cnt > 0 then
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			end if
			if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
				this.setcolumn("qa")
				this.setfocus()
			else
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
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
				if gf_iteminsert(ls_item_no, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if
		this.object.uom[ll_row] = trim(idwc_qa.getitemstring(idwc_qa.getrow(), "uom"))
end Choose

end event

event dw_1::itemerror;call super::itemerror;string ls_null
this.accepttext()

setnull(ls_null)
choose case dwo.name
	case 'item_no'
		this.object.item_no[row] = ls_null
	case 'qa'
		this.object.qa[row] = ls_null
end choose
this.accepttext()
return 1
end event

type dw_2 from w_inheritance`dw_2 within w_iointemp_m
integer x = 23
integer y = 860
integer width = 4453
integer height = 1640
integer taborder = 60
string dataobject = "d_iointemp_s"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;string ls_order
long   ll_seq, ll_row

ll_row = this.getrow()
if ll_row < 1 then return

//this.SelectRow(0,  false)
//this.SelectRow(ll_row,  true)

this.scrolltorow(currentrow)

ls_order = this.object.intemp_no[ll_row]
ll_seq   = this.object.seq[ll_row]
dw_1.Retrieve(ls_order, ll_seq)

end event

event dw_2::clicked;call super::clicked;if row < 1 then return

this.scrolltorow(row)

string ls_col, ls_text

if row < 1 then return
this.scrolltorow(row)

choose case dwo.name
	case "chk"
		ls_col = "실입고"
		ls_text = string(this.object.chk[row])
	case "intemp_no"
		ls_col = "가입고번호 "
		ls_text = string(this.object.intemp_no[row])
	case "seq"
		ls_col = "번호 "
		ls_text = string(this.object.seq[row])
	case "intemp_intemp_date"
		ls_col = "가입고일자"
		ls_text = string(this.object.intemp_intemp_date[row])
	case "groupitem_item_name"
		ls_col = "품명"
		ls_text = string(this.object.groupitem_item_name[row])
	case "intemp_qa"
		ls_col = "규격"
		ls_text = string(this.object.intemp_qa[row])
	case "intemp_qty"
		ls_col = "가입고수량"
		ls_text = string(this.object.intemp_qty[row])
	case "intemp_flag"
		ls_col = "발생원인"
		ls_text = string(this.object.intemp_flag[row])
	case "intemp_order_no"
		ls_col = "발생번호"
		ls_text = string(this.object.intemp_order_no[row])
	case "intemp_seq_no"
		ls_col = "순번"
		ls_text = string(this.object.intemp_seq_no[row])
	case "intemp_user_date"
		ls_col = "입력일자"
		ls_text = string(this.object.intemp_user_date[row])
	case "user_id"
		ls_col = "입력자"
		ls_text = string(this.object.user_id[row])
	case "intemp_item_no"
		ls_col = "물품코드"
		ls_text = string(this.object.intemp_item_no[row])
	case "insp_no"
		ls_col = "입고번호"
		ls_text = string(this.object.insp_no[row])
end choose		

choose case ls_col
	case "품명", "가입고일자", "발생번호"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type st_title from w_inheritance`st_title within w_iointemp_m
integer x = 32
integer y = 56
integer width = 969
string text = "가입고 관리"
end type

type st_tips from w_inheritance`st_tips within w_iointemp_m
integer x = 206
integer y = 176
end type

type pb_compute from w_inheritance`pb_compute within w_iointemp_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_iointemp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iointemp_m
integer x = 4247
integer y = 68
integer taborder = 110
fontcharset fontcharset = ansi!
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iointemp_m
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_iointemp_m
integer x = 3465
integer y = 68
integer taborder = 130
end type

event pb_cancel::clicked;call super::clicked;//
dw_1.reset()
dw_2.reset()

end event

type pb_delete from w_inheritance`pb_delete within w_iointemp_m
integer x = 3671
integer y = 68
integer taborder = 140
end type

event pb_delete::clicked;call super::clicked;//
dw_2.accepttext()
if dw_2.getrow() < 1 then return

if gs_userid = dw_2.object.user_id[dw_2.getrow()] or &
   gf_permission('가입고관리_타인삭제', gs_userid) = 'Y' then	
else
	MessageBox("확인", "입력자만이 삭제할수 있습니다")
	return
end if

dw_2.DeleteRow(dw_2.getrow())
dw_2.SelectRow(0,  false)
dw_2.SelectRow(dw_2.getrow(), true)

end event

type pb_insert from w_inheritance`pb_insert within w_iointemp_m
integer x = 3863
integer y = 68
integer taborder = 160
end type

event pb_insert::clicked;call super::clicked;//
long ll_row
datetime ldt_date

if gs_userid <> '1999010s' and is_loc <> dw_3.object.loc_no[1] then
	messagebox("확인","선택하신 작업장에는 추가 하실수 없습니다")
	return
end if

dw_1.reset()
ll_row = dw_1.insertrow(0)

SELECT getdate() INTO :ldt_date FROM login WHERE user_id = :gs_userid;
dw_1.object.user_date[1]   = ldt_date
dw_1.object.loc_no[1]      = dw_3.object.loc_no[1]
dw_1.object.intemp_date[1] = wf_today()
dw_1.object.area_no[1]     = gs_area
dw_1.object.user_id[1]     = gs_userid

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_iointemp_m
integer x = 3255
integer y = 68
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row, ll_month
date   ld_date
string ls_start, ls_end,  ls_yyyymm, ls_magam

dw_1.reset()
dw_2.reset()

cbx_all.checked = false 	// 전체
st_magam.text  = ""
ls_start = em_1.text
ls_end   = em_2.text
ll_month = 0
SELECT top 1 DATEDIFF(month, :ls_start, :ls_end) INTO :ll_month FROM login;
if ll_month > 0 then
	if MessageBox("확인","조회기간은 1개월 단위로만 작업 하시기 바랍니다.(조회작업은 'Cancel')", Exclamation!, OKCancel!, 1) = 1 then
		return
	else
		pb_save.enabled = false
		cbx_1.enabled   = false
	end if
end if

ls_yyyymm = string(date(em_1.text),"yyyymm")
SELECT magam_yn INTO :ls_magam FROM mmagam WHERE yyyymm  = :ls_yyyymm;
if ls_magam = "Y" then 
	st_magam.text  = "해당년월 마감통제"
	pb_save.enabled = false
	cbx_1.enabled   = false
	MessageBox("확인","해당년월은 마감되었습니다.~n~n조회작업만 가능합니다.")
else
	st_magam.text  = "해당년월 작업가능"
	pb_save.enabled = true
	cbx_1.enabled   = true
end if

dw_2.retrieve(dw_3.object.loc_no[1], date(ls_start), date(ls_end))
MessageBox("확인","조회완료.")

end event

type gb_3 from w_inheritance`gb_3 within w_iointemp_m
integer x = 2551
integer y = 16
integer width = 645
integer height = 224
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_iointemp_m
integer x = 1051
integer y = 16
integer width = 1458
integer height = 224
integer taborder = 90
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "월단위 조회"
end type

type gb_1 from w_inheritance`gb_1 within w_iointemp_m
integer x = 3218
integer y = 16
integer width = 1257
integer height = 224
integer weight = 400
long textcolor = 0
end type

type em_1 from editmask within w_iointemp_m
integer x = 1646
integer y = 148
integer width = 366
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_iointemp_m
integer x = 2121
integer y = 148
integer width = 366
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_iointemp_m
integer x = 1641
integer y = 64
integer width = 859
integer height = 84
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_location"
boolean border = false
boolean livescroll = true
end type

event losefocus;dw_3.accepttext()

end event

type st_2 from statictext within w_iointemp_m
integer x = 2025
integer y = 140
integer width = 87
integer height = 72
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_iointemp_m
integer x = 1070
integer y = 76
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
dw_2.setfilter('')
dw_2.filter()

if GF_PERMISSION("가입고관리_타인삭제", gs_userid) = "Y" then
	cbx_1.enabled = true
else
	cbx_1.enabled = false
end if

end event

type rb_2 from radiobutton within w_iointemp_m
integer x = 1070
integer y = 148
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "내자료"
boolean checked = true
end type

event clicked;//
dw_2.setfilter('user_id = "' + gs_userid + '"')
dw_2.filter()

cbx_1.enabled = true

end event

type st_3 from statictext within w_iointemp_m
integer x = 3858
integer y = 256
integer width = 622
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "가입고관리_타인삭제"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_iointemp_m
integer x = 1376
integer y = 80
integer width = 256
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
string text = "저 장 소"
boolean focusrectangle = false
end type

type st_5 from statictext within w_iointemp_m
integer x = 1376
integer y = 160
integer width = 256
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
string text = "조회일자"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_iointemp_m
integer x = 2610
integer y = 148
integer width = 530
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "입고 자동삭제"
end type

event clicked;//
string ls_yyyymm,  ls_magam,  ls_saleno, ls_chk,     ls_old_time
long   ll_seqno,   ll_rowmax, ll_row,    ll_cnt, ll_count
integer li_rtn

if dw_2.rowcount() < 1 then return

hpb_1.visible  = true
hpb_1.position = 0

if this.checked = true then
	ll_rowmax  = dw_2.rowcount()
	for ll_row = ll_rowmax to 1 step -1
		ll_cnt  = ll_cnt + 1

		if ll_row < 1 then exit
		
		hpb_1.position = (ll_cnt / ll_rowmax) * 100
		
		ls_chk  = dw_2.object.chk[ll_row]
		if ls_chk = "Y" then
//			for ll_count = 1 to 100000
//				if ls_old_time <> string(now(), 'hh:mm:ss:fff') then
//					ls_old_time  = string(now(), 'hh:mm:ss:fff')	
//					exit
//				end if	
//			next
			
			ls_saleno  = dw_2.object.intemp_order_no[ll_row]
			ll_seqno   = dw_2.object.intemp_seq_no[ll_row]
		
			dw_2.ScrollToRow( ll_row )
			dw_2.SelectRow(0,  false)
			dw_2.SelectRow(ll_row,  true)
			
			dw_2.DeleteRow( ll_row )
			/*
			li_rtn  = dw_2.update()
			if li_rtn = 1 and SQLCA.SQLNRows > 0 then
        		COMMIT;
			else
				ll_count = ll_count + 1
				ROLLBACK;
			end if
			*/
			
			ll_count = 0
			SELECT count(order_no) INTO :ll_count FROM intemp  WHERE order_no = :ls_saleno AND seq_no = :ll_seqno;
			if ll_count = 1 then
				DELETE intemp  WHERE order_no = :ls_saleno AND seq_no  = :ll_seqno;
				if sqlca.sqlcode <> 0 then
					ll_count = ll_count + 1
					rollback;
				else
					commit;
				end if
			end if			
		end if
	next
	
	this.checked = false
end if

hpb_1.visible = false
MessageBox("확인",string(ll_count,"#,##0") + " 입고 자동삭제 완료.")

pb_retrieve.triggerevent( clicked! )

end event

type hpb_1 from hprogressbar within w_iointemp_m
integer x = 3474
integer y = 764
integer width = 1001
integer height = 88
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_magam from statictext within w_iointemp_m
integer x = 2565
integer y = 76
integer width = 617
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79741120
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_iointemp_m
integer x = 265
integer y = 788
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

type ddlb_col from dropdownlistbox within w_iointemp_m
integer x = 443
integer y = 768
integer width = 498
integer height = 532
integer taborder = 210
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
string item[] = {"실입고","가입고번호","번호","가입고일자","품명","규격","가입고수량","발생원인","발생번호","순번","비고","입력일자","입력자","물품코드","입고번호"}
end type

type st_9 from statictext within w_iointemp_m
integer x = 951
integer y = 788
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

type ddlb_2 from dropdownlistbox within w_iointemp_m
integer x = 1134
integer y = 768
integer width = 279
integer height = 512
integer taborder = 220
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

type sle_value from singlelineedit within w_iointemp_m
integer x = 1426
integer y = 772
integer width = 498
integer height = 76
integer taborder = 420
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_iointemp_m
integer x = 1952
integer y = 764
integer width = 160
integer height = 88
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "실입고"
			ls_col = "chk"
		case "가입고번호"
			ls_col = "intemp_no"
		case "번호"
			ls_col = "seq"
		case "가입고일자"
			ls_col = "intemp_intemp_date"
		case "품명"
			ls_col = "groupitem_item_name"
		case "규격"
			ls_col = "intemp_qa"
		case "가입고수량"
			ls_col = "intemp_qty"
		case "발생원인"
			ls_col = "intemp_flag"
		case "발생번호"
			ls_col = "intemp_order_no"
		case "순번"
			ls_col = "intemp_seq_no"
		case "입력일자"
			ls_col = "intemp_user_date"
		case "입력자"
			ls_col = "user_id"
		case "물품코드"
			ls_col = "intemp_item_no"
		case "입고번호"
			ls_col = "insp_no"
	end choose		
	
	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + " " + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "intemp_intemp_date" or ls_col = "intemp_user_date" then
			ls_column = ls_col + " " + trim(ddlb_2.text) + " #"  + trim(sle_value.text) + "# "
		else
			ls_column = ls_col + " " + trim(ddlb_2.text) + " '"  + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)
//dw_2.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_iointemp_m
integer x = 2117
integer y = 764
integer width = 160
integer height = 88
integer taborder = 200
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "품명"
sle_value.text  = ""

dw_2.setfilter("")
dw_2.filter()

end event

type cb_7 from commandbutton within w_iointemp_m
integer x = 2281
integer y = 764
integer width = 160
integer height = 88
integer taborder = 170
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
String ls_col
choose case trim(ddlb_col.text)
	case "실입고"
		ls_col = "chk "
	case "가입고번호"
		ls_col = "intemp_no "
	case "번호"
		ls_col = "seq "
	case "가입고일자"
		ls_col = "intemp_intemp_date"
	case "품명"
		ls_col = "groupitem_item_name"
	case "규격"
		ls_col = "intemp_qa"
	case "가입고수량"
		ls_col = "intemp_qty"
	case "발생원인"
		ls_col = "intemp_flag"
	case "발생번호"
		ls_col = "intemp_order_no"
	case "순번"
		ls_col = "intemp_seq_no"
	case "입력일자"
		ls_col = "intemp_user_date"
	case "입력자"
		ls_col = "user_id"
	case "물품코드"
		ls_col = "intemp_item_no"
	case "입고번호"
		ls_col = "insp_no"
end choose		

dw_2.SetSort(ls_col + " A")
dw_2.sort()

end event

type cb_4 from commandbutton within w_iointemp_m
integer x = 2446
integer y = 764
integer width = 160
integer height = 88
integer taborder = 180
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
String ls_col
choose case trim(ddlb_col.text)
	case "실입고"
		ls_col = "chk "
	case "가입고번호"
		ls_col = "intemp_no "
	case "번호"
		ls_col = "seq "
	case "가입고일자"
		ls_col = "intemp_intemp_date"
	case "품명"
		ls_col = "groupitem_item_name"
	case "규격"
		ls_col = "intemp_qa"
	case "가입고수량"
		ls_col = "intemp_qty"
	case "발생원인"
		ls_col = "intemp_flag"
	case "발생번호"
		ls_col = "intemp_order_no"
	case "순번"
		ls_col = "intemp_seq_no"
	case "입력일자"
		ls_col = "intemp_user_date"
	case "입력자"
		ls_col = "user_id"
	case "물품코드"
		ls_col = "intemp_item_no"
	case "입고번호"
		ls_col = "insp_no"
end choose		

dw_2.SetSort(ls_col + " D")
dw_2.sort()

end event

type cb_1 from commandbutton within w_iointemp_m
integer x = 2615
integer y = 764
integer width = 279
integer height = 88
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발생조회"
end type

event clicked;string ls_orderno
long   ll_row

ll_row     = dw_2.getrow()
ls_orderno = dw_2.object.intemp_order_no[ll_row]
if ls_orderno = "" or isnull(ls_orderno) then return
if LenA(ls_orderno) < 14 then
	if IsValid(w_o_main) then 
		OpenSheet(w_oigiask_m,  w_o_main,   5, original!)
	elseif IsValid(w_i_main) then 
		OpenSheet(w_oigiask_m,  w_i_main,   5, original!)
	elseif IsValid(w_m_main) then 
		OpenSheet(w_oigiask_m,  w_m_main,   5, original!)
	elseif IsValid(w_all_main) then 
		OpenSheet(w_oigiask_m,  w_all_main, 5, original!)
	end if
	
	return
end if

if LeftA(gs_team,1) = '7' then 
	if IsValid(w_orsale_m) then 
		MessageBox("확인","영업부서는 수주관리에서 확인하시기 바랍니다.~n~n수주관리 프로그램이 열린상태 입니다.")
		return
	end if
end if

if IsValid(w_o_main) then 
	OpenSheet(w_orsale_m,  w_o_main,   5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_orsale_m,  w_i_main,   5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_orsale_m,  w_m_main,   5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_orsale_m,  w_all_main, 5, original!)
end if

w_orsale_m.setredraw(false)
w_orsale_m.pb_save.enabled = false
w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)

end event

type cb_2 from commandbutton within w_iointemp_m
integer x = 2898
integer y = 764
integer width = 279
integer height = 88
integer taborder = 200
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력"
end type

event clicked;//
string ls_orderno
long   ll_row
gs_where lst_where

ll_row     = dw_2.getrow()
if ll_row < 1 then return

dw_2.scrolltorow(ll_row)

lst_where.str1 = trim(dw_2.object.intemp_item_no[ll_row])
lst_where.str2 = trim(dw_2.object.intemp_qa[ll_row])
lst_where.str3 = trim(dw_3.object.loc_no[1])
lst_where.name = trim(dw_2.object.groupitem_item_name[ll_row])

lst_where.chk = "DO"
OpenWithParm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type cb_3 from commandbutton within w_iointemp_m
integer x = 3186
integer y = 764
integer width = 279
integer height = 88
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "발주입고"
end type

event clicked;string ls_inspno
long   ll_row

ll_row     = dw_2.getrow()
ls_inspno  = dw_2.object.insp_no[ll_row]
if ls_inspno = "" or isnull(ls_inspno) then return

if LeftA(gs_team,1) = '91200' then 
	if IsValid(w_orsale_m) then 
		MessageBox("확인","영업부서는 수주관리에서 확인하시기 바랍니다.~n~n수주관리 프로그램이 열린상태 입니다.")
		return
	end if
end if

if IsValid(w_o_main) then 
	OpenSheet(w_ioin_m,  w_o_main,   5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_ioin_m,  w_i_main,   5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_ioin_m,  w_m_main,   5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_ioin_m,  w_all_main, 5, original!)
end if

//w_ioin_m.setredraw(false)
//w_ioin_m.pb_save.enabled = false
//w_ioin_m.em_3.text = left(ls_inspno,10)	// 수주번호
//w_ioin_m.em_4.text = string(integer(right(ls_inspno,3)))
//w_ioin_m.pb_cancel.postevent(clicked!)
//w_ioin_m.setredraw(true)

end event

type cbx_all from checkbox within w_iointemp_m
integer x = 37
integer y = 784
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;//
string ls_yyyymm,  ls_magam,  ls_saleno, ls_chk,     ls_old_time
long   ll_seqno,   ll_rowmax, ll_row,    ll_cnt, ll_count
integer li_rtn

if dw_2.rowcount() < 1 then return

hpb_1.visible  = true
hpb_1.position = 0

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

ll_rowmax  = dw_2.rowcount()
for ll_row = 1 to ll_rowmax
	hpb_1.position = (ll_row / ll_rowmax) * 100
	
	dw_2.object.chk[ll_row] = ls_chk
next

hpb_1.visible = false
MessageBox("확인","선택완료.")

end event

