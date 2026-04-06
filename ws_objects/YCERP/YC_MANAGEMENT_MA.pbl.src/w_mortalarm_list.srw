$PBExportHeader$w_mortalarm_list.srw
$PBExportComments$담보내역 알람 리스트
forward
global type w_mortalarm_list from w_inheritance2
end type
type st_vertical from u_splitbar_vertical within w_mortalarm_list
end type
type dw_cond from u_datawindow within w_mortalarm_list
end type
type cb_8 from commandbutton within w_mortalarm_list
end type
type cb_7 from commandbutton within w_mortalarm_list
end type
type cb_6 from commandbutton within w_mortalarm_list
end type
type cb_4 from commandbutton within w_mortalarm_list
end type
type cbx_op from checkbox within w_mortalarm_list
end type
type sle_value from singlelineedit within w_mortalarm_list
end type
type ddlb_op from dropdownlistbox within w_mortalarm_list
end type
type st_6 from statictext within w_mortalarm_list
end type
type ddlb_fld from dropdownlistbox within w_mortalarm_list
end type
type ddlb_dwtitles from dropdownlistbox within w_mortalarm_list
end type
type st_4 from statictext within w_mortalarm_list
end type
end forward

global type w_mortalarm_list from w_inheritance2
integer x = 320
integer y = 552
integer width = 6117
integer height = 7292
string title = "거래처 담보 관리(w_mortalarm_list)"
long backcolor = 79416533
st_vertical st_vertical
dw_cond dw_cond
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_4 cb_4
cbx_op cbx_op
sle_value sle_value
ddlb_op ddlb_op
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
end type
global w_mortalarm_list w_mortalarm_list

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

on w_mortalarm_list.create
int iCurrent
call super::create
this.st_vertical=create st_vertical
this.dw_cond=create dw_cond
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cbx_op=create cbx_op
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_vertical
this.Control[iCurrent+2]=this.dw_cond
this.Control[iCurrent+3]=this.cb_8
this.Control[iCurrent+4]=this.cb_7
this.Control[iCurrent+5]=this.cb_6
this.Control[iCurrent+6]=this.cb_4
this.Control[iCurrent+7]=this.cbx_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.ddlb_fld
this.Control[iCurrent+12]=this.ddlb_dwtitles
this.Control[iCurrent+13]=this.st_4
end on

on w_mortalarm_list.destroy
call super::destroy
destroy(this.st_vertical)
destroy(this.dw_cond)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cbx_op)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
end on

event resize;call super::resize;dw_1.height = newheight - dw_1.y - st_title.x
dw_1.width  = newwidth

end event

event we_postopen;call super::we_postopen;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false


datawindowchild ldwc_cust, ldwc_cust_name
long ll_row
//================================//
dw_cond.getchild("cust_no", ldwc_cust)
ldwc_cust.settransobject(sqlca)
ll_row = ldwc_cust.retrieve( '%', '%', '%' )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

ldwc_cust.setsort('cust_no, cust_name')
ldwc_cust.sort()
//================================//
dw_cond.getchild("cust_name", ldwc_cust_name)
ldwc_cust_name.settransobject(sqlca)
ll_row = ldwc_cust_name.retrieve( '%', '%', '%' )
if ll_row = 0 then MessageBox("확인", "거래처 데이터가 존재하지 않습니다.")

ldwc_cust_name.setsort("cust_name, cust_no")
ldwc_cust_name.sort()

dw_1.settransobject(sqlca)
this.postevent('we_retrieve')

end event

event we_retrieve;call super::we_retrieve;dw_1.reset()
dw_1.retrieve()

return 1
end event

event we_delete;call super::we_delete;long		ll_grow
string	ls_msg, ls_cust_no, ls_cust_name, ls_sqlerrtext

ll_grow = dw_1.getrow()
if ll_grow = 0 then return 1

ls_cust_no		= dw_1.getitemstring(ll_grow, 'cust_no')
ls_cust_name	= dw_1.getitemstring(ll_grow, 'cust_name')
ls_msg			= "선택한 거채처명을 " + ls_cust_name + " 삭제하시겠습니까?"
if messagebox("확인", ls_msg, exclamation!, okcancel!, 2) = 2 then return -1
dw_1.deleterow(ll_grow)

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

event we_insert;string	ls_code
long		ll_grow
string	ls_cust_no, ls_cust_name, ls_salesman, ls_dambo_rem, ls_dambo_value
dec		ld_dambo_amt, ld_amount
datetime	ldt_ymd

//if dw_cond.accepttext( ) = -1 then return -1
ls_code	= dw_cond.getitemstring(1, 'cust_no')

if gf_null_chk(ls_code) then
	messagebox("확인","등록할 거래처를 선택하세요")
	return -1
end if

ll_grow = dw_1.find("cust_no = '" + ls_code + "'", 1, dw_1.rowcount())
if ll_grow > 0 then
	messagebox("확인",ls_code + "를 중복 등록할수 없습니다.")
	return -1
end if

select 
	 a.cust_no
	,a.cust_name
	,(select user_name from login where user_id = a.salesman) salesman
	,a.dambo_rem
	,a.dambo_amt
	,b.amount
	,a.dambo_ymd
	,a.dambo_value
into
	 :ls_cust_no
	,:ls_cust_name
	,:ls_salesman
	,:ls_dambo_rem
	,:ld_dambo_amt
	,:ld_amount
	,:ldt_ymd
	,:ls_dambo_value
from
	customer	a inner join (
							select
								 cust_no
								,balbf_amount + inv_01 + inv_02 + inv_03 + inv_04 + inv_05 + inv_06 + inv_07 + inv_08 + inv_09 + inv_10  + inv_11 + inv_12  - coll_01 - coll_02 - coll_03 - coll_04 - coll_05 - coll_06 - coll_07 - coll_08 - coll_09 - coll_10  - coll_11 - coll_12 as amount
							FROM 	
								opeom
							WHERE 
								datepart(year,opeom.eom_year)	= year(getdate())) b on a.cust_no = b.cust_no
WHERE 	
	a.cust_no	= :ls_code
using sqlca;	

IF SQLCA.SQLCode <> 0 THEN 
	MessageBox("SQL error", "자료를 조회하지 못했습니다.~r~n다시 시도하세요!")
	return -1 
END IF

ll_grow	= dw_1.insertrow(1)
dw_1.setitem(ll_grow, 'cust_no', ls_cust_no)
dw_1.setitem(ll_grow, 'cust_name', ls_cust_name)
dw_1.setitem(ll_grow, 'salesman', ls_salesman)
dw_1.setitem(ll_grow, 'dambo_rem', ls_dambo_rem)
dw_1.setitem(ll_grow, 'dambo_amt', ld_dambo_amt)
dw_1.setitem(ll_grow, 'amount', ld_amount)
dw_1.setitem(ll_grow, 'dambo_ymd', ldt_ymd)
dw_1.setitem(ll_grow, 'dambo_value', ls_dambo_value)
dw_1.setitem(ll_grow, 'use_yn', 'N')

return 1
end event

event we_save;call super::we_save;Long	ll_rtn
ll_rtn = wf_update_array({dw_1})
If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
	this.postevent('we_retrieve')
end if

Return 1
end event

type pb_saveas from w_inheritance2`pb_saveas within w_mortalarm_list
integer x = 5120
integer y = 44
end type

type pb_save from w_inheritance2`pb_save within w_mortalarm_list
integer x = 4928
integer y = 44
end type

event pb_save::clicked;call super::clicked;//int li_cnt1, li_cnt2, ll_count

//===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
//wf_update2(dw_1,dw_2, "Y")


end event

type dw_1 from w_inheritance2`dw_1 within w_mortalarm_list
integer x = 27
integer y = 416
integer width = 5509
integer height = 2272
string dataobject = "d_mortalarm_list_01"
end type

event dw_1::getfocus;call super::getfocus;GS_Filter	= ""


end event

event dw_1::clicked;call super::clicked;if row = 0 then return

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
end event

type st_title from w_inheritance2`st_title within w_mortalarm_list
integer x = 32
integer y = 20
integer width = 1152
integer height = 140
string text = "거래처 담보 관리"
end type

type st_tips from w_inheritance2`st_tips within w_mortalarm_list
integer x = 5275
integer y = 908
end type

type pb_compute from w_inheritance2`pb_compute within w_mortalarm_list
boolean visible = false
integer x = 5275
integer y = 1072
integer taborder = 90
end type

type pb_print_part from w_inheritance2`pb_print_part within w_mortalarm_list
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance2`pb_close within w_mortalarm_list
integer x = 5312
integer y = 44
integer taborder = 100
end type

type pb_print from w_inheritance2`pb_print within w_mortalarm_list
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

type pb_cancel from w_inheritance2`pb_cancel within w_mortalarm_list
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 120
end type

type pb_delete from w_inheritance2`pb_delete within w_mortalarm_list
integer x = 4736
integer y = 44
integer taborder = 130
end type

type pb_insert from w_inheritance2`pb_insert within w_mortalarm_list
integer x = 4544
integer y = 44
integer taborder = 150
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_mortalarm_list
integer x = 4352
integer y = 44
integer taborder = 140
end type

type gb_3 from w_inheritance2`gb_3 within w_mortalarm_list
boolean visible = false
integer x = 5911
integer y = 1192
integer width = 101
integer height = 100
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance2`gb_2 within w_mortalarm_list
integer x = 1225
integer y = 8
integer width = 4302
integer height = 204
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance2`gb_1 within w_mortalarm_list
integer x = 27
integer y = 212
integer width = 5499
integer height = 188
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance2`dw_2 within w_mortalarm_list
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

type st_vertical from u_splitbar_vertical within w_mortalarm_list
boolean visible = false
integer x = 4672
integer y = 464
integer height = 1944
end type

type dw_cond from u_datawindow within w_mortalarm_list
integer x = 1239
integer y = 52
integer width = 2821
integer height = 140
integer taborder = 30
boolean bringtotop = true
string title = ""
string dataobject = "d_mortalarm_list_00"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event itemchanged;call super::itemchanged;string ls_custno, ls_custnm, ls_icubeno, ls_data, l_retrieve_cust_no
string ls_cust_no, ls_cust_name
long   ll_cnt, l_count = 0

choose case dwo.name
	case 'cust_no'  
		ls_custno = Trim(data)
		setnull(ls_custnm)			
		SELECT cust_name INTO :ls_custnm FROM customer WHERE cust_no  =  :ls_custno;
		if isnull(ls_custnm) then
			Messagebox('확인','입력한 거래처코드의 거래처는 존재하지 않습니다.')
			RETURN
		else
			this.object.cust_name[1] = ""
			this.object.cust_name[1] = ls_custnm
		end if
	case 'cust_name'
		ls_custnm = Trim(data)
		setnull(ls_custno)
		SELECT cust_no INTO :ls_custno FROM customer WHERE cust_name  =  :ls_custnm; 
		
		if isnull(ls_custno) then 						/*2018.03.19 조원석 신규반영*/
			Messagebox('확인','입력한 거래처명의 거래처는 존재하지 않습니다.')
			RETURN
		else
			this.object.cust_name[1]  = ""		
			this.object.cust_name[1]  =ls_custnm
			this.object.cust_no[1]  = ""
			this.object.cust_no[1]  = ls_custno
		end if
end choose															
end event

type cb_8 from commandbutton within w_mortalarm_list
integer x = 2482
integer y = 280
integer width = 160
integer height = 76
integer taborder = 130
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

type cb_7 from commandbutton within w_mortalarm_list
integer x = 2318
integer y = 280
integer width = 160
integer height = 76
integer taborder = 140
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

type cb_6 from commandbutton within w_mortalarm_list
integer x = 2153
integer y = 280
integer width = 160
integer height = 76
integer taborder = 140
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

type cb_4 from commandbutton within w_mortalarm_list
integer x = 1989
integer y = 280
integer width = 160
integer height = 76
integer taborder = 140
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

type cbx_op from checkbox within w_mortalarm_list
integer x = 1783
integer y = 288
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

type sle_value from singlelineedit within w_mortalarm_list
integer x = 1230
integer y = 280
integer width = 539
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_mortalarm_list
integer x = 914
integer y = 276
integer width = 306
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type st_6 from statictext within w_mortalarm_list
integer x = 741
integer y = 292
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

type ddlb_fld from dropdownlistbox within w_mortalarm_list
integer x = 270
integer y = 276
integer width = 443
integer height = 632
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_mortalarm_list
integer x = 270
integer y = 276
integer width = 311
integer height = 88
integer taborder = 120
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

type st_4 from statictext within w_mortalarm_list
integer x = 82
integer y = 292
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

