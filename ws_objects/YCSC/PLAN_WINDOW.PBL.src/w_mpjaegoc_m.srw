$PBExportHeader$w_mpjaegoc_m.srw
$PBExportComments$재고현황및 재고대체(1998/10/09,곽용덕)
forward
global type w_mpjaegoc_m from window
end type
type pb_1 from picturebutton within w_mpjaegoc_m
end type
type st_8 from statictext within w_mpjaegoc_m
end type
type st_qa from statictext within w_mpjaegoc_m
end type
type st_cust from statictext within w_mpjaegoc_m
end type
type st_5 from statictext within w_mpjaegoc_m
end type
type st_4 from statictext within w_mpjaegoc_m
end type
type st_seq from statictext within w_mpjaegoc_m
end type
type st_order from statictext within w_mpjaegoc_m
end type
type st_1 from statictext within w_mpjaegoc_m
end type
type cb_1 from commandbutton within w_mpjaegoc_m
end type
type dw_3 from datawindow within w_mpjaegoc_m
end type
type dw_2 from datawindow within w_mpjaegoc_m
end type
type dw_1 from datawindow within w_mpjaegoc_m
end type
type gb_3 from groupbox within w_mpjaegoc_m
end type
type gb_2 from groupbox within w_mpjaegoc_m
end type
type gb_1 from groupbox within w_mpjaegoc_m
end type
end forward

global type w_mpjaegoc_m from window
integer x = 73
integer y = 1128
integer width = 2702
integer height = 1404
boolean titlebar = true
string title = "재고현황및 재고대체(w_mpjaegoc_m)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
pb_1 pb_1
st_8 st_8
st_qa st_qa
st_cust st_cust
st_5 st_5
st_4 st_4
st_seq st_seq
st_order st_order
st_1 st_1
cb_1 cb_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_mpjaegoc_m w_mpjaegoc_m

type variables
gs_where istr_where
datawindowchild  idwc_item
end variables

on w_mpjaegoc_m.create
this.pb_1=create pb_1
this.st_8=create st_8
this.st_qa=create st_qa
this.st_cust=create st_cust
this.st_5=create st_5
this.st_4=create st_4
this.st_seq=create st_seq
this.st_order=create st_order
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.st_8,&
this.st_qa,&
this.st_cust,&
this.st_5,&
this.st_4,&
this.st_seq,&
this.st_order,&
this.st_1,&
this.cb_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_mpjaegoc_m.destroy
destroy(this.pb_1)
destroy(this.st_8)
destroy(this.st_qa)
destroy(this.st_cust)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_seq)
destroy(this.st_order)
destroy(this.st_1)
destroy(this.cb_1)
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

istr_where = Message.PowerObjectParm
long ll_foundrow

istr_where.chk = "N"
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_1.getchild("itme_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.insertrow(0)
st_order.text = istr_where.str1
st_seq.text = istr_where.str2

dw_1.object.item_no[1] = istr_where.str3
dw_1.object.item_name[1] = istr_where.str4

st_qa.text = istr_where.str5
st_cust.text = istr_where.name
dw_2.retrieve(istr_where.str3)

ll_foundrow = dw_2.Find( "qa = '" + trim(istr_where.str5) + "'",1, dw_2.RowCount())
if ll_foundrow = 0 then messagebox("확인", "해당규격을 찾을 수 없습니다.")
dw_2.scrolltorow(ll_foundrow)



end event

type pb_1 from picturebutton within w_mpjaegoc_m
integer x = 2418
integer y = 440
integer width = 247
integer height = 248
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고      대체"
vtextalign vtextalign = multiline!
end type

event clicked;dw_2.accepttext()
dw_3.accepttext()

if dw_2.rowcount() < 1 then return
if dw_3.rowcount() < 1 then return

//if dw_2.object.sol_qty[dw_2.getrow()] <= 0 then
//	messagebox("확인","가용재고가 없습니다.")
//	return
//end if
if dw_3.object.qoh[dw_3.getrow()] <= 0 then
	messagebox("확인","저장소의 현재고가 없습니다.")
	return
end if
	
istr_where.chk = "Y"
	
if istr_where.str3 <> dw_1.object.item_no[1] &
   or istr_where.str5 <> dw_2.object.qa[dw_2.getrow()] then
	if messagebox("확인","선택하신 물품또는 규격이 원본물품과 다름니다. ~r~n재고 대체를 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		return
	end if
	istr_where.chk = "Q"
//	istr_where.str1 = trim(this.object.sale_no[row])
//	istr_where.str2 = trim(string(this.object.seq_no[row],"###"))
	istr_where.str3 = trim(dw_1.object.item_no[1])
	istr_where.str4 = trim(dw_3.object.loc_no[dw_3.getrow()])
	istr_where.str5 = trim(dw_2.object.qa[dw_2.getrow()])
//	istr_where.name = trim(this.object.customer_cust_name[row])
elseif messagebox("확인","재고대체를 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
	return
end if
	
//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
CloseWithReturn(parent, istr_where)


end event

type st_8 from statictext within w_mpjaegoc_m
integer x = 1248
integer y = 16
integer width = 174
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "규격:"
boolean focusrectangle = false
end type

type st_qa from statictext within w_mpjaegoc_m
integer x = 1417
integer y = 16
integer width = 686
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cust from statictext within w_mpjaegoc_m
integer x = 343
integer y = 100
integer width = 1760
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_mpjaegoc_m
integer x = 64
integer y = 108
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "거래처:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_mpjaegoc_m
integer x = 896
integer y = 16
integer width = 183
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "순번:"
boolean focusrectangle = false
end type

type st_seq from statictext within w_mpjaegoc_m
integer x = 1079
integer y = 16
integer width = 142
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_order from statictext within w_mpjaegoc_m
integer x = 343
integer y = 16
integer width = 535
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_mpjaegoc_m
integer x = 41
integer y = 16
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "수주번호:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mpjaegoc_m
integer x = 2432
integer y = 20
integer width = 233
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"
CloseWithReturn(parent, istr_where)
end event

type dw_3 from datawindow within w_mpjaegoc_m
integer x = 1385
integer y = 448
integer width = 978
integer height = 824
integer taborder = 60
string dataobject = "d_mplocjaego_t"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_mpjaegoc_m
integer x = 55
integer y = 448
integer width = 1289
integer height = 824
integer taborder = 50
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

type dw_1 from datawindow within w_mpjaegoc_m
integer x = 55
integer y = 208
integer width = 2322
integer height = 172
integer taborder = 20
string dataobject = "d_mpitemjaego_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long ll_row
string ls_item, ls_name

this.accepttext()
dw_1.getchild("itme_no", idwc_item)
ls_item = this.object.item_no[1]
ls_name = idwc_item.getitemstring(idwc_item.getrow(),'item_name')
this.object.item_name[1] = ls_name
dw_2.setredraw(false)
dw_2.reset()
dw_2.retrieve(ls_item)
dw_2.setredraw(true)


end event

event rbuttondown;gs_where2 lst_whitemret

lst_whitemret.chk = "S" 
openwithparm(w_whitemselectmulti_w, lst_whitemret)
lst_whitemret =  message.powerobjectparm

if lst_whitemret.chk = 'Y' then
	this.object.item_no[1] = lst_whitemret.str1[1]
	this.object.item_name[1] = lst_whitemret.name[1]
	dw_2.retrieve(lst_whitemret.str1[1])
end if

end event

type gb_3 from groupbox within w_mpjaegoc_m
integer x = 1371
integer y = 396
integer width = 1015
integer height = 900
integer taborder = 40
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

type gb_2 from groupbox within w_mpjaegoc_m
integer x = 32
integer y = 396
integer width = 1330
integer height = 900
integer taborder = 70
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

type gb_1 from groupbox within w_mpjaegoc_m
integer x = 32
integer y = 168
integer width = 2354
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

