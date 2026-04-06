$PBExportHeader$w_relation_net.srw
$PBExportComments$인적네트워크[2006.09.29 이기영]
forward 
global type w_relation_net from w_inheritance
end type
type st_4 from statictext within w_relation_net
end type
type ddlb_fld from dropdownlistbox within w_relation_net
end type
type ddlb_dwtitles from dropdownlistbox within w_relation_net
end type
type st_5 from statictext within w_relation_net
end type
type ddlb_op from dropdownlistbox within w_relation_net
end type
type sle_value from singlelineedit within w_relation_net
end type
type cb_1 from commandbutton within w_relation_net
end type
type cb_2 from commandbutton within w_relation_net
end type
type cb_3 from commandbutton within w_relation_net
end type
type cb_5 from commandbutton within w_relation_net
end type
type pb_1 from picturebutton within w_relation_net
end type
type cbx_phone from checkbox within w_relation_net
end type
type cbx_emp from checkbox within w_relation_net
end type
type st_6 from statictext within w_relation_net
end type
type st_3 from statictext within w_relation_net
end type
type st_2 from statictext within w_relation_net
end type
type cbx_edit from checkbox within w_relation_net
end type
type st_1 from statictext within w_relation_net
end type
type st_7 from statictext within w_relation_net
end type
type cbx_1 from checkbox within w_relation_net
end type
end forward

global type w_relation_net from w_inheritance
integer width = 4347
integer height = 2348
string title = "CRM 네트워크현황[w_relation_net]"
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
cbx_phone cbx_phone
cbx_emp cbx_emp
st_6 st_6
st_3 st_3
st_2 st_2
cbx_edit cbx_edit
st_1 st_1
st_7 st_7
cbx_1 cbx_1
end type
global w_relation_net w_relation_net

on w_relation_net.create
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
this.cbx_phone=create cbx_phone
this.cbx_emp=create cbx_emp
this.st_6=create st_6
this.st_3=create st_3
this.st_2=create st_2
this.cbx_edit=create cbx_edit
this.st_1=create st_1
this.st_7=create st_7
this.cbx_1=create cbx_1
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
this.Control[iCurrent+12]=this.cbx_phone
this.Control[iCurrent+13]=this.cbx_emp
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.cbx_edit
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.cbx_1
end on

on w_relation_net.destroy
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
destroy(this.cbx_phone)
destroy(this.cbx_emp)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_edit)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.cbx_1)
end on

event open;call super::open;//
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

// 집계보기
dw_2.visible  = false

// 연락처 보기
cbx_phone.enabled = false
dw_1.object.phone.width  = 0

// 담당자 보기
cbx_emp.enabled = false
dw_1.object.emp_name.width  = 0
dw_1.object.emp_company.width  = 0
dw_1.object.emp_rank.width  = 0

if GF_Permission( "CRM 네트워크_ALL", gs_userid ) = "Y" then
	cbx_phone.enabled = true
	cbx_emp.enabled   = true
else
	if GF_Permission( "CRM 네트워크_연락처", gs_userid ) = "Y" then cbx_phone.enabled = true
	if GF_Permission( "CRM 네트워크_담당자", gs_userid ) = "Y" then cbx_emp.enabled   = true
end if

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 73

dw_1.width  = newwidth  - 73
dw_1.height = newheight - 560

dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_relation_net
integer x = 3374
integer y = 64
end type

event pb_save::clicked;call super::clicked;// 저장
long	 ll_row
datetime ldt_sysdate
string ls_name, ls_phone, ls_intimate, ls_worker

dw_1.accepttext()

debugbreak()

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
			dw_1.scrolltorow( ll_row )
			MessageBox("확인","등록된 종사분야["+ls_worker+"] 값이 아니면 등록할 수 없습니다.")
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

type dw_1 from w_inheritance`dw_1 within w_relation_net
integer x = 32
integer y = 532
integer width = 4238
integer height = 1684
string dataobject = "d_crmnetwork_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
//This.SelectRow(0,  false)
//This.SelectRow(row, TRUE)

end event

type st_title from w_inheritance`st_title within w_relation_net
integer y = 32
integer width = 1184
integer height = 140
string text = "CRM 네트워크현황"
end type

type st_tips from w_inheritance`st_tips within w_relation_net
end type

type pb_compute from w_inheritance`pb_compute within w_relation_net
boolean visible = false
integer x = 2528
integer y = 64
end type

type pb_print_part from w_inheritance`pb_print_part within w_relation_net
boolean visible = false
integer x = 3680
integer y = 64
end type

type pb_close from w_inheritance`pb_close within w_relation_net
integer x = 3561
integer y = 64
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_relation_net
integer x = 2985
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

type pb_cancel from w_inheritance`pb_cancel within w_relation_net
boolean visible = false
integer x = 3296
integer y = 64
end type

type pb_delete from w_inheritance`pb_delete within w_relation_net
integer x = 2789
integer y = 64
end type

event pb_delete::clicked;call super::clicked;// 삭제
long  	ll_row, ll_calcday
date  	ld_sysdate, ld_today
string   ls_username

if dw_1.rowcount() < 1 then RETURN

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.chkedit[ll_row] = "X"
next
cbx_edit.checked = false

//
ll_row = dw_1.getrow()
ld_sysdate = date(dw_1.object.sys_date[ll_row])
ld_today   = date(gf_today())

//ll_calcday  = DaysAfter(ld_sysdate, ld_today)
//if ll_calcday > 7 then
//	MessageBox("확인","등록 후 7일이 경과된 데이터는 삭제 할 수 없습니다.")
//	RETURN
//end if

ls_username = dw_1.object.emp_name[ll_row]
if ls_username <> gs_username then
	MessageBox("확인","본인 자료만 삭제할 수 있습니다.")
	RETURN
end if

dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_relation_net
integer x = 2592
integer y = 64
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

type pb_retrieve from w_inheritance`pb_retrieve within w_relation_net
integer x = 2395
integer y = 64
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_relation_net
integer x = 1248
integer y = 16
integer width = 1097
integer height = 224
integer textsize = -8
integer weight = 400
long textcolor = 16711680
string text = "친밀도"
end type

type gb_2 from w_inheritance`gb_2 within w_relation_net
integer y = 248
integer width = 4238
integer height = 172
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_relation_net
integer x = 2363
integer y = 16
integer width = 1413
integer height = 224
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_relation_net
integer x = 41
integer y = 192
integer width = 87
integer height = 68
string dataobject = "d_crmnetwork_ct"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_relation_net
integer x = 82
integer y = 316
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

type ddlb_fld from dropdownlistbox within w_relation_net
integer x = 270
integer y = 300
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

type ddlb_dwtitles from dropdownlistbox within w_relation_net
integer x = 302
integer y = 308
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

type st_5 from statictext within w_relation_net
integer x = 786
integer y = 316
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

type ddlb_op from dropdownlistbox within w_relation_net
integer x = 955
integer y = 300
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

type sle_value from singlelineedit within w_relation_net
integer x = 1275
integer y = 304
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

type cb_1 from commandbutton within w_relation_net
integer x = 1847
integer y = 308
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

type cb_2 from commandbutton within w_relation_net
integer x = 2011
integer y = 308
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

type cb_3 from commandbutton within w_relation_net
integer x = 2176
integer y = 308
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

type cb_5 from commandbutton within w_relation_net
integer x = 2341
integer y = 308
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

type pb_1 from picturebutton within w_relation_net
event mousemove pbm_mousemove
integer x = 3177
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

type cbx_phone from checkbox within w_relation_net
integer x = 2528
integer y = 320
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "연락처 보기"
end type

event clicked;// 연락처 보기
if this.checked = true then
	dw_1.object.phone.width  = 507
else
	dw_1.object.phone.width  = 0
end if

end event

type cbx_emp from checkbox within w_relation_net
integer x = 3008
integer y = 320
integer width = 448
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "담당자 보기"
end type

event clicked;// 담당자 보기
if this.checked = true then
	dw_1.object.emp_name.width  = 302
	dw_1.object.emp_company.width  = 558
	dw_1.object.emp_rank.width  = 238
else
	dw_1.object.emp_name.width  = 0
	dw_1.object.emp_company.width  = 0
	dw_1.object.emp_rank.width  = 0
end if

end event

type st_6 from statictext within w_relation_net
integer x = 1307
integer y = 176
integer width = 1001
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "하: 연락처 정도만 가지고 있다."
boolean focusrectangle = false
end type

type st_3 from statictext within w_relation_net
integer x = 1307
integer y = 124
integer width = 1001
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "중: 단순정보 정도는 얻을 수 있다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_relation_net
integer x = 1307
integer y = 72
integer width = 1001
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "상: 친분이 있어 도움을 받을 수 있다."
boolean focusrectangle = false
end type

type cbx_edit from checkbox within w_relation_net
integer x = 3502
integer y = 320
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "수정하기"
end type

event clicked;// 수정하기
string   ls_username, ls_value
long		ll_row,  ll_editcnt

if this.checked = true then
	ls_value  = "O"
else
	ls_value  = "X"
end if

for ll_row = 1 to dw_1.rowcount()
	ls_username = dw_1.object.emp_name[ll_row]

	if ls_username = gs_username OR GF_Permission( "CRM 네트워크_ALL", gs_userid ) = "Y" then
		ll_editcnt  = ll_editcnt + 1
		dw_1.object.chkedit[ll_row] = ls_value
	end if
next

if this.checked = true then
	MessageBox("확인", string(ll_editcnt,"#,##0") + " 건을 수정할 수 있습니다.")
end if


end event

type st_1 from statictext within w_relation_net
integer x = 32
integer y = 452
integer width = 1275
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
string text = "본인(직원명) 자료만 수정, 삭제 가능."
boolean focusrectangle = false
end type

type st_7 from statictext within w_relation_net
integer x = 1326
integer y = 452
integer width = 2798
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
string text = "종사분야: 시행사, 설계처, 감리처, 건설사, 시공업체, 인테리어, 유통업체 중 선택."
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_relation_net
integer x = 3872
integer y = 320
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
if this.checked = true then
	dw_2.visible = true
	dw_2.retrieve()
else
	dw_2.visible = false
end if

end event

