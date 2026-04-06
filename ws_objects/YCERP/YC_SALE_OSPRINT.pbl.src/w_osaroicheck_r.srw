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
type pb_1 from picturebutton within w_osaroicheck_r
end type
type cbx_1 from checkbox within w_osaroicheck_r
end type
type cbx_2 from checkbox within w_osaroicheck_r
end type
type st_amt from statictext within w_osaroicheck_r
end type
type cbx_3 from checkbox within w_osaroicheck_r
end type
type st_3 from statictext within w_osaroicheck_r
end type
type st_4 from statictext within w_osaroicheck_r
end type
type st_horizontal from u_splitbar_horizontal within w_osaroicheck_r
end type
type gb_4 from groupbox within w_osaroicheck_r
end type
type mle_1 from multilineedit within w_osaroicheck_r
end type
type st_5 from statictext within w_osaroicheck_r
end type
type ddlb_fld from dropdownlistbox within w_osaroicheck_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroicheck_r
end type
type st_6 from statictext within w_osaroicheck_r
end type
type ddlb_op from dropdownlistbox within w_osaroicheck_r
end type
type sle_value from singlelineedit within w_osaroicheck_r
end type
type cb_1 from commandbutton within w_osaroicheck_r
end type
type cb_2 from commandbutton within w_osaroicheck_r
end type
type cb_3 from commandbutton within w_osaroicheck_r
end type
type cb_5 from commandbutton within w_osaroicheck_r
end type
type dw_4 from datawindow within w_osaroicheck_r
end type
type st_vertical from u_splitbar_vertical within w_osaroicheck_r
end type
end forward

global type w_osaroicheck_r from w_inheritance
integer width = 4494
integer height = 2176
string title = "세금계산서 미발행 리스트(w_osaroicheck_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
hpb_1 hpb_1
pb_1 pb_1
cbx_1 cbx_1
cbx_2 cbx_2
st_amt st_amt
cbx_3 cbx_3
st_3 st_3
st_4 st_4
st_horizontal st_horizontal
gb_4 gb_4
mle_1 mle_1
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
dw_4 dw_4
st_vertical st_vertical
end type
global w_osaroicheck_r w_osaroicheck_r

type variables
datawindowchild idwc_user
string  is_dw

end variables

on w_osaroicheck_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
this.hpb_1=create hpb_1
this.pb_1=create pb_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_amt=create st_amt
this.cbx_3=create cbx_3
this.st_3=create st_3
this.st_4=create st_4
this.st_horizontal=create st_horizontal
this.gb_4=create gb_4
this.mle_1=create mle_1
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
this.dw_4=create dw_4
this.st_vertical=create st_vertical
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.hpb_1
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.cbx_2
this.Control[iCurrent+9]=this.st_amt
this.Control[iCurrent+10]=this.cbx_3
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_horizontal
this.Control[iCurrent+14]=this.gb_4
this.Control[iCurrent+15]=this.mle_1
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.ddlb_fld
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.ddlb_op
this.Control[iCurrent+21]=this.sle_value
this.Control[iCurrent+22]=this.cb_1
this.Control[iCurrent+23]=this.cb_2
this.Control[iCurrent+24]=this.cb_3
this.Control[iCurrent+25]=this.cb_5
this.Control[iCurrent+26]=this.dw_4
this.Control[iCurrent+27]=this.st_vertical
end on

on w_osaroicheck_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.hpb_1)
destroy(this.pb_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_amt)
destroy(this.cbx_3)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_horizontal)
destroy(this.gb_4)
destroy(this.mle_1)
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
destroy(this.dw_4)
destroy(this.st_vertical)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)

st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_4)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

string ls_amount 

SELECT bigo INTO :ls_amount FROM codemst WHERE type = '세금계산서_미발행체크금액';
st_amt.text = ls_amount

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

dw_4.settransobject(sqlca)

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild('user',idwc_user)

idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_3.object.user[1] = '%'
dw_3.enabled = true


mle_1.text     = ""
mle_1.visible  = false
hpb_1.position = 0
hpb_1.visible  = false

pb_retrieve.PostEvent(Clicked!)

end event

event resize;call super::resize;//
long  ll_height

gb_2.width  = newwidth  - (gb_2.x * 2)

ll_height   = newheight - dw_1.y - gb_2.x

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = ll_height * 0.6

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = dw_1.width

dw_2.y       = st_horizontal.y + st_horizontal.height
dw_2.width   = dw_1.width * 0.53
dw_2.height  = newheight - dw_2.y - gb_2.x

st_vertical.x       = dw_2.x + dw_2.width
st_vertical.y       = dw_2.y
st_vertical.height  = dw_2.height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.y      = dw_2.y
dw_4.width  = newwidth  - dw_4.x - gb_2.x
dw_4.height = newheight - dw_4.y - gb_2.x

mle_1.x     = (dw_1.width - mle_1.width) / 2

end event

type pb_save from w_inheritance`pb_save within w_osaroicheck_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_osaroicheck_r
integer x = 32
integer y = 416
integer width = 4375
integer height = 940
integer taborder = 60
string dataobject = "d_osaroicheck_r"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;if row < 1 then return

//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//this.SelectRow(0,  false)
//this.SelectRow(row,  true)
this.scrolltorow(row)

end event

event dw_1::doubleclicked;call super::doubleclicked;//
string ls_custno, ls_date, ls_year, ls_month

if isnull(row) OR row < 1 then RETURN

ls_custno  = this.object.코드[row]

ls_date  = em_1.text
ls_year  = LeftA(ls_date, 4)
ls_month = RightA(ls_date, 2)

dw_2.retrieve( ls_custno, ls_year + '-' + ls_month )
dw_4.retrieve( ls_custno, ls_year + '-' + ls_month )



end event

type st_title from w_inheritance`st_title within w_osaroicheck_r
integer y = 20
integer width = 1810
integer height = 140
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
integer x = 4187
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroicheck_r
integer x = 3995
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow dwxls

choose case is_dw
	case "dw_1"
		dwxls = dw_1
	case "dw_2"
		dwxls = dw_2
	case "dw_4"
		dwxls = dw_4
	case else
		RETURN
end choose

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsASCII(ls_DocName)
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
integer x = 3803
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

dw_1.reset() ; dw_2.reset() ; dw_4.reset()

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
is_dw  = dw_1.classname()
cbx_1.checked = true
cbx_1.triggerevent( Clicked! )

//ls_colx = dw_1.object.세금계산서.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx


end event

type gb_3 from w_inheritance`gb_3 within w_osaroicheck_r
integer x = 1888
integer y = 12
integer width = 1024
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroicheck_r
integer y = 224
integer width = 4375
integer height = 172
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroicheck_r
integer x = 3771
integer width = 635
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroicheck_r
integer x = 32
integer y = 1396
integer width = 3237
integer height = 636
integer taborder = 0
string dataobject = "d_osaroicheck_r1"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type em_1 from editmask within w_osaroicheck_r
integer x = 2226
integer y = 48
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
integer x = 1915
integer y = 48
integer width = 311
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "년월"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_osaroicheck_r
integer x = 2222
integer y = 128
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_osaroicheck_r
integer x = 73
integer y = 296
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
integer x = 41
integer y = 176
integer width = 1801
integer height = 64
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type pb_1 from picturebutton within w_osaroicheck_r
integer x = 3406
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
string  ls_cust, ls_custname, ls_msg, ls_dono, ls_sqlerrtext, ls_amount
integer li_won			// 소숫점 이하 오류시 double type 으로 변경처리
decimal ld_amount		// 변경 기준금액
long    ll_i, ll_dw1cnt
date    ld_sdate, ld_edate

debugbreak()

//UPDATE do
//   SET do_rate  = do_rate  + 0.5
//     , do_total = do_total + 0.5
//     , rem =  rem + ':VAT' + (case when 0.5 > 0 then ('+' + convert(varchar,0.5)) else convert(varchar,0.5) end )
// WHERE do_no = (SELECT top 1  do_no
//		              FROM do 
//	                WHERE do_date BETWEEN '2016/11/01' AND '2016/11/30'
//                   AND cust_no = 'U580'
//		               AND do_rate  > 0
//		               AND do_total > 0
//		               AND ( (datalength(rem) < 44) OR (rem is null) )
//	                ORDER BY do_date desc
//               );
//

SELECT bigo INTO :ls_amount FROM codemst WHERE type = '세금계산서_미발행체크금액';
if isnull(ls_amount) or ls_amount = "" then ls_amount = "99"

ld_amount = double(ls_amount)
if MessageBox("확인", '조회된 내역중 차액이 발생한 전체거래처의 출하금액(헤더)의 차액금액 만큼 수정됩니다.~n~n' + &
                      '( ±' + ls_amount + ' 이내의 금액만 변경가능 합니다. )~n~n' + &
                      '( 변경작업이 이전 년도이면 이전년도의 년마감을 다시 돌려주시기바랍니다.(판매관리>관리>수금관리>년마감) )~n~n' + &
                      '차액분 일괄 변경 작업을 처리 하시겠습니까?', question!, yesno!, 2) = 2 then
	RETURN
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
		ls_dono     = ""
		ls_cust     = dw_1.object.코드[ll_i]
		ls_custname = dw_1.object.거래처명[ll_i]
		
		if (dw_1.object.차액[ll_i] >= (ld_amount * -1) and dw_1.object.차액[ll_i] <= ld_amount) then
//		if (dw_1.object.차액[ll_i] >= -99 and dw_1.object.차액[ll_i] <= 99) then
			li_won  = dw_1.object.차액[ll_i] * -1

         // 차액변경 대상조건 검색
         SELECT top 1  do_no INTO :ls_dono
			  FROM do 
		    WHERE do_date BETWEEN :ld_sdate AND :ld_edate 
			   AND cust_no = :ls_cust
		      AND do_rate  > 0
		      AND do_total > 0
//		      AND ( (datalength(rem) < 44) or (rem is null) )	2021.08.09 jowonsuk 조건 주석처리(박수진차장 요청), 기존에 왜 이런로직을 넣었는지는 모르겠음 
		    ORDER BY do_date DESC;

		   if ls_dono = "" OR isnull(ls_dono) then
				if MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + "~n~n차액변경 정상거래 대상조건에서 검색안됨." + &
				              "반품거래에서 계속 검색합니까?", Exclamation!, OKCancel!, 2) = 2 then
				else
					// 차액변경 대상조건 반품거래 검색
					SELECT top 1  do_no INTO :ls_dono
					  FROM do 
					 WHERE do_date BETWEEN :ld_sdate AND :ld_edate 
					   AND cust_no = :ls_cust
						AND do_rate  < 0
						AND do_total < 0
//						AND ( (datalength(rem) < 44) or (rem is null) )
					 ORDER BY do_date DESC;

					if ls_dono = "" OR isnull(ls_dono) then
						MessageBox('경고', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액변경 반품거래 대상조건 검색안됨.', Exclamation!)
					else
						UPDATE do
							SET do_rate  = do_rate  + :li_won
							  , do_total = do_total + :li_won
							  , rem =  rem + ':VAT' + (case when :li_won > 0 then ('+' + convert(varchar,:li_won)) else convert(varchar,:li_won) end )
						 WHERE do_no = (SELECT top 1  do_no
												FROM do 
											  WHERE do_date BETWEEN :ld_sdate AND :ld_edate 
											    AND cust_no = :ls_cust
												 AND do_rate  < 0
												 AND do_total < 0
//												 AND ( (datalength(rem) < 44) or (rem is null) )
											  ORDER BY do_date DESC);
						if sqlca.sqlcode = 0 then
							COMMIT;
						else
							ROLLBACK;
							MessageBox('확인1', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액변경 오류 발생.', stopsign!)
							RETURN
						end if
					end if
				end if
			else  // 차액변경 대상조건 검색
				UPDATE do
					SET do_rate  = do_rate  + :li_won
					  , do_total = do_total + :li_won
					  , rem =  rem + ':VAT' + (case when :li_won > 0 then ('+' + convert(varchar,:li_won)) else convert(varchar,:li_won) end )
				 WHERE do_no = (SELECT top 1  do_no
										FROM do 
									  WHERE do_date BETWEEN :ld_sdate AND :ld_edate 
									    AND cust_no = :ls_cust
										 AND do_rate  > 0
										 AND do_total > 0
//										 AND ( (datalength(rem) < 44) or (rem is null) )
									  ORDER BY do_date desc);
				if sqlca.sqlcode = 0 then
					COMMIT;
				else
					ROLLBACK;
					MessageBox('확인2', '거래처코드(' + string(ll_i) + '): ' + ls_custname + '~n~n차액변경 오류 발생.', stopsign!)
					RETURN
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
mle_1.visible = false

end event

type cbx_1 from checkbox within w_osaroicheck_r
integer x = 1170
integer y = 324
integer width = 814
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
integer x = 2002
integer y = 324
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
integer x = 2967
integer y = 128
integer width = 416
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_osaroicheck_r
integer x = 1170
integer y = 260
integer width = 288
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
string text = "틀고정"
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = string(long(dw_1.object.차액.x) + long(dw_1.object.차액.width))
	dw_1.object.datawindow.horizontalscrollsplit = ls_colx
else
	ls_colx = "0"
	dw_1.object.datawindow.horizontalscrollsplit = ls_colx
end if

end event

type st_3 from statictext within w_osaroicheck_r
integer x = 1915
integer y = 128
integer width = 311
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "영업담당"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_osaroicheck_r
integer x = 2967
integer y = 52
integer width = 416
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "미발행 금액"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_horizontal from u_splitbar_horizontal within w_osaroicheck_r
integer x = 32
integer y = 1364
integer width = 4375
boolean bringtotop = true
end type

type gb_4 from groupbox within w_osaroicheck_r
integer x = 2935
integer y = 12
integer width = 814
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type mle_1 from multilineedit within w_osaroicheck_r
integer x = 1083
integer y = 652
integer width = 2729
integer height = 540
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
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;mle_1.visible = false
end event

type st_5 from statictext within w_osaroicheck_r
integer x = 2770
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_osaroicheck_r
integer x = 2958
integer y = 280
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_osaroicheck_r
integer x = 2990
integer y = 292
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

type st_6 from statictext within w_osaroicheck_r
integer x = 3429
integer y = 296
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

type ddlb_op from dropdownlistbox within w_osaroicheck_r
integer x = 3598
integer y = 280
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osaroicheck_r
integer x = 3918
integer y = 288
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

type cb_1 from commandbutton within w_osaroicheck_r
integer x = 4489
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose	
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_osaroicheck_r
integer x = 4654
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose	

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_osaroicheck_r
integer x = 4818
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose	
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_osaroicheck_r
integer x = 4983
integer y = 288
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
end choose	
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_4 from datawindow within w_osaroicheck_r
integer x = 3346
integer y = 1396
integer width = 1061
integer height = 636
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_osaroicheck_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_vertical from u_splitbar_vertical within w_osaroicheck_r
integer x = 3296
integer y = 1396
integer height = 636
boolean bringtotop = true
end type

