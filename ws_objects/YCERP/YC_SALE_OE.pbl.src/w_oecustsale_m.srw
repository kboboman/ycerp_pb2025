$PBExportHeader$w_oecustsale_m.srw
$PBExportComments$저장소관리(1998/02/02 - 김구현)
forward
global type w_oecustsale_m from w_inheritance
end type
type dw_3 from datawindow within w_oecustsale_m
end type
type st_4 from statictext within w_oecustsale_m
end type
type ddlb_fld from dropdownlistbox within w_oecustsale_m
end type
type st_5 from statictext within w_oecustsale_m
end type
type sle_value from singlelineedit within w_oecustsale_m
end type
type cbx_op from checkbox within w_oecustsale_m
end type
type cb_1 from commandbutton within w_oecustsale_m
end type
type cb_2 from commandbutton within w_oecustsale_m
end type
type cb_3 from commandbutton within w_oecustsale_m
end type
type cb_5 from commandbutton within w_oecustsale_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oecustsale_m
end type
type ddlb_op from dropdownlistbox within w_oecustsale_m
end type
type st_7 from statictext within w_oecustsale_m
end type
type em_1 from editmask within w_oecustsale_m
end type
type rb_1 from radiobutton within w_oecustsale_m
end type
type rb_2 from radiobutton within w_oecustsale_m
end type
type rb_3 from radiobutton within w_oecustsale_m
end type
type rb_4 from radiobutton within w_oecustsale_m
end type
type em_2 from editmask within w_oecustsale_m
end type
type st_1 from statictext within w_oecustsale_m
end type
type gb_4 from groupbox within w_oecustsale_m
end type
type gb_5 from groupbox within w_oecustsale_m
end type
type gb_6 from groupbox within w_oecustsale_m
end type
end forward

global type w_oecustsale_m from w_inheritance
integer width = 4814
integer height = 2392
string title = "거래처별수주정보관리(w_oecustsale_m)"
long backcolor = 81838264
dw_3 dw_3
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
st_7 st_7
em_1 em_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
em_2 em_2
st_1 st_1
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type
global w_oecustsale_m w_oecustsale_m

type variables
string is_s_chk = 'Y', is_dw, is_save_ok = '0'

datawindowchild idwc_cust, idwc_company_name
end variables

event open;call super::open;string ls_close_yn, ls_null, ls_fr_yyyymm, ls_to_yyyymm, ls_userid, ls_gubun

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

setnull(ls_null)

dw_1.getchild("cust_no", idwc_cust)
idwc_cust.insertrow(1)
idwc_cust.settransobject(sqlca)
idwc_cust.retrieve()

dw_1.getchild("cust_sale_company_name", idwc_company_name)
idwc_company_name.insertrow(1)
idwc_company_name.settransobject(sqlca)
idwc_company_name.retrieve()

em_1.text = string(today(), "YYYY/MM")
em_2.text = string(today(), "YYYY/MM")

ls_fr_yyyymm = LeftA(em_1.text,4) + RightA(em_1.text,2)
ls_to_yyyymm = LeftA(em_2.text,4) + RightA(em_2.text,2)

if rb_1.checked then
	ls_close_yn = '%'
else
	ls_close_yn = '1'	
end if

 if GF_PERMISSION("거래처별수주관리조회풀권한", gs_userid) = "Y" then
	ls_userid = '%'	
	rb_3.enabled  =  true	
	rb_4.enabled  =  true
else
//	ls_userid = gs_userid
//	rb_3.enabled  =  false
//	rb_4.enabled  =  false

	ls_userid = '%'	
	rb_3.enabled  =  true	
	rb_4.enabled  =  true
end if

if rb_4.checked then
	ls_gubun = '1'
else
	ls_gubun = '2'	
end if

if ls_fr_yyyymm = ls_to_yyyymm then
	
	dw_1.dataobject = 'd_oecustsale_m'
	dw_3.dataobject = 'd_oecustsale_r'	
	
	dw_1.settransobject(sqlca)
	dw_3.settransobject(sqlca)	
	
	dw_1.retrieve(ls_fr_yyyymm, ls_close_yn, ls_userid, ls_gubun)
	dw_3.retrieve(ls_fr_yyyymm, ls_close_yn, ls_userid, ls_gubun)	
else
	
	dw_1.dataobject = 'd_oecustsale_m2'
	dw_3.dataobject = 'd_oecustsale_r2'	
	
	dw_1.settransobject(sqlca)
	dw_3.settransobject(sqlca)		
	
	dw_1.retrieve(ls_fr_yyyymm, ls_to_yyyymm, ls_close_yn, ls_userid, ls_gubun)
	dw_3.retrieve(ls_fr_yyyymm, ls_to_yyyymm, ls_close_yn, ls_userid, ls_gubun)	
end if
end event

on w_oecustsale_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
this.st_7=create st_7
this.em_1=create em_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.em_2=create em_2
this.st_1=create st_1
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cbx_op
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.em_1
this.Control[iCurrent+15]=this.rb_1
this.Control[iCurrent+16]=this.rb_2
this.Control[iCurrent+17]=this.rb_3
this.Control[iCurrent+18]=this.rb_4
this.Control[iCurrent+19]=this.em_2
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.gb_4
this.Control[iCurrent+22]=this.gb_5
this.Control[iCurrent+23]=this.gb_6
end on

on w_oecustsale_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
destroy(this.st_7)
destroy(this.em_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 73
dw_1.height = newheight - 484
gb_2.width = dw_1.width

end event

type pb_save from w_inheritance`pb_save within w_oecustsale_m
integer x = 4311
integer y = 116
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_cnt, l_lot_no, l_count, l_max
string ls_yyyymm, ls_company_name, ls_lot_no, ls_today
string ls_area_nm, ls_address
dwItemStatus l_status

dw_1.accepttext()
ls_yyyymm = LeftA(em_1.text,4)+RightA(em_1.text,2)
ls_today = string(today(), "YYYYMMDD")

if is_save_ok = '1' then

		FOR ll_cnt = 1 TO dw_1.rowcount()
			
			if dw_1.dataobject = 'd_oecustsale_m' then
			
				ls_company_name = trim(dw_1.object.cust_sale_company_name[ll_cnt])
				
				l_count = 0
				
				select count(*)
				into :l_count
				from cust_sale
				where rtrim(ltrim(company_name)) = :ls_company_name
				and yyyymm = '000000';
				
				
				if l_count = 0 then
					
					select max(substring(lot_no,7,4))+1
					into :l_max
					from cust_sale
					where yyyymm = '000000';
					
					if isnull(l_max) or l_max = 0 then
						l_max = 1
					end if
					
					ls_lot_no = '000000' + trim(string(l_max,'0000'))
					
					insert into cust_sale (lot_no, yyyymm, company_name)
												values  (:ls_lot_no, '000000', :ls_company_name );
				end if
			
			end if
			
			dw_1.object.cust_sale_write_date[ll_cnt] = ls_today
			ls_area_nm = dw_1.object.cust_sale_area_nm[ll_cnt]
			if isnull(ls_area_nm) then
				ls_area_nm = ''
			end if
			
			ls_address = dw_1.object.cust_sale_address[ll_cnt]
			
			if isnull(ls_address) then
				ls_address = ''
			end if
			
			dw_1.object.cust_sale_project_name[ll_cnt] = ls_area_nm + ' ' + ls_address
			
		NEXT
		
		wf_update1(dw_1,"Y")
		
else
end if

//idwc_company_name.retrieve()
end event

type dw_1 from w_inheritance`dw_1 within w_oecustsale_m
integer x = 37
integer y = 456
integer width = 4334
integer height = 1764
string dataobject = "d_oecustsale_m"
end type

event dw_1::dberror;call super::dberror;return 1
end event

event dw_1::itemchanged;

string ls_salesman, ls_user_name

this.accepttext()
//
//if gs_username <> this.object.login_user_name[row] and isnull(this.object.login_user_name[row]) = false then	
//	is_save_ok = '0'
//	messagebox('알림', '수정할권한이없습니다.')
//else
////	messagebox('알림', '변경할 권한이 없습니다.')	
//end if
//
CHOOSE CASE dwo.name 
	case 'cust_sale_kind_amt1'
		
//		ld_amt1 = dec(data) 
//		
//		if isnull(this.object.cust_sale_kind_amt2[row]) then
//			ld_amt2 = 0			
//		else			
//			ld_amt2 = this.object.cust_sale_kind_amt2[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt3[row]) then
//			ld_amt3 = 0			
//		else						
//			ld_amt3 = this.object.cust_sale_kind_amt3[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt4[row]) then
//			ld_amt4 = 0			
//		else						
//			ld_amt4 = this.object.cust_sale_kind_amt4[row]
//		end if
//		
//		this.object.cust_sale_amt[row] = (ld_amt1 + ld_amt2 + ld_amt3 + ld_amt4)/100
		
	case 'cust_sale_kind_amt2'
		
//		ld_amt2 = dec(data) 
//		
//		if isnull(this.object.cust_sale_kind_amt1[row]) then
//			ld_amt1 = 0			
//		else						
//			ld_amt1 = this.object.cust_sale_kind_amt1[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt3[row]) then
//			ld_amt3 = 0			
//		else						
//			ld_amt3 = this.object.cust_sale_kind_amt3[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt4[row]) then
//			ld_amt4 = 0			
//		else						
//			ld_amt4 = this.object.cust_sale_kind_amt4[row]
//		end if
//		
//		this.object.cust_sale_amt[row] = (ld_amt1 + ld_amt2 + ld_amt3 + ld_amt4)/100
						
	case 'cust_sale_kind_amt3'
		
//		ld_amt3 = dec(data) 
//				
//		if isnull(this.object.cust_sale_kind_amt1[row]) then
//			ld_amt1 = 0			
//		else						
//			ld_amt1 = this.object.cust_sale_kind_amt1[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt2[row]) then
//			ld_amt2 = 0			
//		else						
//			ld_amt2 = this.object.cust_sale_kind_amt2[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt4[row]) then
//			ld_amt4 = 0			
//		else						
//			ld_amt4 = this.object.cust_sale_kind_amt4[row]
//		end if
//		
//		this.object.cust_sale_amt[row] = (ld_amt1 + ld_amt2 + ld_amt3 + ld_amt4)/100
		
	case 'cust_no'	
		
		select b.user_name
		  into :ls_user_name
		from customer a inner join login b on a.salesman = b.user_id
		where a.cust_no = rtrim(ltrim(:data));
		
		this.object.customer_user_name[row] = ls_user_name
		
//		ld_amt4 = dec(data) 		
//		
//		if isnull(this.object.cust_sale_kind_amt1[row]) then
//			ld_amt1 = 0			
//		else						
//			ld_amt1 = this.object.cust_sale_kind_amt1[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt2[row]) then
//			ld_amt2 = 0			
//		else						
//			ld_amt2 = this.object.cust_sale_kind_amt2[row]
//		end if
//		
//		if isnull(this.object.cust_sale_kind_amt3[row]) then
//			ld_amt3 = 0			
//		else						
//			ld_amt3 = this.object.cust_sale_kind_amt3[row]
//		end if
//		
//		this.object.cust_sale_amt[row] = (ld_amt1 + ld_amt2 + ld_amt3 + ld_amt4)/100
		
END CHOOSE


end event

event dw_1::itemerror;call super::itemerror;choose case dwo.name
	case 'loc_no'
		this.object.loc_no[row] = ''
end choose
return -1
end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oecustsale_m
integer width = 1367
string text = "거래처별 수주정보 관리"
end type

type st_tips from w_inheritance`st_tips within w_oecustsale_m
end type

type pb_compute from w_inheritance`pb_compute within w_oecustsale_m
boolean visible = false
integer x = 2802
integer y = 84
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oecustsale_m
boolean visible = false
integer x = 3035
integer y = 92
end type

type pb_close from w_inheritance`pb_close within w_oecustsale_m
integer x = 4503
integer y = 116
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oecustsale_m
integer x = 4119
integer y = 116
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

if dw_1.rowcount() < 1 then return

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 저장소내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=61'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oecustsale_m
boolean visible = false
integer x = 3237
integer y = 92
end type

type pb_delete from w_inheritance`pb_delete within w_oecustsale_m
integer x = 3927
integer y = 116
end type

event pb_delete::clicked;long   ll_row, ll_cnt
string ls_loc


if GF_PERMISSION("거래처별수주관리조회풀권한", gs_userid) = "Y" then	
	ll_row = dw_1.getrow()
	if ll_row < 1 then return
	
	dw_1.deleterow(ll_row)
else
	
	ll_row = dw_1.getrow()
	
	if ll_row < 1 then return
	
	if (gs_username = dw_1.object.customer_user_name[ll_row]) or (gs_username = dw_1.object.login_user_name[ll_row]) then
			
		dw_1.deleterow(ll_row)	
		
	end if
	
end if 	
	
end event

event pb_delete::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)


end event

type pb_insert from w_inheritance`pb_insert within w_oecustsale_m
integer x = 3735
integer y = 116
end type

event pb_insert::clicked;call super::clicked;long   ll_row
String ls_yyyymm, ls_to_yyyymm

is_s_chk = 'N'
ls_yyyymm = LeftA(em_1.text,4)+RightA(em_1.text,2)
ls_to_yyyymm = LeftA(trim(em_2.text),4)+ RightA(em_2.text,2)


if ls_yyyymm = ls_to_yyyymm then

	dw_1.accepttext()
	ll_row = dw_1.insertrow(0)
	dw_1.object.login_user_name[ll_row] = gs_username
	dw_1.object.cust_sale_salesman[ll_row] = gs_userid
	dw_1.object.cust_sale_yyyymm[ll_row] = ls_yyyymm
	dw_1.object.cust_sale_lot_no[ll_row] = ls_yyyymm + trim(string(ll_row,'0000'))
	dw_1.object.cust_sale_close_yn[ll_row] = '1'
	
	dw_1.ScrollToRow(ll_row)
	//dw_1.setcolumn('cust_no')  
	dw_1.setfocus()

end if
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oecustsale_m
integer x = 3543
integer y = 116
end type

event pb_retrieve::clicked;call super::clicked;string ls_fr_yyyymm, ls_to_yyyymm, ls_close_yn, ls_userid, ls_gubun

ls_fr_yyyymm  = LeftA(trim(em_1.text),4)+ RightA(em_1.text,2)
ls_to_yyyymm = LeftA(trim(em_2.text),4)+ RightA(em_2.text,2)


if rb_1.checked then
	ls_close_yn = '%'
else
	ls_close_yn = '1'	
end if

// if GF_PERMISSION("거래처별수주관리조회풀권한", gs_userid) = "Y" then
	ls_userid = '%'	
//else
//	ls_userid = gs_userid
//end if

if rb_4.checked then
	ls_gubun = '1'
else
	ls_gubun = '2'	
end if


if ls_fr_yyyymm = ls_to_yyyymm then
	dw_1.dataobject = 'd_oecustsale_m'
	dw_3.dataobject = 'd_oecustsale_r'
	
	dw_1.settransobject(sqlca)
	dw_3.settransobject(sqlca)		
	
	dw_1.retrieve(ls_fr_yyyymm, ls_close_yn, ls_userid, ls_gubun)
	dw_3.retrieve(ls_fr_yyyymm, ls_close_yn, ls_userid, ls_gubun)	
	
else	
	dw_1.dataobject = 'd_oecustsale_m2'
	dw_3.dataobject = 'd_oecustsale_r2'
	
	dw_1.settransobject(sqlca)
	dw_3.settransobject(sqlca)		
	
	dw_1.retrieve(ls_fr_yyyymm, ls_to_yyyymm, ls_close_yn, ls_userid, ls_gubun)
	dw_3.retrieve(ls_fr_yyyymm, ls_to_yyyymm, ls_close_yn, ls_userid, ls_gubun)	
	
end if	

is_save_ok = '1'
end event

type gb_3 from w_inheritance`gb_3 within w_oecustsale_m
integer x = 1458
integer y = 108
integer width = 1065
integer height = 132
integer textsize = -8
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_oecustsale_m
integer x = 37
integer y = 284
integer width = 4334
integer height = 160
integer textsize = -8
integer weight = 400
long backcolor = 81838264
end type

type gb_1 from w_inheritance`gb_1 within w_oecustsale_m
integer x = 3515
integer y = 76
integer width = 1202
long backcolor = 81838264
end type

event gb_1::constructor;call super::constructor;//dw_4.insertrow(0)
end event

type dw_2 from w_inheritance`dw_2 within w_oecustsale_m
boolean visible = false
integer x = 2638
integer y = 56
integer width = 160
integer height = 96
boolean enabled = false
string dataobject = "d_cdlocation_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_3 from datawindow within w_oecustsale_m
boolean visible = false
integer x = 1737
integer y = 40
integer width = 201
integer height = 64
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_oecustsale_r"
boolean livescroll = true
end type

type st_4 from statictext within w_oecustsale_m
integer x = 82
integer y = 348
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_oecustsale_m
integer x = 261
integer y = 328
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

type st_5 from statictext within w_oecustsale_m
integer x = 731
integer y = 344
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

type sle_value from singlelineedit within w_oecustsale_m
integer x = 1193
integer y = 336
integer width = 535
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

type cbx_op from checkbox within w_oecustsale_m
integer x = 1742
integer y = 348
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

type cb_1 from commandbutton within w_oecustsale_m
integer x = 1943
integer y = 336
integer width = 146
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

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
string     ls_column, ls_value, ls_col, ls_type, ls_op
integer    li_ret

arg_dw  = dw_1

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

type cb_2 from commandbutton within w_oecustsale_m
integer x = 2094
integer y = 336
integer width = 146
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

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oecustsale_m
integer x = 2245
integer y = 336
integer width = 146
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oecustsale_m
integer x = 2395
integer y = 336
integer width = 146
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_oecustsale_m
integer x = 293
integer y = 340
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

type ddlb_op from dropdownlistbox within w_oecustsale_m
integer x = 901
integer y = 332
integer width = 279
integer height = 500
integer taborder = 70
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

type st_7 from statictext within w_oecustsale_m
integer x = 1477
integer y = 144
integer width = 315
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oecustsale_m
integer x = 1792
integer y = 144
integer width = 320
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type rb_1 from radiobutton within w_oecustsale_m
integer x = 2592
integer y = 104
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "전체"
boolean checked = true
end type

type rb_2 from radiobutton within w_oecustsale_m
integer x = 2587
integer y = 180
integer width = 375
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "완료제외"
end type

type rb_3 from radiobutton within w_oecustsale_m
integer x = 3035
integer y = 196
integer width = 480
integer height = 64
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
string text = "(부)영업담당"
end type

event clicked;string ls_yyyymm, ls_close_yn, ls_userid, ls_gubun

ls_yyyymm = LeftA(trim(em_1.text),4)+ RightA(em_1.text,2)

if rb_1.checked then
	ls_close_yn = '%'
else
	ls_close_yn = '1'	
end if

 if GF_PERMISSION("거래처별수주관리조회풀권한", gs_userid) = "Y" then
	ls_userid = '%'	
else
	ls_userid = gs_userid
end if

if rb_4.checked then
	ls_gubun = '1'
else
	ls_gubun = '2'	
end if

dw_1.retrieve(ls_yyyymm, ls_close_yn, ls_userid, ls_gubun)
dw_3.retrieve(ls_yyyymm, ls_close_yn, ls_userid, ls_gubun)
end event

type rb_4 from radiobutton within w_oecustsale_m
integer x = 3035
integer y = 112
integer width = 384
integer height = 64
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
string text = "영업담당"
boolean checked = true
end type

event clicked;string ls_yyyymm, ls_close_yn, ls_userid, ls_gubun

ls_yyyymm = LeftA(trim(em_1.text),4)+ RightA(em_1.text,2)

if rb_1.checked then
	ls_close_yn = '%'
else
	ls_close_yn = '1'	
end if

 if GF_PERMISSION("거래처별수주관리조회풀권한", gs_userid) = "Y" then
	ls_userid = '%'	
else
	ls_userid = gs_userid
end if

if rb_4.checked then
	ls_gubun = '1'
else
	ls_gubun = '2'	
end if

dw_1.retrieve(ls_yyyymm, ls_close_yn, ls_userid, ls_gubun)
dw_3.retrieve(ls_yyyymm, ls_close_yn, ls_userid, ls_gubun)
end event

type em_2 from editmask within w_oecustsale_m
integer x = 2185
integer y = 144
integer width = 320
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type st_1 from statictext within w_oecustsale_m
integer x = 2103
integer y = 152
integer width = 87
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 81838264
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oecustsale_m
integer x = 3022
integer y = 60
integer width = 507
integer height = 220
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_oecustsale_m
integer x = 3022
integer y = 60
integer width = 480
integer height = 220
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_6 from groupbox within w_oecustsale_m
integer x = 2551
integer y = 60
integer width = 489
integer height = 220
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

