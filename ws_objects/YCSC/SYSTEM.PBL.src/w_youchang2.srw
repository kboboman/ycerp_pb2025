$PBExportHeader$w_youchang2.srw
$PBExportComments$유창메인화면(작성일:98/01/18, 작성자:곽용덕)
forward
global type w_youchang2 from window
end type
type st_gl from statictext within w_youchang2
end type
type st_16 from statictext within w_youchang2
end type
type st_sale from statictext within w_youchang2
end type
type st_block from statictext within w_youchang2
end type
type st_15 from statictext within w_youchang2
end type
type st_crm from statictext within w_youchang2
end type
type st_9 from statictext within w_youchang2
end type
type st_r1 from statictext within w_youchang2
end type
type st_2 from statictext within w_youchang2
end type
type st_l2 from statictext within w_youchang2
end type
type st_l1 from statictext within w_youchang2
end type
type phl_reret from picturehyperlink within w_youchang2
end type
type st_next10 from statictext within w_youchang2
end type
type st_pre10 from statictext within w_youchang2
end type
type st_p9 from statictext within w_youchang2
end type
type st_p10 from statictext within w_youchang2
end type
type st_p5 from statictext within w_youchang2
end type
type st_p6 from statictext within w_youchang2
end type
type st_p8 from statictext within w_youchang2
end type
type st_p7 from statictext within w_youchang2
end type
type st_p3 from statictext within w_youchang2
end type
type st_p4 from statictext within w_youchang2
end type
type st_p2 from statictext within w_youchang2
end type
type st_p1 from statictext within w_youchang2
end type
type st_17 from statictext within w_youchang2
end type
type st_cost from statictext within w_youchang2
end type
type st_14 from statictext within w_youchang2
end type
type p_4 from picture within w_youchang2
end type
type st_8 from statictext within w_youchang2
end type
type st_7 from statictext within w_youchang2
end type
type st_6 from statictext within w_youchang2
end type
type st_bd from statictext within w_youchang2
end type
type st_5 from statictext within w_youchang2
end type
type st_4 from statictext within w_youchang2
end type
type st_3 from statictext within w_youchang2
end type
type st_busi from statictext within w_youchang2
end type
type st_co from statictext within w_youchang2
end type
type st_sys from statictext within w_youchang2
end type
type st_mps from statictext within w_youchang2
end type
type st_in from statictext within w_youchang2
end type
type st_tips from statictext within w_youchang2
end type
type pb_exit from picturebutton within w_youchang2
end type
type pb_1 from picturebutton within w_youchang2
end type
type st_11 from statictext within w_youchang2
end type
type st_13 from statictext within w_youchang2
end type
type st_10 from statictext within w_youchang2
end type
type st_12 from statictext within w_youchang2
end type
type cb_1 from commandbutton within w_youchang2
end type
type phl_ins from picturehyperlink within w_youchang2
end type
type phl_next from picturehyperlink within w_youchang2
end type
type phl_pre from picturehyperlink within w_youchang2
end type
type phl_ret from picturehyperlink within w_youchang2
end type
type sle_1 from singlelineedit within w_youchang2
end type
type ddlb_1 from dropdownlistbox within w_youchang2
end type
type st_wht from statictext within w_youchang2
end type
type st_tot from statictext within w_youchang2
end type
type st_1 from statictext within w_youchang2
end type
type dw_2 from datawindow within w_youchang2
end type
type dw_1 from datawindow within w_youchang2
end type
type dw_3 from datawindow within w_youchang2
end type
type dw_4 from datawindow within w_youchang2
end type
end forward

global type w_youchang2 from window
integer x = 5
integer y = 4
integer width = 4695
integer height = 2964
boolean titlebar = true
string title = "YC ERP SYSTEM"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
boolean center = true
event ue_1 pbm_custom01
st_gl st_gl
st_16 st_16
st_sale st_sale
st_block st_block
st_15 st_15
st_crm st_crm
st_9 st_9
st_r1 st_r1
st_2 st_2
st_l2 st_l2
st_l1 st_l1
phl_reret phl_reret
st_next10 st_next10
st_pre10 st_pre10
st_p9 st_p9
st_p10 st_p10
st_p5 st_p5
st_p6 st_p6
st_p8 st_p8
st_p7 st_p7
st_p3 st_p3
st_p4 st_p4
st_p2 st_p2
st_p1 st_p1
st_17 st_17
st_cost st_cost
st_14 st_14
p_4 p_4
st_8 st_8
st_7 st_7
st_6 st_6
st_bd st_bd
st_5 st_5
st_4 st_4
st_3 st_3
st_busi st_busi
st_co st_co
st_sys st_sys
st_mps st_mps
st_in st_in
st_tips st_tips
pb_exit pb_exit
pb_1 pb_1
st_11 st_11
st_13 st_13
st_10 st_10
st_12 st_12
cb_1 cb_1
phl_ins phl_ins
phl_next phl_next
phl_pre phl_pre
phl_ret phl_ret
sle_1 sle_1
ddlb_1 ddlb_1
st_wht st_wht
st_tot st_tot
st_1 st_1
dw_2 dw_2
dw_1 dw_1
dw_3 dw_3
dw_4 dw_4
end type
global w_youchang2 w_youchang2

type variables
int  il_sw, ii_sel = 1
long il_first_rid = 2147483647, il_last_rid = 0 , il_curr_page = 0, il_totcnt
string is_first_level = ' ', is_last_level = FillA('Z', 255),  is_title = '%', is_user = '%'
boolean  ib_ref = false
statictext ist_st[10]
end variables

forward prototypes
public subroutine wf_clearselection ()
public subroutine wf_vis1 ()
public subroutine wf_vis0 ()
public subroutine wf_dw2vis ()
public subroutine wf_dw3vis (string as_up)
public subroutine wf_dw1vis ()
public subroutine wf_dw4vis ()
public subroutine wf_dw1ret (integer ai_int)
public subroutine wf_stpos ()
public subroutine wf_stmouse (statictext ast_st)
public subroutine wf_st_clicked (integer ai_num, boolean ab_sel)
end prototypes

event ue_1;//////////////////////////////////////////
// Event Name : ue_1
//////////////////////////////////////////
// Return Type: long
// Access     : public
// Argument Name : wparam
// Argument Type : unsignedlong
// Pass By       : value
// Argument Name : lparam
// Argument Type : long
// Pass By       : value
// EventID : pbm_custom01
//////////////////////////////////////////
int    li_cnt
String ls_msgchk

ls_msgchk = ProfileString("YCSC.INI", "MessageBox", "Check", " ")
if ls_msgchk = 'Y' then
	RETURN
elseif ls_msgchk = 'N' or IsNull(ls_msgchk) then
	SELECT count(*) INTO :li_cnt FROM sysmsg WHERE tlogin = :gs_userid AND del = "N";
	if li_cnt > 0 then
		if MessageBox("메시지","확인 되지 않은 메시지가 " + string(li_cnt) + " 개 있습니다 ~r~n" + &
						  "메지시를 확인하시겠읍니까", Exclamation!, OKCancel!, 2) = 1 then
			gs_custper_str lstr_where
			lstr_where.str_ok = true
			openwithparm(w_sysmsg_m,lstr_where)
			w_sysmsg_m.WindowState = Normal!
		end if
	end if
else
	RETURN
end if
end event

public subroutine wf_clearselection ();// Function Name : wf_clearselection

st_busi.TextColor = RGB(0, 0, 0)	////영업정보
st_busi.Border    = FALSE

st_sale.TextColor = RGB(0, 0, 0)	////판매관리
st_sale.Border    = FALSE

st_mps.TextColor  = RGB(0, 0, 0)	////생산관리
st_mps.Border     = FALSE

st_in.TextColor   = RGB(0, 0, 0)	////자재관리
st_in.Border      = FALSE

st_crm.TextColor  = RGB(0, 0, 0)	////CRM
st_crm.Border     = FALSE

//st_block.TextColor = RGB(0, 0, 0)	////CRM
//st_block.Border = FALSE

st_cost.TextColor = RGB(0, 0, 0)	////원가관리
st_cost.Border    = FALSE

st_sys.TextColor  = RGB(0, 0, 0)	////시스템 관리
st_sys.Border     = FALSE

//st_co.TextColor = RGB(0, 0, 0)	////공무관리
//st_co.Border    = FALSE
//
//st_bd.TextColor = RGB(0, 0, 0)	////공사정보관리
//st_bd.Border    = FALSE

st_gl.TextColor   = RGB(0, 0, 0)	////회계관리
st_gl.Border      = FALSE

//st_per.TextColor = RGB(0, 0, 0) ////인사관리
//st_per.Border    = FALSE
//
//st_pr.TextColor = RGB(0, 0, 0)	////급여관리
//st_pr.Border    = FALSE
//
//st_wk.TextColor = RGB(0, 0, 0)	////근태관리
//st_wk.Border    = FALSE

end subroutine

public subroutine wf_vis1 ();// Function Name : wf_vis1

st_wht.visible    = true
phl_ins.visible   = true
phl_pre.visible   = true
phl_next.visible  = true
phl_ret.visible   = true

sle_1.visible     = true
ddlb_1.visible    = true
phl_reret.visible = true
end subroutine

public subroutine wf_vis0 ();// Function Name : wf_vis0

st_wht.visible    = false
phl_ins.visible   = false
phl_pre.visible   = false
phl_next.visible  = false
phl_ret.visible   = false

sle_1.visible     = false
ddlb_1.visible    = false
phl_reret.visible = false
end subroutine

public subroutine wf_dw2vis ();// Function Name : wf_dw2vis
dw_2.visible = true
wf_vis0()
dw_1.visible = false
dw_3.visible = false
dw_4.visible = false

dw_2.setcolumn('title')
dw_2.setfocus()

end subroutine

public subroutine wf_dw3vis (string as_up);/////////////////////////////////////////////
// Function Name : wf_dw3vis
//   Return Type : None
// Argument Name : as_up
//          Type : string
/////////////////////////////////////////////

long ld_seq
int  ll_row

ll_row = dw_1.getrow()
ld_seq = dw_1.object.id_seq[ll_row]

// 관리자, 작성자, 같은팀 
if gs_userid = dw_1.object.user_id[ll_row] or gs_userid = '1999010s' or LeftA(gs_team, 1) = 'X' then
	dw_3.object.p_up.visible  = true
	dw_3.object.p_del.visible = true
else
	dw_3.object.p_up.visible  = false
	dw_3.object.p_del.visible = false
end if

if as_up = 'Y' then
	if dw_1.object.user_id[ll_row] <> gs_userid then
		dw_1.object.ret_cnt[ll_row] = dw_1.object.ret_cnt[ll_row] + 1
		if dw_1.update()  = 1 then
			commit;
		else
			rollback;
			return
		end if
	end if
end if

dw_3.retrieve(ld_seq)
dw_3.visible = true

wf_vis0()
dw_1.visible = false
dw_2.visible = false
dw_4.visible = false
dw_3.setfocus()
end subroutine

public subroutine wf_dw1vis ();// Function Name : wf_dw1vis

dw_1.retrieve(il_first_rid, is_first_level, is_title, is_user)
dw_1.visible = true
wf_vis1()
dw_2.visible = false
dw_3.visible = false
dw_4.visible = false
dw_1.setfocus()

end subroutine

public subroutine wf_dw4vis ();// Function Name : wf_dw4vis

long ll_seq

ll_seq = dw_1.object.id_seq[dw_1.getrow()]
dw_4.retrieve(ll_seq)
dw_4.visible = true

wf_vis0()
dw_2.visible = false
dw_1.visible = false
dw_3.visible = false

dw_4.setcolumn('board_text')
dw_4.setfocus()

end subroutine

public subroutine wf_dw1ret (integer ai_int);// Function Name : wf_dw1ret
//          Type : None
// Argument Name : ai_int
//          Type : integer

il_first_rid   = 2147483647
is_first_level = ' '
ai_int = ai_int * 20 + 1

SELECT top 1 B.rid , B.level INTO :il_first_rid, :is_first_level
  FROM (SELECT top :ai_int rid, level  
          FROM ycboard, login
		   WHERE ( rid < :il_first_rid or (rid = :il_first_rid and level >= :is_first_level ) )
			  AND user_name       LIKE :is_user
			  AND title           LIKE :is_title
			  AND ycboard.user_id    = login.user_id
		   ORDER BY ycboard.rid DESC, ycboard.level ASC 
		 ) B
 ORDER BY B.rid ASC, B.level DESC;
 
dw_1.retrieve(il_first_rid, is_first_level, is_title, is_user)
dw_1.retrieve(il_first_rid, is_first_level, is_title, is_user)

end subroutine

public subroutine wf_stpos ();// Function Name : wf_stpos

long ll_st_r1_x, ll_curr_x
int li_first, li_top, li_cnt, li_page, li_stx

select count(ycboard.id_seq) into :il_totcnt 
  from ycboard, login
 WHERE user_name LIKE :is_user
	AND title LIKE :is_title
	AND ycboard.user_id = login.user_id;

st_tot.text = "전체 : " + string(il_totcnt) + " 건"

ll_st_r1_x = st_r1.x
li_first = integer(st_p1.text)

// [ 이전 10개 ]개 enabled rgb(192,192,192)
if li_first = 1 then
	st_pre10.enabled   = false
	st_pre10.textcolor = rgb(0,0,0)
else
	st_pre10.enabled   = true
	st_pre10.textcolor = rgb(0,0,160)
end if

// width가 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.
ll_curr_x = ll_st_r1_x
for li_page = li_first + 9  to  li_first step -1
	li_top = (li_page - 1) * 20 + 1
	li_stx = mod(li_page, 10)
	if li_stx = 0 then li_stx = 10
	
	if il_totcnt > li_top then
		ist_st[li_stx].text      = string(li_page)
		ist_st[li_stx].visible   = true
		ist_st[li_stx].textcolor = rgb(0,0,160)
		ist_st[li_stx].width     = 65 + (LenA(string(li_page)) -1 ) * 32
		ll_curr_x = ll_curr_x - ist_st[li_stx].width
		ist_st[li_stx].x         = ll_curr_x
		st_next10.enabled   = true
		st_next10.textcolor = rgb(255,0,0)
	else
		ist_st[li_stx].visible = false
		st_next10.enabled      = false
		st_next10.textcolor    = rgb(0,0,0)
//		ist_st[mod(li_page, 10)].textcolor = rgb(0,0,0)
	end if
next
ll_curr_x = ll_curr_x - st_l2.width
st_l2.x   = ll_curr_x

ll_curr_x  = ll_curr_x - st_pre10.width
st_pre10.x = ll_curr_x

ll_curr_x  = ll_curr_x - st_l1.width
st_l1.x    = ll_curr_x

// [ 다음 10개 ]개 enabled rgb(192,192,192)

end subroutine

public subroutine wf_stmouse (statictext ast_st);///////////////////////////////////////////////////////
// Function Name : wf_stmouse
// Return Type   : None
// Access        : Public
// Argument Name : ast_st
// Argument Type : statictext
// Pass By       : value
///////////////////////////////////////////////////////

long li_cnt

for li_cnt = 1 to 10
	if ist_st[li_cnt] = ast_st then
		ist_st[li_cnt].textcolor = rgb(255,0,0)
	else
		ist_st[li_cnt].textcolor = rgb(0,0,160)
	end if
next

st_pre10.textcolor  = rgb(0,0,160)
st_next10.textcolor = rgb(0,0,160)

end subroutine

public subroutine wf_st_clicked (integer ai_num, boolean ab_sel);/////////////////////////////////////////////////////
// Function Name : wf_st_clicked
//          Type : None
// Argument Name : ai_num
//          Type : integer
//          Name : ab_sel
//          Type : boolean
/////////////////////////////////////////////////////
// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.
int li_cnt, li_mod

il_curr_page = ai_num - 1
for li_cnt = 1 to 10
	ist_st[li_cnt].Border = false
next

if ab_sel = false then
	st_p1.Border = true
else
	li_mod = mod(ai_num, 10)
	if li_mod = 0 then li_mod = 10
	ist_st[li_mod].Border = true
end if

wf_dw1ret(il_curr_page)
dw_1.visible = true
wf_vis1()

dw_2.visible = false
dw_3.visible = false
dw_4.visible = false
dw_1.setfocus()

end subroutine

on w_youchang2.create
this.st_gl=create st_gl
this.st_16=create st_16
this.st_sale=create st_sale
this.st_block=create st_block
this.st_15=create st_15
this.st_crm=create st_crm
this.st_9=create st_9
this.st_r1=create st_r1
this.st_2=create st_2
this.st_l2=create st_l2
this.st_l1=create st_l1
this.phl_reret=create phl_reret
this.st_next10=create st_next10
this.st_pre10=create st_pre10
this.st_p9=create st_p9
this.st_p10=create st_p10
this.st_p5=create st_p5
this.st_p6=create st_p6
this.st_p8=create st_p8
this.st_p7=create st_p7
this.st_p3=create st_p3
this.st_p4=create st_p4
this.st_p2=create st_p2
this.st_p1=create st_p1
this.st_17=create st_17
this.st_cost=create st_cost
this.st_14=create st_14
this.p_4=create p_4
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_bd=create st_bd
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_busi=create st_busi
this.st_co=create st_co
this.st_sys=create st_sys
this.st_mps=create st_mps
this.st_in=create st_in
this.st_tips=create st_tips
this.pb_exit=create pb_exit
this.pb_1=create pb_1
this.st_11=create st_11
this.st_13=create st_13
this.st_10=create st_10
this.st_12=create st_12
this.cb_1=create cb_1
this.phl_ins=create phl_ins
this.phl_next=create phl_next
this.phl_pre=create phl_pre
this.phl_ret=create phl_ret
this.sle_1=create sle_1
this.ddlb_1=create ddlb_1
this.st_wht=create st_wht
this.st_tot=create st_tot
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.Control[]={this.st_gl,&
this.st_16,&
this.st_sale,&
this.st_block,&
this.st_15,&
this.st_crm,&
this.st_9,&
this.st_r1,&
this.st_2,&
this.st_l2,&
this.st_l1,&
this.phl_reret,&
this.st_next10,&
this.st_pre10,&
this.st_p9,&
this.st_p10,&
this.st_p5,&
this.st_p6,&
this.st_p8,&
this.st_p7,&
this.st_p3,&
this.st_p4,&
this.st_p2,&
this.st_p1,&
this.st_17,&
this.st_cost,&
this.st_14,&
this.p_4,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_bd,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_busi,&
this.st_co,&
this.st_sys,&
this.st_mps,&
this.st_in,&
this.st_tips,&
this.pb_exit,&
this.pb_1,&
this.st_11,&
this.st_13,&
this.st_10,&
this.st_12,&
this.cb_1,&
this.phl_ins,&
this.phl_next,&
this.phl_pre,&
this.phl_ret,&
this.sle_1,&
this.ddlb_1,&
this.st_wht,&
this.st_tot,&
this.st_1,&
this.dw_2,&
this.dw_1,&
this.dw_3,&
this.dw_4}
end on

on w_youchang2.destroy
destroy(this.st_gl)
destroy(this.st_16)
destroy(this.st_sale)
destroy(this.st_block)
destroy(this.st_15)
destroy(this.st_crm)
destroy(this.st_9)
destroy(this.st_r1)
destroy(this.st_2)
destroy(this.st_l2)
destroy(this.st_l1)
destroy(this.phl_reret)
destroy(this.st_next10)
destroy(this.st_pre10)
destroy(this.st_p9)
destroy(this.st_p10)
destroy(this.st_p5)
destroy(this.st_p6)
destroy(this.st_p8)
destroy(this.st_p7)
destroy(this.st_p3)
destroy(this.st_p4)
destroy(this.st_p2)
destroy(this.st_p1)
destroy(this.st_17)
destroy(this.st_cost)
destroy(this.st_14)
destroy(this.p_4)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_bd)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_busi)
destroy(this.st_co)
destroy(this.st_sys)
destroy(this.st_mps)
destroy(this.st_in)
destroy(this.st_tips)
destroy(this.pb_exit)
destroy(this.pb_1)
destroy(this.st_11)
destroy(this.st_13)
destroy(this.st_10)
destroy(this.st_12)
destroy(this.cb_1)
destroy(this.phl_ins)
destroy(this.phl_next)
destroy(this.phl_pre)
destroy(this.phl_ret)
destroy(this.sle_1)
destroy(this.ddlb_1)
destroy(this.st_wht)
destroy(this.st_tot)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_3)
destroy(this.dw_4)
end on

event open;string   ls_name, ls_database
date     ld_date
datetime ldt_date

SELECT REPLACE(area_name,'사업장',''), getdate() INTO :ls_name, :ldt_date 
  FROM area
 WHERE area_no = :gs_area;
 
this.title  = "[" + ls_name + "]" + this.title + " " + gs_ver + "[" + gs_level + "]"
ls_database = Upper(Trim(ProfileString("YCSC.INI","Database","DataBase"," ")) + "ERP SYSTEM")
st_5.text   = "송천 YC2012 " + ls_database

dw_1.x      = 1595
dw_1.y      = 312
dw_1.width  = 3040
dw_1.height = 2300

dw_2.x      = dw_1.x
dw_2.y      = 200
dw_2.width  = dw_1.width
dw_2.height = 2512

dw_3.x      = dw_2.x
dw_3.y      = dw_2.y
dw_3.width  = dw_2.width
dw_3.height = dw_2.height

dw_4.x      = dw_2.x
dw_4.y      = dw_2.y
dw_4.width  = dw_2.width
dw_4.height = dw_2.height

dw_1.visible = true
dw_2.visible = true
dw_3.visible = true
dw_4.visible = true

dw_1.settransobject(sqlca)
ist_st[1] = st_p1
ist_st[2] = st_p2
ist_st[3] = st_p3
ist_st[4] = st_p4
ist_st[5] = st_p5
ist_st[6] = st_p6
ist_st[7] = st_p7
ist_st[8] = st_p8
ist_st[9] = st_p9
ist_st[10] = st_p10

wf_dw1vis()
gf_loghis("I", this.title)

IF IsValid(w_login) = true THEN close(w_login)

THIS.X = (pixelstounits(ge_Environment.screenwidth,  xpixelstounits!) - this.width)  / 2
THIS.Y = (pixelstounits(ge_Environment.screenheight, ypixelstounits!) - this.height) / 2 - 150
This.Show()
Open(w_load)

ld_date = date(ldt_date)
ld_date = RelativeDate(ld_date, -30)

DELETE FROM loginhis WHERE in_date < :ld_date;
commit;

ld_date = RelativeDate(ld_date, -5)
DELETE FROM sysmsg   WHERE msgdate < :ld_date;
commit;
 
gs_ds_itemall = CREATE datastore
gs_ds_itemall.DataObject = 'd_item_all'
gs_ds_itemall.SetTransObject(SQLCA)
gs_ds_itemall.reset()

if FileExists("c:\Program Files\YCSC_main\itemall.TXT") = true then
	if gs_ds_itemall.ImportFile("c:\Program Files\YCSC_main\itemall.TXT") = 0 then
		gf_item()
	end if
else
	gf_item()
end if
//
gs_ds_qaall = CREATE datastore
gs_ds_qaall.DataObject = 'd_qa_all'
gs_ds_qaall.SetTransObject(SQLCA)
gs_ds_qaall.reset()
if FileExists("c:\Program Files\ycsc_main\QAAll.TXT") = true then
	if gs_ds_qaall.ImportFile("c:\Program Files\ycsc_main\QAAll.TXT") = 0 then
		gf_qa()
	end if
else
	gf_qa()
end if

//거래처 검색프로그램 w_whcustret_w
gs_ds_whcustret = CREATE datastore
gs_ds_whcustret.DataObject = 'd_whcustret_s'
gs_ds_whcustret.SetTransObject(SQLCA)
gs_ds_whcustret.reset()

if FileExists("c:\Program Files\ycsc_main\whcustret.TXT") = true then
	if gs_ds_whcustret.ImportFile("c:\Program Files\ycsc_main\whcustret.TXT") = 0 then
		gf_whcustret_all()
	end if
else
	gf_whcustret_all()
end if
Commit;

close(w_load)

if gs_userid = "TOP" then
	open(w_o_main)    // 판매관리 메인윈도우 오픈
   this.hide()			// 숨김
end if

//Timer(120)
//postevent('ue_1')
//
end event

event timer;int li_cnt
String  ls_msgchk

setnull(li_cnt)
ls_msgchk = ProfileString("YCSC.INI", "MessageBox", "Check", " ")

IF ls_msgchk = 'N' or IsNull(ls_msgchk) THEN
	SELECT count(*) INTO :li_cnt 
	  FROM sysmsg   WHERE tlogin = :gs_userid AND del = "N";
	if li_cnt > 0 then
		gs_custper_str lstr_where
		lstr_where.str_ok = true
		openwithparm(w_sysmsg_m,lstr_where)
	end if
ELSEIF  ls_msgchk  = 'Y' THEN
	Return
ELSE
	Return
END IF

end event

event close;gf_loghis("O", "")

end event

type st_gl from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 1472
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "회 계  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
end event

type st_16 from statictext within w_youchang2
integer x = 279
integer y = 1332
integer width = 494
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean italic = true
boolean underline = true
long textcolor = 134217857
long backcolor = 33554431
boolean enabled = false
string text = "회 계  모 듈"
boolean focusrectangle = false
end type

type st_sale from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 592
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "판 매  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
end event

event clicked;long ll_cnt

SELECT COUNT(*) INTO :ll_cnt 
  FROM CODEMST
 WHERE TYPE   IN ('판매관리_입력','판매관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid;
 
if ll_cnt > 0 then
	open(w_o_main)  // 판매관리 메인윈도우 오픈
else
	MessageBox("확인", "판매관리 권한이 필요합니다.")
end if

end event

type st_block from statictext within w_youchang2
event mousemove pbm_mousemove
boolean visible = false
integer x = 558
integer y = 1772
integer width = 608
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "통 제  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
//this.Border = TRUE
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;
open(w_block_login)
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_15 from statictext within w_youchang2
boolean visible = false
integer x = 279
integer y = 1664
integer width = 503
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "System 모 듈"
boolean focusrectangle = false
end type

type st_crm from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 1864
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "인 적  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
//this.Border = TRUE
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;open(w_crm_main)  // 인적관리 메인윈도우 오픈

end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_9 from statictext within w_youchang2
integer x = 279
integer y = 1724
integer width = 494
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean italic = true
boolean underline = true
long textcolor = 134217857
long backcolor = 33554431
boolean enabled = false
string text = "C R M  모 듈"
boolean focusrectangle = false
end type

type st_r1 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 4142
integer y = 2644
integer width = 101
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 16777215
string text = "]["
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 4530
integer y = 2644
integer width = 55
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 16777215
string text = "]"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_l2 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3378
integer y = 2644
integer width = 101
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 16777215
string text = "]["
alignment alignment = center!
boolean focusrectangle = false
end type

type st_l1 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 2007
integer y = 2648
integer width = 55
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 16777215
string text = "["
alignment alignment = center!
boolean focusrectangle = false
end type

type phl_reret from picturehyperlink within w_youchang2
integer x = 2706
integer y = 220
integer width = 274
integer height = 80
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "C:\bmp\재조회.GIF"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;il_first_rid = 2147483647
il_last_rid = 0 
il_curr_page = 0
is_first_level = ' '
is_last_level = FillA('Z', 255)
is_title = '%'
is_user = '%'
wf_dw1vis()

end event

type st_next10 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 4242
integer y = 2644
integer width = 288
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "다음 10개"
alignment alignment = right!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
this.textcolor = rgb(255,0,0)

end event

event clicked;int li_int

li_int = integer(st_p1.text)
if il_totcnt < (integer(st_p1.text) + 10) * 20 then return
st_p1.text = string(integer(st_p1.text) + 10)
wf_st_clicked(li_int + 10, false)

end event

type st_pre10 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3090
integer y = 2644
integer width = 288
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "이전 10개"
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
this.textcolor = rgb(255,0,0)

end event

event clicked;int li_int

li_int = integer(st_p1.text)

st_p1.text = string(integer(st_p1.text) - 10)
wf_st_clicked(li_int - 11, false)

end event

event losefocus;ib_ref = false
end event

type st_p9 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3982
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "9"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p10 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 4046
integer y = 2644
integer width = 96
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "10"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p5 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3726
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "5"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p6 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3790
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "6"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p8 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3918
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "8"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)


end event

type st_p7 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3854
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "7"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p3 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3598
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "3"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p4 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3662
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "4"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p2 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3534
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "2"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_p1 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 3470
integer y = 2644
integer width = 64
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "1"
alignment alignment = center!
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

event clicked;// 46에서 시작하여 한자지수당 32씩 증가 , 20씩 띄고.

wf_st_clicked(integer(this.text), true)

end event

type st_17 from statictext within w_youchang2
integer x = 279
integer y = 2208
integer width = 494
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean italic = true
boolean underline = true
long textcolor = 134217857
long backcolor = 33554431
boolean enabled = false
string text = "관리자  모듈"
boolean focusrectangle = false
end type

type st_cost from statictext within w_youchang2
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1640
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "원가관리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event doubleclicked;open(w_ca_main)  // 생산관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_14 from statictext within w_youchang2
boolean visible = false
integer x = 178
integer y = 1512
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8388608
long backcolor = 33554431
boolean enabled = false
string text = "원 가  모 듈"
boolean focusrectangle = false
end type

type p_4 from picture within w_youchang2
integer x = 27
integer y = 20
integer width = 3186
integer height = 156
boolean enabled = false
string picturename = "c:\bmp\유창마크(black_shadow).bmp"
boolean border = true
boolean focusrectangle = false
end type

type st_8 from statictext within w_youchang2
boolean visible = false
integer x = 178
integer y = 1036
integer width = 763
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
long textcolor = 8421504
long backcolor = 33554431
boolean enabled = false
string text = "공 사  모 듈"
boolean focusrectangle = false
end type

type st_7 from statictext within w_youchang2
integer x = 279
integer y = 324
integer width = 494
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean italic = true
boolean underline = true
long textcolor = 134217857
long backcolor = 33554431
boolean enabled = false
string text = "물 류  모 듈"
boolean focusrectangle = false
end type

type st_6 from statictext within w_youchang2
integer x = 279
integer y = 820
integer width = 494
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean italic = true
boolean underline = true
long textcolor = 134217857
long backcolor = 33554431
boolean enabled = false
string text = "제 조  모 듈"
boolean focusrectangle = false
end type

type st_bd from statictext within w_youchang2
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1316
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
boolean enabled = false
string text = "공사정보"
boolean focusrectangle = false
end type

event mousemove;//if il_sw = 0 then
//	TextColor = RGB(0,0,255)
//	this.Border = TRUE
//	this.BorderStyle = StyleRaised!
//	il_sw = 1
//end if
//
end event

event doubleclicked;//open(w_b_main)  // 공사정보관리 메인윈도우 오픈
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

type st_5 from statictext within w_youchang2
integer x = 23
integer y = 2732
integer width = 1559
integer height = 100
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 65535
long backcolor = 8388608
boolean enabled = false
string text = "송천산업 SYSTEM"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_youchang2
integer x = 3223
integer y = 20
integer width = 1070
integer height = 152
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_3 from statictext within w_youchang2
integer x = 1586
integer y = 2732
integer width = 3040
integer height = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "문의:내선(770 - 부장 원용석,  773 - 대리 이재형)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_busi from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 456
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "영 업  정 보"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_op.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_o_main )
//m_opMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;open(w_b_main)  // 영업정보 메인윈도우 오픈

end event

type st_co from statictext within w_youchang2
event mousemove pbm_mousemove
boolean visible = false
integer x = 229
integer y = 1172
integer width = 421
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 10789024
long backcolor = 16777215
string text = "공무관리"
boolean focusrectangle = false
end type

event mousemove;//if il_sw = 0 then
//	TextColor = RGB(0,0,255)
//	this.Border = TRUE
//	this.BorderStyle = StyleRaised!
//	il_sw = 1
//end if
//
end event

type st_sys from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 2352
integer width = 622
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "시 스 템 관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_sys.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_s_main )
//m_UtilMain.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text


end event

event clicked;//
if GF_PERMISSION("시스템관리", gs_userid) = "Y" then
	open(w_s_main)  // 시스템관리 메인윈도우 오픈
else
	MessageBox("확인", "시스템관리 권한이 필요합니다.")
end if
end event

type st_mps from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 956
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "생 산  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if

end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_Mps.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_m_main )
//m_MpsMenu.m_Window.Visible = FALSE
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;long ll_cnt

SELECT COUNT(*) INTO :ll_cnt 
  FROM CODEMST
 WHERE TYPE   IN ('생산관리_입력','생산관리_조회')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid;
 
if ll_cnt > 0 then
	open(w_m_main)  // 생산관리 메인윈도우 오픈
else
	messageBox("확인", "생산관리 권한이 필요합니다.")
end if
end event

type st_in from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 558
integer y = 1096
integer width = 622
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "C:\bmp\Point.cur"
long backcolor = 16777215
string text = "구 매  관 리"
boolean focusrectangle = false
end type

event mousemove;if il_sw = 0 then
	TextColor = RGB(0,0,255)
	this.Border = TRUE
	this.BorderStyle = StyleRaised!
	il_sw = 1
end if
//this.Border = TRUE
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

event getfocus;//wf_ClearSelection()
//TextColor = RGB(255,0,0)
//
//p_in.PictureName = is_OpenFolder
//
//Parent.ChangeMenu( m_i_main )
//m_InMenu.m_Window.Visible = FALSE
//
//IF gb_IsConnected = FALSE THEN
//	m_InMenu.Visible = FALSE
//	return
//END IF
//
//Parent.Title = is_Title + " - " + this.Text
end event

event clicked;long ll_cnt

SELECT COUNT(*) INTO :ll_cnt 
  FROM CODEMST
 WHERE TYPE   IN ('구매관리_입력','구매관리_조회','구매관리_창고')
   AND USE_YN  = 'Y'  AND ITEM_CD = :gs_userid;
 
if ll_cnt > 0 then
	open(w_i_main)  // 구매관리 메인윈도우 오픈
else
	MessageBox("확인", "'구매관리_입력','구매관리_조회','구매관리_창고' 권한이 필요합니다.")
end if


end event

type st_tips from statictext within w_youchang2
boolean visible = false
integer x = 974
integer y = 52
integer width = 215
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type pb_exit from picturebutton within w_youchang2
event clicked pbm_bnclicked
event mousemove pbm_mousemove
integer x = 4475
integer y = 28
integer width = 146
integer height = 136
integer taborder = 20
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\mrpexit.bmp"
alignment htextalign = left!
end type

event clicked;Close( Parent )
HALT CLOSE
end event

event mousemove;//INT li_x, li_y
//
//li_x = THIS.x + 156
//li_y = THIS.y + 156
//f_usetips(st_tips, '종료', parent, li_x, li_y)
end event

type pb_1 from picturebutton within w_youchang2
event clicked pbm_bnclicked
event mousemove pbm_mousemove
integer x = 4325
integer y = 28
integer width = 146
integer height = 136
integer taborder = 30
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\log.bmp"
alignment htextalign = left!
string powertiptext = "로긴"
end type

event clicked;//Open( w_login )
IF IsValid(w_login) = false THEN Open( w_login )
close(parent)

end event

event mousemove;//INT li_x, li_y
//
//li_x = THIS.x + 156
//li_y = THIS.y + 156
//f_usetips(st_tips, 'Logon', parent, li_x, li_y)
end event

type st_11 from statictext within w_youchang2
integer x = 4311
integer y = 20
integer width = 320
integer height = 152
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_13 from statictext within w_youchang2
integer x = 14
integer y = 2724
integer width = 4622
integer height = 116
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type st_10 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 14
integer y = 196
integer width = 1568
integer height = 2516
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

event mousemove;if il_sw = 1 then
	wf_ClearSelection()
	il_sw = 0
end if

end event

type st_12 from statictext within w_youchang2
integer x = 14
integer y = 8
integer width = 4631
integer height = 184
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_youchang2
integer x = 3237
integer y = 32
integer width = 1042
integer height = 132
integer taborder = 10
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "Help!"
string text = "Message Box"
end type

event clicked;gs_custper_str lstr_where
lstr_where.str_where = "S"
openwithparm(w_sysmsg_m,lstr_where)
w_sysmsg_m.WindowState = Normal!

end event

type phl_ins from picturehyperlink within w_youchang2
integer x = 1627
integer y = 220
integer width = 274
integer height = 80
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "C:\bmp\글쓰기.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;dw_2.setredraw(false)
ib_ref = false
wf_dw2vis()
dw_2.reset()
dw_2.insertrow(1)
dw_2.object.user_id[1] = gs_userid
dw_2.object.rid[1] = 0
dw_2.object.level[1] = '1'
dw_2.object.ret_cnt[1] = 0
dw_2.setredraw(true)
dw_2.setfocus()

//SELECT @@TEXTSIZE
//SET TEXTSIZE 4096000
//SELECT @@TEXTSIZE

//DBCC CHECKIDENT (ycboard, RESEED, 0); < = identity 컬럼 초기값을 0으로 함.
// rid = 0 이면 트리거에서 자동으로 rid 에 max값 넣음
// 구조
//  SELECT ycboard.id_seq,   
//         ycboard.rid,   
//         ycboard.level,   
//         ycboard.user_id,   
//         ycboard.user_date,   
//         ycboard.title,   
//         ycboard.passwd,   
//         ycboard.ret_cnt,   
//         ycboard.board_text  
//    FROM ycboard   
//====================================================================================
//id_seq 	rid 	title 																	level 
//====================================================================================
//117 		99 	첫 번째 원글입니다.													A 
//118 				[RE] 원글(117 번)에 대한 첫 번째 답변글입니다. 				AA 
//119 					[RE] 답변글(118 번)에 대한 첫 번째 답변글입니다. 		AAA 
//121 						[RE] 답변글(119 번)에 대한 첫번째 답변글입니다. 	AAAA 
//120 				[RE] 원글(117 번)에 대한 두 번째 답변글 						AB 
//122 					[RE] 두 번째 답변글(120 번)에 대한 첫 번째 답변글 		ABA 
//116 		98 	게시물 목록에서 일괄 답변 기능의 구현은 어떻게? 			A 
//123 				[RE] 게시물 목록에서 일괄 답변 기능의 구현? 					AA 
//124 					[RE] 게시물 목록에서 일괄 답변 기능의 구현? 				AAA 
//115 		97 	게시판 테스트요. 														A 
//====================================================================================
// level 은 1~9 , A ~ Z 의 35개로 제한함.
end event

type phl_next from picturehyperlink within w_youchang2
integer x = 2158
integer y = 220
integer width = 210
integer height = 80
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "C:\bmp\다음.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;il_curr_page = il_curr_page + 1
wf_dw1ret(il_curr_page)

end event

type phl_pre from picturehyperlink within w_youchang2
integer x = 1925
integer y = 220
integer width = 210
integer height = 80
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "C:\bmp\이전.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;il_curr_page = il_curr_page - 1
wf_dw1ret(il_curr_page)

end event

type phl_ret from picturehyperlink within w_youchang2
integer x = 4329
integer y = 220
integer width = 274
integer height = 80
boolean bringtotop = true
string pointer = "HyperLink!"
string picturename = "C:\bmp\검색.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;// 20줄 조회
if trim(sle_1.text) = '' or isnull(sle_1.text) then 
	is_title = '%'
	is_user = '%'
end if

if ii_sel = 1 then
	is_title = '%' + trim(sle_1.text) + '%'
	is_user = '%'
elseif ii_sel = 2 then
	is_title = '%'
	is_user = trim(sle_1.text) + '%'
elseif ii_sel = 3 then
end if
il_first_rid = 2147483647
is_first_level = ' '
dw_1.retrieve(il_first_rid, is_first_level, is_title, is_user)
end event

type sle_1 from singlelineedit within w_youchang2
integer x = 3662
integer y = 220
integer width = 654
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string pointer = "IBeam!"
long textcolor = 33554432
end type

type ddlb_1 from dropdownlistbox within w_youchang2
integer x = 3269
integer y = 220
integer width = 370
integer height = 324
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"제목","글쓴이"}
end type

event constructor;this.text = '제목'
end event

event selectionchanged;ii_sel = index
end event

type st_wht from statictext within w_youchang2
integer x = 1595
integer y = 204
integer width = 3040
integer height = 104
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_tot from statictext within w_youchang2
integer x = 1623
integer y = 2640
integer width = 462
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "st_tot"
boolean focusrectangle = false
end type

type st_1 from statictext within w_youchang2
event mousemove pbm_mousemove
integer x = 1595
integer y = 2616
integer width = 3040
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

event mousemove;wf_stmouse(this)
end event

type dw_2 from datawindow within w_youchang2
event buttomup pbm_dwnlbuttonup
integer x = 1650
integer y = 492
integer width = 2798
integer height = 1872
integer taborder = 50
string dataobject = "d_ycboard_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttomup;choose case dwo.name
	case 'p_list'
		wf_dw1vis()
	case 'p_ok'
		datetime ldt_date
		string ls_title
		select top 1 getdate() into :ldt_date from login;
		dw_2.object.user_date[1] = ldt_date
		dw_2.accepttext()
		ls_title = dw_2.object.title[1]
		if isnull(ls_title) or trim(ls_title)  = '' then
			messagebox("확인","제목을 입력하십시요")
			return
		end if
		ls_title = dw_2.object.board_text[1]
		if isnull(ls_title) or trim(ls_title)  = '' then
			messagebox("확인","내용을 입력하십시요")
			return
		end if
		if dw_2.update() = 1 then
			commit;
		else
			rollback;
			return
		end if
		if ib_ref = true then
		else
			il_first_rid = 2147483647
		end if
		wf_dw1vis()
	case 'p_cancel'
		if ib_ref = true then
			wf_dw3vis('N')
		else
			wf_dw1vis()
		end if
end choose

end event

event constructor;this.settransobject(sqlca)
end event

event itemerror;////if dwo.name <> 'board_text' then return
////string ls_text
////
////ls_text = this.object.board_text[1]
////select :ls_text + CHAR(13) + CHAR(10) into :ls_text from login where user_id = :gs_userid;
////this.object.board_text[1] = ls_text
////this.accepttext()
////this.object.board_text.SelectText(len(ls_text),1)
//return 1
end event

event editchanged;//if dwo.name <> 'board_text' then return
//this.accepttext()
//string ls_text
//
//ls_text = this.object.board_text[1]
//if mod(len(ls_text) , 90) = 0 then
//	this.object.board_text[1] = ls_text + CHAR(13)
//	select :ls_text + CHAR(13) + CHAR(10) into :ls_text from login where user_id = :gs_userid;
//	this.object.board_text[1] = ls_text
//	this.selectText(len(ls_text) + 1, 1)
////	this.object.board_text.SelectText(len(ls_text) -1,1)
//	return 1
//end if
//
end event

event losefocus;//this.accepttext()
//string ls_text, ls_exit = 'N'
//long ll_start = 1
//
//ls_text = this.object.board_text[1]
//do
//	select :ls_text + CHAR(13) + CHAR(10) into :ls_text from login where user_id = :gs_userid;
//	this.object.board_text[1] = ls_text
//loop until ls_exit = 'Y';
//
//if mod(len(ls_text) , 90) = 0 then
//	this.object.board_text[1] = ls_text + CHAR(13)
//	select :ls_text + CHAR(13) + CHAR(10) into :ls_text from login where user_id = :gs_userid;
//	this.object.board_text[1] = ls_text
//	this.selectText(len(ls_text) + 1, 1)
////	this.object.board_text.SelectText(len(ls_text) -1,1)
//	return 1
//end if
//
end event

type dw_1 from datawindow within w_youchang2
event mousemove pbm_dwnmousemove
event buttonup pbm_dwnlbuttonup
integer x = 1595
integer y = 312
integer width = 3040
integer height = 2300
integer taborder = 20
string dataobject = "d_ycboard_list"
boolean livescroll = true
end type

event mousemove;///////////////////////////////////////////
// Event ID   : pbm_dwnmousemove
// Event Name : mousemove
///////////////////////////////////////////
wf_stmouse(st_1)
if row < 1 then return

this.scrolltorow(row)

end event

event buttonup;//
if row < 1  then return

choose case dwo.name
	case 'title'
		ib_ref = true
		wf_dw3vis('Y')

   case 'user_id'
		gs_custper_str lstr_where
		gs_print_control  = "mess"
		lstr_where.str_ok = false
		lstr_where.str_where = dw_1.object.user_id[row]
		openwithparm(w_sysmsg_m,lstr_where)
		w_sysmsg_m.WindowState = Normal!
end choose

end event

event retrieveend;if this.rowcount() < 1 then 
//	st_tot.text = "전체 : 0 건"
	phl_pre.enabled = false
	phl_pre.PictureName = 'C:\bmp\이전_f.gif'
	phl_next.enabled = false
	phl_next.PictureName = 'C:\bmp\다음_f.gif'
	wf_stpos()
	return
end if

int li_cnt

il_first_rid = this.object.rid[1]
is_first_level = this.object.level[1]
il_last_rid = this.object.rid[this.rowcount()]
is_last_level = this.object.level[this.rowcount()]

select count(ycboard.id_seq) into :li_cnt from ycboard, login
where ( rid > :il_first_rid
		or (rid = :il_first_rid and level < :is_first_level) )
 AND user_name LIKE :is_user
 AND title LIKE :is_title
 AND ycboard.user_id = login.user_id ;
if li_cnt > 0 then
	phl_pre.enabled = true
	phl_pre.PictureName = 'C:\bmp\이전.gif'
else
	phl_pre.enabled = false
	phl_pre.PictureName = 'C:\bmp\이전_f.gif'
end if

//====================================================================================
//id_seq 	rid 	title 																	level 
//====================================================================================
//117 		99 	첫 번째 원글입니다.													A 
//118 				[RE] 원글(117 번)에 대한 첫 번째 답변글입니다. 				AA 
//119 					[RE] 답변글(118 번)에 대한 첫 번째 답변글입니다. 		AAA 
//121 						[RE] 답변글(119 번)에 대한 첫번째 답변글입니다. 	AAAA 
//120 				[RE] 원글(117 번)에 대한 두 번째 답변글 						AB 
//122 					[RE] 두 번째 답변글(120 번)에 대한 첫 번째 답변글 		ABA 
//116 		98 	게시물 목록에서 일괄 답변 기능의 구현은 어떻게? 			A 
//123 				[RE] 게시물 목록에서 일괄 답변 기능의 구현? 					AA 
//124 					[RE] 게시물 목록에서 일괄 답변 기능의 구현? 				AAA 
//115 		97 	게시판 테스트요. 														A 
//===================================================================================
select count(ycboard.id_seq) into :li_cnt from ycboard, login
 where ( rid < :il_last_rid
			or (rid = :il_last_rid and level > :is_last_level) )
	AND user_name LIKE :is_user
	AND title LIKE :is_title
	AND ycboard.user_id = login.user_id ;
if li_cnt > 0 then
	phl_next.enabled = true
	phl_next.PictureName = 'C:\bmp\다음.gif'
else
	phl_next.enabled = false
	phl_next.PictureName = 'C:\bmp\다음_f.gif'
end if

wf_stpos()

end event

type dw_3 from datawindow within w_youchang2
event buttonup pbm_dwnlbuttonup
integer x = 1723
integer y = 580
integer width = 2798
integer height = 1872
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ycboard_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonup;
choose case dwo.name
	case 'p_list'
		is_title = '%'
		is_user = '%'
		wf_dw1vis()
	case 'p_reply'
		string ls_text, ls_name, ls_user, ls_oritext
		long ll_start, ll_end, ll_pos
		
		ib_ref = true
		dw_2.setredraw(false)
//		dw_2.retrieve(this.object.id_seq[1])
		wf_dw2vis()
		dw_2.reset()
		dw_2.insertrow(1)
		dw_2.object.user_id[1] = gs_userid
		dw_2.object.rid[1] = this.object.rid[1]
		dw_2.object.level[1] = this.object.level[1]
		dw_2.object.title[1] = this.object.title[1]
		dw_2.object.ret_cnt[1] = 0
		ls_oritext = this.object.board_text[1]
		ll_start = 1
		ll_end = 0
		ls_text = ''
		do 
			ll_end = PosA(ls_oritext, CharA(13), ll_start)
			if ll_end  = 0 then
				ls_text = ls_text + " > " + MidA(ls_oritext, ll_start)
			else
				ls_text = ls_text + " > " + MidA(ls_oritext, ll_start, ll_end - ll_start + 2)
				ll_start = ll_end + 2
			end if
		loop until ll_end = 0
		ls_user = this.object.user_id[1]
		select user_name into :ls_name from login
		 where user_id = :ls_user;
		ls_text = " " + CharA(13) + CharA(10) + " " + CharA(13) + CharA(10) &
					+ " > " + trim(ls_name) + " 님이 쓰신  글" + CharA(13) + CharA(10) &
					+ " > --------------------------------------------------" + CharA(13) + CharA(10) &
					+ ls_text
		dw_2.object.board_text[1] = ls_text

		dw_2.setredraw(true)

	case 'p_up'
		wf_dw4vis()
	case 'p_del'
		if MessageBox("삭제","삭제하시겠습니까?", StopSign!, OKCancel!, 2) = 2 then return
		this.deleterow(1)
		if this.update()  = 1 then
			commit;
		else
			rollback;
			return
		end if
		wf_dw1vis()
end choose
// 구조
//  SELECT ycboard.id_seq,   
//         ycboard.rid,   
//         ycboard.level,   
//         ycboard.user_id,   
//         ycboard.user_date,   
//         ycboard.title,   
//         ycboard.passwd,   
//         ycboard.ret_cnt,   
//         ycboard.board_text  
//    FROM ycboard   
//====================================================================================
//id_seq 	rid 	title 																	level 
//====================================================================================
//117 		99 	첫 번째 원글입니다.													A 

end event

event constructor;this.settransobject(sqlca)

end event

type dw_4 from datawindow within w_youchang2
event buttonup pbm_dwnlbuttonup
integer x = 1806
integer y = 680
integer width = 2798
integer height = 1872
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ycboard_up_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonup;string ls_title
choose case dwo.name
	case 'p_ok'
		dw_4.accepttext()
		ls_title = dw_4.object.title[1]
		if isnull(ls_title) or trim(ls_title)  = '' then
			messagebox("확인","제목을 입력하십시요")
			return
		end if
		ls_title = dw_4.object.board_text[1]
		if isnull(ls_title) or trim(ls_title)  = '' then
			messagebox("확인","내용을 입력하십시요")
			return
		end if
		if dw_4.update() = 1 then
			commit;
		else
			rollback;
			return
		end if
		wf_dw1vis()
	case 'p_cancel'
		ib_ref = false
		wf_dw3vis('N')
end choose

end event

event constructor;this.settransobject(sqlca)
end event

