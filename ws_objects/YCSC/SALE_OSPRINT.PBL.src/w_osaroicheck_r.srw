$PBExportHeader$w_osaroicheck_r.srw
$PBExportComments$세금계산서 미발행 체크 리스트(2008/01/10,정갑용)
forward
global type w_osaroicheck_r from w_inheritance
end type
type em_1 from editmask within w_osaroicheck_r
end type
type st_1 from statictext within w_osaroicheck_r
end type
type dw_3 from datawindow within w_osaroicheck_r
end type
type st_2 from statictext within w_osaroicheck_r
end type
type hpb_1 from hprogressbar within w_osaroicheck_r
end type
type mle_1 from multilineedit within w_osaroicheck_r
end type
type pb_1 from picturebutton within w_osaroicheck_r
end type
type cbx_1 from checkbox within w_osaroicheck_r
end type
type cbx_2 from checkbox within w_osaroicheck_r
end type
type st_amt from statictext within w_osaroicheck_r
end type
end forward

global type w_osaroicheck_r from w_inheritance
integer width = 4690
integer height = 2152
string title = "세금계산서 미발행 리스트(w_osaroicheck_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
hpb_1 hpb_1
mle_1 mle_1
pb_1 pb_1
cbx_1 cbx_1
cbx_2 cbx_2
st_amt st_amt
end type
global w_osaroicheck_r w_osaroicheck_r

type variables
datawindowchild idwc_user
end variables

on w_osaroicheck_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.hpb_1=create hpb_1
this.mle_1=create mle_1
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_amt=create st_amt
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.hpb_1
this.Control[iCurrent+6]=this.mle_1
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.cbx_1
this.Control[iCurrent+9]=this.cbx_2
this.Control[iCurrent+10]=this.st_amt
end on

on w_osaroicheck_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.hpb_1)
destroy(this.mle_1)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_amt)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_amount 

SELECT bigo INTO :ls_amount FROM codemst WHERE type = '세금계산서_미발행체크금액';
st_amt.text = ls_amount

dw_2.visible = false
if GF_PERMISSION("매출계산서_미발행체크리스트", gs_userid) = "Y" then
	pb_1.visible = true		// 차액분 일괄변경
	pb_1.enabled = true
else
	pb_1.visible = false
	pb_1.enabled = false
end if

if day(today()) > 10 then
	em_1.text = string(today(),'yyyy/mm')
else
	em_1.text = string(RelativeDate(today(), - day(today()) ),'yyyy/mm')
end if
dw_1.sharedata(dw_2)

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild('user',idwc_user)

idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
dw_3.object.user[1] = '%'
dw_3.enabled = true

idwc_user.accepttext()

mle_1.text     = ""
mle_1.visible  = false
hpb_1.position = 0
hpb_1.visible  = false

pb_retrieve.triggerevent(Clicked!)

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32

mle_1.x     = (dw_1.width - mle_1.width) / 2

end event

type pb_save from w_inheritance`pb_save within w_osaroicheck_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_osaroicheck_r
integer x = 32
integer y = 416
integer width = 4594
integer height = 1600
integer taborder = 60
string dataobject = "d_osaroicheck_r"
boolean hsplitscroll = true
borderstyle borderstyle = StyleLowered!
end type

event dw_1::resize;call super::resize;gb_2.width = dw_1.width + 35
gb_2.height = dw_1.height + 50

end event

event dw_1::clicked;call super::clicked;if row < 1 then return
//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
this.scrolltorow(row)

end event

type dw_2 from w_inheritance`dw_2 within w_osaroicheck_r
integer x = 1408
integer y = 8
integer width = 187
integer height = 144
integer taborder = 0
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_osaroicheck_r
integer width = 1742
string text = "매출계산서 미발행 체크 리스트"
end type

type st_tips from w_inheritance`st_tips within w_osaroicheck_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroicheck_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroicheck_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_osaroicheck_r
integer x = 4407
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroicheck_r
integer x = 4215
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
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

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroicheck_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osaroicheck_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osaroicheck_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroicheck_r
integer x = 4023
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_year, ls_month, ls_colx
st_security lst_security

dw_1.reset()
dw_2.reset()

dw_3.AcceptText()
mle_1.text = ""
mle_1.visible = false

if em_1.text = '' then
	messagebox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_date  = em_1.text
ls_year  = LeftA(ls_date, 4)
ls_month = RightA(ls_date, 2)
cbx_2.checked = false

string ls_level_userid

choose case gs_level
	case "A", "B"
		ls_level_userid = dw_3.object.user[1]
	case 'C'
		ls_level_userid = gs_userid
		dw_3.enabled    = false
end choose

dw_1.retrieve(ls_year + '-' + ls_month, ls_level_userid)
cbx_1.checked = true
cbx_1.triggerevent( Clicked! )

//ls_colx = dw_1.object.세금계산서.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx

end event

type gb_3 from w_inheritance`gb_3 within w_osaroicheck_r
integer x = 2075
integer y = 12
integer width = 1527
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroicheck_r
integer y = 224
integer width = 4594
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroicheck_r
integer x = 3621
integer width = 1006
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_osaroicheck_r
integer x = 2459
integer y = 88
integer width = 311
integer height = 76
integer taborder = 10
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
string mask = "yyyy/mm"
string displaydata = "T"
end type

type st_1 from statictext within w_osaroicheck_r
integer x = 2121
integer y = 100
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "해당 년월:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osaroicheck_r
integer x = 2875
integer y = 88
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_osaroicheck_r
integer x = 64
integer y = 300
integer width = 1074
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "(VAT포함) LOG 닫기: 우측마우스"
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_osaroicheck_r
integer x = 2834
integer y = 292
integer width = 1746
integer height = 64
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type mle_1 from multilineedit within w_osaroicheck_r
integer x = 681
integer y = 612
integer width = 3342
integer height = 1232
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = StyleLowered!
end type

event rbuttondown;mle_1.visible = false
end event

type pb_1 from picturebutton within w_osaroicheck_r
integer x = 3653
integer y = 52
integer width = 306
integer height = 148
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "차액분 일괄변경"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;//
integer li_won
decimal ld_amount		// 변경 기준금액
long    ll_i, ll_dw1cnt
string  ls_cust, ls_custname, ls_msg, ls_dono, ls_amount
date    ld_sdate, ld_edate

debugbreak()
SELECT bigo INTO :ls_amount FROM codemst WHERE type = '세금계산서_미발행체크금액';
if isnull(ls_amount) or ls_amount = "" then ls_amount = "99"

ld_amount = double(ls_amount)
if (MessageBox("확인", '조회된 내역중 차액이 발생한 전체거래처의 출하금액(헤더)의 차액금액 만큼 수정됩니다.~n~n' + &
                       '( ±' + ls_amount + ' 이내의 금액만 변경가능 합니다. )~n~n' + &
                       '( 변경작업이 이전 년도이면 이전년도의 년마감을 다시 돌려주시기바랍니다.(판매관리>관리>수금관리>년마감) )~n~n' + &
                       '차액분 일괄 변경 작업을 처리 하시겠습니까?', question!, yesno!, 2) = 2 ) then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

hpb_1.visible = true
ll_dw1cnt = dw_1.rowcount()
ld_sdate  = date(em_1.text + '-01')
ld_edate  = date(gf_lastday(em_1.text + '-01'))

for ll_i = 1 to ll_dw1cnt
	hpb_1.position = (ll_i / ll_dw1cnt) * 100
	
	if dw_1.object.차액[ll_i] <> 0 then
		ls_cust     = dw_1.object.코드[ll_i]
		ls_custname = dw_1.object.거래처명[ll_i]
		if (dw_1.object.차액[ll_i] >= (ld_amount * -1) and dw_1.object.차액[ll_i] <= ld_amount) then
		//if (dw_1.object.차액[ll_i] >= -25 and dw_1.object.차액[ll_i] <= 25) then
			li_won  = dw_1.object.차액[ll_i] * -1

         // 차액변경 대상조건 검색
         select top 1  do_no into :ls_dono
			  from do 
		    where do_date between :ld_sdate and :ld_edate and cust_no = :ls_cust
		      and do_rate  > 0
		      and do_total > 0
		      and ( (datalength(rem) < 44) or (rem is null) )
		    order by do_date desc;

		   if ls_dono = "" or isnull(ls_dono) then
				if MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + "~n~n차액변경 정상거래 대상조건에서 검색안됨." + &
				              "반품거래에서 계속 검색합니까?", Exclamation!, OKCancel!, 2) = 2 then
				else
					// 차액변경 대상조건 반품거래 검색
					select top 1  do_no into :ls_dono
					  from do 
					 where do_date between :ld_sdate and :ld_edate and cust_no = :ls_cust
						and do_rate  < 0
						and do_total < 0
						and ( (datalength(rem) < 44) or (rem is null) )
					 order by do_date desc;

					if ls_dono = "" or isnull(ls_dono) then
						MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액변경 반품거래 대상조건 검색안됨.', Exclamation!)
					else
						update do
							set do_rate  = do_rate  + :li_won,
								 do_total = do_total + :li_won,
								 rem =  rem + ':VAT' + (case when :li_won > 0 then ('+' + convert(varchar,:li_won)) else convert(varchar,:li_won) end )
						 where do_no = (select top 1  do_no
												from do 
											  where do_date between :ld_sdate and :ld_edate and cust_no = :ls_cust
												 and do_rate  < 0
												 and do_total < 0
												 and ( (datalength(rem) < 44) or (rem is null) )
											  order by do_date desc);
						if sqlca.sqlcode = 0 then
							commit;
						else
							rollback;
							MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액 변경 오류 발생!~n~n전산실에 문의 하세요.' + string(sqlca.sqlcode), stopsign!)
							return
						end if
					end if
				end if
			else
				update do
					set do_rate  = do_rate  + :li_won,
						 do_total = do_total + :li_won,
						 rem =  rem + ':VAT' + (case when :li_won > 0 then ('+' + convert(varchar,:li_won)) else convert(varchar,:li_won) end )
				 where do_no = (select top 1  do_no
										from do 
									  where do_date between :ld_sdate and :ld_edate and cust_no = :ls_cust
										 and do_rate  > 0
										 and do_total > 0
										 and ( (datalength(rem) < 44) or (rem is null) )
									  order by do_date desc);
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
					MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액 변경 오류 발생!~n~n전산실에 문의 하세요.' + string(sqlca.sqlcode), stopsign!)
					return
				end if
			end if
		else
			ls_msg = '거래처코드(' + ls_cust + '): ' + ls_custname + '  ' + String(dw_1.object.차액[ll_i],"###,##0") + CharA(13) + CharA(10)
			mle_1.text = mle_1.text + ls_msg
		end if
	end if
next

hpb_1.visible = false
if mle_1.text <> "" then mle_1.visible = true
MessageBox('확인', '작업이 완료 되었습니다.', information!)

end event

type cbx_1 from checkbox within w_osaroicheck_r
integer x = 1179
integer y = 292
integer width = 791
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "필터 : 차액 <> ZERO"
end type

event clicked;string ls_temp 

cbx_2.checked = false
ls_temp = ""
if this.checked = true then
	ls_temp = "차액 <> 0"
	dw_1.setfilter(ls_temp)
	dw_1.filter()
else
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

end event

type cbx_2 from checkbox within w_osaroicheck_r
integer x = 1979
integer y = 292
integer width = 686
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
string text = "당월매출 <> ZERO"
end type

event clicked;string ls_temp, ls_month

cbx_1.checked = false
ls_temp = ""
if this.checked = true then
	choose case RightA(em_1.text,2)
		case "01"
			ls_month = "compute_0005"
		case "02"
			ls_month = "compute_0006"
		case "03"
			ls_month = "compute_0007"
		case "04"
			ls_month = "compute_0008"
		case "05"
			ls_month = "compute_0009"
		case "06"
			ls_month = "compute_0010"
		case "07"
			ls_month = "compute_0011"
		case "08"
			ls_month = "compute_0012"
		case "09"
			ls_month = "compute_0013"
		case "10"
			ls_month = "compute_0014"
		case "11"
			ls_month = "compute_0015"
		case "12"
			ls_month = "compute_0016"
	end choose
	
	ls_temp = ls_month + " <> 0"
	dw_1.setfilter(ls_temp)
	dw_1.filter()
else
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

end event

type st_amt from statictext within w_osaroicheck_r
integer x = 1806
integer y = 132
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

