$PBExportHeader$w_mprout_r.srw
$PBExportComments$제품별공정관리(1999/09/10,이인호)
forward
global type w_mprout_r from window
end type
type dw_3 from datawindow within w_mprout_r
end type
type dw_2 from datawindow within w_mprout_r
end type
type cbx_1 from checkbox within w_mprout_r
end type
type st_21 from statictext within w_mprout_r
end type
type sle_1 from singlelineedit within w_mprout_r
end type
type cb_2 from commandbutton within w_mprout_r
end type
type pb_close from picturebutton within w_mprout_r
end type
type pb_save from picturebutton within w_mprout_r
end type
type pb_delete from picturebutton within w_mprout_r
end type
type dw_12 from datawindow within w_mprout_r
end type
type dw_11 from datawindow within w_mprout_r
end type
type cb_1 from commandbutton within w_mprout_r
end type
type pb_5 from picturebutton within w_mprout_r
end type
type pb_4 from picturebutton within w_mprout_r
end type
type pb_3 from picturebutton within w_mprout_r
end type
type dw_1 from datawindow within w_mprout_r
end type
type gb_2 from groupbox within w_mprout_r
end type
type gb_1 from groupbox within w_mprout_r
end type
end forward

global type w_mprout_r from window
integer x = 23
integer y = 628
integer width = 3666
integer height = 1860
boolean titlebar = true
string title = "제품별 공정관리(w_mprout_r)"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean center = true
dw_3 dw_3
dw_2 dw_2
cbx_1 cbx_1
st_21 st_21
sle_1 sle_1
cb_2 cb_2
pb_close pb_close
pb_save pb_save
pb_delete pb_delete
dw_12 dw_12
dw_11 dw_11
cb_1 cb_1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
end type
global w_mprout_r w_mprout_r

type variables
//
datawindowchild idwc_item, idwc_qa
string is_select1
int    il_operation

end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_mprout_r.create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cbx_1=create cbx_1
this.st_21=create st_21
this.sle_1=create sle_1
this.cb_2=create cb_2
this.pb_close=create pb_close
this.pb_save=create pb_save
this.pb_delete=create pb_delete
this.dw_12=create dw_12
this.dw_11=create dw_11
this.cb_1=create cb_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.dw_2,&
this.cbx_1,&
this.st_21,&
this.sle_1,&
this.cb_2,&
this.pb_close,&
this.pb_save,&
this.pb_delete,&
this.dw_12,&
this.dw_11,&
this.cb_1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.dw_1,&
this.gb_2,&
this.gb_1}
end on

on w_mprout_r.destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cbx_1)
destroy(this.st_21)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.pb_close)
destroy(this.pb_save)
destroy(this.pb_delete)
destroy(this.dw_12)
destroy(this.dw_11)
destroy(this.cb_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_11.visible = false
dw_12.visible = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_11.SetTransObject(SQLCA)
dw_12.SetTransObject(SQLCA)

dw_2.getchild("assembly", idwc_item)
//GS_DS_itemall.ShareData(idwc_item)	/*2018.08.01 JOWONSUK 주석  */
idwc_item.settransobject(sqlca)				/*2018.08.01 JOWONSUK 추가  */

idwc_item.setfilter("item_no LIKE 'P%' or item_no LIKE 'M%'")
idwc_item.filter()
idwc_item.setsort("item_no A")
idwc_item.sort()

dw_2.getchild("assy_qa", idwc_qa)
idwc_qa.settransobject(sqlca)
idwc_qa.insertrow(1)

is_select1 = idwc_qa.Describe("DataWindow.Table.Select")


// dw_3 insert는 자동생산계획생성(시화) 에서
end event

type dw_3 from datawindow within w_mprout_r
integer x = 50
integer y = 256
integer width = 1253
integer height = 580
integer taborder = 90
string title = "자동생산계획생성(시화) 미 반영분"
string dataobject = "d_cditemwc_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
long   ll_row, ll_idx
string ls_item, ls_qa

ll_row = this.getrow()
if ll_row < 1 then return

ls_item = this.object.item_no[ll_row]
ls_qa   = this.object.qa1[ll_row]

dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ls_item )

ll_idx = dw_1.Find( "qa1 = '"+ ls_qa + "'", 1, dw_1.rowcount())
dw_1.scrolltorow( ll_idx )
dw_1.setredraw(true)

end event

type dw_2 from datawindow within w_mprout_r
integer x = 50
integer y = 948
integer width = 3566
integer height = 784
integer taborder = 150
string dataobject = "d_cditemwc_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// 규격+작업장
long   ll_row, ll_idx, ll_oper, ll_changed, ll_workper
string ls_workname, ls_clause, ls_where
string ls_data, ls_item, ls_qa
real   lr_cost

DataWindowChild ldwc_work

ll_row = dw_2.getrow()

choose case dwo.name
	case "assembly"
		if idwc_item.rowcount() < 1 then
			MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			setnull(ls_data)
			this.object.assembly[row] = ls_data
			return 1
		end if
		 
		if trim(data) <> trim(idwc_item.getitemstring(idwc_item.getrow(),'item_no')) then
			MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			return 1
		end if
		 
		this.object.item_item_name[row]   = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
		this.object.groupitem_mp_uom[row] = idwc_item.getitemstring(idwc_item.getrow(),'mp_uom')
		
		ls_clause = " where item_no = ~~'" + trim(data) + "~~'" 
		ls_where  = "DataWindow.Table.Select='"  + is_select1 + ls_clause + "'"
		idwc_qa.Modify(ls_where)
		idwc_qa.settransobject(sqlca)

		if idwc_qa.retrieve() = 1 then
			ls_qa = trim(idwc_qa.getitemstring(1,'qa1'))
			this.object.assy_qa[row] = ls_qa
			goto label_qa
		else
			setnull(ls_item)
			this.object.assy_qa[row] = ls_item
		end if

	case "assy_qa"
label_qa:		
		 
	case "wc_no"
		dw_2.getchild('wc_no',ldwc_work)
		ls_workname = trim(ldwc_work.getitemstring(ldwc_work.getrow(),'work_name'))
		ll_workper  = ldwc_work.getitemnumber(ldwc_work.getrow(),'work_per')
		dw_2.setitem(ll_row,'wc_work_name', ls_workname)
		dw_2.setitem(ll_row,'work_per',     ll_workper )
		
	case "operation"
		ll_oper      = dw_2.object.operation[ll_row]
		il_operation = ll_oper
		ll_changed   = integer(data)
		if ll_changed < 1 or ll_changed > dw_2.rowcount() then return 1

		ll_idx = dw_2.Find( "operation =  " + data, 1, dw_2.rowcount() )
		if ll_idx > 0 then
			dw_2.setitem(ll_idx, 'operation', ll_oper)
		end if		
end choose


end event

event itemerror;long   ll_row,  ll_dw2cnt, ll_idx
string ls_data, ls_item

setnull(ls_data)
choose case dwo.name
	case 'assembly'
        this.object.assembly[row] = ls_data
		  
	case 'assy_qa'
		  this.object.assy_qa[row] = ls_data
		  
	case 'operation'
        ll_row    = dw_2.getrow()
        ll_dw2cnt = dw_2.rowcount()
        ll_idx    = dw_2.Find( "operation =  "+ string(ll_dw2cnt) , 1, dw_2.rowcount())
        dw_2.object.operation[ll_idx] = il_operation
        dw_2.object.operation[ll_row] = dw_2.rowcount()		
end choose

return 2

end event

type cbx_1 from checkbox within w_mprout_r
integer x = 96
integer y = 68
integer width = 1056
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "공정이 미생성된 제품전체선택"
end type

event clicked;// 공정이 미생성된 제품전체선택
long ll_row, ll_cnt

if this.checked = true then
	if dw_1.rowcount() < 1 then return
	
	for ll_row = dw_1.rowcount() to 1 step -1
		if isnull(dw_1.object.rout_qa[ll_row]) then
			dw_1.scrolltorow(ll_row)
			dw_1.object.chk[ll_row] = "Y"
		// dw_1.SelectRow(ll_row, true)
		end if
	next
else
	for ll_row = 1 to dw_1.rowcount()
		dw_1.object.chk[ll_row] = "N"
	// dw_1.SelectRow(0, false)
	next
end if

end event

type st_21 from statictext within w_mprout_r
integer x = 78
integer y = 152
integer width = 142
integer height = 68
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "검색"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_mprout_r
integer x = 247
integer y = 140
integer width = 594
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 10
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event modified;// 검색내용
string ls_value

if trim(this.text) = "%" or trim(this.text) = "" or isnull(this.text) then	return

ls_value = trim(sle_1.text) + "%"
dw_1.retrieve( ls_value )

end event

type cb_2 from commandbutton within w_mprout_r
integer x = 654
integer y = 852
integer width = 293
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품조회"
end type

event clicked;// 물품조회
gs_where2 lstr_where

lstr_where.chk = 'S' //M:multi S:single
openwithparm(w_whitemlocqohmulti_w,lstr_where)

end event

type pb_close from picturebutton within w_mprout_r
integer x = 3378
integer y = 68
integer width = 187
integer height = 144
integer taborder = 110
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_save from picturebutton within w_mprout_r
integer x = 3186
integer y = 68
integer width = 187
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_row, ll_cnt, ll_dw4, ll_insertcount, ll_rowcnt, ll_foundrow
string ls_itemno, ls_qa1, ls_setnull, ls_dw4_itemno, ls_dw4_qa

dw_1.accepttext()
dw_2.accepttext()
if dw_2.rowcount() < 1 then return

if wf_update1(dw_2,"Y") = false then
//   messagebox('오류','공정저장에 실패했습니다.',exclamation!)
//else
//	dw_1.object.rout_qa[dw_1.getrow()] = 'AA'
end if



end event

type pb_delete from picturebutton within w_mprout_r
integer x = 2994
integer y = 68
integer width = 187
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
end type

event clicked;long ll_row, ll_rowcount
integer li_chk
string ls_exist, ls_setnull, ls_itemno, ls_qa1

dw_1.Accepttext()
ll_rowcount = dw_1.rowcount()
ls_exist = 'N'
li_chk = messagebox("삭제","선택한 자료를 삭제하시겠습니까 ?",Question!, YesNo!,2)
setnull(ls_setnull)
IF li_chk = 1 THEN 
	for ll_row = 1 to ll_rowcount
		if dw_1.isselected(ll_row) = false then continue
		dw_1.scrolltorow(ll_row)
		dw_1.SelectRow(ll_row, FALSE)
		if dw_2.rowcount() < 1 then return
		ls_exist = 'Y'
		ls_itemno = dw_1.object.item_no[ll_row]
		ls_qa1    = dw_1.object.qa1[ll_row]	
		delete from rout where item_no = :ls_itemno and qa = :ls_qa1;
		if sqlca.sqlcode = 0 then
			commit;
			dw_1.object.rout_qa[ll_row] = ls_setnull
			return
		else
			rollback;
			return
		end if
	next
END IF
if ls_exist = 'N' then
	messagebox("확인", "선택한 자료가 없습니다")
else
	messagebox("확인", "삭제 되었습니다.")
end if


end event

type dw_12 from datawindow within w_mprout_r
integer x = 1445
integer y = 8
integer width = 160
integer height = 88
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_cditemlike_h"
boolean livescroll = true
end type

type dw_11 from datawindow within w_mprout_r
integer x = 1266
integer y = 8
integer width = 160
integer height = 88
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cditemlike_h"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_mprout_r
integer x = 50
integer y = 852
integer width = 293
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "순번정렬"
end type

event clicked;// 순번정렬
string ls_operation
long   ll_row, ll_changed, ll_idx

if dw_2.rowcount() < 1 then return

ll_row     = dw_2.getrow()
ll_changed = dw_2.object.operation[ll_row]

ls_operation = "operation A"
dw_2.SetSort(ls_operation)
dw_2.Sort()

ll_idx = dw_2.Find( "operation =  "+ string(ll_changed) , 1, dw_2.rowcount())	
dw_2.scrolltorow( ll_idx )

end event

type pb_5 from picturebutton within w_mprout_r
integer x = 357
integer y = 852
integer width = 279
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "공정생성"
vtextalign vtextalign = vcenter!
end type

event clicked;// 공정생성
string  ls_qa, ls_routqa, ls_item, ls_qa1, ls_assy, ls_assyqa, ls_wc, ls_temp, ls_errtext
long    ll_rowcount, i, j, ll_found
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq

cb_1.triggerevent(clicked!)		// 순번정렬

ll_rowcount = dw_2.rowcount()
ll_rowcount --
if ll_rowcount < 1 then RETURN

for i = ll_rowcount to 1
  	ls_item = trim(dw_2.object.assembly[i])
	ls_qa   = trim(dw_2.object.assy_qa[i])	
	for j = i to 1
	   ls_assy   = trim(dw_2.object.assembly[j])
	   ls_assyqa = trim(dw_2.object.assy_qa[j])
	   ls_wc     = trim(dw_2.object.wc_no[j])
	   li_seq    = dw_2.object.operation[j]
	   lr_setup  = dw_2.object.setup_time[j]
	   lr_run    = dw_2.object.run_time[j]
	   lr_qpa    = dw_2.object.qpa[j]
	   lr_work   = dw_2.object.work_per[j]
		
		SELECT item_no INTO :ls_temp FROM rout WHERE item_no = :ls_item AND qa = :ls_qa;
		if sqlca.sqlcode = 0 then EXIT
			
	   INSERT INTO rout (item_no, qa, operation, concurrent, wc_no, rout_desc, setup_time, queue_time
		                , run_time, delivery_time, assembly, assy_qa, bom_no, qpa, work_per)
	   VALUES ( :ls_item, :ls_qa, :li_seq, null, :ls_wc, null, :lr_setup, 0, :lr_run, 0, :ls_assy, :ls_assyqa, 0
		       , :lr_qpa ,:lr_work );
	   if sqlca.sqlcode < 0 then
			ls_errtext  = sqlca.sqlerrtext
			ROLLBACK;
	      MessageBox('오류','ROUT TABLE에 INSERT 오류가 발생했습니다.',exclamation!)
		   RETURN
	   end if
	next
	
	ll_found = dw_1.Find( "item_no = '" + ls_item + "' and qa1 = '" + ls_qa + "'", 1, dw_1.RowCount())
   if ll_found > 0 then
      dw_1.object.rout_qa[ll_found] = 'XX'
	end if
next
//commit;
//messagebox('확인','완료되었습니다.')

end event

type pb_4 from picturebutton within w_mprout_r
integer x = 2062
integer y = 68
integer width = 562
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "코드,공정 생성"
vtextalign vtextalign = vcenter!
end type

event clicked;// 코드,공정 생성
string  ls_qa, ls_item, ls_qa1, ls_assy, ls_uom, ls_source, ls_qalike, ls_itemname, ls_temp, ls_errtext
long    ll_rowcount, i, ll_found, ll_rowcount1, k, ll_cnt, ll_dw1row
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq

dw_1.accepttext()
dw_2.accepttext()

for ll_dw1row = 1 to dw_1.rowcount()		// 품목+규격
	if dw_1.isselected(ll_dw1row) = false then CONTINUE
	if dw_1.object.chk[ll_dw1row] = "N"   then CONTINUE
	 
	dw_1.scrolltorow(ll_dw1row)
	
	ls_item   = trim(dw_1.object.item_no[ll_dw1row])
	ls_qalike = trim(dw_1.object.qa1[ll_dw1row])
	
	dw_2.retrieve( ls_item, ls_qalike )		// 규격+작업장
	
	ls_qalike   = MidA(ls_qalike,1,14) + '%'
	ll_rowcount = dw_11.retrieve( ls_item, ls_qalike )			// 완제품
	
	cb_1.triggerevent( clicked! )	// 순번정렬
	
	ll_cnt = dw_2.rowcount()
	ll_cnt --
	for k = 1 to ll_cnt
		ls_assy = trim(dw_2.object.assembly[k])
		SELECT item_name, uom, source INTO :ls_itemname, :ls_uom, :ls_source 
		  FROM groupitem 
		 WHERE item_no    = :ls_assy;
			 
		ll_rowcount1 = dw_12.retrieve( ls_assy, ls_qalike )	// 반제품
		for i = 1 to ll_rowcount
			ls_qa    = trim(dw_11.object.qa[i])
			ls_qa1   = MidA(ls_qa,1,14) + '00000'
			
			ll_found = dw_12.Find( "qa = '" + ls_qa + "'",1,ll_rowcount1) 
			if ll_found < 1 then
				INSERT INTO item (item_no, qa, loc_no, item_name, uom, source, leadtime, count_code, qoh, sales_reserved,
				       prodn_reserved, pur_reserved, reorder, safety_stock, lot, obsolete_code, scrap_qty,
					    price_a, price_b, price_c, std_setup, std_material, std_labor, std_burden, std_subcontract,
					    std_machine, month_qty, safety_day, qa1, use_flag)
				VALUES (:ls_assy, :ls_qa, 'WS00000000', :ls_itemname, :ls_uom, :ls_source, 0, 'M', 0, 0,
				        0, 0, 0, 0, 0, 'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, :ls_qa1, 'Y');
				if sqlca.sqlcode < 0 then
					ls_errtext  = sqlca.sqlerrtext
					ROLLBACK;
					MessageBox('오류','물품코드 저장중 오류가 발생하였습니다.',exclamation!)
					RETURN
				end if
					
				SELECT item_no INTO :ls_temp FROM itempattern WHERE item_no = :ls_assy AND qa1 = :ls_qa1;
				if sqlca.sqlcode = 100 then
					INSERT INTO itempattern ( item_no, qa1 ) VALUES ( :ls_assy, :ls_qa1 );
					if sqlca.sqlcode < 0 then
						ls_errtext  = sqlca.sqlerrtext
						ROLLBACK;
						MessageBox('오류','물품코드 저장중 오류가 발생하였습니다.',exclamation!)
						RETURN
					end if	
				end if
			else
				// ITEM 존재하면 SKIP
			end if
		next
	next
		
	pb_5.triggerevent( clicked! )		// 공정생성
	COMMIT;
next

dw_1.retrieve( ls_item + '%' )
MessageBox('확인','코드,공정생성이 완료되었습니다.')

end event

type pb_3 from picturebutton within w_mprout_r
integer x = 2629
integer y = 68
integer width = 334
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "일괄처리"
vtextalign vtextalign = vcenter!
end type

event clicked;// 일괄처리
string  ls_qa, ls_routqa, ls_item, ls_qa1, ls_assy, ls_wc, ls_errtext
long    ll_dw1row, ll_dw2row
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "O", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================

dw_1.accepttext()
dw_2.accepttext()

for ll_dw1row = 1 to dw_1.rowcount()
	if dw_1.object.chk[ll_dw1row] = "N"   then CONTINUE		// 미선택
	
	if isnull(dw_1.object.rout_qa[ll_dw1row]) then
	else
		CONTINUE
	end if
	 
	ls_qa1 = trim(dw_1.object.qa1[ll_dw1row])
	
	for ll_dw2row = 1 to dw_2.rowcount()
		ls_item  = trim(dw_2.object.item_no[ll_dw2row])
		ls_assy  = trim(dw_2.object.assembly[ll_dw2row])
		ls_wc    = trim(dw_2.object.wc_no[ll_dw2row])
		li_seq   = dw_2.object.operation[ll_dw2row]
		lr_setup = dw_2.object.setup_time[ll_dw2row]
		lr_run   = dw_2.object.run_time[ll_dw2row]
		lr_qpa   = dw_2.object.qpa[ll_dw2row]
		 
		INSERT INTO rout ( item_no, qa, operation, concurrent, wc_no, setup_time, queue_time
                       , run_time, delivery_time, assembly, assy_qa, bom_no, qpa )
		VALUES (:ls_item, :ls_qa1, :li_seq, 'N', :ls_wc, :lr_setup, 0, :lr_run, 0, :ls_assy, :ls_qa1, 0, :lr_qpa);
		if sqlca.sqlcode < 0 then
			ls_errtext  = sqlca.sqlerrtext
			ROLLBACK;
			MessageBox("오류", ls_errtext, exclamation!)
			RETURN
		end if
	next
	COMMIT;
	 
	dw_1.object.rout_qa[ll_dw1row] = "XX"
next

//
for ll_dw1row = 1 to dw_1.rowcount()
	dw_1.object.chk[ll_dw1row] = "N"
next
MessageBox("확인","일괄처리가 완료되었습니다.")

pb_4.triggerevent( clicked! )		// 코드,공정 생성


end event

type dw_1 from datawindow within w_mprout_r
integer x = 1312
integer y = 256
integer width = 2286
integer height = 580
integer taborder = 20
string title = "품목+규격(길이=00000)"
string dataobject = "d_cditemwc_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;// 선택하기

if row < 1 or this.rowcount() < 1 then return

this.object.chk[row] = "Y"
//this.SelectRow( row, NOT this.IsSelected(row) )
end event

event rowfocuschanged;//
long   ll_row
string ls_item, ls_qa

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_item = this.object.item_no[ll_row]
ls_qa   = this.object.qa1[ll_row]

dw_2.retrieve( ls_item, ls_qa )

end event

type gb_2 from groupbox within w_mprout_r
integer x = 50
integer y = 20
integer width = 1861
integer height = 220
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_mprout_r
integer x = 1929
integer y = 20
integer width = 1669
integer height = 220
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

