$PBExportHeader$w_orsalecreditstate.srw
$PBExportComments$거래선 여신현황
forward
global type w_orsalecreditstate from w_inheritance
end type
type st_5 from statictext within w_orsalecreditstate
end type
type ddlb_fld from dropdownlistbox within w_orsalecreditstate
end type
type ddlb_dwtitles from dropdownlistbox within w_orsalecreditstate
end type
type st_6 from statictext within w_orsalecreditstate
end type
type ddlb_op from dropdownlistbox within w_orsalecreditstate
end type
type sle_value from singlelineedit within w_orsalecreditstate
end type
type cb_1 from commandbutton within w_orsalecreditstate
end type
type cb_2 from commandbutton within w_orsalecreditstate
end type
type cb_3 from commandbutton within w_orsalecreditstate
end type
type cb_5 from commandbutton within w_orsalecreditstate
end type
type pb_1 from picturebutton within w_orsalecreditstate
end type
type st_7 from statictext within w_orsalecreditstate
end type
type dw_sales from datawindow within w_orsalecreditstate
end type
type dw_imwon_sales from datawindow within w_orsalecreditstate
end type
end forward

global type w_orsalecreditstate from w_inheritance
integer x = 23
integer y = 112
integer width = 6775
integer height = 5420
string title = "담당자별 거래처 여신한도현황(w_orsalecreditstate)"
st_5 st_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
st_7 st_7
dw_sales dw_sales
dw_imwon_sales dw_imwon_sales
end type
global w_orsalecreditstate w_orsalecreditstate

type variables
integer ii_month, ii_idx
datawindowchild idwc_user, idwc_imwon_user

end variables

on w_orsalecreditstate.create
int iCurrent
call super::create
this.st_5=create st_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.st_7=create st_7
this.dw_sales=create dw_sales
this.dw_imwon_sales=create dw_imwon_sales
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.dw_sales
this.Control[iCurrent+14]=this.dw_imwon_sales
end on

on w_orsalecreditstate.destroy
call super::destroy
destroy(this.st_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.st_7)
destroy(this.dw_sales)
destroy(this.dw_imwon_sales)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_select, ls_clause, ls_where

//공통
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_2.visible = false

// 담당자
dw_sales.SetTransObject(SQLCA)
dw_sales.getchild("user",idwc_user)
idwc_user.SetTransObject(sqlca)

dw_imwon_sales.SetTransObject(SQLCA)
dw_imwon_sales.getchild("user",idwc_imwon_user)
idwc_imwon_user.SetTransObject(sqlca)
	
idwc_imwon_user.retrieve( "%" )

idwc_imwon_user.insertrow(1)
idwc_imwon_user.setitem(1,"user_id","%")
idwc_imwon_user.setitem(1,"user_name","전체")
idwc_imwon_user.accepttext()
dw_imwon_sales.object.user[1] = "%"

if GF_Permission("영업사원_총괄현황(ALL)", gs_userid) = "Y" then
	idwc_user.retrieve( "%" )
	idwc_user.insertrow(1)
	idwc_user.setitem(1,"user_id","%")
	idwc_user.setitem(1,"user_name","전체")
	idwc_user.accepttext()
	dw_sales.object.user[1] = "%"

	idwc_imwon_user.retrieve( "%" )
	idwc_imwon_user.insertrow(1)
	idwc_imwon_user.setitem(1,"user_id","%")
	idwc_imwon_user.setitem(1,"user_name","전체")
	idwc_imwon_user.accepttext()
	dw_imwon_sales.object.user[1] = "%"
else
	idwc_user.retrieve( gs_userid )
	if idwc_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
	else
		// 거래처가 없는 담당자(임원)
		idwc_user.insertrow(1)
		idwc_user.setitem(1,"user_id",gs_userid)
		idwc_user.setitem(1,"user_name",gs_username)
		idwc_user.accepttext()

	end if
	
	dw_sales.object.user[1] = gs_userid 
	
	idwc_imwon_user.retrieve( gs_userid )
	if idwc_imwon_user.find( "user_id = '" + gs_userid + "' ", 1, idwc_user.rowcount() ) > 0 then
	else
		// 거래처가 없는 담당자(임원)
		idwc_imwon_user.insertrow(1)
		idwc_imwon_user.setitem(1,"user_id",gs_userid)
		idwc_imwon_user.setitem(1,"user_name",gs_username)
		idwc_imwon_user.accepttext()

	end if
	
	dw_imwon_sales.object.user[1] = gs_userid	
end if
dw_sales.setfocus()
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32



end event

type pb_save from w_inheritance`pb_save within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer width = 82
integer taborder = 100
end type

type dw_1 from w_inheritance`dw_1 within w_orsalecreditstate
integer x = 32
integer y = 436
integer width = 4293
integer height = 1980
integer taborder = 0
string dataobject = "d_orsalecreditstate01"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_orsalecreditstate
integer x = 32
integer y = 20
integer width = 1632
integer height = 140
string text = "담당자별 거래처 여신한도현황"
end type

type st_tips from w_inheritance`st_tips within w_orsalecreditstate
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer width = 46
integer taborder = 260
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 80
end type

type pb_close from w_inheritance`pb_close within w_orsalecreditstate
integer x = 5463
integer y = 72
integer taborder = 60
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsalecreditstate
integer x = 5070
integer y = 72
integer taborder = 50
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then RETURN

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 담당자별 거래처 여신한도 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=74'
OpenSheetWithParm( w_print, l_print, ParentWindow(), 1, Original! )
end event

type pb_cancel from w_inheritance`pb_cancel within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 300
end type

type pb_delete from w_inheritance`pb_delete within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 320
end type

type pb_insert from w_inheritance`pb_insert within w_orsalecreditstate
boolean visible = false
integer x = 0
integer y = 0
integer width = 55
integer taborder = 340
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsalecreditstate
event ue_1 pbm_custom01
event ue_all pbm_custom02
integer x = 4878
integer y = 72
integer taborder = 30
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_month, ls_date, ls_custname, ls_userid, ls_rotate, ls_coll, ls_colllevel, ls_top_level, ls_top_level1, ls_top_level2
long   ll_year, ll_row, ll_col, ll_found
decimal   ll_custsort

dw_1.reset()
dw_2.reset()

// 담당자
if dw_sales.accepttext() = -1 then return
ls_userid = dw_sales.object.user[1]

dw_1.retrieve(ls_userid)
dw_1.sharedata(dw_2)
//dw_2.retrieve(ls_userid)

MessageBox("확인","조회완료")


end event

type gb_3 from w_inheritance`gb_3 within w_orsalecreditstate
integer x = 1719
integer y = 16
integer width = 512
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_orsalecreditstate
integer y = 248
integer width = 4293
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsalecreditstate
integer x = 4846
integer y = 16
integer width = 841
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsalecreditstate
integer x = 155
integer y = 176
integer width = 114
integer height = 80
integer taborder = 160
string dataobject = "d_orsalecreditstate02"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_5 from statictext within w_orsalecreditstate
integer x = 119
integer y = 320
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

type ddlb_fld from dropdownlistbox within w_orsalecreditstate
integer x = 306
integer y = 304
integer width = 480
integer height = 632
integer taborder = 230
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

type ddlb_dwtitles from dropdownlistbox within w_orsalecreditstate
integer x = 375
integer y = 320
integer width = 329
integer height = 88
integer taborder = 270
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

type st_6 from statictext within w_orsalecreditstate
integer x = 823
integer y = 320
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

type ddlb_op from dropdownlistbox within w_orsalecreditstate
integer x = 992
integer y = 304
integer width = 297
integer height = 512
integer taborder = 280
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

type sle_value from singlelineedit within w_orsalecreditstate
integer x = 1312
integer y = 308
integer width = 567
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_orsalecreditstate
integer x = 1893
integer y = 308
integer width = 160
integer height = 76
integer taborder = 200
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
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Filter( arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_orsalecreditstate
integer x = 2057
integer y = 308
integer width = 160
integer height = 76
integer taborder = 240
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;DataWindow arg_dw

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_orsalecreditstate
integer x = 2222
integer y = 308
integer width = 160
integer height = 76
integer taborder = 290
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

type cb_5 from commandbutton within w_orsalecreditstate
integer x = 2386
integer y = 308
integer width = 160
integer height = 76
integer taborder = 310
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

type pb_1 from picturebutton within w_orsalecreditstate
event mousemove pbm_mousemove
string tag = "파일"
integer x = 5266
integer y = 72
integer width = 187
integer height = 144
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	//   "파워빌더리포트 (*.PSR),*.PSR," + &
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)				
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
		MessageBox("확인", "작업완료")
	end if
end if

end event

type st_7 from statictext within w_orsalecreditstate
integer x = 1751
integer y = 56
integer width = 329
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sales from datawindow within w_orsalecreditstate
integer x = 1751
integer y = 136
integer width = 329
integer height = 88
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whlogin_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
string ls_userid
long   ll_row, ll_seq

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

end event

event itemchanged;////
//string ls_userid, ls_myauth
//long   ll_row, ll_find
//
//this.accepttext()
//ls_userid = this.object.user[1]
//
//// 거래처
//dw_cust.enabled = true
//dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)
//
//dw_cust.SetTransObject(SQLCA)
//dw_cust.getchild("cust_no", idwc_cust)
//idwc_cust.SetTransObject(sqlca)
//
//if GF_Permission("영업사원_총괄현황(ALL)", gs_userid) = "Y" then
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "%")
//	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "%"
//else
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "ALL"
//end if
//
//// 팀
//if cbx_team.checked = true then
//	idwc_cust.setfilter( "" )
//	idwc_cust.filter()
//else
//	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
//	idwc_cust.filter()
//end if
//this.accepttext()
//
end event

type dw_imwon_sales from datawindow within w_orsalecreditstate
boolean visible = false
integer x = 1842
integer y = 144
integer width = 329
integer height = 88
integer taborder = 150
boolean bringtotop = true
string dataobject = "d_whlogin_imwon_opeom"
boolean border = false
boolean livescroll = true
end type

event getfocus;// 순번정렬
string ls_userid
long   ll_row, ll_seq

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

end event

event itemchanged;////
//string ls_userid, ls_myauth
//long   ll_row, ll_find
//
//this.accepttext()
//ls_userid = this.object.user[1]
//
//// 거래처
//dw_cust.enabled = true
//dw_cust.object.cust_no.Background.Color = rgb(255, 255, 255)
//
//dw_cust.SetTransObject(SQLCA)
//dw_cust.getchild("cust_no", idwc_cust)
//idwc_cust.SetTransObject(sqlca)
//
//if GF_Permission("영업사원_총괄현황(ALL)", gs_userid) = "Y" then
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "%")
//	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "%"
//else
//	idwc_cust.retrieve( ls_userid )
//	idwc_cust.insertrow(1)
//	idwc_cust.setitem(1, "cust_no", "ALL")
//	idwc_cust.setitem(1, "cust_name", "1.담당전체")
//	idwc_cust.accepttext()
//	dw_cust.object.cust_no[1] = "ALL"
//end if
//
//// 팀
//if cbx_team.checked = true then
//	idwc_cust.setfilter( "" )
//	idwc_cust.filter()
//else
//	idwc_cust.setfilter( "salesman = '" + ls_userid + "' OR cust_no IN ('%', 'ALL') " )
//	idwc_cust.filter()
//end if
//this.accepttext()
//
end event

