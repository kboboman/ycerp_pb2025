$PBExportHeader$w_cditemwc_m.srw
$PBExportComments$제품별공정관리(98/03/05,이인호)
forward
global type w_cditemwc_m from w_inheritance
end type
type gb_5 from gb_3 within w_cditemwc_m
end type
type cb_1 from commandbutton within w_cditemwc_m
end type
type dw_4 from datawindow within w_cditemwc_m
end type
type dw_8 from datawindow within w_cditemwc_m
end type
type dw_9 from datawindow within w_cditemwc_m
end type
type gb_4 from groupbox within w_cditemwc_m
end type
type tv_1 from treeview within w_cditemwc_m
end type
type dw_5 from datawindow within w_cditemwc_m
end type
type pb_1 from picturebutton within w_cditemwc_m
end type
type pb_2 from picturebutton within w_cditemwc_m
end type
type dw_10 from datawindow within w_cditemwc_m
end type
type pb_3 from picturebutton within w_cditemwc_m
end type
type pb_4 from picturebutton within w_cditemwc_m
end type
type dw_11 from datawindow within w_cditemwc_m
end type
type dw_12 from datawindow within w_cditemwc_m
end type
type pb_5 from picturebutton within w_cditemwc_m
end type
type sle_1 from singlelineedit within w_cditemwc_m
end type
type cbx_1 from checkbox within w_cditemwc_m
end type
type dw_6 from datawindow within w_cditemwc_m
end type
type sle_2 from singlelineedit within w_cditemwc_m
end type
type cb_2 from commandbutton within w_cditemwc_m
end type
type st_work from statictext within w_cditemwc_m
end type
type dw_3 from datawindow within w_cditemwc_m
end type
type rb_1 from radiobutton within w_cditemwc_m
end type
type rb_2 from radiobutton within w_cditemwc_m
end type
type rb_3 from radiobutton within w_cditemwc_m
end type
type rb_4 from radiobutton within w_cditemwc_m
end type
type cb_3 from commandbutton within w_cditemwc_m
end type
type cb_4 from commandbutton within w_cditemwc_m
end type
type cb_5 from commandbutton within w_cditemwc_m
end type
type pb_6 from picturebutton within w_cditemwc_m
end type
type st_2 from statictext within w_cditemwc_m
end type
type cbx_2 from checkbox within w_cditemwc_m
end type
type st_3 from statictext within w_cditemwc_m
end type
type pb_7 from picturebutton within w_cditemwc_m
end type
type gb_6 from groupbox within w_cditemwc_m
end type
end forward

global type w_cditemwc_m from w_inheritance
integer width = 5161
integer height = 2524
string title = "제품별 공정관리(w_cditemwc_m)"
long backcolor = 78160032
gb_5 gb_5
cb_1 cb_1
dw_4 dw_4
dw_8 dw_8
dw_9 dw_9
gb_4 gb_4
tv_1 tv_1
dw_5 dw_5
pb_1 pb_1
pb_2 pb_2
dw_10 dw_10
pb_3 pb_3
pb_4 pb_4
dw_11 dw_11
dw_12 dw_12
pb_5 pb_5
sle_1 sle_1
cbx_1 cbx_1
dw_6 dw_6
sle_2 sle_2
cb_2 cb_2
st_work st_work
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
pb_6 pb_6
st_2 st_2
cbx_2 cbx_2
st_3 st_3
pb_7 pb_7
gb_6 gb_6
end type
global w_cditemwc_m w_cditemwc_m

type variables
st_print i_print
datawindowchild idwc_item, idwc_qa, idwc_qa1, idwc_wc

string is_select, is_select1, is_select2, is_where, is_where1
string is_where2, is_clause, is_clause1, is_clause2
string is_dw1sql, is_itemno, is_qa1, is_col
long   il_operation


end variables

forward prototypes
public function boolean wf_makebomtran (string as_itemno, string as_qa)
public function boolean wf_makeonelabelbom (string arg_itemno, string arg_qa)
end prototypes

public function boolean wf_makebomtran (string as_itemno, string as_qa);// picture를 3개 지정해야함.
String ls_item_no,ls_qa, ls_component, ls_component_qa, ls_comp, ls_comp_qa, ls_assy, ls_assy_qa
string ls_item_name
Decimal{4} ld_qpa, ld_yield, ld_parent_qpa
Date ldt_effectivity, ldt_obsolete
Int i, j, li_seq, li_bom_no
long li_NewRow, li_count, ll_row, ll_foundrow

dw_4.rowsmove(1,dw_4.rowcount(),Primary!,dw_4,1,Delete!)
dw_4.InsertRow(0)
dw_4.Object.item_no[ 1 ] = as_itemno
dw_4.Object.qa[ 1 ] = as_qa
dw_4.Object.assembly[ 1 ] = as_itemno
dw_4.Object.assy_qa[ 1 ] = as_qa
dw_4.Object.parent_no[ 1 ] = 0
dw_4.Object.component[ 1 ] = as_itemno
dw_4.Object.comp_qa[ 1 ] = as_qa
dw_4.Object.item_item_name[ 1 ] = dw_1.object.item_name[dw_1.getrow()]
dw_4.Object.sequence[ 1 ] = 1
dw_4.Object.qpa[ 1 ] = 1
dw_4.Object.yield[ 1 ] = 1
dw_4.Object.bom_no[ 1 ] = 1
dw_4.Object.dirty_flag[ 1 ] = ''
ld_parent_qpa = 1
FOR j = 1 To dw_4.RowCount()
	ls_item_no = dw_4.Object.item_no[ j ]
	ls_qa = dw_4.Object.qa[ j ]
	ls_component = dw_4.Object.component[ j ]
	ls_component_qa= dw_4.Object.comp_qa[ j ]
	li_bom_no = j
	li_count = dw_5.retrieve(ls_component,ls_component_qa)
	IF li_count > 0 THEN
		FOR i = 1 TO li_count
			li_bom_no++
			ls_assy = dw_5.object.assembly[i]
			ls_assy_qa = dw_5.object.assembly_qa[i]
			ls_comp = dw_5.object.component[i]
			ls_comp_qa = dw_5.object.component_qa[i]
			li_seq = dw_5.object.sequence[i]
			ls_item_name = dw_5.object.item_item_name[i]
			
			ll_foundrow = dw_4.Find( "component = '"+ ls_assy +"' and " + "comp_qa = '" + ls_assy_qa + "'", 1, dw_4.rowcount())

			ld_qpa = dw_5.object.qpa[i] * dw_4.object.qpa[ll_foundrow]
			ldt_effectivity = date(dw_5.object.effectivity[i])
			ldt_obsolete = date(dw_5.object.obsolete[i])
			ld_yield = dw_5.object.yield[i]
			IF li_bom_no = 2 then
				li_NewRow = dw_4.InsertRow( 0 )
			ELSE
				li_NewRow = dw_4.InsertRow( li_bom_no )
			END IF
			dw_4.Object.item_no[ li_NewRow ] = ls_item_no
			dw_4.Object.qa[ li_NewRow ] = ls_qa
			
			dw_4.Object.assembly[ li_NewRow ] = ls_component
			dw_4.Object.assy_qa[ li_NewRow ] = ls_component_qa
			
			dw_4.Object.parent_no[ li_NewRow ] = j
			
			dw_4.Object.component[ li_NewRow ] = ls_comp
			dw_4.Object.comp_qa[ li_NewRow ] = ls_comp_qa
			dw_4.Object.item_item_name[ li_NewRow ] = ls_item_name
			
			dw_4.Object.sequence[ li_NewRow ] = li_seq
			dw_4.Object.qpa[ li_NewRow ] = ld_qpa
			dw_4.Object.effectivity[ li_NewRow ] = ldt_effectivity
			dw_4.Object.obsolete[ li_NewRow ] = ldt_obsolete
			dw_4.Object.yield[ li_NewRow ] = ld_yield
			dw_4.Object.bom_no[ li_NewRow ] = li_bom_no
			dw_4.Object.dirty_flag[ li_NewRow ] = ''
		NEXT
	END IF
	dw_4.Object.bom_no[ j ] = j
NEXT

if wf_update1(dw_4,"N") = FALSE then
	RETURN( FALSE )
END IF

RETURN( TRUE )
end function

public function boolean wf_makeonelabelbom (string arg_itemno, string arg_qa);// BOM 구성도 TREEVIEW 만들기
//
// picture를 3개 지정해야함.
// 1 = 완제품 icon
// 2 = 반제품 icon
// 3 = 자재 icon

TreeViewItem ltv_Item
int  lh_Item, ll_row
long ll_curhandle

ltv_Item.PictureIndex         = 1
ltv_Item.SelectedPictureIndex = 1
ltv_Item.Label                = arg_ItemNo + " " + arg_qa

tv_1.DeleteItem(0)
lh_Item = tv_1.InsertItemSort( 0, ltv_Item )

if dw_8.rowcount() < 1 then RETURN( false )


for ll_row = 1 to dw_8.rowcount()
	if dw_8.object.item_source[ll_row] = "M" then
		ltv_Item.PictureIndex = 2
		ltv_Item.SelectedPictureIndex = 2
	else
		ltv_Item.PictureIndex = 3
		ltv_Item.SelectedPictureIndex = 3
	end if
	
	ltv_Item.Label = dw_8.object.component[ll_row] + " " + dw_8.object.component_qa[ll_row]
	ll_curhandle   = tv_1.InsertItemlast( lh_Item, ltv_Item )
	tv_1.ExpandAll( lh_Item )
next

RETURN( true )
end function

on w_cditemwc_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.cb_1=create cb_1
this.dw_4=create dw_4
this.dw_8=create dw_8
this.dw_9=create dw_9
this.gb_4=create gb_4
this.tv_1=create tv_1
this.dw_5=create dw_5
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_10=create dw_10
this.pb_3=create pb_3
this.pb_4=create pb_4
this.dw_11=create dw_11
this.dw_12=create dw_12
this.pb_5=create pb_5
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.dw_6=create dw_6
this.sle_2=create sle_2
this.cb_2=create cb_2
this.st_work=create st_work
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.pb_6=create pb_6
this.st_2=create st_2
this.cbx_2=create cbx_2
this.st_3=create st_3
this.pb_7=create pb_7
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_8
this.Control[iCurrent+5]=this.dw_9
this.Control[iCurrent+6]=this.gb_4
this.Control[iCurrent+7]=this.tv_1
this.Control[iCurrent+8]=this.dw_5
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.pb_2
this.Control[iCurrent+11]=this.dw_10
this.Control[iCurrent+12]=this.pb_3
this.Control[iCurrent+13]=this.pb_4
this.Control[iCurrent+14]=this.dw_11
this.Control[iCurrent+15]=this.dw_12
this.Control[iCurrent+16]=this.pb_5
this.Control[iCurrent+17]=this.sle_1
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.dw_6
this.Control[iCurrent+20]=this.sle_2
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.st_work
this.Control[iCurrent+23]=this.dw_3
this.Control[iCurrent+24]=this.rb_1
this.Control[iCurrent+25]=this.rb_2
this.Control[iCurrent+26]=this.rb_3
this.Control[iCurrent+27]=this.rb_4
this.Control[iCurrent+28]=this.cb_3
this.Control[iCurrent+29]=this.cb_4
this.Control[iCurrent+30]=this.cb_5
this.Control[iCurrent+31]=this.pb_6
this.Control[iCurrent+32]=this.st_2
this.Control[iCurrent+33]=this.cbx_2
this.Control[iCurrent+34]=this.st_3
this.Control[iCurrent+35]=this.pb_7
this.Control[iCurrent+36]=this.gb_6
end on

on w_cditemwc_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.cb_1)
destroy(this.dw_4)
destroy(this.dw_8)
destroy(this.dw_9)
destroy(this.gb_4)
destroy(this.tv_1)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_10)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.dw_11)
destroy(this.dw_12)
destroy(this.pb_5)
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.dw_6)
destroy(this.sle_2)
destroy(this.cb_2)
destroy(this.st_work)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.pb_6)
destroy(this.st_2)
destroy(this.cbx_2)
destroy(this.st_3)
destroy(this.pb_7)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_6.SetTransObject(SQLCA)
dw_8.SetTransObject(SQLCA)
dw_9.SetTransObject(SQLCA)
dw_10.SetTransObject(SQLCA)
dw_11.SetTransObject(SQLCA)
dw_12.SetTransObject(SQLCA)

pb_5.enabled  = false		// 공정생성
dw_3.visible  = false		// 프린트
dw_4.visible  = false		// B.O.M(bomtran)
dw_5.visible  = false		// 구성품(BOM)
dw_8.visible  = false		// 구성품
dw_9.visible  = false
dw_10.visible = false
dw_11.visible = false
dw_12.visible = false
//dw_1.retrieve('P%')

dw_2.getchild('assembly',idwc_item)
gs_ds_itemall.ShareData(idwc_item)
//idwc_item.settransobject(sqlca)
//is_select = idwc_item.Describe("DataWindow.Table.Select")
//is_clause = " where item_no like ~~'P%~~' " &
//			 +	"   or item_no like ~~'M%~~' " &
//          + " order by item_no asc"   
//is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
//idwc_item.Modify(is_where)
//idwc_item.settransobject(sqlca)
//idwc_item.retrieve()
idwc_item.setfilter("item_no LIKE 'P%' or item_no LIKE 'M%'")
idwc_item.filter()
idwc_item.setsort("item_no A")
idwc_item.sort()

dw_2.getchild('assy_qa',idwc_qa)
idwc_qa.settransobject(sqlca)
idwc_qa.insertrow(1)
is_select1 = idwc_qa.Describe("DataWindow.Table.Select")
is_dw1sql  = dw_3.describe("datawindow.table.select")

dw_6.retrieve()		// 품목그룹

end event

event resize;call super::resize;
// 품목그룹
gb_5.height = newheight - 360
dw_6.height = newheight - 556

// 품목+규격
gb_2.width  = newwidth  - 2698
gb_2.height = newheight - 1192
dw_1.width  = newwidth  - 2752
dw_1.height = newheight - 1384

// BOM조회
gb_4.x      = gb_2.x + gb_2.width + 10
gb_4.height = newheight - 1192
cbx_1.x     = gb_4.x    + 32
tv_1.x      = gb_4.x    + 27
tv_1.height = newheight - 1384

// 규격+작업장
gb_3.y      = gb_2.y + gb_2.height + 20
gb_3.width  = newwidth  - 1518

cb_1.y      = gb_3.y    + 72		// 순번정렬
pb_insert.y = gb_3.y    + 56		// 규격+작업장 추가
pb_5.y      = gb_3.y    + 56		// 공정저장
st_work.y   = gb_3.y    + 112		// INFO

dw_2.y      = gb_3.y    + 168
dw_2.width  = newwidth  - 1587

end event

type pb_save from w_inheritance`pb_save within w_cditemwc_m
integer x = 4635
integer y = 56
integer taborder = 90
end type

event pb_save::clicked;long   ll_row, ll_cnt, ll_operation
string ls_wcno, ls_useyn, ls_itemno, ls_qa, ls_assembly

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
dw_2.accepttext()

if dw_2.rowcount() < 1  then return
if Not wf_nullchk(dw_2) then return

// 공정체크 
for ll_row = 1 to dw_2.rowcount()
	ls_itemno    = dw_2.object.item_no[ll_row]
	ls_qa        = dw_2.object.qa[ll_row]
	ls_wcno      = dw_2.object.wc_no[ll_row]
	ll_operation = dw_2.object.operation[ll_row]
	ls_assembly  = dw_2.object.assembly[ll_row]
	
	// 사용불가 작업장
	SELECT use_yn INTO :ls_useyn FROM WC WHERE work_no = :ls_wcno;
	if ls_useyn = "N" then
		MessageBox("오류", string(ll_row) + "번 사용불가 작업장을 선택 했습니다.", exclamation!)
		return
	end if
	
	// 중복공정
	SELECT count(*) INTO :ll_cnt FROM rout 
	 WHERE item_no = :ls_itemno AND qa = :ls_qa AND wc_no = :ls_wcno;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 공정입니다.",exclamation!)
		return
	end if

	// 중복품목
	SELECT count(*) INTO :ll_cnt FROM rout
	 WHERE item_no = :ls_itemno AND qa = :ls_qa AND assembly = :ls_assembly;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 품목입니다.",exclamation!)
		return
	end if
next

if wf_update1(dw_2,"Y") = false then
   MessageBox('오류','공정저장에 실패했습니다.',exclamation!)
else
	dw_1.object.rout_qa[dw_1.getrow()] = 'AA'
end if



end event

type dw_1 from w_inheritance`dw_1 within w_cditemwc_m
integer x = 1472
integer y = 448
integer width = 2373
integer height = 1036
integer taborder = 180
string dataobject = "d_cditemwc_s"
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long    ll_row,   ll_idx
integer li_count, li_chk

ll_row = dw_1.getrow()
if ll_row < 1 then return

dw_2.Accepttext()		// 규격+작업장

li_count = wf_modifycount( dw_2 )
if li_count > 0 then
   if MessageBox("확인", "변경된 내역을 저장하시겠습니까 ?", Question!, YesNo!, 1) = 1 then 
		if Not wf_nullchk(dw_2) then
			Message.ReturnValue = 1
		else
			if wf_update1(dw_2,"Y") then
			else
				MessageBox("확인", "규격+작업장 저장 오류 입니다.")
			end if
			
			ll_idx = dw_1.Find( "item_no = '"+ is_itemno +"' and " + "qa1 = '" + is_qa1 + "'", 1, this.rowcount())
			dw_1.object.rout_qa[ll_idx] = "XX"
		end if
   end if
end if

is_itemno = this.object.item_no[ll_row]
is_qa1    = this.object.qa1[ll_row]
dw_2.retrieve( is_itemno, is_qa1 )		// 규격+작업장

if cbx_1.checked = true then		// BOM조회
	dw_4.retrieve( is_itemno, is_qa1 )			// BOMTRAN
	dw_8.retrieve( is_itemno, is_qa1 )			// BOM
	wf_makeonelabelbom( is_itemno, is_qa1 )	// BOM 구성도 TREEVIEW 만들기
end if

// 순번정렬
cb_1.triggerevent( clicked! )
dw_1.setfocus()

end event

event dw_1::doubleclicked;// 선택
if this.getrow() < 1 then return

this.object.chk[row] = "Y"
//this.SelectRow( row, NOT this.IsSelected(row) )

end event

event dw_1::clicked;call super::clicked;//
this.scrolltorow( row )
sle_1.text = this.object.item_no[row]
sle_2.text = this.object.item_item_name[row]
//pb_retrieve.postevent(clicked!)
end event

type dw_2 from w_inheritance`dw_2 within w_cditemwc_m
integer x = 1472
integer y = 1696
integer width = 3538
integer height = 612
integer taborder = 220
string dataobject = "d_cditemwc_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;long ll_row, ll_foundrow, ll_oper, ll_changed, ll_workper
string ls_workname
string ls_data,ls_item,ls_qa,ls_supp, ls_muom
real lr_cost

datawindowchild ldwc_work

ll_row = dw_2.getrow()


choose case dwo.name
	case 'assembly'
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
		 this.object.item_item_name[row] = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
		 select mp_uom into :ls_muom from groupitem
        where item_no = :data;
		 this.object.groupitem_mp_uom[row] = ls_muom
//		 this.object.groupitem_mp_uom[row] = idwc_item.getitemstring(idwc_item.getrow(),'mp_uom')
		 is_clause = " and groupitem.item_no = ~~'" + trim(data) + "~~'" 
       is_where = "DataWindow.Table.Select='"  + is_select1 + is_clause + "'"
       idwc_qa.Modify(is_where)
		 idwc_qa.settransobject(sqlca)
		  if idwc_qa.retrieve() = 1 then
			  ls_qa = trim(idwc_qa.getitemstring(1,'qa1'))
			  this.object.assy_qa[row] = ls_qa
			  goto label_qa
	     else
			  setnull(ls_item)
			  this.object.assy_qa[row] = ls_item
		  end if
	case 'assy_qa'
label_qa:		
		 
	case 'wc_no'
		dw_2.getchild('wc_no',ldwc_work)
		ls_workname = trim(ldwc_work.getitemstring(ldwc_work.getrow(),'work_name'))
		ll_workper = ldwc_work.getitemnumber(ldwc_work.getrow(),'work_per')
		dw_2.setitem(ll_row,'wc_work_name',ls_workname)
		dw_2.setitem(ll_row,'work_per',ll_workper)
	case 'operation'
		ll_oper = dw_2.object.operation[ll_row]
		il_operation = ll_oper
		ll_changed = integer(data)
		if ll_changed < 1 or ll_changed > dw_2.rowcount() then
			return 1
		else
			ll_foundrow = dw_2.Find( "operation =  "+ data , 1, dw_2.rowcount())
		end if
		if ll_foundrow > 0 then
			dw_2.setitem(ll_foundrow, 'operation', ll_oper)
		end if
		
end choose


end event

event dw_2::itemerror;long ll_row, ll_row1, ll_foundrow
string ls_data,ls_item

setnull(ls_data)
choose case dwo.name
	case 'assembly'
        this.object.assembly[row] = ls_data
	case 'assy_qa'
		  this.object.assy_qa[row] = ls_data
	case 'operation'
        ll_row = dw_2.getrow()
        ll_row1 = dw_2.rowcount()
        ll_foundrow = dw_2.Find( "operation =  "+ string(ll_row1) , 1, dw_2.rowcount())
        dw_2.object.operation[ll_foundrow] = il_operation
        dw_2.object.operation[ll_row] = dw_2.rowcount()		
end choose

return 2
end event

event dw_2::rowfocuschanged;long ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row <= 0 then
	return
end if
if trim(this.object.assembly[ll_row]) =''  or isnull(this.object.assembly[ll_row]) then
	return
end if
is_clause = " and groupitem.item_no = ~~'" + trim(this.object.assembly[ll_row]) + "~~'" 
is_where = "DataWindow.Table.Select='"  + is_select1 + is_clause + "'"
idwc_qa.Modify(is_where)
idwc_qa.settransobject(sqlca)
idwc_qa.retrieve()




end event

type st_title from w_inheritance`st_title within w_cditemwc_m
integer x = 37
integer y = 84
integer width = 1129
boolean enabled = true
string text = "제품별 공정관리"
end type

type st_tips from w_inheritance`st_tips within w_cditemwc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemwc_m
boolean visible = false
integer taborder = 250
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemwc_m
boolean visible = false
integer taborder = 230
end type

type pb_close from w_inheritance`pb_close within w_cditemwc_m
integer x = 4827
integer y = 56
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemwc_m
integer x = 4443
integer y = 56
integer taborder = 80
end type

event pb_print::clicked;gs_itemselect_str lstr_print
w_repsuper w_print
string ls_sql, ls_where, ls_source

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_where = " and item.item_no = rout.item_no " &
			+ " and item.qa1 = rout.qa " &
         + " ORDER BY item.item_no ASC,item.qa ASC, rout.operation " 
ls_sql = "datawindow.table.select='" + is_dw1sql + ls_where + "'"	

dw_3.modify(ls_sql)
dw_3.retrieve()

i_print.st_datawindow  = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 제품별 표준작업을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=75'
opensheetwithparm(w_print, i_print, parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemwc_m
integer x = 1733
integer y = 336
integer width = 320
integer height = 84
integer taborder = 260
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "품목조회"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = top!
end type

event pb_cancel::mousemove;//
end event

event pb_cancel::clicked;gs_where2 lstr_where

lstr_where.chk = "S"
openwithparm(w_whitemselectmulti_w, lstr_where)

lstr_where = Message.PowerObjectParm

if lstr_where.chk = "Y" then
	sle_1.text = trim(lstr_where.str1[1])
	pb_retrieve.postevent(clicked!)
end if
end event

type pb_delete from w_inheritance`pb_delete within w_cditemwc_m
integer x = 4251
integer y = 56
integer taborder = 20
end type

event pb_delete::clicked;//
long    ll_row, ll_rowcnt
integer li_chk
string  ls_exist, ls_setnull, ls_itemno, ls_itemnm, ls_qa1

dw_1.Accepttext()

setnull(ls_setnull)
ll_rowcnt = dw_1.rowcount()

ll_row    = dw_1.getrow()
ls_itemno = dw_1.object.item_no[ll_row]
ls_itemnm = dw_1.object.item_item_name[ll_row]
ls_qa1    = dw_1.object.qa1[ll_row]	

li_chk = MessageBox("확인","품명 : [" + ls_itemnm + "]~n규격 : [" + ls_qa1 + "]~n~n" + &
                    "선택한 자료를 삭제 하시겠습니까 ?",Question!, YesNo!,2)
if li_chk = 1 then
	DELETE FROM rout WHERE item_no = :ls_itemno AND qa = :ls_qa1;
	if sqlca.sqlcode = 0 then
		dw_1.object.rout_qa[ll_row] = ls_setnull
		MessageBox("확인", "삭제 되었습니다.")
		commit;
	else
		MessageBox("확인", "선택한 자료가 없습니다")
		rollback;
	end if
	
	dw_2.retrieve( ls_itemno, ls_qa1 )		// 규격+작업장	
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cditemwc_m
integer x = 1769
integer y = 1584
integer width = 151
integer height = 108
integer taborder = 10
end type

event pb_insert::clicked;//
gs_itemwc_str lstr_select
long ll_cnt, ll_row, ll_count

//if dw_2.rowcount() > 0 then
//	messagebox("확인","이미 공정이 있습니다! 삭제후 추가하십시요!",StopSign!)
//   return
//end if

openwithparm(w_whitemwc_w,lstr_select)
lstr_select = message.powerobjectparm

if lstr_select.str_ok = FALSE then return

ll_count = dw_1.getrow()
for ll_cnt = 1 to lstr_select.str_insert_count
	ll_row = dw_2.insertrow(0)
	dw_2.object.item_no[ll_row]    = is_itemno
	dw_2.object.qa[ll_row]         = is_qa1
	dw_2.object.operation[ll_row]  = ll_row
	dw_2.object.concurrent[ll_row] = " "
	dw_2.object.assembly[ll_row]   = is_itemno
	dw_2.object.assy_qa[ll_row]    = is_qa1
	dw_2.object.bom_no[ll_row]     = 0
	dw_2.object.qpa[ll_row]        = 1
	dw_2.Object.item_item_name[ ll_row ] = dw_1.object.item_item_name[ll_count]
next

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemwc_m
integer x = 4050
integer y = 56
integer taborder = 270
end type

event pb_retrieve::clicked;call super::clicked;string ls_str, ls_filter
long   ll_row

if trim(sle_1.text) = "" or isnull(sle_1.text) then
   MessageBox("확인", "공정관리할 품목을 선택 하시기 바랍니다.")
	return
else
	ls_str = trim(sle_1.text) + '%'
end if

ll_row = dw_1.retrieve(ls_str)
if ll_row > 0 then
	dw_1.scrolltorow(1)
	dw_1.triggerevent( rowfocuschanged! )
end if

sle_2.setfocus()

end event

type gb_3 from w_inheritance`gb_3 within w_cditemwc_m
integer x = 1445
integer y = 1528
integer width = 3607
integer height = 812
integer taborder = 0
integer textsize = -10
long textcolor = 255
string text = "규격+작업장"
end type

type gb_2 from w_inheritance`gb_2 within w_cditemwc_m
integer x = 1445
integer y = 280
integer width = 2427
integer height = 1228
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
string text = "품목+규격"
end type

type gb_1 from w_inheritance`gb_1 within w_cditemwc_m
integer x = 2578
integer y = 16
integer width = 2473
integer taborder = 0
end type

type gb_5 from gb_3 within w_cditemwc_m
integer x = 23
integer y = 280
integer width = 1413
integer height = 2060
integer taborder = 230
long textcolor = 16711680
string text = "품목그룹"
end type

type cb_1 from commandbutton within w_cditemwc_m
integer x = 1472
integer y = 1600
integer width = 288
integer height = 92
integer taborder = 210
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
string ls_value
long   ll_row, ll_seq, ll_idx

if dw_2.rowcount() < 1 then return

ll_row = dw_2.getrow()
ll_seq = dw_2.object.operation[ll_row]

ls_value = "operation A"
dw_2.SetSort( ls_value )
dw_2.Sort()

ll_idx = dw_2.Find( "operation =  "+ string(ll_seq) , 1, dw_2.rowcount())	
dw_2.scrolltorow( ll_idx )

end event

type dw_4 from datawindow within w_cditemwc_m
integer x = 165
integer y = 24
integer width = 123
integer height = 80
integer taborder = 240
boolean bringtotop = true
string dataobject = "d_cditemwcbomtran_h"
end type

type dw_8 from datawindow within w_cditemwc_m
integer x = 457
integer y = 24
integer width = 123
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_cditemwcbomtree_h"
boolean livescroll = true
end type

type dw_9 from datawindow within w_cditemwc_m
integer x = 603
integer y = 24
integer width = 123
integer height = 80
integer taborder = 190
boolean bringtotop = true
string dataobject = "d_cdbom_h"
boolean livescroll = true
end type

type gb_4 from groupbox within w_cditemwc_m
integer x = 3886
integer y = 280
integer width = 1166
integer height = 1228
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "BOM"
end type

type tv_1 from treeview within w_cditemwc_m
event selectionchanged pbm_tvnselchanged
integer x = 3913
integer y = 448
integer width = 1102
integer height = 1036
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Library!","Structure5!","UserObject5!","UserObject!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

event selectionchanged;//TreeViewitem ltv_team
//LONG ll_Row, ll_tvi
//STRING ls_teamNo
//
//if ii_chk = 1  then 
//	ii_chk = 0
//	return
//end if
//ih_Curteam = newhandle
//GetItem( newhandle , ltv_team )
//
//tab_1.tabpage_1.dw_2.retrieve(left(string(ltv_team.label),5))
//tab_1.tabpage_1.dw_3.retrieve(left(string(ltv_team.label),5))
//
//if ltv_team.Children = true then return	
//
//if dw_1.retrieve(left(string(ltv_team.label),5)) < 1 then
//	return
//end if
//
//wf_make_team(ltv_team.label, ltv_team.PictureIndex + 1)
end event

event clicked;// picture를 3개 지정해야함.
// 1 = 완제품 icon
// 2 = 반제품 icon
// 3 = 자재 icon
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_component_qa, ls_Source
long ll_curhandle, ll_foundrow, ll_childhandle, ll_inserthandle


ll_curhandle = tv_1.FindItem(CurrentTreeItem! , 0)
ll_childhandle = tv_1.finditem(ChildTreeItem!, ll_curhandle)
if ll_childhandle > 0 then
	return
end if
tv_1.getitem(ll_curhandle , ltv_item)
ls_component = MidA(ltv_Item.Label,1,10)
ls_component_qa = trim(MidA(ltv_Item.Label,12,31))

dw_9.retrieve(ls_component,ls_component_qa)

FOR ll_row = 1 TO dw_9.rowcount()
	IF dw_9.object.item_source[ll_row] = "M" THEN
		ltv_Item.PictureIndex = 2
		ltv_Item.SelectedPictureIndex = 2
	ELSE
		ltv_Item.PictureIndex = 3
		ltv_Item.SelectedPictureIndex = 3
	END IF
	ltv_Item.Label = dw_9.object.Component[ll_row] + " " + dw_9.object.component_qa[ll_row]
	ll_inserthandle = tv_1.InsertItemlast( ll_curhandle, ltv_Item )
//	tv_1.ExpandAll( ll_curhandle )
NEXT
//ll_inserthandle = tv_1.FindItem(RootTreeItem! , 0)
//tv_1.ExpandAll(ll_inserthandle)

end event

type dw_5 from datawindow within w_cditemwc_m
integer x = 311
integer y = 24
integer width = 123
integer height = 80
integer taborder = 200
boolean bringtotop = true
string dataobject = "d_cditemwcbom_h"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_cditemwc_m
integer x = 2615
integer y = 56
integer width = 256
integer height = 144
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "BOM"
string picturename = "c:\bmp\추가y.bmp"
alignment htextalign = right!
end type

event clicked;int    li_count
long   ll_row
string ls_itemno, ls_qa1, ls_sort

SELECT count(*) INTO :li_count 
  FROM bom 
 WHERE assembly = :is_ItemNo AND assembly_qa =: is_qa1;

IF li_Count < 1 THEN
	MessageBox("오류...","입력한 물품의 BOM이 구성되어있지 않았습니다.~nBOM을 먼져 등록 하십시요.")
	RETURN
END IF

if dw_2.rowcount() > 0 then
	li_count = messagebox("확인","이미 공정이 등록되어있습니다.. 삭제후 다시 등록하시겠습니까 ?",Question!, YesNo!,3)
	ll_row = dw_1.getrow()
	if li_count = 1 then
		ls_itemno = dw_1.object.item_no[ll_row]
		ls_qa1    = dw_1.object.qa1[ll_row]
		if not (isnull(dw_1.object.rout_qa[ll_row])) then
			delete from rout
			 where item_no = :ls_itemno
		      and qa = :ls_qa1;
		end if
		dw_2.reset()
	else
		return
	end if
end if

//IF NOT wf_MakeBomtran( is_ItemNo,is_qa1 ) THEN	//bom을 bomtran에 집어넣는다.
//	MessageBox( "오류...", "공정을 위한 기초자료(BOMTRAN)생성중 오류가 발생했습니다.~n"+ SQLCA.SQLErrText )
//END IF

ls_sort = "operation D, bom_no D "
wf_sort(dw_4,ls_sort)
for li_count = 1 to dw_4.rowcount()
	ll_row = dw_2.insertrow(0)
	dw_2.object.item_no[ll_row]    = is_itemno
	dw_2.object.qa[ll_row]         = is_qa1
	dw_2.object.operation[ll_row]  = ll_row
	dw_2.object.concurrent[ll_row] = "Y"
	dw_2.object.assembly[ll_row]   = dw_4.object.component[ li_count ]
	dw_2.object.assy_qa[ll_row]    = dw_4.object.comp_qa[ li_count ]
	dw_2.object.bom_no[ll_row]     = dw_4.object.bom_no[ li_count ]
	dw_2.object.qpa[ll_row]        = dw_4.object.qpa[ li_count ]
	dw_2.object.item_item_name[ll_row] = dw_4.object.item_item_name[li_count]
end for
//dw_2.retrieve()

end event

type pb_2 from picturebutton within w_cditemwc_m
integer x = 2875
integer y = 56
integer width = 256
integer height = 144
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "패턴"
string picturename = "c:\bmp\추가y.bmp"
alignment htextalign = right!
end type

event clicked;int    li_count
long   ll_row, ll_pat, ll_rowcount
string ls_itemno, ls_qa1, ls_sort

select pat_no into :ll_pat 
  from itempattern 
 where item_no = :is_itemno and qa1 = :is_qa1;
 
if isnull(ll_pat) then
	messagebox('오류',is_itemno + '에 대한 공정패턴번호를 등록하십시요.',exclamation!)
   return
end if

if dw_2.rowcount() > 0 then
	li_count = MessageBox("확인","이미 공정이 등록되어있습니다.. 삭제후 다시 등록하시겠습니까 ?",Question!, YesNo!,3)
	ll_row = dw_1.getrow()
	if li_count = 1 then
		ls_itemno= dw_1.object.item_no[ll_row]
		ls_qa1   = dw_1.object.qa1[ll_row]
		if not (isnull(dw_1.object.rout_qa[ll_row])) then
			DELETE FROM rout WHERE item_no = :ls_itemno AND qa = :ls_qa1;
		end if
		dw_2.reset()
	else
		return
	end if
end if

//if not wf_MakeBomtran( is_ItemNo,is_qa1 ) then
//	MessageBox( "오류...", "공정을 위한 기초자료(BOMTRAN)생성중 오류가 발생했습니다.~n"+ SQLCA.SQLErrText )
//end if

ll_rowcount = dw_10.retrieve(ll_pat)
if ll_rowcount < 1 then
	MessageBox('오류',string(ll_pat) + ' 공정번호에 대한 패턴이 삭제되었습니다.',exclamation!)
   return
end if

for li_count = 1 to ll_rowcount
	ll_row = dw_2.insertrow(0)
	dw_2.object.wc_no[ll_row]      = trim(dw_10.object.wc_no[li_count])
	dw_2.object.item_no[ll_row]    = is_itemno
	dw_2.object.qa[ll_row]         = is_qa1
	dw_2.object.operation[ll_row]  = li_count
	dw_2.object.concurrent[ll_row] = "N"
	dw_2.object.bom_no[ll_row]     = 0
next

end event

type dw_10 from datawindow within w_cditemwc_m
integer x = 750
integer y = 24
integer width = 123
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_cdpattern_m2"
boolean livescroll = true
end type

type pb_3 from picturebutton within w_cditemwc_m
integer x = 3593
integer y = 56
integer width = 430
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "현공정 선택 일괄처리"
vtextalign vtextalign = multiline!
end type

event clicked;// 일괄처리
string  ls_chk, ls_itemno, ls_qa, ls_routqa, ls_qa1, ls_assembly, ls_wcno, ls_useyn
long    ll_operation, ll_cnt, ll_row, ll_chk, i, j
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq
boolean lb_chk

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
dw_2.accepttext()

// 공정체크 
for ll_row = 1 to dw_2.rowcount()
	ls_itemno    = dw_2.object.item_no[ll_row]
	ls_qa        = dw_2.object.qa[ll_row]
	ls_wcno      = dw_2.object.wc_no[ll_row]
	ll_operation = dw_2.object.operation[ll_row]
	ls_assembly  = dw_2.object.assembly[ll_row]
	
	// 사용불가 작업장
	SELECT use_yn INTO :ls_useyn FROM WC WHERE work_no = :ls_wcno;
	if ls_useyn = "N" then
		MessageBox("오류", string(ll_row) + "번 사용불가 작업장을 선택 했습니다.", exclamation!)
		return
	end if
	
	// 중복공정
	SELECT count(*) INTO :ll_cnt FROM rout 
	 WHERE item_no = :ls_itemno AND qa = :ls_qa AND wc_no = :ls_wcno;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 공정입니다.",exclamation!)
		return
	end if

	// 중복품목
	SELECT count(*) INTO :ll_cnt FROM rout
	 WHERE item_no = :ls_itemno AND qa = :ls_qa AND assembly = :ls_assembly;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 품목입니다.",exclamation!)
		return
	end if
next


li_seq = MessageBox("확인","선택된 규격들의 공정 작업장을 현재 공정으로 복사하려면 'Yes',~n~n" + &
                    "공정만 추가 할 경우는 'No' 작업취소는 'Cancel'을 선택 하십시요.",Exclamation!,YesNoCancel!, 1)
choose case li_seq
	case 1
		lb_chk = true
	case 2 
		lb_chk = false
	case 2
		return
end choose

ll_row = dw_1.rowcount()
for i = 1 to dw_1.rowcount()	// 품목+규격
	if dw_1.object.chk[i] = "N" then continue
	if lb_chk = true then	// 공정복사
	else							// 공정추가
		if isnull(dw_1.object.rout_qa[i]) then continue		// 빈 공정 SKIP
	end if
	
	ls_routqa = trim(dw_1.object.rout_qa[i])		//
	ls_qa1    = trim(dw_1.object.qa1[i])			// 
	 
	for j = 1 to dw_2.rowcount()		// 규격+작업장
		ls_itemno   = trim(dw_2.object.item_no[j])	// 완제품
		ls_assembly = trim(dw_2.object.assembly[j])	// 제조품목
		ls_wcno     = trim(dw_2.object.wc_no[j])		// 작업장
		
		li_seq      = dw_2.object.operation[j]			// 순번
		lr_setup    = dw_2.object.setup_time[j]		// 설치시간
		lr_run      = dw_2.object.run_time[j]			// 수행시간
		lr_qpa      = dw_2.object.qpa[j]					// 조립품당수량

		SELECT count(*) INTO :ll_chk 
		  FROM rout 
		 WHERE item_no = :ls_itemno AND qa = :ls_qa1 AND operation = :li_seq;
		if ll_chk = 0 then
			INSERT INTO rout (item_no, qa, operation, concurrent, wc_no, setup_time, queue_time, run_time, delivery_time, assembly, assy_qa, bom_no, qpa)
			VALUES (:ls_itemno, :ls_qa1, :li_seq, 'N', :ls_wcno, :lr_setup, 0, :lr_run, 0, :ls_assembly, :ls_qa1, 0, :lr_qpa);
			if sqlca.sqlcode < 0 then
				MessageBox("오류","일괄처리[INSERT] " + ls_itemno + " " + ls_qa1 + " " + string(li_seq),exclamation!)
				ROLLBACK;
				RETURN
			end if
		else
			/* 규격별로 공정은 다를 수도 있음 */
			if lb_chk = true then
				UPDATE rout 
				   SET wc_no = :ls_wcno 
			    WHERE item_no = :ls_itemno AND qa = :ls_qa1 AND operation = :li_seq;
				if sqlca.sqlcode < 0 then
				   MessageBox("오류","일괄처리[UPDATE] " + ls_itemno + " " + ls_qa1 + " " + string(li_seq),exclamation!)
					ROLLBACK;
					RETURN
				end if
			end if
		end if
	next
	 
	dw_1.object.rout_qa[i] = 'XX'
	COMMIT;
next

MessageBox('확인','일괄처리가 완료 되었습니다.')

pb_4.triggerevent( clicked! )	// 코드,공정생성

dw_1.selectrow(0, false)
if MessageBox("확인", "새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
	dw_1.retrieve( trim(sle_1.text) + '%' )
end if

end event

type pb_4 from picturebutton within w_cditemwc_m
integer x = 3136
integer y = 56
integer width = 434
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "코드,공정생성"
vtextalign vtextalign = vcenter!
end type

event clicked;// 코드,공정생성
string  ls_qa, ls_item, ls_qa1, ls_assembly, ls_uom, ls_source, ls_qalike, ls_itemname, ls_temp
long    ll_dw11cnt, i, ll_idx, ll_dw12cnt, k, ll_cnt, ll_dw1row
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
dw_2.accepttext()

for ll_dw1row = 1 to dw_1.rowcount()		// 품목+규격
	if dw_1.object.chk[ll_dw1row] = "N" then continue
	 
	dw_1.scrolltorow( ll_dw1row )
	
	ls_item     = trim(dw_1.object.item_no[ll_dw1row])	// 완제품
	ls_qalike   = trim(dw_1.object.qa1[ll_dw1row])		// 완제품 규격(길이=00000)

	dw_2.retrieve( ls_item, ls_qalike )		            // 규격+작업장
	
	ls_qalike   = MidA(ls_qalike,1,14) + "%"		      // Ex) 050X0200X0200X00000 -> 050X0200X0200X%
	ll_dw11cnt  = dw_11.retrieve( ls_item, ls_qalike )	// 완제품+규격(길이제외)
	
	cb_1.triggerevent( clicked! )	// 순번정렬
	
	ll_cnt = dw_2.rowcount() 		// 규격+작업장
	ll_cnt --
	for k = 1 to ll_cnt		
		ls_assembly = trim(dw_2.object.assembly[k])		// 반제품
		SELECT item_name, uom, source INTO :ls_itemname, :ls_uom, :ls_source 
		  FROM groupitem 
		 WHERE item_no = :ls_assembly;
		 
		ll_dw12cnt = dw_12.retrieve( ls_assembly, ls_qalike )	// 반제품+규격(길이제외)
		for i = 1 to ll_dw11cnt
			ls_qa    = trim(dw_11.object.qa[i])			// 완제품규격
			ls_qa1   = MidA(ls_qa,1,14) + "00000"		// 완제품규격 길이를 "00000"으로 변환
			
			ll_idx = dw_12.Find( "qa = '" + ls_qa + "'", 1, ll_dw12cnt )	// 반제품 
			if ll_idx < 1 then
				INSERT INTO item (item_no, qa, loc_no, item_name, uom, source, leadtime, count_code,
                   qoh, sales_reserved, prodn_reserved, pur_reserved, reorder, safety_stock,
				       lot, obsolete_code, scrap_qty, price_a, price_b, price_c, std_setup, std_material,
						 std_labor, std_burden, std_subcontract, std_machine, month_qty, safety_day, qa1, use_flag)
				VALUES (:ls_assembly, :ls_qa, 'WS00000000', :ls_itemname, :ls_uom, :ls_source, 0, 'M', 0, 0,
						  0, 0, 0, 0, 0, 'N', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, :ls_qa1, 'Y');
				if sqlca.sqlcode < 0 then
					MessageBox("오류[item]","반제품 코드 생성: " + ls_assembly + " " + ls_qa + " ",exclamation!)
					ROLLBACK;
					RETURN
				end if
				
				SELECT item_no INTO :ls_temp FROM itempattern WHERE item_no = :ls_assembly AND qa1 = :ls_qa1;
				if sqlca.sqlcode = 100 then
					INSERT INTO itempattern (item_no, qa1) VALUES (:ls_assembly, :ls_qa1);
					if sqlca.sqlcode < 0 then
					   MessageBox("오류[itempattern]","반제품 패턴 생성: " + ls_assembly + " " + ls_qa1 + " ",exclamation!)
						ROLLBACK;
						RETURN
					end if	
				end if
			else
				// ITEM에 규격까지 존재하면 SKIP
			end if
		next
	next
	
	pb_5.triggerevent( clicked! )	// 공정생성
	COMMIT;
NEXT

MessageBox('확인','코드,공정생성이 완료 되었습니다.')

end event

type dw_11 from datawindow within w_cditemwc_m
integer x = 896
integer y = 24
integer width = 123
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "완제품"
string dataobject = "d_cditemlike_h"
boolean livescroll = true
end type

type dw_12 from datawindow within w_cditemwc_m
integer x = 1042
integer y = 24
integer width = 123
integer height = 80
integer taborder = 40
boolean bringtotop = true
string title = "반제품"
string dataobject = "d_cditemlike_h"
boolean livescroll = true
end type

type pb_5 from picturebutton within w_cditemwc_m
integer x = 2089
integer y = 1584
integer width = 279
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "공정저장"
vtextalign vtextalign = vcenter!
end type

event clicked;//
string  ls_item, ls_qa, ls_routqa, ls_qa1, ls_assy, ls_assyqa, ls_wc, ls_temp, ls_useyn
long    ll_operation, ll_cnt, ll_row, ll_rowcount, i, j, ll_found
real    lr_setup, lr_run, lr_qpa, lr_work
integer li_seq

cb_1.triggerevent(clicked!)	// 순번정렬

// 공정체크 
for ll_row = 1 to dw_2.rowcount()
	ls_item      = dw_2.object.item_no[ll_row]
	ls_qa        = dw_2.object.qa[ll_row]
	ls_wc        = dw_2.object.wc_no[ll_row]
	ll_operation = dw_2.object.operation[ll_row]
	ls_assy      = dw_2.object.assembly[ll_row]
	
	// 사용불가 작업장
	SELECT use_yn INTO :ls_useyn FROM WC WHERE work_no = :ls_wc;
	if ls_useyn = "N" then
		MessageBox("오류", string(ll_row) + "번 사용불가 작업장을 선택 했습니다.", exclamation!)
		return
	end if
	
	// 중복공정
	SELECT count(*) INTO :ll_cnt FROM rout 
	 WHERE item_no = :ls_item AND qa = :ls_qa AND wc_no = :ls_wc;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 공정입니다.",exclamation!)
		return
	end if

	// 중복품목
	SELECT count(*) INTO :ll_cnt FROM rout
	 WHERE item_no = :ls_item AND qa = :ls_qa AND assembly = :ls_assy;
	if ll_cnt > 1 then
		MessageBox("오류",string(ll_row) + "번 중복된 품목입니다.",exclamation!)
		return
	end if
next


ll_rowcount = dw_2.rowcount() // 공정수
ll_rowcount --
if ll_rowcount < 1 then return

for i = ll_rowcount to 1		// 작업장
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
		if sqlca.sqlcode = 0 then exit
			
	   INSERT INTO rout (item_no, qa, operation, concurrent, wc_no, rout_desc,
		       setup_time, queue_time, run_time, delivery_time, assembly, assy_qa, bom_no, qpa, work_per)
	   VALUES (:ls_item, :ls_qa, :li_seq, null, :ls_wc, null, :lr_setup, 0, :lr_run, 0,
		        :ls_assy, :ls_assyqa, 0, :lr_qpa, :lr_work);
	   if sqlca.sqlcode < 0 then
			MessageBox("오류","공정저장[rout] " + ls_item + " " + ls_qa + " " + string(li_seq) + " " + ls_wc,exclamation!)
		   ROLLBACK;
		   RETURN
	   end if
	next
	
	ll_found = dw_1.Find( "item_no = '" + ls_item + "' and qa1 = '" + ls_qa + "'", 1, dw_1.RowCount() )
   if ll_found > 0 then
      dw_1.object.rout_qa[ll_found] = 'XX'
	end if
next
//commit;
//messagebox('확인','완료되었습니다.')

end event

type sle_1 from singlelineedit within w_cditemwc_m
integer x = 2062
integer y = 336
integer width = 1778
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_retrieve.postevent(clicked!)
end event

type cbx_1 from checkbox within w_cditemwc_m
integer x = 3918
integer y = 352
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "BOM조회"
end type

type dw_6 from datawindow within w_cditemwc_m
integer x = 46
integer y = 448
integer width = 1371
integer height = 1864
integer taborder = 270
boolean bringtotop = true
string title = "none"
string dataobject = "d_cditemwc_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if row < 1 or row > this.rowcount() then return

is_col = dwo.name + " "

sle_1.text = this.object.item_no[row]
sle_2.text = this.object.item_name[row]
pb_retrieve.postevent(clicked!)

dw_1.setfocus()

end event

event rowfocuschanged;//
if currentrow < 1 then return

sle_1.text = this.object.item_no[currentrow]
sle_2.text = this.object.item_name[currentrow]
pb_retrieve.postevent(clicked!)
end event

type sle_2 from singlelineedit within w_cditemwc_m
integer x = 50
integer y = 336
integer width = 759
integer height = 84
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;//
this.SelectText(1, LenA(this.text))		// 전체 선택

end event

event constructor;//
cb_2.default = true
end event

type cb_2 from commandbutton within w_cditemwc_m
integer x = 818
integer y = 336
integer width = 146
integer height = 84
integer taborder = 180
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
string ls_filter

if LenA(sle_2.text) = 0 then
	ls_filter = ""
else
	ls_filter = "item_name like '%" + sle_2.text + "%' "
end if

dw_6.setfilter(ls_filter)
dw_6.filter()

dw_6.scrolltorow(1)
end event

type st_work from statictext within w_cditemwc_m
integer x = 2446
integer y = 1640
integer width = 2565
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "배경색이 노랑색(공정그룹), 글자색이 적색(사용불가) 작업장.(제조품명이 동일하면 안됨)"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cditemwc_m
integer x = 32
integer y = 24
integer width = 123
integer height = 80
boolean bringtotop = true
string dataobject = "d_cditemwc_r"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_cditemwc_m
integer x = 1390
integer y = 72
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "E 코드"
boolean checked = true
end type

event clicked;long ll_row

for ll_row = 1 to dw_6.rowcount()
	if this.checked = true then
		if LeftA(dw_6.object.item_no[ll_row],1) = "E" then 
			dw_6.scrolltorow(ll_row)
			ll_row = dw_6.rowcount()
		end if
	end if
next

end event

type rb_2 from radiobutton within w_cditemwc_m
integer x = 1746
integer y = 72
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "G 코드"
end type

event clicked;long ll_row

for ll_row = 1 to dw_6.rowcount()
	if this.checked = true then
		if LeftA(dw_6.object.item_no[ll_row],1) = "G" then 
			dw_6.scrolltorow(ll_row)
			ll_row = dw_6.rowcount()
		end if
	end if
next

end event

type rb_3 from radiobutton within w_cditemwc_m
integer x = 1390
integer y = 140
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "M 코드"
end type

event clicked;long ll_row

for ll_row = 1 to dw_6.rowcount()
	if this.checked = true then
		if LeftA(dw_6.object.item_no[ll_row],1) = "M" then 
			dw_6.scrolltorow(ll_row)
			ll_row = dw_6.rowcount()
		end if
	end if
next

end event

type rb_4 from radiobutton within w_cditemwc_m
integer x = 1746
integer y = 140
integer width = 320
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "P 코드"
end type

event clicked;long ll_row

for ll_row = 1 to dw_6.rowcount()
	if this.checked = true then
		if LeftA(dw_6.object.item_no[ll_row],1) = "P" then 
			dw_6.scrolltorow(ll_row)
			ll_row = dw_6.rowcount()
		end if
	end if
next

end event

type cb_3 from commandbutton within w_cditemwc_m
integer x = 969
integer y = 336
integer width = 146
integer height = 84
integer taborder = 190
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
string ls_filter

ls_filter = ""

dw_6.setfilter(ls_filter)
dw_6.filter()

dw_6.retrieve()
dw_6.scrolltorow(1)
end event

type cb_4 from commandbutton within w_cditemwc_m
integer x = 1120
integer y = 336
integer width = 146
integer height = 84
integer taborder = 200
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
dw_6.SetSort(is_col + "A")
dw_6.sort()

end event

type cb_5 from commandbutton within w_cditemwc_m
integer x = 1266
integer y = 336
integer width = 146
integer height = 84
integer taborder = 210
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
dw_6.SetSort(is_col + "D")
dw_6.sort()

end event

type pb_6 from picturebutton within w_cditemwc_m
integer x = 2080
integer y = 60
integer width = 434
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품코드 관리"
vtextalign vtextalign = vcenter!
end type

event clicked;//
string ls_itemno
long   ll_row

if dw_1.rowcount() < 1 then return

ll_row    = dw_1.getrow()
ls_itemno = dw_1.object.item_no[ll_row]
if ls_itemno = "" or isnull(ls_itemno) then return

if IsValid(w_m_main) then 
	OpenSheet(w_cditem_m, w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cditem_m, w_all_main, 5, original!)
end if

w_cditem_m.setredraw(false)
if LeftA(gs_team,1) = "9" then
	w_cditem_m.pb_save.enabled = false	// 저장
end if
w_cditem_m.sle_1.text = ls_itemno	// 품목번호
//w_cditem_m.pb_retrieve.postevent(clicked!)
w_cditem_m.pb_1.postevent(clicked!)
w_cditem_m.setredraw(true)


end event

type st_2 from statictext within w_cditemwc_m
integer x = 1321
integer y = 232
integer width = 1239
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "~"E~" 코드는 스리팅용으로 재고관리 대상 아님."
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_cditemwc_m
integer x = 1499
integer y = 352
integer width = 219
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
end type

event clicked;// 전체
long ll_row

for ll_row = 1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.chk[ll_row] = "Y"
	else
		dw_1.object.chk[ll_row] = "N"
	end if
next
end event

type st_3 from statictext within w_cditemwc_m
integer x = 2578
integer y = 232
integer width = 2473
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "공정일괄 처리대상을 CHK한 후 대상이 품목+규격을 마지막에 선택함."
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_cditemwc_m
integer x = 1929
integer y = 1584
integer width = 151
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;//
long    ll_row, ll_operation
integer li_chk
string  ls_itemno, ls_itemnm, ls_qa

dw_2.Accepttext()

ll_row       = dw_2.getrow()
ls_itemno    = dw_2.object.item_no[ll_row]
ls_qa        = dw_2.object.qa[ll_row]	
ll_operation = dw_2.object.operation[ll_row]

li_chk = MessageBox("확인","품명 : [" + ls_itemno + "]~n규격 : [" + ls_qa + "]~n~n" + &
                    "선택한 작업을 삭제 하시겠습니까 ?",Question!, YesNo!,2)
if li_chk = 1 then
	DELETE FROM rout WHERE item_no = :ls_itemno AND qa = :ls_qa AND operation = :ll_operation;
	if sqlca.sqlcode < 0 then
		MessageBox("오류","작업장삭제[rout] " + ls_itemno + " " + ls_qa + " " + string(ll_operation),exclamation!)
		ROLLBACK;
		RETURN
	else
		COMMIT;
	end if
	
	dw_2.retrieve( ls_itemno, ls_qa )		// 규격+작업장	
end if

end event

type gb_6 from groupbox within w_cditemwc_m
integer x = 1321
integer y = 16
integer width = 1239
integer height = 204
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "품목이동"
end type

