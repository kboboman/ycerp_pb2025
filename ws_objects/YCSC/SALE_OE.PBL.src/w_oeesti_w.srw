$PBExportHeader$w_oeesti_w.srw
$PBExportComments$견적서 번호로 검색(2003/11/04, 정갑용)
forward
global type w_oeesti_w from window
end type
type dw_2 from datawindow within w_oeesti_w
end type
type cb_2 from commandbutton within w_oeesti_w
end type
type cb_1 from commandbutton within w_oeesti_w
end type
type em_1 from editmask within w_oeesti_w
end type
type st_1 from statictext within w_oeesti_w
end type
end forward

global type w_oeesti_w from window
integer width = 1106
integer height = 428
boolean titlebar = true
string title = "견적서 복사(w_oeesti_w)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
em_1 em_1
st_1 st_1
end type
global w_oeesti_w w_oeesti_w

type variables
gs_where ist_where
end variables

on w_oeesti_w.create
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_1=create em_1
this.st_1=create st_1
this.Control[]={this.dw_2,&
this.cb_2,&
this.cb_1,&
this.em_1,&
this.st_1}
end on

on w_oeesti_w.destroy
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.st_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

ist_where = Message.powerobjectParm

em_1.text = ist_where.str1

end event

type dw_2 from datawindow within w_oeesti_w
integer x = 27
integer y = 212
integer width = 78
integer height = 72
integer taborder = 20
string title = "none"
string dataobject = "d_oeesti_m1"
boolean border = false
boolean livescroll = true
end type

type cb_2 from commandbutton within w_oeesti_w
integer x = 663
integer y = 220
integer width = 370
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;close (parent)
end event

type cb_1 from commandbutton within w_oeesti_w
integer x = 256
integer y = 220
integer width = 370
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;string ls_est_no // where 절 변수
string ls_estimate_no, ls_cust_no, ls_scene_code, ls_emp_no, ls_vat_flag
string ls_cust_name, ls_scene_desc, ls_sale_succ
string ls_item_no, ls_qa, ls_order_qty, ls_uom, ls_unit_cost, ls_rem
long ll_dw2cnt, ll_i // , ll_cnt
datawindow ldw_dw1
string ls_salesman, ls_cust_addr, ls_tel_no, ls_curr_code
real lr_price_a

if LenA(trim(em_1.text)) < 14 then
	return
end if
ls_est_no = em_1.text

if ist_where.str2 = 'E' then  // E: 견적서 S: 수주관리
	ldw_dw1 = ist_where.dw1
	ll_dw2cnt = ldw_dw1.rowcount()
	ls_estimate_no = w_oeesti_m.dw_2.object.estimate_no[1]
	ls_cust_no = w_oeesti_m.dw_2.object.cust_no[1]
	ls_scene_code = w_oeesti_m.dw_2.object.scene_code[1]
	ls_emp_no = w_oeesti_m.dw_2.object.emp_no[1]
	ls_vat_flag = w_oeesti_m.dw_2.object.vat_flag[1]
	ls_cust_name = w_oeesti_m.dw_2.object.cust_name[1]
	ls_scene_desc = w_oeesti_m.dw_2.object.scene_desc[1]
	ls_sale_succ = w_oeesti_m.dw_2.object.sale_succ[1]
else
	 SELECT e_h.estimate_no, e_h.cust_no,    e_h.scene_code, e_h.emp_no, e_h.vat_flag,
			  e_h.cust_name,   e_h.scene_desc, e_h.sale_succ
		INTO :ls_estimate_no, :ls_cust_no,    :ls_scene_code, :ls_emp_no, :ls_vat_flag,
			  :ls_cust_name,   :ls_scene_desc, :ls_sale_succ
		 FROM estimate_head e_h
		WHERE e_h.estimate_no = :ls_est_no ;

	if sqlca.sqldbcode <> 0 then 
		messagebox("확인","해당하는 견적서가 존재하지 않습니다. ~r~n" &
								+ "견적서 번호를 확인하시기 바랍니다.")
		return
	end if
	ldw_dw1 = dw_2
	ldw_dw1.settransobject(sqlca)
	ll_dw2cnt = ldw_dw1.retrieve(ls_est_no)
end if

if isnull(ls_cust_no) or trim(ls_cust_no) = ''  then 
	messagebox('확인','견적서의 거래처코드가 미등록 상태입니다. ~r~n' &
							+ '거래처코드를 선택하신후 재작업 하십시요..')
	return
end if


IF IsValid(w_all_main) = true THEN
	opensheet(w_orsale_m, w_all_main, 5, original!)
else
	opensheet(w_orsale_m, w_o_main, 5, original!)
end if

w_orsale_m.pb_insert.triggerevent(clicked!)

w_orsale_m.dw_2.object.cust_no[1] = ls_cust_no
if trim(ls_cust_no) = 'N004' then 
	w_orsale_m.dw_2.object.ship_flag[1] = 'A'
ELSEif trim(ls_cust_no) = 'N009' then 
	w_orsale_m.dw_2.object.ship_flag[1] = 'R'
end if

select cust.salesman, cust.shipto_addr, cust.tel_no, cust.curr_code 
 into :ls_salesman,   :ls_cust_addr,    :ls_tel_no,  :ls_curr_code
  from customer cust
 where cust.cust_no = :ls_cust_no ;

w_orsale_m.dw_2.object.salesman[1] = ls_salesman
w_orsale_m.dw_2.object.shipto_addr[1] = ls_cust_addr
w_orsale_m.dw_2.object.tel_no[1] = ls_tel_no
w_orsale_m.dw_2.object.curr_code[1] = ls_curr_code
w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code

w_orsale_m.idwc_scene.reset() 

select scene.scene_addr, scene.scene_tel
  into :ls_cust_addr,    :ls_tel_no
  from scene
 where scene.scene_code = :ls_scene_code;

if sqlca.sqldbcode = 0 then
	w_orsale_m.dw_2.object.shipto_addr[1] = ls_cust_addr
	w_orsale_m.dw_2.object.tel_no[1] = ls_tel_no
	w_orsale_m.wf_sceneretrieve(ls_cust_no)
end if

//select count(*) into :ll_cnt from scene 
// where cust_no = :ls_cust_no;

//w_orsale_m.idwc_scene.reset() 

//if ll_cnt > 0 then
//	w_orsale_m.wf_sceneretrieve(ls_cust_no)
//end if

if w_orsale_m.idwc_scene.rowcount() > 0 then
	w_orsale_m.dw_2.object.protect[1] = 'N'
else
	w_orsale_m.dw_2.object.protect[1] = 'Y'
end if

w_orsale_m.dw_2.object.cust_no.background.color =  rgb(192,192,192)
w_orsale_m.dw_2.object.cust_no.protect = 1
w_orsale_m.dw_2.object.salesman[1] = ls_salesman
w_orsale_m.dw_2.object.shipto_addr[1] = ''
w_orsale_m.dw_2.object.shipto_addr[1] = ls_cust_addr
w_orsale_m.dw_2.object.tel_no[1] = ls_tel_no
w_orsale_m.dw_2.object.scene_code[1] = ls_scene_code

w_orsale_m.dw_2.object.estimate_no[1] = ls_estimate_no
w_orsale_m.dw_2.object.salesman[1] = ls_emp_no
w_orsale_m.dw_2.object.tax_sign[1] = ls_vat_flag
w_orsale_m.dw_3.setredraw(false)
for ll_i = 1 to ll_dw2cnt
	w_orsale_m.pb_1.triggerevent(clicked!)
	ls_item_no = ldw_dw1.object.item_no[ll_i]
	ls_qa = ldw_dw1.object.qa[ll_i]
	
	w_orsale_m.dw_3.object.item_no[ll_i] = ls_item_no
	w_orsale_m.dw_3.object.qa[ll_i] = ls_qa
	w_orsale_m.dw_3.object.uom[ll_i] = ldw_dw1.object.uom[ll_i]
	w_orsale_m.dw_3.object.order_qty[ll_i] = ldw_dw1.object.order_qty[ll_i]
	w_orsale_m.dw_3.object.price[ll_i] = ldw_dw1.object.unit_cost[ll_i]
	w_orsale_m.dw_3.object.rem[ll_i] = ldw_dw1.object.rem[ll_i]
	w_orsale_m.dw_3.object.item_item_name[ll_i] = ldw_dw1.object.groupitem_item_name[ll_i]
	w_orsale_m.dw_3.object.acc_qty[ll_i] = ldw_dw1.object.acc_qty[ll_i]
	
	//표준단가
	lr_price_a = 0
	SELECT price_a INTO :lr_price_a
	  FROM item
	 WHERE item_no = :ls_item_no
		AND qa = :ls_qa;
	w_orsale_m.dw_3.object.item_price_a[ll_i] = lr_price_a	
next 
w_orsale_m.wf_calc()
w_orsale_m.dw_3.setredraw(true)

close (parent)
end event

type em_1 from editmask within w_oeesti_w
integer x = 544
integer y = 48
integer width = 489
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event getfocus;if ist_where.str2 = 'E' then 
	em_1.displayonly = true
else
	em_1.SelectText(9,2)
end if


end event

type st_1 from statictext within w_oeesti_w
integer x = 50
integer y = 60
integer width = 457
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "견적서 번호:"
boolean focusrectangle = false
end type

