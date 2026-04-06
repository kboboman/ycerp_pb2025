$PBExportHeader$w_orsalesaleman_r.srw
$PBExportComments$영업사원별 수주현황(1998/05/15, 정재수)
forward
global type w_orsalesaleman_r from w_inheritance
end type
type st_1 from statictext within w_orsalesaleman_r
end type
type em_1 from editmask within w_orsalesaleman_r
end type
type em_2 from editmask within w_orsalesaleman_r
end type
type st_3 from statictext within w_orsalesaleman_r
end type
type st_2 from statictext within w_orsalesaleman_r
end type
type ddlb_1 from dropdownlistbox within w_orsalesaleman_r
end type
type dw_3 from datawindow within w_orsalesaleman_r
end type
type dw_4 from datawindow within w_orsalesaleman_r
end type
type st_4 from statictext within w_orsalesaleman_r
end type
type cbx_1 from checkbox within w_orsalesaleman_r
end type
type cb_1 from commandbutton within w_orsalesaleman_r
end type
type st_6 from statictext within w_orsalesaleman_r
end type
type ddlb_fld from dropdownlistbox within w_orsalesaleman_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r
end type
type st_7 from statictext within w_orsalesaleman_r
end type
type ddlb_op from dropdownlistbox within w_orsalesaleman_r
end type
type sle_value from singlelineedit within w_orsalesaleman_r
end type
type cb_3 from commandbutton within w_orsalesaleman_r
end type
type cb_4 from commandbutton within w_orsalesaleman_r
end type
type cb_5 from commandbutton within w_orsalesaleman_r
end type
type cb_6 from commandbutton within w_orsalesaleman_r
end type
type gb_4 from groupbox within w_orsalesaleman_r
end type
end forward

global type w_orsalesaleman_r from w_inheritance
integer y = 112
integer width = 4713
integer height = 2876
string title = "영업사원별 수주현황(w_orsalesaleman_r)"
long backcolor = 79416533
st_1 st_1
em_1 em_1
em_2 em_2
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
dw_4 dw_4
st_4 st_4
cbx_1 cbx_1
cb_1 cb_1
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
gb_4 gb_4
end type
global w_orsalesaleman_r w_orsalesaleman_r

type variables
string is_sale_flag, is_ret
datawindowchild idwc_user, idwc_area
end variables

on w_orsalesaleman_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_4=create st_4
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.cbx_1
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_4
this.Control[iCurrent+20]=this.cb_5
this.Control[iCurrent+21]=this.cb_6
this.Control[iCurrent+22]=this.gb_4
end on

on w_orsalesaleman_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
string ls_chk

st_security lst_security
string ls_level_userid

choose case gs_level
	case 'A', 'B'
		ls_chk = 'Y'
case 'C'
		ls_chk = 'N'
end choose

if ls_chk = 'Y' Then
	is_ret = '%'
	dw_3.getchild('user',idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1,'user_id','%')
	idwc_user.setitem(1,'user_name','전체')
	idwc_user.accepttext()
	dw_3.object.user[1] = '%'
else
	dw_3.object.user[1] = gs_userid
	is_ret = 'N'
end if

string ls_area, ls_salesman

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
cb_1.text = em_2.text + " 수주집계"

ddlb_1.text = '전체'
is_sale_flag = 'A'

dw_2.visible = false
dw_1.sharedata(dw_2)

dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('area',idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
idwc_area.accepttext()
ls_area = "%"
dw_4.object.area[1] = ls_area

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 92
gb_2.height = newheight - 468

dw_1.width  = newwidth  - 183
dw_1.height = newheight - 592


end event

type pb_save from w_inheritance`pb_save within w_orsalesaleman_r
boolean visible = false
integer taborder = 90
end type

type dw_1 from w_inheritance`dw_1 within w_orsalesaleman_r
integer x = 87
integer y = 488
integer width = 4494
integer height = 2180
integer taborder = 0
string dataobject = "d_orsalesalemanrep_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'sale_cust_no' or dwo.name = 'customer_cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.sale_cust_no[row]
	lstr_where.name = this.object.customer_cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_orsalesaleman_r
integer x = 1042
integer y = 0
integer width = 78
integer height = 64
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsalesalemanrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type st_title from w_inheritance`st_title within w_orsalesaleman_r
integer x = 50
integer y = 48
integer width = 1216
string text = "영업사원별 수주현황"
end type

type st_tips from w_inheritance`st_tips within w_orsalesaleman_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsalesaleman_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsalesaleman_r
boolean visible = false
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsalesaleman_r
integer x = 4421
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalesaleman_r
integer x = 4229
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print


if dw_2.rowcount() < 1 then
	return
end if

//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 영업사원별 수주현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=56'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalesaleman_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_orsalesaleman_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_orsalesaleman_r
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalesaleman_r
integer x = 4037
integer taborder = 40
end type

event pb_retrieve::clicked;date ld_start, ld_end
string ls_sale_flag[], ls_saleman, ls_area, ls_ret
st_security lst_security
 
dw_3.AcceptText()
dw_1.reset()
if em_1.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","납기일자를 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","납기일자를 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
elseif is_sale_flag = '' or isnull(is_sale_flag) then
	messagebox("확인","수주유형을 입력하세요!",information!)
	ddlb_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ld_start = date(em_1.text)
ld_end   = date(em_2.text)

if is_sale_flag = 'A' then
	ls_sale_flag[1] = 'D'
	ls_sale_flag[2] = 'L'
	ls_sale_flag[3] = 'E'
else
	ls_sale_flag[1] = is_sale_flag
end if

//갑용추가
//IF ISNULL(ls_saleman) THEN ls_saleman = '%'
// 각 팀장들..
//if is_ret = '%' then
//	ls_saleman = dw_3.object.user[1]
//else
ls_ret =  is_ret
if cbx_1.checked = true  then
	long ll_cnt, ll_chk
	ll_cnt = 0
	select count(*) into :ll_cnt from team
	 where parent_code = '70000'
		and team_manager = :gs_userid;
	if ll_cnt > 0  then
		ls_ret =  'T'
		ls_saleman = gs_userid
	else
		if is_ret = '%' then
			ls_saleman = dw_3.object.user[1]
		else
			ls_saleman = gs_userid
		end if
	end if
else
	if is_ret = '%' then
		ls_saleman = dw_3.object.user[1]
	else
		ls_saleman = gs_userid
	end if
end if
ls_area = dw_4.object.area[1]
dw_1.retrieve(ls_sale_flag, ld_start, ld_end, ls_saleman, ls_area, ls_ret)

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_sale_flag1, ls_areaname, ls_username
	
		Choose Case is_sale_flag
			Case 'A'
				ls_sale_flag1 = '전체'
			Case 'D'
				ls_sale_flag1 = '내수'
			Case 'L'
				ls_sale_flag1 = 'L/C'
			Case 'E'
				ls_sale_flag1 = '수출'
		End Choose	
		If ls_area = '%' Then
			ls_areaname = '전체'
		Else
			select area_name into :ls_areaname from area where area_no like :ls_area;
		End If
		
		If ls_saleman = '%' Then
			ls_saleman = '전체'
		Else
			select user_name into :ls_username from login where user_id = :ls_saleman;
		End If
		
		ls_userid = gs_userid
		ls_title = st_title.text
		ls_desc = '사업장:' + ls_areaname + ' 주문기간:' + string(ld_start) + '-' + string(ld_end) + ' 수주유형:' + ls_sale_flag1 + ' 영업사원:' + ls_username
		gf_log(ls_userid,ls_title,ls_desc)
End If		
//==========================================================================


	
end event

type gb_3 from w_inheritance`gb_3 within w_orsalesaleman_r
integer x = 1335
integer y = 0
integer width = 1989
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsalesaleman_r
integer x = 41
integer y = 412
integer width = 4585
integer height = 2304
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "거래처 더블클릭시 현황조회됩니다."
end type

type gb_1 from w_inheritance`gb_1 within w_orsalesaleman_r
integer x = 3337
integer y = 8
integer width = 1298
integer height = 216
integer taborder = 0
end type

type st_1 from statictext within w_orsalesaleman_r
integer x = 1934
integer y = 60
integer width = 297
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "주문기간"
boolean focusrectangle = false
end type

type em_1 from editmask within w_orsalesaleman_r
integer x = 2231
integer y = 48
integer width = 357
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_orsalesaleman_r
integer x = 2711
integer y = 48
integer width = 357
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

event losefocus;cb_1.text = em_2.text + " 수주집계"

end event

type st_3 from statictext within w_orsalesaleman_r
integer x = 2624
integer y = 52
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsalesaleman_r
integer x = 1934
integer y = 148
integer width = 288
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "수주유형"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_orsalesaleman_r
integer x = 2235
integer y = 132
integer width = 352
integer height = 384
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","내수","L/C","수출"}
end type

event selectionchanged;choose case index 
	case 1
		is_sale_flag = 'A'
	case 2
		is_sale_flag = 'D'
	case 3
		is_sale_flag = 'L'
	case 4
		is_sale_flag = 'E'
end choose

if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type dw_3 from datawindow within w_orsalesaleman_r
integer x = 2592
integer y = 132
integer width = 681
integer height = 76
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.AcceptText()
end event

type dw_4 from datawindow within w_orsalesaleman_r
integer x = 1371
integer y = 124
integer width = 526
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()

end event

type st_4 from statictext within w_orsalesaleman_r
integer x = 1472
integer y = 56
integer width = 297
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "사 업 장"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_orsalesaleman_r
integer x = 3099
integer y = 48
integer width = 146
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "팀"
end type

type cb_1 from commandbutton within w_orsalesaleman_r
integer x = 3369
integer y = 52
integer width = 649
integer height = 144
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오늘 수주집계"
end type

event clicked;string ls_day, ls_time, ls_cnt, ls_amt
long   ll_cnt, ll_amt

// 수주현황 
ls_day = em_2.text

 SELECT CNT  = SUM((CASE WHEN B.SEQ_NO = 1 THEN 1 ELSE 0 END))
		    , AMT  = SUM((B.ACC_QTY * B.PRICE))
	INTO :ll_cnt, :ll_amt
	FROM SALE A   inner join SALEDET   B   on  A.ORDER_NO = B.ORDER_NO
		                       inner join CUSTOMER  C   on A.CUST_NO = C.CUST_NO 
		                       left outer join SCENE     D   on A.CUST_NO = D.CUST_NO and A.SCENE_CODE = D.SCENE_CODE
					        inner join GROUPITEM E on B.ITEM_NO = E.ITEM_NO
						   inner join LOGIN     F on C.SALESMAN = F.USER_ID
  WHERE ( A.OPEN_CLOSE     NOT IN('X','C')  )            
	 AND   ( (A.SALE_FLAG       IN ( 'D','L','E' )       ) AND  
			    (CONVERT(CHAR(10),A.ORDER_DATE,111) = :ls_day ) AND  
			    (C.SALESMAN      LIKE '%'                   ) AND
			    (A.AREA_NO       LIKE '%'                   ) 
		        );

MessageBox("확인", '[송천]수주일: ' + ls_day + ' 현재~n~n' + &
           ' 수주: ' + string(ll_cnt,'#,##0') + '건~n~n 금액: ' + string(ll_amt,'#,##0') + '(단수차이 생김)' )


end event

type st_6 from statictext within w_orsalesaleman_r
integer x = 87
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_orsalesaleman_r
integer x = 274
integer y = 280
integer width = 480
integer height = 632
integer taborder = 110
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

type ddlb_dwtitles from dropdownlistbox within w_orsalesaleman_r
integer x = 329
integer y = 296
integer width = 311
integer height = 88
integer taborder = 120
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

type st_7 from statictext within w_orsalesaleman_r
integer x = 791
integer y = 296
integer width = 165
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

type ddlb_op from dropdownlistbox within w_orsalesaleman_r
integer x = 960
integer y = 280
integer width = 297
integer height = 512
integer taborder = 120
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsalesaleman_r
integer x = 1280
integer y = 288
integer width = 567
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
end type

type cb_3 from commandbutton within w_orsalesaleman_r
integer x = 1861
integer y = 288
integer width = 160
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_orsalesaleman_r
integer x = 2025
integer y = 288
integer width = 160
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_orsalesaleman_r
integer x = 2190
integer y = 288
integer width = 160
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orsalesaleman_r
integer x = 2354
integer y = 288
integer width = 160
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type gb_4 from groupbox within w_orsalesaleman_r
integer x = 41
integer y = 232
integer width = 4585
integer height = 156
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

