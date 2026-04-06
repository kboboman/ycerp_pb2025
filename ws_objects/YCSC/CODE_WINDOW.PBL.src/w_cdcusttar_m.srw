$PBExportHeader$w_cdcusttar_m.srw
$PBExportComments$거래처별 매출.수금목표관리1999/03/05, 조현춘)
forward
global type w_cdcusttar_m from w_inheritance
end type
type em_1 from editmask within w_cdcusttar_m
end type
type st_7 from statictext within w_cdcusttar_m
end type
type dw_4 from datawindow within w_cdcusttar_m
end type
end forward

global type w_cdcusttar_m from w_inheritance
integer width = 3643
integer height = 1820
string title = "거래처별 목표관리(w_cdcusttar_m)"
em_1 em_1
st_7 st_7
dw_4 dw_4
end type
global w_cdcusttar_m w_cdcusttar_m

type variables
public string is_custno,is_custname
st_print i_print
datawindowchild idwc_cust
datawindowchild idwc_user
datawindowchild idwc_cust_name
string is_select, is_where, is_clause, is_select1, is_dwsql
string is_cust_no, is_dovcsql, is_teamsql, is_mansql, is_salesman

end variables

on w_cdcusttar_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_7=create st_7
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.dw_4
end on

on w_cdcusttar_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_7)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_select, ls_clause, ls_where

dw_4.settransobject(sqlca)
//ls_select = dw_4.Describe("DataWindow.Table.Select")
//ls_clause = " and datepart(year,cust_aim.tar_year) *= datepart(year,opeom.eom_year) "
//ls_where = "DataWindow.Table.Select='" + ls_select + ls_clause + "'"
//dw_4.modify(ls_where)
//dw_4.settransobject(sqlca)

dw_1.insertrow(0)

em_1.text = string(today(),'yyyy/mm/dd')
end event

type pb_save from w_inheritance`pb_save within w_cdcusttar_m
integer x = 3063
integer y = 48
end type

event pb_save::clicked;string ls_cust_no, ls_date
long ll_year

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

ls_cust_no = dw_1.object.cust_no[1]
dw_4.accepttext()

dw_4.object.cust_code[1] = ls_cust_no

ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))
ls_date = string(em_1.text) + '/01/01'
	
dw_4.object.cust_aim_tar_year[1] = datetime(date(ls_date))

if wf_update1(dw_4,'Y') = false then return

end event

type dw_1 from w_inheritance`dw_1 within w_cdcusttar_m
integer x = 32
integer y = 264
integer width = 2528
integer height = 92
integer taborder = 50
string dataobject = "d_custddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long ll_row
//string ls_custno
//
//ll_row = wf_rowfocuschange(dw_1,"N")
//if ll_row < 1 then
//	return
//end if
//dw_1.accepttext()
//dw_2.accepttext()
//ls_custno = this.object.cust_no[ll_row]
//if isnull(ls_custno) or ls_custno = "" then
//	dw_1.object.cust_no[ll_row] = is_custno
//	dw_1.object.cust_name[ll_row] = is_custname
//else
//	dw_2.retrieve(ls_custno)
//end if
end event

event dw_1::itemchanged;datawindowchild ldwc_cust
string ls_cust_no, ls_cust_name


dw_4.reset()
choose case dwo.name
	case 'cust_no'
		this.getchild("cust_no", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		ls_cust_name = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_name")
		this.object.cust_name[1] = ls_cust_name
	case 'cust_name'
		this.getchild("cust_name", ldwc_cust)
		ldwc_cust.settransobject(sqlca)
		
		ls_cust_no = ldwc_cust.getitemstring(ldwc_cust.getrow(), "cust_no")
		this.object.cust_no[1] = ls_cust_no
end choose

pb_retrieve.triggerevent(clicked!)

end event

type dw_2 from w_inheritance`dw_2 within w_cdcusttar_m
boolean visible = false
integer x = 219
integer y = 8
integer width = 2405
integer height = 2016
integer taborder = 100
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_cdcusttar_m
integer width = 1719
integer height = 136
string text = "거래처별 매출.수금 목표"
end type

type st_tips from w_inheritance`st_tips within w_cdcusttar_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcusttar_m
boolean visible = false
integer x = 2222
integer y = 48
integer taborder = 130
string disabledname = "c:\bmp\computr3.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdcusttar_m
boolean visible = false
integer x = 2030
integer y = 48
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdcusttar_m
integer x = 3255
integer y = 48
integer taborder = 190
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcusttar_m
integer x = 2871
integer y = 48
integer taborder = 200
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdcusttar_m
boolean visible = false
integer x = 2427
integer taborder = 210
end type

type pb_delete from w_inheritance`pb_delete within w_cdcusttar_m
boolean visible = false
integer x = 1947
integer y = 44
integer taborder = 220
end type

event pb_delete::clicked;call super::clicked;string ls_custno

if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.accepttext()
dw_2.accepttext()

ls_custno = dw_1.object.cust_no[dw_1.getrow()]
if ls_custno = dw_2.object.cust_no[dw_2.getrow()] then
	dw_2.deleterow(0)
	wf_update1(dw_2,"Y")
   dw_1.deleterow(dw_1.getrow())
else
	dw_2.deleterow(0)
	dw_2.retrieve(ls_custno)
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdcusttar_m
integer x = 2683
integer y = 48
integer taborder = 240
integer weight = 400
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;string ls_cust_no, ls_date
long   ll_year
long   ll_row

dw_1.accepttext()

ls_cust_no = dw_1.object.cust_no[1] 
if isnull(ls_cust_no) or ls_cust_no = '' then
	messagebox("확인","판매거래처를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if

if isnull(em_1.text) or em_1.text = '' then
	messagebox("확인","해당년도를 선택하세요!",information!)
	dw_1.setfocus()
	return
end if
ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))
ls_date = string(em_1.text) + '/01/01'
if dw_4.retrieve(ls_cust_no,ll_year) > 0 then return
	
dw_4.reset()
dw_4.insertrow(0)

ll_row = dw_4.rowcount()
 

dw_4.object.cust_code[1] = ls_cust_no

//dw_4.object.tar_year[1] = datetime(date(ls_date))


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcusttar_m
integer x = 2491
integer y = 48
integer taborder = 230
end type

event pb_retrieve::clicked;string ls_cust_no, ls_date
long   ll_year
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

ls_date = em_1.text
ll_year = long(LeftA(ls_date, 4))
dw_1.accepttext()
ls_cust_no = dw_1.object.cust_no[1]
dw_4.retrieve(ls_cust_no,ll_year)

end event

type gb_3 from w_inheritance`gb_3 within w_cdcusttar_m
boolean visible = false
integer x = 1010
integer y = 232
integer width = 2514
integer height = 1560
integer taborder = 110
end type

type gb_2 from w_inheritance`gb_2 within w_cdcusttar_m
integer x = 27
integer y = 224
integer width = 3323
integer height = 144
integer taborder = 120
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdcusttar_m
integer x = 2450
integer y = 16
integer width = 1024
integer height = 188
integer taborder = 40
end type

type em_1 from editmask within w_cdcusttar_m
integer x = 3058
integer y = 276
integer width = 261
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
boolean spin = true
string displaydata = " "
string minmax = "1990~~2100"
end type

event modified;dw_4.retrieve(dw_1.object.cust_no[1], integer(em_1.text))

end event

type st_7 from statictext within w_cdcusttar_m
integer x = 2729
integer y = 276
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
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_cdcusttar_m
integer x = 9
integer y = 404
integer width = 3589
integer height = 1308
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cust_aim"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

