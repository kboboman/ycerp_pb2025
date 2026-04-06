$PBExportHeader$w_com_resource.srw
$PBExportComments$전산자산 관리(2020/06/13,김보길)
forward
global type w_com_resource from w_inheritance2
end type
type st_4 from statictext within w_com_resource
end type
type ddlb_fld from dropdownlistbox within w_com_resource
end type
type ddlb_dwtitles from dropdownlistbox within w_com_resource
end type
type st_6 from statictext within w_com_resource
end type
type sle_value from singlelineedit within w_com_resource
end type
type cbx_op from checkbox within w_com_resource
end type
type cb_4 from commandbutton within w_com_resource
end type
type cb_6 from commandbutton within w_com_resource
end type
type cb_7 from commandbutton within w_com_resource
end type
type cb_8 from commandbutton within w_com_resource
end type
type st_vertical from u_splitbar_vertical within w_com_resource
end type
type ddlb_op from dropdownlistbox within w_com_resource
end type
type p_photo from picture within w_com_resource
end type
type cb_upload from commandbutton within w_com_resource
end type
type dw_cond from u_datawindow within w_com_resource
end type
type dw_3 from u_datawindow within w_com_resource
end type
type cb_insert_user from commandbutton within w_com_resource
end type
type cb_delete_user from commandbutton within w_com_resource
end type
type cb_1 from commandbutton within w_com_resource
end type
type dw_0 from u_datawindow within w_com_resource
end type
type cb_2 from commandbutton within w_com_resource
end type
end forward

global type w_com_resource from w_inheritance2
integer x = 320
integer y = 552
integer width = 5678
integer height = 6044
string title = "전산자산 관리(w_com_resource)"
long backcolor = 79416533
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cbx_op cbx_op
cb_4 cb_4
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
st_vertical st_vertical
ddlb_op ddlb_op
p_photo p_photo
cb_upload cb_upload
dw_cond dw_cond
dw_3 dw_3
cb_insert_user cb_insert_user
cb_delete_user cb_delete_user
cb_1 cb_1
dw_0 dw_0
cb_2 cb_2
end type
global w_com_resource w_com_resource

type variables
st_print i_print
string   is_dw, is_sql
boolean  ib_check = true

long    	idw_w, idw_h
long    	ih_curteam
integer 	ii_chk = 0
string	is_chk = 'N'
TreeViewitem itv_team

string	is_management_no	//관리번호

end variables

forward prototypes
public subroutine wf_filter ()
public function integer wf_set_dddw ()
public function integer wf_get_photo (string as_management_no)
end prototypes

public subroutine wf_filter ();
end subroutine

public function integer wf_set_dddw ();//dw_cond
dw_cond.setitem(1, 'affiliate_type', '%')
dw_cond.setitem(1, 'device_nm', '%')
dw_cond.setitem(1, 'maker_nm', '%')
dw_cond.setitem(1, 'area', '%')
dw_cond.setitem(1, 'state_m', '%')
dw_cond.setitem(1, 'state_d', '%')

gf_dddw_detl_cd(dw_cond, 'affiliate_type', 'A008', '%')
gf_dddw_detl_cd(dw_cond, 'device_nm', 'A001', '%')
gf_dddw_detl_cd(dw_cond, 'maker_nm', 'A004', '%')
gf_dddw_detl_cd(dw_cond, 'area', 'A009', '%')
gf_dddw_detl_cd(dw_cond, 'state_m', 'A002', '%')
gf_dddw_detl_cd(dw_cond, 'state_d', 'A003', '%')

//dw_0
gf_dddw_detl_cd(dw_0, 'area', 'A009', '')
//dw_1
gf_dddw_detl_cd(dw_1, 'affiliate_type', 'A008', '')
gf_dddw_detl_cd(dw_1, 'device_nm', 'A001', '')
gf_dddw_detl_cd(dw_1, 'maker_nm', 'A004', '')
gf_dddw_detl_cd(dw_1, 'os_type', 'A005', '')
gf_dddw_detl_cd(dw_1, 'license_type', 'A007', '')
gf_dddw_detl_cd(dw_1, 'db_info', 'A006', '')
gf_dddw_detl_cd(dw_1, 'state_m', 'A002', '')
gf_dddw_detl_cd(dw_1, 'state_d', 'A003', '')
gf_dddw_detl_cd(dw_1, 'area', 'A009', '')

//dw_2
gf_dddw_detl_cd(dw_2, 'affiliate_type', 'A008', '')
gf_dddw_detl_cd(dw_2, 'device_nm', 'A001', '')
gf_dddw_detl_cd(dw_2, 'maker_nm', 'A004', '')
gf_dddw_detl_cd(dw_2, 'os_type', 'A005', '')
gf_dddw_detl_cd(dw_2, 'license_type', 'A007', '')
gf_dddw_detl_cd(dw_2, 'db_info', 'A006', '')
gf_dddw_detl_cd(dw_2, 'state_m', 'A002', '')
gf_dddw_detl_cd(dw_2, 'state_d', 'A003', '')
gf_dddw_detl_cd(dw_2, 'area', 'A009', '')

return 1
end function

public function integer wf_get_photo (string as_management_no);string   ls_path
blob     lb_image, lb_temp
long     ll_filelen, ll_ret
integer  li_loop, i, li_file

p_photo.PictureName = Space(1)

ls_path	= GetCurrentDirectory() + '\' + 'tempPic.jpg'
FileDelete(ls_path)

selectblob 
	photo 
into 
	:lb_image 
from 
	yc_com_resource 
where 
	management_no = :as_management_no
using sqlca;

IF SQLCA.SQLCode = -1 THEN         
	MessageBox("SQL error", SQLCA.SQLErrText)
END IF

ll_filelen = LenA(lb_image)
if ll_filelen < 5 then return 1	//이미지 유무 체크
if ll_filelen > 32765 then
	if mod(ll_filelen,32765) = 0 then
		li_loop = ll_filelen / 32765
	else
		li_loop = (ll_filelen/32765) + 1
	end if
else
	li_loop = 1
end if

li_file = FileOpen(ls_path, StreamMode!, Write!, Shared!, Append!)

for i = 1 to li_loop
	if i = li_loop then
		lb_temp = BlobMid(lb_image, (i - 1) * 32765 + 1)
	else
		lb_temp = BlobMid(lb_image, (i - 1) * 32765 + 1,32765)
	end if
	
	FileWrite(li_file, lb_temp)
next
Fileclose(li_file)
p_photo.PictureName = ls_path	

return 1
end function

on w_com_resource.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_4=create cb_4
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.p_photo=create p_photo
this.cb_upload=create cb_upload
this.dw_cond=create dw_cond
this.dw_3=create dw_3
this.cb_insert_user=create cb_insert_user
this.cb_delete_user=create cb_delete_user
this.cb_1=create cb_1
this.dw_0=create dw_0
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cbx_op
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_6
this.Control[iCurrent+9]=this.cb_7
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.st_vertical
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.p_photo
this.Control[iCurrent+14]=this.cb_upload
this.Control[iCurrent+15]=this.dw_cond
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.cb_insert_user
this.Control[iCurrent+18]=this.cb_delete_user
this.Control[iCurrent+19]=this.cb_1
this.Control[iCurrent+20]=this.dw_0
this.Control[iCurrent+21]=this.cb_2
end on

on w_com_resource.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_4)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.p_photo)
destroy(this.cb_upload)
destroy(this.dw_cond)
destroy(this.dw_3)
destroy(this.cb_insert_user)
destroy(this.cb_delete_user)
destroy(this.cb_1)
destroy(this.dw_0)
destroy(this.cb_2)
end on

event resize;call super::resize;//gb_1.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.width  = newwidth  - dw_2.x - gb_2.x
dw_2.height = 1150//1072//newheight - dw_2.y - gb_2.x

dw_3.width  = newwidth  - dw_3.x - gb_2.x
dw_3.height = 744//newheight - dw_2.y - gb_2.x

idw_w       = dw_2.width
idw_h       = dw_2.height

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
//st_vertical.of_set_leftobject(dw_1)
//st_vertical.of_set_rightobject(dw_2)
//st_vertical.of_set_rightobject(cb_upload)
//st_vertical.of_set_rightobject(p_photo)
//st_vertical.of_set_minsize(250, 250)
//////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

//dddw 자동 셋팅
wf_set_dddw()
dw_cond.setitem(1, 'date_fr', '20150101')
dw_cond.setitem(1, 'date_to', gf_today2s())
dw_cond.setitem(1, 'gubun'	 , '1')

this.postevent('we_retrieve')

end event

event we_retrieve;call super::we_retrieve;String	ls_type, ls_itemcd, ls_use
long		ll_ret
string	ls_dt_fr, ls_dt_to,ls_affiliate_type,ls_device_nm,ls_maker_nm
string	ls_area,ls_user_nm,ls_state_m, ls_state_d

//dw_1.SetFilter("")
//dw_1.Filter()
p_photo.PictureName = Space(1)
is_management_no	= ''	//관리번호		
dw_1.reset()
dw_2.reset()
dw_3.reset()

if dw_cond.accepttext( ) = -1 then return -1
ls_dt_fr				= dw_cond.getitemstring(1, 'date_fr')
ls_dt_to				= dw_cond.getitemstring(1, 'date_to')
ls_affiliate_type	= dw_cond.getitemstring(1, 'affiliate_type')
ls_device_nm		= dw_cond.getitemstring(1, 'device_nm')
ls_maker_nm			= dw_cond.getitemstring(1, 'maker_nm')
ls_user_nm			= dw_cond.getitemstring(1, 'user_nm')
ls_state_m			= dw_cond.getitemstring(1, 'state_m')
ls_state_d			= dw_cond.getitemstring(1, 'state_d')
ls_area				= dw_cond.getitemstring(1, 'area')

if gf_null_chk(ls_user_nm) = true then 
	ls_user_nm	= '%'
else
	ls_user_nm	= '%' + ls_user_nm + '%'
end if

ll_ret	= dw_1.Retrieve(ls_dt_fr, ls_dt_to, ls_affiliate_type,ls_device_nm,ls_maker_nm,ls_user_nm,ls_state_m, ls_state_d, ls_area)
Choose Case ll_ret
	Case is > 0
		dw_1.Post Event Clicked(0,0, 1, dw_1.Object.management_no )		
		dw_1.Post SetFocus()
	Case 0
		dw_2.insertrow(0)
		MessageBox("Check", "검색된 자료가 없습니다.")
	Case is < 0
		MessageBox("Error", "검색 Error")
End Choose

return 1
end event

event we_delete;call super::we_delete;long		ll_grow
string	ls_msg, ls_management_no, ls_sqlerrtext

ll_grow = dw_1.getrow()
if ll_grow = 0 then return -1

ls_management_no	= dw_1.getitemstring(ll_grow, 'management_no')
ls_msg	= "선택한 관리번호 : " + ls_management_no + " 삭제하시겠습니까?"
if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return -1
dw_1.deleterow(ll_grow)

//사용자 삭제
delete from yc_com_resource_user
where
	management_no = :ls_management_no
using sqlca;	

if sqlca.sqlcode = -1 then 
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
end if

//저장
Long	ll_rtn
ll_rtn = wf_update_array({dw_1})

If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
end if

return 1
end event

event we_save;call super::we_save;Long	ll_rtn
ll_rtn = wf_update_array({dw_1, dw_2, dw_3})

If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
	this.postevent('we_retrieve')
end if

Return 1
end event

event we_insert;call super::we_insert;Long		ll_row

//wf_uptmodifycheckdw(dw_2)
//wf_uptmodifycheckdw(dw_3)
p_photo.PictureName = Space(1)
dw_2.reset()
dw_2.InsertRow(0)
dw_2.ScrollToRow(ll_row)
dw_2.Post SetFocus()

dw_3.reset()

return 1

end event

event we_saveas;call super::we_saveas;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_1
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	

return 1
end event

type pb_saveas from w_inheritance2`pb_saveas within w_com_resource
integer x = 4951
integer y = 40
end type

type pb_save from w_inheritance2`pb_save within w_com_resource
integer x = 5143
integer y = 40
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_com_resource
integer x = 27
integer y = 468
integer width = 4014
integer height = 1944
string dataobject = "d_com_resource_01"
end type

event dw_1::clicked;call super::clicked;if row = 0 then return

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

Long		ll_ret, ll_rtn

ll_rtn = wf_uptmodifycheckdw(dw_2)

is_management_no	= ''	
is_management_no	= this.GetItemString(row, 'management_no')

dw_2.setredraw(false)
dw_2.post setredraw(true)
ll_ret	= dw_2.Retrieve(is_management_no)

Choose Case ll_ret
	Case is > 0
		//등록된 이미지 불러오기
		wf_get_photo(is_management_no)
		dw_3.retrieve(is_management_no)
	Case 0
		dw_2.insertrow(0)
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

type st_title from w_inheritance2`st_title within w_com_resource
integer x = 32
integer y = 24
integer width = 1152
integer height = 140
string text = "전산자산 관리"
end type

type st_tips from w_inheritance2`st_tips within w_com_resource
integer x = 5275
integer y = 908
end type

type pb_compute from w_inheritance2`pb_compute within w_com_resource
boolean visible = false
integer x = 5275
integer y = 1072
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_com_resource
boolean visible = false
integer x = 5696
integer y = 1072
end type

type pb_close from w_inheritance2`pb_close within w_com_resource
integer x = 5335
integer y = 40
integer taborder = 100
end type

type pb_print from w_inheritance2`pb_print within w_com_resource
boolean visible = false
integer x = 5906
integer y = 1064
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 은행코드를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance2`pb_cancel within w_com_resource
boolean visible = false
integer x = 5481
integer y = 1072
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_com_resource
integer x = 4759
integer y = 40
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_com_resource
integer x = 4567
integer y = 40
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_com_resource
integer x = 4375
integer y = 40
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_com_resource
boolean visible = false
integer x = 5911
integer y = 1192
integer width = 101
integer height = 100
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_com_resource
integer x = 27
integer y = 268
integer width = 5513
integer height = 188
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_com_resource
integer x = 4357
integer y = 0
integer width = 1193
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_com_resource
integer x = 4087
integer y = 468
integer width = 1463
integer height = 1168
integer taborder = 60
string dataobject = "d_com_resource_02"
boolean hscrollbar = true
boolean vscrollbar = false
end type

event dw_2::updatestart;call super::updatestart;Long		ll_rcnt, ll_row
dwitemstatus	 ldwstatus
string	ls_temp
long		ll_no

ll_rcnt			= this.rowcount()
Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
			choose case ldwstatus
				Case NewModified!
					//관리번호 생성
					ls_temp	= LeftA(gf_today2s(),6)					
					select
						isnull(max(convert(int,right(management_no,4))),0) + 1
					into
						:ll_no
					from 
						yc_com_resource
					where
						left(management_no,6) = :ls_temp
					using sqlca;
					
					is_management_no	= ls_temp + string(ll_no,'0000')
					
					this.setitem(ll_row, 'management_no', is_management_no)
					this.setItem(ll_row, 'input_user', gs_userid)
					this.setItem(ll_row, 'input_date', gf_today2s())
				Case DataModified!
					this.setItem(ll_row, 'update_user', gs_userid)
					this.setItem(ll_row, 'update_date', gf_today2s())
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event dw_2::we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0
String	ls_temp
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		
		//사용자 등록 여부 확인
		if dw_3.rowcount() = 0 then
			messagebox("확인","사용자를 등록하세요.")
			return -1
		end if		
		
		ls_temp	= this.getitemstring(ll_row, 'affiliate_type')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "관리그룹을 입력하세요.")
			return -1
		end if
		
		ls_temp = this.getItemString(ll_row, 'device_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "기기명을 입력하세요. ")
			Return -1
		End IF
		
		ls_temp = this.getItemString(ll_row, 'maker_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "제조회사를 입력하세요. ")
			Return -1
		End IF
		
		ls_temp = this.getItemString(ll_row, 'maker_no')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "제조번호를 입력하세요. ")
			Return -1
		End IF		
		
		ls_temp = this.getItemString(ll_row, 'model_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "모델명을 입력하세요. ")
			Return -1
		End IF		
		
		ls_temp = this.getItemString(ll_row, 'area')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "현장 정보를 입력하세요. ")
			Return -1
		End IF				
//		
//		if len(ls_temp) <> 8 then
//			Messagebox("확인", "불출일자는 8자리 입니다. ")
//			Return -1
//		end if		
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

type st_4 from statictext within w_com_resource
integer x = 82
integer y = 348
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

type ddlb_fld from dropdownlistbox within w_com_resource
integer x = 270
integer y = 332
integer width = 443
integer height = 632
integer taborder = 100
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
end type

type ddlb_dwtitles from dropdownlistbox within w_com_resource
integer x = 270
integer y = 332
integer width = 311
integer height = 88
integer taborder = 110
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
end type

type st_6 from statictext within w_com_resource
integer x = 741
integer y = 348
integer width = 165
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

type sle_value from singlelineedit within w_com_resource
integer x = 1230
integer y = 336
integer width = 539
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_com_resource
integer x = 1783
integer y = 344
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_4 from commandbutton within w_com_resource
integer x = 1989
integer y = 336
integer width = 160
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

integer    li_ret
string     ls_column, ls_value, ls_col, ls_type, ls_op
ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_6 from commandbutton within w_com_resource
integer x = 2153
integer y = 336
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_7 from commandbutton within w_com_resource
integer x = 2318
integer y = 336
integer width = 160
integer height = 76
integer taborder = 110
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_8 from commandbutton within w_com_resource
integer x = 2482
integer y = 336
integer width = 160
integer height = 76
integer taborder = 120
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_com_resource
integer x = 4059
integer y = 464
integer height = 1944
end type

type ddlb_op from dropdownlistbox within w_com_resource
integer x = 914
integer y = 332
integer width = 306
integer height = 500
integer taborder = 100
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type p_photo from picture within w_com_resource
boolean visible = false
integer x = 4087
integer y = 2520
integer width = 832
integer height = 824
boolean bringtotop = true
boolean originalsize = true
boolean border = true
boolean focusrectangle = false
end type

type cb_upload from commandbutton within w_com_resource
boolean visible = false
integer x = 4087
integer y = 2420
integer width = 475
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "이미지 Upload"
end type

event clicked;string	ls_management_no, ls_SQLErrText
blob		lb_temp, lb_tot
integer	li_filenum, li_index, li_loop
String	ls_file, ls_filename, ls_emp_cd, ls_path
long	ll_filelen, ll_read, ll_rowcnt, i, ll_cnt


ls_management_no	= 	dw_2.getitemstring(1, 'management_no')
if gf_null_chk(ls_management_no) = true then
	messagebox("확인","전산 자원을 저장 후 진행하세요.")
	return -1
end if

//if GetFileOpenName("Graphic Files",ls_file,ls_filename,"JPG","Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg),*.bmp;*.gif;*.jpg;*.jpeg") = 1 then	
if GetFileOpenName("Graphic Files",ls_file,ls_filename,"JPG","Graphic Files (*.jpg),*.jpg") = 1 then		
	ll_filelen = FileLength(ls_file)
	li_filenum = FileOpen(ls_file,StreamMode!,Read!,LockRead!)

	if li_filenum <> -1 then
		if ll_filelen > 32765 then
			if mod(ll_filelen,32765) = 0 then
				li_loop = ll_filelen / 32765
			else
				li_loop = (ll_filelen/32765) + 1
			end if
		else  
			li_loop = 1
		end if

		for li_index = 1 to li_loop
			fileRead(li_filenum,lb_temp)
			lb_tot = lb_tot + lb_temp
		next

		fileclose(li_filenum)
		
		updateblob 
			yc_com_resource 
		set 
			photo				= :lb_tot 
		where 
			management_no	= :ls_management_no
		using sqlca;

		if sqlca.sqlcode = -1 then
			ls_SQLErrText	= SQLCA.SQLErrText
			rollback using sqlca;
			messagebox("update",ls_SQLErrText)
			return -1
		end if					
	end if
	
	commit using sqlca;
	p_photo.setpicture(lb_tot)
	messagebox("확인","등록이 완료됐습니다.")
else
	messagebox("확인","이미지를 등록하지~r못했습니다.")
end if

return 1
end event

type dw_cond from u_datawindow within w_com_resource
integer x = 1239
integer y = 28
integer width = 3090
integer height = 248
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_com_resource_cond"
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event itemchanged;call super::itemchanged;if row = 0 then return

choose case dwo.name
	case 'gubun'
		choose case data
			case '1'		//최종 사용자
				dw_1.dataobject	= 'd_com_resource_01'
			case '2'		//전체 사용자
				dw_1.dataobject	= 'd_com_resource_04'				
		end choose

		post wf_set_dddw()		
		dw_1.settransobject(sqlca)	
		parent.postevent('we_retrieve')
end choose
end event

type dw_3 from u_datawindow within w_com_resource
integer x = 4087
integer y = 1740
integer width = 1463
integer height = 664
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_com_resource_03"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event insertrowend;call super::insertrowend;long	ll_max_seq

ll_max_seq	= this.getitemnumber( 1, 'max_seq') + 1

//this.setitem(row, 'management_no', is_management_no)
this.setitem(row, 'seq', ll_max_seq)


end event

event updatestart;call super::updatestart;Long		ll_rcnt, ll_row 
dwitemstatus	 ldwstatus
string	ls_user_nm, ls_dept_nm, ls_delivery_date, ls_return_date, ls_enter_date

ll_rcnt			= this.rowcount()
Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
			choose case ldwstatus
				Case NewModified!
					this.setItem(ll_row, 'management_no', is_management_no)					
					this.setItem(ll_row, 'input_user', gs_userid)
					this.setItem(ll_row, 'input_date', gf_today2s())
				Case DataModified!
					this.setItem(ll_row, 'update_user', gs_userid)
					this.setItem(ll_row, 'update_date', gf_today2s())
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop

//사용자,부서명 yc_com_resource에 update
ls_user_nm			= this.getitemstring(ll_rcnt, 'user_nm')
ls_dept_nm			= this.getitemstring(ll_rcnt, 'dept_nm')
ls_enter_date		= this.getitemstring(ll_rcnt, 'enter_date')
ls_delivery_date	= this.getitemstring(ll_rcnt, 'delivery_date')
ls_return_date		= this.getitemstring(ll_rcnt, 'return_date')

update
	yc_com_resource
set
	 user_nm = :ls_user_nm
	,dept_nm	= :ls_dept_nm
	,enter_date		= :ls_enter_date
	,delivery_date	= :ls_delivery_date
	,return_date	= :ls_return_date
where
	management_no	= :is_management_no
using sqlca;

string ls_sqlerrtext
if sqlca.sqlcode = -1 then 
	ls_sqlerrtext	= sqlca.sqlerrtext
	messagebox("sql error", ls_sqlerrtext)
	return 1 //Do not perform the update
end if

return 0 //Continue processing
end event

event we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0
String	ls_temp
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		
		ls_temp	= this.getitemstring(ll_row, 'user_nm')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "사용자를 입력하세요.")
			return -1
		end if
		
		ls_temp = this.getItemString(ll_row, 'dept_nm')
		IF gf_null_chk(ls_temp) = true Then
			Messagebox("확인", "부서명을 입력하세요. ")
			Return -1
		End IF
		
//		ls_temp	= this.getitemstring(ll_row, 'delivery_date')
//		if gf_null_chk(ls_temp) = true then
//			messagebox("확인", "불출일자를 입력하세요.")
//			return -1
//		end if		
//		
//		if len(ls_temp) <> 8 then
//			Messagebox("확인", "불출일자는 8자리 입니다. ")
//			Return -1
//		end if				
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

type cb_insert_user from commandbutton within w_com_resource
integer x = 4096
integer y = 1644
integer width = 375
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "사용자추가"
end type

event clicked;//if gf_null_chk(is_management_no)	= true then return -1
dw_3.insertrow(0)

return 1
end event

type cb_delete_user from commandbutton within w_com_resource
integer x = 4480
integer y = 1644
integer width = 375
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "사용자삭제"
end type

event clicked;long	i, ll_rcnt
string	ls_temp

ll_rcnt = dw_3.rowcount()

for i = ll_rcnt to 1 step -1
	ls_temp = dw_3.getitemstring(i, 'chk')
	if ls_temp = 'Y' then
		dw_3.deleterow(i)
	end if
next

return 1
end event

type cb_1 from commandbutton within w_com_resource
integer x = 5088
integer y = 320
integer width = 434
integer height = 116
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "전산자산 복사"
boolean default = true
end type

event clicked;string	ls_management_no, ls_temp, ls_no, ls_dt
long		ll_grow, ll_no

ll_grow = dw_1.getrow()
if ll_grow = 0 then return

ls_management_no	= dw_1.getitemstring(ll_grow, 'management_no')
ls_temp	= '관리번호 : ' + ls_management_no + '를~r~n복사 하시겠습니까?'
if messagebox("확인", ls_temp, exclamation!, okcancel!, 2) = 2 then return

//관리번호 생성
ls_dt		= gf_today2s()
ls_temp	= LeftA(ls_dt,6)					
select
	isnull(max(convert(int,right(management_no,4))),0) + 1
into
	:ll_no
from 
	yc_com_resource
where
	left(management_no,6) = :ls_temp
using sqlca;
ls_no	= ls_temp + string(ll_no,'0000')

insert into	yc_com_resource
	(
	 management_no	 
	,affiliate_type	     
	,device_nm		        
	,maker_nm			         
	,maker_no			          
	,model_nm			         
	,os_type			            
	,license_type	      
	,maker_date		        
	,db_info			             
	,ip_info			              
	,user_nm			           
	,dept_nm			           
	,state_m				    
	,state_d				    
	,enter_date		           
	,delivery_date	     
	,return_date		       
	,disposal_date	    
	,bigo				                 
	,input_date		        
	,input_user		         
	,update_date		      
	,update_user		
	,area					
	,cpu					
	,ram					
	,vga					
	,ssd					
	,hdd				
	)	
select	
	 :ls_no	 
	,affiliate_type	     
	,device_nm		        
	,maker_nm			         
	,maker_no			          
	,model_nm			         
	,os_type			            
	,license_type	      
	,maker_date		        
	,db_info			             
	,ip_info			              
	,''			           
	,''			           
	,state_m				    
	,state_d				    
	,enter_date		           
	,delivery_date	     
	,return_date		       
	,disposal_date	    
	,'전산자산 복사'				                 
	,:ls_dt
	,:gs_userid		         
	,:ls_dt
	,:gs_userid		
	,area					
	,cpu					
	,ram					
	,vga					
	,ssd					
	,hdd						
from
	yc_com_resource
where
	management_no	= :ls_management_no
using sqlca;	

string ls_sqlerrtext
if sqlca.sqlcode = -1 then 
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
end if

commit using sqlca;
ls_temp	= '전산자산 복사를~r~n완료했습니다.'
messagebox("확인", ls_temp)
parent.postevent('we_retrieve')
end event

type dw_0 from u_datawindow within w_com_resource
integer x = 2816
integer y = 300
integer width = 983
integer height = 152
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_com_resource_00"
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.insertrow(0)
end event

type cb_2 from commandbutton within w_com_resource
integer x = 3826
integer y = 320
integer width = 434
integer height = 116
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "현장정보 복사"
boolean default = true
end type

event clicked;string	ls_management_no, ls_temp, ls_area, ls_area_nm
long		i, ll_grow, ll_seq

if dw_0.accepttext( ) = -1 then return
if dw_1.accepttext( ) = -1 then return

ll_grow = dw_1.getrow()
if ll_grow = 0 then return

ls_area		= dw_0.getitemstring(1, 'area')
ls_area_nm	= dw_0.describe("Evaluate('LookupDisplay(area)',1)")

if gf_null_chk(ls_area_nm) then
	messagebox("확인","현장정보를 선택하세요")
	return
end if
ls_temp	= '선택한 관리 번호의 현장정보를~r~n' + ' [ '+ ls_area_nm + ' ]으로 복사 하시겠습니까?'
if messagebox("확인", ls_temp, exclamation!, okcancel!, 2) = 2 then return

ll_seq = 0
for i = 1 to ll_grow
	if dw_1.getitemstring(i, 'chk') = 'N' then continue
	ls_management_no	= dw_1.getitemstring(i, 'management_no')
	update
		yc_com_resource
	set
		area = :ls_area
	where
		management_no	= :ls_management_no
	using
		sqlca;
		
	string ls_sqlerrtext
	if sqlca.sqlcode = -1 then 
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("Update error", ls_sqlerrtext)
		return
	end if
	ll_seq = ll_seq + 1
next	

if ll_seq > 0 then
	commit using sqlca;
	ls_temp	= '현장정보 복사를~r~n완료했습니다.'
	messagebox("확인", ls_temp)
	parent.postevent('we_retrieve')
else
	rollback using sqlca;
	ls_temp	= '선택한 관리 번호가~r~n없습니다.'
	messagebox("확인", ls_temp)	
end if
end event

