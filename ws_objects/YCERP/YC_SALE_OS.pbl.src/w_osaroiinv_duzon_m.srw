$PBExportHeader$w_osaroiinv_duzon_m.srw
$PBExportComments$매출세금계산서(매출해제)
forward 
global type w_osaroiinv_duzon_m from w_inheritance
end type
type em_1 from editmask within w_osaroiinv_duzon_m
end type
type em_2 from editmask within w_osaroiinv_duzon_m
end type
type st_1 from statictext within w_osaroiinv_duzon_m
end type
type rb_1 from radiobutton within w_osaroiinv_duzon_m
end type
type rb_2 from radiobutton within w_osaroiinv_duzon_m
end type
type st_2 from statictext within w_osaroiinv_duzon_m
end type
type st_3 from statictext within w_osaroiinv_duzon_m
end type
type em_3 from editmask within w_osaroiinv_duzon_m
end type
type rb_3 from radiobutton within w_osaroiinv_duzon_m
end type
type st_6 from statictext within w_osaroiinv_duzon_m
end type
type st_7 from statictext within w_osaroiinv_duzon_m
end type
type st_8 from statictext within w_osaroiinv_duzon_m
end type
type st_9 from statictext within w_osaroiinv_duzon_m
end type
type st_10 from statictext within w_osaroiinv_duzon_m
end type
type cbx_2 from checkbox within w_osaroiinv_duzon_m
end type
end forward

global type w_osaroiinv_duzon_m from w_inheritance
integer x = 37
integer y = 136
integer width = 4064
integer height = 2316
string title = "세금계산서(매출해제)(w_osaroiinv_duzon_m)"
boolean resizable = false
long backcolor = 79219928
em_1 em_1
em_2 em_2
st_1 st_1
rb_1 rb_1
rb_2 rb_2
st_2 st_2
st_3 st_3
em_3 em_3
rb_3 rb_3
st_6 st_6
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
cbx_2 cbx_2
end type
global w_osaroiinv_duzon_m w_osaroiinv_duzon_m

type variables
//
datawindowchild idwc_cust, idwc_cust_name

end variables

on w_osaroiinv_duzon_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.st_3=create st_3
this.em_3=create em_3
this.rb_3=create rb_3
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.cbx_2=create cbx_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.em_3
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.st_9
this.Control[iCurrent+14]=this.st_10
this.Control[iCurrent+15]=this.cbx_2
end on

on w_osaroiinv_duzon_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_3)
destroy(this.rb_3)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.cbx_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

String   ls_day
DateTime ld_day

pb_save.enabled = false
if GF_PErmission("세금계산서_매출해제(재무팀)", gs_userid) = "Y" then
	pb_save.enabled = true
end if

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

ls_day = RightA(String(today(), "yyyy/mm/dd"), 2)
if ls_day > "15" then
	em_1.text = string(today(), "YYYY/MM/01")
	em_2.text = string(today(), "YYYY/MM/DD")
else
	em_1.text = string(RelativeDate(today(),  - (integer(ls_day) + 1)), "yyyy/mm/01")
	
	em_2.text = string(today(), "YYYY/MM/01")
	em_2.text = String(RelativeDate(date(em_2.text), -1), "yyyy/mm/dd")
end if

dw_2.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.retrieve("O", "%", "%")
idwc_cust.setsort('cust_no, cust_name')
idwc_cust.sort()

dw_2.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)
idwc_cust_name.retrieve("O", "%", "%")
idwc_cust_name.setsort('cust_name, cust_no')
idwc_cust_name.sort()

dw_2.insertrow(0)

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

gb_3.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_osaroiinv_duzon_m
event aroi_print pbm_uonexternal01
integer x = 3602
integer taborder = 70
end type

event pb_save::clicked;//
if gf_permission('세금계산서_매출해제(재무팀)', gs_userid) = 'Y' then
else
	messagebox('확인', '이 프로그램에 사용권한이 없습니다.')
	return
end if

if wf_update1(dw_1, 'N') = true then
	INSERT INTO aroiinv_his (oi_date, inv_type, aroiinv_no, cust_no, open_close, flag_gb, sys_date, login_id)
   VALUES (getdate(), '', '', '', '', 'H', getdate(), :gs_userid);
	COMMIT;
	MessageBox("확인", "저장되었습니다.")
end if

end event

type dw_1 from w_inheritance`dw_1 within w_osaroiinv_duzon_m
integer x = 32
integer y = 664
integer width = 3991
integer height = 1544
integer taborder = 10
string dataobject = "d_glaroiinv_list_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;this.accepttext()

end event

type st_title from w_inheritance`st_title within w_osaroiinv_duzon_m
integer x = 32
integer y = 28
integer width = 1723
string text = "세금계산서 매출해제(재무팀)"
end type

type st_tips from w_inheritance`st_tips within w_osaroiinv_duzon_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroiinv_duzon_m
boolean visible = false
integer x = 4224
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroiinv_duzon_m
boolean visible = false
integer x = 3826
integer width = 192
integer taborder = 110
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;//w_whsaledodet_w
end event

event pb_print_part::clicked;ws_process st_process
OpenWithParm(w_whsaledodet_w, st_process)

end event

type pb_close from w_inheritance`pb_close within w_osaroiinv_duzon_m
integer x = 3799
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroiinv_duzon_m
boolean visible = false
integer x = 4027
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_osaroiinv_duzon_m
boolean visible = false
integer x = 3237
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_osaroiinv_duzon_m
boolean visible = false
integer x = 3630
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_osaroiinv_duzon_m
boolean visible = false
integer x = 3433
integer taborder = 50
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroiinv_duzon_m
integer x = 3406
integer taborder = 150
end type

event pb_retrieve::clicked;call super::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================

string ls_custno, ls_aroiinv_no, ls_sdate, ls_edate, ls_delete
long   ll_row

dw_2.accepttext()

ls_custno = dw_2.object.cust_no[1]
ls_aroiinv_no = trim(em_3.text)
ls_sdate  = trim(em_1.text)
ls_edate  = trim(em_2.text)
ls_delete = 'N'

if isnull(ls_custno) then	ls_custno = '%'
if isnull(ls_aroiinv_no) or ls_aroiinv_no = '-' or ls_aroiinv_no = '' then
	ls_aroiinv_no = '%'
else
	if RightA(ls_aroiinv_no,1) = '-' then
		ls_aroiinv_no = trim(LeftA(ls_aroiinv_no, LenA(ls_aroiinv_no) - 1)) + '%'
	else
		ls_aroiinv_no += '%'
	end if
end if

if rb_1.checked = true then ls_delete = '%'
if rb_2.checked = true then ls_delete = 'N'
if rb_3.checked = true then ls_delete = 'Y'

ll_row = dw_1.retrieve(ls_custno, ls_aroiinv_no, ls_sdate, ls_edate, ls_delete)

end event

type gb_3 from w_inheritance`gb_3 within w_osaroiinv_duzon_m
integer x = 32
integer y = 484
integer width = 3991
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_osaroiinv_duzon_m
integer y = 236
integer width = 3991
integer height = 244
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_osaroiinv_duzon_m
integer x = 3369
integer width = 649
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroiinv_duzon_m
integer x = 864
integer y = 372
integer width = 2327
integer height = 92
integer taborder = 90
string dataobject = "d_cdcustomer_s2"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;choose case dwo.name
	case 'cust_no'  
		this.object.cust_name[1] = ''
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")
	case 'cust_name'
		this.object.cust_no[1] = ''
		this.object.cust_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
end choose		

end event

type em_1 from editmask within w_osaroiinv_duzon_m
integer x = 439
integer y = 284
integer width = 411
integer height = 84
integer taborder = 20
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
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if


end event

type em_2 from editmask within w_osaroiinv_duzon_m
integer x = 896
integer y = 284
integer width = 411
integer height = 84
integer taborder = 30
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
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if


end event

type st_1 from statictext within w_osaroiinv_duzon_m
integer x = 855
integer y = 296
integer width = 46
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_osaroiinv_duzon_m
integer x = 1518
integer y = 296
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;//
//dw_1.object.전송.tabsequence = 0
dw_1.reset()

end event

type rb_2 from radiobutton within w_osaroiinv_duzon_m
integer x = 1769
integer y = 296
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "정상"
end type

event clicked;//
//dw_1.object.전송.tabsequence = 0
dw_1.reset()
end event

type st_2 from statictext within w_osaroiinv_duzon_m
integer x = 64
integer y = 288
integer width = 352
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
string text = "계산서기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_osaroiinv_duzon_m
integer x = 64
integer y = 380
integer width = 352
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
string text = "계산서번호"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_3 from editmask within w_osaroiinv_duzon_m
integer x = 439
integer y = 376
integer width = 416
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aa######-###"
boolean autoskip = true
end type

type rb_3 from radiobutton within w_osaroiinv_duzon_m
integer x = 2025
integer y = 296
integer width = 238
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "폐기"
end type

type st_6 from statictext within w_osaroiinv_duzon_m
integer x = 1861
integer y = 4
integer width = 1353
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "#.사용방법"
boolean focusrectangle = false
end type

type st_7 from statictext within w_osaroiinv_duzon_m
integer x = 1861
integer y = 64
integer width = 1353
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "1.조회할 계산서의 작성된 기간을 입력한다."
boolean focusrectangle = false
end type

type st_8 from statictext within w_osaroiinv_duzon_m
integer x = 1861
integer y = 124
integer width = 1353
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "2.계산서번호 또는 거래처를 선택한다."
boolean focusrectangle = false
end type

type st_9 from statictext within w_osaroiinv_duzon_m
integer x = 1861
integer y = 184
integer width = 1353
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = " (위 2번은 입력 하지않아도 조회가능함.)"
boolean focusrectangle = false
end type

type st_10 from statictext within w_osaroiinv_duzon_m
integer x = 494
integer y = 544
integer width = 2848
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "*.마감되었던 자료 해제후 수정완료시, ~'매출전표 만들기(더존용)~'을 다시 실행해야 합니다."
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_osaroiinv_duzon_m
integer x = 82
integer y = 548
integer width = 389
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체해제"
end type

event clicked;long  ll_row

if dw_1.rowcount() < 1 then return

for ll_row =  1 to dw_1.rowcount()
	if dw_1.object.c_chk[ll_row] = "O" then
	else
		if this.checked = true then
			dw_1.object.aroiinv_open_close[ll_row] = "O"
		else
			dw_1.object.aroiinv_open_close[ll_row] = "T"
		end if
	end if
next
end event

