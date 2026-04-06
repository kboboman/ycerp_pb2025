$PBExportHeader$w_rawmtrorder02.srw
$PBExportComments$원자재 발주 현황
forward
global type w_rawmtrorder02 from w_inheritance2
end type
type dw_3 from u_datawindow within w_rawmtrorder02
end type
type st_2 from statictext within w_rawmtrorder02
end type
type dw_4 from u_datawindow within w_rawmtrorder02
end type
end forward

global type w_rawmtrorder02 from w_inheritance2
integer width = 5911
integer height = 2496
string title = "원자재 발주 현황(w_rawmtrorder02)"
dw_3 dw_3
st_2 st_2
dw_4 dw_4
end type
global w_rawmtrorder02 w_rawmtrorder02

type variables
string	is_id
end variables

on w_rawmtrorder02.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_4
end on

on w_rawmtrorder02.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_4)
end on

event resize;call super::resize;gb_2.width  = newwidth	- 40
dw_1.width  = newwidth	- 70

gb_3.height = newheight	- dw_2.y - gb_2.x + 60
dw_2.height = newheight	- dw_2.y - gb_2.x
dw_3.width  = newwidth  - dw_3.x - gb_2.x
dw_4.width  = newwidth  - dw_4.x - gb_2.x
dw_4.height = newheight	- dw_4.y - 25
end event

event we_retrieve;call super::we_retrieve;string ls_fr_dt, ls_to_dt, ls_status

if dw_1.accepttext( ) = -1 then return -1

ls_fr_dt		= dw_1.getitemstring(1, 'fr_dt')
ls_to_dt		= dw_1.getitemstring(1, 'to_dt')
ls_status	= dw_1.getitemstring(1, 'status')

dw_2.reset()
dw_3.reset()
dw_4.reset()

dw_2.retrieve(ls_fr_dt, ls_to_dt, is_id, ls_status)

return 0
end event

event we_save;call super::we_save;Long	ll_rtn
ll_rtn = wf_update_array({dw_3})
If ll_rtn = 1 Then 
	Messagebox('Check', '저장이 정상적으로 진행되었습니다')
	this.postevent('we_retrieve')
end if
return 0
end event

event we_postopen;call super::we_postopen;long		ll_cnt
string	ls_fr_dt, ls_to_dt

//결재자 확인
select	
	count(*)
into
	:ll_cnt
from	
	yc_codemst
where	
	use_yn	= 'Y'
and	
	detl_cd	<> 'ROOT'
and 
	mast_cd = 'E004'
and
	detl_nm	= :gs_userid
using sqlca;

if ll_cnt > 0 then
	pb_save.enabled		= false				
	is_id						= '%'
else
	is_id						= gs_userid
end if

//dddw 셋팅
gf_dddw_detl_cd(dw_1, 'status', 'E007', '%')
gf_dddw_detl_cd(dw_2, 'rqr_uom', 'E006', '')
gf_dddw_detl_cd(dw_2, 'acc_uom', 'E006', '')
gf_dddw_detl_cd(dw_2, 'order_uom', 'E006', '')
gf_dddw_detl_cd(dw_2, 'used_uom', 'E006', '')
gf_dddw_detl_cd(dw_2, 'invnt_uom', 'E006', '')
gf_dddw_detl_cd(dw_2, 'approval_status', 'E007', '')
gf_dddw_detl_cd(dw_3, 'rqr_uom', 'E006', '')
gf_dddw_detl_cd(dw_3, 'acc_uom', 'E006', '')
gf_dddw_detl_cd(dw_3, 'order_uom', 'E006', '')
gf_dddw_detl_cd(dw_3, 'used_uom', 'E006', '')
gf_dddw_detl_cd(dw_3, 'invnt_uom', 'E006', '')
gf_dddw_detl_cd(dw_3, 'approval_status', 'E007', '')
gf_dddw_detl_cd(dw_4, 'used_uom', 'E006', '')

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

//초기화
select 
	convert(nvarchar,dateadd(m,-3,getdate()),112 ), convert(nvarchar, getdate(),112)
into
	:ls_fr_dt, :ls_to_dt
from 
	dual
using sqlca;

dw_1.setitem(1, 'status', 'A')
dw_1.setitem(1, 'fr_dt', ls_fr_dt)
dw_1.setitem(1, 'to_dt', ls_to_dt)

this.postevent( 'we_retrieve')
end event

type pb_saveas from w_inheritance2`pb_saveas within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_save from w_inheritance2`pb_save within w_rawmtrorder02
integer x = 3278
end type

type dw_1 from w_inheritance2`dw_1 within w_rawmtrorder02
integer x = 41
integer y = 248
integer width = 5774
integer height = 148
string dataobject = "d_rawmtrorder02_00"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::constructor;call super::constructor;this.insertrow(0)
end event

type st_title from w_inheritance2`st_title within w_rawmtrorder02
string text = "원자재 발주 현황"
end type

type st_tips from w_inheritance2`st_tips within w_rawmtrorder02
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance2`pb_compute within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_print_part from w_inheritance2`pb_print_part within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance2`pb_close within w_rawmtrorder02
integer x = 3470
end type

type pb_print from w_inheritance2`pb_print within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_cancel from w_inheritance2`pb_cancel within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_delete from w_inheritance2`pb_delete within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_insert from w_inheritance2`pb_insert within w_rawmtrorder02
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_rawmtrorder02
integer x = 3077
end type

type gb_3 from w_inheritance2`gb_3 within w_rawmtrorder02
integer x = 32
integer y = 408
integer width = 3451
integer height = 1764
end type

type gb_2 from w_inheritance2`gb_2 within w_rawmtrorder02
integer y = 212
integer width = 5792
integer height = 196
end type

type gb_1 from w_inheritance2`gb_1 within w_rawmtrorder02
integer x = 3049
integer width = 640
end type

type dw_2 from w_inheritance2`dw_2 within w_rawmtrorder02
integer x = 41
integer y = 448
integer width = 3429
integer height = 1712
string dataobject = "d_rawmtrorder01_01"
boolean hscrollbar = true
boolean livescroll = false
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;String		ls_rqs_no

if currentrow = 0 then return

ls_rqs_no	= this.GetItemString(currentrow, 'rqs_no')

dw_3.reset()
dw_4.reset()
dw_3.Retrieve(ls_rqs_no)
dw_4.Retrieve(ls_rqs_no)
end event

type dw_3 from u_datawindow within w_rawmtrorder02
integer x = 3497
integer y = 440
integer width = 2322
integer height = 712
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_rawmtrorder02_02"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event updatestart;call super::updatestart;//return 1(Do not perform the update) / 0 (Continue processing)
Long		ll_rcnt, ll_row, ll_cnt
dwitemstatus	 ldwstatus
string	ls_temp, ls_rqs_no, ls_input_dt, ls_used_uom
decimal	ldc_used_qty, ldc_chk_qty
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
				Case DataModified!
					ldc_chk_qty		= this.getitemdecimal(1, 'chk_qty')
					ldc_used_qty	= this.getitemdecimal(1, 'used_qty')
					
					if ldc_chk_qty <> ldc_used_qty then
						ls_rqs_no	= this.getitemstring(1, 'rqs_no')
						ls_used_uom	= this.getitemstring(1, 'used_uom')
						
						select 
							convert(char(23), getdate(), 121) 
						into
							:ls_input_dt
						from 
							dual;
						
						
						insert into rawmtrorderuse 
							(rqs_no,	input_dt, input_id, used_qty, used_uom) 
						values 
							(:ls_rqs_no, :ls_input_dt, :gs_userid, :ldc_used_qty, :ls_used_uom) 
						using sqlca; 
						
						string		ls_sqlerrtext
						if sqlca.sqlcode = -1 then         
							ls_sqlerrtext	= sqlca.sqlerrtext
							rollback using sqlca;
							messagebox("sql error", ls_sqlerrtext)
							return 1
						end if
					end if				
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event we_esscheckbyupdate;call super::we_esscheckbyupdate;//I 입력 / P 승인요청 / A 승인 / R 반려
long 		NbrRows, ll_row = 0, ll_temp
String	ls_temp, ls_uom 
decimal	ldc_qty
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		//조건 체크
		ls_temp	= this.getitemstring(ll_row, 'prchmngr_id')
		if ls_temp <>  gs_userid  then
			messagebox("확인", "구매담당자만~r~n저장할 수 있습니다.")
			return -1
		end if
		
		//환산 필요물량
		ldc_qty	= this.getitemdecimal(ll_row, 'acc_qty')
		ls_uom	= this.getitemstring(ll_row, 'acc_uom')
		if ldc_qty <> 0 and gf_null_chk(ls_uom) then
			messagebox("확인", "환산 필요수량 단위를~r~n선택하세요.")
			return -1
		end if
		
		//발주량 
		ldc_qty	= this.getitemdecimal(ll_row, 'order_qty')
		ls_uom	= this.getitemstring(ll_row, 'order_uom')
		if ldc_qty <> 0 and gf_null_chk(ls_uom) then
			messagebox("확인", "발주량 단위를~r~n선택하세요.")
			return -1
		end if

		//사용량	
		ldc_qty	= this.getitemdecimal(ll_row, 'used_qty')
		ls_uom	= this.getitemstring(ll_row, 'used_uom')
		if ldc_qty <> 0 and gf_null_chk(ls_uom) then
			messagebox("확인", "사용량 단위를~r~n선택하세요.")
			return -1
		end if
		
		//재고		
		ldc_qty	= this.getitemdecimal(ll_row, 'invnt_qty')
		ls_uom	= this.getitemstring(ll_row, 'invnt_uom')
		if ldc_qty <> 0 and gf_null_chk(ls_uom) then
			messagebox("확인", "재고량 단위를~r~n선택하세요.")
			return -1
		end if

	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

type st_2 from statictext within w_rawmtrorder02
integer x = 3739
integer y = 128
integer width = 960
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
boolean underline = true
long textcolor = 16711680
long backcolor = 67108864
string text = "※ 구매 담당자만 수정  가능"
boolean focusrectangle = false
end type

type dw_4 from u_datawindow within w_rawmtrorder02
integer x = 3497
integer y = 1172
integer width = 2322
integer height = 992
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_rawmtrorder02_03"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event updatestart;call super::updatestart;//return 1(Do not perform the update) / 0 (Continue processing)
Long		ll_rcnt, ll_row, ll_cnt
dwitemstatus	 ldwstatus
string	ls_temp, ls_rqs_no, ls_rqs_dt
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
					select 
						convert(char(8),getdate(),112)
					into
						:ls_rqs_dt
					from 
						dual
					using sqlca;	
					
					select
						max(rqs_no)
					into
						:ls_rqs_no
					from
						rawmtrorder
					where
						left(rqs_no,8) = :ls_rqs_dt
					using sqlca;
					
					if gf_null_chk(ls_rqs_no) then
						ls_rqs_no	= ls_rqs_dt + '0001'
					else
						ls_rqs_no	= ls_rqs_dt + string(long(MidA(ls_rqs_no,9,4)) + 1,'0000')
					end if
					
					this.setItem(ll_row, 'rqs_no', ls_rqs_no)
				Case DataModified!
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event we_esscheckbyupdate;call super::we_esscheckbyupdate;//I 입력 / P 승인요청 / A 승인 / R 반려
long 		NbrRows, ll_row = 0, ll_temp
String	ls_temp, ls_status
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		//조건 체크
		ls_temp	= this.getitemstring(ll_row, 'mngr_id')
		if ls_temp <>  gs_userid  then
			messagebox("확인", "본인이 등록한 요청만~r~n저장할 수 있습니다.")
			return -1
		end if
		
		ls_temp		= this.getitemstring(ll_row, 'rqs_no')
		if gf_null_chk(ls_temp) then return -1
		select
			approval_status
		into	
			:ls_status
		from 
			rawmtrorder
		where
			rqs_no = :ls_temp
		using sqlca;	
		
		if ls_status = 'A' OR ls_status = 'P' then 
			messagebox("주의","입력 상태에서만~r~n저장할 수 있습니다.")
			return -1
		end if
		
		//필수값 체크
		ls_temp	= this.getitemstring(ll_row, 'prjct_name')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "프로젝트명을 입력하세요.")
			return -1
		end if
		
		ls_temp	= this.getitemstring(ll_row, 'item_name')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "품목명을 입력하세요.")
			return -1
		end if
		
		ll_temp	= this.getitemnumber(ll_row, 'rqr_qty')
		if ll_temp = 0 then
			messagebox("확인", "필요 물량을 입력하세요.")
			return -1
		end if
		
		ls_temp	= this.getitemstring(ll_row, 'rqr_uom')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "필요 물량 단위를 입력하세요.")
			return -1
		end if
		
		ls_temp	= this.getitemstring(ll_row, 'rqst_dlvr_dt')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "요청납기일자를 입력하세요.")
			return -1
		end if

		ls_temp	= this.getitemstring(ll_row, 'prchmngr_id')
		if gf_null_chk(ls_temp) = true then
			messagebox("확인", "구매담당자를 입력하세요.")
			return -1
		end if
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

