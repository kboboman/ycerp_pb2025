$PBExportHeader$w_orsms1_m.srw
$PBExportComments$문자전송
forward
global type w_orsms1_m from w_inheritance
end type
type gb_5 from groupbox within w_orsms1_m
end type
type gb_4 from groupbox within w_orsms1_m
end type
type mle_msg from multilineedit within w_orsms1_m
end type
type st_2 from statictext within w_orsms1_m
end type
type dw_3 from datawindow within w_orsms1_m
end type
type em_to from editmask within w_orsms1_m
end type
type em_from from editmask within w_orsms1_m
end type
type st_4 from statictext within w_orsms1_m
end type
type tab_1 from tab within w_orsms1_m
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
type tabpage_2 from userobject within tab_1
end type
type tab_1 from tab within w_orsms1_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_len from statictext within w_orsms1_m
end type
type cbx_2 from checkbox within w_orsms1_m
end type
type pb_2 from picturebutton within w_orsms1_m
end type
type gb_6 from gb_1 within w_orsms1_m
end type
end forward

global type w_orsms1_m from w_inheritance
integer x = 690
integer y = 188
integer width = 2263
integer height = 2904
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
cbx_2 cbx_2
pb_2 pb_2
gb_6 gb_6
end type
global w_orsms1_m w_orsms1_m

type variables
gs_where istr_where

//long il_dragsource,il_dragparent,il_droptarget
//long ih_curteam
//integer ii_chk=0
//string  is_chk = 'N'
//st_print i_print
//TreeViewitem itv_team
//
end variables

on w_orsms1_m.create
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
this.cbx_2=create cbx_2
this.pb_2=create pb_2
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
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.pb_2
this.Control[iCurrent+13]=this.gb_6
end on

on w_orsms1_m.destroy
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
destroy(this.cbx_2)
destroy(this.pb_2)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

integer li_width
LONG    ll_row
Window  w_parent

w_parent = this.ParentWindow()

THIS.X   = (w_parent.width  - this.width)  / 2
THIS.Y   = (w_parent.height - this.height) / 2 - 150
pb_cancel.visible     = false
pb_print_part.visible = false
pb_print.visible      = false

dw_2.visible          = false
if gs_userid = "1999010s" then
	cbx_2.visible = true
else
	cbx_2.visible = false
end if

dw_3.SetTransObject(SQLCA)
ll_row = dw_3.retrieve()  // 등록문장 
dw_3.insertrow(0)
//dw_3.object.smsword[1] = "등록문장"

tab_1.tabpage_1.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_4.retrieve()

mle_msg.text = ""
em_to.text   = ""
em_from.text = "0226901999"
if gs_userid = "1999010s" then em_from.enabled = true

string ls_office
SELECT RTRIM(BIGO) INTO :ls_office 
  FROM CODEMST 
 WHERE TYPE = 'SMSSEND' AND ITEM_CD = :gs_userid;
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

type pb_save from w_inheritance`pb_save within w_orsms1_m
integer x = 1787
integer y = 1744
integer taborder = 90
string disabledname = "c:\bmp\save.bmp"
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_custname, ls_scenedesc
string ls_salehp, ls_scenehp, ls_custhp, ls_message, ls_sender, ls_recipient, ls_etc6
String SMSSERVER
long   ll_row

// 수신처 공난 삭제
for ll_row = 1 to dw_1.rowcount()
	ls_recipient = dw_1.object.phone_no[ll_row]
	if isnull(ls_recipient) or ls_recipient = "" then
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


SELECT ITEM_NM INTO :SMSSERVER FROM CODEMST WHERE ITEM_CD = 'SMSSERVER' AND USE_YN = 'Y';
IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"

ls_sender   = em_from.text	
ls_message  = mle_msg.text		
ls_message  = GF_HANGLE_TR(ls_message,80)

for ll_row = 1 to dw_1.rowcount()	
	ls_recipient = dw_1.object.phone_no[ll_row]	
	choose case LeftA(ls_recipient,3)
		case '010','011','016','017','018','019'
		case else
			ls_recipient = ''
	end choose
	
	// 수신처
	if ls_recipient = '' or isnull(ls_recipient) then
	else
		choose case SMSSERVER
			case '192.168.1.5'
				ls_etc6 = '송천:' + gs_userid
				INSERT  INTO  YC.DBO.SC_TRAN ( TR_SENDDATE, TR_SENDSTAT, TR_RSLTSTAT, TR_PHONE, TR_CALLBACK, TR_MSG, TR_ETC6 )
				VALUES ( GetDate(), '0', '00', :ls_recipient, :ls_sender, :ls_message, :ls_etc6 );

				COMMIT;
		end choose
	end if
next

MessageBox("확인",String(ll_row - 1,"#,##0") + "건 전송완료")
pb_compute.TriggerEvent(Clicked!)



end event

type dw_1 from w_inheritance`dw_1 within w_orsms1_m
integer x = 55
integer y = 932
integer width = 1015
integer height = 552
integer taborder = 0
string dataobject = "d_orsms_list"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
end event

type dw_2 from w_inheritance`dw_2 within w_orsms1_m
integer x = 46
integer y = 1988
integer width = 2135
integer height = 776
integer taborder = 0
string title = "전송내용"
string dataobject = "d_orsms_m"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;if row < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

long   ll_cnt
string ls_phone, ls_value
choose case dwo.name
	case "tr_phone"
		ls_value     = this.object.tr_phone[row]
		for ll_cnt = 1 to LenA(ls_value)
			choose case MidA(ls_value,ll_cnt,1) 
				case "0" to "9"
				case else
					ls_value = ReplaceA(ls_value,ll_cnt,1,"")
			end choose
		next
		em_to.text   = ls_value
		
	case "tr_msg"
		mle_msg.text = this.object.tr_msg[row]
end choose
end event

type st_title from w_inheritance`st_title within w_orsms1_m
integer y = 0
integer width = 1079
string text = "문자전송"
end type

type st_tips from w_inheritance`st_tips within w_orsms1_m
end type

type pb_compute from w_inheritance`pb_compute within w_orsms1_m
integer x = 59
integer y = 1744
integer width = 238
integer taborder = 70
string text = "RESET"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;call super::clicked;//
mle_msg.text = ""
em_to.text   = ""
em_from.text = "0226481998"

string ls_office
SELECT RTRIM(BIGO) INTO :ls_office 
  FROM CODEMST 
 WHERE TYPE = 'SMSSEND' AND ITEM_CD = :gs_userid;
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

type pb_print_part from w_inheritance`pb_print_part within w_orsms1_m
integer x = 1326
integer y = 20
integer width = 110
integer height = 96
end type

type pb_close from w_inheritance`pb_close within w_orsms1_m
integer x = 1979
integer y = 1744
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_orsms1_m
integer x = 1440
integer y = 20
integer width = 110
integer height = 96
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_orsms1_m
integer x = 1216
integer y = 20
integer width = 110
integer height = 96
integer taborder = 120
boolean enabled = false
string disabledname = "c:\bmp\cancel.bmp"
end type

type pb_delete from w_inheritance`pb_delete within w_orsms1_m
integer x = 1586
integer y = 1744
integer taborder = 0
end type

event pb_delete::clicked;call super::clicked;long ll_row

if dw_1.rowcount() < 1 then return

dw_1.deleterow(dw_1.getrow())

end event

type pb_insert from w_inheritance`pb_insert within w_orsms1_m
integer x = 1394
integer y = 1744
integer taborder = 0
end type

event pb_insert::clicked;call super::clicked;//
long   ll_row
string ls_phone

ls_phone = trim(em_to.text)
if isnull(ls_phone) or ls_phone = "" or ls_phone = "-    -" then return

for ll_row = 1 to dw_1.rowcount()
	if dw_1.object.phone_no[ll_row] = em_to.text then
		MessageBox("확인","중복된 번호가 존재 합니다.")
		return
	end if
next

ll_row = dw_1.InsertRow(0)
dw_1.ScrollToRow(ll_row)

dw_1.object.phone_no[ll_row] = ls_phone

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_orsms1_m
integer x = 965
integer y = 1744
integer taborder = 80
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

Integer li_day
String  BF_MON, ls_admin

// 한달전
li_day = Day(today())
li_day = li_day + Day(date(string(RelativeDate(today(), - (li_day+1)), "yyyy/mm/dd")))
BF_MON = string(RelativeDate(today(), - li_day), "yyyy/mm/dd")

if cbx_2.checked = true then
	ls_admin = "Y"
else
	ls_admin = "N"
end if

dw_2.visible = true
dw_2.retrieve( BF_MON, string(today(),"yyyy/mm/dd"), gs_userid, ls_admin )

end event

type gb_3 from w_inheritance`gb_3 within w_orsms1_m
integer x = 23
integer y = 768
integer width = 1079
integer height = 740
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
long backcolor = 79220952
string text = "수신번호"
end type

type gb_2 from w_inheritance`gb_2 within w_orsms1_m
integer x = 23
integer y = 204
integer width = 1088
integer height = 532
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 33554432
long backcolor = 79220952
string text = "본문(80자, 한글:2자,영숫자:1자)"
end type

type gb_1 from w_inheritance`gb_1 within w_orsms1_m
integer x = 23
integer y = 1704
integer width = 2185
integer taborder = 0
long backcolor = 79220952
end type

type gb_5 from groupbox within w_orsms1_m
integer x = 23
integer y = 1520
integer width = 1079
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "발신번호"
end type

type gb_4 from groupbox within w_orsms1_m
integer x = 1129
integer y = 204
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

type mle_msg from multilineedit within w_orsms1_m
event keydown pbm_keydown
integer x = 91
integer y = 276
integer width = 933
integer height = 408
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
end type

event keydown;//
long ll_msg

ll_msg = LenA(mle_msg.Text)
st_len.text = string(ll_msg,"00") + "/80"

end event

event getfocus;this.SelectText(1, Len(this.text))
end event

type st_2 from statictext within w_orsms1_m
integer x = 1179
integer y = 280
integer width = 558
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79220952
string text = "등록문장(SMSWORD)"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_orsms1_m
integer x = 1179
integer y = 344
integer width = 1001
integer height = 92
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsms_word_list"
boolean livescroll = true
end type

event itemchanged;//
long ll_msg

mle_msg.text = data
ll_msg       = LenA(mle_msg.Text)
st_len.text  = string(ll_msg,"00") + "/80"

end event

type em_to from editmask within w_orsms1_m
event keydown pbm_keydown
integer x = 55
integer y = 832
integer width = 1015
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
IF Key = KeyTab! then Key = KeyEnter! 

If Key = KeyEnter! then
	if LenA(em_to.text) > 12 then pb_insert.TriggerEvent(Clicked!)	
end if

//IF (KeyDown(KeyTab!) OR KeyDown(KeyEnter!) OR &
//	  KeyDown(KeyDownArrow!) OR KeyDown(KeyUpArrow!) &
//          OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!) ) THEN
//	pb_insert.TriggerEvent(Clicked!)	
//end if
//
//
end event

event getfocus;this.SelectText(1, Len(this.text))
end event

type em_from from editmask within w_orsms1_m
integer x = 55
integer y = 1576
integer width = 1015
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
boolean enabled = false
string text = "12345678901"
maskdatatype maskdatatype = stringmask!
string mask = "###########"
end type

event getfocus;this.SelectText(1, Len(this.text))
end event

type st_4 from statictext within w_orsms1_m
integer x = 1815
integer y = 128
integer width = 402
integer height = 64
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
alignment alignment = center!
boolean focusrectangle = false
end type

type tab_1 from tab within w_orsms1_m
integer x = 1179
integer y = 460
integer width = 987
integer height = 1200
integer taborder = 120
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
long   ll_row, ll_Y
string ls_phone, ls_usernm

if tab_1.tabpage_1.dw_4.rowcount() < 0 then return

if this.checked = true then	// 추가
	for ll_Y = 1 to tab_1.tabpage_1.dw_4.rowcount()	
		ls_phone  = tab_1.tabpage_1.dw_4.object.phone_no[ll_Y]
		ls_usernm = tab_1.tabpage_1.dw_4.object.user_name[ll_Y]
		
		for ll_row = 1 to dw_1.rowcount()
			if dw_1.object.phone_no[ll_row] = ls_phone then
				MessageBox("확인","중복된 번호가 존재 합니다.")
				return
			end if
		next
		
		ll_row = dw_1.InsertRow(0)
		//dw_1.ScrollToRow(ll_row)
		
		dw_1.object.phone_no[ll_row]   = ls_phone
		dw_1.object.phone_name[ll_row] = ls_usernm
	next
else
	for ll_Y = 1 to tab_1.tabpage_1.dw_4.rowcount()	
		ls_phone  = tab_1.tabpage_1.dw_4.object.phone_no[ll_Y]
		ls_usernm = tab_1.tabpage_1.dw_4.object.user_name[ll_Y]
		
		for ll_row = 1 to dw_1.rowcount()
			if dw_1.object.phone_no[ll_row] = ls_phone then
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
end type

event clicked;//if row < 1 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
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
string text = "조직도"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
end type

type st_len from statictext within w_orsms1_m
integer x = 841
integer y = 704
integer width = 197
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "00/80"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_orsms1_m
integer x = 649
integer y = 1828
integer width = 315
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
string text = "관리자"
end type

type pb_2 from picturebutton within w_orsms1_m
event mousemove pbm_mousemove
integer x = 1161
integer y = 1744
integer width = 187
integer height = 144
integer taborder = 120
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

type gb_6 from gb_1 within w_orsms1_m
integer y = 1928
integer height = 860
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "전송이력(30일)"
end type

