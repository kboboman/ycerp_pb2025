$PBExportHeader$w_cdbirthfound_m.srw
$PBExportComments$거래처별 기념일
forward
global type w_cdbirthfound_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdbirthfound_m
end type
type st_8 from statictext within w_cdbirthfound_m
end type
type ddlb_fld from dropdownlistbox within w_cdbirthfound_m
end type
type st_9 from statictext within w_cdbirthfound_m
end type
type sle_value from singlelineedit within w_cdbirthfound_m
end type
type cb_filteron from commandbutton within w_cdbirthfound_m
end type
type cb_filteroff from commandbutton within w_cdbirthfound_m
end type
type cb_1 from commandbutton within w_cdbirthfound_m
end type
type cb_2 from commandbutton within w_cdbirthfound_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdbirthfound_m
end type
type rb_1 from radiobutton within w_cdbirthfound_m
end type
type rb_2 from radiobutton within w_cdbirthfound_m
end type
type rb_3 from radiobutton within w_cdbirthfound_m
end type
type cbx_1 from checkbox within w_cdbirthfound_m
end type
type ddlb_op from dropdownlistbox within w_cdbirthfound_m
end type
type dw_salesman from datawindow within w_cdbirthfound_m
end type
type st_22 from statictext within w_cdbirthfound_m
end type
end forward

global type w_cdbirthfound_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4018
integer height = 2576
string title = "거래처별 기념일(w_cdbirthfound_m)"
cb_3 cb_3
st_8 st_8
ddlb_fld ddlb_fld
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
ddlb_dwtitles ddlb_dwtitles
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cbx_1 cbx_1
ddlb_op ddlb_op
dw_salesman dw_salesman
st_22 st_22
end type
global w_cdbirthfound_m w_cdbirthfound_m

type variables
public string is_bank_code, is_bank_name, is_bank_id
st_print i_print
DataWindowChild idwc_user

string   is_sql, is_dw
boolean  ib_check = true

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_2.visible = false

pb_insert.enabled = false
pb_delete.enabled = false
pb_save.enabled   = false

rb_1.enabled = false

dw_salesman.settransobject(sqlca)	// 담당자별 거래처
dw_salesman.insertrow(1)

dw_salesman.getchild('user',idwc_user)
idwc_user.insertrow(1)


if GF_Permission("거래처별_기념일", gs_userid) = "Y" then
	
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_salesman.object.user[1] = '%'	
	
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
	
else
	
	idwc_user.setitem(1,'user_id', gs_userid)
	idwc_user.setitem(1,'user_name', gs_username)
	
	idwc_user.accepttext()
	dw_salesman.object.user[1] = gs_userid	
	
	dw_salesman.enabled = false
	
end  if


end event

on w_cdbirthfound_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ddlb_dwtitles=create ddlb_dwtitles
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cbx_1=create cbx_1
this.ddlb_op=create ddlb_op
this.dw_salesman=create dw_salesman
this.st_22=create st_22
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_filteron
this.Control[iCurrent+7]=this.cb_filteroff
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.ddlb_dwtitles
this.Control[iCurrent+11]=this.rb_1
this.Control[iCurrent+12]=this.rb_2
this.Control[iCurrent+13]=this.rb_3
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.dw_salesman
this.Control[iCurrent+17]=this.st_22
end on

on w_cdbirthfound_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ddlb_dwtitles)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cbx_1)
destroy(this.ddlb_op)
destroy(this.dw_salesman)
destroy(this.st_22)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 440

end event

type pb_save from w_inheritance`pb_save within w_cdbirthfound_m
integer x = 3497
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdbirthfound_m
integer x = 27
integer y = 416
integer width = 3886
integer height = 2016
string dataobject = "d_birthfound_m"
boolean hscrollbar = false
end type

event dw_1::getfocus;call super::getfocus;//
is_dw = "dw_1"
end event

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemchanged;call super::itemchanged;//
string   ls_data, ls_date
date     ld_date
datetime ldt_date, ldt_lunar, ldt_null
string   ls_salesman_name

setnull( ldt_null )
this.accepttext()


choose case dwo.name
	case "cust_no"
		select login.user_name salesman_name
		   into :ls_salesman_name
		from customer left outer join login on customer.salesman = login.user_id
		where customer.cust_no = :data;
	
	this.object.login_salesman_name[row] = ls_salesman_name	
		
	case "sol_lun"
		if rb_3.checked = true then
			//
		else
			ls_data  = data		
	
			ld_date  = date(dw_1.object.birth_found[row])
			if ls_data = "Y" then
				SELECT lunar_date INTO :ldt_lunar FROM lunar2solar WHERE solar_date = :ld_date;
				dw_1.object.lun_date[row] = ldt_lunar
			else
				dw_1.object.lun_date[row] = ld_date
			end if
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_cdbirthfound_m
integer width = 1138
string text = "거래처별 기념일"
end type

type st_tips from w_inheritance`st_tips within w_cdbirthfound_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbirthfound_m
boolean visible = false
integer x = 2222
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbirthfound_m
boolean visible = false
integer x = 3360
end type

type pb_close from w_inheritance`pb_close within w_cdbirthfound_m
integer x = 3689
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbirthfound_m
integer x = 3305
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdbirthfound_m
boolean visible = false
integer x = 2976
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdbirthfound_m
integer x = 3113
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_driver, ls_bank_check
long   ll_row

if MessageBox("확인",'삭제 하시겠습니까?',information!, OKCancel!, 2) = 2 then
	RETURN
end if	

dw_1.accepttext()

ll_row = dw_1.getrow()
dw_1.deleterow(ll_row)

wf_update1(dw_1, "Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdbirthfound_m
integer x = 2921
integer taborder = 150
end type

event pb_insert::clicked;//
long ll_row, ll_count

dw_1.accepttext()

ll_row = dw_1.getrow()

dw_1.insertrow(ll_row)
dw_1.object.birthday_yn[ll_row] = 'N'
dw_1.scrolltorow(ll_row)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbirthfound_m
integer x = 2729
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string  ls_birth, ls_user_id
long    ll_row

if rb_1.checked = true then
	ls_birth = "%"
elseif rb_2.checked = true then
	ls_birth = "Y"
else
	ls_birth = "N"
end if

ls_user_id = dw_salesman.object.user[1]

dw_1.retrieve( ls_birth, ls_user_id )
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
else
	MessageBox("확인","조회완료")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_cdbirthfound_m
integer x = 1902
integer y = 12
integer width = 782
integer height = 204
integer taborder = 70
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdbirthfound_m
integer x = 27
integer y = 232
integer width = 3886
integer height = 168
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdbirthfound_m
integer x = 2697
integer width = 1211
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdbirthfound_m
integer x = 997
integer y = 20
integer width = 114
integer height = 80
integer taborder = 60
string dataobject = "d_cddocar_r"
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_cdbirthfound_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_8 from statictext within w_cdbirthfound_m
integer x = 78
integer y = 308
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "필드: "
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cdbirthfound_m
integer x = 261
integer y = 288
integer width = 480
integer height = 580
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_9 from statictext within w_cdbirthfound_m
integer x = 777
integer y = 308
integer width = 174
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdbirthfound_m
integer x = 1225
integer y = 292
integer width = 581
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdbirthfound_m
integer x = 1819
integer y = 288
integer width = 197
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
//arg_dw.groupcalc()

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdbirthfound_m
integer x = 2021
integer y = 288
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdbirthfound_m
integer x = 2222
integer y = 288
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type cb_2 from commandbutton within w_cdbirthfound_m
integer x = 2409
integer y = 288
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	arg_dw  = dw_2
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
//arg_dw.groupcalc()

end event

type ddlb_dwtitles from dropdownlistbox within w_cdbirthfound_m
integer x = 320
integer y = 304
integer width = 306
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type rb_1 from radiobutton within w_cdbirthfound_m
integer x = 1938
integer y = 68
integer width = 261
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "전체"
end type

event clicked;//
dw_1.reset()
pb_retrieve.triggerevent( clicked! )


end event

type rb_2 from radiobutton within w_cdbirthfound_m
integer x = 2226
integer y = 68
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "생년월일"
boolean checked = true
end type

event clicked;//
dw_1.reset()
pb_retrieve.triggerevent( clicked! )

end event

type rb_3 from radiobutton within w_cdbirthfound_m
integer x = 2226
integer y = 140
integer width = 416
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "창립기념일"
end type

event clicked;//
dw_1.reset()
pb_retrieve.triggerevent( clicked! )

end event

type cbx_1 from checkbox within w_cdbirthfound_m
integer x = 2638
integer y = 296
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "생일 정렬"
end type

event clicked;//
string ls_sort

if this.checked = true then
	dw_1.setsort( "mm A, dd A" )
	dw_1.sort()
else
	dw_1.setsort( "" )
	dw_1.sort()
end if


end event

type ddlb_op from dropdownlistbox within w_cdbirthfound_m
integer x = 955
integer y = 288
integer width = 261
integer height = 500
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type dw_salesman from datawindow within w_cdbirthfound_m
integer x = 1202
integer y = 116
integer width = 672
integer height = 84
integer taborder = 70
boolean bringtotop = true
string title = "담당자"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

type st_22 from statictext within w_cdbirthfound_m
integer x = 1202
integer y = 40
integer width = 658
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

