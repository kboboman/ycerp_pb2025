$PBExportHeader$w_saleitem_gigan.srw
forward
global type w_saleitem_gigan from window
end type
type cb_3 from commandbutton within w_saleitem_gigan
end type
type cb_2 from commandbutton within w_saleitem_gigan
end type
type em_2 from editmask within w_saleitem_gigan
end type
type em_1 from editmask within w_saleitem_gigan
end type
type dw_1 from datawindow within w_saleitem_gigan
end type
end forward

global type w_saleitem_gigan from window
integer width = 4686
integer height = 2860
boolean titlebar = true
string title = "w_saleitem_gigan"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
em_2 em_2
em_1 em_1
dw_1 dw_1
end type
global w_saleitem_gigan w_saleitem_gigan

type variables
date idt_date
end variables

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
em_1.text = '2007-05-01'
em_2.text = '2007-05-01'

end event

on w_saleitem_gigan.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.em_2,&
this.em_1,&
this.dw_1}
end on

on w_saleitem_gigan.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within w_saleitem_gigan
integer x = 567
integer y = 48
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "처리시작"
end type

event clicked;idt_date = date(em_1.text)
dw_1.reset()
sleep(0.5)
dw_1.retrieve(idt_date, string(idt_date, "yyyymmdd"))
end event

type cb_2 from commandbutton within w_saleitem_gigan
integer x = 78
integer y = 44
integer width = 457
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "종료"
end type

event clicked;close(parent)  
end event

type em_2 from editmask within w_saleitem_gigan
integer x = 3031
integer y = 64
integer width = 370
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

type em_1 from editmask within w_saleitem_gigan
integer x = 2629
integer y = 64
integer width = 370
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

type dw_1 from datawindow within w_saleitem_gigan
integer x = 37
integer y = 172
integer width = 4567
integer height = 2572
integer taborder = 10
string title = "none"
string dataobject = "d_saleitem"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;string ls_Docname
if dw_1.rowcount() > 0 then
	ls_DocName = "D:\최명수요청\80개항목 재고현황 " + string(idt_date, "yyyymmdd") + ".CSV"
	dw_1.SaveAs(ls_DocName, CSV!, TRUE)
	
	idt_date = RelativeDate(idt_date, 1)
	em_1.text = string(idt_date, "yyyy/mm/dd")
	if idt_date <=  date(em_2.text) then
		cb_3.triggerevent(clicked!)
	else 
		return
	end if
end if	

end event

