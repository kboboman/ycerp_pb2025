$PBExportHeader$w_cdbsuppmaster_r.srw
$PBExportComments$조업자재거래처 master조회(1999/06/10,이인호)
forward
global type w_cdbsuppmaster_r from w_inheritance
end type
type em_1 from editmask within w_cdbsuppmaster_r
end type
type st_1 from statictext within w_cdbsuppmaster_r
end type
type dw_3 from datawindow within w_cdbsuppmaster_r
end type
type st_2 from statictext within w_cdbsuppmaster_r
end type
type dw_4 from datawindow within w_cdbsuppmaster_r
end type
end forward

global type w_cdbsuppmaster_r from w_inheritance
integer width = 3593
integer height = 1780
string title = "조업자재거래처조회(w_cdbsuppmaster_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
dw_4 dw_4
end type
global w_cdbsuppmaster_r w_cdbsuppmaster_r

type variables
int ii_year
string is_suppno
datawindowchild idwc_supp
end variables

on w_cdbsuppmaster_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.dw_4=create dw_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_4
end on

on w_cdbsuppmaster_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.dw_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_3.visible = false

dw_4.insertrow(0)
dw_4.getchild("supp_name", idwc_supp)
idwc_supp.settransobject(sqlca)
idwc_supp.retrieve()
em_1.text = string(today(),'yyyy')
ii_year = integer(em_1.text)
end event

type pb_save from w_inheritance`pb_save within w_cdbsuppmaster_r
boolean visible = false
integer x = 3154
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_cdbsuppmaster_r
integer x = 41
integer y = 408
integer width = 1733
integer height = 1236
string dataobject = "d_cdbsuppinvcoll_q1"
boolean hscrollbar = false
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdbsuppmaster_r
integer x = 1797
integer y = 408
integer width = 1733
integer height = 1236
integer taborder = 70
string dataobject = "d_cdbsuppinvcoll_q1"
boolean vscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cdbsuppmaster_r
integer x = 46
integer y = 36
integer width = 1733
integer height = 112
string text = "거래처 MASTER조회"
end type

type st_tips from w_inheritance`st_tips within w_cdbsuppmaster_r
end type

type pb_compute from w_inheritance`pb_compute within w_cdbsuppmaster_r
boolean visible = false
integer x = 2953
integer y = 56
integer width = 197
integer taborder = 110
string disabledname = "c:\bmp\computr3.bmp"
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"어음",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cdbsuppmaster_r
boolean visible = false
integer x = 2583
integer y = 68
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdbsuppmaster_r
integer x = 3305
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbsuppmaster_r
integer x = 3109
integer y = 48
integer taborder = 130
end type

event pb_print::clicked;long  ls_YesNo

ls_YesNo = messagebox("확인", "인쇄하시겠습니까", Exclamation!, OKCancel!, 2)

if ls_YesNo = 2 then
	return
end if
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================


dw_2.print()

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdbsuppmaster_r
boolean visible = false
integer x = 2427
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdbsuppmaster_r
boolean visible = false
integer x = 1947
integer y = 44
integer taborder = 150
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

type pb_insert from w_inheritance`pb_insert within w_cdbsuppmaster_r
boolean visible = false
integer x = 2386
integer y = 60
integer taborder = 170
integer weight = 400
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbsuppmaster_r
integer x = 2117
integer y = 212
integer taborder = 160
end type

event pb_retrieve::clicked;dw_1.reset()
dw_2.reset()
dw_1.retrieve(gs_area,is_suppno, ii_year - 1)
dw_2.retrieve(gs_area,is_suppno, ii_year)
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

end event

type gb_3 from w_inheritance`gb_3 within w_cdbsuppmaster_r
boolean visible = false
integer x = 1010
integer y = 232
integer width = 2514
integer height = 1560
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_cdbsuppmaster_r
integer x = 41
integer y = 168
integer width = 2290
integer height = 196
integer taborder = 90
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdbsuppmaster_r
integer x = 3072
integer width = 448
integer height = 192
end type

type em_1 from editmask within w_cdbsuppmaster_r
integer x = 1778
integer y = 224
integer width = 288
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
boolean spin = true
end type

event modified;
ii_year =integer(this.text)

end event

type st_1 from statictext within w_cdbsuppmaster_r
integer x = 1435
integer y = 232
integer width = 343
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "기준년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdbsuppmaster_r
integer x = 2331
integer y = 52
integer width = 133
integer height = 104
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_cdbsuppinvcollall_r"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_cdbsuppmaster_r
integer x = 96
integer y = 244
integer width = 325
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_cdbsuppmaster_r
integer x = 402
integer y = 224
integer width = 997
integer height = 100
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_cdbsupp_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;choose case dwo.name
	case 'supp_name'
		is_suppno = data
end choose
pb_retrieve.postevent(clicked!)
end event

