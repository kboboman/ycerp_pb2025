$PBExportHeader$w_cdsuppmaster_r.srw
$PBExportComments$자재거래처 master조회(1999/06/10,이인호)
forward 
global type w_cdsuppmaster_r from w_inheritance
end type
type dw_4 from datawindow within w_cdsuppmaster_r
end type
type em_1 from editmask within w_cdsuppmaster_r
end type
type st_1 from statictext within w_cdsuppmaster_r
end type
type dw_5 from datawindow within w_cdsuppmaster_r
end type
type st_2 from statictext within w_cdsuppmaster_r
end type
end forward

global type w_cdsuppmaster_r from w_inheritance
integer width = 3593
integer height = 1852
string title = "거래처관리(w_cdsuppmaster_r)"
dw_4 dw_4
em_1 em_1
st_1 st_1
dw_5 dw_5
st_2 st_2
end type
global w_cdsuppmaster_r w_cdsuppmaster_r

type variables
st_print i_print
datawindowchild idwc_supp
datawindowchild idwc_supp_name

end variables

on w_cdsuppmaster_r.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.em_1=create em_1
this.st_1=create st_1
this.dw_5=create dw_5
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.st_2
end on

on w_cdsuppmaster_r.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

dw_2.visible = false
dw_1.insertrow(0)
dw_1.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(sqlca)
dw_1.getchild("supp_name", idwc_supp_name)
idwc_supp_name.settransobject(sqlca)

em_1.text = string(today(),'yyyy')
end event

event resize;call super::resize;//
gb_3.width  = newwidth - (gb_3.x * 2)


end event

type pb_save from w_inheritance`pb_save within w_cdsuppmaster_r
boolean visible = false
integer x = 3154
integer y = 60
end type

type dw_1 from w_inheritance`dw_1 within w_cdsuppmaster_r
string tag = "d_suppddw_c"
integer x = 1755
integer y = 56
integer width = 965
integer height = 84
string dataobject = "d_suppddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;datawindowchild ldwc_supp
string ls_supp_no, ls_supp_name

dw_4.reset()
dw_5.reset()

choose case dwo.name
	case 'supp_no'
		this.getchild("supp_no", ldwc_supp)
		ldwc_supp.settransobject(sqlca)
		
		ls_supp_no = ldwc_supp.getitemstring(ldwc_supp.getrow(), "supp_no")
		ls_supp_name = ldwc_supp.getitemstring(ldwc_supp.getrow(), "supp_name")
		this.object.supp_name[1] = ls_supp_name
	case 'supp_name'
		this.getchild("supp_name", ldwc_supp)
		ldwc_supp.settransobject(sqlca)
		
		ls_supp_no = ldwc_supp.getitemstring(ldwc_supp.getrow(), "supp_no")
		this.object.supp_no[1] = ls_supp_no
end choose

end event

type st_title from w_inheritance`st_title within w_cdsuppmaster_r
integer x = 32
integer y = 20
integer width = 1298
integer height = 140
string text = "거래처 MASTER조회"
end type

type st_tips from w_inheritance`st_tips within w_cdsuppmaster_r
end type

type pb_compute from w_inheritance`pb_compute within w_cdsuppmaster_r
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

type pb_print_part from w_inheritance`pb_print_part within w_cdsuppmaster_r
boolean visible = false
integer x = 2583
integer y = 68
end type

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"여신현황",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdsuppmaster_r
integer x = 3191
integer y = 64
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsuppmaster_r
integer x = 2999
integer y = 64
integer taborder = 130
end type

event pb_print::clicked;long  ls_YesNo
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

ls_YesNo = messagebox("확인", "인쇄하시겠습니까", Exclamation!, OKCancel!, 2)

if ls_YesNo = 2 then
	return
end if


dw_2.print()

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsuppmaster_r
boolean visible = false
integer x = 2427
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdsuppmaster_r
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

type pb_insert from w_inheritance`pb_insert within w_cdsuppmaster_r
boolean visible = false
integer x = 2386
integer y = 60
integer taborder = 170
integer weight = 400
string disabledname = "c:\bmp\pencil.bmp"
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsuppmaster_r
integer x = 2807
integer y = 64
integer taborder = 160
end type

event pb_retrieve::clicked;//
string ls_supp
long   ll_year

dw_1.accepttext()
ls_supp = dw_1.object.supp_no[1]

ll_year = long(em_1.text)

//
dw_2.retrieve( ls_supp, ll_year )

dw_4.retrieve( ls_supp, ll_year - 1 )
if dw_4.rowcount() < 1 then dw_4.insertrow( 0 )

dw_5.retrieve( ls_supp, ll_year )
if dw_5.rowcount() < 1 then dw_5.insertrow( 0 )

end event

type gb_3 from w_inheritance`gb_3 within w_cdsuppmaster_r
integer x = 32
integer y = 244
integer width = 3497
integer height = 168
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdsuppmaster_r
integer x = 1385
integer y = 16
integer width = 1362
integer height = 216
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdsuppmaster_r
integer x = 2779
integer y = 16
integer width = 626
integer height = 216
end type

type dw_2 from w_inheritance`dw_2 within w_cdsuppmaster_r
integer x = 41
integer y = 116
integer width = 137
integer height = 88
integer taborder = 80
string dataobject = "d_cdsuppinvcollall_r"
boolean vscrollbar = false
boolean border = false
end type

type dw_4 from datawindow within w_cdsuppmaster_r
integer x = 32
integer y = 424
integer width = 1733
integer height = 1236
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_cdsuppinvcoll_q1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_cdsuppmaster_r
integer x = 1760
integer y = 136
integer width = 288
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 400
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

type st_1 from statictext within w_cdsuppmaster_r
integer x = 1413
integer y = 140
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -10
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
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_cdsuppmaster_r
integer x = 1797
integer y = 424
integer width = 1733
integer height = 1236
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cdsuppinvcoll_q1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_cdsuppmaster_r
integer x = 1413
integer y = 60
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

