$PBExportHeader$w_cdcalc_m.srw
$PBExportComments$생산계산식관리(98/03/07,이인호)
forward
global type w_cdcalc_m from w_inheritance
end type
type sle_1 from singlelineedit within w_cdcalc_m
end type
type cbx_1 from checkbox within w_cdcalc_m
end type
type cbx_2 from checkbox within w_cdcalc_m
end type
type cbx_3 from checkbox within w_cdcalc_m
end type
type cbx_4 from checkbox within w_cdcalc_m
end type
type st_2 from statictext within w_cdcalc_m
end type
type st_3 from statictext within w_cdcalc_m
end type
type st_4 from statictext within w_cdcalc_m
end type
type st_6 from statictext within w_cdcalc_m
end type
type sle_2 from singlelineedit within w_cdcalc_m
end type
type st_7 from statictext within w_cdcalc_m
end type
type st_8 from statictext within w_cdcalc_m
end type
type sle_3 from singlelineedit within w_cdcalc_m
end type
type st_9 from statictext within w_cdcalc_m
end type
type st_11 from statictext within w_cdcalc_m
end type
type sle_4 from singlelineedit within w_cdcalc_m
end type
type cbx_5 from checkbox within w_cdcalc_m
end type
type cbx_6 from checkbox within w_cdcalc_m
end type
type em_1 from editmask within w_cdcalc_m
end type
type st_1 from statictext within w_cdcalc_m
end type
type st_5 from statictext within w_cdcalc_m
end type
type st_10 from statictext within w_cdcalc_m
end type
type ddlb_1 from dropdownlistbox within w_cdcalc_m
end type
end forward

global type w_cdcalc_m from w_inheritance
integer x = 370
integer y = 436
integer width = 2930
integer height = 2224
string title = "계산식 관리(w_cdcalc_m)"
boolean resizable = false
sle_1 sle_1
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
st_2 st_2
st_3 st_3
st_4 st_4
st_6 st_6
sle_2 sle_2
st_7 st_7
st_8 st_8
sle_3 sle_3
st_9 st_9
st_11 st_11
sle_4 sle_4
cbx_5 cbx_5
cbx_6 cbx_6
em_1 em_1
st_1 st_1
st_5 st_5
st_10 st_10
ddlb_1 ddlb_1
end type
global w_cdcalc_m w_cdcalc_m

type variables
st_print i_print

end variables

forward prototypes
public subroutine wf_recalc (long arg_row)
public subroutine wf_calc ()
public subroutine wf_calc2 ()
end prototypes

public subroutine wf_recalc (long arg_row);//(폭 + 10m) X 높이 / 1,000,000 * 갯수
//폭 X 높이 / 1,000,000 * 갯수
//(((폭 X 높이) + 10) * 길이) / 1,000,000 * 갯수
//갯수 * 0.3
//폭, 폭추가mm, 높이 , 높이추가mm, 폭*높이추가길이, 백만, 갯수, 총추가
// cbx_1 : 두꼐
// cbx_2 : 폭
// sle_1 : 폭 추가mm
// cbx_3 : 높이
// sle_2 : 높이 추가mm
// sle_3 : 폭높이 추가mm
// cbx_4 : 길이
// sle_4 : 길이나누기
// cbx_5 : / 1,000,000
//  두께 X ((( 폭 + 10 ) X (높이 + 10) + 10 ) X 길이 ) / 1,000,000 / 2
cbx_6.checked = false
em_1.text = '0.00'
cbx_1.checked = false
cbx_2.checked = false
sle_1.text = '0'
ddlb_1.text = ''
cbx_3.checked = false
sle_2.text = '0'
sle_3.text = '0'
sle_4.text = '0'
cbx_4.checked = false
cbx_5.checked = false
if dw_1.object.cnt[arg_row] = 'Y' then
	cbx_6.checked = true
	em_1.text = string(dw_1.object.cnt_mul[arg_row])
else
	if dw_1.object.thin[arg_row] = 'Y' then
		cbx_1.checked = true
	else
		cbx_1.checked = false
	end if
	if dw_1.object.wid[arg_row] = 'Y' then
		cbx_2.checked = true
	else
		cbx_2.checked = false
	end if
	sle_1.text = string(dw_1.object.wid_add[arg_row])
// 갑용추가
	if dw_1.object.mul[arg_row] = 'X' then
		ddlb_1.text = 'X'
	else
		ddlb_1.text = '+'
	end if
////
	if dw_1.object.high[arg_row] = 'Y' then
		cbx_3.checked = true
	else
		cbx_3.checked = false
	end if
	sle_2.text = string(dw_1.object.high_add[arg_row])
	sle_3.text = string(dw_1.object.wid_high_add[arg_row])
	if dw_1.object.len[arg_row] = 'Y' then
		cbx_4.checked = true
	else
		cbx_4.checked = false
	end if
	if dw_1.object.div10[arg_row] = 'Y' then
		cbx_5.checked = true
	else
		cbx_5.checked = false
	end if
	sle_4.text = string(dw_1.object.all_div[arg_row])
end if
//st_1.text = dw_1.object.total_text[arg_row]

// cbx_1 : 두꼐
// cbx_2 : 폭
// sle_1 : 폭 추가mm
// cbx_3 : 높이
// sle_2 : 높이 추가mm
// sle_3 : 폭높이 추가mm
// cbx_4 : 길이
// sle_4 : 길이나누기
// cbx_5 : / 1,000,000


return

end subroutine

public subroutine wf_calc ();//(폭 + 10m) X 높이 / 1,000,000 * 갯수
//폭 X 높이 / 1,000,000 * 갯수
//(((폭 X 높이) + 10) * 길이) / 1,000,000 * 갯수
//갯수 * 0.3
//폭, 폭추가mm, 높이 , 높이추가mm, 폭*높이추가길이, 백만, 갯수, 총추가
// cbx_1 : 두꼐
// cbx_2 : 폭
// sle_1 : 폭 추가mm
// cbx_3 : 높이
// sle_2 : 높이 추가mm
// sle_3 : 폭높이 추가mm
// cbx_4 : 길이
// sle_4 : 길이나누기
// cbx_5 : / 1,000,000
//  두께 X ((( 폭 + 10 ) X (높이 + 10) + 10 ) X 길이 ) / 1,000,000 / 2

string ls_thin, ls_wid, ls_high,  ls_1, ls_2, ls_len, ls_thadd, ls_10, ls_div
string ls_first, ls_x1, ls_x2, ls_x3, ls_mul
long   ll_row

ll_row = dw_1.getrow()

if ll_row < 1 then return

cbx_6.checked = false
em_1.text = '0.00'
ls_first  = 'N'
// cbx_1 : 두께
if cbx_1.checked then
	ls_first = 'Y'
	ls_thin  = '두께' 
end if

// cbx_2 : 폭
// sle_1 : 폭 추가mm
if trim(sle_1.text) = '' then sle_1.text = '0'
if trim(sle_2.text) = '' then sle_2.text = '0'
if trim(sle_3.text) = '' then sle_3.text = '0'
if trim(sle_4.text) = '' then sle_4.text = '0'
if cbx_2.checked then 
	if ls_first = 'Y' then ls_x1 = ' X '
	
	ls_first = 'Y'
	if sle_1.text <> '0' then
		ls_wid = "(폭 + " + trim(sle_1.text) + ")"
	else
		ls_wid = '폭'
	end if
end if

// 갑용수정
// ddlb_1 : ( x , + )
ls_mul = ''
if ls_first = 'Y' then
	if ddlb_1.text = 'X' then
		ls_mul = " X "
	else
		ls_mul = " + "
	end if
end if
///

// cbx_3 : 높이
if cbx_3.checked then 
// 갑용수정
//	if ls_first  = 'Y' then ls_x2  = ' X '
	if ls_first <> 'Y' then ls_mul = ''
///
	ls_first = 'Y'
	if sle_2.text <> '0' then
		ls_high = "(높이 + " + trim(sle_2.text) + ")"
	else
		ls_high = '높이'
	end if
end if
// sle_2 : 높이 추가mm

if not cbx_2.checked and not cbx_3.checked then 
	sle_3.text = '0'
end if

// sle_3 : 폭높이 추가mm
if sle_3.text <> '0' then
	ls_2 = "("
	ls_thadd = " + " + trim(sle_3.text) + ")"; ls_first = 'Y'
end if
// cbx_4 : 길이
if cbx_4.checked then
	if ls_first = 'Y' then ls_x3 = ' X '
	ls_1 = "("
	ls_len = "길이) "
end if
// cbx_5 : 1,000,000
if cbx_5.checked then
	ls_10 = "/ 1,000,000"
end if
// sle_4 : 길이나누기
if sle_4.text <> '0' then
	ls_div = "/ " + trim(sle_4.text)
end if
////////////////
if cbx_1.checked = true then
	dw_1.object.thin[ll_row] = 'Y'
else
	dw_1.object.thin[ll_row] = 'N'
end if
if cbx_2.checked = true then
	dw_1.object.wid[ll_row] = 'Y'
else
	dw_1.object.wid[ll_row] = 'N'
end if
dw_1.object.wid_add[ll_row] = integer(sle_1.text)
if cbx_3.checked = true then
	dw_1.object.high[ll_row] = 'Y'
else
	dw_1.object.high[ll_row] = 'N'
end if
// 갑용추가
if ddlb_1.text = 'X' then
	dw_1.object.mul[ll_row] = 'X'
else
	dw_1.object.mul[ll_row] = '+'
end if
///
dw_1.object.high_add[ll_row] = integer(sle_2.text)
dw_1.object.wid_high_add[ll_row] = integer(sle_3.text)
if cbx_4.checked = true then
	dw_1.object.len[ll_row] = 'Y'
else
	dw_1.object.len[ll_row] = 'N'
end if
if cbx_5.checked = true then
	dw_1.object.div10[ll_row] = 'Y'
else
	dw_1.object.div10[ll_row] = 'N'
end if
dw_1.object.all_div[ll_row] = integer(sle_4.text)
//dw_1.object.total_text[ll_row] = st_1.text
//  두께 X ((( 폭 + 10 ) X (높이 + 10) + 10 ) X 길이 ) / 1,000,000 / 2
//dw_1.object.total_text[ll_row] = ls_thin + ls_x1 + ls_1 + ls_2 + ls_wid + ls_x2 + ls_high + ls_thadd + ls_x3 &
//				+ ls_len + ls_10 + ls_div
dw_1.object.total_text[ll_row] = ls_thin + ls_x1 + ls_1 + ls_2 + ls_wid + ls_mul + ls_high + ls_thadd + ls_x3 &
				                   + ls_len  + ls_10 + ls_div

return

end subroutine

public subroutine wf_calc2 ();long ll_row

ll_row = dw_1.getrow()

if ll_row < 1 then return

cbx_1.checked = false
cbx_2.checked = false
sle_1.text    = '0'

cbx_3.checked = false
sle_2.text    = '0'
sle_3.text    = '0'
sle_4.text    = '0'
cbx_4.checked = false
cbx_5.checked = false

////////////////
cbx_6.checked = true
dw_1.object.cnt[ll_row] = 'Y'
dw_1.object.cnt_mul[ll_row] = dec(em_1.text)

////dw_1.object.total_text[ll_row] = st_1.text
////  두께 X ((( 폭 + 10 ) X (높이 + 10) + 10 ) X 길이 ) / 1,000,000 / 2
dw_1.object.total_text[ll_row] = '갯수 X ' + em_1.text

return

end subroutine

on w_cdcalc_m.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_6=create st_6
this.sle_2=create sle_2
this.st_7=create st_7
this.st_8=create st_8
this.sle_3=create sle_3
this.st_9=create st_9
this.st_11=create st_11
this.sle_4=create sle_4
this.cbx_5=create cbx_5
this.cbx_6=create cbx_6
this.em_1=create em_1
this.st_1=create st_1
this.st_5=create st_5
this.st_10=create st_10
this.ddlb_1=create ddlb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.cbx_3
this.Control[iCurrent+5]=this.cbx_4
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.sle_2
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.sle_3
this.Control[iCurrent+14]=this.st_9
this.Control[iCurrent+15]=this.st_11
this.Control[iCurrent+16]=this.sle_4
this.Control[iCurrent+17]=this.cbx_5
this.Control[iCurrent+18]=this.cbx_6
this.Control[iCurrent+19]=this.em_1
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.st_5
this.Control[iCurrent+22]=this.st_10
this.Control[iCurrent+23]=this.ddlb_1
end on

on w_cdcalc_m.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_6)
destroy(this.sle_2)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.sle_3)
destroy(this.st_9)
destroy(this.st_11)
destroy(this.sle_4)
destroy(this.cbx_5)
destroy(this.cbx_6)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_10)
destroy(this.ddlb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

event resize;call super::resize;//
//gb_2.width  = this.width  - 77
gb_2.height = this.height - 656

//dw_1.width  = this.width  - 128
dw_1.height = this.height - 736

end event

type pb_save from w_inheritance`pb_save within w_cdcalc_m
integer x = 2482
integer y = 80
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

wf_update1(dw_1, 'Y')

end event

type dw_1 from w_inheritance`dw_1 within w_cdcalc_m
integer x = 59
integer y = 576
integer width = 2802
integer height = 1488
string dataobject = "d_cdcalc_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return
this.scrolltorow(ll_row)

wf_recalc(ll_row)

end event

type dw_2 from w_inheritance`dw_2 within w_cdcalc_m
boolean visible = false
integer x = 1056
integer y = 52
integer width = 87
integer height = 112
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_cdcalc_m
integer x = 69
integer width = 1403
string text = "계산식 관리(YSP)"
end type

type st_tips from w_inheritance`st_tips within w_cdcalc_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdcalc_m
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcalc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdcalc_m
integer x = 2674
integer y = 80
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcalc_m
boolean visible = false
integer x = 2025
integer y = 64
integer taborder = 140
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdcalc_m
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_cdcalc_m
integer x = 2290
integer y = 80
integer taborder = 160
end type

event pb_delete::clicked;

int li_seq, li_cnt
long ll_row 

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return	

li_seq = dw_1.object.calcd_seq[ll_row]

select count(*) into :li_cnt from itemcalc
 where calc_cd = :li_seq;
 
if li_cnt > 0 then
	MessageBox("확인","이미 사용중인 코드입니다 삭제하실수 없습니다.")
	return
end if	
if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	
dw_1.deleterow(ll_row)
if wf_update1(dw_1,"Y") = true then
	dw_1.retrieve()
end if


end event

type pb_insert from w_inheritance`pb_insert within w_cdcalc_m
integer x = 2098
integer y = 80
integer taborder = 180
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::clicked;long ll_row

pb_retrieve.triggerevent(clicked!)

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.object.calcd_seq[ll_row] = ll_row

// cbx_1 : 두꼐
// cbx_2 : 폭
// sle_1 : 폭 추가mm
// cbx_3 : 높이
// sle_2 : 높이 추가mm
// sle_3 : 폭높이 추가mm
// cbx_4 : 길이
// sle_4 : 길이나누기
// cbx_5 : / 1,000,000

//  SELECT itemcalcd.calcd_seq      
//       , itemcalcd.thin           
//       , itemcalcd.wid            
//       , itemcalcd.wid_add        
//       , itemcalcd.mul            
//       , itemcalcd.high           
//       , itemcalcd.high_add       
//       , itemcalcd.wid_high_add   
//       , itemcalcd.len            
//       , itemcalcd.div10          
//       , itemcalcd.all_div        
//       , itemcalcd.cnt            
//       , itemcalcd.cnt_mul        
//       , itemcalcd.total_text     
//    FROM itemcalcd                
//
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcalc_m
integer x = 1906
integer y = 80
integer taborder = 170
end type

event pb_retrieve::clicked;dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdcalc_m
integer x = 37
integer y = 256
integer width = 2853
integer height = 272
integer textsize = -10
long textcolor = 16711680
string text = "실제계산식"
end type

type gb_2 from w_inheritance`gb_2 within w_cdcalc_m
integer x = 37
integer y = 524
integer width = 2853
integer height = 1568
end type

type gb_1 from w_inheritance`gb_1 within w_cdcalc_m
integer x = 1874
integer y = 40
integer width = 1015
end type

type sle_1 from singlelineedit within w_cdcalc_m
integer x = 736
integer y = 332
integer width = 137
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;if trim(this.text) = '' then this.text = '0'
if this.text <> '0' then cbx_2.checked = true
wf_calc()

end event

type cbx_1 from checkbox within w_cdcalc_m
integer x = 59
integer y = 332
integer width = 206
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "두께"
end type

event clicked;wf_calc()

end event

type cbx_2 from checkbox within w_cdcalc_m
integer x = 503
integer y = 332
integer width = 206
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "폭"
end type

event clicked;wf_calc()

end event

type cbx_3 from checkbox within w_cdcalc_m
integer x = 1211
integer y = 332
integer width = 206
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "높이"
end type

event clicked;wf_calc()

end event

type cbx_4 from checkbox within w_cdcalc_m
integer x = 1993
integer y = 332
integer width = 206
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "길이"
end type

event clicked;wf_calc()

end event

type st_2 from statictext within w_cdcalc_m
integer x = 283
integer y = 336
integer width = 187
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "X ((("
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cdcalc_m
integer x = 2203
integer y = 328
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "÷"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cdcalc_m
integer x = 663
integer y = 328
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "+"
boolean focusrectangle = false
end type

type st_6 from statictext within w_cdcalc_m
integer x = 1426
integer y = 328
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "+"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_cdcalc_m
integer x = 1481
integer y = 332
integer width = 137
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;if trim(this.text) = '' then this.text = '0'
if this.text <> '0' then cbx_3.checked = true
wf_calc()

end event

type st_7 from statictext within w_cdcalc_m
integer x = 1632
integer y = 336
integer width = 82
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = ") "
boolean focusrectangle = false
end type

type st_8 from statictext within w_cdcalc_m
integer x = 1664
integer y = 324
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "+"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_cdcalc_m
integer x = 1719
integer y = 332
integer width = 137
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;if trim(this.text) = '' then this.text = '0'
if this.text <> '0' then 
	cbx_2.checked = true
	cbx_3.checked = true
end if
wf_calc()

end event

type st_9 from statictext within w_cdcalc_m
integer x = 1861
integer y = 336
integer width = 110
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = ") X"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_cdcalc_m
integer x = 2674
integer y = 328
integer width = 69
integer height = 76
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "÷"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_cdcalc_m
integer x = 2743
integer y = 332
integer width = 123
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

event modified;if trim(this.text) = '' then this.text = '0'
wf_calc()

end event

type cbx_5 from checkbox within w_cdcalc_m
integer x = 2295
integer y = 332
integer width = 357
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "1,000,000"
boolean righttoleft = true
end type

event clicked;wf_calc()

end event

type cbx_6 from checkbox within w_cdcalc_m
integer x = 59
integer y = 424
integer width = 224
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "갯수"
end type

event clicked;wf_calc2()

end event

type em_1 from editmask within w_cdcalc_m
integer x = 361
integer y = 432
integer width = 247
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
end type

event modified;wf_calc2()

end event

type st_1 from statictext within w_cdcalc_m
integer x = 288
integer y = 432
integer width = 59
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "X"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cdcalc_m
integer x = 1152
integer y = 340
integer width = 55
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "("
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_cdcalc_m
integer x = 882
integer y = 340
integer width = 50
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = ") "
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_cdcalc_m
integer x = 937
integer y = 332
integer width = 219
integer height = 240
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean allowedit = true
boolean sorted = false
string item[] = {"X","+"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//if trim(this.text) = '' then this.text = 'X'
wf_calc()

end event

