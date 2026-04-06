$PBExportHeader$w_rawmtrorder01.srw
$PBExportComments$원자재 발주 등록
forward
global type w_rawmtrorder01 from w_inheritance2
end type
type cb_reject from commandbutton within w_rawmtrorder01
end type
type dw_3 from u_datawindow within w_rawmtrorder01
end type
type cb_approval from commandbutton within w_rawmtrorder01
end type
type cb_request from commandbutton within w_rawmtrorder01
end type
type st_1 from statictext within w_rawmtrorder01
end type
type st_2 from statictext within w_rawmtrorder01
end type
end forward

global type w_rawmtrorder01 from w_inheritance2
integer width = 5874
integer height = 2392
string title = "원자재 발주 요청(w_rawmtrorder01)"
cb_reject cb_reject
dw_3 dw_3
cb_approval cb_approval
cb_request cb_request
st_1 st_1
st_2 st_2
end type
global w_rawmtrorder01 w_rawmtrorder01

type variables
string	is_id
end variables

on w_rawmtrorder01.create
int iCurrent
call super::create
this.cb_reject=create cb_reject
this.dw_3=create dw_3
this.cb_approval=create cb_approval
this.cb_request=create cb_request
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reject
this.Control[iCurrent+2]=this.dw_3
this.Control[iCurrent+3]=this.cb_approval
this.Control[iCurrent+4]=this.cb_request
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
end on

on w_rawmtrorder01.destroy
call super::destroy
destroy(this.cb_reject)
destroy(this.dw_3)
destroy(this.cb_approval)
destroy(this.cb_request)
destroy(this.st_1)
destroy(this.st_2)
end on

event resize;call super::resize;gb_2.width  = newwidth	- 40
dw_1.width  = newwidth	- 70

gb_3.height = newheight	- dw_2.y - gb_2.x + 60
dw_2.height = newheight	- dw_2.y - gb_2.x

dw_3.width  = newwidth  - dw_3.x - gb_2.x
end event

event we_retrieve;call super::we_retrieve;string ls_fr_dt, ls_to_dt, ls_status

if dw_1.accepttext( ) = -1 then return -1

ls_fr_dt		= dw_1.getitemstring(1, 'fr_dt')
ls_to_dt		= dw_1.getitemstring(1, 'to_dt')
ls_status	= dw_1.getitemstring(1, 'status')

dw_2.reset()
dw_3.reset()

dw_2.retrieve(ls_fr_dt, ls_to_dt, is_id, ls_status)

return 0
end event

event we_insert;call super::we_insert;long		ll_ins, ll_found
string	ls_team_name, ls_input_dt, ls_approval_id

//요청자 부서, 입력일
select 
	 team_name
	,convert(char(8),getdate(),112)
into
	 :ls_team_name
	,:ls_input_dt
from 
	team
where
	team_code = :gs_team
using sqlca;	

//결재자 확인
select	
	detl_nm
into
	:ls_approval_id
from	
	yc_codemst
where	
	use_yn	= 'Y'
and	
	detl_cd	<> 'ROOT'
and 
	mast_cd = 'E004'
using sqlca;

dw_3.reset()
ll_ins	= dw_3.insertrow(1)
dw_3.setitem(ll_ins, 'input_dt', ls_input_dt)
dw_3.setitem(ll_ins, 'mngr_id', gs_userid)
dw_3.setitem(ll_ins, 'mngr_dept', ls_team_name)
dw_3.setitem(ll_ins, 'approval_id', ls_approval_id)
dw_3.setitem(ll_ins, 'approval_status', 'I')

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
	cb_approval.enabled	= true
	cb_reject.enabled		= true	

	cb_request.enabled	= false			
	pb_insert.enabled		= false			
	pb_delete.enabled		= false			
	pb_save.enabled		= false				
	
	is_id						= '%'
else
	cb_approval.enabled	= false
	cb_reject.enabled		= false
	
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

dw_3.settransobject(sqlca)

//초기화
select 
	convert(nvarchar,dateadd(m,-3,getdate()),112 ), convert(nvarchar, getdate(),112)
into
	:ls_fr_dt, :ls_to_dt
from 
	dual
using sqlca;

dw_1.setitem(1, 'status', '%')
dw_1.setitem(1, 'fr_dt', ls_fr_dt)
dw_1.setitem(1, 'to_dt', ls_to_dt)

this.postevent( 'we_retrieve')
end event

event we_delete;call super::we_delete;long		ll_grow
string	ls_msg, ls_rqs_no, ls_status = 'I', ls_mngr_id 

ll_grow = dw_2.getrow()
if ll_grow < 1 then return -1

ls_rqs_no	= dw_2.getitemstring(ll_grow, 'rqs_no')
ls_mngr_id	= dw_2.getitemstring(ll_grow, 'mngr_id')

if gf_null_chk(ls_rqs_no) then return -1
if ls_mngr_id <> gs_userid then
	messagebox("주의","등록 요청자만 삭제할수 있습니다.")
	return -1
end if

select
	approval_status
into	
	:ls_status
from 
	rawmtrorder
where
	rqs_no = :ls_rqs_no
using sqlca;	

if ls_status = 'A' or ls_status = 'P'  then 
	messagebox("주의","결재 승인(요청) 상태에선~r~n삭제할 수 없습니다.")
	return -1
end if

ls_msg = '요청번호(' + ls_rqs_no + ')를 삭제하시겠습니까?'


if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return 0
delete from rawmtrorder where rqs_no = :ls_rqs_no using sqlca;

string		ls_sqlerrtext
if sqlca.sqlcode <> 0 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
else
	commit using sqlca;
end if

this.postevent('we_retrieve')

return 0
end event

type pb_saveas from w_inheritance2`pb_saveas within w_rawmtrorder01
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_save from w_inheritance2`pb_save within w_rawmtrorder01
integer x = 3278
end type

type dw_1 from w_inheritance2`dw_1 within w_rawmtrorder01
integer x = 41
integer y = 248
integer width = 5774
integer height = 148
string dataobject = "d_rawmtrorder01_00"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::constructor;call super::constructor;this.insertrow(0)
end event

type st_title from w_inheritance2`st_title within w_rawmtrorder01
string text = "원자재 발주 요청"
end type

type st_tips from w_inheritance2`st_tips within w_rawmtrorder01
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance2`pb_compute within w_rawmtrorder01
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_print_part from w_inheritance2`pb_print_part within w_rawmtrorder01
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance2`pb_close within w_rawmtrorder01
integer x = 3470
end type

type pb_print from w_inheritance2`pb_print within w_rawmtrorder01
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_cancel from w_inheritance2`pb_cancel within w_rawmtrorder01
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_delete from w_inheritance2`pb_delete within w_rawmtrorder01
integer x = 3086
end type

type pb_insert from w_inheritance2`pb_insert within w_rawmtrorder01
integer x = 2894
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_rawmtrorder01
integer x = 2702
end type

type gb_3 from w_inheritance2`gb_3 within w_rawmtrorder01
integer x = 32
integer y = 408
integer width = 3451
integer height = 1764
end type

type gb_2 from w_inheritance2`gb_2 within w_rawmtrorder01
integer y = 212
integer width = 5792
integer height = 196
end type

type gb_1 from w_inheritance2`gb_1 within w_rawmtrorder01
integer x = 1673
integer width = 2016
end type

type dw_2 from w_inheritance2`dw_2 within w_rawmtrorder01
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
dw_3.Retrieve(ls_rqs_no)
end event

type cb_reject from commandbutton within w_rawmtrorder01
integer x = 2034
integer y = 56
integer width = 329
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "반려"
end type

event clicked;// I 입력 / P 승인요청 / A 승인 / R 반려
long		ll_grow
string	ls_msg, ls_rqs_no, ls_status = 'I', ls_mngr_id, ls_approval_id, ls_hp_no 

ll_grow = dw_2.getrow()
if ll_grow < 1 then return -1

ls_rqs_no		= dw_2.getitemstring(ll_grow, 'rqs_no')
ls_mngr_id		= dw_2.getitemstring(ll_grow, 'mngr_id')
ls_approval_id	= dw_2.getitemstring(ll_grow, 'approval_id')

if gf_null_chk(ls_rqs_no) then return -1
if ls_approval_id <> gs_userid then
	messagebox("주의","등록 결재자만 반려할수 있습니다.")
	return -1
end if

select
	approval_status
into	
	:ls_status
from 
	rawmtrorder
where
	rqs_no = :ls_rqs_no
using sqlca;	

if ls_status <> 'P'  then 
	messagebox("주의","결재 승인요청 상태에서만~r~n반려 요청을 할 수 있습니다.")
	return -1
end if

ls_msg = '요청번호(' + ls_rqs_no + ')를 반려 하시겠습니까?'

if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return 0

update 
	rawmtrorder
set
	approval_status	= 'R'
where rqs_no = :ls_rqs_no using sqlca;

string		ls_sqlerrtext
if sqlca.sqlcode <> 0 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
else
	commit using sqlca;
	
	//요청자 폰번호 확인
	select	
		hp_no 
	into 
		:ls_hp_no
	from	
		salehp
	where	
		user_id	= :ls_mngr_id
	using sqlca;
	
	if Not gf_null_chk(ls_hp_no) then
		ls_msg	= '원소재 발주 요청이 반려 되었으니 확인 바랍니다.'
		GF_MMSSEND( gs_userid, '0226489600', ls_hp_no, '발주요청', ls_msg )
	end if

	messagebox("요청","반려 했습니다.")
end if

parent.postevent('we_retrieve')

return 0
end event

type dw_3 from u_datawindow within w_rawmtrorder01
integer x = 3497
integer y = 440
integer width = 2322
integer height = 712
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_rawmtrorder01_02"
boolean hscrollbar = true
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
String	ls_temp, ls_status, ls_rqs_no
DWItemStatus		ldwstate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		//조건 체크
		ls_rqs_no	= this.getitemstring(ll_row, 'rqs_no')
		if not gf_null_chk(ls_rqs_no) then
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
				messagebox("주의","입력/반려 상태에서만~r~n저장할 수 있습니다.")
				return -1
			end if
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

type cb_approval from commandbutton within w_rawmtrorder01
integer x = 1701
integer y = 56
integer width = 329
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "승인"
end type

event clicked;// I 입력 / P 승인요청 / A 승인 / R 반려
long		ll_grow
string	ls_msg, ls_rqs_no, ls_status = 'I', ls_prchmngr_id, ls_approval_id, ls_hp_no, ls_mngr_nm 

ll_grow = dw_2.getrow()
if ll_grow < 1 then return -1

ls_rqs_no		= dw_2.getitemstring(ll_grow, 'rqs_no')
ls_prchmngr_id	= dw_2.getitemstring(ll_grow, 'prchmngr_id')
ls_approval_id	= dw_2.getitemstring(ll_grow, 'approval_id')
ls_mngr_nm		= dw_2.describe("Evaluate('LookupDisplay(mngr_id)',1)") 

if gf_null_chk(ls_rqs_no) then return -1

if ls_approval_id <> gs_userid then
	messagebox("주의","등록 결재자만 승인할수 있습니다.")
	return -1
end if

select
	approval_status
into	
	:ls_status
from 
	rawmtrorder
where
	rqs_no = :ls_rqs_no
using sqlca;	

if ls_status <> 'P'  then 
	messagebox("주의","결재 승인요청 상태에만~r~n승인 할 수 있습니다.")
	return -1
end if

ls_msg = '요청번호(' + ls_rqs_no + ')를 승인 하시겠습니까?'

if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return 0

update 
	rawmtrorder
set
	approval_status	= 'A'
where rqs_no = :ls_rqs_no using sqlca;

string		ls_sqlerrtext
if sqlca.sqlcode <> 0 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
else
	commit using sqlca;
	
	//구매 담당자 폰번호 확인
	select	
		ext_attr1 
	into 
		:ls_hp_no
	from	
		yc_codemst
	where	
		use_yn	= 'Y'
	and	
		detl_cd	<> 'ROOT'
	and 
		mast_cd = 'E005'
	and
		detl_nm = :ls_prchmngr_id
	using sqlca;
	
	if Not gf_null_chk(ls_hp_no) then
		ls_msg	= ls_mngr_nm + '님의 원소재 발주 요청이 승인 되었으니 납기 및 주문 수량 확인 바랍니다.'
		GF_MMSSEND( gs_userid, '0226489600', ls_hp_no, '발주요청', ls_msg )
	end if

	messagebox("요청","승인 했습니다.")
end if

parent.postevent('we_retrieve')

return 0
end event

type cb_request from commandbutton within w_rawmtrorder01
integer x = 2368
integer y = 52
integer width = 329
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "승인요청"
end type

event clicked;// I 입력 / P 승인요청 / A 승인 / R 반려
long		ll_grow
string	ls_msg, ls_rqs_no, ls_status = 'I', ls_mngr_id, ls_approval_id, ls_hp_no 

ll_grow = dw_2.getrow()
if ll_grow < 1 then return -1

ls_rqs_no		= dw_2.getitemstring(ll_grow, 'rqs_no')
ls_mngr_id		= dw_2.getitemstring(ll_grow, 'mngr_id')
ls_approval_id	= dw_2.getitemstring(ll_grow, 'approval_id')

if gf_null_chk(ls_rqs_no) then return -1
if ls_mngr_id <> gs_userid then
	messagebox("주의","등록 요청자만 승인요청을 할수 있습니다.")
	return -1
end if

select
	approval_status
into	
	:ls_status
from 
	rawmtrorder
where
	rqs_no = :ls_rqs_no
using sqlca;	

if ls_status = 'A' or ls_status = 'P'  then 
	messagebox("주의","결재 승인(요청) 상태에선~r~n승인 요청을 할 수 없습니다.")
	return -1
end if

ls_msg = '요청번호(' + ls_rqs_no + ')를 승인 요청 하시겠습니까?'

if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return 0

update 
	rawmtrorder
set
	approval_status	= 'P'
where rqs_no = :ls_rqs_no using sqlca;

string		ls_sqlerrtext
if sqlca.sqlcode <> 0 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
else
	commit using sqlca;
	
	//결재자 폰번호 확인
	select	
		ext_attr1 
	into 
		:ls_hp_no
	from	
		yc_codemst
	where	
		use_yn	= 'Y'
	and	
		detl_cd	<> 'ROOT'
	and 
		mast_cd = 'E004'
	and
		detl_nm = :ls_approval_id
	using sqlca;
	
	if Not gf_null_chk(ls_hp_no) then
		ls_msg	= gs_username + '님의 원소재 발주 요청 입력을 완료 하였으니 검토 후 승인 바랍니다.'
		GF_MMSSEND( gs_userid, '0226489600', ls_hp_no, '발주요청', ls_msg )
	end if
	messagebox("요청","승인 요청했습니다.")
end if

parent.postevent('we_retrieve')

return 0
end event

type st_1 from statictext within w_rawmtrorder01
integer x = 3739
integer y = 52
integer width = 1536
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
string text = "※ 결재 상태가 입력/반려 상태에서만 수정 및 삭제 가능"
boolean focusrectangle = false
end type

type st_2 from statictext within w_rawmtrorder01
integer x = 3739
integer y = 128
integer width = 1536
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
string text = "※ 본인이 요청한 건만 수정 및 삭제 가능"
boolean focusrectangle = false
end type

