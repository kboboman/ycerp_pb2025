$PBExportHeader$w_osaroi_esero_m.srw
$PBExportComments$매출세금계산서(전송용 파일)
forward
global type w_osaroi_esero_m from w_inheritance
end type
type gb_4 from groupbox within w_osaroi_esero_m
end type
type em_1 from editmask within w_osaroi_esero_m
end type
type em_2 from editmask within w_osaroi_esero_m
end type
type rb_1 from radiobutton within w_osaroi_esero_m
end type
type rb_2 from radiobutton within w_osaroi_esero_m
end type
type st_2 from statictext within w_osaroi_esero_m
end type
type st_3 from statictext within w_osaroi_esero_m
end type
type shl_1 from statichyperlink within w_osaroi_esero_m
end type
type st_4 from statictext within w_osaroi_esero_m
end type
type dw_3 from datawindow within w_osaroi_esero_m
end type
type dw_4 from datawindow within w_osaroi_esero_m
end type
type cbx_1 from checkbox within w_osaroi_esero_m
end type
type st_5 from statictext within w_osaroi_esero_m
end type
type hpb_1 from hprogressbar within w_osaroi_esero_m
end type
type dw_5 from datawindow within w_osaroi_esero_m
end type
type st_6 from statictext within w_osaroi_esero_m
end type
type st_7 from statictext within w_osaroi_esero_m
end type
type st_8 from statictext within w_osaroi_esero_m
end type
type st_1 from statictext within w_osaroi_esero_m
end type
type gb_5 from groupbox within w_osaroi_esero_m
end type
end forward

global type w_osaroi_esero_m from w_inheritance
integer x = 37
integer y = 136
integer width = 4329
integer height = 2096
string title = "전자세금계산서(전송용)(w_osaroi_esero_m)"
boolean resizable = false
long backcolor = 79219928
gb_4 gb_4
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
st_2 st_2
st_3 st_3
shl_1 shl_1
st_4 st_4
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
st_5 st_5
hpb_1 hpb_1
dw_5 dw_5
st_6 st_6
st_7 st_7
st_8 st_8
st_1 st_1
gb_5 gb_5
end type
global w_osaroi_esero_m w_osaroi_esero_m

type variables
st_print  i_print
DataWindowChild idwc_user, idwc_cust, idwc_saleruser
end variables

on w_osaroi_esero_m.create
int iCurrent
call super::create
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.st_2=create st_2
this.st_3=create st_3
this.shl_1=create shl_1
this.st_4=create st_4
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.st_5=create st_5
this.hpb_1=create hpb_1
this.dw_5=create dw_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_1=create st_1
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_4
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.shl_1
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.dw_3
this.Control[iCurrent+11]=this.dw_4
this.Control[iCurrent+12]=this.cbx_1
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.hpb_1
this.Control[iCurrent+15]=this.dw_5
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.st_8
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.gb_5
end on

on w_osaroi_esero_m.destroy
call super::destroy
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.shl_1)
destroy(this.st_4)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.st_5)
destroy(this.hpb_1)
destroy(this.dw_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_1)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

String   ls_day
DateTime ld_day

hpb_1.visible = false
dw_4.visible  = false		// CSV 신고용

dw_2.SetTransObject(SQLCA)
dw_2.InsertRow(1)
dw_2.GetChild('user', idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()

dw_3.SetTransObject(SQLCA)
dw_3.InsertRow(1)
dw_3.GetChild('cust_no', idwc_cust)
idwc_cust.InsertRow(1)
idwc_cust.setitem(1,'cust_no','%')
idwc_cust.setitem(1,'cust_name','전체')
idwc_cust.accepttext()

dw_5.visible = false
dw_5.SetTransObject(SQLCA)

//
ls_day = RightA(String(today(), "yyyy/mm/dd"), 2)
if ls_day > "15" then
	em_1.text = string(today(), 'YYYY/MM/01')
	em_2.text = string(today(), 'YYYY/MM/DD')
else
	em_1.text = string(RelativeDate(today(),  - (integer(ls_day) + 1)), "yyyy/mm/01")
	
	em_2.text = string(today(), 'YYYY/MM/01')
	em_2.text = String(RelativeDate(date(em_2.text), -1), "yyyy/mm/dd")
end if


end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 60
gb_2.height = newheight - 420

dw_1.width  = newwidth  - 115
dw_1.height = newheight - 580

end event

type pb_save from w_inheritance`pb_save within w_osaroi_esero_m
event aroi_print pbm_uonexternal01
integer x = 3451
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

debugbreak()

String  ls_Docname, ls_Named, ls_ExpandName, ls_custno, ls_custnm, ls_salesman
string  ls_aroiinv_no, ls_esero
long    ll_row
Integer ll_esero,   iY,   li_value, li_Pos, iRet
DataWindow ldw_sel, ldw_esero

dw_4.reset()

ll_esero  = 0
ldw_sel   = dw_1
ldw_esero = dw_4

ls_salesman = dw_2.getitemstring(dw_2.getrow(), "user")		// 영업담당자
ls_custno   = dw_3.getitemstring(dw_3.getrow(), "cust_no")	// 거래처
SELECT cust_name INTO :ls_custnm FROM customer WHERE cust_no = :ls_custno;

if ldw_sel.rowcount() > 0 then
	if rb_1.checked = true then	// 신규조회
	
		for ll_row = 1 to ldw_sel.rowcount()
			ls_esero      = ldw_sel.object.data[ll_row, 1]  
			ls_aroiinv_no = ldw_sel.object.data[ll_row, 3]  
			
			dw_4.InsertRow(0)
			ll_esero = ll_esero + 1
			for iY = 1 to 41
				ldw_esero.object.data[ll_esero, iY] = ldw_sel.object.data[ll_row, iY+1]
			next
      next
		
		//
		for ll_row = 1 to dw_5.rowcount()
			dw_5.object.esero[ll_row] = "Y"			
		next
		WF_Update1( dw_5, "Y" )
	else
		for ll_row = 1 to ldw_sel.rowcount()
			dw_4.InsertRow(0)
			ll_esero = ll_esero + 1
			for iY = 1 to 41
				ldw_esero.object.data[ll_esero, iY] = ldw_sel.object.data[ll_row, iY+1]
			next
      next
	end if

   if ldw_esero.rowcount() > 0 then
//		ls_Docname = ls_custnm
		li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "CSV", "CSV(쉽표로 분리), *.csv,")
		li_Pos   = PosA(ls_Named, ".")
		ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
		if li_value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				ldw_esero.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
				ldw_esero.SaveAs(ls_DocName, CSV!, TRUE)
			end if
		end if
	else
		MessageBox("확인","전자세금계산서(전송용) 파일 레코드가 존재하지 않습니다.",information!)	
   end if
	MessageBox("확인","전자세금계산서(전송용) 파일 작업완료!",information!)	
end if

//
st_3.text = "0"
dw_1.reset() ; dw_4.reset()

end event

type dw_1 from w_inheritance`dw_1 within w_osaroi_esero_m
integer x = 27
integer y = 588
integer width = 4256
integer height = 1396
integer taborder = 10
string dataobject = "d_osaroi_eseo_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;this.accepttext()

end event

type dw_2 from w_inheritance`dw_2 within w_osaroi_esero_m
integer x = 2501
integer y = 128
integer width = 663
integer height = 76
integer taborder = 90
string dataobject = "d_whlogin_esero"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::losefocus;call super::losefocus;this.accepttext()
dw_1.reset()

end event

type st_title from w_inheritance`st_title within w_osaroi_esero_m
integer x = 0
integer y = 0
integer width = 1531
integer height = 140
string text = "전자세금계산서(전송용)"
end type

type st_tips from w_inheritance`st_tips within w_osaroi_esero_m
end type

type pb_compute from w_inheritance`pb_compute within w_osaroi_esero_m
boolean visible = false
integer x = 4224
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroi_esero_m
boolean visible = false
integer x = 3826
integer width = 192
integer taborder = 110
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::mousemove;//w_whsaledodet_w
end event

event pb_print_part::clicked;ws_process st_process
OpenWithParm(w_whsaledodet_w, st_process)

end event

type pb_close from w_inheritance`pb_close within w_osaroi_esero_m
integer x = 3648
integer taborder = 80
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroi_esero_m
boolean visible = false
integer x = 4027
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_osaroi_esero_m
boolean visible = false
integer x = 3237
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_osaroi_esero_m
boolean visible = false
integer x = 3630
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_osaroi_esero_m
boolean visible = false
integer x = 3433
integer taborder = 50
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroi_esero_m
integer x = 3259
integer taborder = 150
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_custno, ls_salesman, ls_esero	// 조회용
long   ll_max, ll_RowCount, ll_esero

debugbreak()

if rb_1.checked = true then
	ls_esero = "N"
else
	ls_esero = "Y"
end if

ls_salesman     = dw_2.getitemstring(dw_2.getrow(), "user")
if ls_salesman  = "" then ls_salesman = "%"

ls_custno       = dw_3.getitemstring(dw_3.getrow(), "cust_no")
if ls_custno    = "" then ls_custno = "%"

dw_1.reset()

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_5.retrieve( ls_custno, em_1.text, em_2.text, ls_salesman )
dw_1.retrieve(ls_custno, em_1.text, em_2.text, ls_salesman, ls_esero)

st_3.text = string(dw_1.rowcount())	
dw_1.object.datawindow.horizontalscrollsplit= dw_1.object.세금계산서종류.x
MessageBox("조회", st_3.text + " 건을 조회 하였습니다.")

//
ll_esero    = dw_1.RowCount()		// 단수조정 추가용 IDX
ll_RowCount = dw_1.RowCount()
if ll_RowCount < 1 then RETURN


dw_1.setredraw( false )

// 세액합계와 단수차이 발생분 레코드 추가하기
long   ll_row,    ll_amount,  ll_vatamt,   ll_amt, ll_cnt, iY
string ls_aroiinv_no, ls_aroiinv_save

hpb_1.visible = true
ls_aroiinv_save = dw_1.object.data[1, 3]	// 문서번호 저장
for ll_row = 1 to ll_RowCount
	hpb_1.position = (ll_row / ll_RowCount) * 100			
	
	dw_1.object.data[ll_row, 1] = "Y"			   // 전송 강제처리함 
	ls_aroiinv_no = dw_1.object.data[ll_row, 3]  // 문서번호
	ll_amt        = dw_1.object.data[ll_row, 41] // 세액
	
	if ls_aroiinv_no = ls_aroiinv_save then
		ll_vatamt = ll_vatamt + ll_amt				// 세액 CHECK
	else
		ll_amount = dw_1.object.data[ll_row - 1, 31] 
		if ll_amount = ll_vatamt then // 세액합계 와 세액의 단수차이 발생시
		else
			ll_cnt = ll_cnt + 1
			ll_esero = ll_esero + 1
			for iY = 1 to 42
				CHOOSE CASE iY							
					CASE 1 to 33, 35, 42					
						dw_1.object.data[ll_esero, iY] = dw_1.object.data[ll_row - 1, iY]
					CASE 34					
						dw_1.object.data[ll_esero, iY] = dw_1.object.data[ll_row - 1, iY] + 1	// 상품일련번호
					CASE 36					
						dw_1.object.data[ll_esero, iY] = "부가세액조정"	// 품목명
					CASE 37					
						dw_1.object.data[ll_esero, iY] = ""	// 규격
					CASE 38					
						dw_1.object.data[ll_esero, iY] = 1	// 수량
					CASE 39, 40					
						dw_1.object.data[ll_esero, iY] = 0	// 단가,공급가액
					CASE 41					
						dw_1.object.data[ll_esero, iY] = (ll_amount - ll_vatamt)	// 세액(단수조정 만들기)
				END CHOOSE
			next
		end if
		
		ls_aroiinv_save = ls_aroiinv_no
		ll_vatamt = ll_amt
	end if			
next

if ls_aroiinv_no = ls_aroiinv_save then
	ll_amount = dw_1.object.data[ll_row - 1, 31] 
	if ll_amount = ll_vatamt then // 세액합계 와 세액의 단수차이 발생시
	else
		ll_cnt = ll_cnt + 1
		ll_esero = ll_esero + 1
		for iY = 1 to 42
			CHOOSE CASE iY							
				CASE 1 to 33, 35, 42					
					dw_1.object.data[ll_esero, iY] = dw_1.object.data[ll_row - 1, iY]
				CASE 34					
					dw_1.object.data[ll_esero, iY] = dw_1.object.data[ll_row - 1, iY] + 1	// 상품일련번호
				CASE 36					
					dw_1.object.data[ll_esero, iY] = "부가세액조정"	// 품목명
				CASE 37					
					dw_1.object.data[ll_esero, iY] = ""	// 규격
				CASE 38					
					dw_1.object.data[ll_esero, iY] = 1	// 수량
				CASE 39, 40					
					dw_1.object.data[ll_esero, iY] = 0	// 단가,공급가액
				CASE 41					
					dw_1.object.data[ll_esero, iY] = (ll_amount - ll_vatamt)	// 세액(단수조정 만들기)
			END CHOOSE
		next
	end if
	dw_1.SetSort('공급받는자사업자등록번호 A, 문서관리번호 A, 거래비고 A, 거래일자 A, 상품일련번호 A')			
end if

dw_1.Sort()
dw_1.groupcalc()
dw_1.setredraw( true )

if ll_cnt > 0 then
	MessageBox("확인","전자세금계산서(전송용) 파일작업에서 부가세액 단수조정 레코드를 " + String(ll_cnt,"###,##0") + " 건 생성 하였습니다.",information!)	
else
	MessageBox("확인","전자세금계산서(전송용) 파일 작업완료!~n~n(부가세액 단수조정 레코드 없음)",information!)	
end if

hpb_1.visible = false

end event

type gb_3 from w_inheritance`gb_3 within w_osaroi_esero_m
integer x = 2455
integer y = 12
integer width = 750
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_2 from w_inheritance`gb_2 within w_osaroi_esero_m
integer x = 27
integer y = 412
integer width = 4256
integer height = 164
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_osaroi_esero_m
integer x = 3227
integer width = 645
integer taborder = 0
end type

type gb_4 from groupbox within w_osaroi_esero_m
integer x = 32
integer y = 236
integer width = 4256
integer height = 160
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

type em_1 from editmask within w_osaroi_esero_m
integer x = 1618
integer y = 288
integer width = 434
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
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
end type

event rbuttondown;OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if


end event

type em_2 from editmask within w_osaroi_esero_m
integer x = 2075
integer y = 288
integer width = 434
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
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
end type

event rbuttondown;OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if


end event

type rb_1 from radiobutton within w_osaroi_esero_m
integer x = 1673
integer y = 136
integer width = 338
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "신규조회"
boolean checked = true
end type

event clicked;//cbx_1.enabled = true
//dw_1.object.전송.tabsequence = 10
//dw_1.reset()
//

cbx_1.checked = true
cbx_1.enabled = false
dw_1.object.전송.tabsequence = 0
dw_1.reset()

end event

type rb_2 from radiobutton within w_osaroi_esero_m
integer x = 2021
integer y = 136
integer width = 361
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "기 전송분"
end type

event clicked;cbx_1.checked = true
cbx_1.enabled = false
dw_1.object.전송.tabsequence = 0
dw_1.reset()
end event

type st_2 from statictext within w_osaroi_esero_m
integer x = 2537
integer y = 304
integer width = 279
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "조회수:"
alignment alignment = right!
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_3 from statictext within w_osaroi_esero_m
integer x = 2834
integer y = 304
integer width = 210
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "000"
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type shl_1 from statichyperlink within w_osaroi_esero_m
string tag = "사업장별 ID, PWD로 반드시 전송하시기 바랍니다."
integer x = 3045
integer y = 292
integer width = 1211
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 79416533
string text = "웹택스21(http://www.webtax21.com)"
boolean focusrectangle = false
string url = "http://www.webtax21.com"
end type

type st_4 from statictext within w_osaroi_esero_m
integer x = 306
integer y = 476
integer width = 4165
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "계산서종류: 01(세금), 02(수정), 분류: 01(일반), 02(영세), 영수/청구: 02(청구), 공급받는자 구분: 01(사업자), 02(주민)"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osaroi_esero_m
integer x = 366
integer y = 284
integer width = 859
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oscustomer_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.accepttext()
dw_1.reset()
end event

type dw_4 from datawindow within w_osaroi_esero_m
integer x = 183
integer y = 164
integer width = 151
integer height = 88
integer taborder = 110
boolean bringtotop = true
string title = "esero"
string dataobject = "d_osaroi_eseo_m_csv"
boolean resizable = true
end type

type cbx_1 from checkbox within w_osaroi_esero_m
integer x = 78
integer y = 472
integer width = 210
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
boolean enabled = false
string text = "ALL"
boolean checked = true
end type

event clicked;////
//String ls_msg
//Long	 ll_row
//
//IF RB_1.CHECKED = TRUE THEN
//	for ll_row = 1 to dw_1.rowcount()
//		IF cbx_1.checked = true then
//			dw_1.object.data[ll_row, 1] = "Y"
//	//		dw_1.scrolltorow(ll_row)
//		ELSE
//			dw_1.object.data[ll_row, 1] = "N"
//	//		dw_1.scrolltorow(ll_row)
//		END IF
//	next
//	dw_1.scrolltorow(1)
//	
//	IF cbx_1.checked = true then
//		ls_msg = "선택"
//	else
//		ls_msg = "해지"
//	end if
//	messagebox("완료", LS_MSG + " 작업을 완료 하였습니다.", exclamation!)
//ELSE
//	messagebox("확인", "기 전송분 조회시에는 해당사항이 없습니다.", exclamation!)
//	return
//END IF
end event

type st_5 from statictext within w_osaroi_esero_m
integer x = 2423
integer y = 232
integer width = 1435
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79416533
string text = "영업담당자 전체 조회시 신고파일 생성안됨."
alignment alignment = right!
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_osaroi_esero_m
integer x = 3045
integer y = 292
integer width = 1211
integer height = 80
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type dw_5 from datawindow within w_osaroi_esero_m
integer x = 46
integer y = 164
integer width = 123
integer height = 88
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_osaroi_eseo_m1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_osaroi_esero_m
integer x = 1682
integer y = 52
integer width = 718
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회구분"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_osaroi_esero_m
integer x = 2505
integer y = 52
integer width = 654
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회구분"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_osaroi_esero_m
integer x = 82
integer y = 300
integer width = 261
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_osaroi_esero_m
integer x = 1285
integer y = 300
integer width = 311
integer height = 60
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "출고기간"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_osaroi_esero_m
integer x = 1641
integer y = 12
integer width = 795
integer height = 204
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
end type

