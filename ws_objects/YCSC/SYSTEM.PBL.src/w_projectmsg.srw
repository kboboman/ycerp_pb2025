$PBExportHeader$w_projectmsg.srw
$PBExportComments$고객센터 메시지
forward
global type w_projectmsg from window
end type
type st_3 from statictext within w_projectmsg
end type
type st_2 from statictext within w_projectmsg
end type
type pb_7 from picturebutton within w_projectmsg
end type
type st_1 from statictext within w_projectmsg
end type
type pb_6 from picturebutton within w_projectmsg
end type
type cbx_1 from checkbox within w_projectmsg
end type
type pb_5 from picturebutton within w_projectmsg
end type
type st_time from statictext within w_projectmsg
end type
type cb_12 from commandbutton within w_projectmsg
end type
type cb_11 from commandbutton within w_projectmsg
end type
type cb_filteroff from commandbutton within w_projectmsg
end type
type sle_value from singlelineedit within w_projectmsg
end type
type ddlb_2 from dropdownlistbox within w_projectmsg
end type
type st_9 from statictext within w_projectmsg
end type
type ddlb_col from dropdownlistbox within w_projectmsg
end type
type st_8 from statictext within w_projectmsg
end type
type cb_10 from commandbutton within w_projectmsg
end type
type pb_4 from picturebutton within w_projectmsg
end type
type pb_3 from picturebutton within w_projectmsg
end type
type pb_2 from picturebutton within w_projectmsg
end type
type pb_1 from picturebutton within w_projectmsg
end type
type dw_4 from datawindow within w_projectmsg
end type
type dw_3 from datawindow within w_projectmsg
end type
type dw_2 from datawindow within w_projectmsg
end type
type st_title from statictext within w_projectmsg
end type
type cbx_3 from checkbox within w_projectmsg
end type
type dw_1 from datawindow within w_projectmsg
end type
type cb_filteron from commandbutton within w_projectmsg
end type
type gb_1 from groupbox within w_projectmsg
end type
end forward

global type w_projectmsg from window
integer x = 494
integer y = 424
integer width = 3794
integer height = 2952
boolean titlebar = true
string title = "고객센터 메신저(w_projectmsg)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
string icon = "C:\bmp\Book.ico"
boolean center = true
st_3 st_3
st_2 st_2
pb_7 pb_7
st_1 st_1
pb_6 pb_6
cbx_1 cbx_1
pb_5 pb_5
st_time st_time
cb_12 cb_12
cb_11 cb_11
cb_filteroff cb_filteroff
sle_value sle_value
ddlb_2 ddlb_2
st_9 st_9
ddlb_col ddlb_col
st_8 st_8
cb_10 cb_10
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
st_title st_title
cbx_3 cbx_3
dw_1 dw_1
cb_filteron cb_filteron
gb_1 gb_1
end type
global w_projectmsg w_projectmsg

type variables
gs_custper_str istr_select
int ii_type, ii_sw =0
int ii_cnt = 0
end variables

event open;////==GF_USEPROGRAM(프로그램 사용현황)===========================================================
//GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
////=============================================================================================

String  ls_msgchk, ls_colx, ls_name
long    ll_row
Window  w_parent

st_1.visible = false
//OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()

if IsValid(w_parent) then
	ls_name = w_parent.classname()
	if ls_name = "w_all_main" then
		THIS.X  = (w_parent.width  - this.width)  / 2
		THIS.Y  = (w_parent.height - this.height) / 2 - 200
	else
		THIS.X  = (w_parent.width  - this.width)  / 2 + 1250
		THIS.Y  = (w_parent.height - this.height) / 2 + 150
	end if
end if

if LeftA(gs_team,1) = '9' then	
	cbx_1.checked = false	// 전체보기
else
	cbx_1.checked = true 	// 전체보기
end if

ls_msgchk = ProfileString("YCSC.INI", "MessageBox", "Check", " ")
IF ls_msgchk = 'Y' THEN
	cbx_3.Checked = True
ELSE
	cbx_3.Checked = False
END If
	
istr_select = Message.PowerObjectParm

dw_1.visible = false
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)


cbx_1.checked = true 	// 전체보기
ll_row = dw_2.retrieve( '%' )
if ll_row > 0 then 
	dw_3.scrolltorow( ll_row )
	dw_3.triggerevent(clicked!)
	dw_3.triggerevent(rowfocuschanged!)
end if

DateTime ld_time
SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;

st_time.text  = ""
ddlb_col.text = "현장명"
ddlb_2.text   = "LIKE"

ls_colx = dw_2.object.cnt.x
dw_2.object.datawindow.horizontalscrollsplit = ls_colx

//// 자동조회 사용안함.
//// timer(120)
//if (gs_team >= "93000" and gs_team < "97000") OR (gs_team  = "X1000" ) then	// 현장반장들
//	pb_5.triggerevent(clicked!)	// EXIT
//end if
//
end event

on w_projectmsg.create
this.st_3=create st_3
this.st_2=create st_2
this.pb_7=create pb_7
this.st_1=create st_1
this.pb_6=create pb_6
this.cbx_1=create cbx_1
this.pb_5=create pb_5
this.st_time=create st_time
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_filteroff=create cb_filteroff
this.sle_value=create sle_value
this.ddlb_2=create ddlb_2
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.st_8=create st_8
this.cb_10=create cb_10
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.st_title=create st_title
this.cbx_3=create cbx_3
this.dw_1=create dw_1
this.cb_filteron=create cb_filteron
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.st_2,&
this.pb_7,&
this.st_1,&
this.pb_6,&
this.cbx_1,&
this.pb_5,&
this.st_time,&
this.cb_12,&
this.cb_11,&
this.cb_filteroff,&
this.sle_value,&
this.ddlb_2,&
this.st_9,&
this.ddlb_col,&
this.st_8,&
this.cb_10,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.st_title,&
this.cbx_3,&
this.dw_1,&
this.cb_filteron,&
this.gb_1}
end on

on w_projectmsg.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_7)
destroy(this.st_1)
destroy(this.pb_6)
destroy(this.cbx_1)
destroy(this.pb_5)
destroy(this.st_time)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_filteroff)
destroy(this.sle_value)
destroy(this.ddlb_2)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.st_8)
destroy(this.cb_10)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.st_title)
destroy(this.cbx_3)
destroy(this.dw_1)
destroy(this.cb_filteron)
destroy(this.gb_1)
end on

event timer;long     hWnd, ll_row
int      li_cnt
string   ls_userid
DateTime ld_time

SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;

ii_cnt = ii_cnt + 1
st_time.text = string(ii_cnt, "#,##0") + "차: " + string(ld_time,"yyyy/mm/dd hh:mm:ss")

if cbx_1.checked = true then	// 전체	
	ls_userid = '%'
else
	ls_userid = gs_userid
end if

// 자신이 답변해야 하는 것
SELECT count(*) INTO :li_cnt FROM ProjectMSGDET WHERE tlogin = :gs_userid AND del = "N";
if li_cnt > 0 then
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
	ll_row = dw_2.retrieve( ls_userid )	
	if ll_row > 0 then
		dw_3.scrolltorow( ll_row )
		dw_3.triggerevent(clicked!)
		dw_3.triggerevent(rowfocuschanged!)
	end if
end if


if This.WindowState = Minimized! then
	SELECT count(*) INTO :li_cnt FROM ProjectMSGDET WHERE tlogin = :gs_userid AND del = "N";
	if li_cnt > 0 then
		dw_2.retrieve( ls_userid )
	end if
	
	if This.WindowState = Minimized! and li_cnt > 0 and cbx_3.checked = true then
		if MessageBox("확인","고객센터 메시지가 " + string(li_cnt) + " 개 있습니다. ~r~n" + &
						  "메지시를 확인 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			This.WindowState = Normal!
		end if
	end if
else
	Timer(120)
	gu_ext_func.uf_Flash_Window (hWnd, true)
end if

end event

type st_3 from statictext within w_projectmsg
integer x = 2350
integer y = 2240
integer width = 1385
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "생산부서는 모두 답변가능(답변 버튼), 2분 간격 체크"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_projectmsg
integer x = 544
integer y = 2240
integer width = 1166
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "1) 답변자 지정시간, 2) 처리담당자 답변시간"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_projectmsg
integer x = 2866
integer y = 48
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
string disabledname = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row
int  li_cnt
string   ls_userid
DateTime ld_time

cb_filteroff.triggerevent(clicked!)

dw_2.reset()
dw_3.reset()
dw_4.reset()

SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;

ii_cnt = ii_cnt + 1
st_time.text = string(ii_cnt, "#,##0") + "차: " + string(ld_time,"yyyy/mm/dd hh:mm:ss")

if cbx_1.checked = true then	// 전체	
	ls_userid = '%'
else
	ls_userid = gs_userid
end if

ll_row = dw_2.retrieve( '%' )
if ll_row > 0 then 
	dw_3.scrolltorow( ll_row )
	dw_3.triggerevent(clicked!)
	dw_3.triggerevent(rowfocuschanged!)
end if

// 자동조회 사용안함
//timer(120)

end event

type st_1 from statictext within w_projectmsg
integer x = 32
integer y = 164
integer width = 558
integer height = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "고객센터관리자 권한"
boolean focusrectangle = false
end type

type pb_6 from picturebutton within w_projectmsg
integer x = 3104
integer y = 48
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long   ll_row, ll_id, ll_cnt
string ls_flogin

ls_flogin = dw_2.object.flogin[dw_2.getrow()]

if gf_permission("고객센터관리자", gs_userid) = 'Y' then
else
	if gs_userid <> ls_flogin then
		MessageBox("확인","고객센터 게시물 작성자가 아닙니다.!",exclamation!)
		return
	end if
end if

ll_id = dw_2.object.id[dw_2.getrow()]
SELECT count(*) INTO :ll_cnt  FROM ProjectMSGDET
 WHERE pkid   = :ll_id  AND del = 'Y';
if ll_cnt > 0 then
	MessageBox("확인","고객센터 답변자가 존재합니다. 답변자를 먼저 삭제한 후 게시물을 삭제하시기 바랍니다.!",exclamation!)
	return
end if

if MessageBox("확인","고객센터 게시물을 삭제 하시겠습니까?",question!,okcancel!,2) = 1 then
	dw_2.object.del[dw_2.getrow()] = "Y"
	pb_3.triggerevent(clicked!)
end if

end event

type cbx_1 from checkbox within w_projectmsg
integer x = 1536
integer y = 36
integer width = 411
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체보기"
end type

event clicked;//
string ls_userid
long   ll_row

if this.checked = true then
	ls_userid  = '%'
else
	ls_userid = gs_userid
end if

ll_row = dw_2.retrieve( ls_userid )
if ll_row = 0 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if
end event

type pb_5 from picturebutton within w_projectmsg
integer x = 3511
integer y = 48
integer width = 187
integer height = 144
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
string disabledname = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event clicked;long	 ll_row, ll_cnt, ll_id
string ls_flogin


if LeftA(gs_team,1) <> "9" then
	for ll_row = 1 to dw_2.rowcount()
		ll_id     = dw_2.object.id[ll_row]
		ls_flogin = dw_2.object.flogin[ll_row]
		ll_cnt    = dw_2.object.cnt[ll_row]
		if gs_userid = ls_flogin then
			if ll_cnt = 0 then
				dw_2.scrolltorow(ll_row)
				dw_2.selectrow(0, false)
				dw_2.selectrow(ll_row, true)
				
				MessageBox("확인","문의사항 중 처리담당자를 지정하지 않은 항목은 삭제합니다.", Exclamation!)
				
				// 게시물중에서 답변자가 없으면 삭제하기.
				DELETE ProjectMSG WHERE ID = :ll_id;
				if sqlca.sqldbcode <> 0 then
					MessageBox('고객센터','고객센터 삭제중 오류가 발생했습니다. 재시도 해주세요.',Exclamation!)
					rollback;
					return
				end if	
				COMMIT;
				
			end if
		end if
	next
end if

closewithreturn(parent, istr_select)
close(parent)

end event

type st_time from statictext within w_projectmsg
integer x = 2816
integer y = 240
integer width = 910
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_12 from commandbutton within w_projectmsg
integer x = 2514
integer y = 228
integer width = 238
integer height = 76
integer taborder = 70
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
String ls_col
choose case trim(ddlb_col.text)
	case "번호"
		ls_col = "id "
	case "작성일자"
		ls_col = "msgdate "
	case "작성자"
		ls_col = "fuser "
	case "처리자"
		ls_col = "cnt "
	case "담당자"
		ls_col = "user_name "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
	case "수주번호"
		ls_col = "order_no "
	case "분류"
		ls_col = "cat "
	case "처리결과"
		ls_col = "status "
	case "요청사항"
		ls_col = "msg "
end choose		

dw_2.SetSort(ls_col + "D")
dw_2.sort()

end event

type cb_11 from commandbutton within w_projectmsg
integer x = 2277
integer y = 228
integer width = 238
integer height = 76
integer taborder = 60
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
String ls_col
choose case trim(ddlb_col.text)
	case "번호"
		ls_col = "id "
	case "작성일자"
		ls_col = "msgdate "
	case "작성자"
		ls_col = "fuser "
	case "처리자"
		ls_col = "cnt "
	case "담당자"
		ls_col = "user_name "
	case "거래처명"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
	case "수주번호"
		ls_col = "order_no "
	case "분류"
		ls_col = "cat "
	case "처리결과"
		ls_col = "status "
	case "요청사항"
		ls_col = "msg "
end choose		

dw_2.SetSort(ls_col + "A")
dw_2.sort()

end event

type cb_filteroff from commandbutton within w_projectmsg
integer x = 2039
integer y = 228
integer width = 238
integer height = 76
integer taborder = 40
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw_2.setfilter("")
dw_2.filter()

dw_2.setsort( "msgdate D" )
dw_2.sort()

end event

type sle_value from singlelineedit within w_projectmsg
integer x = 1129
integer y = 228
integer width = 658
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_2 from dropdownlistbox within w_projectmsg
integer x = 837
integer y = 224
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_9 from statictext within w_projectmsg
integer x = 654
integer y = 244
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

type ddlb_col from dropdownlistbox within w_projectmsg
integer x = 238
integer y = 224
integer width = 402
integer height = 532
integer taborder = 30
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
string item[] = {"번호","작성일자","작성자","처리자","담당자","거래처명","현장명","수주번호","분류","처리결과","요청사항"}
end type

type st_8 from statictext within w_projectmsg
integer x = 55
integer y = 244
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

type cb_10 from commandbutton within w_projectmsg
integer x = 2249
integer y = 100
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주조회"
end type

event clicked;string ls_orderno
long   ll_row

ll_row = dw_2.getrow()
ls_orderno = dw_2.object.order_no[ll_row]
if ls_orderno = "" or isnull(ls_orderno) then return

if LeftA(gs_team,1) = '7' then 
	if IsValid(w_orsale_m) then 
		MessageBox("확인","영업부서는 수주관리에서 확인하시기 바랍니다.~n~n수주관리 프로그램이 열린상태 입니다.")
		return
	end if
end if

if IsValid(w_o_main) then 
	OpenSheet(w_orsale_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_orsale_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_orsale_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_orsale_m,  w_all_main, 5, original!)
end if

w_orsale_m.setredraw(false)
w_orsale_m.pb_save.enabled = false
w_orsale_m.em_3.text = LeftA(ls_orderno,10)	// 수주번호
w_orsale_m.em_4.text = string(integer(RightA(ls_orderno,3)))
w_orsale_m.pb_cancel.postevent(clicked!)
w_orsale_m.setredraw(true)

end event

type pb_4 from picturebutton within w_projectmsg
event mousemove pbm_mousemove
integer x = 2665
integer y = 48
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

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

type pb_3 from picturebutton within w_projectmsg
integer x = 3305
integer y = 48
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
string disabledname = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event clicked;//
long   ll_row, ll_cnt, ll_id
string ls_del, ls_msg, ls_userid, ls_sms

dw_2.accepttext()
dw_3.accepttext()
dw_4.accepttext()

ll_row = dw_2.getrow()
for ll_cnt = 1 to ll_row
	ll_id  = dw_2.object.id[ll_cnt]
	ls_del = dw_2.object.del[ll_cnt]
	if ls_del = 'Y' then
		UPDATE ProjectMSG SET del = :ls_del WHERE ID = :ll_id;
		IF SQLCA.SQLCode = -1 THEN 
			rollback;
			MessageBox("확인", "[" + string(ll_id,"##0") + "] 고객센터 게시물 삭제 실패!")
			return
	   else
			COMMIT;
		end if
	end if
next


ll_row = dw_4.getrow()
if gf_permission("고객센터관리자", gs_userid) = 'Y' then	
else
	if LeftA(gs_team,1) = '7' and gs_userid <> dw_2.object.flogin[dw_2.getrow()] then
		MessageBox("확인","고객센터 작성자가 아닙니다.")
		RETURN
	end if
end if

//if left(gs_team,1) = '7' and dw_4.rowcount() = 0 then
//	MessageBox("확인","처리 담당자가 존재하지 않습니다. 확인하시기 바랍니다.")
//	RETURN
//end if

for ll_cnt = 1 to ll_row
	if isnull(dw_4.object.msg[ll_cnt]) or dw_4.object.msg[ll_cnt] = "" then
		ls_msg = ""
	else
		if dw_4.object.tlogin[ll_cnt] = gs_userid then
			dw_4.object.del[ll_cnt] = "Y"
		end if
	end if	
next

///////////////////////////////////////////////////////////
// 고객센터 메시지 작성부서만 처리담당자에게 문자 전송함 //
///////////////////////////////////////////////////////////
if LeftA(gs_team,1) = "9" then
	ls_sms = ""
else
	ls_sms = dw_3.object.sms[1]
end if
///////////////////////////////////////////////////////////
if ls_sms = "Y" then
	string ls_id, ls_sender, ls_message, ls_recipient, ls_phonenum, ls_phone[]
	
	ls_id      = dw_3.object.id[1]         // ID
	ls_sender  = dw_3.object.fname[1]      // 발신자
	SELECT saler_phone INTO :ls_sender FROM aroiinv_esero WHERE saler_user = :ls_sender;
	if isnull(ls_sender) or ls_sender = "" then
		choose case gs_team
			case "77000"	// 화곡
				ls_sender = "02-2690-1999"
			case "78000"   // 대전
				ls_sender = "042-635-7002"
			case else      // 본사
				ls_sender = "02-2648-1998"
		end choose
	end if
	
	ls_message = ls_id + "," + dw_3.object.msg[1]		
	ls_message = GF_HANGLE_TR(ls_message,80)
	for ll_row = 1 to dw_4.rowcount()		// 처리담당자
		ls_recipient     = dw_4.object.tlogin[ll_row]
		
		SELECT phone INTO :ls_phonenum FROM login WHERE user_id = :ls_recipient;
      ls_phone[ll_row] = ls_phonenum		
	next
end if
		
///////////////////////////////////////////////////////////
if dw_3.update(true,false) = 1 then
	if dw_4.update(true,true) = 1 then
	   COMMIT;		
		dw_3.resetupdate()
		
		if ls_sms = "Y" then
			string SMSSERVER
			
			SELECT item_nm INTO :SMSSERVER FROM codemst WHERE item_cd = 'SMSSERVER' AND use_yn = 'Y';
			IF SMSSERVER = "" THEN SMSSERVER = "192.168.1.5"
			
			for ll_row = 1 to UpperBound(ls_phone)	
				ls_recipient  = ls_phone[ll_row]
				
				choose case LeftA(ls_recipient,3)
					case '010','011','016','017','018','019'
					case else
						ls_recipient = ""
				end choose
				
				// 수신처
				if ls_recipient = "" or isnull(ls_recipient) then
				else
					choose case SMSSERVER
						case '192.168.1.5'
							INSERT INTO sc_tran ( tr_senddate, tr_sendstat, tr_rsltstat, tr_phone, tr_callback, tr_msg, tr_etc6 )
							VALUES ( GetDate(), '0', '00', :ls_recipient, :ls_sender, :ls_message, :gs_userid );
							if sqlca.sqldbcode <> 0 then
								MessageBox('확인','문자전송 오류발생. 문자전송 제거후 다시 저장하시기 바랍니다.',Exclamation!)
								rollback;
							else
								COMMIT;
							end if				            
					end choose
				end if
			next
		end if		
		MessageBox("확인", "저장되었습니다.")
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
end if
///////////////////////////////////////////////////////////

// 재조회
if cbx_1.checked = true then	// 전체	
	ls_userid = '%'
else
	ls_userid = gs_userid
end if

dw_2.retrieve( ls_userid )

end event

type pb_2 from picturebutton within w_projectmsg
event mousemove pbm_mousemove
integer x = 3593
integer y = 2484
integer width = 165
integer height = 136
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "삭제"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long   ll_row
string ls_flogin, ls_tlogin

ls_flogin = dw_2.object.flogin[dw_2.getrow()]
if gs_userid <> ls_flogin then		// 작성자
	ls_tlogin = dw_4.object.tlogin[dw_4.getrow()]
	if gs_userid <> ls_tlogin then	// 답변자
		MessageBox("확인","고객센터 게시물 작성(답변)자가 아닙니다.!",exclamation!)
		return
	end if
end if

if MessageBox("확인","처리담당자를 삭제 하시겠습니까?",question!,okcancel!,2) = 1 then
	ll_row = dw_4.getrow()	
	dw_4.deleterow( ll_row )
end if

end event

type pb_1 from picturebutton within w_projectmsg
event mousemove pbm_mousemove
integer x = 3593
integer y = 2300
integer width = 165
integer height = 136
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "답변"
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long   ll_row,  ll_seq, ll_pkid
string ls_cust, ls_flogin

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

ls_flogin = dw_2.object.flogin[dw_2.getrow()]
if gs_userid <> ls_flogin then
	if LeftA(gs_team,1) = "9" then	// 생산부서는 답변가능
	else
		MessageBox("확인","고객센터 게시물 작성자가 아닙니다.!",exclamation!)
		return
	end if
end if

ll_pkid   = dw_2.object.id[dw_2.getrow()]
if ll_pkid = 0 then
	MessageBox("확인","고객센터 게시물 번호를 선택하세요!",exclamation!)
	return
end if

ll_row = dw_4.insertrow(0)
dw_4.scrolltorow(ll_row)
if LeftA(gs_team,1) = "9" then	// 생산부서는 답변가능
	dw_4.object.tlogin[ll_row] = gs_userid
	dw_4.object.tlogin.protect = true
	dw_4.object.tlogin.background.color = 78682240
	dw_4.object.msg.protect = false
	dw_4.object.msg.background.color = rgb(255,255,255)					
	dw_4.setcolumn("msg")
	dw_4.setfocus()
else
	dw_4.setcolumn("user_name")
	dw_4.setfocus()
end if

dw_4.object.pkid[ll_row]   = ll_pkid

DateTime ld_time
SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
dw_4.object.msgdate[ll_row] = ld_time
dw_4.object.del[ll_row]     = 'N'

end event

type dw_4 from datawindow within w_projectmsg
integer x = 50
integer y = 2296
integer width = 3529
integer height = 532
integer taborder = 40
string title = "none"
string dataobject = "d_projectmsgdet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event editchanged;//
DateTime ld_time

choose case dwo.name
	case 'msg'
		if this.object.tlogin[row] = gs_userid then
			SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
			dw_4.object.msgdate[row] = ld_time
			dw_4.object.del[row]     = 'N'
		else
			MessageBox("확인", "다른사람의 답변은 수정할 수 없습니다.")
			this.object.msg[row] = this.object.oldmsg[row]
			RETURN 3
		end if
end choose

end event

type dw_3 from datawindow within w_projectmsg
integer x = 50
integer y = 1600
integer width = 3685
integer height = 632
integer taborder = 30
string title = "none"
string dataobject = "d_projectmsg_m"
boolean livescroll = true
end type

type dw_2 from datawindow within w_projectmsg
integer x = 50
integer y = 316
integer width = 3685
integer height = 1276
integer taborder = 20
string title = "none"
string dataobject = "d_projectmsg_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

event rowfocuschanged;long   ll_id, ll_row3, ll_row4, ll_cnt
string ls_tlogin

if dw_2.getrow() < 1 then return
if isnull(currentrow) then currentrow = 1

if dw_2.filteredcount() = 0 then
else
	if currentrow > dw_2.filteredcount() then return
end if

This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)

ll_id = this.object.id[currentrow]

dw_3.reset()
dw_4.reset()
ll_row3 = dw_3.retrieve( ll_id )
ll_row4 = dw_4.retrieve( ll_id )

// ProjectMSG
choose case LeftA(gs_team,1)
	case '9'	// 생산
		dw_3.object.cat.protect = true 
		dw_3.object.cat.background.color = 78682240
	
		dw_3.object.msg.protect = true
		dw_3.object.msg.background.color = 78682240
	
		dw_3.object.item_no.protect = true
		dw_3.object.item_no.background.color = 78682240
   case else 
		dw_3.object.status.protect = true
		dw_3.object.status.background.color = 78682240
end choose

// ProjectMSGDET
choose case LeftA(gs_team,1)
	case '9'	// 생산		
		dw_4.object.tlogin.protect = true
		dw_4.object.tlogin.background.color = 78682240					
		for ll_cnt = 1 to ll_row4
			ls_tlogin = dw_4.object.tlogin[ll_cnt]
			if gs_userid = ls_tlogin then	// 처리담당자(자신)
				dw_4.object.msg.protect = false
				dw_4.object.msg.background.color = rgb(255,255,255)			
				exit
			end if
		next

	case else
		dw_4.object.tlogin.protect = false
		dw_4.object.tlogin.background.color = rgb(255,255,255)			
		dw_4.object.msg.protect = true
		dw_4.object.msg.background.color = 78682240					
end choose

// 처리자 추가, 삭제
choose case LeftA(gs_team,1)
	case '9'	// 생산		
		pb_1.enabled = true	// 추가
		pb_2.enabled = false	// 삭제
	case '7'	// 영업
		pb_1.enabled = true
		pb_2.enabled = true
end choose

end event

event clicked;string ls_col, ls_text

if row < 1 then return
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

choose case dwo.name
	case "id"
		ls_col  = "번호"
		ls_text = string(this.object.id[row])
	case "msgdate"
		ls_col  = "작성일자"
		ls_text = string(this.object.msgdate[row])
	case "fuser"
		ls_col  = "작성자"
		ls_text = this.object.fuser[row]
	case "cnt"
		ls_col  = "처리자"
		ls_text = string(this.object.cnt[row])
	case "user_name"
		ls_col  = "담당자"
		ls_text = this.object.user_name[row]
	case "cust_name"
		ls_col  = "거래처명"
		ls_text = this.object.cust_name[row]
	case "scene_desc"
		ls_col  = "현장명"
		ls_text = this.object.scene_desc[row]
	case "order_no"
		ls_col  = "수주번호"
		ls_text = this.object.order_no[row]
	case "cat"
		ls_col  = "분류"
		ls_text = this.object.cat[row]
	case "status"
		ls_col  = "처리결과"
		ls_text = this.object.status[row]
	case "msg"
		ls_col  = "요청사항"
		ls_text = this.object.msg[row]
end choose

choose case ls_col
	case "번호", "처리자", "작성일자"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text



end event

type st_title from statictext within w_projectmsg
integer x = 27
integer y = 24
integer width = 1440
integer height = 148
integer textsize = -24
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "고객센터 메신저"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_projectmsg
integer x = 1536
integer y = 120
integer width = 238
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "알림"
boolean checked = true
end type

event clicked;String  ls_chk

IF  cbx_3.Checked = True  THEN
	SetProfileString("YCSC.INI", "MessageBox", "Check", "Y")
ELSE
	SetProfileString("YCSC.INI", "MessageBox", "Check", "N")
END IF
end event

type dw_1 from datawindow within w_projectmsg
integer x = 1335
integer width = 82
integer height = 72
integer taborder = 80
boolean bringtotop = true
end type

event itemerror;return 1
end event

event dberror;return 2
end event

type cb_filteron from commandbutton within w_projectmsg
integer x = 1801
integer y = 228
integer width = 238
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_2.FilteredCount() > 0 THEN
	dw_2.setfilter(ls_temp)
	dw_2.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "번호"
			ls_col = "id "
		case "작성일자"
			ls_col = "msgdate "
		case "작성자"
			ls_col = "fuser "
		case "처리자"
			ls_col = "cnt "
		case "담당자"
			ls_col = "user_name "
		case "거래처명"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
		case "수주번호"
			ls_col = "order_no "
		case "분류"
			ls_col = "cat "
		case "처리결과"
			ls_col = "status "
		case "요청사항"
			ls_col = "msg "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
		elseif ls_col = "cnt " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_2.setfilter(ls_temp)
dw_2.filter()

dw_2.scrolltorow(1)
dw_2.triggerevent(rowfocuschanged!)

end event

type gb_1 from groupbox within w_projectmsg
integer x = 2638
integer width = 1097
integer height = 212
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

