$PBExportHeader$w_whsuppret_w.srw
$PBExportComments$매입처검색
forward
global type w_whsuppret_w from window
end type
type cb_18 from commandbutton within w_whsuppret_w
end type
type cb_17 from commandbutton within w_whsuppret_w
end type
type cb_15 from commandbutton within w_whsuppret_w
end type
type pb_2 from picturebutton within w_whsuppret_w
end type
type pb_1 from picturebutton within w_whsuppret_w
end type
type cb_19 from commandbutton within w_whsuppret_w
end type
type dw_1 from datawindow within w_whsuppret_w
end type
type cb_16 from commandbutton within w_whsuppret_w
end type
type cb_ret from commandbutton within w_whsuppret_w
end type
type sle_1 from singlelineedit within w_whsuppret_w
end type
type cbx_1 from checkbox within w_whsuppret_w
end type
type cb_14 from commandbutton within w_whsuppret_w
end type
type cb_13 from commandbutton within w_whsuppret_w
end type
type cb_12 from commandbutton within w_whsuppret_w
end type
type cb_11 from commandbutton within w_whsuppret_w
end type
type cb_10 from commandbutton within w_whsuppret_w
end type
type cb_9 from commandbutton within w_whsuppret_w
end type
type cb_8 from commandbutton within w_whsuppret_w
end type
type cb_7 from commandbutton within w_whsuppret_w
end type
type cb_6 from commandbutton within w_whsuppret_w
end type
type cb_5 from commandbutton within w_whsuppret_w
end type
type cb_4 from commandbutton within w_whsuppret_w
end type
type cb_3 from commandbutton within w_whsuppret_w
end type
type cb_2 from commandbutton within w_whsuppret_w
end type
type cb_1 from commandbutton within w_whsuppret_w
end type
type gb_1 from groupbox within w_whsuppret_w
end type
end forward

global type w_whsuppret_w from window
integer x = 823
integer y = 360
integer width = 1509
integer height = 1628
boolean titlebar = true
string title = "매입처검색(w_whsuppret_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_18 cb_18
cb_17 cb_17
cb_15 cb_15
pb_2 pb_2
pb_1 pb_1
cb_19 cb_19
dw_1 dw_1
cb_16 cb_16
cb_ret cb_ret
sle_1 sle_1
cbx_1 cbx_1
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_whsuppret_w w_whsuppret_w

type variables
gs_whcustret_str ist_whcustret
string is_name, is_filter, is_where
int ii_name = 0, ii_code =  0

end variables

forward prototypes
public function string wf_custret (string ls_first, string ls_second)
end prototypes

public function string wf_custret (string ls_first, string ls_second);long ll_chr
string ls_chr, ls_result
choose case cbx_1.checked
	case true
//		ll_chr = pos("cust_name",")") + 1
//		messagebox ('',dw_1.getitemstring("cust_name"))
//		ls_result = "(mid(cust_name,1,2) >= '" + ls_first + "' and " + &
//		           "mid(cust_name,1,2) < '" + ls_second + "') or " + &
//					  "(left(cust_name,1) = '(' and " + &
//					  "( mid ( cust_name, pos(cust_name,')') + 1,2) >= '" + ls_first +"' AND " + &
//					  "mid ( cust_name, pos(cust_name,')') + 1,2) < '" + ls_second + "') " + &
		ls_result = "( ( mid(cust_name,1,2) >= '" + ls_first + "' and " + &
		            "mid(cust_name,1,2) < '" + ls_second + "') or " + &
						"( mid (cust_name, pos(cust_name,')') + 1, 2) >= '" + ls_first + "' AND " + &
						"mid (cust_name, pos(cust_name,')') + 1, 2) < '" + ls_second + "') )"
//		            "((left(cust_name,1) = '(' ) and  " + & //첫부분 체크 안함.

//		ls_result = "(mid(cust_name,1,2) >= '" + ls_first + "' and " + &
//		           "mid(cust_name,1,2) < '" + ls_second + "') or " + &
//					  "(left(cust_name,1) = '(' and " + &
//					  "(mid(cust_name,5,2) >= '" + ls_first + "' and " + &
//					  "mid(cust_name,5,2) < '" + ls_second + "')) "
		if ls_first = '하' and ls_second = '' then
			ls_result = "( mid(cust_name,1,2) >= '" + ls_first + "' or " + &
							"mid(cust_name, pos(cust_name,')') + 1, 2) >= '" + ls_first + "')"
		end if

	case false
		ls_result = "mid(cust_name,1,2) >= '" + ls_first + "' and mid(cust_name,1,2) < '" + ls_second + "'"

		if ls_first = '하' and ls_second = '' then
			ls_result = "mid(cust_name,1,2) >= '" + ls_first + "'"
		end if

end choose

return ls_result
end function

on w_whsuppret_w.create
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_15=create cb_15
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_19=create cb_19
this.dw_1=create dw_1
this.cb_16=create cb_16
this.cb_ret=create cb_ret
this.sle_1=create sle_1
this.cbx_1=create cbx_1
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_18,&
this.cb_17,&
this.cb_15,&
this.pb_2,&
this.pb_1,&
this.cb_19,&
this.dw_1,&
this.cb_16,&
this.cb_ret,&
this.sle_1,&
this.cbx_1,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_whsuppret_w.destroy
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_15)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_19)
destroy(this.dw_1)
destroy(this.cb_16)
destroy(this.cb_ret)
destroy(this.sle_1)
destroy(this.cbx_1)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;ist_whcustret = message.powerobjectparm

//gs_ds_whcustret.sharedata(dw_1)
dw_1.settransobject(sqlca)
dw_1.retrieve()

end event

event closequery;
//gs_ds_whcustret.setfilter("")
//gs_ds_whcustret.filter()

end event

type cb_18 from commandbutton within w_whsuppret_w
integer x = 1161
integer y = 796
integer width = 311
integer height = 92
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "기본정렬"
end type

event clicked;if ii_code = 0 then
	dw_1.setsort('open_close A, cust_name A')
	ii_code = 1
elseif ii_code = 1 then
	dw_1.setsort('open_close D, cust_name D')
	ii_code = 0
end if
dw_1.sort()

end event

type cb_17 from commandbutton within w_whsuppret_w
integer x = 1161
integer y = 692
integer width = 311
integer height = 92
integer taborder = 210
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "코드정렬"
end type

event clicked;if ii_name = 0 then
	dw_1.setsort('cust_no A')
	ii_name = 1
elseif ii_name = 1 then
	dw_1.setsort('cust_no D')
	ii_name = 0
end if
dw_1.sort()
end event

type cb_15 from commandbutton within w_whsuppret_w
integer x = 1161
integer y = 592
integer width = 311
integer height = 92
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "상호정렬"
end type

event clicked;if ii_code = 0 then
	dw_1.setsort('cust_name A')
	ii_code = 1
elseif ii_code = 1 then
	dw_1.setsort('cust_name D')
	ii_code = 0
end if
dw_1.sort()

end event

type pb_2 from picturebutton within w_whsuppret_w
integer x = 1166
integer y = 1384
integer width = 302
integer height = 108
integer taborder = 240
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_Whcustret.cust_chk = 'N'
closewithreturn(parent,ist_whcustret)

end event

type pb_1 from picturebutton within w_whsuppret_w
integer x = 1166
integer y = 1260
integer width = 302
integer height = 108
integer taborder = 230
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인0.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = dw_1.getrow()
if ll_row < 1 then return

ist_whcustret.cust_name = dw_1.object.cust_name[ll_row]
ist_whcustret.cust_no   = dw_1.object.cust_no[ll_row]
ist_whcustret.cust_chk  = 'Y'

closewithreturn(parent,ist_whcustret)

end event

type cb_19 from commandbutton within w_whsuppret_w
integer x = 55
integer y = 156
integer width = 283
integer height = 96
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ABC.."
end type

event clicked;long ll_row
string ls_name, ls_filter, ls_where

dw_1.setredraw(false)

choose case cbx_1.checked
	case true
		ls_where = "(mid(cust_name,1,2) >= 'A'  or " + &
					  "(left(cust_name,1) = '(' and (mid(cust_name,5,2) >= 'A' "
	case false
		ls_where = "mid(cust_name,1,2) >= 'A' "
end choose

dw_1.setfilter(ls_where)
dw_1.filter()
dw_1.setredraw(true)
end event

type dw_1 from datawindow within w_whsuppret_w
integer x = 27
integer y = 420
integer width = 1120
integer height = 1072
integer taborder = 180
string dataobject = "d_whcustall_s"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
pb_1.triggerevent(clicked!)
end event

type cb_16 from commandbutton within w_whsuppret_w
integer x = 1161
integer y = 316
integer width = 311
integer height = 92
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "RESET"
end type

event clicked;// RESET
dw_1.setfilter('')
dw_1.filter()

end event

type cb_ret from commandbutton within w_whsuppret_w
integer x = 901
integer y = 316
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;long   ll_row
string ls_name, ls_filter, ls_where

//if isnull(sle_1.text) or sle_1.text = '' then return

dw_1.setredraw(false)

ls_name = string(sle_1.text)
if trim(ls_name) = '' or isnull(ls_name) then
	ls_where = ''
else
	ls_filter = '%' + ls_name + '%'
	ls_where = "cust_name like '" + ls_filter + "'"
end if

dw_1.setfilter(ls_where)
dw_1.filter()
dw_1.setredraw(true)

//gs_ds_whcustret.retrieve(ls_where) 
//
//dw_1.reset()
//dw_1.setredraw(false)
//for ll_row=1 to gs_ds_whcustret.rowcount()
//	dw_1.insertrow(0)
//	dw_1.object.cust_name[ll_row] =  gs_ds_whcustret.getitemstring(ll_row,'cust_name')
//next
//dw_1.setredraw(true)
//
//for ll_row =1 to gs_ds_whcustret.rowcount()
	




end event

type sle_1 from singlelineedit within w_whsuppret_w
integer x = 27
integer y = 316
integer width = 864
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_ret.default = true	// 검색
pb_1.default   = false	// 확인

end event

event losefocus;cb_ret.default = false	// 검색
pb_1.default   = true	// 확인

end event

type cbx_1 from checkbox within w_whsuppret_w
integer x = 59
integer y = 68
integer width = 283
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
string text = "(주)"
end type

type cb_14 from commandbutton within w_whsuppret_w
integer x = 357
integer y = 156
integer width = 133
integer height = 96
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅇ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('아','자'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_13 from commandbutton within w_whsuppret_w
integer x = 498
integer y = 156
integer width = 133
integer height = 96
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅈ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('자','차'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_12 from commandbutton within w_whsuppret_w
integer x = 640
integer y = 156
integer width = 133
integer height = 96
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅊ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('차','카'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_11 from commandbutton within w_whsuppret_w
integer x = 782
integer y = 156
integer width = 133
integer height = 96
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅋ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('카','타'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_10 from commandbutton within w_whsuppret_w
integer x = 923
integer y = 156
integer width = 133
integer height = 96
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅌ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('타','파'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_9 from commandbutton within w_whsuppret_w
integer x = 1065
integer y = 156
integer width = 133
integer height = 96
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅍ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('파','하'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_8 from commandbutton within w_whsuppret_w
integer x = 1207
integer y = 156
integer width = 133
integer height = 96
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅎ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('하','')) //힣
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_7 from commandbutton within w_whsuppret_w
integer x = 1207
integer y = 56
integer width = 133
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅅ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('사','아'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_6 from commandbutton within w_whsuppret_w
integer x = 1065
integer y = 56
integer width = 133
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅂ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('바','사'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_5 from commandbutton within w_whsuppret_w
integer x = 923
integer y = 56
integer width = 133
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㅁ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('마','바'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_4 from commandbutton within w_whsuppret_w
integer x = 782
integer y = 56
integer width = 133
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄹ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('라','마'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_3 from commandbutton within w_whsuppret_w
integer x = 640
integer y = 56
integer width = 133
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄷ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('다','라'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_2 from commandbutton within w_whsuppret_w
integer x = 498
integer y = 56
integer width = 133
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄴ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('나','다'))
dw_1.filter()
dw_1.setredraw(true)
end event

type cb_1 from commandbutton within w_whsuppret_w
integer x = 357
integer y = 56
integer width = 133
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ㄱ"
end type

event clicked;dw_1.setredraw(false)
dw_1.setfilter(wf_custret('가','나'))
dw_1.filter()
dw_1.setredraw(true)

end event

type gb_1 from groupbox within w_whsuppret_w
integer x = 23
integer width = 1445
integer height = 280
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

