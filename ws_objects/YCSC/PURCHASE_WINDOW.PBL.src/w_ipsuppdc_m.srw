$PBExportHeader$w_ipsuppdc_m.srw
$PBExportComments$구매처별 할인관리
forward
global type w_ipsuppdc_m from w_inheritance
end type
type st_1 from statictext within w_ipsuppdc_m
end type
type em_1 from editmask within w_ipsuppdc_m
end type
type st_2 from statictext within w_ipsuppdc_m
end type
type cbx_date from checkbox within w_ipsuppdc_m
end type
end forward

global type w_ipsuppdc_m from w_inheritance
integer x = 750
integer y = 4
integer width = 3017
integer height = 2324
string title = "매입처별 할인관리(w_ipsuppdc_m)"
windowstate windowstate = normal!
st_1 st_1
em_1 em_1
st_2 st_2
cbx_date cbx_date
end type
global w_ipsuppdc_m w_ipsuppdc_m

type variables
st_print  i_print
date id_start, id_end
datawindowchild idwc_supp
end variables

on w_ipsuppdc_m.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.st_2=create st_2
this.cbx_date=create cbx_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.cbx_date
end on

on w_ipsuppdc_m.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.cbx_date)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

// 할인년월
if cbx_date.checked = true then
	em_1.text = string(today(), "yyyy/mm/01")
else
	em_1.text = string(today(), "yyyy/mm/dd")
end if

dw_2.insertrow(1)

// 전체거래처
dw_2.settransobject(sqlca)
dw_2.insertrow(0)
dw_2.getchild("supp_no", idwc_supp)
idwc_supp.settransobject(SQLCA)

idwc_supp.insertrow(1)
idwc_supp.setitem(1, "supp_no", "%")
idwc_supp.setitem(1, "supp_name", "전체")

if LeftA(gs_team,1) = "9" then
	dw_2.object.supp_no[1] = "%"
end if

if GF_PERMISSION("매입처별_할인관리", gs_userid) = 'Y' then
	pb_save.enabled = true
else
	pb_save.enabled = false
end if

em_1.setfocus()

end event

type pb_save from w_inheritance`pb_save within w_ipsuppdc_m
integer x = 2523
integer y = 60
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipsuppdc_m
integer x = 69
integer y = 488
integer width = 2825
integer height = 1652
string dataobject = "d_ipsuppdc_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ipsuppdc_m
integer x = 1883
integer y = 316
integer width = 1015
integer height = 80
string dataobject = "d_whsupp_s"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;//
dw_1.reset()
pb_retrieve.triggerevent( clicked! )

end event

type st_title from w_inheritance`st_title within w_ipsuppdc_m
integer x = 41
integer width = 1211
integer height = 136
string text = "매입처별 할인관리"
end type

type st_tips from w_inheritance`st_tips within w_ipsuppdc_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipsuppdc_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipsuppdc_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipsuppdc_m
integer x = 2715
integer y = 60
integer width = 183
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipsuppdc_m
boolean visible = false
integer x = 2939
integer y = 60
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipsuppdc_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_ipsuppdc_m
integer x = 2322
integer y = 60
end type

event pb_delete::clicked;dw_1.deleterow(0)
end event

type pb_insert from w_inheritance`pb_insert within w_ipsuppdc_m
integer x = 2130
integer y = 60
end type

event pb_insert::clicked;long   ll_row
date   ld_ratedate
string ls_supp, ls_suppname
 
//ls_supp    = dw_2.object.supp_no[dw_2.getrow()]
//if ls_supp = "%" then return

//if isnull(ls_supp) or trim(ls_supp) = '' then 
//	messagebox("확인", "구매처를 선택하십시요")
//	return
//end if

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)

//SELECT supp_name INTO :ls_suppname FROM supp  WHERE supp_no  = :ls_supp;
//dw_1.object.supp_no[ll_row]   = ls_supp
//dw_1.object.supp_name[ll_row] = ls_suppname

// 할인년월
if cbx_date.checked = true then
	ld_ratedate = date(LeftA(em_1.text,8) + "01")
else
	ld_ratedate = date(em_1.text)
end if
dw_1.object.rate_date[ll_row] = ld_ratedate

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ipsuppdc_m
integer x = 1938
integer y = 60
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
dw_2.accepttext()

long   ll_row
string ls_supp, ls_yyyymm

ls_yyyymm = em_1.text
if ls_yyyymm = "0000/00/00" or ls_yyyymm = "" then 
	MessageBox("확인","할인년월 확인 바랍니다.",information!)
end if

ls_supp   = dw_2.object.supp_no[1]
ll_row    = dw_1.retrieve( ls_supp, ls_yyyymm )
if ll_row < 1 then
	MessageBox("확인","해당하는 데이터가 존재하지 않습니다.",information!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipsuppdc_m
integer x = 37
integer y = 264
integer width = 2894
integer height = 152
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ipsuppdc_m
integer x = 37
integer y = 428
integer width = 2894
integer height = 1740
end type

type gb_1 from w_inheritance`gb_1 within w_ipsuppdc_m
integer x = 1897
integer y = 16
integer width = 1033
integer height = 208
integer textsize = -10
integer weight = 400
end type

type st_1 from statictext within w_ipsuppdc_m
integer x = 1609
integer y = 324
integer width = 274
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "구매처"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type em_1 from editmask within w_ipsuppdc_m
integer x = 439
integer y = 316
integer width = 425
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

event rbuttondown;//
string ls_date

openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	ls_date   = string(date(message.stringparm))
	this.text = ls_date
	if cbx_date.checked = true then 
		this.text = LeftA(ls_date,8) + "01"
	end if
end if

end event

event modified;//
string ls_date

ls_date   = this.text
if cbx_date.checked = true then 
	this.text = LeftA(ls_date,8) + "01"
end if

end event

type st_2 from statictext within w_ipsuppdc_m
integer x = 105
integer y = 324
integer width = 320
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "할인년월"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cbx_date from checkbox within w_ipsuppdc_m
integer x = 901
integer y = 320
integer width = 672
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "할인일자(매월 1일)"
boolean checked = true
end type

