$PBExportHeader$w_orsaleclose_r.srw
$PBExportComments$판매수주마감현황
forward 
global type w_orsaleclose_r from w_inheritance
end type
type st_4 from statictext within w_orsaleclose_r
end type
type ddlb_fld from dropdownlistbox within w_orsaleclose_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaleclose_r
end type
type st_5 from statictext within w_orsaleclose_r
end type
type ddlb_op from dropdownlistbox within w_orsaleclose_r
end type
type sle_value from singlelineedit within w_orsaleclose_r
end type
type cb_1 from commandbutton within w_orsaleclose_r
end type
type cb_2 from commandbutton within w_orsaleclose_r
end type
type cb_3 from commandbutton within w_orsaleclose_r
end type
type cb_5 from commandbutton within w_orsaleclose_r
end type
type pb_1 from picturebutton within w_orsaleclose_r
end type
type st_1 from statictext within w_orsaleclose_r
end type
type st_7 from statictext within w_orsaleclose_r
end type
type cbx_1 from checkbox within w_orsaleclose_r
end type
type st_2 from statictext within w_orsaleclose_r
end type
type em_sdate from editmask within w_orsaleclose_r
end type
type em_edate from editmask within w_orsaleclose_r
end type
type cb_saleclose from commandbutton within w_orsaleclose_r
end type
end forward

global type w_orsaleclose_r from w_inheritance
integer width = 4343
integer height = 2360
string title = "수주마감현황(w_orsaleclose_r)"
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
st_1 st_1
st_7 st_7
cbx_1 cbx_1
st_2 st_2
em_sdate em_sdate
em_edate em_edate
cb_saleclose cb_saleclose
end type
global w_orsaleclose_r w_orsaleclose_r

on w_orsaleclose_r.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.st_1=create st_1
this.st_7=create st_7
this.cbx_1=create cbx_1
this.st_2=create st_2
this.em_sdate=create em_sdate
this.em_edate=create em_edate
this.cb_saleclose=create cb_saleclose
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.cbx_1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.em_sdate
this.Control[iCurrent+17]=this.em_edate
this.Control[iCurrent+18]=this.cb_saleclose
end on

on w_orsaleclose_r.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.em_sdate)
destroy(this.em_edate)
destroy(this.cb_saleclose)
end on

event open;call super::open;//
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

// 일자
string ls_sdate

SELECT top 1 convert(char(10), dateadd(mm, -3, getdate()) - day(getdate()), 111)
  INTO :ls_sdate
  FROM LOGIN;

em_sdate.text = ls_sdate
em_edate.text = string(today(), 'yyyy/mm/dd')
  
// 집계보기
dw_2.visible  = false

pb_insert.visible = false
pb_delete.visible = false
pb_save.visible   = false

pb_retrieve.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_orsaleclose_r
integer x = 430
integer y = 180
integer width = 101
integer height = 76
end type

event pb_save::clicked;call super::clicked;// 저장
long	 ll_row
datetime ldt_sysdate
string ls_name, ls_phone, ls_intimate, ls_worker

dw_1.accepttext()

for ll_row = 1 to dw_1.rowcount()
	ldt_sysdate = dw_1.object.sys_date[ll_row]
	ls_intimate = dw_1.object.intimate[ll_row]
	ls_name     = GF_ReplaceAll(dw_1.object.name[ll_row]," ","")
	dw_1.object.name[ll_row] = ls_name
	
	ls_phone    = dw_1.object.phone[ll_row]
	ls_worker   = dw_1.object.worker[ll_row]
	
	if isnull(ls_name) OR isnull(ls_phone) OR ls_name = "" OR ls_phone = "" then
		MessageBox("확인","이름과 연락처는 공난으로 등록할 수 없습니다.")
		dw_1.scrolltorow( ll_row )
		RETURN
	end if
	
	// 종사분야
	choose case ls_worker
		case "시행사", "설계처", "감리처", "건설사", "시공업체", "인테리어", "유통업체"
			
		case else
			MessageBox("확인","등록된 종사분야 값이 아니면 등록할 수 없습니다.")
			dw_1.scrolltorow( ll_row )
			RETURN
	end choose
	
	// 친밀도
	choose case ls_intimate
		case "상", "중", "하"
			
		case else
			MessageBox("확인","친밀도는 '상', '중', '하' 중에서 입력하시기 바랍니다.")
			dw_1.scrolltorow( ll_row )
			RETURN
	end choose
	
	if isnull(ldt_sysdate) then
		dw_1.object.sys_date[ll_row] = gf_today()
	end if
next

wf_update1(dw_1, "Y")
//dw_1.ReSelectRow()

end event

type dw_1 from w_inheritance`dw_1 within w_orsaleclose_r
integer x = 32
integer y = 452
integer width = 4238
integer height = 1764
string dataobject = "d_orsale_close"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

//This.SelectRow(0,  false)
//This.SelectRow(row, TRUE)

GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_orsaleclose_r
integer x = 32
integer y = 24
integer width = 1184
integer height = 136
string text = "판매수주마감 현황"
end type

type st_tips from w_inheritance`st_tips within w_orsaleclose_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleclose_r
boolean visible = false
integer x = 2528
integer y = 64
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleclose_r
boolean visible = false
integer x = 3680
integer y = 64
end type

type pb_close from w_inheritance`pb_close within w_orsaleclose_r
integer x = 2784
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleclose_r
integer x = 2400
integer y = 64
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 로그를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 6, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleclose_r
boolean visible = false
integer x = 3296
integer y = 64
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleclose_r
integer x = 325
integer y = 180
integer width = 101
integer height = 76
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleclose_r
integer x = 219
integer y = 180
integer width = 101
integer height = 76
end type

event pb_insert::clicked;call super::clicked;// 추가
long  ll_row, ll_calcday
date  ld_sysdate, ld_today

ld_today   = date(gf_today())

if dw_1.rowcount() > 0 then
	ll_row  = dw_1.getrow()
else
	ll_row = 0
end if

ll_row  = dw_1.insertrow(ll_row)

dw_1.object.emp_name[ll_row]		= gs_username
dw_1.object.emp_company[ll_row]	= "(주)유창"
//dw_1.object.emp_rank[ll_row]     = ""
dw_1.object.sys_date[ll_row]     = ld_today

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleclose_r
integer x = 2203
integer y = 64
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sdate, ls_edate

ls_sdate  = em_sdate.text
ls_edate  = em_edate.text
dw_1.retrieve( ls_sdate, ls_edate )

end event

type gb_3 from w_inheritance`gb_3 within w_orsaleclose_r
integer x = 1280
integer y = 16
integer width = 864
integer height = 224
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleclose_r
integer y = 248
integer width = 4238
integer height = 184
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleclose_r
integer x = 2171
integer y = 16
integer width = 827
integer height = 224
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleclose_r
integer x = 59
integer y = 180
integer width = 137
integer height = 80
string dataobject = "d_orsale_close_ct"
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
This.SelectRow(0,  false)
This.SelectRow(row, TRUE)

end event

type st_4 from statictext within w_orsaleclose_r
integer x = 82
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_orsaleclose_r
integer x = 270
integer y = 312
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

type ddlb_dwtitles from dropdownlistbox within w_orsaleclose_r
integer x = 302
integer y = 320
integer width = 347
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

type st_5 from statictext within w_orsaleclose_r
integer x = 786
integer y = 328
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

type ddlb_op from dropdownlistbox within w_orsaleclose_r
integer x = 955
integer y = 312
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

type sle_value from singlelineedit within w_orsaleclose_r
integer x = 1275
integer y = 316
integer width = 567
integer height = 80
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

type cb_1 from commandbutton within w_orsaleclose_r
integer x = 1847
integer y = 320
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_2 from commandbutton within w_orsaleclose_r
integer x = 2011
integer y = 320
integer width = 160
integer height = 76
integer taborder = 140
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_orsaleclose_r
integer x = 2176
integer y = 320
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_orsaleclose_r
integer x = 2341
integer y = 320
integer width = 160
integer height = 76
integer taborder = 160
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_orsaleclose_r
event mousemove pbm_mousemove
integer x = 2592
integer y = 64
integer width = 187
integer height = 144
integer taborder = 70
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_cnt

ll_cnt = dw_1.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_1 from statictext within w_orsaleclose_r
integer x = 3026
integer y = 52
integer width = 1198
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "수주관리에서 수주마감 요청한 내용."
boolean focusrectangle = false
end type

type st_7 from statictext within w_orsaleclose_r
integer x = 3026
integer y = 148
integer width = 1198
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "수신자에게는 문자발송된 내용."
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_orsaleclose_r
integer x = 2514
integer y = 332
integer width = 361
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "집계보기"
end type

event clicked;// 집계보기
string ls_sdate, ls_edate

ls_sdate  = em_sdate.text
ls_edate  = em_edate.text

if this.checked = true then
	dw_2.visible = true
	dw_2.retrieve( ls_sdate, ls_edate )
else
	dw_2.visible = false
end if

end event

type st_2 from statictext within w_orsaleclose_r
integer x = 1303
integer y = 60
integer width = 809
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "요청일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_sdate from editmask within w_orsaleclose_r
integer x = 1303
integer y = 136
integer width = 402
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
alignment alignment = center!
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

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_sdate.text
lstr_calendar.edate = em_edate.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_sdate.text = lstr_calendar.sdate
	em_edate.text = lstr_calendar.edate
end if

////
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_edate from editmask within w_orsaleclose_r
integer x = 1710
integer y = 136
integer width = 402
integer height = 80
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
string displaydata = ""
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_sdate.text
lstr_calendar.edate = em_edate.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_sdate.text = lstr_calendar.sdate
	em_edate.text = lstr_calendar.edate
end if


end event

type cb_saleclose from commandbutton within w_orsaleclose_r
integer x = 2907
integer y = 312
integer width = 709
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "판매수주마감관리"
end type

event clicked;//
string ls_orderno
long   ll_row

if GF_Permission('판매수주마감관리_사용가능자', gs_userid) = 'Y' then
else
	MessageBox("확인","판매수주마감관리_사용가능자 가 아닙니다.")
	RETURN
end if

if dw_1.rowcount() < 1 then RETURN

ll_row = dw_1.getrow()
ls_orderno = GF_ReplaceAll(dw_1.object.order_no[ll_row],"-","")

if IsValid(w_orsaleclose_m) = false then 
	OpenSheet(w_orsaleclose_m, w_all_main, 6, Layered!)
end if

if isnull(ls_orderno) OR ls_orderno = "" then
else
	w_orsaleclose_m.em_3.text = ls_orderno
end if
w_orsaleclose_m.pb_insert.PostEvent( clicked! )

end event

