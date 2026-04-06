$PBExportHeader$w_cdbom_m.srw
$PBExportComments$BOM관리(98/03/19,이인호)
forward 
global type w_cdbom_m from w_inheritance
end type
type gb_6 from groupbox within w_cdbom_m
end type
type dw_3 from datawindow within w_cdbom_m
end type
type dw_4 from datawindow within w_cdbom_m
end type
type dw_5 from datawindow within w_cdbom_m
end type
type sle_1 from singlelineedit within w_cdbom_m
end type
type st_1 from statictext within w_cdbom_m
end type
type tab_1 from tab within w_cdbom_m
end type
type tabpage_1 from userobject within tab_1
end type
type tv_1 from treeview within tabpage_1
end type
type tabpage_1 from userobject within tab_1
tv_1 tv_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_6 dw_6
end type
type tab_1 from tab within w_cdbom_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_cdbom_m from w_inheritance
integer width = 3662
integer height = 2108
string title = "BOM관리(w_cdbom_m)"
boolean resizable = false
gb_6 gb_6
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
sle_1 sle_1
st_1 st_1
tab_1 tab_1
end type
global w_cdbom_m w_cdbom_m

type variables
st_print i_print
datawindowchild idwc_item, idwc_qa
string is_select, is_clause, is_where
string is_itemno, is_qa1
int ii_picture_index = 1, ii_level
TREEVIEW tv1
end variables

forward prototypes
public function long wf_searchtree (string arg_searchitem)
public function boolean wf_makeonelevelbom (string arg_itemno, string arg_qa)
public subroutine wf_calcbom_qty (string arg_component, string arg_component_qa, integer arg_qty)
public subroutine wf_display (integer arg_row, decimal arg_acceptqty)
public subroutine wf_mutilevel (string arg_item, string arg_qa)
public function boolean wf_makemulbom_r (string as_itemno, string as_qa, long al_row)
public function boolean wf_insertbomtran (string as_assy, string as_assy_qa, string as_comp, string as_comp_qa, long ai_row)
public function boolean wf_deletebomtran (string as_assy, string as_assy_qa, string as_comp, string as_comp_qa)
end prototypes

public function long wf_searchtree (string arg_searchitem);TreeViewItem ltv_Item
STRING ls_treelabel
long ll_cnt, ll_finditem

ll_finditem = tv1.finditem(RootTreeItem! , 0)
tv1.GetItem( ll_finditem, ltv_Item )
ls_treelabel = ltv_Item.Label

for ll_cnt = 1 to dw_2.rowcount() + 1
	if ls_treelabel = arg_searchitem then
		exit
	end if
	ll_finditem = tv1.finditem(NextVisibleTreeItem! , ll_finditem)
	tv1.GetItem( ll_finditem, ltv_Item )
	ls_treelabel = ltv_Item.Label
next
if ls_treelabel <> arg_searchitem then
	setnull(ll_finditem)
end if
return(ll_finditem)
end function

public function boolean wf_makeonelevelbom (string arg_itemno, string arg_qa);// picture를 3개 지정해야함. 1 : 완제품, 2 : 반제품, 3 : 자재
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_componentqa, ls_Source,ls_itemname,ls_compqa
long ll_curhandle

ltv_Item.PictureIndex = ii_picture_index
ltv_Item.SelectedPictureIndex = ii_picture_index
ls_itemname = trim(dw_1.object.item_item_name[1])
//select item_name into :ls_itemname from groupitem where item_no = :arg_itemno;
ltv_Item.Label = arg_ItemNo + "," + arg_qa + "," + ls_itemname

tv1.DeleteItem(0)
lh_Item = tv1.InsertItemSort( 0, ltv_Item )

IF dw_2.rowcount() < 1 THEN RETURN( FALSE )

FOR ll_row = 1 TO dw_2.rowcount()
	IF dw_2.object.groupitem_source[ll_row] = "M" THEN
		ltv_Item.PictureIndex = 2; ltv_Item.SelectedPictureIndex = 2
	ELSE
		ltv_Item.PictureIndex = 3; ltv_Item.SelectedPictureIndex = 3
	END IF
	ls_component = trim(dw_2.object.Component[ll_row])
	ls_compqa = trim(dw_2.object.component_qa[ll_row])
	ls_itemname = trim(dw_2.object.groupitem_item_name[ll_row])
	ltv_Item.Label = ls_component + "," + ls_compqa + "," + ls_itemname
	ll_curhandle = tv1.InsertItemlast( lh_Item, ltv_Item )
	tv1.ExpandAll( lh_Item )
//	dw_2.setitem(ll_row,'currenthandle',ll_curhandle)
	dw_2.setitemstatus(ll_row,0,primary!,notmodified!)
NEXT

return( TRUE )
end function

public subroutine wf_calcbom_qty (string arg_component, string arg_component_qa, integer arg_qty);int n, ls_rowcount
string ls_component, ls_component_qa
decimal{4} ld_needqty

ls_rowcount = dw_4.retrieve(arg_component,arg_component_qa)
IF ls_rowcount  > 0 THEN 
	FOR n	 = 1 TO ls_rowcount
		ls_component = dw_4.Object.component[n]
		ls_component_qa = dw_4.Object.component_qa[n]
		ld_needqty = dw_4.Object.qpa[n] * arg_qty
		ii_level = ii_level + 1;
		wf_display(n, ld_needqty)
		WF_calcbom_qty(ls_component,ls_component_qa , ld_needqty)   
		ii_level = ii_level - 1;
		ls_rowcount = dw_4.retrieve(arg_component,arg_component_qa)      
	NEXT
END IF
end subroutine

public subroutine wf_display (integer arg_row, decimal arg_acceptqty);string ls_component, ls_component_qa, ls_compname, ls_uom, ls_col, ls_source
int li_sequence, li_col
datetime ld_effectivity , ld_obsolete
decimal{6} ld_qpa
decimal{4} ld_yield, ld_qoh
decimal{6} ld_needqty

int li_rowcount

   ls_component = dw_4.Object.component[arg_row]
   ls_component_qa = dw_4.Object.component_qa[arg_row]
   ls_compname = dw_4.Object.item_item_name[arg_row]
   ls_source = dw_4.Object.item_source[arg_row]
   li_sequence = dw_4.Object.sequence[arg_row]
   ld_effectivity = dw_4.Object.effectivity[arg_row]
   ld_obsolete = dw_4.Object.obsolete[arg_row]
   ls_uom = dw_4.Object.item_uom[arg_row]
   ld_qpa = dw_4.Object.qpa[arg_row]
   ld_yield = dw_4.Object.yield[arg_row]

   dw_5.insertrow(0)
   li_rowcount = dw_5.rowcount()
	dw_5.Object.parent_no[li_RowCount] = ii_level
	li_col = ii_level * 2 - 1
	ls_col = " . . . . . . . . ."
	dw_5.Object.parent_text[li_RowCount] = MidA(ls_col,1,li_col) + string(ii_level)

   dw_5.Object.assembly[li_RowCount] = is_itemno
   dw_5.Object.assembly_qa[li_RowCount] = is_qa1
   dw_5.Object.assy_name[li_RowCount] = dw_1.object.item_item_name[dw_1.getrow()]
   dw_5.Object.assy_source[li_RowCount] = dw_1.object.item_source[dw_1.getrow()]

   dw_5.Object.component[li_RowCount] = ls_component
   dw_5.Object.component_qa[li_RowCount] = ls_component_qa
   dw_5.Object.item_source[li_RowCount] = ls_source
   dw_5.Object.item_item_name[li_RowCount] = ls_compname
   dw_5.Object.sequence[li_RowCount] = li_sequence
   dw_5.Object.effectivity[li_RowCount] = ld_effectivity
   dw_5.Object.obsolete[li_RowCount] = ld_obsolete
   dw_5.Object.item_uom[li_RowCount] = ls_uom
   dw_5.Object.qpa[li_RowCount] = ld_qpa
   dw_5.Object.yield[li_RowCount] = ld_yield

   ld_needqty = arg_acceptqty / ld_yield
	dw_5.Object.need_qty[li_RowCount] = ld_needqty
   
end subroutine

public subroutine wf_mutilevel (string arg_item, string arg_qa);// picture를 3개 지정해야함. 1 : 완제품, 2 : 반제품, 3 : 자재
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_componentqa, ls_Source,ls_itemname,ls_compqa
long ll_curhandle


if dw_4.retrieve(arg_item,arg_qa) < 1 then return

ltv_Item.PictureIndex = ii_picture_index
ltv_Item.SelectedPictureIndex = ii_picture_index
select item_name into :ls_itemname from groupitem 
 where item_no = :arg_item;
ltv_Item.Label = arg_Item + "," + arg_qa + "," + ls_itemname

FOR ll_row = 1 TO dw_4.rowcount()
	IF dw_4.object.item_source[ll_row] = "M" THEN
		ltv_Item.PictureIndex = 2
		ltv_Item.SelectedPictureIndex = 2
	ELSE
		ltv_Item.PictureIndex = 3
		ltv_Item.SelectedPictureIndex = 3
	END IF
	ls_component = trim(dw_4.object.Component[ll_row])
	ls_compqa = trim(dw_4.object.component_qa[ll_row])
	select item_name into :ls_itemname from groupitem 
	 where item_no = :ls_component;
	ltv_Item.Label = ls_component + "," + ls_compqa + "," + ls_itemname
	ll_curhandle = tv1.InsertItemlast( lh_Item, ltv_Item )
	tv1.ExpandAll( lh_Item )
//	dw_4.setitem(ll_row,'currenthandle', ll_curhandle)
	dw_4.setitemstatus(ll_row, 0, primary!, notmodified!)
NEXT

end subroutine

public function boolean wf_makemulbom_r (string as_itemno, string as_qa, long al_row);long ll_row
string ls_itemno, ls_qa

dw_1.retrieve(as_itemno,as_qa)
dw_1.RowsCopy(1,  dw_1.RowCount(), Primary!, dw_3, al_row, Primary!)

for ll_row = 1 to dw_1.rowcount()
	ls_itemno = dw_1.object.item_no[ll_row]
	ls_qa = dw_1.object.qa[ll_row]
	wf_makemulbom_r(ls_itemno, ls_qa, ll_row)
end for

return(true)
end function

public function boolean wf_insertbomtran (string as_assy, string as_assy_qa, string as_comp, string as_comp_qa, long ai_row);INT i, j, li_Count, li_NewRow, li_BomtranCount, li_BomCount
STRING ls_item, ls_qa, ls_assy, ls_comp, ls_tmpComp, ls_Assy_qa, ls_Comp_qa, ls_TmpComp_qa
INT li_ParentNo, li_Sequence, li_BomNo, li_MaxBomNo
DECIMAL ld_Qpa, ld_Yield
DATE ldt_Effectivity, ldt_Obsolete

//bomtran에 추가할 필요가 있는가?  
SELECT COUNT(*) INTO :li_BomtranCount FROM bomtran
	WHERE component = :as_assy
	  AND comp_qa = :as_assy_qa;
//IF li_BomtranCount <= 0 THEN RETURN( TRUE ) // <==이인호가 막음 필요해서!
IF li_BomtranCount > 0 THEN RETURN( TRUE ) //  필요해서!

//dynamin data store 생성
//MSSQL에서는 동작하지 않는다. SINYG생각 1998/06/21
//ls_NewSyntax = SQLCA.SyntaxFromSQL( " SELECT * FROM bomtran ", "", ls_Error )
//IF dw_3.Create( ls_NewSyntax ) <> 1 THEN RETURN( FALSE )
dw_3.InsertRow( 0 )
//dw_3.Object.item_no[1]
dw_3.Object.assembly[1] = as_assy
dw_3.Object.assy_qa[1] = as_assy_qa
//dw_3.Object.parent_no[1]
dw_3.Object.component[1] = as_comp
dw_3.Object.comp_qa[1] = as_comp_qa
dw_3.Object.sequence[1] = dw_2.Object.sequence[ ai_row ]
dw_3.Object.qpa[1] = dw_2.Object.qpa[ ai_row ]
dw_3.Object.effectivity[1] = dw_2.Object.effectivity[ ai_row ]
dw_3.Object.obsolete[1] = dw_2.Object.obsolete[ ai_row ]
dw_3.Object.yield[1] = dw_2.Object.sequence[ ai_row ]
//dw_3.Object.bom_no[1]
//dw_3.Object.dirty_flag

// 추가된 component의 서브 bom을 모두 가져온다...
FOR i = 1 TO dw_3.RowCount()
	ls_comp = dw_3.Object.component[i]
	ls_comp_qa = trim(dw_3.Object.comp_qa[i])
	
	SELECT COUNT(*) INTO :li_Count FROM bom
	 WHERE assembly = :ls_comp
	   AND assembly_qa = :ls_comp_qa;
	
	IF li_Count <= 0 THEN CONTINUE
	
	DECLARE bom_list CURSOR FOR  
		SELECT sequence, component, component_qa, qpa, effectivity, obsolete, yield FROM bom
			WHERE assembly = :ls_comp
	   AND assembly_qa = :ls_comp_qa;

	OPEN bom_list;
	
	FOR j = 1 TO li_Count
		FETCH bom_list 
		INTO :li_Sequence, :ls_tmpcomp, :ls_tmpcomp_qa, :ld_Qpa,
				:ldt_Effectivity, :ldt_Obsolete, :ld_Yield;
		
		
		SELECT COUNT(*) INTO :li_BomCount FROM bom
			WHERE assembly = :ls_tmpcomp
	   AND assembly_qa = :ls_tmpcomp_qa;
		IF li_BomCount <= 0 THEN CONTINUE	// sub bom이 없는 것은 bomtran에 넣지않는다.
		
		IF i+1 > dw_3.RowCount() THEN 
			li_NewRow = dw_3.InsertRow( 0 )
		ELSE
			li_NewRow = dw_3.InsertRow( i + 1 )
		END IF
		
		//dw_3.Object.item_no
		dw_3.Object.assembly[ li_NewRow ] = ls_comp
		dw_3.Object.assy_qa[ li_NewRow ] = ls_comp_qa
		//dw_3.Object.parent_no
		dw_3.Object.component[ li_NewRow ] = ls_tmpcomp
		dw_3.Object.comp_qa[ li_NewRow ] = ls_tmpcomp_qa
		dw_3.Object.sequence[ li_NewRow ] = li_Sequence
		dw_3.Object.qpa[ li_NewRow ] = ld_Qpa
		dw_3.Object.effectivity[ li_NewRow ] = ldt_Effectivity
		dw_3.Object.obsolete[ li_NewRow ] = ldt_Obsolete
		dw_3.Object.yield[ li_NewRow ] = ld_Yield
		//dw_3.Object.bom_no
		//dw_3.Object.dirty_flag
	NEXT
	
	CLOSE bom_list;
NEXT

DECLARE bomtran_list CURSOR FOR
	SELECT item_no, qa, bom_no FROM bomtran 
	WHERE component = :as_assy
	   AND assy_qa = :as_assy_qa	;

OPEN bomtran_list;

FOR i = 1 TO li_BomtranCount
	FETCH bomtran_list INTO :ls_Item, :ls_qa, :li_BomNo;
	
	SELECT MAX(bom_no) INTO :li_MaxBomNo FROM bomtran
		WHERE item_no = :ls_Item
		and qa = :ls_qa;
	if isnull(li_BomNo) then
		li_bomno = 0
	end if
	dw_3.Object.parent_no[1] = li_BomNo

	// key setting
	FOR j = 1 TO dw_3.RowCount()
		li_MaxBomNo++
		dw_3.Object.item_no[j] = ls_Item
		dw_3.Object.qa[j] = ls_qa
		dw_3.Object.bom_no[j] = li_MaxBomNo
		
		dw_3.SetItemStatus( j, 0, Primary!, NewModified! )	// data store가 INSER문을 날리도록 status조정
		IF j = 1 THEN CONTINUE
		
		// parentNo setting
		li_ParentNo = dw_3.Find( "component = '" + dw_3.Object.assembly[j] &
									+ "' and component_qa = '" + dw_3.Object.assy_qa[j] + "'", j - 1 , 1 )

		IF li_ParentNo <= 0 THEN RETURN( FALSE )
		
		dw_3.Object.parent_no[j] = li_ParentNo
	NEXT
	
	IF dw_3.Update() <> 1 THEN RETURN( FALSE )
NEXT

CLOSE bomtran_list;

RETURN( TRUE )
end function

public function boolean wf_deletebomtran (string as_assy, string as_assy_qa, string as_comp, string as_comp_qa);INT i, j, li_Count, li_NewRow
STRING ls_assy, ls_comp, ls_tmpComp, ls_Assy_qa, ls_Comp_qa, ls_TmpComp_qa


//ls_NewSyntax = SQLCA.SyntaxFromSQL( " SELECT assembly, component FROM bom ", "", ls_Error )
//
//IF dw_4.Create( ls_NewSyntax ) <> 1 THEN RETURN( FALSE )
DW_4.RESET()
dw_4.InsertRow( 0 )
dw_4.Object.assembly[1] = as_assy
dw_4.Object.assembly_qa[1] = as_assy_qa
dw_4.Object.component[1] = as_comp
dw_4.Object.component_qa[1] = as_comp_qa

// 삭제된 component의 서브 bom을 모두 가져온다...
FOR i = 1 TO dw_4.RowCount()
	ls_assy = dw_4.Object.assembly[i]
	ls_assy_qa = dw_4.Object.assembly_qa[i]
	ls_comp = dw_4.Object.component[i]
	ls_comp_qa = dw_4.Object.component_qa[i]
	
	SELECT COUNT(*) INTO :li_Count FROM bom
	 WHERE assembly = :ls_comp
		and assembly_qa = :ls_comp_qa;
	
	IF li_Count <= 0 THEN CONTINUE
	
	DECLARE bom_list CURSOR FOR
		SELECT component FROM bom 
		WHERE assembly = :ls_comp
		and assembly_qa = :ls_comp_qa;
	
	OPEN bom_list;
	
	FOR j = 1 TO li_Count
		FETCH bom_list INTO :ls_tmpComp;
		
		li_NewRow = dw_4.InsertRow( 0 )
		
		dw_4.Object.assembly[ li_NewRow ] = ls_comp
		dw_4.Object.assembly_qa[ li_NewRow ] = ls_assy_qa
		dw_4.Object.component[ li_NewRow ] = ls_tmpComp
		dw_4.Object.component_qa[ li_NewRow ] = ls_tmpComp_qa
	NEXT
	
	CLOSE bom_list;
NEXT

// 가져온 모든 서브bom을 bomtran에서 삭제...
FOR i = 1 TO dw_4.RowCount()
	ls_assy = dw_4.Object.assembly[i]
	ls_assy_qa = dw_4.Object.assembly_qa[i]
	ls_comp = dw_4.Object.component[i]
	ls_comp_qa = dw_4.Object.component_qa[i]
	
	DELETE FROM bomtran 
	 WHERE assembly = :ls_comp
	  and assy_qa = :ls_comp_qa 
	  AND component = :ls_comp
	  AND comp_qa = :ls_comp_qa;
	
	IF SQLCA.SQLCode < 0 THEN	RETURN( FALSE )
NEXT


RETURN( TRUE )
end function

on w_cdbom_m.create
int iCurrent
call super::create
this.gb_6=create gb_6
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.sle_1=create sle_1
this.st_1=create st_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_6
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.tab_1
end on

on w_cdbom_m.destroy
call super::destroy
destroy(this.gb_6)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.tab_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_5.SetTransObject(SQLCA)
dw_3.VISIBLE = FALSE
dw_4.VISIBLE = FALSE
dw_5.VISIBLE = FALSE

dw_2.getchild('component',idwc_item)
gs_ds_itemall.ShareData(idwc_item)
idwc_item.setsort("item_no A")
idwc_item.SORT()

dw_2.getchild('component_qa',idwc_qa)
idwc_qa.settransobject(sqlca)
idwc_qa.insertrow(1)
is_select = idwc_qa.Describe("DataWindow.Table.Select")

tv1 =  tab_1.tabpage_1.tv_1
end event

type pb_save from w_inheritance`pb_save within w_cdbom_m
integer x = 3054
integer y = 48
end type

event pb_save::clicked;integer li_array[20]
string ls_assy, ls_assy_qa, ls_Comp, ls_comp_qa, ls_setnull, ls_Compname, ls_Source
TreeViewItem ltv_Item
long ll_curhandle, ll_childhandle, ll_inserthandle,ll_roothandle
long ll_row, ll_cnt, ll_rowcount, k
DECIMAL ld_Qpa, ld_Yield
DATEtime ldt_Effectivity, ldt_Obsolete

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_2.accepttext()
if not wf_nullchk(dw_2) then
	return
end if

// delete from bomtran
dw_4.reset()
FOR k = 1 TO dw_2.DeletedCount()
	ls_assy = trim(dw_2.GetItemString( k, "assembly", Delete!, FALSE ))
	ls_assy_qa   = trim(dw_2.GetItemString( k, "assembly_qa", Delete!, FALSE ))
	ls_Comp = trim(dw_2.GetItemString( k, "component", Delete!, FALSE ))
	ls_comp_qa   = trim(dw_2.GetItemString( k, "component_qa", Delete!, FALSE ))
	
	IF NOT wf_deletebomtran( ls_assy, ls_assy_qa, ls_Comp, ls_comp_qa ) THEN
		rollback;
		messagebox("오류",'bomtran DELETE중 ' + string(k) + ' 번째물품에서 오류가 발생하였습니다.')
		dw_2.retrieve(is_itemno,is_qa1)
		RETURN
	end if
NEXT

// update bom
IF dw_2.Update( TRUE, FALSE ) <> 1 THEN
	rollback;
	RETURN
end if

// add & update bomtran
ll_cnt = 0
dw_3.reset()
ll_rowcount = dw_2.rowcount()
for k = 1 to ll_rowcount
	ls_assy = trim(dw_2.object.assembly[k])
	ls_assy_qa   = trim(dw_2.object.assembly_qa[k])
	ls_Comp = trim(dw_2.object.component[k])
	ls_comp_qa   = trim(dw_2.object.component_qa[k])
	CHOOSE CASE dw_2.GetItemStatus(k, 0, Primary!)
		CASE newmodified!
			ll_cnt++
			li_array[ll_cnt] = k
			if not wf_insertbomtran(ls_assy, ls_assy_qa, ls_Comp, ls_comp_qa, k ) then
				rollback;
				messagebox("에라", 'bomtran INSERT중 ' + string(k) + ' 번째물품에서 오류가 발생하였습니다')
				return
			end if
		CASE DataModified!
			// update bomtran
			ld_Qpa = dw_2.Object.qpa[k]
			ld_Yield = dw_2.Object.yield[k]
			ldt_Effectivity = dw_2.Object.effectivity[k]
			ldt_Obsolete = dw_2.Object.obsolete[k]
			
			UPDATE bomtran SET qpa = :ld_Qpa, yield = :ld_Yield, effectivity = :ldt_Effectivity, obsolete = :ldt_Obsolete
			 WHERE assembly = :ls_assy
				AND assy_qa = :ls_assy_qa
				AND component = :ls_Comp
				AND comp_qa = :ls_Comp_qa;
			
			IF SQLCA.SQLCode < 0 THEN
				rollback;
				messagebox("에라", 'bomtran UPDATE중 ' + string(k) + ' 번째물품에서 오류가 발생하였습니다')
				RETURN
			end if
			
	END CHOOSE
next

commit;
dw_2.resetupdate()
messagebox("저장",'저장이 완료되습니다')

ll_curhandle = tv1.FindItem(CurrentTreeItem! , 0)
ll_childhandle = tv1.finditem(ChildTreeItem!, ll_curhandle)
tv1.getitem(ll_curhandle , ltv_item)
tv1.setredraw(false)
for k = 1 to ll_cnt
	 ll_row = li_array[k]
	 ls_Comp = trim(dw_2.object.component[ll_row])
	 ls_comp_qa   = trim(dw_2.object.component_qa[ll_row])
	 ls_Compname = trim(dw_2.object.groupitem_item_name[ll_row])
	 ls_source = trim(dw_2.object.groupitem_source[ll_row])
	 IF ls_source = "M" THEN
		 ltv_Item.PictureIndex = 2
		 ltv_Item.SelectedPictureIndex = 2
	 ELSE
		 ltv_Item.PictureIndex = 3
		 ltv_Item.SelectedPictureIndex = 3
	 END IF		 
	 ltv_Item.Label = ls_Comp + "," + ls_comp_qa + "," + ls_Compname
	 ll_inserthandle = tv1.InsertItemlast( ll_curhandle, ltv_Item )		 
next
ll_roothandle = tv1.FindItem( RootTreeItem!, 0 )
tv1.ExpandAll( ll_roothandle)
tv1.setredraw(true)
tv1.setfocus()
if dw_2.rowcount() > 0 then
	if dw_1.object.bom_assembly_qa[dw_1.getrow()] = '' &
		or isnull(dw_1.object.bom_assembly_qa[dw_1.getrow()]) then
		dw_1.object.bom_assembly_qa[dw_1.getrow()] = 'NEW'
	end if
else
	setnull(ls_setnull)
	dw_1.object.bom_assembly_qa[dw_1.getrow()] = ls_setnull
end if



end event

type dw_1 from w_inheritance`dw_1 within w_cdbom_m
integer x = 18
integer y = 320
integer width = 1851
integer height = 1080
integer taborder = 80
string dataobject = "d_cdbom_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row, ll_foundrow
integer  li_chk

ll_row = dw_1.GETROW()
if ll_row < 1 then
	return
end if
dw_2.Accepttext()

is_itemno = this.object.item_no[ll_row]
is_qa1 = this.object.qa1[ll_row]
dw_2.retrieve(is_itemno,is_qa1)
wf_MakeOneLevelBOM( is_itemno, is_qa1)
tv1.setfocus()

end event

event dw_1::doubleclicked;long ll_row

if this.rowcount() < 1 then return
ll_row = row
this.SelectRow(ll_row, NOT this.IsSelected(ll_row))
end event

event dw_1::clicked;if row < 0 then return
this.scrolltorow(row)
end event

type st_title from w_inheritance`st_title within w_cdbom_m
integer y = 48
integer width = 1147
long textcolor = 65535
long backcolor = 8388608
string text = "B.O.M 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdbom_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbom_m
integer x = 1641
integer y = 40
integer taborder = 130
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "복사"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"복사",parent, li_x, li_y)

end event

event pb_compute::clicked;call super::clicked;//
end event

type pb_print_part from w_inheritance`pb_print_part within w_cdbom_m
integer x = 1847
integer y = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "붙여넣기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"붙여넣기",parent, li_x, li_y)

end event

event pb_print_part::clicked;call super::clicked;//
end event

type pb_close from w_inheritance`pb_close within w_cdbom_m
integer x = 3246
integer y = 48
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbom_m
event ue_customer pbm_custom01
integer x = 2862
integer y = 48
integer taborder = 160
end type

event pb_print::ue_customer;POINTER lp_Old
string ls_component, ls_component_qa
int li_currentrow = 0, n
int li_count
decimal{6} ld_acceptqty, ld_needqty

lp_Old = SetPointer( HourGlass! )
dw_5.SetRedraw( FALSE )

dw_5.reset()
li_count = dw_4.retrieve(is_itemno,is_qa1)
//ld_acceptqty = ii_qpa
ld_acceptqty = 1
// ii_qpa : 조립품의 필요수량.

ii_level = 1
FOR n = 1 TO li_count
	ls_component = dw_4.getitemstring(n, "component")
	ls_component_qa = dw_4.getitemstring(n, "component_qa")
	ld_needqty = dw_4.getitemdecimal(n,"qpa") * ld_acceptqty 
	wf_display(N, ld_needqty)
	IF li_count > 0 THEN
		ld_needqty = dw_4.getitemdecimal(n,"qpa") * ld_acceptqty
		WF_calcbom_qty(ls_component,ls_component_qa, ld_needqty)
	END IF
	li_count = dw_4.retrieve(is_itemno, is_qa1)
	//ld_acceptqty = ii_qpa
	ld_acceptqty = 1
NEXT

dw_5.SetRedraw( TRUE )
SetPointer( lp_Old )

end event

event pb_print::clicked;w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_itemselect_str lstr_print

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

IF dw_1.getrow() <= 0 THEN
   RETURN
END IF
this.triggerevent("ue_customer")

//ls_where = " and item.item_no = rout.item_no " &
//			+ " and item.qa = rout.qa " &
//         + " ORDER BY item.item_no ASC,item.qa ASC, rout.operation "
//ls_sql = "datawindow.table.select='" + is_dw1sql + ls_where + "'"
////messagebox("",ls_sql)
//
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//


i_print.st_datawindow = dw_5
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 제품별 BOM내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=110'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdbom_m
boolean visible = false
integer x = 2153
integer y = 56
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_cdbom_m
integer x = 2674
integer y = 48
integer width = 183
integer taborder = 180
end type

event pb_delete::clicked;TreeViewItem ltv_Item
STRING ls_ItemNo, ls_qa1, ls_FindCond, ls_treelabel,ls_itemname
long ll_row, ll_cnt, ll_CurItem

ll_row = dw_2.getrow()
if ll_row <= 0 then return

ls_itemno   = trim(dw_2.object.component[ll_row])
ls_qa1      = trim(dw_2.object.component_qa[ll_row])
ls_itemname = trim(dw_2.object.groupitem_item_name[ll_row])

ls_findcond = ls_itemno + "," + ls_qa1 +  "," + ls_itemname

ll_curitem = wf_searchtree(ls_findcond)
tv1.DeleteItem(ll_CurItem)
dw_2.deleterow(ll_row)

end event

type pb_insert from w_inheritance`pb_insert within w_cdbom_m
integer x = 2487
integer y = 48
integer width = 183
integer taborder = 200
string text = " "
end type

event pb_insert::clicked;long ll_row 
TreeViewItem ltv_Item
INT ll_Count, lh_Item
STRING ls_item, ls_qa
long ll_handle

ll_handle = tv1.FindItem(CurrentTreeItem! , 0)
tv1.getitem(ll_handle , ltv_item)
ls_item = MidA(ltv_Item.Label,1,10)
ls_qa = trim(MidA(ltv_Item.Label,12,19))

if dw_2.rowcount() < 1 then
	dw_2.retrieve(ls_item,ls_qa)
end if



ll_row = dw_2.insertrow(0)
dw_2.SetItem(ll_row, "assembly", ls_item) 
dw_2.SetItem(ll_row, "assembly_qa", ls_qa) 
dw_2.SetItem(ll_row, "sequence", ll_row) 
dw_2.SetItem(ll_row, "effectivity", datetime(wf_today()))
dw_2.SetItem(ll_row, "yield", "1") 
dw_2.SetItem(ll_row, "obsolete", datetime(date("2050/01/01")))
//dw_2.SetItem(ll_row, "currenthandle", 0)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbom_m
integer x = 2295
integer y = 48
integer taborder = 190
end type

event pb_retrieve::clicked;call super::clicked;string ls_str,ls_filter

if trim(sle_1.text) = '%' or trim(sle_1.text) = '' or isnull(sle_1.text) then
   ls_str = '%'	
else
	ls_str = trim(sle_1.text) + '%'
end if

//ls_filter= "item_no like '" + ls_str + "'"
//dw_1.SetFilter(ls_filter)
//dw_1.Filter( )
dw_1.retrieve(ls_str)

end event

type gb_3 from w_inheritance`gb_3 within w_cdbom_m
integer x = 5
integer y = 1424
integer width = 3611
integer height = 588
integer taborder = 110
integer textsize = -10
long textcolor = 16711680
string text = "구성물품"
end type

type gb_2 from w_inheritance`gb_2 within w_cdbom_m
integer x = 9
integer y = 188
integer width = 1874
integer height = 1232
integer taborder = 120
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdbom_m
integer x = 2249
integer y = 8
integer width = 1221
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_cdbom_m
integer x = 37
integer y = 1476
integer width = 3552
integer height = 516
integer taborder = 90
string dataobject = "d_cdbom_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemchanged;string ls_data
long ll_row

this.accepttext()
ll_row = this.getrow()

choose case dwo.name
	case 'component'
		 if idwc_item.rowcount() < 1 then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 setnull(ls_data)
			 this.object.component[row] = ls_data
			 
			 return 1
		 end if
		 if trim(data) <> trim(idwc_item.getitemstring(idwc_item.getrow(),'item_no')) then
			 MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			 return 1
		 end if
		 this.object.groupitem_uom[row] = idwc_item.getitemstring(idwc_item.getrow(),"uom")
		 this.object.groupitem_source[row] = idwc_item.getitemstring(idwc_item.getrow(),"source")
		 this.object.groupitem_item_name[row] = idwc_item.getitemstring(idwc_item.getrow(),"item_name")
		 is_clause = " where item_no = ~~'" + trim(data) + "~~'" 
//&
//				+ " AND source <> ~~'W~~' "
		 is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
       idwc_qa.Modify(is_where)
		 idwc_qa.settransobject(sqlca)
		 idwc_qa.retrieve()
		 setnull(ls_data)
		 this.object.component_qa[row] = ls_data
	case 'component_qa'
		is_itemno = trim(this.object.component[row])
		is_qa1 = trim(this.object.component_qa[row])
end choose

end event

event dw_2::itemerror;call super::itemerror;string ls_data,ls_item

setnull(ls_data)
choose case dwo.name
	case 'component'
        this.object.component[row] = ls_data
	case 'component_qa'
		  this.object.component_qa[row] = ls_data
end choose

return 2
end event

event dw_2::rowfocuschanged;long ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row <= 0 then
	return
end if
if trim(this.object.component[ll_row]) = '' or isnull(this.object.component[ll_row]) then
	return
end if
is_clause = " where item_no = ~~'" + trim(this.object.component[ll_row]) + "~~'"
//&
//				+ " AND source <> ~~'W~~' "
is_where = "DataWindow.Table.Select='"  + is_select + is_clause + "'"
idwc_qa.Modify(is_where)
idwc_qa.settransobject(sqlca)
idwc_qa.retrieve()




end event

type gb_6 from groupbox within w_cdbom_m
boolean visible = false
integer x = 1920
integer y = 16
integer width = 654
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type dw_3 from datawindow within w_cdbom_m
integer x = 1221
integer y = 12
integer width = 64
integer height = 64
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_cdbomtran_h"
end type

type dw_4 from datawindow within w_cdbom_m
integer x = 1312
integer y = 12
integer width = 69
integer height = 64
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_cdbom_h"
boolean livescroll = true
end type

type dw_5 from datawindow within w_cdbom_m
integer x = 1408
integer y = 12
integer width = 69
integer height = 64
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdbom_r"
boolean livescroll = true
end type

type sle_1 from singlelineedit within w_cdbom_m
integer x = 215
integer y = 228
integer width = 1568
integer height = 80
integer taborder = 140
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

type st_1 from statictext within w_cdbom_m
integer x = 69
integer y = 244
integer width = 142
integer height = 68
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
string text = "검색"
alignment alignment = right!
boolean focusrectangle = false
end type

type tab_1 from tab within w_cdbom_m
integer x = 1893
integer y = 204
integer width = 1733
integer height = 1220
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 1696
integer height = 1108
long backcolor = 79741120
string text = "B O M"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
tv_1 tv_1
end type

on tabpage_1.create
this.tv_1=create tv_1
this.Control[]={this.tv_1}
end on

on tabpage_1.destroy
destroy(this.tv_1)
end on

type tv_1 from treeview within tabpage_1
integer y = 4
integer width = 1696
integer height = 1112
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string picturename[] = {"Library!","Structure5!","UserObject5!","UserObject!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

event clicked;// picture를 3개 지정해야함. 1 : 완제품, 2 : 반제품, 3 : 자재
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_component_qa, ls_Source,ls_compqa,ls_itemname
long ll_curhandle, ll_foundrow, ll_childhandle, ll_inserthandle


ll_curhandle = tv1.FindItem(CurrentTreeItem! , 0)
ll_childhandle = tv1.finditem(ChildTreeItem!, ll_curhandle)


if ll_childhandle > 0 then
	tv1.getitem(ll_curhandle , ltv_item)
	ls_component = MidA(ltv_Item.Label,1,10)
	ls_component_qa = trim(MidA(ltv_Item.Label,12,19))
	dw_2.retrieve(ls_component,ls_component_qa)
	tv1.setfocus()
	return
end if
tv1.getitem(ll_curhandle , ltv_item)
ls_component = MidA(ltv_Item.Label,1,10)
ls_component_qa = trim(MidA(ltv_Item.Label,12,19))
dw_2.retrieve(ls_component,ls_component_qa)
dw_4.retrieve(ls_component,ls_component_qa)
FOR ll_row = 1 TO dw_4.rowcount()
	IF dw_4.object.item_source[ll_row] = "M" THEN
		ltv_Item.PictureIndex = 2; ltv_Item.SelectedPictureIndex = 2
	ELSE
		ltv_Item.PictureIndex = 3; ltv_Item.SelectedPictureIndex = 3
	END IF
	ls_component = trim(dw_4.object.Component[ll_row])
	ls_compqa = trim(dw_4.object.component_qa[ll_row])
	select item_name into :ls_itemname from groupitem where item_no = :ls_component;
	ltv_Item.Label = ls_component + "," + ls_compqa + "," + ls_itemname
	ll_inserthandle = tv1.InsertItemlast( ll_curhandle, ltv_Item )
NEXT
tv1.setfocus()
end event

event selectionchanged;// picture를 3개 지정해야함. 1 : 완제품, 2 : 반제품, 3 : 자재
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_component_qa, ls_Source,ls_compqa,ls_itemname
long ll_curhandle, ll_foundrow, ll_childhandle, ll_inserthandle

ll_curhandle = tv1.FindItem(CurrentTreeItem! , 0)

tv1.getitem(ll_curhandle , ltv_item)
ls_component = MidA(ltv_Item.Label,1,10)
ls_component_qa = trim(MidA(ltv_Item.Label,12,19))

dw_2.retrieve(ls_component,ls_component_qa)

end event

event doubleclicked;// picture를 3개 지정해야함. 1 : 완제품, 2 : 반제품, 3 : 자재
TreeViewItem ltv_Item
INT ll_Count, lh_Item, ll_row
STRING ls_Component, ls_component_qa, ls_Source,ls_compqa,ls_itemname
long ll_curhandle, ll_foundrow, ll_childhandle, ll_inserthandle


ll_curhandle = tv1.FindItem(CurrentTreeItem! , 0)
ll_childhandle = tv1.finditem(ChildTreeItem!, ll_curhandle)


if ll_childhandle > 0 then
	tv1.getitem(ll_curhandle , ltv_item)
	ls_component = MidA(ltv_Item.Label,1,10)
	ls_component_qa = trim(MidA(ltv_Item.Label,12,19))
	dw_2.retrieve(ls_component,ls_component_qa)
	tv1.setfocus()
	return
end if
tv1.getitem(ll_curhandle , ltv_item)
ls_component = MidA(ltv_Item.Label,1,10)
ls_component_qa = trim(MidA(ltv_Item.Label,12,19))
dw_2.retrieve(ls_component,ls_component_qa)
dw_4.retrieve(ls_component,ls_component_qa)
FOR ll_row = 1 TO dw_4.rowcount()
	IF dw_4.object.item_source[ll_row] = "M" THEN
		ltv_Item.PictureIndex = 2; ltv_Item.SelectedPictureIndex = 2
	ELSE
		ltv_Item.PictureIndex = 3; ltv_Item.SelectedPictureIndex = 3
	END IF
	ls_component = trim(dw_4.object.Component[ll_row])
	ls_compqa = trim(dw_4.object.component_qa[ll_row])
	select item_name into :ls_itemname from groupitem where item_no = :ls_component;
	ltv_Item.Label = ls_component + "," + ls_compqa + "," + ls_itemname
	ll_inserthandle = tv1.InsertItemlast( ll_curhandle, ltv_Item )
NEXT
tv1.setfocus()
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 96
integer width = 1696
integer height = 1108
long backcolor = 79741120
string text = "품  목"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_2.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_2.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_2
integer y = 4
integer width = 1696
integer height = 1108
integer taborder = 80
string title = "none"
string dataobject = "d_cdbom_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

