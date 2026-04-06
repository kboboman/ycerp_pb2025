$PBExportHeader$w_cdzipcode_s.srw
$PBExportComments$우편번호 검색(2008/02/27, 정갑용)
forward
global type w_cdzipcode_s from window
end type
type cb_3 from commandbutton within w_cdzipcode_s
end type
type st_3 from statictext within w_cdzipcode_s
end type
type st_2 from statictext within w_cdzipcode_s
end type
type cbx_1 from checkbox within w_cdzipcode_s
end type
type sle_zip from singlelineedit within w_cdzipcode_s
end type
type sle_addr from singlelineedit within w_cdzipcode_s
end type
type shl_1 from statichyperlink within w_cdzipcode_s
end type
type st_1 from statictext within w_cdzipcode_s
end type
type sle_1 from singlelineedit within w_cdzipcode_s
end type
type dw_2 from datawindow within w_cdzipcode_s
end type
type cb_2 from commandbutton within w_cdzipcode_s
end type
type cb_1 from commandbutton within w_cdzipcode_s
end type
type gb_1 from groupbox within w_cdzipcode_s
end type
type ln_1 from line within w_cdzipcode_s
end type
end forward

global type w_cdzipcode_s from window
integer width = 2153
integer height = 1480
boolean titlebar = true
string title = "우편번호 검색(w_cdzipcode_s)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
st_3 st_3
st_2 st_2
cbx_1 cbx_1
sle_zip sle_zip
sle_addr sle_addr
shl_1 shl_1
st_1 st_1
sle_1 sle_1
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
ln_1 ln_1
end type
global w_cdzipcode_s w_cdzipcode_s

type variables
gs_where ist_where
end variables

on w_cdzipcode_s.create
this.cb_3=create cb_3
this.st_3=create st_3
this.st_2=create st_2
this.cbx_1=create cbx_1
this.sle_zip=create sle_zip
this.sle_addr=create sle_addr
this.shl_1=create shl_1
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.ln_1=create ln_1
this.Control[]={this.cb_3,&
this.st_3,&
this.st_2,&
this.cbx_1,&
this.sle_zip,&
this.sle_addr,&
this.shl_1,&
this.st_1,&
this.sle_1,&
this.dw_2,&
this.cb_2,&
this.cb_1,&
this.gb_1,&
this.ln_1}
end on

on w_cdzipcode_s.destroy
destroy(this.cb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.sle_zip)
destroy(this.sle_addr)
destroy(this.shl_1)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.ln_1)
end on

event open;dw_2.settransobject(sqlca)

shl_1.text = "국가~n주소"
cbx_1.checked = true
cbx_1.triggerevent( Clicked! )
end event

type cb_3 from commandbutton within w_cdzipcode_s
integer x = 1847
integer y = 248
integer width = 251
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;//
String ls_zipcode, ls_address

ls_zipcode = trim(sle_zip.text)
ls_address = trim(sle_addr.text)
if LenA(ls_zipcode) < 5 then 
	MessageBox("확인", "국가정보 시스템에서 복사한 후 확인 버튼을 클릭하시기 바랍니다.")
	return
else
	choose case LenA(ls_zipcode)
		case 6, 7
			ls_zipcode = LeftA(ls_zipcode, 3) + RightA(ls_zipcode, 3)
	end choose
end if

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr1[1] = ls_zipcode
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2[1] = ls_address
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr3[1] = "*"
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2, ls_address ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2, ls_address )
	end if
end if

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'bus_addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr1[1] = ls_zipcode
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr2[1] = ls_address
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr3[1] = ls_address
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr1, ls_address ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr2, ls_address )
	end if
end if

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'shipto_addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr1[1] = ls_zipcode
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr2[1] = ls_address
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr3[1] = "*"
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr1, ls_address ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr2, ls_address )
	end if
end if

close (parent)
end event

type st_3 from statictext within w_cdzipcode_s
integer x = 27
integer y = 432
integer width = 2075
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "우편번호와 주소를 복사한 후 확인 버튼을 클릭 하시기 바랍니다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdzipcode_s
integer x = 27
integer y = 260
integer width = 421
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "우편번호"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cdzipcode_s
integer x = 82
integer y = 36
integer width = 448
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "읍면동 검색"
boolean checked = true
end type

event clicked;
if this.checked = true then
	sle_1.enabled = true
	cb_1.enabled  = true
	dw_2.enabled  = true
//	Parent.height = 1480
	
	sle_zip.enabled  = false
	sle_addr.enabled = false
	shl_1.enabled    = false
	cb_3.enabled     = false
else
	sle_1.enabled = false
	cb_1.enabled  = false
	dw_2.enabled  = false
//	Parent.height = 600

	sle_zip.enabled  = true
	sle_addr.enabled = true
	shl_1.enabled    = true
	cb_3.enabled     = true
	
	shl_1.triggerevent( clicked! )
end if

end event

type sle_zip from singlelineedit within w_cdzipcode_s
integer x = 27
integer y = 320
integer width = 421
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_addr from singlelineedit within w_cdzipcode_s
integer x = 485
integer y = 252
integer width = 1056
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type shl_1 from statichyperlink within w_cdzipcode_s
integer x = 1586
integer y = 248
integer width = 251
integer height = 152
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "국가주소"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
string url = "http://www.juso.go.kr/openIndexPage.do"
end type

type st_1 from statictext within w_cdzipcode_s
integer x = 169
integer y = 104
integer width = 443
integer height = 68
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "읍면동 검색:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cdzipcode_s
integer x = 635
integer y = 92
integer width = 800
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_cdzipcode_s
integer x = 23
integer y = 528
integer width = 2085
integer height = 832
integer taborder = 20
string dataobject = "d_cdzipcode_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
if row < 1 then return

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr1[1] = dw_2.object.우편번호[row]
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2[1] = dw_2.object.검색주소[row]
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2, dw_2.object.검색주소[row] ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.addr2, dw_2.object.검색주소[row] )
	end if
end if

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'bus_addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr1[1] = dw_2.object.우편번호[row]
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr2[1] = dw_2.object.검색주소[row]
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr1, dw_2.object.검색주소[row] ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.bus_addr2, dw_2.object.검색주소[row] )
	end if
end if

if gs_zipcodes1 = 'w_cdcustomer_m' and gs_zipcodes2 = 'shipto_addr1' then
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr1[1] = dw_2.object.우편번호[row]
	w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr2[1] = dw_2.object.검색주소[row]
	
	if	w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemchanged( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr1, dw_2.object.검색주소[row] ) = 1 then
		w_cdcustomer_m.tab_1.tabpage_1.dw_5.event itemerror( w_cdcustomer_m.tab_1.tabpage_1.dw_5.getrow(), w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.shipto_addr2, dw_2.object.검색주소[row] )
	end if
end if

close (parent)
end event

type cb_2 from commandbutton within w_cdzipcode_s
integer x = 1847
integer y = 52
integer width = 251
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;close (parent)
end event

type cb_1 from commandbutton within w_cdzipcode_s
integer x = 1577
integer y = 52
integer width = 251
integer height = 152
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
boolean default = true
end type

event clicked;long   ll_cnt
string ls_name

ls_name = trim(sle_1.text)
if LenA(ls_name) < 1 then return

ls_name = ls_name + '%'
ll_cnt  = dw_2.retrieve(ls_name)
if ll_cnt < 1 then sle_1.setfocus()




end event

type gb_1 from groupbox within w_cdzipcode_s
integer x = 46
integer y = 20
integer width = 1495
integer height = 188
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

type ln_1 from line within w_cdzipcode_s
long linecolor = 255
integer linethickness = 8
integer beginx = 32
integer beginy = 232
integer endx = 2085
integer endy = 232
end type

