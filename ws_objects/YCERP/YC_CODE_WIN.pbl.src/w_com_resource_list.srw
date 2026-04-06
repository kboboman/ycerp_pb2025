$PBExportHeader$w_com_resource_list.srw
$PBExportComments$전산자산 조회(2020/07/01,김보길)
forward
global type w_com_resource_list from w_inheritance2
end type
type st_vertical from u_splitbar_vertical within w_com_resource_list
end type
type dw_cond from u_datawindow within w_com_resource_list
end type
end forward

global type w_com_resource_list from w_inheritance2
integer x = 320
integer y = 552
integer width = 6117
integer height = 7292
string title = "전산자산 관리(w_com_resource)"
long backcolor = 79416533
st_vertical st_vertical
dw_cond dw_cond
end type
global w_com_resource_list w_com_resource_list

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
long		il_grow

end variables

forward prototypes
public subroutine wf_filter ()
public function integer wf_set_dddw ()
end prototypes

public subroutine wf_filter ();
end subroutine

public function integer wf_set_dddw ();//set dddw
gf_dddw_detl_cd(dw_1, 'affiliate_type', 'A008', '')
gf_dddw_detl_cd(dw_1, 'device_nm', 'A001', '')
gf_dddw_detl_cd(dw_1, 'maker_nm', 'A004', '')
gf_dddw_detl_cd(dw_1, 'os_type', 'A005', '')
gf_dddw_detl_cd(dw_1, 'license_type', 'A007', '')
gf_dddw_detl_cd(dw_1, 'db_info', 'A006', '')
gf_dddw_detl_cd(dw_1, 'state_m', 'A002', '')
gf_dddw_detl_cd(dw_1, 'state_d', 'A003', '')

return 1
end function

on w_com_resource_list.create
int iCurrent
call super::create
this.st_vertical=create st_vertical
this.dw_cond=create dw_cond
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_vertical
this.Control[iCurrent+2]=this.dw_cond
end on

on w_com_resource_list.destroy
call super::destroy
destroy(this.st_vertical)
destroy(this.dw_cond)
end on

event resize;call super::resize;dw_1.height = newheight - dw_1.y - st_title.x
dw_1.width  = newwidth

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
dw_1.settransobject(sqlca)
dw_cond.setitem(1, 'gubun', '1')
dw_cond.setitem(1, 'yyyymm', LeftA(gf_today2s(),6))

//dddw
wf_set_dddw()

this.postevent('we_retrieve')

end event

event we_retrieve;call super::we_retrieve;string	ls_yyyymm

if dw_cond.accepttext( ) = -1 then return -1
ls_yyyymm	= dw_cond.getitemstring(1 , 'yyyymm')

dw_1.retrieve(ls_yyyymm )

return 1
end event

event we_delete;call super::we_delete;long		ll_grow
string	ls_msg, ls_management_no, ls_sqlerrtext

ll_grow = dw_1.getrow()
if ll_grow = 0 then return 1

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
	messagebox("sql error", ls_sqlerrtext)
	return -1
end if


//저장
this.postevent("we_save")

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

type pb_saveas from w_inheritance2`pb_saveas within w_com_resource_list
integer x = 5115
integer y = 44
end type

type pb_save from w_inheritance2`pb_save within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_com_resource_list
integer x = 27
integer y = 244
integer width = 5509
integer height = 2624
string dataobject = "d_com_resource_list_01"
end type

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

type st_title from w_inheritance2`st_title within w_com_resource_list
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "전산자산 조회"
end type

type st_tips from w_inheritance2`st_tips within w_com_resource_list
integer x = 5275
integer y = 908
end type

type pb_compute from w_inheritance2`pb_compute within w_com_resource_list
boolean visible = false
integer x = 5275
integer y = 1072
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance2`pb_close within w_com_resource_list
integer x = 5312
integer y = 44
integer taborder = 100
end type

type pb_print from w_inheritance2`pb_print within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
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

type pb_cancel from w_inheritance2`pb_cancel within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_com_resource_list
integer x = 4919
integer y = 44
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_com_resource_list
boolean visible = false
integer x = 5911
integer y = 1192
integer width = 101
integer height = 100
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_com_resource_list
integer x = 1225
integer y = 8
integer width = 4302
integer height = 204
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_com_resource_list
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer taborder = 60
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

type st_vertical from u_splitbar_vertical within w_com_resource_list
boolean visible = false
integer x = 4672
integer y = 464
integer height = 1944
end type

type dw_cond from u_datawindow within w_com_resource_list
integer x = 1239
integer y = 52
integer width = 3584
integer height = 140
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_com_resource_list_cond"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event itemchanged;call super::itemchanged;if row = 0 then return

choose case dwo.name
	case 'gubun'
		if data = '1' then
			dw_1.dataobject = 'd_com_resource_list_01'		
			//dddw
			wf_set_dddw()
		else
			dw_1.dataobject = 'd_com_resource_list_02'		
		end if
end choose
dw_1.settransobject(sqlca)

parent.postevent('we_retrieve')
end event

