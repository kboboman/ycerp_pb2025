$PBExportHeader$w_multiprint_r1.srw
$PBExportComments$바코드프린트(넓은거,짧은거,입고확인서)(2004/04월어느날, 정갑용)
forward
global type w_multiprint_r1 from window
end type
type st_3 from statictext within w_multiprint_r1
end type
type st_2 from statictext within w_multiprint_r1
end type
type em_p1left from editmask within w_multiprint_r1
end type
type em_p1top from editmask within w_multiprint_r1
end type
type cbx_all from checkbox within w_multiprint_r1
end type
type dw_5 from datawindow within w_multiprint_r1
end type
type sle_prt1 from singlelineedit within w_multiprint_r1
end type
type st_5 from statictext within w_multiprint_r1
end type
type dw_1 from datawindow within w_multiprint_r1
end type
type cb_2 from commandbutton within w_multiprint_r1
end type
type cb_1 from commandbutton within w_multiprint_r1
end type
type st_1 from statictext within w_multiprint_r1
end type
type gb_2 from groupbox within w_multiprint_r1
end type
type gb_3 from groupbox within w_multiprint_r1
end type
end forward

global type w_multiprint_r1 from window
integer width = 6473
integer height = 2340
boolean titlebar = true
string title = "출력물 선택(w_multiprint_r1)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
em_p1left em_p1left
em_p1top em_p1top
cbx_all cbx_all
dw_5 dw_5
sle_prt1 sle_prt1
st_5 st_5
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
st_1 st_1
gb_2 gb_2
gb_3 gb_3
end type
global w_multiprint_r1 w_multiprint_r1

type variables
gs_where ist_where
string is_insp_no, is_sale_no, is_insp_date
end variables

forward prototypes
public subroutine wf_setprinter ()
public subroutine wf_getprinter (integer ai_prt)
public subroutine wf_print (string arg_label_no, long arg_print_no)
end prototypes

public subroutine wf_setprinter ();// wf_setprinter
string ls_prt1

ls_prt1 = sle_prt1.text

SetProfileString("YCERP.INI", "Qrcode", "PRINT", ls_prt1)


end subroutine

public subroutine wf_getprinter (integer ai_prt);//
string ls_prt, ls_prtname[]

PrintSetup()

ls_prt = PrintGetPrinter()
GF_Split( ls_prt, "~t", ls_prtname )

choose case ai_prt
	case 1
		sle_prt1.text = ls_prtname[1]
	case 2
//		sle_prt2.text = ls_prtname[1]
	case 3
//		sle_prt3.text = ls_prtname[1]
	case 4
//		sle_prt4.text = ls_prtname[1]
end choose


end subroutine

public subroutine wf_print (string arg_label_no, long arg_print_no);//
datetime ld_date
decimal    ld_amount, l_issue_qty
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt, ll_qty
string ls_order_no, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_item_no, ls_item_name, ls_qa, ls_bigo, ls_cnt, ls_label_no, ls_color_name
string ls_left, ls_top, ls_prt
int    li_seq_no

DECLARE label_print_cursor CURSOR FOR  
select   a.sale_no,
		  isnull(d.cust_name,'') cust_name,
		  isnull(e.scene_desc,'') scene_desc,
		  a.label_no,
		  a.item_no, 
		  b.item_name,
		  a.qa, 
		  a.rcpt_qty,
		  a.color
from    label_inspitem a with(nolock) 
            inner join groupitem b with(nolock) on a.item_no  = b.item_no
            left outer join sale c with(nolock) on a.sale_no = c.order_no
            left outer join  customer d with(nolock) on c.cust_no = d.cust_no
            left outer join scene e with(nolock) on c.scene_code = e.scene_code
  where a.label_no = :arg_label_no
order by a.print_group, a.print_group_seq;


DEBUGBREAK()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
dw_1.reset()
dw_1.insertrow(0)


OPEN label_print_cursor;

		FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :l_issue_qty, :ls_color_name;
		
		dw_1.object.order_no[1]   = ls_order_no
		dw_1.object.cust_name[1]  = ls_cust_name
		dw_1.object.scene_name[1] = ls_scene_name
		dw_1.object.label_no[1] 	     = ls_label_no

		Do While sqlca.sqlcode = 0		  	
			ll_line = ll_line + 1
			dw_1.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
			dw_1.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
			dw_1.setitem(1, 'qty'       + string(ll_line,"00"), l_issue_qty)		
			dw_1.setitem(1, 'inspdate', is_insp_date)
			dw_1.setitem(1, 'insp_no', is_insp_no)			
			
			FETCH label_print_cursor INTO :ls_order_no, :ls_cust_name, :ls_scene_name, :ls_label_no, :ls_item_no, :ls_item_name, :ls_qa, :l_issue_qty, :ls_color_name;
		Loop

CLOSE label_print_cursor;


		
// 출력마진 설정
//ls_left = em_left.text
//ls_top  = em_top.text
//ls_prt  = em_prt.text

//SetProfileString("YCLINE.INI", "Database", "LEFT", ls_left)
//SetProfileString("YCLINE.INI", "Database", "TOP",  ls_top)
//SetProfileString("YCLINE.INI", "Database", "PRINT",ls_prt)


/*

     2018.07.13 jowonsuk 설정
	프린터 설정 
	SATO CL4NX 이며,
	프린터 기본설정에서  media settings Width:   100mm
											     Height: 165mm
												Rotation: 90도
	ls_prt = "CL4NX"	
	ls_left = "0.000"
	ls_top = "0.000"	

*/
ls_left = em_p1left.text
ls_top = em_p1top.text
ls_prt = trim(sle_prt1.text)

SetProfileString("YCERP.INI","Qrcode","LEFT",ls_left)
SetProfileString("YCERP.INI","Qrcode","TOP", ls_top)
SetProfileString("YCERP.INI","Qrcode","PRINT",ls_prt)

IF ls_prt = '' OR ISNULL(ls_prt) THEN
	ls_prt = "CL4NX"	
END IF	

IF ls_left = '' OR ISNULL(ls_left) THEN
	ls_left = "0.000"
END IF 

IF ls_top = '' OR ISNULL(ls_top) THEN
	ls_top = "0.000"	
END IF	

if ls_prt = "" OR ls_prt = "기본" then
else
	dw_1.Object.DataWindow.Printer = ls_prt
end if

dw_1.modify("DataWindow.print.margin.left = " + ls_left )
dw_1.modify("DataWindow.print.margin.top  = " + ls_top  )
dw_1.modify("DataWindow.print.Margin.Bottom = 0.000" )
dw_1.modify("DataWindow.print.Margin.Right  = 0.000" )
//messagebox('확인', '테스트2')		
dw_1.print()
//messagebox('확인', '테스트3')		
end subroutine

on w_multiprint_r1.create
this.st_3=create st_3
this.st_2=create st_2
this.em_p1left=create em_p1left
this.em_p1top=create em_p1top
this.cbx_all=create cbx_all
this.dw_5=create dw_5
this.sle_prt1=create sle_prt1
this.st_5=create st_5
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_3,&
this.st_2,&
this.em_p1left,&
this.em_p1top,&
this.cbx_all,&
this.dw_5,&
this.sle_prt1,&
this.st_5,&
this.dw_1,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.gb_2,&
this.gb_3}
end on

on w_multiprint_r1.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_p1left)
destroy(this.em_p1top)
destroy(this.cbx_all)
destroy(this.dw_5)
destroy(this.sle_prt1)
destroy(this.st_5)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;////
string ls_inspno
long   l_cnt
string ls_prt1
string ls_p1left, ls_p1top


dw_5.settransobject(SQLCA)
//
//// 코일 겉포장용
//dw_1.x = dw_5.x ; dw_1.y = dw_5.y ; dw_1.width = dw_5.width ; dw_1.height = dw_5.height
//
//// 코일 낱장용
//dw_2.x = dw_5.x ; dw_2.y = dw_5.y ; dw_2.width = dw_5.width ; dw_2.height = dw_5.height
//
//dw_1.Visible = False
//dw_2.Visible = False
//dw_3.Visible = False
//dw_4.Visible = False
//dw_6.Visible = False
//
ist_where = Message.PowerObjectParm
ls_inspno = ist_where.str1

l_cnt = dw_5.retrieve( ls_inspno )

if l_cnt > 0 then
	is_sale_no = dw_5.object.sale_no[1]
	is_insp_date = dw_5.object.insp_date[1]
	is_insp_no = dw_5.object.inspdet_insp_no[1]		
end if	

////if integer(ist_where.str2) > 0 then em_1.visible = true; st_2.visible = true
//
//// 자재입고 및 외주스리팅 입고 에서 str1:입고번호, str2:0(순번)
//// 입고수정및삭제 에서 str3:갯수(미사용), str4:폭
//
//// 알루미늄이 아니고 GI 코일일때는 스리팅 계획의 수량을 찍어 달라?
//
//
//string ls_bar_ttpw, ls_bar_ttps, ls_rcpt_prt
//
ls_prt1 = ProfileString("YCERP.INI", "Qrcode", "PRINT", " ")
ls_p1left  = ProfileString("YCERP.INI","Qrcode","LEFT", " ")
ls_p1top   = ProfileString("YCERP.INI","Qrcode","TOP",  " ")

sle_prt1.text = ls_prt1
if isnull(ls_p1left) OR ls_p1left = "" then ls_p1left = "0"
if isnull(ls_p1top)  OR ls_p1top  = "" then ls_p1top  = "0"
em_p1left.text = ls_p1left ; em_p1top.text  = ls_p1top 

end event

type st_3 from statictext within w_multiprint_r1
integer x = 2034
integer y = 48
integer width = 169
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "LEFT"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_multiprint_r1
integer x = 1833
integer y = 48
integer width = 169
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "TOP"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_p1left from editmask within w_multiprint_r1
integer x = 2030
integer y = 156
integer width = 165
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "100"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Qrcode", "LEFT", em_p1left.text)
SetProfileString("YCERP.INI", "Qrcode", "TOP",  em_p1top.text)

end event

type em_p1top from editmask within w_multiprint_r1
integer x = 1842
integer y = 156
integer width = 165
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "0"
alignment alignment = center!
string mask = "##0"
end type

event modified;//
//ls_p1left  = ProfileString("YCERP.INI","Database","PRT1_LEFT", " ")
//ls_p1top   = ProfileString("YCERP.INI","Database","PRT1_TOP",  " ")
//ls_p2left  = ProfileString("YCERP.INI","Database","PRT2_LEFT", " ")
//ls_p2top   = ProfileString("YCERP.INI","Database","PRT2_TOP",  " ")
//ls_p3left  = ProfileString("YCERP.INI","Database","PRT3_LEFT", " ")
//ls_p3top   = ProfileString("YCERP.INI","Database","PRT3_TOP",  " ")
//
SetProfileString("YCERP.INI", "Qrcode", "LEFT", em_p1left.text)
SetProfileString("YCERP.INI", "Qrcode", "TOP",  em_p1top.text)

end event

type cbx_all from checkbox within w_multiprint_r1
integer x = 27
integer y = 164
integer width = 315
integer height = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "선택"
end type

event clicked;// 선택
string ls_loctype, ls_worktype, ls_chk
long   ll_row

if this.checked = true then
	ls_chk = "Y"
else
	ls_chk = "N"
end if

for ll_row = 1 to dw_5.rowcount()
	ls_worktype = dw_5.object.work_type[ll_row]
	ls_loctype  = dw_5.object.loc_type[ll_row]

	if ls_worktype = "L" then
		// if (work_type = 'L', 1, if ( loc_type = 'Y', 1, 0) ) 조건		
	else
		if ls_loctype = "Y" then
			// if (work_type = 'L', 1, if ( loc_type = 'Y', 1, 0) ) 조건		
		else
			dw_5.object.chk[ll_row] = ls_chk
		end if
	end if
next

end event

type dw_5 from datawindow within w_multiprint_r1
integer x = 32
integer y = 292
integer width = 6313
integer height = 1928
integer taborder = 70
string title = "none"
string dataobject = "d_apinspdetprt_r1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_prt1 from singlelineedit within w_multiprint_r1
integer x = 841
integer y = 156
integer width = 987
integer height = 80
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 28310782
string text = "none"
end type

event modified;//
wf_setprinter()


end event

type st_5 from statictext within w_multiprint_r1
integer x = 375
integer y = 156
integer width = 448
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "프린트:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//
wf_getprinter( 1 )
end event

type dw_1 from datawindow within w_multiprint_r1
boolean visible = false
integer x = 1074
integer y = 4
integer width = 105
integer height = 80
integer taborder = 10
boolean enabled = false
string title = "코일 겉포장용"
string dataobject = "d_label_165x100_insp"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_multiprint_r1
integer x = 2875
integer y = 144
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종 료"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_1 from commandbutton within w_multiprint_r1
integer x = 2272
integer y = 144
integer width = 594
integer height = 112
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출 력"
end type

event clicked;long   li_find,  li_end, ll_row, ll_cnt, l_seq_no, l_retrieve_cnt
int      l_print_start_group, l_print_group, l_print_group_seq, l_print_group_original
string old_dwnm, ls_label_check, ls_part_yn, ls_label_no, ls_order_no, ls_item_no, ls_qa, ls_qrdata, ls_data, l_base_data, ls_qrcode, ls_origin_lable_no, ls_color_name
string ls_insp_no, ls_order_no_next
long   l_oi_no
long  l_print_no	 
datawindow dw_prt
dwItemStatus  l_status
decimal l_label_no, l_issue_qty, l_req_qty
datetime l_sys_date

	
	 l_sys_date = gf_today()	 
	 l_print_group = 1
	 l_print_group_seq = 1

	 setnull(ls_order_no_next)
 	 setnull(ls_order_no)
	  
	 ls_insp_no = dw_5.object.inspdet_insp_no[1]	  
	  
	select  max(isnull(print_no,0))+1 print_no
	into :l_print_no
	 from label_inspitem
	 where insp_no = :ls_insp_no;
	 
	 if isnull(l_print_no) then
		l_print_no = 1
	end if			  
	 
	/*2019.02.01 jowonsuk 한라벨 묶음 번호 */ 
	 		
	for ll_row = 1 to dw_5.rowcount()
		
			if dw_5.object.chk[ll_row]	= 'Y' then
				
					ls_order_no = dw_5.object.sale_no[ll_row]									
					ls_insp_no = dw_5.object.inspdet_insp_no[ll_row]										
					l_oi_no = dw_5.object.oi_no[ll_row]										
					ls_order_no = dw_5.object.sale_no[ll_row]										
					
					l_seq_no = dw_5.object.sale_seq[ll_row]					
					ls_item_no = dw_5.object.item_no[ll_row]
					ls_qa = dw_5.object.qa[ll_row]					
					l_issue_qty = dw_5.object.rcpt_qty[ll_row]											
					
					
					ls_origin_lable_no = ls_order_no
																							
					if l_print_group_seq = 1 then				

						/*라벨 번호 따기 */
						select  isnull(max(substring(label_no,15,5)),0) + 1 label_no
						 into :l_label_no
						 from label_inspitem
						 where label_no like :ls_order_no+'%'
							and sale_no = :ls_order_no
							and isnumeric(substring(label_no, 15,5)) = 1;

					end if	
														
/*					ls_label_no = trim(string(i_req_date))+ trim(string(is_salesman,'0000000000'))+trim(string(i_req_seq,'00000'))+trim(string(i_seq,'00000'))+is_order_no + trim(string(l_label_no, '00000'))  */
					/*2019.01.09 jowonsuk qrcode 라벨 기존 수주번호+5자리순번에서 -> 출고의뢰일자(8자리)+담당자(10자리)+차수(5자리)+출고의뢰순번(5자리)+수주번호+라벨순번(5)*/
					ls_label_no = ls_origin_lable_no + trim(string(l_label_no, '00000'))
									
					insert into label_inspitem     (insp_no,        oi_no,    sale_no,         seq_no,     label_no,      item_no,       qa,       rcpt_qty,    sys_date,		 print_group, print_group_seq, print_no, color, use_yn)
											values   (:ls_insp_no, :l_oi_no, :ls_order_no, :l_seq_no, :ls_label_no, :ls_item_no, :ls_qa, :l_issue_qty, :l_sys_date,	 :l_print_group, :l_print_group_seq, :l_print_no, :ls_color_name, 'N' );
											 
					l_print_group_seq = l_print_group_seq  + 1
					
					if l_print_group_seq = 7 then /*6건을 라벨 발행하고 있으므로 7이면 새로 시작. */
						l_print_group_seq = 1					
						l_print_group = l_print_group + 1
					else
						
						if dw_5.rowcount() >= ll_row+1 then
						
							ls_order_no_next = dw_5.object.sale_no[ll_row+1]
							
						else
							ls_order_no_next = ls_order_no
						end if
						
						if ls_order_no <> ls_order_no_next then
							l_print_group_seq = 1					
							l_print_group = l_print_group + 1
						end if						
					end if
					
			end if		
		
	next				
	
	commit;
	
	ll_cnt = l_print_group 				/* 동일 수주건의 분할 건수 */	
	l_print_start_group = 1
	
	l_base_data = ''		/*수주 거래처, 현장등 정보 */


	/*1. 부품의 정보를 받는다.  수주의 기본정보를 받는다. */
	DECLARE label_item_cursor CURSOR FOR  
	select  a.label_no+'|'+isnull(c.cust_no,' ')+'|'+isnull(c.scene_code,' '), a.print_group, a.label_no,  '*'+convert(char(3),a.seq_no)+'|'+a.item_no+ '|'+a.qa+'|' , isnull(a.rcpt_qty,0) issue_qty
	from    label_inspitem a with(nolock) 
						 inner join groupitem b with(nolock) on a.item_no  = b.item_no
						 left outer join sale c with(nolock) on a.sale_no = c.order_no
						 left outer join customer d with(nolock) on c.cust_no = d.cust_no
						 left outer join scene e with(nolock) on c.scene_code = e.scene_code
	  where  a.sys_date = :l_sys_date	/* 차후 print_no로 대체 */
	     and a.print_group = :l_print_group
	order by a.print_group, a.print_group_seq	;		
	
	
	for l_print_group = l_print_start_group to ll_cnt			 
		
			ls_qrdata = ''					/*초기화 */
	
			OPEN label_item_cursor;
			
					FETCH label_item_cursor INTO :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;
			
					Do While sqlca.sqlcode = 0		  	
						
							ls_qrdata = ls_qrdata + ls_data+trim(string(l_req_qty))
								
							FETCH label_item_cursor INTO :l_base_data, :l_print_group, :ls_label_no, :ls_data, :l_req_qty;			
							
					Loop
			
			CLOSE label_item_cursor;
			
			ls_qrdata = l_base_data + ls_qrdata	/*2019.02.22 JOWONSUK 끝을 구분하기 위해서 구분자로 $ 다시 뺌 */
	
			gf_qrcode_create1(ls_qrdata, 'qrcode.bmp')		
			
			wf_print(ls_label_no, l_print_no)

	next
end event

type st_1 from statictext within w_multiprint_r1
integer x = 41
integer y = 32
integer width = 987
integer height = 68
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출력할 항목을 선택하세요."
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_multiprint_r1
integer x = 2240
integer y = 108
integer width = 1294
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_multiprint_r1
integer x = 366
integer y = 104
integer width = 1861
integer height = 176
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

