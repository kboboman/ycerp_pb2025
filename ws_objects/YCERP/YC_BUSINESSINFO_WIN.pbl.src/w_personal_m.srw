$PBExportHeader$w_personal_m.srw
$PBExportComments$인맥관리
forward
global type w_personal_m from w_inheritance
end type
type cb_3 from commandbutton within w_personal_m
end type
type em_1 from editmask within w_personal_m
end type
type em_2 from editmask within w_personal_m
end type
type em_3 from editmask within w_personal_m
end type
type em_4 from editmask within w_personal_m
end type
type st_3 from statictext within w_personal_m
end type
type ddlb_fld from dropdownlistbox within w_personal_m
end type
type ddlb_dwtitles from dropdownlistbox within w_personal_m
end type
type st_4 from statictext within w_personal_m
end type
type ddlb_op from dropdownlistbox within w_personal_m
end type
type sle_value from singlelineedit within w_personal_m
end type
type cb_1 from commandbutton within w_personal_m
end type
type cb_2 from commandbutton within w_personal_m
end type
type cb_4 from commandbutton within w_personal_m
end type
type cb_5 from commandbutton within w_personal_m
end type
type dw_5 from datawindow within w_personal_m
end type
type dw_6 from datawindow within w_personal_m
end type
type dw_4 from datawindow within w_personal_m
end type
type dw_7 from datawindow within w_personal_m
end type
type dw_8 from datawindow within w_personal_m
end type
type pb_1 from picturebutton within w_personal_m
end type
type rb_1 from radiobutton within w_personal_m
end type
type rb_2 from radiobutton within w_personal_m
end type
type rb_3 from radiobutton within w_personal_m
end type
type dw_9 from datawindow within w_personal_m
end type
type cbx_4 from checkbox within w_personal_m
end type
type gb_4 from groupbox within w_personal_m
end type
end forward

global type w_personal_m from w_inheritance
integer width = 6903
integer height = 3116
string title = "인맥 관리(w_personal_m)"
cb_3 cb_3
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_4 cb_4
cb_5 cb_5
dw_5 dw_5
dw_6 dw_6
dw_4 dw_4
dw_7 dw_7
dw_8 dw_8
pb_1 pb_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_9 dw_9
cbx_4 cbx_4
gb_4 gb_4
end type
global w_personal_m w_personal_m

type variables
long i_dw1_width
string is_dw = 'dw_2', is_gubun = '03'
end variables

forward prototypes
public subroutine wf_print (datawindow arg_dw)
end prototypes

public subroutine wf_print (datawindow arg_dw);//
datetime ld_date
dec    ld_amount
long   ll_row,   ll_line, ll_pagecnt, ll_pagetot, ll_cnt, ll_line_cnt
string ls_orderno, ls_cust_name, ls_scene_name, ls_cust_no, ls_null, ls_username
string ls_itemno, ls_item_name, ls_qa, ls_qty, ls_bigo, ls_cnt
int    li_seq_no

debugbreak()

ll_line    = 0
ll_pagecnt = 0

ls_username = gs_username
ll_line_cnt = 10
ll_pagetot  = dw_5.rowcount()
if mod(dw_5.rowcount(), ll_line_cnt) > 0 then
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt) + 1
else
	ll_pagetot = (dw_5.rowcount() / ll_line_cnt)
end if

for ll_row = 1 to dw_5.rowcount()
	if dw_5.object.order_no[ll_row] = "" then continue
	
	if ll_line = 0 then
		ls_orderno    = dw_5.object.order_no[ll_row]
		ls_cust_name  = dw_5.object.cust_name[ll_row]
		ls_scene_name = dw_5.object.scene_desc[ll_row]
		
		arg_dw.object.order_no[1]   = ls_orderno
		arg_dw.object.barcode1[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.barcode2[1]   = "*" + trim(ls_orderno) + "*"
		arg_dw.object.cust_name[1]  = ls_cust_name
		arg_dw.object.scene_name[1] = ls_scene_name
		arg_dw.object.pagecnt[1]    = string(ll_pagecnt + 1) + " / " + string(ll_pagetot)
	end if
	
	ls_item_name = dw_5.object.item_name[ll_row]
	ls_qa        = dw_5.object.com_qa[ll_row]
	ls_qty       = string(dw_5.object.chulgo_qty[ll_row], '###,###,##0')
   ls_bigo      = dw_5.object.rem[ll_row]

	
	ll_line    = ll_line + 1
	arg_dw.setitem(1, 'item_name' + string(ll_line,"00"), ls_item_name)
	arg_dw.setitem(1, 'qa'        + string(ll_line,"00"), ls_qa)
	arg_dw.setitem(1, 'qty'       + string(ll_line,"00"), ls_qty)
	arg_dw.setitem(1, 'bigo'      + string(ll_line,"00"), ls_bigo)

	if ll_line = ll_line_cnt then 	// LABEL지 10줄
		ll_line    = 0
		ll_pagecnt = ll_pagecnt + 1
		arg_dw.print()
		arg_dw.reset()
		arg_dw.insertrow(0)
	end if
next

end subroutine

on w_personal_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_4=create cb_4
this.cb_5=create cb_5
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_4=create dw_4
this.dw_7=create dw_7
this.dw_8=create dw_8
this.pb_1=create pb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_9=create dw_9
this.cbx_4=create cbx_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_5
this.Control[iCurrent+17]=this.dw_6
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.dw_7
this.Control[iCurrent+20]=this.dw_8
this.Control[iCurrent+21]=this.pb_1
this.Control[iCurrent+22]=this.rb_1
this.Control[iCurrent+23]=this.rb_2
this.Control[iCurrent+24]=this.rb_3
this.Control[iCurrent+25]=this.dw_9
this.Control[iCurrent+26]=this.cbx_4
this.Control[iCurrent+27]=this.gb_4
end on

on w_personal_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_4)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.pb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_9)
destroy(this.cbx_4)
destroy(this.gb_4)
end on

event open;call super::open;long l_row

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
//========================================================//
//ddlb_fld2.reset()
//ddlb_dwtitles2.reset()
//ddlb_dwtitles2.visible = false

//GF_DWTitle2ddlb( dw_3, ddlb_fld2, ddlb_dwtitles2 )
//========================================================//


//dw_4.Visible = False
dw_5.Visible = False
dw_6.Visible = False
dw_7.Visible = False
dw_8.Visible = false

pb_1.visible = false
pb_1.enabled = false		// 행추가
//pb_2.enabled = false		// 행삭제

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)
//dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
//dw_5.SetTransObject(SQLCA)
//dw_6.SetTransObject(SQLCA)
//dw_9.SetTransObject(SQLCA)

//em_1.text = string(today(), 'yyyy/mm/dd')
//em_2.text = string(today(), 'yyyy/mm/dd')
//em_3.text = "HD" + string(today(), "yyyymmdd")

//em_3.SelectText(9, 2)
//em_3.setfocus()

pb_retrieve.triggerevent( clicked! )

pb_retrieve.triggerevent( clicked! )

l_row = dw_2.InsertRow(0)
dw_2.object.gubun[l_row] = is_gubun
end event

event resize;call super::resize;//
//dw_9.y      = dw_1.y + dw_1.height
//dw_9.height = newheight - dw_9.y - dw_1.height

dw_1.height = newheight - gb_4.height - gb_3.height - 50

dw_4.height  = dw_1.height

//dw_3.height = dw_1.height - dw_2.height - st_1.height - 20
//dw_4.height = dw_3.height
//dw_9.height = dw_3.height 


end event

type pb_save from w_inheritance`pb_save within w_personal_m
integer x = 4338
integer y = 72
integer taborder = 150
end type

event pb_save::clicked;call super::clicked;
dwItemStatus l_status
long l_personal_id
long   ll_count, l_count
string ls_company_code, ls_company_name, ls_name, ls_tel, ls_kind

debugbreak()

/////////////////////////////
// 건설사 코드 부여
/////////////////////////////
setpointer(hourglass!)

dw_2.AcceptText()

IF isnull(dw_2.object.name[1]) OR dw_2.object.name[1] <= "" THEN
	messagebox("입력오류", "이름은 필수 입력사항입니다.")
	return
END IF


ls_name = dw_2.object.name[1]

ls_tel 	    = dw_2.object.tel[1]


l_status = dw_2.GetItemStatus(1, 0, Primary!)

if l_status = NewModified! then
	
	
	l_count = 0
	
	select  count(*)
		 into :l_count
	from bogo_personal_connection
	where name = rtrim(ltrim(:ls_name))
		and replace(rtrim(ltrim(tel)),'-', '') = replace(rtrIm(ltrim(:ls_tel)),'-', '')
		and gubun = :is_gubun;
	
	if l_count >0 then
		messagebox('알림' , '기존 동일한 이름, 전화번호 사용자가 존재합니다.',exclamation!)
		return 0
	end if	
	
	ls_kind = dw_2.object.kind[1]		
	ls_company_code = dw_2.object.company_code[1]
	
	if ls_kind = '01' then
	
		select code_name
		into :ls_company_name
		from sale_bogo_code
		where code = :ls_company_code
		   and gubun = :is_gubun;
		
		dw_2.object.company[1] = ls_company_name
	else
	
		setnull(ls_company_code)
		dw_2.object.company_code[1] = ls_company_code		
				
	end if
	
	
	if isnull(dw_2.object.write_date[1]) then
   		dw_2.object.write_date[1] = trim(gf_today2s())
	end if
	
	if isnull(dw_2.object.write_user_id[1]) then
   		dw_2.object.write_user_id[1] = gs_userid
	end if	

	dw_2.object.modify_date[1] = trim(gf_today2s())
	dw_2.object.modify_user_id[1] = gs_userid
	
end if


if l_status = DataModified! then
	
	ls_company_code = dw_2.object.company_code[1]	
	ls_kind = dw_2.object.kind[1]			
	
	if ls_kind = '01' then
	
		select code_name
		into :ls_company_name
		from sale_bogo_code
		where code = :ls_company_code
		    and gubun = :is_gubun;
		
		dw_2.object.company[1] = ls_company_name	
		
	else		
		setnull(ls_company_code)
		dw_2.object.company_code[1] = ls_company_code
	end if
	
	dw_2.object.modify_date[1] = trim(gf_today2s())	
	dw_2.object.modify_user_id[1] = gs_userid
	
end if


if wf_update1( dw_2, "N" ) = false then
	RETURN
else

	dw_2.AcceptText()
	
	FOR ll_count = 1 TO dw_4.rowcount()
		
		l_status = dw_4.GetItemStatus(ll_count, 0, Primary!)
		
		if l_status = NewModified! then		
			dw_4.object.personal_id[ll_count] = dw_2.object.personal_id[1]		
		end if	
		
		if l_status = NewModified! or l_status = DataModified! then	
			dw_4.object.write_date[ll_count] = trim(gf_today2s())
			dw_4.object.write_user_id[ll_count] = gs_userid
		end if
		
	NEXT
	
end if

dw_2.AcceptText()
dw_4.AcceptText()


if wf_update1( dw_4, "Y" ) = false then
	RETURN
else
	//pb_retrieve.triggerevent( clicked! )
	
end if
end event

type dw_1 from w_inheritance`dw_1 within w_personal_m
integer x = 37
integer y = 448
integer width = 1728
integer height = 2036
integer taborder = 200
string dataobject = "d_personal_r"
boolean hscrollbar = false
boolean hsplitscroll = true
boolean livescroll = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
string ls_con_code, ls_cat, ls_orderno, ls_askno, ls_seqno
long   ll_row, ll_cnt

debugbreak()

//dw_2.reset()
//dw_3.reset()
//dw_9.reset()
//if dw_1.rowcount() < 1 then RETURN

//ls_con_code   = dw_1.object.con_code[currentrow]
//ls_orderno = dw_1.object.order_no[currentrow]
//if isnull(ls_fitno) or ls_fitno = "" then
//else
//dw_2.Retrieve( ls_con_code )
//	dw_3.Retrieve( ls_fitno )
//end if
//
//if isnull(ls_orderno) or ls_orderno = "" then
//else
//	dw_9.Retrieve( ls_orderno )
//end if


//ls_cat   = dw_1.object.cat[ll_row]
//if ls_cat = "O" then	// 수주출고
//	ls_orderno  =  dw_1.Object.order_no[ll_row]
//   if isnull(ls_orderno) or ls_orderno = "" then
//	else
//		em_3.text = mid(ls_orderno, 1, 10)
//		em_4.text = right(ls_orderno, 3)
//		
//		if dw_2.Retrieve( ls_orderno ) < 1 then dw_2.insertrow(0)
//		dw_4.Retrieve( ls_orderno )
//		dw_5.Retrieve( ls_orderno )
//		dw_6.Retrieve( ls_orderno )
//	end if
//else		// 물품요청
//	ls_askno  =  dw_1.Object.order_no[ll_row]
//   if isnull(ls_askno) or ls_askno = "" then
//   else
//		em_3.text = mid(ls_askno, 1, 9)
//		em_4.text = right(ls_askno, 2)
//		
//		dw_2.Retrieve( ls_askno )
//		dw_4.Retrieve( ls_askno )
//		dw_5.Retrieve( ls_askno )
//		dw_6.Retrieve( ls_askno )
//	end if
//end if
//
end event

event dw_1::clicked;call super::clicked;long l_personal_id

is_dw = 'dw_1'

if row = 0 then return

this.SetRedraw(FALSE)

debugbreak()
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


if dw_1.rowcount() < 1 then RETURN

l_personal_id   = dw_1.object.personal_id[row]

if isnull(l_personal_id) then
else	
	dw_2.Retrieve( l_personal_id, is_gubun )
	dw_4.Retrieve( l_personal_id, is_gubun )	
end if

this.SetRedraw(TRUE)
end event

type st_title from w_inheritance`st_title within w_personal_m
integer x = 46
integer width = 1298
string text = "인맥 관리"
end type

type st_tips from w_inheritance`st_tips within w_personal_m
end type

type pb_compute from w_inheritance`pb_compute within w_personal_m
boolean visible = false
integer taborder = 240
end type

type pb_print_part from w_inheritance`pb_print_part within w_personal_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_personal_m
integer x = 4530
integer y = 72
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_personal_m
integer x = 4146
integer y = 72
integer taborder = 140
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print   l_print
string     ls_orderno

// sale_order_no 수주번호
// ask_no        요청번호

debugbreak()
if dw_1.rowcount() < 1 then 
	MessageBox("확인","해당하는 내용이 없습니다.")
end if

if cbx_4.checked = true then		// A4 출력
	l_print.st_datawindow  = dw_8
	l_print.st_print_sheet = " 프린트용지 : A4"
	gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
	
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
else
	PrintSetup()
	dw_7.dataobject = "d_label_main_prt"
	dw_7.Modify('DataWindow.Print.Paper.Size=9 DataWindow.Print.Orientation=1 Datawindow.Zoom=100')
	dw_7.settransobject(sqlca)
	
	dw_7.Reset()
	dw_7.InsertRow(0)
//	wf_print( dw_3 )
	
	ls_orderno = dw_7.object.order_no[1]
	if isnull(ls_orderno) or ls_orderno = "" then
		// 10, 20... 페이지 공난출력 방지
	else
		dw_7.print()
	end if
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_personal_m
integer x = 3954
integer y = 72
integer taborder = 260
end type

event pb_cancel::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"취소",parent, li_x, li_y)

end event

event pb_cancel::clicked;call super::clicked;long ll_row

dw_2.reset()
dw_4.reset()

ll_row = dw_2.insertrow(0)

dw_2.object.gubun[ll_row] = is_gubun
end event

type pb_delete from w_inheritance`pb_delete within w_personal_m
integer x = 3762
integer y = 72
integer taborder = 270
end type

event pb_delete::clicked;call super::clicked;// 삭제
long l_personal_id
long   ll_row, ll_dw1row

l_personal_id = dw_2.object.personal_id[1]

//if isnull( l_personal_id ) then RETURN

//if MessageBox("확인", "제품상차 내역을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN

//dw_3.setredraw( false )
//for ll_row = dw_3.rowcount() TO 1 step -1
//	dw_3.deleterow(ll_row)
//next
//dw_3.setredraw( true )
//
//ll_dw1row = dw_1.getrow()
//dw_2.deleterow( 1 )
//if wf_update2( dw_2, dw_3, "Y") = true then
//else
//	MessageBox("삭제","제품상차 내역 삭제시 오류가 발생했습니다.", exclamation!)
//end if


if isnull(dw_2.object.personal_id[1] ) or dw_2.object.personal_id[1] = 0 then
	
	if is_dw = 'dw_2' then
		
		if MessageBox("확인", "건설사코드를  삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
	
		for ll_row = dw_4.rowcount() TO 1 step -1
			dw_4.deleterow(ll_row)
		next	
		
		dw_2.deleterow( 1 )
		 	
	elseif is_dw = 'dw_4' then
		
		if MessageBox("확인", "유창인맥을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
		
		ll_row = dw_4.getrow()
		dw_4.deleterow(ll_row)
		
	end if 
	
else
	
	if is_dw = 'dw_2' then
		
		if MessageBox("확인", "건설사코드를  삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
		
		for ll_row = dw_4.rowcount() TO 1 step -1
			dw_4.deleterow(ll_row)
		next	
		
		dw_2.deleterow( 1 )
	
	elseif is_dw = 'dw_4' then
		
		if MessageBox("확인", "유창인맥을 삭제하시겠습니까 ?", Question!, OKCancel!, 2) = 2 then RETURN
		
		ll_row = dw_4.getrow()
		dw_4.deleterow(ll_row)
		
	end if 
	
	if wf_update2( dw_2, dw_4, "Y") = true then
	else
		MessageBox("삭제","제품상차 내역 삭제시 오류가 발생했습니다.", exclamation!)
	end if
	
	
end if


//pb_retrieve.triggerevent( clicked! )



end event

type pb_insert from w_inheritance`pb_insert within w_personal_m
integer x = 3570
integer y = 72
integer taborder = 280
end type

event pb_insert::clicked;call super::clicked;//
string ls_custno, ls_custname, ls_sceneno, ls_scenename
long   ll_row, ll_totchk

//ll_totchk = dw_1.object.totchk[1]
//if ll_totchk < 1 then 
//	MessageBox("확인", "출고요청, 물품이동 항목을 선택 후 작업하시기 바랍니다.")
//	RETURN
//end if

//ls_custno    = dw_1.object.cust_no[dw_1.getrow()]
//ls_custname  = dw_1.object.cust_name[dw_1.getrow()]
//ls_sceneno   = dw_1.object.scene_code[dw_1.getrow()]
//ls_scenename = dw_1.object.scene_desc[dw_1.getrow()]

//dw_3.reset()
//dw_2.reset()

if is_dw = 'dw_2' then
	dw_2.reset()
	ll_row = dw_2.insertrow(0)
	dw_2.object.gubun[ll_row] = is_gubun
	dw_4.reset()	
elseif 	is_dw = 'dw_4' then
	ll_row = dw_4.insertrow(0)		
	dw_4.object.gubun[ll_row] = is_gubun
end if

//dw_2.object.cust_no[1]    = ls_custno
//dw_2.object.cust_name[1]  = ls_custname
//dw_2.object.scene_code[1] = ls_sceneno
//dw_2.object.scene_desc[1] = ls_scenename
//dw_2.object.area_no[1]    = gs_area
//dw_2.object.fit_date[1]   = gf_today()
//dw_2.object.fit_user[1]   = gs_userid
//dw_2.object.user_name[1]  = gs_username
//
//cb_6.triggerevent( clicked! )
//cb_6.enabled = true		// 선택 가져오기
//pb_1.enabled = true		// 행추가
//pb_2.enabled = true		// 행삭제

//dw_3.setcolumn( 'ship_qty' )
//dw_3.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_personal_m
integer x = 3378
integer y = 72
end type

event pb_retrieve::clicked;call super::clicked;//
//string ls_cat, ls_start, ls_end
//
//if rb_1.checked = true then
//	ls_cat = '%'
//elseif rb_2.checked = true then
//	ls_cat = '출하'
//elseif rb_3.checked = true then
//	ls_cat = '이동'
//end if
//
//ls_start = em_1.Text
//ls_end   = em_2.Text

dw_1.reset()
dw_2.reset()

/*권한부여 필요 jowonsuk 2020-4-19*/
gs_level = '3'


if gs_level = '3' then
	dw_1.retrieve('%', is_gubun)
else
	dw_1.retrieve(gs_userid, is_gubun)	
end if


// 필터해지
//cb_8.triggerevent( clicked! )		


end event

type gb_3 from w_inheritance`gb_3 within w_personal_m
boolean visible = false
integer x = 1783
integer y = 16
integer width = 727
integer height = 228
integer taborder = 250
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "구분"
end type

type gb_2 from w_inheritance`gb_2 within w_personal_m
boolean visible = false
integer x = 2523
integer y = 16
integer width = 809
integer height = 228
integer taborder = 180
integer textsize = -8
integer weight = 400
long textcolor = 0
boolean enabled = false
string text = "제품상차 번호"
end type

type gb_1 from w_inheritance`gb_1 within w_personal_m
integer x = 3346
integer y = 16
integer width = 1394
integer height = 228
integer taborder = 190
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_personal_m
string tag = "d_construction_m"
integer x = 1787
integer y = 448
integer width = 2693
integer height = 1324
integer taborder = 230
boolean bringtotop = false
string title = "d_construction_m"
string dataobject = "d_personal_connection_m"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::clicked;call super::clicked;is_dw = 'dw_2'
end event

event dw_2::itemchanged;call super::itemchanged;integer l_count
string ls_name, ls_tel
dwItemStatus l_status

this.accepttext()

choose case dwo.name
	case 'name'

//		ls_name = trim(data)
//		
//		l_count = 0
//		
//		select  count(*)
//		    into :l_count
//		from personal_connection
//		where name = :ls_name;
//		
//		if l_count >0 then
//			messagebox('알림' , '기존 동일한 이름의 사용자가 존재합니다.',exclamation!)
//		end if
		
	case 'tel'
		
		l_status = this.GetItemStatus(1, 0, Primary!)
		
		if l_status = NewModified! then		
		
				ls_name = trim(this.object.name[row])
				ls_tel 	    = trim(data)
				
				l_count = 0
				
				select  count(*)
					 into :l_count
				from bogo_personal_connection
				where name = :ls_name
					and replace(rtrim(ltrim(tel)),'-', '') = replace(:ls_tel,'-', '')
					and gubun = :is_gubun;
				
				if l_count >0 then
					messagebox('알림' , '기존 동일한 이름, 전화번호 사용자가 존재합니다.',exclamation!)
					return 0
				end if
				
		end if
		
end choose
end event

type cb_3 from commandbutton within w_personal_m
boolean visible = false
integer x = 4987
integer y = 88
integer width = 457
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "none"
end type

event clicked;
//string ls_Docname, ls_Named, ls_ExpandName
//integer ls_Value, li_Pos, li_value
//if dw_3.rowcount() < 1 then return
//ls_value = GetFileSaveName("Select File",  & 
//	ls_Docname, ls_Named, "XLS",  &
//	"엑셀 (*.XLS), *.XLS," + &
//   "CSV(쉽표로 분리), *.CSV,")
//li_Pos = Pos(ls_Named, ".")
//ls_ExpandName = Mid(ls_Named, li_Pos + 1, Len(ls_Named)- li_Pos)
//
//if ls_Value = 1 then
//		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
//  		      dw_3.SaveAsascii(ls_DocName)
//		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//    		      dw_3.SaveAs(ls_DocName, CSV!, TRUE)
//      end if
//end if
end event

type em_1 from editmask within w_personal_m
boolean visible = false
integer x = 2555
integer y = 152
integer width = 379
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;//
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_personal_m
boolean visible = false
integer x = 2944
integer y = 152
integer width = 357
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_3 from editmask within w_personal_m
event keydown pbm_dwnkey
boolean visible = false
integer x = 2555
integer y = 72
integer width = 379
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########"
boolean autoskip = true
end type

type em_4 from editmask within w_personal_m
boolean visible = false
integer x = 2944
integer y = 72
integer width = 137
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "1"
alignment alignment = right!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean autoskip = true
string minmax = "1~~999"
end type

event getfocus;//
this.SelectText(1, 3)


end event

type st_3 from statictext within w_personal_m
integer x = 352
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_personal_m
integer x = 539
integer y = 308
integer width = 480
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_personal_m
integer x = 581
integer y = 320
integer width = 311
integer height = 88
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

type st_4 from statictext within w_personal_m
integer x = 1038
integer y = 324
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

type ddlb_op from dropdownlistbox within w_personal_m
integer x = 1207
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_personal_m
integer x = 1527
integer y = 316
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_personal_m
integer x = 2098
integer y = 316
integer width = 160
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_personal_m
integer x = 2263
integer y = 316
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_personal_m
integer x = 2427
integer y = 316
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_personal_m
integer x = 2592
integer y = 316
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_5 from datawindow within w_personal_m
integer x = 411
integer y = 20
integer width = 146
integer height = 100
integer taborder = 250
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_jajae_prt"
boolean livescroll = true
end type

type dw_6 from datawindow within w_personal_m
integer x = 869
integer y = 20
integer width = 146
integer height = 100
integer taborder = 160
boolean bringtotop = true
string title = "d_orsale_print2"
string dataobject = "d_orsale_jajae_p"
boolean livescroll = true
end type

type dw_4 from datawindow within w_personal_m
integer x = 4498
integer y = 448
integer width = 2761
integer height = 1316
integer taborder = 240
boolean bringtotop = true
string title = "none"
string dataobject = "d_bogo_personal_connection_m2"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw_4'
end event

type dw_7 from datawindow within w_personal_m
integer x = 1042
integer y = 20
integer width = 146
integer height = 100
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_label_main_prt"
boolean livescroll = true
end type

type dw_8 from datawindow within w_personal_m
integer x = 1225
integer y = 20
integer width = 146
integer height = 100
integer taborder = 280
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_jajae"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_personal_m
integer x = 1422
integer y = 52
integer width = 155
integer height = 104
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;//

end event

type rb_1 from radiobutton within w_personal_m
boolean visible = false
integer x = 1819
integer y = 76
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "전체"
end type

type rb_2 from radiobutton within w_personal_m
boolean visible = false
integer x = 2135
integer y = 76
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "출고요청"
boolean checked = true
end type

type rb_3 from radiobutton within w_personal_m
boolean visible = false
integer x = 2135
integer y = 160
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "물품이동"
end type

type dw_9 from datawindow within w_personal_m
boolean visible = false
integer x = 311
integer y = 2496
integer width = 1527
integer height = 68
integer taborder = 170
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_orsale_l3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_4 from checkbox within w_personal_m
boolean visible = false
integer x = 1819
integer y = 156
integer width = 311
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "A4 출력"
boolean checked = true
end type

type gb_4 from groupbox within w_personal_m
integer x = 37
integer y = 260
integer width = 4704
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

