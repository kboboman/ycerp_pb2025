$PBExportHeader$w_mpjaegoc_r.srw
$PBExportComments$재고현황(1998/10/09,곽용덕)
forward 
global type w_mpjaegoc_r from window
end type
type dw_3 from datawindow within w_mpjaegoc_r
end type
type dw_2 from datawindow within w_mpjaegoc_r
end type
type dw_1 from datawindow within w_mpjaegoc_r
end type
type gb_3 from groupbox within w_mpjaegoc_r
end type
type gb_2 from groupbox within w_mpjaegoc_r
end type
type gb_1 from groupbox within w_mpjaegoc_r
end type
end forward

global type w_mpjaegoc_r from window
integer x = 73
integer y = 1128
integer width = 2414
integer height = 1008
boolean titlebar = true
string title = "저장소별 재고(w_mpjaegoc_r)"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 79741120
boolean center = true
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_mpjaegoc_r w_mpjaegoc_r

on w_mpjaegoc_r.create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.dw_2,&
this.dw_1,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_mpjaegoc_r.destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_1.insertrow(0)

end event

type dw_3 from datawindow within w_mpjaegoc_r
integer x = 1367
integer y = 296
integer width = 987
integer height = 584
integer taborder = 50
string dataobject = "d_mplocjaego_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_mpjaegoc_r
integer x = 32
integer y = 296
integer width = 1280
integer height = 584
integer taborder = 40
string dataobject = "d_mpqajaego_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_row
string ls_item,ls_qa

dw_1.accepttext()
dw_2.accepttext()
ll_row = dw_2.getrow()
if ll_row < 1 then return
ls_item = trim(dw_1.object.item_no[1])
ls_qa   = trim(dw_2.object.qa[ll_row])
dw_3.retrieve(ls_item,ls_qa)


end event

type dw_1 from datawindow within w_mpjaegoc_r
integer x = 37
integer y = 52
integer width = 2322
integer height = 168
integer taborder = 20
string dataobject = "d_mpitemjaego_s"
boolean border = false
boolean livescroll = true
end type

type gb_3 from groupbox within w_mpjaegoc_r
integer x = 1339
integer y = 244
integer width = 1038
integer height = 656
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "저장소별재고"
end type

type gb_2 from groupbox within w_mpjaegoc_r
integer x = 18
integer y = 244
integer width = 1312
integer height = 656
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "규격별재고"
end type

type gb_1 from groupbox within w_mpjaegoc_r
integer x = 18
integer y = 12
integer width = 2359
integer height = 216
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

