$PBExportHeader$w_oiitembaldo_r3.srw
$PBExportComments$제품별 제품출고및 미출고현황(1998/5/14,성삼지)
forward
global type w_oiitembaldo_r3 from w_inheritance
end type
type pb_1 from picturebutton within w_oiitembaldo_r3
end type
type st_3 from statictext within w_oiitembaldo_r3
end type
type ddlb_fld from dropdownlistbox within w_oiitembaldo_r3
end type
type ddlb_dwtitles from dropdownlistbox within w_oiitembaldo_r3
end type
type st_4 from statictext within w_oiitembaldo_r3
end type
type sle_value from singlelineedit within w_oiitembaldo_r3
end type
type cb_1 from commandbutton within w_oiitembaldo_r3
end type
type cb_2 from commandbutton within w_oiitembaldo_r3
end type
type cb_3 from commandbutton within w_oiitembaldo_r3
end type
type cb_5 from commandbutton within w_oiitembaldo_r3
end type
type st_5 from statictext within w_oiitembaldo_r3
end type
type em_1 from editmask within w_oiitembaldo_r3
end type
type em_2 from editmask within w_oiitembaldo_r3
end type
type st_7 from statictext within w_oiitembaldo_r3
end type
type cbx_team from checkbox within w_oiitembaldo_r3
end type
type dw_sales from datawindow within w_oiitembaldo_r3
end type
type st_6 from statictext within w_oiitembaldo_r3
end type
type dw_area from datawindow within w_oiitembaldo_r3
end type
type dw_cust from datawindow within w_oiitembaldo_r3
end type
type st_8 from statictext within w_oiitembaldo_r3
end type
type dw_3 from datawindow within w_oiitembaldo_r3
end type
type cbx_1 from checkbox within w_oiitembaldo_r3
end type
type cbx_hap from checkbox within w_oiitembaldo_r3
end type
type cbx_haphd from checkbox within w_oiitembaldo_r3
end type
type ddlb_op from dropdownlistbox within w_oiitembaldo_r3
end type
type gb_4 from groupbox within w_oiitembaldo_r3
end type
end forward

global type w_oiitembaldo_r3 from w_inheritance
integer y = 112
integer width = 4709
integer height = 2724
string title = "물품별 미출고 현황(w_oiitembaldo_r3)"
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_5 st_5
em_1 em_1
em_2 em_2
st_7 st_7
cbx_team cbx_team
dw_sales dw_sales
st_6 st_6
dw_area dw_area
dw_cust dw_cust
st_8 st_8
dw_3 dw_3
cbx_1 cbx_1
cbx_hap cbx_hap
cbx_haphd cbx_haphd
ddlb_op ddlb_op
gb_4 gb_4
end type
global w_oiitembaldo_r3 w_oiitembaldo_r3

type variables
//
gs_itembaldo_str ist_code

string is_sale_flag, is_itemdosql, is_itemdorsql

DataWindowChild idwc_area, idwc_user, idwc_cust

end variables

on w_oiitembaldo_r3.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_5=create st_5
this.em_1=create em_1
this.em_2=create em_2
this.st_7=create st_7
this.cbx_team=create cbx_team
this.dw_sales=create dw_sales
this.st_6=create st_6
this.dw_area=create dw_area
this.dw_cust=create dw_cust
this.st_8=create st_8
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.cbx_hap=create cbx_hap
this.cbx_haphd=create cbx_haphd
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.em_2
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.cbx_team
this.Control[iCurrent+16]=this.dw_sales
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.dw_area
this.Control[iCurrent+19]=this.dw_cust
this.Control[iCurrent+20]=this.st_8
this.Control[iCurrent+21]=this.dw_3
this.Control[iCurrent+22]=this.cbx_1
this.Control[iCurrent+23]=this.cbx_hap
this.Control[iCurrent+24]=this.cbx_haphd
this.Control[iCurrent+25]=this.ddlb_op
this.Control[iCurrent+26]=this.gb_4
end on

on w_oiitembaldo_r3.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_7)
destroy(this.cbx_team)
destroy(this.dw_sales)
destroy(this.st_6)
destroy(this.dw_area)
destroy(this.dw_cust)
destroy(this.st_8)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.cbx_hap)
destroy(this.cbx_haphd)
destroy(this.ddlb_op)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

is_itemdosql  = dw_1.describe("datawindow.table.select")
is_itemdorsql = dw_2.describe("datawindow.table.select")

dw_2.visible  = false
dw_3.visible  = false
dw_3.SetTransObject(SQLCA)

// 10일 기준으로 전달 1일 ~ 전달 말일까지
string ls_lastday

SELECT top 1 CONVERT(CHAR(10),DATEADD(DAY, -1, DATEADD(month, 1,(CONVERT(CHAR(6),GETDATE(),112) + '01') ) ),111)
  INTO :ls_lastday
  FROM LOGIN;
	  
if Day(today()) > 10 then
	em_1.text = string(today(), "yyyy/mm/01")
	em_2.text = ls_lastday	// 당월말일
else
	em_1.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/01")
	em_2.text = string(RelativeDate(today(), - Day(today()) ), "yyyy/mm/dd")	// 전달말일
end if

// -60일, + 30일
em_1.text = String(RelativeDate(today(), - 60),'yyyy/mm/dd')
em_2.text = String(RelativeDate(today(), + 30),'yyyy/mm/dd')


// 사업장 
string ls_area

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = "%"	// gs_area
dw_area.object.area[1] = ls_area

// 거래처
//dw_cust.object.cust_no.Background.Color = 67108864
dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)
if GF_Permission("물품별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if
if idwc_cust.rowcount() = 0 then	idwc_cust.insertrow(0)
dw_cust.insertrow(0)  

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)
if GF_Permission("물품별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )

	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"
	
	cbx_team.checked = true		// 팀조회
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	long ll_find
	
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
		cbx_team.checked = false
	   idwc_cust.setfilter( "salesman = '" + gs_userid + "' OR cust_no IN ('%', 'ALL') " )
		idwc_cust.filter()
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

		cbx_team.checked = true
		idwc_cust.setfilter( "" )
		idwc_cust.filter()
	end if
	dw_sales.object.user[1] = gs_userid
end if

dw_sales.setfocus()

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_oiitembaldo_r3
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oiitembaldo_r3
integer x = 32
integer y = 420
integer width = 4489
integer height = 1852
integer taborder = 0
string dataobject = "d_oiitembaldo_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oiitembaldo_r3
integer x = 32
integer y = 24
integer width = 1166
integer height = 140
string text = "물품별 미출고현황"
end type

type st_tips from w_inheritance`st_tips within w_oiitembaldo_r3
end type

type pb_compute from w_inheritance`pb_compute within w_oiitembaldo_r3
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiitembaldo_r3
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_oiitembaldo_r3
integer x = 3881
integer y = 56
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oiitembaldo_r3
integer x = 3689
integer y = 56
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_count
w_repsuper w_print
st_print   l_print

if cbx_1.checked = true then RETURN

dw_1.ShareData(dw_2)
if dw_2.rowcount() < 1 then
	MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   RETURN
end if

//FOR ll_count = 1 TO dw_2.rowcount()
//   dw_2.object.customer_industry_code[ll_count] = st_1.text
//	dw_2.object.customer_bus_cord[ll_count] = ist_code.start_date
//	dw_2.object.customer_bus_rep[ll_count]  = ist_code.end_date
//NEXT

//l_print.name = 'd_oiitemdobal_r'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 물품별 출고및 미출고 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oiitembaldo_r3
boolean visible = false
integer taborder = 70
end type

type pb_delete from w_inheritance`pb_delete within w_oiitembaldo_r3
boolean visible = false
integer taborder = 80
end type

type pb_insert from w_inheritance`pb_insert within w_oiitembaldo_r3
boolean visible = false
integer taborder = 90
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiitembaldo_r3
integer x = 3305
integer y = 56
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area, ls_custno, ls_itemno[], ls_sdate, ls_edate, ls_salesman, ls_team, ls_gubun
long ll_trow, i

if em_1.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = "" then
	MessageBox("확인","출고기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","출고기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

// 일자
ls_sdate = em_1.text
ls_edate = em_2.text

// 사업장
dw_area.accepttext()
ls_area  = trim(dw_area.object.area[1])
ls_area  = LeftA(ls_area,1) + "%"

// 담당자
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]

// 거래처
dw_cust.accepttext()
ls_custno = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then
	MessageBox("확인","거래처를 선택하세요!",information!)
	dw_cust.setfocus()
	RETURN
end if

// 품목선택
gs_where2 lst_whitemret

//lst_whitemret.chk = "S"
lst_whitemret.chk = "M"
OpenWithParm( w_whitemselectmulti_w, lst_whitemret )
lst_whitemret = Message.PowerObjectParm

//if lst_whitemret.chk = "Y" then
//	ls_itemno = lst_whitemret.str1[1]
//else
//	ls_itemno = "%"
//end if

if lst_whitemret.chk = "Y" then
	ll_trow	= upperbound(lst_whitemret.str1)
	for i = 1 to ll_trow
		ls_itemno[i] = lst_whitemret.str1[i]
	next
	ls_gubun	= 'Not%'
else
	ls_itemno[1]	= '%'
	ls_gubun 	= "%"	
end if

// 팀
if cbx_team.checked = true then
	ls_team = "%"
else
	ls_team = "N"
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

debugbreak()

if cbx_1.checked = true then
	dw_3.reset()
	dw_3.retrieve( ls_area, ls_custno, ls_itemno, ls_sdate, ls_edate, ls_salesman, ls_team, ls_gubun )
	if dw_3.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
		RETURN
	end if
else
	dw_1.reset()
	dw_1.retrieve( ls_area, ls_custno, ls_itemno, ls_sdate, ls_edate, ls_salesman, ls_team, ls_gubun )
	if dw_1.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
		RETURN
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiitembaldo_r3
integer x = 2181
integer y = 0
integer width = 1070
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oiitembaldo_r3
integer y = 244
integer width = 4489
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oiitembaldo_r3
integer x = 3264
integer y = 0
integer width = 832
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oiitembaldo_r3
integer x = 64
integer y = 184
integer width = 101
integer height = 68
integer taborder = 0
boolean enabled = false
string dataobject = "d_oiitemdobal_r"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type pb_1 from picturebutton within w_oiitembaldo_r3
event mousemove pbm_mousemove
integer x = 3497
integer y = 56
integer width = 187
integer height = 144
integer taborder = 50
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

if cbx_1.checked = true then
	dwxls  = dw_3
else
	dwxls  = dw_1
end if

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

type st_3 from statictext within w_oiitembaldo_r3
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_oiitembaldo_r3
integer x = 274
integer y = 292
integer width = 480
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_oiitembaldo_r3
integer x = 315
integer y = 304
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oiitembaldo_r3
integer x = 773
integer y = 308
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

type sle_value from singlelineedit within w_oiitembaldo_r3
integer x = 1262
integer y = 300
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oiitembaldo_r3
integer x = 1833
integer y = 300
integer width = 160
integer height = 76
integer taborder = 80
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

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw  = dw_1
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiitembaldo_r3
integer x = 1998
integer y = 300
integer width = 160
integer height = 76
integer taborder = 90
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

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw  = dw_1
end if

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiitembaldo_r3
integer x = 2162
integer y = 300
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw  = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiitembaldo_r3
integer x = 2327
integer y = 300
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

if cbx_1.checked = true then
	arg_dw  = dw_3
else
	arg_dw  = dw_1
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_5 from statictext within w_oiitembaldo_r3
integer x = 2208
integer y = 44
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "주문일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_1 from editmask within w_oiitembaldo_r3
integer x = 2501
integer y = 44
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
string displaydata = "~r"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//	em_2.text = this.text
//end if
//
end event

type em_2 from editmask within w_oiitembaldo_r3
integer x = 2866
integer y = 44
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
string displaydata = "himage"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_7 from statictext within w_oiitembaldo_r3
integer x = 2208
integer y = 132
integer width = 288
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자팀"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_team from checkbox within w_oiitembaldo_r3
integer x = 2510
integer y = 148
integer width = 59
integer height = 56
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;// 팀
string ls_userid

dw_sales.accepttext()
ls_userid = dw_sales.object.user[1]

if this.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type dw_sales from datawindow within w_oiitembaldo_r3
integer x = 2587
integer y = 128
integer width = 329
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
long   ll_row, ll_seq
string ls_userid

for ll_row = 1 to idwc_user.rowcount()
	ls_userid = idwc_user.getitemstring(ll_row, "user_id")
	SELECT isnull(seq,99) INTO :ll_seq FROM opeom_org WHERE user_id = :ls_userid;
	if gs_userid = ls_userid then
		idwc_user.setitem(ll_row, "seq", 0)
	else
		idwc_user.setitem(ll_row, "seq", ll_seq)
	end if
next
idwc_user.setfilter( "seq A" )
idwc_user.sort()
this.accepttext()

end event

event itemchanged;//
string ls_userid, ls_myauth
long   ll_row, ll_find

this.accepttext()
ls_userid = this.object.user[1]

// 거래처
dw_cust.enabled = true
dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)

dw_cust.SetTransObject(SQLCA)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("물품별 미출고현황(ALL)", gs_userid) = "Y" then
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( ls_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_cust.object.cust_no[1] = "ALL"
end if

// 팀
if cbx_team.checked = true then
	idwc_cust.setfilter( "" )
	idwc_cust.filter()
else
	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
	idwc_cust.filter()
end if

end event

type st_6 from statictext within w_oiitembaldo_r3
integer x = 1285
integer y = 44
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiitembaldo_r3
integer x = 1522
integer y = 44
integer width = 526
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type dw_cust from datawindow within w_oiitembaldo_r3
integer x = 1522
integer y = 128
integer width = 617
integer height = 88
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

type st_8 from statictext within w_oiitembaldo_r3
integer x = 1285
integer y = 132
integer width = 233
integer height = 80
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oiitembaldo_r3
integer x = 1143
integer y = 808
integer width = 2441
integer height = 856
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oisaletoret_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cbx_1 from checkbox within w_oiitembaldo_r3
integer x = 2519
integer y = 308
integer width = 942
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주/생산/출고/반품 내역"
end type

event clicked;//
if this.checked = true then
	dw_3.visible = true
	dw_1.visible = false
else
	dw_1.visible = true
	dw_3.visible = false
end if

end event

type cbx_hap from checkbox within w_oiitembaldo_r3
integer x = 3461
integer y = 280
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
cbx_haphd.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type cbx_haphd from checkbox within w_oiitembaldo_r3
integer x = 3461
integer y = 340
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계숨김"
end type

event clicked;// 합계숨김
cbx_hap.checked = false

dw_1.setredraw( false )
if this.checked = true then
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=0")	   // 소계 숨김
else
	dw_1.Modify("DataWindow.Detail.Height=76")		// Detail
	dw_1.Modify("DataWindow.Trailer.1.Height=72")	// 소계 숨김
end if
dw_1.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oiitembaldo_r3
integer x = 951
integer y = 292
integer width = 302
integer height = 500
integer taborder = 180
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

type gb_4 from groupbox within w_oiitembaldo_r3
integer x = 1253
integer width = 910
integer height = 232
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

