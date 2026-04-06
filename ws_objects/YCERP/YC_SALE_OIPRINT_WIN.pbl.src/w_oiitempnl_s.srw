$PBExportHeader$w_oiitempnl_s.srw
$PBExportComments$품목별 출고(손익)
forward 
global type w_oiitempnl_s from w_inheritance
end type
type gb_4 from groupbox within w_oiitempnl_s
end type
type sle_1 from singlelineedit within w_oiitempnl_s
end type
type st_1 from statictext within w_oiitempnl_s
end type
end forward

global type w_oiitempnl_s from w_inheritance
integer x = 5
integer y = 36
integer width = 4736
integer height = 2900
string title = "물품별 출고현황(손익)(w_oiitempnl_s)"
gb_4 gb_4
sle_1 sle_1
st_1 st_1
end type
global w_oiitempnl_s w_oiitempnl_s

type variables
date id_start, id_end
string is_ret, is_old_cust
st_print i_print
end variables

on w_oiitempnl_s.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.sle_1=create sle_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.st_1
end on

on w_oiitempnl_s.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.sle_1)
destroy(this.st_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_2.visible = false

dw_1.sharedata(dw_2)

end event

type pb_save from w_inheritance`pb_save within w_oiitempnl_s
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_oiitempnl_s
integer x = 32
integer width = 4631
integer height = 2480
integer taborder = 50
string dataobject = "d_oiitempnl_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_oiitempnl_s
integer x = 32
integer y = 40
integer width = 1627
string text = "물품별 출고현황(손익)"
end type

type st_tips from w_inheritance`st_tips within w_oiitempnl_s
end type

type pb_compute from w_inheritance`pb_compute within w_oiitempnl_s
boolean visible = false
integer x = 3008
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitempnl_s
integer x = 4261
string picturename = "CrossTab!"
end type

event pb_print_part::clicked;call super::clicked;if dw_2.rowcount() < 1 then return
if RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "CUST_NO", RegString!, is_old_cust) = 1 then
	RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "SDATE", RegString!, string(id_start, "yyyy-mm-dd"))
	RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "EDATE", RegString!, string(id_end, "yyyy-mm-dd"))
else
	messagebox('','엑셀파일 기초세팅 실패!~N~N관리자에게 문의 바랍니다.')
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

integer iret
OLEObject OleExcel

OleExcel = CREATE OLEObject 
iret = OleExcel.ConnectToNewObject("excel.application") 
if iret <> 0 then DESTROY OleExcel 

// Visible = True의 경우 엑셀 프로그램이 띄워지며 
// False인 경우 아이콘화된다. 
OleExcel.Application.Visible = true

// 엑셀을 로드한 후 Empty Sheet를 연다. 
OleExcel.WorkBooks.Open('\\192.168.1.6\pb80\EXCEL\물품별출고집계(손익).xls') 


end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"Excel 파일",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oiitempnl_s
integer x = 4453
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitempnl_s
integer x = 4069
integer taborder = 110
string picturename = "C:\bmp\PRINT.BMP"
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품별 출고현황(집계)을  출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=69'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitempnl_s
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_oiitempnl_s
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_oiitempnl_s
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitempnl_s
integer x = 3877
integer taborder = 140
end type

event pb_retrieve::clicked;gs_custdo_str lst_code
string ls_cust
date ld_start, ld_end
st_security lst_security

openwithparm(w_whcustdoname_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.okcancel = 'N' then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(lst_code.start_date)
ld_end = date(lst_code.end_date)
id_start = ld_start 
id_end = ld_end 

Choose Case gs_level
	Case 'A'
		is_ret = '%'
	Case 'B'			
		string sec_userid
		sec_userid = gs_userid
		lst_security.s_title = st_title.text
		lst_security.s_userid = gs_userid		
		openwithparm(w_security,lst_security)
		sec_userid = Message.StringParm
		if sec_userid <> 'Y' then
			is_ret = gs_userid
		Else
			is_ret = '%'
		end if
	Case 'C'
		is_ret = gs_userid
End Choose
/*
	<!-- 소스추가끝 -->
*/	


if lst_code.sel_flag = 'A' then
	ls_cust = '%'
//	dw_1.object.customer_cust_name.visible = false
else
	ls_cust = lst_code.start_no
//	dw_1.object.customer_cust_name.visible = true
end if
	// 1999.01.25
gb_2.text = "기간 : " + string(ld_start) + " 에서 " + string(ld_end)

dw_2.setredraw(false)
//dw_1.sharedata(dw_2)
if ls_cust = "%" then
	is_old_cust = ""
else
	is_old_cust = ls_cust
end if
dw_1.retrieve(ld_start, ld_end, ls_cust, is_ret)
//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_custname
	
		If ls_cust = '%' Then
			ls_cust = '전체'
		Else
			select cust_name into :ls_custname from customer where cust_no = :ls_cust;
		End If
			
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '출고기간:' + string(ld_start) + '-' + string(ld_end) + ' 판매거래처:' + ls_custname
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================
dw_2.sort()
dw_2.groupcalc()
dw_2.setredraw(true)
//if lst_code.sel_flag = 'A' then   
//	dw_1.Modify("customer_cust_name.name = 전  체 ")
//end if
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	return
end if


end event

type gb_3 from w_inheritance`gb_3 within w_oiitempnl_s
boolean visible = false
integer x = 37
integer y = 224
integer width = 3397
integer height = 176
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_oiitempnl_s
integer x = 18
integer y = 232
integer width = 4658
integer height = 2548
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_oiitempnl_s
integer x = 3840
integer width = 832
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_oiitempnl_s
integer x = 2999
integer y = 44
integer width = 178
integer height = 124
integer taborder = 60
string dataobject = "d_oiitempnl_p"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;datawindowchild ldwc_pur
string ls_pur
this.accepttext()
ls_pur = trim(this.object.pur_no[1])
dw_1.retrieve(ls_pur)
choose case dwo.name
	case 'pur_no'
        this.getchild('pur_no',ldwc_pur)
        this.object.sign_date[1] = ldwc_pur.getitemdatetime(ldwc_pur.getrow(),'sign_date')
end choose
end event

type gb_4 from groupbox within w_oiitempnl_s
boolean visible = false
integer x = 1851
integer y = 40
integer width = 133
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
end type

type sle_1 from singlelineedit within w_oiitempnl_s
integer x = 1929
integer y = 84
integer width = 923
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_str, ls_fil

ls_str = trim(this.text)
if ls_str = '' or isnull(ls_str) then
	ls_fil = ''
else
	ls_fil = "품명 like '" + ls_str + "%'"
end if
dw_1.setfilter(ls_fil)
dw_1.filter()
this.setfocus()
end event

type st_1 from statictext within w_oiitempnl_s
integer x = 1797
integer y = 80
integer width = 128
integer height = 124
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
string text = "품목검색"
alignment alignment = center!
boolean focusrectangle = false
end type

