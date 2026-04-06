$PBExportHeader$w_mpsliting_m.srw
$PBExportComments$스리팅계획관리(2000/06/28,이인호)
forward
global type w_mpsliting_m from w_inheritance
end type
type em_1 from editmask within w_mpsliting_m
end type
type em_2 from editmask within w_mpsliting_m
end type
type st_1 from statictext within w_mpsliting_m
end type
type cb_1 from commandbutton within w_mpsliting_m
end type
type pb_5 from picturebutton within w_mpsliting_m
end type
type pb_6 from picturebutton within w_mpsliting_m
end type
type tab_1 from tab within w_mpsliting_m
end type
type tabpage_1 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_3 cb_3
dw_3 dw_3
cb_2 cb_2
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
end type
type tab_1 from tab within w_mpsliting_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_4 from commandbutton within w_mpsliting_m
end type
type dw_5 from datawindow within w_mpsliting_m
end type
type st_6 from statictext within w_mpsliting_m
end type
type tab_2 from tab within w_mpsliting_m
end type
type tabpage_3 from userobject within tab_2
end type
type st_5 from statictext within tabpage_3
end type
type st_4 from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type st_2 from statictext within tabpage_3
end type
type tabpage_3 from userobject within tab_2
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
end type
type tab_2 from tab within w_mpsliting_m
tabpage_3 tabpage_3
end type
end forward

global type w_mpsliting_m from w_inheritance
integer width = 4507
integer height = 2864
string title = "스리팅 계획관리(w_mpsliting_m)"
em_1 em_1
em_2 em_2
st_1 st_1
cb_1 cb_1
pb_5 pb_5
pb_6 pb_6
tab_1 tab_1
cb_4 cb_4
dw_5 dw_5
st_6 st_6
tab_2 tab_2
end type
global w_mpsliting_m w_mpsliting_m

type variables
string is_clause,is_where,is_select
datastore is_ds_qaall
datawindowchild idwc_qa, idwc_coil, idwc_coil4, idwc_r_qa
datawindow dw3, dw4
st_print i_print
dec{2} id_srate = 8.12, id_arate = 2.72
//dec{2} id_srate = 7.96, id_arate = 2.72



end variables

forward prototypes
public subroutine wf_calc ()
public subroutine wf_calc2 (long arg_row)
public function boolean wf_coilmst_insert (string as_coil, decimal ad_wid, integer ai_cnt)
end prototypes

public subroutine wf_calc ();//
long ll_row, ll_totqty, ll_qty, ll_sumqty
dec {1} ld_pok, ld_totpok, ld_chkpok[10]
dec {2} ld_yrate
int li_int

if dw3.rowcount() < 1 then return

ll_totqty = 0
ld_pok    = 0
dw_2.accepttext()
dw3.accepttext()
dw4.accepttext()
dw3.setredraw(false)

for li_int = 1 to 10
	ld_chkpok[li_int] = 0
next
for ll_row = 1 to dw_2.rowcount()
	ll_qty = dw_2.object.unit_qty[ll_row] * dw_2.object.cnt[ll_row]
	if isnull(ll_qty ) then	ll_qty = 0

	ll_totqty = ll_totqty + ll_qty	
//	IF dw_2.object.sheet[ll_row] = "C" or &
//		( ll_row > 1 and dw_2.object.sheet[ll_row - 1] = "C" AND & 
//		  dw_2.object.sheet[ll_row] = "L" ) then // Coil or Sheet
//		ld_pok = dw_2.object.swid[ll_row] * dw_2.object.cnt[ll_row] / dw3.object.div[1]
//	else
	IF dw_2.object.sheet[ll_row] = "C" then
		ld_pok = dw_2.object.swid[ll_row] * dw_2.object.cnt[ll_row] / dw3.object.div[1]
	else
		if ll_row > 1 and dw_2.object.sheet[ll_row] = "L"  then
			if dw_2.object.sheet[ll_row - 1] = "C" AND dw_2.object.sheet[ll_row] <> "L" then // Coil or Sheet
				ld_pok = dw_2.object.swid[ll_row] * dw_2.object.cnt[ll_row] / dw3.object.div[1]
			else
				setnull(ld_pok)
				if not isnull(dw_2.object.swid[ll_row]) and dw_2.object.swid[ll_row] <> 0 then
					li_int = 1
					DO WHILE isnull(ld_pok)
						CHOOSE CASE ld_chkpok[li_int] / dw_2.object.swid[ll_row]
							CASE 0
								ld_chkpok[li_int] = dw_2.object.swid[ll_row]
								ld_pok = dw_2.object.swid[ll_row]
							CASE 1
								ld_pok = 0
						END CHOOSE
						li_int = li_int + 1
					LOOP
				end if
			end if
		else 
			setnull(ld_pok)
			if not isnull(dw_2.object.swid[ll_row]) and dw_2.object.swid[ll_row] <> 0 then
				li_int = 1
				DO WHILE isnull(ld_pok)
					CHOOSE CASE ld_chkpok[li_int] / dw_2.object.swid[ll_row]
						CASE 0
							ld_chkpok[li_int] = dw_2.object.swid[ll_row]
							ld_pok = dw_2.object.swid[ll_row]
						CASE 1
							ld_pok = 0
					END CHOOSE
					li_int = li_int + 1
				LOOP
			end if
		end if
	end if
	
	if isnull(ld_pok ) then
		ld_pok = 0
	end if
	ld_totpok = ld_totpok + ld_pok
next

ll_sumqty = 0
for ll_row = 1 to dw4.rowcount()
	ll_sumqty = ll_sumqty + dw4.object.unit_qty[ll_row]
next

dw3.object.tot_qty[1]   = dw3.object.coilmst_unit_qty[1] * dw3.object.cnt[1] + ll_sumqty
dw3.object.los_qty[1]   = dw3.object.coilmst_unit_qty[1] * dw3.object.cnt[1] + ll_sumqty - ll_totqty
dw3.object.los_width[1] = dw3.object.wid[1] - ld_totpok

dw3.groupcalc()
dw3.setredraw(true)


end subroutine

public subroutine wf_calc2 (long arg_row);dec{2} ld_yrate
long ll_cnt, ll_hqty

ll_hqty = 0
//dw_2.setredraw(false)
if arg_row > 0 and dw3.rowcount() > 0 then
	if dw3.object.wid[1] <> 0 and dw3.object.div[1] <> 0 &
		and  dw_2.object.swid[arg_row] <> 0 then
//		if dw_2.object.sheet[arg_row] = "C" or &
//			( arg_row > 1 and dw_2.object.sheet[arg_row - 1] = "C" & 
//			  and dw_2.object.sheet[arg_row] = "L" ) then // coil
		if dw_2.object.sheet[arg_row] = "C" then
					for ll_cnt = 1 to dw4.rowcount()
						ll_hqty = ll_hqty + round(dw_2.object.swid[arg_row] &
												/ dw4.object.wid[ll_cnt] &
												* dw4.object.unit_qty[ll_cnt] , 0)
					next
					dw_2.object.unit_qty[arg_row] = round(dw_2.object.swid[arg_row] &
															/ dw3.object.wid[1] &
															* dw3.object.coilmst_unit_qty[1] * dw3.object.cnt[1] &
															/ dw3.object.div[1], 0) &
															+ ll_hqty
		else													// sheet
			if ( arg_row > 1 and dw_2.object.sheet[arg_row] = "L" ) then 
				if dw_2.object.sheet[arg_row - 1] = "C" then // coil
					for ll_cnt = 1 to dw4.rowcount()
						ll_hqty = ll_hqty + round(dw_2.object.swid[arg_row] &
												/ dw4.object.wid[ll_cnt] &
												* dw4.object.unit_qty[ll_cnt] , 0)
					next
					dw_2.object.unit_qty[arg_row] = round(dw_2.object.swid[arg_row] &
															/ dw3.object.wid[1] &
															* dw3.object.coilmst_unit_qty[1] * dw3.object.cnt[1]&
															/ dw3.object.div[1], 0) &
															+ ll_hqty
				else
					if MidA(dw_2.object.item_no[arg_row], 3,1 ) = "A" then
						ld_yrate = id_arate
					else
						ld_yrate = id_srate
					end if // sheet 단중 = 두께 * 폭 * 길이 * 요율(스틸 = 8.12, 알미늄 = 2.72)
					dw_2.object.unit_qty[arg_row] = truncate(dw_2.object.thin[arg_row] &
															* dw_2.object.swid[arg_row] &
															* dec( MidA(dw_2.object.qa[arg_row], 10,4)) &
															* ld_yrate / 1000000 + 0.000000001,  3)
				end if
			else
				if MidA(dw_2.object.item_no[arg_row], 3,1 ) = "A" then
					ld_yrate = id_arate
				else
					ld_yrate = id_srate
				end if // sheet 단중 = 두께 * 폭 * 길이 * 요율(스틸 = 8.12, 알미늄 = 2.72)
				dw_2.object.unit_qty[arg_row] = truncate(dw_2.object.thin[arg_row] &
														* dw_2.object.swid[arg_row] &
														* dec( MidA(dw_2.object.qa[arg_row], 10,4)) &
														* ld_yrate / 1000000 + 0.000000001,  3)
			end if
		end if
	end if
end if
//dw_2.setredraw(true)


end subroutine

public function boolean wf_coilmst_insert (string as_coil, decimal ad_wid, integer ai_cnt);//
long   ll_row
string ls_chkcoil, ls_maxcoil, ls_coil, ls_loc
int    li_pos, li_len, li_start
date   ld_date

ls_coil  = as_coil
ls_loc   = dw3.object.loc_no[1]
li_start = 0

Do 
	li_pos   = li_start
	li_start = PosA(ls_coil, "-", li_start + 1)
Loop Until li_start = 0

if li_start = 1 then li_pos = 0
if li_pos > 0 then
	if integer( MidA(ls_coil, li_pos + 1, 2)) > 9 then
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 2 ) + "%"
		li_len = LenA(trim(ls_chkcoil)) + 1
	else
		ls_chkcoil = MidA(ls_coil, 1, LenA(trim(ls_coil)) - 1 ) + "%"
		li_len = LenA(trim(ls_chkcoil))
	end if

	SELECT max(coil_no) INTO :ls_maxcoil FROM coilmst
	 WHERE datalength(coil_no) = :li_len
		AND coil_no   LIKE :ls_chkcoil AND coil_no <> :ls_coil;
//	if isnumber( mid(ls_coil, li_pos + 1, 2)) then
//		ls_chkcoil = mid(ls_coil, 1, len(trim(ls_coil)) - 2 ) + "%"
//		li_len = len(trim(ls_chkcoil)) + 1
//	else
//		ls_chkcoil = mid(ls_coil, 1, len(trim(ls_coil)) - 1 ) + "%"
//		li_len = len(trim(ls_chkcoil))
//	end if
else
	setnull(ls_maxcoil)
	ls_chkcoil = trim(ls_coil) + "-%"
	li_len     = LenA(trim(ls_chkcoil))
	SELECT max(coil_no) INTO :ls_maxcoil FROM coilmst
	 WHERE datalength(coil_no) = :li_len + 1 AND coil_no LIKE :ls_chkcoil;
	if isnull(ls_maxcoil) then
		SELECT max(coil_no) INTO :ls_maxcoil FROM coilmst
		 WHERE datalength(coil_no) = :li_len AND coil_no LIKE :ls_chkcoil;
	end if
	
//	ls_chkcoil = trim(ls_coil) + "-%"
//	li_len = len(trim(ls_chkcoil))
end if

if isnull(ls_maxcoil) and LenA(trim(ls_coil) + "-1") > 20 then
	ls_maxcoil = ls_coil
end if

if isnull(ls_maxcoil) then
	ls_chkcoil = trim(ls_coil) + "-1"
else
	li_start = 0
	Do
		li_pos = li_start
		li_start = PosA(ls_maxcoil, "-", li_start + 1)
	Loop Until li_start = 0
	
	if li_start = 1 then li_pos = 0
	if isnumber( MidA(ls_maxcoil, li_pos + 1, 2) ) then
		Do Until sqlca.sqlcode = 100
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) + string(integer(MidA(ls_maxcoil, li_pos + 1, 2)) + 1)
			SELECT coil_no INTO :ls_maxcoil FROM coilmst
			 WHERE coil_no = :ls_chkcoil	AND datalength(coil_no) = :li_len;
		Loop
	else
		Do Until sqlca.sqlcode = 100
			ls_chkcoil = LeftA(ls_maxcoil, li_pos) + string(integer(MidA(ls_maxcoil, li_pos + 1, 1)) + 1)
			SELECT coil_no INTO :ls_maxcoil FROM coilmst
			 WHERE coil_no = :ls_chkcoil AND datalength(coil_no) = :li_len;
		Loop
	end if
end if

//select max(coil_no) into :ls_maxcoil from coilmst
// where datalength(coil_no) = :li_len
//	and coil_no like :ls_chkcoil
//	and coil_no <> :ls_coil
//	and loc_no = :ls_loc;
////select max(coil_no) into :ls_maxcoil from coilmst
////where coil_no in (select max(coil_no) from coilmst
////                   where datalength(coil_no) 
////						 			in (select max(datalength(coil_no)) from coilmst
////										  where coil_no like :ls_chkcoil
////										  	 and loc_no = :ls_loc)
////							and datalength(coil_no) = :li_len
////							and coil_no like :ls_chkcoil
////							and loc_no = :ls_loc)
////and coil_no <> :ls_coil
////and loc_no = :ls_loc;
//
//if isnull(ls_maxcoil) then
//	ls_chkcoil = trim(ls_coil) + "-1"
//else
//	li_start = 0
//	do
//		li_pos = li_start
//		li_start = Pos(ls_maxcoil, "-", li_start + 1)
//	loop until li_start = 0
//	if li_start = 1 then li_pos = 0
//	if isnumber( mid(ls_maxcoil, li_pos + 1, 2)) then
//		do until sqlca.sqlcode = 100
//			ls_chkcoil = left(ls_maxcoil, li_pos) &
//						+ string(integer(mid(ls_maxcoil, li_pos + 1, 2)) + 1)
//			select coil_no into :ls_maxcoil from coilmst
//			 where coil_no = :ls_chkcoil
//				and datalength(coil_no) = :li_len
//				and loc_no = :ls_loc;
//		loop
//	else
//		do until sqlca.sqlcode = 100
//			ls_chkcoil = left(ls_maxcoil, li_pos) &
//						+ string(integer(mid(ls_maxcoil, li_pos + 1, 1)) + 1)
//			select coil_no into :ls_maxcoil from coilmst
//			 where coil_no = :ls_chkcoil
//				and datalength(coil_no) = :li_len
//				and loc_no = :ls_loc;
//		loop
//	end if
//end if
if isnull(ls_chkcoil) then 
	messagebox('오류1','[wf_coilmst_insert,코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
	return false
end if

ld_date = date(wf_today())
INSERT INTO coilmst (coil_no,  wid,    item_no,   qa,    loc_no,  rcpt_date, unit_qty, length,  
		 cnt, qcnt,	color_no, supp_no, flag, porder_no, pseq_no, open_close, rem, rcpt_qty, rcpt_len, etc_no)
SELECT :ls_chkcoil,  wid,    item_no,   qa,    loc_no,  :ld_date, unit_qty, length,  
		 :ai_cnt, :ai_cnt,	color_no, supp_no, flag, '분할', 0, open_close, rem, rcpt_qty, rcpt_len, etc_no
  FROM coilmst		
 WHERE coil_no = :as_coil AND loc_no = :ls_loc;
if sqlca.sqldbcode <> 0 then
	messagebox('오류2','[wf_coilmst_insert,코일마스터] insert중 DB오류발생하였습니다.',exclamation!)
	messagebox('a',sqlca.sqlerrtext)
	return false			
end if
return true

end function

on w_mpsliting_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.cb_1=create cb_1
this.pb_5=create pb_5
this.pb_6=create pb_6
this.tab_1=create tab_1
this.cb_4=create cb_4
this.dw_5=create dw_5
this.st_6=create st_6
this.tab_2=create tab_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.pb_5
this.Control[iCurrent+6]=this.pb_6
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.cb_4
this.Control[iCurrent+9]=this.dw_5
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.tab_2
end on

on w_mpsliting_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.tab_1)
destroy(this.cb_4)
destroy(this.dw_5)
destroy(this.st_6)
destroy(this.tab_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

is_ds_qaall  = CREATE datastore
is_ds_qaall.DataObject = 'd_mpslit_qa_sel'
is_ds_qaall.SetTransObject(SQLCA)
is_ds_qaall.reset()
is_ds_qaall.retrieve('PAWSSTDK00')

em_1.text = string(today(), "YYYY/mm/dd")
em_2.text = string(today(), "YYYY/mm/dd")

dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4

dw4.settransobject(sqlca)
dw4.getchild('coil_no', idwc_coil4)
idwc_coil4.settransobject(sqlca)
idwc_coil4.insertrow(1)

dw3.settransobject(sqlca)
dw3.getchild('coil_no', idwc_coil)
idwc_coil.settransobject(sqlca)
idwc_coil.insertrow(1)
is_select = idwc_coil.Describe("DataWindow.Table.Select")
		 
dw_2.getchild('qa',idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_2.getchild('r_qa',idwc_r_qa)
is_ds_qaall.ShareData(idwc_r_qa)

tab_1.tabpage_2.enabled = false
tab_2.x  = cb_1.x
tab_2.y  = 324		// cb_1.x + cb_1.height + 148
tab_2.visible = false

if gf_permission('스리팅계획관리', gs_userid) = 'Y' then	
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
	pb_5.enabled      = false
	pb_6.enabled      = false
end if

pb_retrieve.default = true

end event

event resize;call super::resize;//
tab_1.width  = this.width  - 1019

dw_2.width   = this.width  - 118
dw_2.height  = this.height - 1416

tab_1.tabpage_2.dw_4.width  = this.width  - 1097


end event

type pb_save from w_inheritance`pb_save within w_mpsliting_m
integer x = 4000
integer y = 60
integer taborder = 30
end type

event pb_save::clicked;//
long    ll_row
string  ls_item_no, ls_qa, ls_flag, ls_loc
integer li_num, li_slrow, li_calccnt
string  ls_date, ls_num, ls_like,ls_order, ls_area, ls_coilno
date    ldt_date
int     li_cnt
dec{1}  ld_wid
string  ls_slitemnm, ls_slqa, ls_sheet
dwItemStatus l_status

dw3.accepttext()
dw_2.accepttext()
dw4.accepttext()

if dw3.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

/////////////////////////
// 원코일 내역
/////////////////////////
l_status = dw3.GetItemStatus(1,0, Primary!)
if l_status = New! or l_status = NewModified! then 
	tab_1.selecttab(1)	// 원코일 내역

	ls_coilno = dw3.object.coil_no[1]
	if isnull(ls_coilno) then
		messagebox('오류','코일번호를 선택하십시요.',exclamation!)
		dw3.setcolumn('coil_no')
		dw3.setfocus()
		return
	end if
	
	if dw3.object.cnt[1] < 1 then 
		messagebox('오류','코일갯수를 입력하십시요.',exclamation!)
		dw3.setcolumn('cnt')
		dw3.setfocus()
		return
	end if
		
	ls_area  = LeftA(gs_area,1)
	ldt_date = date(dw3.object.order_date[1])
	ls_loc   = dw3.object.loc_no[1]
	ls_date  = string(ldt_date,'yyyymmdd')
	ls_like  = ls_area + ls_date + '%'
	
	setnull(ls_order)
	SELECT max(order_no) INTO :ls_order FROM coilorderdet WHERE order_no LIKE :ls_like;
	if sqlca.sqlcode < 0 then
		messagebox('오류','수행중 오류가 발생했습니다.',exclamation!)
		return;
	else
		if isnull(ls_order) then
		  ls_order = ls_area + ls_date + '-01'
		  dw3.object.order_no[1] = ls_order
		else
		  ls_order = trim(ls_order)
		  li_num   = integer(RightA(ls_order,2))
		  li_num++
		  ls_num   = RightA('000' + string(li_num),2)
		  ls_order = ls_area + ls_date + "-" + ls_num
		  dw3.object.order_no[1] = ls_order
		end if
	end if
	
	ld_wid = dw3.object.wid[1]
	if dw3.object.cnt[1] < dw3.object.coilmst_qcnt[1] then		// 계획수량 < 재고수량
		li_calccnt = dw3.object.coilmst_qcnt[1] - dw3.object.cnt[1]
		if wf_coilmst_insert( ls_coilno, ld_wid, li_calccnt ) = false then
			rollback;
			return
		end if
		
		////////////////////////////////////////////
		li_cnt = dw3.object.cnt[1]		// 계획수량
		////////////////////////////////////////////
		UPDATE coilmst 
		   SET qcnt = :li_cnt, cnt = :li_cnt, open_close = "M" // 재고수량, 입고수량, 생산계획 작성중
		 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
		////////////////////////////////////////////
	else
		UPDATE coilmst 
		   SET open_close = "M" // 생산계획 작성중
		 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
	end if
	if sqlca.sqlcode <> 0 then
		messagebox('오류1',"코일마스터update중 오류가 발생하였습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
else
	ls_order = dw3.object.order_no[1]
	SELECT proc_flag INTO :ls_flag FROM coilorderdet WHERE order_no = :ls_order;
	if sqlca.sqlcode <> 0 then
		messagebox('오류1',"coilorderdet에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
		rollback;
		return
	end if
	if ls_flag <> 'O' then		// 진행여부(O,M,P,C)
		messagebox('오류1',"이미 처리 완료된 자료입니다. 재조회 하십시요")
		rollback;
		return
	end if
end if


///////////////////////////////////
// 코일합체 내역(원코일, 스리팅)
///////////////////////////////////
for ll_row = 1 to dw4.rowcount()
	l_status = dw4.GetItemStatus(ll_row,0, Primary!)
	if l_status = New! or l_status = NewModified! then 
		if dw4.object.cnt[ll_row] < 1 then 
			messagebox('오류','코일갯수를 입력하십시요.',exclamation!)
			tab_1.selecttab(2)
			dw4.scrolltorow(ll_row)
			dw4.setcolumn('cnt')
			dw4.setfocus()
			rollback;
			return
		end if
		
		dw4.object.order_no[ll_row] = ls_order
		ls_coilno = dw4.object.coil_no[ll_row]
		ls_loc    = dw4.object.loc_no[ll_row]
		ld_wid    = dw4.object.wid[ll_row]
		
		if dw4.object.cnt[ll_row] < dw4.object.coilmst_qcnt[ll_row] then		// 갯수 < 재고수량
			li_calccnt = dw4.object.coilmst_qcnt[ll_row] - dw4.object.cnt[ll_row]
			if wf_coilmst_insert( ls_coilno, ld_wid, li_calccnt ) = false then
				rollback;
				return
			end if
			
		   ////////////////////////////////////////////
			li_cnt = dw4.object.cnt[ll_row]		// 갯수
		   ////////////////////////////////////////////
		   UPDATE coilmst 
		      SET qcnt = :li_cnt, cnt = :li_cnt, open_close = "M" // 재고수량, 입고수량, 생산계획 작성중
		    WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
		 //UPDATE coilmst 
		 //   SET qcnt = qcnt - :li_cnt, cnt = :li_cnt, open_close = "M" // 재고수량, 입고수량, 생산계획 작성중
		 // WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
			 
		else
			UPDATE coilmst 
			   SET open_close = "M" // 생산계획 작성중
			 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc;
		end if
		if sqlca.sqlcode <> 0 then
			messagebox('오류2',"코일마스터update중 오류가 발생하였습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
	end if
next

/////////////////////////
// 스리팅 용도 등록
/////////////////////////
for ll_row = 1 to dw_2.rowcount()	
	ls_item_no  = dw_2.object.item_no[ll_row]
	ls_qa       = trim(dw_2.object.qa[ll_row])
	ls_sheet    = trim(dw_2.Object.sheet[ll_row])
	ls_slitemnm = trim(dw_2.Object.r_item_no[ll_row])
	ls_slqa     = trim(dw_2.Object.r_qa[ll_row])
	
	if ls_sheet <> 'L' then
		if ls_slitemnm = '' or IsNull(ls_slitemnm) then
			Messagebox('확인','회장님 지시사항으로 제품명을 꼭 입력을 하셔야 합니다.!!')
			Return
		end if
		if MidA(ls_slitemnm,1,1) <> 'E' then
			if ls_slqa  = '' or IsNull(ls_slqa) then
				Messagebox('확인','회장님 지시사항으로 규격은 꼭 입력을 하셔야 합니다.!!')
				Return
			end if
		end if
	end if
	
	l_status = dw_2.GetItemStatus(ll_row,0, Primary!)
	if l_status <> NotModified! then 

		li_cnt = 0
		SELECT count(*) INTO :li_cnt FROM item WHERE item_no = :ls_item_no AND qa = :ls_qa;	
		if li_cnt = 0 then
//			if MessageBox("확인","아래와 같은 규격은 존재하지 않습니다!~r~n" &
//				+ "신규규격 " + ls_qa +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 1) = 1 then
				if gf_iteminsert(ls_item_no, ls_qa) = false then
					rollback;
					return
				end if
//			end if
		end if
	
		dw_2.object.order_no[ll_row] = dw3.object.order_no[1]
		dw_2.object.wid[ll_row]      = dw3.object.wid[1]
		dw_2.object.coil_no[ll_row]  = dw3.object.coil_no[1]
		dw_2.object.loc_no[ll_row]   = dw3.object.loc_no[1]		
	end if
next

/////////////////////////
// 저장
/////////////////////////
if wf_update3(dw3, dw_2, dw4, 'Y') = true then
	ls_order = trim(dw3.object.order_no[1])
	tab_1.tabpage_2.enabled = false
	
	tab_1.tabpage_2.dw_4.reset()
	dw_1.retrieve(date(em_1.text), date(em_2.text), 'O' )

//	dw3.retrieve(ls_order)
//	dw_2.retrieve(ls_order)
end if


end event

type dw_1 from w_inheritance`dw_1 within w_mpsliting_m
integer x = 32
integer y = 232
integer width = 887
integer height = 912
integer taborder = 60
string dataobject = "d_mpsliting_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row
string ls_order

ll_row = wf_rowfocuschange(dw_1,'N')
if ll_row < 1 then return

ls_order = trim(dw_1.object.order_no[ll_row])
dw3.retrieve(ls_order)
dw_2.retrieve(ls_order)
if dw4.retrieve(ls_order) > 0 then
	tab_1.tabpage_2.enabled = true
else
	tab_1.tabpage_2.enabled = false
end if

end event

event dw_1::retrieveend;long ll_row
string ls_order

if this.rowcount() < 1 then
	dw_2.reset()
	dw3.reset()
	return
end if

ll_row = wf_rowfocuschange(dw_1,'N')
if ll_row < 1 then return

if this.rowcount() = 1 then
	ls_order = trim(dw_1.object.order_no[ll_row])
	dw_2.retrieve( ls_order )
	dw3.retrieve( ls_order )
	dw4.retrieve( ls_order )
end if

end event

event dw_1::clicked;//
string ls_order
long   ll_row

if row < 1 then return

ls_order = trim(dw_1.object.order_no[row])

dw3.retrieve( ls_order )
dw_2.retrieve( ls_order)

ll_row = dw4.retrieve(ls_order)
if ll_row > 0 then
	tab_1.tabpage_2.enabled = true
else
	tab_1.tabpage_2.enabled = false
end if

end event

type dw_2 from w_inheritance`dw_2 within w_mpsliting_m
event ue_1 pbm_custom01
integer x = 32
integer y = 1280
integer width = 4389
integer height = 1448
integer taborder = 70
string dataobject = "d_mpslitingcoil_m"
borderstyle borderstyle = stylelowered!
end type

event dw_2::ue_1;//
wf_calc()

end event

event dw_2::clicked;this.accepttext()

end event

event dw_2::itemchanged;string ls_item,ls_data,ls_qa,ls_uom,ls_itemname,ls_loc,ls_data1,ls_supp,ls_wc
string ls_thin,ls_wid, ls_wid2
int li_ret
long ll_row
dec{2} ld_yrate

dw3.accepttext()
this.accepttext()
ll_row = this.getrow()
choose case dwo.name
	case 'item_no'
		   ls_data = data
			setnull(ls_item)
			
			if this.object.sheet[ll_row] <> 'L' then
				this.object.qa[ll_row] = ls_item
			end if
			
			select item_name into :ls_itemname from groupitem 
			where item_no = :ls_data;
			if sqlca.sqlcode = 100 then 
			  MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
			  this.object.item_no[row] = ls_item
			  return 1
			end if
			this.object.groupitem_item_name[ll_row] = ls_itemname
			ls_item = this.object.item_no[ll_row]
			
			if this.object.sheet[ll_row] = 'L' then 
				wf_calc()
				return
			else
			
				if ls_item <> '' then
					this.getchild("qa", idwc_qa)
					gs_ds_qaall.ShareData(idwc_qa)
					idwc_qa.setfilter("item_no = '" + ls_item + "'")
					idwc_qa.filter()
				end if
				if idwc_qa.rowcount() = 1 then
					ls_data = trim(idwc_qa.getitemstring(1,'qa'))
					this.object.qa[ll_row] = ls_data
				end if
				
				IF MidA(ls_item,4,1) = "2" then
					this.object.sheet[ll_row] = "S"
				else
					this.object.sheet[ll_row] = "C"
				end if
			end if
			
	case "qa"
		this.setredraw(false)
		ls_qa = trim(this.object.qa[ll_row]) 
		this.object.thin[ll_row] = dec(MidA(ls_qa,1,1)) + dec("0." + MidA(ls_qa,2,2))
		if this.object.sheet[ll_row] = "S" then
			this.object.length[ll_row] = dec(MidA(ls_qa,10,4))
			this.object.swid[ll_row] = dec(MidA(ls_qa,5,4))
		else
			this.object.swid[ll_row] = dec(MidA(ls_qa,5,4)) + dec("0." + MidA(ls_qa,10,1))
		end if

		this.setredraw(true)
		this.groupcalc()
		
	case 'sheet'
		 return 1
		
	case 'cnt', 'unit_qty'
		if isnull(data) or data = '' then return 1
		
	case 'thin', 'swid', 'length'
		if isnull(data) or data = '' then return 1
		
		this.setredraw(false)
		ls_wid = trim(string(integer(truncate(this.object.swid[ll_row],0)),"0000"))
		if isnull(ls_wid) or trim(ls_wid) = '' &
			or truncate(this.object.swid[ll_row],0) <> this.object.swid[ll_row] then
			if this.object.sheet[ll_row] = "S" then
				ls_wid2 = RightA("0000" + string(integer(truncate(this.object.length[ll_row],0))), 4)
			else
				ls_wid2 = LeftA(string(integer( &
				mod(this.object.swid[ll_row], truncate(this.object.swid[ll_row],0))* 10)) + "0000", 4)
			end if
		else
			if this.object.sheet[ll_row] = "S" then
				ls_wid2 = RightA("0000" + string(integer(truncate(this.object.length[ll_row],0))), 4)
			else
				ls_wid2 = "0000"
			end if
		end if
		ls_thin = trim(string(this.object.thin[ll_row] * 100 ,"###"))
		ls_qa = RightA("000" + ls_thin, 3) + "X" +ls_wid + "X" + ls_wid2 + "X00000"
		this.object.qa[ll_row] = ls_qa
		if this.object.sheet[ll_row] = "S" then
			if MidA(dw_2.object.item_no[ll_row], 3,1 ) = "A" then
				ld_yrate = id_arate
			else
				ld_yrate = id_srate
			end if // sheet 단중 = 두께 * 폭 * 길이 * 요율(스틸 = 8.12, 알미늄 = 2.72)
			
			if dw3.rowcount() > 0 and dw3.object.wid[1] > 0 and this.object.unit_qty[ll_row] > 0 then
				this.object.cnt[ll_row] = truncate(this.object.swid[ll_row] / dw3.object.wid[1] &
												 * ld_yrate / this.object.unit_qty[ll_row] / 1000000,0)
			end if
		end if
		this.setredraw(true)
		this.groupcalc()
	case 'r_item_no'
		this.getchild("r_qa", idwc_r_qa)
		idwc_r_qa.retrieve(data)
end choose
wf_calc2(ll_row)
postevent('ue_1')
return 0

end event

event dw_2::itemerror;string ls_data

CHOOSE CASE dwo.name
	CASE 'item_no'
		setnull(ls_data)
		this.object.item_no[row] = ls_data
	case 'thin'
		this.object.thin[row] = 0
	case 'unit_qty'
		this.object.unit_qty[row] = 0
	case 'swid'
		this.object.swid[row] = 0
	case 'length'
		this.object.length[row] = 0
	case 'cnt'
		this.object.cnt[row] = 0
	case 'sheet'
		setnull(ls_data)
		this.object.item_no[row] = ls_data
		this.object.qa[row] = ls_data
END CHOOSE

return 2
end event

event dw_2::rowfocuschanged;string ls_item
long ll_row


this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then return

ls_item = this.object.item_no[ll_row]		  
this.setredraw(false)
ls_item = this.object.item_no[ll_row]
if ls_item = '' or isnull(ls_item) then
	
else
	idwc_qa.setfilter("item_no = '" + ls_item + "'")
	idwc_qa.filter()
end if
this.setredraw(true)

end event

event dw_2::losefocus;this.accepttext()
end event

event dw_2::doubleclicked;call super::doubleclicked;
choose case dwo.name
	case "r_item_no", "groupitem_item_name_1"
		gs_where2 lstr_select
		
		lstr_select.chk = "S"
		openwithparm(w_whitemselectmulti_w,lstr_select)
		lstr_select = Message.PowerObjectParm
		if lstr_select.chk = "Y" then
			this.object.r_item_no[row] = lstr_select.str1[1]
			this.object.groupitem_item_name_1[row] = lstr_select.name[1]
			this.event itemchanged(row, this.object.r_item_no, this.object.r_item_no[row])
			this.setcolumn('cnt')
			this.setcolumn('r_qa')
		end if
		
	case else
end choose

end event

type st_title from w_inheritance`st_title within w_mpsliting_m
integer x = 55
integer y = 48
integer width = 1312
integer height = 120
string text = "스리팅 계획관리"
end type

type st_tips from w_inheritance`st_tips within w_mpsliting_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsliting_m
boolean visible = false
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsliting_m
boolean visible = false
integer x = 2875
end type

type pb_close from w_inheritance`pb_close within w_mpsliting_m
integer x = 4201
integer y = 60
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsliting_m
boolean visible = false
integer x = 2533
integer y = 36
integer width = 274
integer taborder = 170
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확정및 출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpsliting_m
boolean visible = false
integer taborder = 180
end type

type pb_delete from w_inheritance`pb_delete within w_mpsliting_m
integer x = 3808
integer y = 60
integer taborder = 190
end type

event pb_delete::clicked;//
dwItemStatus l_status
long    ll_row
integer li_calccnt
string  ls_coilno, ls_loc
dec{1}  ld_wid

dw3.accepttext()
dw4.accepttext()

choose case tab_1.SelectedTab
	case 2	// 코일합체내역
		if dw4.getrow() < 1 then return		
		ll_row     = dw4.getrow()
		
		ls_coilno  = dw4.object.coil_no[ll_row]
		ld_wid     = dw4.object.wid[ll_row]
		ls_loc     = dw4.object.loc_no[ll_row]
		li_calccnt = dw4.object.coilmst_qcnt[ll_row]
		
		l_status   = dw4.GetItemStatus(ll_row,0, Primary!)
		if l_status = New! or l_status = NewModified! then 
			dw4.deleterow(ll_row)
			return
		else
			dw4.deleterow(ll_row)
			
			UPDATE coilmst 
			   SET open_close = "O" // 생산계획 작성중
			 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc AND qcnt <> 0;			 
			if sqlca.sqlcode <> 0 then
				messagebox('오류1',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext, exclamation!)
				rollback;
				return
			end if
		end if
		
		if wf_update1(dw4, 'Y') = true then
		else
			MessageBox("확인","코일합체내역 항목 삭제중 오류가 발생 했습니다. [" + ls_coilno + "]")
		end if
		
	case 1	// 원코일내역
		date ld_start, ld_end 
		
		if dw3.rowcount() < 1 then return
		
		l_status = dw3.GetItemStatus(1,0, Primary!)
		if l_status = New! or l_status = NewModified! then 
			dw3.reset()
			dw_2.reset()
			dw_1.retrieve( ld_start, ld_end, 'O' )
			return
		end if
		
		ls_coilno = dw3.object.coil_no[1]
		ls_loc    = dw3.object.loc_no[1]
		ld_wid    = dw3.object.wid[1]
		
		UPDATE coilmst 
		   SET open_close = "O"// 생산계획 작성중
		 WHERE coil_no  = :ls_coilno AND loc_no = :ls_loc AND qcnt <> 0;
		if sqlca.sqlcode <> 0 then
			messagebox('오류2',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
			rollback;
			return
		end if
		
		dw_2.accepttext()
		if dw_2.rowcount() > 0 then
			if MessageBox("확인", "스리팅 작업지시 상세내역이 있습니다. 삭제하시겠습니까?", &
				Exclamation!, OKCancel!, 2) = 2 then 
				return
			end if
			
			dw_2.rowsmove( 1, dw_2.rowcount(), primary!, dw_2, 1, delete! )
		end if
		
		for ll_row = 1 to dw4.rowcount()
			ls_coilno = dw4.object.coil_no[ll_row]
			ls_loc    = dw4.object.loc_no[ll_row]
			ld_wid    = dw4.object.wid[ll_row]
			
			UPDATE coilmst 
			   SET open_close = "O" // 생산계획 작성중
			 WHERE coil_no = :ls_coilno AND loc_no = :ls_loc AND qcnt <> 0;
			if sqlca.sqlcode <> 0 then
				messagebox('오류1',"코일마스터에 자료가 없습니다.~r~n" + sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
		next
		
		dw4.rowsmove( 1, dw4.rowcount(), primary!, dw4, 1, delete! )
		dw3.rowsmove( 1, dw3.rowcount(), primary!, dw3, 1, delete! )
		
		///////////////////////
		// 저장
		///////////////////////
		if wf_update3(dw3, dw_2, dw4, 'Y') = true then
			ld_start = date(em_1.text)
			ld_end   = date(em_2.text)			
			dw_1.retrieve( ld_start, ld_end, 'O' )
		end if
end choose

end event

type pb_insert from w_inheritance`pb_insert within w_mpsliting_m
integer x = 3616
integer y = 60
integer taborder = 210
end type

event pb_insert::clicked;//
string ls_item
long   ll_row

choose case tab_1.SelectedTab
	case 1	// 원코일내역
		dwItemStatus l_status
		
		dw3.accepttext()
		dw_2.accepttext()
		
		l_status = dw3.GetItemStatus(1,0, Primary!)			
		if l_status = New! or l_status = NewModified! then 
			if dw_2.rowcount() > 0 then
				if MessageBox("확인", "작업지시내역이 있습니다. 취소하시겠습니까?", &
					Exclamation!, OKCancel!, 2) = 2 then 
					return
				end if
			end if
		end if
		
		dw3.reset()
		dw4.reset()
		dw_2.reset()
		
		dw3.insertrow(1)
		dw3.object.order_date[1] = wf_today()
		tab_1.tabpage_2.enabled  = false

	case 2	// 코일합체내역
		dw4.accepttext()
		if dw3.rowcount() > 0 then
			if dw4.rowcount() < 1 then
				ll_row = dw4.insertrow(0)

				dw3.accepttext()
				ls_item = dw3.object.coilmst_item_no[1]
				dw4.object.coilmst_item_no[ll_row] = ls_item
				
				is_where  = ' and item_no = ~~"' + ls_item + '~~" ' 
				is_clause = "DataWindow.Table.Select='"  + is_select + is_where + "'"
				idwc_coil4.modify(is_clause)
				idwc_coil4.settransobject(sqlca)
				idwc_coil4.retrieve()
			else
				ll_row = dw4.insertrow(0)
				dw4.object.coilmst_item_no[ll_row] = dw4.object.coilmst_item_no[ll_row -1]
			// dw_4.itemchanged event 참조
			//	dw4.object.wid[ll_row]             = dw4.object.wid[ll_row -1]			// 폭
			//	dw4.object.unit_qty[ll_row]        = dw4.object.unit_qty[ll_row -1]	// 단중
			//	dw4.object.cnt[ll_row]             = 1											// 수량
			end if
		end if
end choose

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsliting_m
integer x = 3424
integer y = 60
integer taborder = 200
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end 

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

tab_1.tabpage_2.dw_4.reset()
dw_1.retrieve( ld_start, ld_end, 'O' )

this.default = true

end event

type gb_3 from w_inheritance`gb_3 within w_mpsliting_m
integer x = 2345
integer y = 16
integer width = 1024
integer height = 208
integer taborder = 100
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsliting_m
boolean visible = false
integer x = 567
integer y = 188
integer width = 1678
integer height = 652
integer taborder = 120
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsliting_m
integer x = 3387
integer y = 16
integer width = 1033
integer height = 208
integer taborder = 50
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_mpsliting_m
integer x = 2382
integer y = 96
integer width = 421
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpsliting_m
integer x = 2903
integer y = 96
integer width = 421
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_mpsliting_m
integer x = 2807
integer y = 84
integer width = 78
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mpsliting_m
integer x = 3346
integer y = 232
integer width = 347
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "T 기준표"
end type

event clicked;//
tab_2.visible = not tab_2.visible

end event

type pb_5 from picturebutton within w_mpsliting_m
integer x = 4110
integer y = 1152
integer width = 151
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;//
long   ll_row, ll_dw2row, ll_front, ll_seq
string ls_sliting, ls_coil, ls_item, ls_item2, ls_null, ls_itemname, ls_qa

dw3.accepttext()
dw_2.accepttext()
if dw3.rowcount() < 1 then 
	messagebox("확인", "계획헤더를 입력하십시요")
	return
end if

dw3.accepttext()
ll_row = dw_2.insertrow(0)

dw_2.scrolltorow(ll_row)

dw_2.object.thin[ll_row]   = dw3.object.rt[1]
dw_2.object.length[ll_row] = dw3.object.coilmst_length[1] / dw3.object.div[1]
ll_seq = dw_2.rowcount()

if ll_seq > 1 then
	ll_front = dw_2.object.seq[ll_row - 1]
	dw_2.object.seq[ll_row]     = ll_front + 1
	dw_2.object.item_no[ll_row] = dw_2.object.item_no[ll_row - 1]
	dw_2.object.sheet[ll_row]   = dw_2.object.sheet[ll_row - 1]
	dw_2.object.groupitem_item_name[ll_row] = dw_2.object.groupitem_item_name[ll_row - 1]
else
	dw_2.object.seq[ll_row] = ll_row
	
	//M1S1G80K00 <= 원코일 코드 예
	//M3S1S80K00 <= 스리팅코일 코드 예
	ls_item = dw3.object.coilmst_item_no[1]
	CHOOSE CASE LeftA(ls_item, 5) 
		CASE 'M1S1C'  // CGI COIL
			ls_item2 = MidA(ls_item,1,1) + "3" + MidA(ls_item,3,8)
		CASE 'M1S1G', 'M1S1W'
			ls_item2 = MidA(ls_item,1,1) + "3" + MidA(ls_item,3,2) + "S" + MidA(ls_item,6,5)
		CASE ELSE
			ls_item2 = MidA(ls_item,1,1) + "3" + MidA(ls_item,3,8)
	END CHOOSE

	dw_2.object.item_no[ll_row] = ls_item2
	
	setnull(ls_null)
	ls_itemname = ls_null
	select item_name into :ls_itemname from groupitem where item_no = :ls_item2;
	if sqlca.sqlcode = 100 then 
	  dw_2.object.item_no[ll_row] = ls_null
	end if
	dw_2.object.groupitem_item_name[ll_row] = ls_itemname
	
	if ls_item2 <> '' and not isnull(ls_item2) then
		dw_2.getchild("qa", idwc_qa)
		gs_ds_qaall.ShareData(idwc_qa)
		idwc_qa.setfilter("item_no = '" + ls_item2 + "'")
		idwc_qa.filter()
		if idwc_qa.rowcount() = 1 then
			ls_qa = trim(idwc_qa.getitemstring(1,'qa'))
			dw_2.object.qa[ll_row] = ls_qa
		end if
	end if
end if

//pb_save.default = true
dw_2.setcolumn('swid')
dw_2.setfocus()

end event

type pb_6 from picturebutton within w_mpsliting_m
integer x = 4270
integer y = 1152
integer width = 151
integer height = 120
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;//
dw_2.accepttext()

if dw_2.rowcount() > 0 then	
   dw_2.deleterow(dw_2.getrow())
end if

//pb_save.default = true
//

end event

type tab_1 from tab within w_mpsliting_m
integer x = 933
integer y = 232
integer width = 3488
integer height = 912
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
integer selectedtab = 1
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
integer y = 100
integer width = 3451
integer height = 796
long backcolor = 79741120
string text = "원코일내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_3 cb_3
dw_3 dw_3
cb_2 cb_2
end type

on tabpage_1.create
this.cb_3=create cb_3
this.dw_3=create dw_3
this.cb_2=create cb_2
this.Control[]={this.cb_3,&
this.dw_3,&
this.cb_2}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.cb_2)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 3040
integer y = 252
integer width = 398
integer height = 112
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "로스폭을 0로"
end type

event clicked;//
dw3.accepttext()
if dw3.rowcount() < 1 then return

dw3.object.los_width[1] = 0
//dw3.object.los_qty[1] = 0

//pb_save.default = true

end event

type dw_3 from datawindow within tabpage_1
integer x = 27
integer y = 12
integer width = 2720
integer height = 772
integer taborder = 90
string dataobject = "d_mpslitingone_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
this.accepttext()

end event

event itemchanged;//
string ls_data, ls_item, ls_itemname, ls_qa1, ls_null
long   ll_row
dec{2} ld_null

setnull(ls_null)
setnull(ld_null)

this.accepttext()
ll_row = this.getrow()

if ll_row < 1 then return

ls_item = this.object.coilmst_item_no[ll_row]
choose case dwo.name
	case 'coilmst_item_no'
		ls_data = data
		this.object.groupitem_item_name[ll_row] = ls_null
		this.object.rt[ll_row]                  = ld_null
		this.object.coil_no[ll_row]             = ls_null
		SELECT item_name INTO :ls_itemname FROM groupitem WHERE item_no = :ls_data;
		if sqlca.sqlcode = 100 then return 1

		this.object.groupitem_item_name[ll_row] = ls_itemname
		this.object.coil_no[ll_row]             = ls_null
		
		is_where  = ' and item_no = ~~"' + ls_data + '~~" ' 
		is_clause = "DataWindow.Table.Select='"  + is_select + is_where + "'"
		idwc_coil.modify(is_clause)
		idwc_coil.settransobject(sqlca)
		idwc_coil.retrieve()
		
		this.setcolumn('coil_no')
		this.setfocus()
		
	case 'coil_no'
		 this.object.coilmst_length[ll_row]   = idwc_coil.getitemnumber(idwc_coil.getrow(),'length')
		 this.object.loc_no[row]              = trim(idwc_coil.getitemstring(idwc_coil.getrow(),'loc_no'))
		 this.object.coilmst_loc_no[row]      = trim(idwc_coil.getitemstring(idwc_coil.getrow(),'loc_no'))
		 this.object.rt[ll_row]               = idwc_coil.getitemnumber(idwc_coil.getrow(),'thin')
		 this.object.wid[ll_row]              = idwc_coil.getitemnumber(idwc_coil.getrow(),'wid')
		 this.object.cnt[ll_row]              = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		 this.object.coilmst_qcnt[ll_row]     = idwc_coil.getitemnumber(idwc_coil.getrow(),'qcnt')
		 this.object.coilmst_unit_qty[ll_row] = idwc_coil.getitemnumber(idwc_coil.getrow(),'unit_qty')
		 
	case 'cnt'
		if integer(data) > this.object.coilmst_qcnt[ll_row] then
			messagebox("확인","재고수량보다 클수 없습니다")
			return 1
		end if
		
	case 'work_type'
		dw4.reset()
		if data = 'S' then
			this.object.div[ll_row] = 1
			tab_1.tabpage_2.enabled = true
		else
			tab_1.tabpage_2.enabled = false
		end if
end choose

wf_calc()

end event

event itemerror;CHOOSE CASE dwo.name
	CASE 'cnt'
		this.object.cnt[row] = this.object.coilmst_qcnt[row]
END CHOOSE
return 2
end event

event losefocus;this.accepttext()
end event

event rbuttondown;CHOOSE CASE dwo.name
	CASE 'order_date'
		openWithParm(w_calendar, message.stringparm)
		if message.stringparm <> 'N' then
			this.object.order_date[row] = date(message.stringparm)
		end if
END CHOOSE
this.accepttext()

end event

event retrieveend;//
this.accepttext()

if this.rowcount() < 1 then return

if this.object.work_type[1] = 'S' then
	tab_1.tabpage_2.enabled = true
else
	tab_1.tabpage_2.enabled = false
end if

end event

type cb_2 from commandbutton within tabpage_1
integer x = 3040
integer y = 456
integer width = 398
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "LOSS자동생성"
end type

event clicked;long   ll_row
string ls_item, ls_null, ls_itemname, ls_qa, ls_witem
STRING ls_wid, ls_wid2, ls_thin

dw_2.accepttext()
dw3.accepttext()
if dw3.rowcount() < 1 then 
	messagebox("확인", "계획헤더를 입력하십시요")
	return
end if

ll_row = dw_2.insertrow(0)
//los_qty
dw_2.scrolltorow(ll_row)
dw_2.object.thin[ll_row]     = dw3.object.rt[1]
dw_2.object.length[ll_row]   = dw3.object.coilmst_length[1] / dw3.object.div[1]
dw_2.object.swid[ll_row]     = dw3.object.los_width[1]
dw_2.object.unit_qty[ll_row] = dw3.object.los_qty[1]
dw_2.object.cnt[ll_row]      = 1
dw_2.object.sheet[ll_row]    = 'L'
//
ls_witem = dw3.object.coilmst_item_no[1]
setnull(ls_item)
SELECT loss_item INTO :ls_item FROM lossitem WHERE item_no = :ls_witem;

dw_2.object.item_no[ll_row] = ls_item
setnull(ls_null)
ls_itemname = ls_null

SELECT item_name INTO :ls_itemname FROM groupitem WHERE item_no = :ls_item;
if sqlca.sqlcode = 100 then 
	dw_2.object.item_no[ll_row] = ls_null
end if
dw_2.object.groupitem_item_name[ll_row] = ls_itemname
//
ls_wid  = trim(string(integer(truncate(dw3.object.los_width[1],0)),"0000"))
ls_wid2 = LeftA(string(integer( &
               mod(dw3.object.los_width[1], truncate(dw3.object.los_width[1],0))* 10)) + "0000", 4)
ls_thin = trim(string(dw3.object.rt[1] * 100 ,"###"))
ls_qa   = RightA("000" + ls_thin, 3) + "X" +ls_wid + "X" + ls_wid2 + "X00000"

dw_2.object.qa[ll_row] = ls_qa

if dw_2.rowcount() > 1 then
	dw_2.object.seq[ll_row] = dw_2.object.seq[ll_row - 1] + 1
else
	dw_2.object.seq[ll_row] = ll_row
end if

wf_calc()
//pb_save.default = true
dw_2.setcolumn('swid')
dw_2.setfocus()

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3451
integer height = 796
long backcolor = 79741120
string text = "코일합체내역"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_2.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_2
event ue_1 pbm_custom01
integer x = 27
integer y = 12
integer width = 3410
integer height = 760
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_mpslitingsum_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_1;wf_calc()

end event

event itemchanged;//
string ls_data, ls_null
long   ll_row
//dec{1} ld_null

setnull(ls_null)
//setnull(ld_null)

this.accepttext()
ll_row = this.getrow()

if ll_row < 1 then return

choose case dwo.name
	case 'coilmst_item_no'
		ls_data = data
//		this.object.groupitem_item_name[ll_row] = ls_null
//		this.object.rt[ll_row] = ld_null
		this.object.coil_no[ll_row] = ls_null
		
		is_where  = ' and item_no = ~~"' + ls_data + '~~" ' 
		is_clause = "DataWindow.Table.Select='"  + is_select + is_where + "'"
		idwc_coil4.modify(is_clause)
		idwc_coil4.settransobject(sqlca)
		idwc_coil4.retrieve()
		
		this.setcolumn('coil_no')
		this.setfocus()
		
	case 'coil_no'
		 this.object.coilmst_loc_no[ll_row] = idwc_coil4.getitemstring(idwc_coil4.getrow(),'loc_no')
		 this.object.loc_no[ll_row]         = idwc_coil4.getitemstring(idwc_coil4.getrow(),'loc_no')
//		 this.object.rt[ll_row]             = idwc_coil4.getitemnumber(idwc_coil4.getrow(),'thin')
		 this.object.wid[ll_row]            = idwc_coil4.getitemnumber(idwc_coil4.getrow(),'wid')			// 폭
		 this.object.coilmst_qcnt[ll_row]   = idwc_coil4.getitemnumber(idwc_coil4.getrow(),'qcnt')		// 재고수량
		 this.object.unit_qty[ll_row]       = idwc_coil4.getitemnumber(idwc_coil4.getrow(),'unit_qty')	// 단중
		 this.object.cnt[ll_row]            = 1																			// 수량
end choose

this.postevent('ue_1')

end event

event losefocus;this.accepttext()
end event

event rowfocuschanged;//
string ls_data, ls_item
long   ll_row

this.accepttext()
ll_row = this.getrow()
if ll_row < 1 then return

ls_item   = this.object.coilmst_item_no[ll_row]
is_where  = ' and item_no = ~~"' + ls_item + '~~" '				
is_clause = "DataWindow.Table.Select='"  + is_select + is_where + "'"
idwc_coil4.modify(is_clause)
idwc_coil4.settransobject(sqlca)
idwc_coil4.retrieve()
		


end event

type cb_4 from commandbutton within w_mpsliting_m
integer x = 2953
integer y = 232
integer width = 384
integer height = 88
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "SIMULATION"
end type

event clicked;dw_5.visible = not(dw_5.visible)
end event

type dw_5 from datawindow within w_mpsliting_m
boolean visible = false
integer x = 1125
integer y = 284
integer width = 2130
integer height = 1784
integer taborder = 110
boolean bringtotop = true
boolean titlebar = true
string title = "SIMULATION"
string dataobject = "d_mpsliting_s"
boolean controlmenu = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;this.accepttext()
end event

type st_6 from statictext within w_mpsliting_m
integer x = 32
integer y = 1216
integer width = 1746
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "제품 컬럼을 두번 클릭하여 팝업창에서 선택 입력하세요."
boolean focusrectangle = false
end type

type tab_2 from tab within w_mpsliting_m
event create ( )
event destroy ( )
integer x = 3323
integer y = 336
integer width = 535
integer height = 1056
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_3 tabpage_3
end type

on tab_2.create
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_3}
end on

on tab_2.destroy
destroy(this.tabpage_3)
end on

type tabpage_3 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 498
integer height = 940
long backcolor = 79741120
string text = "기준표"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
end type

on tabpage_3.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.st_2}
end on

on tabpage_3.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
end on

type st_5 from statictext within tabpage_3
integer x = 169
integer y = 492
integer width = 315
integer height = 432
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "0.75~~0.84 0.85~~0.95 0.96~~1.09 1.10~~1.16 1.17~~1.25 1.26~~1.55 1.56~~1.64 1.80~~2.00"
boolean border = true
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_3
integer x = 23
integer y = 492
integer width = 151
integer height = 432
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "0.80 0.90 1.00 1.15 1.20 1.50 1.60 2.00"
boolean border = true
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_3
integer x = 169
integer y = 16
integer width = 315
integer height = 480
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "  구  분  --------- 0.25~~0.32 0.33~~0.36 0.37~~0.42 0.43~~0.47 0.48~~0.54 0.55~~0.65 0.66~~0.74"
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_3
integer x = 23
integer y = 16
integer width = 151
integer height = 480
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "기준 ---- 0.30 0.35 0.40 0.45 0.50 0.60 0.70"
boolean border = true
boolean focusrectangle = false
end type

