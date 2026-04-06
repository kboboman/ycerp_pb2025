$PBExportHeader$w_whintemp_m.srw
$PBExportComments$가입고추가관리(2003/08/20, 이인호)
forward
global type w_whintemp_m from w_inheritance
end type
type st_1 from statictext within w_whintemp_m
end type
type cb_1 from commandbutton within w_whintemp_m
end type
end forward

global type w_whintemp_m from w_inheritance
integer x = 599
integer y = 864
integer width = 3575
integer height = 764
string title = "가입고관리(w_whintemp_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
st_1 st_1
cb_1 cb_1
end type
global w_whintemp_m w_whintemp_m

type variables
gs_alter_str ist_code
datawindowchild idwc_item, idwc_loc
end variables

on w_whintemp_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_whintemp_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;//
string   ls_loc, ls_uom, ls_locsql, ls_where, ls_sql
long     ll_row
dec{2}   ld_qoh
datetime ldt_date
datawindowchild ldwc_loc

ist_code = message.powerobjectparm

dw_1.getchild('item_no',idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.settransobject(sqlca)

//dw_1.getchild('loc_no',ldwc_loc)
//ldwc_loc.settransobject(sqlca)
//ls_locsql = ldwc_loc.describe("datawindow.table.select")
//ls_where = " AND area_no = ~~'" + gs_area + "~~'" 
//
//ls_sql = 'datawindow.table.select = "' + ls_locsql + ls_where + '"'
//
//ldwc_loc.modify(ls_sql)
//
//idwc_loc.retrieve()
//if gs_area = 'S0001' then
//	dw_1.object.loc_no.TabSequence = 40
//else
//	dw_1.object.loc_no.pretect = false
////	dw_1.object.loc_no.TabSequence = 0
//end if

dw_1.setredraw(false)
if dw_1.retrieve(ist_code.order_no, ist_code.seq) < 1 then
	dw_1.reset()
	
	ll_row = dw_1.insertrow(0)
	SELECT getdate() INTO :ldt_date FROM login WHERE user_id = :gs_userid;
	dw_1.object.user_date[1]   = ldt_date
	dw_1.object.intemp_date[1] = wf_today()
	dw_1.object.area_no[1]     = gs_area
	dw_1.object.user_id[1]     = gs_userid
	dw_1.object.item_no[1]     = ist_code.item_no   // ~ str5 , name, chk
	dw_1.object.qa[1]          = ist_code.qa        // ~ str5 , name, chk
	dw_1.object.uom[1]         = ist_code.uom
	dw_1.object.loc_no[1]      = ist_code.item_name
	dw_1.object.order_no[1]    = ist_code.order_no
	dw_1.object.seq_no[1]      = ist_code.seq
	dw_1.object.type[1]        = ist_code.chk
	dw_1.object.flag[1]        = "Z" 	// 기타 (기본값)
				
	SELECT qoh INTO :ld_qoh FROM itemloc
	 WHERE loc_no  = :ist_code.item_name
	   AND item_no = :ist_code.item_no
		AND qa      = :ist_code.qa;
	dw_1.object.itemloc_qoh[1] = ld_qoh
	if ist_code.order_qty - ld_qoh < 0 then
		dw_1.object.qty[1] = 1
	else
		if (ist_code.order_qty - ld_qoh) < 1 then
			dw_1.object.qty[1] = 1
		else
			dw_1.object.qty[1] = ist_code.order_qty - ld_qoh
		end if
	end if
end if
dw_1.accepttext()
//dw_1.setfocus()
dw_1.setredraw(true)

pb_save.setfocus()

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whintemp_m
integer x = 2738
integer y = 548
integer width = 389
integer height = 92
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;//
long   ll_seq
string ls_intempno, ls_intempdate
dwItemStatus l_status

dw_1.accepttext()
if dw_1.rowcount() < 1 and dw_1.DeletedCount() < 1 then return

l_status = dw_1.getitemstatus(1, 0, primary!)
if dw_1.deletedcount() > 0 then
	ist_code.chk = "D"
else
	ist_code.chk = "Y"
end if

if l_status = New! or l_status = NewModified! then
	if wf_nullchk(dw_1) = false then return
	
	//SELECT isnull(IDENT_CURRENT ('intemp'), 0) + 1 INTO :ll_seq FROM login WHERE user_id = :gs_userid;
	SELECT isnull(IDENT_CURRENT ('intemp'), 0) + 1 INTO :ll_seq FROM dual;
	
	ls_intempdate = string(dw_1.object.intemp_date[1], 'yyyymmdd')
	ls_intempno   = LeftA(gs_area, 1) + 'T' + ls_intempdate + "-" + RightA( "000" + trim(string(ll_seq)),3)
	
	dw_1.object.intemp_no[1] = ls_intempno
	if dw_1.object.qty[1] = 0 or isnull(dw_1.object.qty[1]) then
		MessageBox("확인","가입고 수량을 입력하십시요")
		dw_1.setcolumn('qty')
		dw_1.setfocus()
		return
	end if
end if

// 재고에서 수량 플러스는 intemp 의 트리거에 존재
if WF_Update1( dw_1, "N" ) = false then
	MessageBox("확인","가입고 재고생성 오류 입니다.")
	RETURN
end if
CloseWithReturn(parent, ist_code)

end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whintemp_m
integer x = 59
integer y = 64
integer width = 3438
integer height = 448
string dataobject = "d_whintemp_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_1::itemchanged;call super::itemchanged;// 저장소변경시
decimal ld_qoh
string  ls_locno, ls_itemno, ls_qa

debugbreak()

this.accepttext( )
choose case dwo.name
	case "loc_no"
		ls_locno  = this.object.loc_no[1]
		ls_itemno = ist_code.item_no
		ls_qa     = ist_code.qa
		
		SELECT qoh INTO :ld_qoh FROM itemloc WHERE loc_no = :ls_locno AND item_no = :ls_itemno AND qa = :ls_qa;
			
		dw_1.object.itemloc_qoh[1] = ld_qoh
		if ist_code.order_qty - ld_qoh < 0 then
			dw_1.object.qty[1] = 1
		else
			if (ist_code.order_qty - ld_qoh) < 1 then
				dw_1.object.qty[1] = 1
			else
				dw_1.object.qty[1] = ist_code.order_qty - ld_qoh
			end if
		end if		
end choose

end event

event dw_1::getfocus;call super::getfocus;//

end event

type st_title from w_inheritance`st_title within w_whintemp_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whintemp_m
end type

type pb_compute from w_inheritance`pb_compute within w_whintemp_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_whintemp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whintemp_m
integer x = 3131
integer y = 548
integer width = 389
integer height = 92
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;ist_code.chk = "N"
closewithreturn(parent, ist_code)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whintemp_m
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_whintemp_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_whintemp_m
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_whintemp_m
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whintemp_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_whintemp_m
boolean visible = false
integer x = 1925
integer y = 724
integer width = 709
integer height = 128
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whintemp_m
integer x = 37
integer y = 16
integer width = 3483
integer height = 516
end type

type gb_1 from w_inheritance`gb_1 within w_whintemp_m
boolean visible = false
end type

type dw_2 from w_inheritance`dw_2 within w_whintemp_m
boolean visible = false
end type

type st_1 from statictext within w_whintemp_m
integer x = 59
integer y = 568
integer width = 2025
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "※ 가입고 사유에 맞는 발생원인을 선택하여 주시기 바랍니다."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_whintemp_m
integer x = 2377
integer y = 548
integer width = 357
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;dw_1.deleterow(1)
end event

