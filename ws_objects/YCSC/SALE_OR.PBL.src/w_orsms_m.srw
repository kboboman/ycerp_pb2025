$PBExportHeader$w_orsms_m.srw
$PBExportComments$문자전송
forward
global type w_orsms_m from w_inheritance
end type
type gb_5 from groupbox within w_orsms_m
end type
type gb_4 from groupbox within w_orsms_m
end type
type mle_msg from multilineedit within w_orsms_m
end type
type st_2 from statictext within w_orsms_m
end type
type dw_3 from datawindow within w_orsms_m
end type
type em_to from editmask within w_orsms_m
end type
type em_from from editmask within w_orsms_m
end type
type st_4 from statictext within w_orsms_m
end type
type tab_1 from tab within w_orsms_m
end type
type tabpage_1 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cbx_1 cbx_1
st_3 st_3
dw_4 dw_4
end type
type tabpage_2 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cbx_3 from checkbox within tabpage_2
end type
type dw_5 from datawindow within tabpage_2
end type
type cbx_etc from checkbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_7 cb_7
cb_6 cb_6
cb_4 cb_4
cbx_3 cbx_3
dw_5 dw_5
cbx_etc cbx_etc
end type
type tab_1 from tab within w_orsms_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_len from statictext within w_orsms_m
end type
type cbx_mgr from checkbox within w_orsms_m
end type
type pb_2 from picturebutton within w_orsms_m
end type
type st_1 from statictext within w_orsms_m
end type
type cbx_mms from checkbox within w_orsms_m
end type
type sle_toname from singlelineedit within w_orsms_m
end type
type st_5 from statictext within w_orsms_m
end type
type st_6 from statictext within w_orsms_m
end type
type ddlb_fld from dropdownlistbox within w_orsms_m
end type
type ddlb_dwtitles from dropdownlistbox within w_orsms_m
end type
type st_7 from statictext within w_orsms_m
end type
type ddlb_op from dropdownlistbox within w_orsms_m
end type
type sle_value from singlelineedit within w_orsms_m
end type
type cbx_op from checkbox within w_orsms_m
end type
type cb_1 from commandbutton within w_orsms_m
end type
type cb_2 from commandbutton within w_orsms_m
end type
type cb_3 from commandbutton within w_orsms_m
end type
type cb_5 from commandbutton within w_orsms_m
end type
type st_8 from statictext within w_orsms_m
end type
type em_sdate from editmask within w_orsms_m
end type
type gb_6 from gb_1 within w_orsms_m
end type
end forward

global type w_orsms_m from w_inheritance
integer x = 690
integer y = 188
integer width = 3904
integer height = 3100
string title = "문자전송(w_orsms_m)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
string icon = "Asterisk!"
boolean center = true
gb_5 gb_5
gb_4 gb_4
mle_msg mle_msg
st_2 st_2
dw_3 dw_3
em_to em_to
em_from em_from
st_4 st_4
tab_1 tab_1
st_len st_len
cbx_mgr cbx_mgr
pb_2 pb_2
st_1 st_1
cbx_mms cbx_mms
sle_toname sle_toname
st_5 st_5
st_6 st_6
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_7 st_7
ddlb_op ddlb_op
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_8 st_8
em_sdate em_sdate
gb_6 gb_6
end type
global w_orsms_m w_orsms_m

type variables
gs_where istr_where

string  is_dw
boolean ib_first = false

//long il_dragsource,il_dragparent,il_droptarget
//long ih_curteam
//integer ii_chk=0
//string  is_chk = 'N'
//st_print i_print
//TreeViewitem itv_team
//
end variables

on w_orsms_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.gb_4=create gb_4
this.mle_msg=create mle_msg
this.st_2=create st_2
this.dw_3=create dw_3
this.em_to=create em_to
this.em_from=create em_from
this.st_4=create st_4
this.tab_1=create tab_1
this.st_len=create st_len
this.cbx_mgr=create cbx_mgr
this.pb_2=create pb_2
this.st_1=create st_1
this.cbx_mms=create cbx_mms
this.sle_toname=create sle_toname
this.st_5=create st_5
this.st_6=create st_6
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_7=create st_7
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_8=create st_8
this.em_sdate=create em_sdate
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.gb_4
this.Control[iCurrent+3]=this.mle_msg
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.em_to
this.Control[iCurrent+7]=this.em_from
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.tab_1
this.Control[iCurrent+10]=this.st_len
this.Control[iCurrent+11]=this.cbx_mgr
this.Control[iCurrent+12]=this.pb_2
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.cbx_mms
this.Control[iCurrent+15]=this.sle_toname
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.ddlb_fld
this.Control[iCurrent+19]=this.ddlb_dwtitles
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.ddlb_op
this.Control[iCurrent+22]=this.sle_value
this.Control[iCurrent+23]=this.cbx_op
this.Control[iCurrent+24]=this.cb_1
this.Control[iCurrent+25]=this.cb_2
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.cb_5
this.Control[iCurrent+28]=this.st_8
this.Control[iCurrent+29]=this.em_sdate
this.Control[iCurrent+30]=this.gb_6
end on

on w_orsms_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.mle_msg)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.em_to)
destroy(this.em_from)
destroy(this.st_4)
destroy(this.tab_1)
destroy(this.st_len)
destroy(this.cbx_mgr)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.cbx_mms)
destroy(this.sle_toname)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_7)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_8)
destroy(this.em_sdate)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

debugbreak()

GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

integer li_width, li_day
long    ll_row
Window  w_parent

w_parent = this.ParentWindow()

THIS.X   = (w_parent.width  - this.width)  / 2
THIS.Y   = (w_parent.height - this.height) / 2 - 150
pb_cancel.visible     = false
pb_print_part.visible = false
pb_print.visible      = false

dw_2.visible          = false

dw_3.SetTransObject(SQLCA)
ll_row = dw_3.retrieve()  // 등록문장 
dw_3.insertrow(0)

tab_1.tabpage_1.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_4.retrieve()

tab_1.tabpage_2.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_5.retrieve( gs_userid )

// 한달전
li_day = Day(today())
li_day = li_day + Day(date(string(RelativeDate(today(), - (li_day+1)), "yyyy/mm/dd")))
em_sdate.text = string(RelativeDate(today(), - li_day), "yyyy/mm/dd")

mle_msg.text = ""
em_to.text   = ""
em_from.text = "0226481998"
em_from.enabled = false
cbx_mgr.visible = false
cbx_mms.enabled = true

//string SMSSERVER, SMSCOMPANY 
//SELECT rtrim(item_nm), rtrim(bigo) INTO :SMSSERVER, :SMSCOMPANY 
//  FROM codemst 
// WHERE item_cd = 'SMSSERVER' AND use_yn = 'Y';
//if SMSCOMPANY = "LGU+" then
//	cbx_mms.checked = false
//	cbx_mms.enabled = true
//	MessageBox("확인","장문전송시에는 반드시 'KT-MMS'를 체크하시기 바랍니다.(별정사업자 변경시까지!)")
//else
//	cbx_mms.checked = true
//end if
//
if GF_Permission( "SMS발신번호수정", gs_userid ) = "Y" then
	em_from.enabled = true
end if

if GF_Permission( "SMS발신내용관리", gs_userid ) = "Y" then
	cbx_mgr.visible    = true		// 관리자
end if

string ls_office
SELECT RTRIM(BIGO) INTO :ls_office FROM CODEMST WHERE TYPE = 'SMSSEND' AND ITEM_CD = :gs_userid;
if isnull(ls_office) or ls_office = "" then
	MessageBox("확인","발신번호 미 등록시 문자전송 할 수 없습니다.")
	pb_save.enabled = false
else
	em_from.text    = ls_office
	pb_save.enabled = true
end if

// 전송내역 조회
pb_retrieve.triggerevent(Clicked!)

end event

event activate;call super::activate;//
string SMSSERVER, SMSCOMPANY

SELECT rtrim(item_nm), rtrim(bigo) INTO :SMSSERVER, :SMSCOMPANY 
  FROM YC.DBO.codemst 
 WHERE item_cd = 'SMSSERVER' AND use_yn = 'Y';
if SMSCOMPANY = "LGU+" then
	cbx_mms.enabled = true
	
	if ib_first = false then
		ib_first = true
		//MessageBox("확인","장문전송시에는 반드시 'KT-MMS'를 체크하시기 바랍니다.(별정사업자 변경시까지!)")
	end if
else
	cbx_mms.checked = true
	cbx_mms.visible = false
end if


end event

type pb_save from w_inheritance`pb_save within w_orsms_m
integer x = 3438
integer y = 56
integer taborder = 90
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_custname, ls_scenedesc
string ls_salehp, ls_scenehp, ls_custhp, ls_message, ls_sendhp, ls_phone, ls_phonename
long   ll_row

// 수신처 공난 삭제
for ll_row = 1 to dw_1.rowcount()
	ls_phone = dw_1.object.phone_no[ll_row]
	if isnull(ls_phone) or ls_phone = "" then
		dw_1.deleterow(ll_row)
	end if
next

if dw_1.rowcount() = 0 then
	MessageBox("확인","문자 수신번호가 존재하지 않습니다.")
	return
end if

if gf_permission("SMSSEND", gs_userid) = 'Y' then
	if MessageBox("확인","문자전송[" + string(dw_1.rowcount()) + "] 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		return
	end if
else
	MessageBox("확인","문자전송 권한이 없습니다.")
	return
end if


ls_sendhp   = em_from.text	
ls_message  = trim(mle_msg.text)
ls_message  = GF_ReplaceAll(ls_message,"'","`")

if LenA(ls_message) > 80 then
	if cbx_mms.checked = false then
		MessageBox("확인","장문전송시에는 반드시 'KT-MMS'를 체크하시기 바랍니다.(별정사업자 변경시까지!)")
		RETURN
	end if
end if

for ll_row = 1 to dw_1.rowcount()	
	ls_phone     = dw_1.object.phone_no[ll_row]		
	ls_phonename = dw_1.object.phone_name[ll_row]		
	
	choose case LeftA(ls_phone,3)
		case '010','011','016','017','018','019'
		case else
			ls_phone = ""
	end choose

	// 수신처
	if ls_phone = "" or isnull(ls_phone) then
	else
		// 발신자, 발신번호, 수신번호, 수신자명, 본문내용
		// GF_MMSSEND( as_userid, as_sendhp, as_recvhp, as_recvname, as_message )
		GF_MMSSEND( gs_userid, ls_sendhp, ls_phone, ls_phonename, ls_message )
	end if
next

MessageBox("확인",String(ll_row - 1,"#,##0") + " 건 전송완료")
pb_compute.TriggerEvent(Clicked!)



end event

type dw_1 from w_inheritance`dw_1 within w_orsms_m
integer x = 2299
integer y = 408
integer width = 1522
integer height = 1272
integer taborder = 0
string dataobject = "d_orsms_list"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

this.setfocus()

end event

type dw_2 from w_inheritance`dw_2 within w_orsms_m
string tag = "d_orsms_mms"
integer x = 32
integer y = 1912
integer width = 3826
integer height = 1076
integer taborder = 0
string title = "전송내용"
string dataobject = "d_orsms_mms"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_2"

if row < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

long   ll_cnt
string ls_phone, ls_val, ls_value, ls_temp = ""

choose case dwo.name
	case "tr_phone", "tr_phonename"
		em_to.text      = this.object.tr_phone[row]
		sle_toname.text = this.object.tr_phonename[row]

	case "tr_msg"
		mle_msg.text = this.object.tr_msg[row]
end choose
end event

type st_title from w_inheritance`st_title within w_orsms_m
integer y = 28
integer width = 1079
string text = "문자전송"
end type

type st_tips from w_inheritance`st_tips within w_orsms_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsms_m
integer x = 2304
integer y = 56
integer width = 325
integer taborder = 70
string text = "RESET"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;call super::clicked;//
st_len.text  = "00/2000"
mle_msg.text = ""
em_to.text   = ""
em_from.text = "0226481998"
sle_toname.text = ""

string ls_office

SELECT rtrim(bigo) INTO :ls_office FROM codemst WHERE type = 'SMSSEND' AND item_cd = :gs_userid;
if isnull(ls_office) or ls_office = "" then
	MessageBox("확인","문자전송 권한이 없습니다.")
	pb_save.enabled = false
else
	em_from.text = ls_office
	pb_save.enabled = true
end if

dw_1.reset()
dw_2.reset()
dw_3.reset()
tab_1.tabpage_1.dw_4.reset()

dw_3.retrieve()  // 등록문장 
dw_3.insertrow(0)
tab_1.tabpage_1.dw_4.retrieve()

end event

type pb_print_part from w_inheritance`pb_print_part within w_orsms_m
integer x = 859
integer y = 160
integer width = 110
integer height = 96
end type

type pb_close from w_inheritance`pb_close within w_orsms_m
integer x = 3630
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_orsms_m
integer x = 974
integer y = 160
integer width = 110
integer height = 96
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_orsms_m
integer x = 750
integer y = 160
integer width = 110
integer height = 96
integer taborder = 130
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_orsms_m
integer x = 3237
integer y = 56
integer taborder = 0
end type

event pb_delete::clicked;call super::clicked;long ll_row

if dw_1.rowcount() < 1 then return

dw_1.deleterow(dw_1.getrow())

end event

type pb_insert from w_inheritance`pb_insert within w_orsms_m
integer x = 3045
integer y = 56
integer taborder = 0
end type

event pb_insert::clicked;call super::clicked;//
long   ll_row
string ls_phone, ls_phone_name

ls_phone = trim(GF_ReplaceAll(em_to.text,"-",""))
if isnull(ls_phone) or ls_phone = "" then 
	MessageBox("확인","수신자 번호를 입력 바랍니다.")
	em_to.setfocus()
	RETURN
end if

if trim(sle_toname.text) = "" then
	MessageBox("확인","수신자명을 입력 바랍니다.")
	sle_toname.setfocus()
	RETURN
end if

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.phone_no[ll_row] = em_to.text then
		MessageBox("확인","중복된 번호가 존재 합니다.")
		RETURN
	end if
next

ll_row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_row)

dw_1.object.phone_no[ll_row]   = ls_phone
dw_1.object.phone_name[ll_row] = trim(sle_toname.text)

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsms_m
integer x = 2651
integer y = 56
integer taborder = 80
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

Integer li_day
string  ls_sdate, ls_admin

ls_sdate = em_sdate.text

if cbx_mgr.checked = true then
	ls_admin = "Y"
else
	ls_admin = "N"
end if

dw_2.visible = true
dw_2.retrieve( gs_userid, ls_sdate, string(today(),"yyyy/mm/dd"), ls_admin )

end event

type gb_3 from w_inheritance`gb_3 within w_orsms_m
integer x = 2267
integer y = 236
integer width = 1591
integer height = 1480
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79220952
string text = "수신번호"
end type

type gb_2 from w_inheritance`gb_2 within w_orsms_m
integer x = 1143
integer y = 236
integer width = 1093
integer height = 1480
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
string text = "본문(2000자, 한:2자,영:1자)"
end type

type gb_1 from w_inheritance`gb_1 within w_orsms_m
integer x = 2267
integer y = 16
integer width = 1591
integer taborder = 0
integer weight = 400
long backcolor = 79220952
end type

type gb_5 from groupbox within w_orsms_m
integer x = 1143
integer y = 16
integer width = 1088
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "발신번호"
end type

type gb_4 from groupbox within w_orsms_m
integer x = 32
integer y = 236
integer width = 1079
integer height = 1480
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "예약문장"
end type

type mle_msg from multilineedit within w_orsms_m
event keydown pbm_keydown
event keypaste pbm_paste
integer x = 1179
integer y = 308
integer width = 1015
integer height = 1376
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1234567890123456789012345"
boolean vscrollbar = true
boolean autovscroll = true
end type

event keydown;//
long ll_msg

ll_msg = LenA(mle_msg.Text)
st_len.text = string(ll_msg,"00") + "/2000"

end event

event getfocus;this.SelectText(1, Len(this.text))
end event

event other;//
long ll_msg

ll_msg = LenA(mle_msg.Text)
st_len.text = string(ll_msg,"00") + "/2000"

end event

type st_2 from statictext within w_orsms_m
integer x = 73
integer y = 312
integer width = 283
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "등록문장"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsms_m
integer x = 73
integer y = 376
integer width = 1010
integer height = 100
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsms_word_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
long ll_msg

mle_msg.text = data
ll_msg       = LenA(mle_msg.Text)
st_len.text  = string(ll_msg,"00") + "/80"

end event

type em_to from editmask within w_orsms_m
event keydown pbm_keydown
integer x = 2299
integer y = 308
integer width = 507
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "12345678901"
maskdatatype maskdatatype = stringmask!
string mask = "###-####-####"
end type

event keydown;// 계정코드에서는 Tab -> Enter키로 변경
if Key = KeyTab! then Key = KeyEnter! 

string ls_value

ls_value = GF_ReplaceAll(em_to.text," ","")
if LenA(trim(ls_value)) > 12 then 
	sle_toname.setfocus()
else
	if Key = KeyEnter! then
		if LenA(em_to.text) > 12 then
			sle_toname.setfocus()
			//pb_insert.TriggerEvent(Clicked!)	
		end if
	end if
end if

//IF (KeyDown(KeyTab!) OR KeyDown(KeyEnter!) OR &
//	  KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) &
//          OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!) ) THEN
//	pb_insert.TriggerEvent(Clicked!)	
//end if
//
//
end event

event getfocus;//
this.SelectText(1, Len(this.text))

end event

type em_from from editmask within w_orsms_m
integer x = 1184
integer y = 92
integer width = 1010
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "12345678901"
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
string mask = "###########"
end type

event getfocus;this.SelectText(1, Len(this.text))
end event

type st_4 from statictext within w_orsms_m
integer x = 27
integer y = 168
integer width = 402
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
string text = "SMSSEND 권한"
boolean focusrectangle = false
end type

type tab_1 from tab within w_orsms_m
integer x = 73
integer y = 492
integer width = 987
integer height = 1200
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 951
integer height = 1084
long backcolor = 79741120
string text = "영업사원HP"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cbx_1 cbx_1
st_3 st_3
dw_4 dw_4
end type

on tabpage_1.create
this.cbx_1=create cbx_1
this.st_3=create st_3
this.dw_4=create dw_4
this.Control[]={this.cbx_1,&
this.st_3,&
this.dw_4}
end on

on tabpage_1.destroy
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.dw_4)
end on

type cbx_1 from checkbox within tabpage_1
integer x = 631
integer y = 16
integer width = 325
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "전체추가"
end type

event clicked;//
long   ll_row, ll_Y, ll_YY, ll_cnt = 0, ll_found
string ls_phone, ls_usernm

if tab_1.tabpage_1.dw_4.rowcount() < 0 then RETURN

if this.checked = true then	// 추가
	for ll_Y = 1 to tab_1.tabpage_1.dw_4.rowcount()	
		tab_1.tabpage_1.dw_4.ScrollToRow(ll_Y)
		
		ls_phone  = tab_1.tabpage_1.dw_4.object.phone_no[ll_Y]
		ls_usernm = tab_1.tabpage_1.dw_4.object.user_name[ll_Y]
		
		ll_found  = dw_1.Find("phone_no = '" + ls_phone + "' ", 1, dw_1.RowCount())		
		if ll_found > 0 then
		else
			ll_row = dw_1.InsertRow(0)
			dw_1.object.phone_no[ll_row]   = ls_phone
			dw_1.object.phone_name[ll_row] = ls_usernm
		end if
	next
	
	this.checked = false
else
	for ll_Y = 1 to tab_1.tabpage_1.dw_4.rowcount()	
		ls_phone  = tab_1.tabpage_1.dw_4.object.phone_no[ll_Y]
		ls_usernm = tab_1.tabpage_1.dw_4.object.user_name[ll_Y]
		
		for ll_row = 1 to dw_1.rowcount()
			if ls_phone = dw_1.object.phone_no[ll_row] then
				dw_1.ScrollToRow(ll_row)
				ll_row = dw_1.DeleteRow(0)
			end if
		next
	next
end if
end event

type st_3 from statictext within tabpage_1
integer x = 5
integer y = 16
integer width = 626
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "더블클릭: 수신자 추가."
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_1
integer x = 9
integer y = 80
integer width = 928
integer height = 992
integer taborder = 20
string title = "none"
string dataobject = "d_orsms_saleshp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

if isnull(row) OR row < 1 then return

string ls_userid

// 타인 전화번호부 조회
if tab_1.tabpage_2.cbx_etc.checked = true then
	ls_userid = this.object.user_id[row]
	
	tab_1.tabpage_2.dw_5.reset()
	tab_1.tabpage_2.dw_5.retrieve( ls_userid )
end if

end event

event doubleclicked;//
long   ll_row
string ls_phone, ls_usernm

if (row < 1) or row > this.rowcount() then return

ls_phone  = this.object.phone_no[row]
ls_usernm = this.object.user_name[row]

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.phone_no[ll_row] = ls_phone then
		MessageBox("확인","중복된 번호가 존재 합니다.")
		return
	end if
next

ll_row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_row)

dw_1.object.phone_no[ll_row]   = ls_phone
dw_1.object.phone_name[ll_row] = ls_usernm
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 951
integer height = 1084
long backcolor = 79741120
string text = "전화번호부"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_7 cb_7
cb_6 cb_6
cb_4 cb_4
cbx_3 cbx_3
dw_5 dw_5
cbx_etc cbx_etc
end type

on tabpage_2.create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cbx_3=create cbx_3
this.dw_5=create dw_5
this.cbx_etc=create cbx_etc
this.Control[]={this.cb_7,&
this.cb_6,&
this.cb_4,&
this.cbx_3,&
this.dw_5,&
this.cbx_etc}
end on

on tabpage_2.destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cbx_3)
destroy(this.dw_5)
destroy(this.cbx_etc)
end on

type cb_7 from commandbutton within tabpage_2
integer x = 297
integer y = 4
integer width = 146
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
end type

event clicked;//
dw_5.accepttext()
if dw_5.update() = 1 then
	COMMIT;
	MessageBox("확인","저장완료")
else
	ROLLBACK;
	MessageBox("확인","저장실패")
end if
end event

type cb_6 from commandbutton within tabpage_2
integer x = 151
integer y = 4
integer width = 146
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
end type

event clicked;//
long ll_row

if dw_5.rowcount() < 1 then return

dw_5.deleterow(dw_5.getrow())

end event

type cb_4 from commandbutton within tabpage_2
integer x = 5
integer y = 4
integer width = 146
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
end type

event clicked;//
long  ll_row

ll_row = dw_5.InsertRow(0)
dw_5.object.user_id[ll_row] = gs_userid

dw_5.ScrollToRow(ll_row)

end event

type cbx_3 from checkbox within tabpage_2
integer x = 649
integer y = 16
integer width = 311
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "전체추가"
end type

event clicked;//
long   ll_row, ll_Y, ll_YY, ll_cnt = 0, ll_found
string ls_phone, ls_phonenm

if tab_1.tabpage_2.dw_5.rowcount() < 0 then RETURN

if this.checked = true then	// 추가
	for ll_Y = 1 to tab_1.tabpage_2.dw_5.rowcount()	
		tab_1.tabpage_2.dw_5.ScrollToRow(ll_Y)
		
		ls_phone   = tab_1.tabpage_2.dw_5.object.phone_no[ll_Y]
		ls_phonenm = tab_1.tabpage_2.dw_5.object.phone_name[ll_Y]
		
		ll_found   = dw_1.Find("phone_no = '" + ls_phone + "' ", 1, dw_1.RowCount())		
		if ll_found > 0 then
		else
			ll_row = dw_1.InsertRow(0)
			dw_1.object.phone_no[ll_row]   = ls_phone
			dw_1.object.phone_name[ll_row] = ls_phonenm
		end if
	next
	
	this.checked = false
else
	for ll_Y = 1 to tab_1.tabpage_2.dw_5.rowcount()	
		ls_phone  = tab_1.tabpage_2.dw_5.object.phone_no[ll_Y]
		ls_phonenm = tab_1.tabpage_2.dw_5.object.phone_name[ll_Y]
		
		for ll_row = 1 to dw_1.rowcount()
			if ls_phone = dw_1.object.phone_no[ll_row] then
				dw_1.ScrollToRow(ll_row)
				ll_row = dw_1.DeleteRow(0)
			end if
		next
	next
end if
end event

type dw_5 from datawindow within tabpage_2
integer x = 9
integer y = 88
integer width = 928
integer height = 988
integer taborder = 10
string title = "none"
string dataobject = "d_orsms_custhp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_5"

if isnull(row) OR row < 1 then return

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
//
end event

event doubleclicked;//
long   ll_row
string ls_phone, ls_custnm

if (row < 1) or row > this.rowcount() then return

ls_phone  = this.object.phone_no[row]
ls_custnm = this.object.phone_name[row]

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.phone_no[ll_row] = ls_phone then
		MessageBox("확인","중복된 번호가 존재 합니다.")
		return
	end if
next

ll_row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_row)

dw_1.object.phone_no[ll_row]   = ls_phone
dw_1.object.phone_name[ll_row] = ls_custnm
end event

type cbx_etc from checkbox within tabpage_2
integer x = 453
integer y = 16
integer width = 197
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "타인"
end type

event clicked;//
if this.checked = true then
	if tab_1.tabpage_2.dw_5.rowcount() < 1 then
		MessageBox("확인","영업사원HP 페이지에서 타인을 선택하면 됩니다.")
	end if
else
	tab_1.tabpage_2.dw_5.reset()
end if

end event

type st_len from statictext within w_orsms_m
integer x = 1833
integer y = 1692
integer width = 366
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "00/2000"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_mgr from checkbox within w_orsms_m
integer x = 1915
integer y = 16
integer width = 283
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "관리자"
end type

type pb_2 from picturebutton within w_orsms_m
event mousemove pbm_mousemove
integer x = 2848
integer y = 56
integer width = 187
integer height = 144
integer taborder = 150
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

event clicked;String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

ldw_sel = dw_2
if ldw_sel.rowcount() > 0 then
	Integer iRet

	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		choose case ls_ExpandName
			case "xls", "XLS"
				ldw_sel.SaveAsascii(ls_DocName)
			case "csv", "CSV"
				ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end choose
	end if
end if	


end event

type st_1 from statictext within w_orsms_m
integer x = 1170
integer y = 16
integer width = 293
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "발신번호"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_mms from checkbox within w_orsms_m
integer x = 1490
integer y = 16
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "KT-MMS"
end type

type sle_toname from singlelineedit within w_orsms_m
event keydown pbm_keydown
integer x = 2811
integer y = 308
integer width = 1010
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
integer limit = 30
end type

event keydown;// 수신자명에서 Tab -> Enter키로 변경
if Key = KeyTab! then Key = KeyEnter! 

if Key = KeyEnter! then
	if LenA(em_to.text) > 12 then
		pb_insert.TriggerEvent(Clicked!)	
	end if
end if

end event

event getfocus;//
this.SelectText(1, Len(this.text))

end event

type st_5 from statictext within w_orsms_m
integer x = 2816
integer y = 236
integer width = 274
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "수신자명"
boolean focusrectangle = false
end type

type st_6 from statictext within w_orsms_m
integer x = 82
integer y = 1812
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_orsms_m
integer x = 261
integer y = 1792
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_orsms_m
integer x = 293
integer y = 1804
integer width = 311
integer height = 88
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

type st_7 from statictext within w_orsms_m
integer x = 731
integer y = 1808
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

type ddlb_op from dropdownlistbox within w_orsms_m
integer x = 901
integer y = 1792
integer width = 274
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsms_m
integer x = 1193
integer y = 1796
integer width = 535
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_orsms_m
integer x = 1742
integer y = 1808
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_1 from commandbutton within w_orsms_m
integer x = 1943
integer y = 1796
integer width = 146
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
string     ls_column, ls_value, ls_col, ls_type, ls_op
integer    li_ret

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = tab_1.tabpage_1.dw_4

	case "dw_5"
		arg_dw  = tab_1.tabpage_2.dw_5
end choose

ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_2 from commandbutton within w_orsms_m
integer x = 2094
integer y = 1796
integer width = 146
integer height = 76
integer taborder = 100
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = tab_1.tabpage_1.dw_4

	case "dw_5"
		arg_dw  = tab_1.tabpage_2.dw_5
end choose

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_orsms_m
integer x = 2245
integer y = 1796
integer width = 146
integer height = 76
integer taborder = 110
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = tab_1.tabpage_1.dw_4

	case "dw_5"
		arg_dw  = tab_1.tabpage_2.dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_orsms_m
integer x = 2395
integer y = 1796
integer width = 146
integer height = 76
integer taborder = 120
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1

	case "dw_2"
		arg_dw  = dw_2

	case "dw_4"
		arg_dw  = tab_1.tabpage_1.dw_4

	case "dw_5"
		arg_dw  = tab_1.tabpage_2.dw_5
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_8 from statictext within w_orsms_m
integer x = 2601
integer y = 1808
integer width = 293
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "조회일자"
boolean focusrectangle = false
end type

type em_sdate from editmask within w_orsms_m
integer x = 2894
integer y = 1792
integer width = 402
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type gb_6 from gb_1 within w_orsms_m
integer x = 32
integer y = 1736
integer width = 3826
integer height = 168
integer taborder = 110
integer textsize = -10
long textcolor = 0
string text = "전송이력(30일)"
end type

