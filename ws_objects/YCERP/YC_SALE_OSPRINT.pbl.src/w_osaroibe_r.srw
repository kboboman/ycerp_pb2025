$PBExportHeader$w_osaroibe_r.srw
$PBExportComments$선매출현황(1998/05/15, 정재수)
forward 
global type w_osaroibe_r from w_inheritance
end type
type em_1 from editmask within w_osaroibe_r
end type
type em_2 from editmask within w_osaroibe_r
end type
type st_3 from statictext within w_osaroibe_r
end type
type st_1 from statictext within w_osaroibe_r
end type
type pb_1 from picturebutton within w_osaroibe_r
end type
type cbx_zero from checkbox within w_osaroibe_r
end type
type dw_3 from datawindow within w_osaroibe_r
end type
type cbx_be from checkbox within w_osaroibe_r
end type
end forward

global type w_osaroibe_r from w_inheritance
integer y = 112
integer width = 3845
integer height = 2172
string title = "선매출현황(w_osaroibe_r)"
em_1 em_1
em_2 em_2
st_3 st_3
st_1 st_1
pb_1 pb_1
cbx_zero cbx_zero
dw_3 dw_3
cbx_be cbx_be
end type
global w_osaroibe_r w_osaroibe_r

type variables
string is_sale_flag
end variables

on w_osaroibe_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_3=create st_3
this.st_1=create st_1
this.pb_1=create pb_1
this.cbx_zero=create cbx_zero
this.dw_3=create dw_3
this.cbx_be=create cbx_be
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.cbx_zero
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.cbx_be
end on

on w_osaroibe_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.cbx_zero)
destroy(this.dw_3)
destroy(this.cbx_be)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)

is_sale_flag = 'A'

// 10일 기준으로 전달 1일 ~ 전달 말일까지
if Day(today()) > 10 then
	em_1.text = "2013/05/01" 	// string(today(), 'yyyy/mm/01')
	em_2.text = string(today(), 'yyyy/mm/DD')
else
	em_1.text = "2013/05/01" 	// string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")
end if

dw_2.visible = false
dw_1.sharedata(dw_2)

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

dw_3.bringtotop = false

end event

type pb_save from w_inheritance`pb_save within w_osaroibe_r
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osaroibe_r
integer x = 32
integer y = 396
integer width = 3739
integer height = 1640
integer taborder = 0
string dataobject = "d_osaroiberep_r2"
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_osaroibe_r
integer x = 32
integer y = 20
integer width = 1184
integer height = 136
string text = "선수금 출고현황"
end type

type st_tips from w_inheritance`st_tips within w_osaroibe_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroibe_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroibe_r
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osaroibe_r
integer x = 2720
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroibe_r
integer x = 2528
integer taborder = 40
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string  ls_cust, ls_custnm, ls_usernm, ls_year
integer li_year

DataWindowChild ldwc_dw1, ldwc_dw2 

w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.sharedata( dw_2 )

if cbx_be.checked = true then
	li_year = integer(LeftA(em_2.text,4))
	ls_cust = dw_1.object.cust_no[dw_1.getrow()]
	dw_3.retrieve( ls_cust, li_year )
	
	debugbreak()
	dw_3.bringtotop = true
	dw_3.visible = true

	dw_3.getchild('dw_1', ldwc_dw1)
	if ldwc_dw1.rowcount() < 1 then
		SELECT cust_name = rtrim(c.cust_name) + (case when c.collect_ymd is null  then '' 
                                                    else ' 채권:' + convert(char(10),collect_ymd,11)
                                               end) 
           , user_name = (case when c.salesman = 'leesy2' then '채:' + l.user_name else l.user_name end)
		  INTO :ls_custnm, :ls_usernm
		  FROM customer c
		       LEFT OUTER JOIN login l ON c.salesman = l.user_id
		 WHERE cust_no = :ls_cust;

		ldwc_dw1.insertrow( 0 )

      ldwc_dw1.SetItem(1, "eom_year",  date(string(li_year - 1) + '/01/01'))		
		ldwc_dw1.SetItem(1, "cust_name", ls_custnm)
		ldwc_dw1.SetItem(1, "user_name", ls_usernm)
	end if
	
	dw_3.getchild('dw_2', ldwc_dw2)
	if ldwc_dw2.rowcount() < 1 then ldwc_dw2.insertrow( 0 )
	
	dw_3.Modify("dw_1.width = 1687")		// 전년
	dw_3.Modify("dw_2.width = 1687")		// 당년
	
	dw_3.bringtotop = true
	dw_3.visible = true
	dw_3.title = "이프로그램은 여신현황을 출력합니다."
	
	l_print.st_datawindow  = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 여신현황을 출력합니다." 
	
	OpenWithParm(w_printsetup, l_print) 	
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	
	//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
else
	l_print.st_datawindow  = dw_2
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 수주일보를 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroibe_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_osaroibe_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_osaroibe_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroibe_r
integer x = 2139
integer taborder = 30
end type

event pb_retrieve::clicked;//
date   ld_start, ld_end
string ls_sdate, ls_edate, ls_zero, ls_message

if em_1.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매출기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif em_1.text > em_2.text then
	messagebox("확인","매출기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_sdate = em_1.text
ls_edate = em_2.text
if cbx_zero.checked = true then
	ls_zero = "Y"
else
	ls_zero = "%"
end if

ls_message = "엔에이치개발 잔액 43,940,000을 (주)은민에스엔디 수금(매입계산서)으로 처리함.~n~n" + &
             "회장님 승인건으로 강제 SKIP함 (2014/04/25)"

dw_1.retrieve( ls_sdate, ls_edate, ls_zero )
dw_1.setfocus()

if cbx_zero.checked = true then
	MessageBox("확인",ls_message)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_osaroibe_r
integer x = 1266
integer y = 8
integer width = 827
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_osaroibe_r
integer y = 224
integer width = 3739
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroibe_r
integer x = 2112
integer y = 8
integer width = 827
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_osaroibe_r
integer x = 46
integer y = 180
integer width = 69
integer height = 60
integer taborder = 0
string dataobject = "d_osaroiberep_r11"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type em_1 from editmask within w_osaroibe_r
integer x = 1303
integer y = 124
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
boolean enabled = false
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

type em_2 from editmask within w_osaroibe_r
integer x = 1705
integer y = 124
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
boolean enabled = false
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

type st_3 from statictext within w_osaroibe_r
integer x = 1659
integer y = 128
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

type st_1 from statictext within w_osaroibe_r
integer x = 1303
integer y = 44
integer width = 759
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osaroibe_r
event mousemove pbm_mousemove
integer x = 2336
integer y = 52
integer width = 187
integer height = 144
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type cbx_zero from checkbox within w_osaroibe_r
integer x = 2501
integer y = 280
integer width = 713
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계금액 ZERO 제외"
end type

type dw_3 from datawindow within w_osaroibe_r
integer x = 142
integer y = 180
integer width = 69
integer height = 60
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_beinvcoll_r0"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cbx_be from checkbox within w_osaroibe_r
integer x = 3296
integer y = 280
integer width = 453
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "선수금현황"
end type

event clicked;// 선수금현황
gs_where        lstr_where
string ls_cust_no, ls_cust_name
long   ll_row

if this.checked = true then
	ll_row  = dw_1.getrow()
	ls_cust_no   = dw_1.object.cust_no[ll_row]
	ls_cust_name = dw_1.object.cust_name[ll_row]
	
	lstr_where.str1 = ls_cust_no
	lstr_where.name = ls_cust_name
	openwithparm(w_whopeom_beamt_w, lstr_where)	
else
	dw_3.bringtotop = false
	dw_3.visible = false
end if

end event

