$PBExportHeader$w_whdocar_m.srw
$PBExportComments$배차계획 관리
forward 
global type w_whdocar_m from w_inheritance
end type
type st_5 from statictext within w_whdocar_m
end type
end forward

global type w_whdocar_m from w_inheritance
integer x = 599
integer y = 864
integer width = 3250
integer height = 1512
string title = "배차계획 관리(w_whdocar_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
event ue_location ( )
st_5 st_5
end type
global w_whdocar_m w_whdocar_m

type variables
//
gs_where ist_where
DataWindowChild idwc_car

end variables

forward prototypes
public function boolean wf_smssend ()
end prototypes

public function boolean wf_smssend ();//
// 영업사원이 출고의뢰한 경우 출고팀에게 문자전송 하기
String ls_salesman, ls_phone,   ls_phonename, ls_reqtext, ls_rem
string ls_sysdate,  ls_message, ls_confirm,   ls_usernm, ls_exist
string ls_area, ls_acceptuser,  ls_locno
long   lr_total

ls_area       = dw_1.object.accept_area[1]		// 사업장
ls_acceptuser = dw_1.object.accept_user[1]		// 수신자

SELECT loc_no INTO :ls_locno FROM location WHERE loc_manager = :ls_acceptuser AND use_yn = 'Y';

// 영업사원과 여직원 구분 
SELECT HP_NO  = REPLACE(SUBSTRING(LTRIM(RTRIM(ISNULL(A.HP_NO,''))),1,13), '-', '') 
  INTO :ls_salesman
  FROM SALEHP A
 WHERE A.USER_ID = :gs_userid  AND A.SALESMAN = 'Y';

if isnull(ls_salesman) or ls_salesman = "" then		// 출고여직원들
else																// 영업담당자들
	ls_confirm = dw_1.object.confirm_flag[1] 
	if ls_confirm = "Y" then		// 확정
		ls_sysdate  = string(dw_1.object.sys_date[1], "yyyy/mm/dd hh:mm")
		ls_usernm   = dw_1.object.salesman[1]
		ls_rem      = dw_1.object.rem[1]
		ls_reqtext  = dw_1.object.req_text[1]
		SELECT user_name INTO :ls_usernm FROM login WHERE user_id = :ls_usernm;
		
		ls_message  = "[출고의뢰:" + ls_usernm + "]" + ls_sysdate + "[참고:" + trim(ls_rem) + "][비고:" + trim(ls_reqtext) + "]"
		ls_message  = GF_HANGLE_TR(ls_message,80)
						
		SELECT item_cd, item_nm INTO :ls_phone, :ls_phonename
		  FROM codemst
		 WHERE type = '출고의뢰서_문자수신' AND use_yn = 'Y' AND BIGO = :ls_locno;

		choose case LeftA(ls_phone,3)
			case "010","011","016","017","018","019"
			case else
				ls_phone = ""
		end choose
			

		// 출고담당자
		if ls_phone = "" or isnull(ls_phone) then
		else
		// GF_MMSSEND( as_userid, as_sendhp, as_recvhp, as_recvname, as_message )
			GF_MMSSEND( gs_userid, '0226481998', ls_phone, ls_phonename, ls_message )
		end if	// 영업사원
	end if	// 확정
end if	// 영업사원 HP에 등록된 경우

return true

end function

on w_whdocar_m.create
int iCurrent
call super::create
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
end on

on w_whdocar_m.destroy
call super::destroy
destroy(this.st_5)
end on

event open;call super::open;//
string   ls_custno, ls_sceneno, ls_area, ls_custscene, ls_saleno
long     ll_row, ll_id
date     ld_cardate
datetime ldt_now

debugbreak()

ist_where    = Message.PowerObjectParm
ls_custno    = ist_where.str1
ls_sceneno   = ist_where.str2
ld_cardate   = date(ist_where.str3)
ls_area      = ist_where.str4
ls_custscene = ist_where.str5

dw_2.insertrow( 0 )
dw_2.getchild("car_gubun", idwc_car)
idwc_car.settransobject(sqlca)
ll_row = idwc_car.insertrow(0)
idwc_car.setitem(ll_row, 'item_cd', '99')
idwc_car.setitem(ll_row, 'item_nm', '기타')
idwc_car.setSort(" item_cd A ")
idwc_car.sort()

// 
dw_1.retrieve( ls_custno, ls_sceneno, ld_cardate )
if dw_1.rowcount() < 1 then
	dw_1.insertrow( 0 )
	dw_1.object.car_custno[1]  = ls_custno
	dw_1.object.car_scene[1]   = ls_sceneno
	dw_1.object.cardate[1]     = ld_cardate
	dw_1.object.area_no[1]     = ls_area
end if

dw_2.retrieve( ls_custno, ls_sceneno, ld_cardate )

end event

type pb_save from w_inheritance`pb_save within w_whdocar_m
integer x = 2409
integer y = 32
integer width = 398
integer height = 104
integer taborder = 30
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::mousemove;//
end event

event pb_save::clicked;call super::clicked;//
string   ls_custno, ls_sceneno, ls_custscene, ls_destination, ls_contents, ls_cargubun
string   ls_userid, ls_msg
long     ll_row, ll_cnt,  ll_id, ll_pid
time     lt_cartime
datetime ldt_cardate, ldt_now
integer  li_ret

dw_1.accepttext()
dw_2.accepttext()

debugbreak()

ls_custno   = dw_1.object.car_custno[1]
ls_sceneno  = dw_1.object.car_scene[1]
ldt_cardate = dw_1.object.cardate[1]

// 행삭제 확인
for ll_row = dw_2.rowcount() to 1 step -1
	lt_cartime   = time(dw_2.object.cartime[ll_row])
	ls_cargubun  = dw_2.object.car_gubun[ll_row]
	
	if isnull(lt_cartime) OR isnull(ls_cargubun) OR ls_cargubun = "" then 
		dw_2.deleterow( ll_row )
	end if
next
if dw_2.rowcount() < 1 then 
	MessageBox("확인","저장할 수 없습니다.")
	RETURN
end if


// 시간, 차량구분, 목적지
for ll_row = 1 to dw_2.rowcount()
	dw_2.object.custno[ll_row]   = ls_custno
	dw_2.object.scene[ll_row]    = ls_sceneno
	dw_2.object.cardate[ll_row]  = ldt_cardate
	dw_2.object.seq[ll_row]      = ll_row

	ls_userid  = dw_2.object.user_id[ll_row]
	if isnull(ls_userid) OR ls_userid = "" then
		dw_2.object.user_id[ll_row] = gs_userid
	end if
	
	lt_cartime = time(dw_2.object.cartime[ll_row])
	if isnull(lt_cartime) then 
		MessageBox("확인", "차량시간을 선택하시기 바랍니다.")
		RETURN
	end if

	ls_cargubun = dw_2.object.car_gubun[ll_row]
	if isnull(ls_cargubun) OR ls_cargubun = "" then 
		MessageBox("확인", "차량구분을 선택하시기 바랍니다.")
		RETURN
	end if
next

if wf_update2( dw_1, dw_2, "Y" ) = true then
	pb_close.triggerevent( clicked! )
end if


end event

type dw_1 from w_inheritance`dw_1 within w_whdocar_m
integer x = 23
integer y = 256
integer width = 3186
integer height = 308
integer taborder = 10
string dataobject = "d_oicarintervals_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemfocuschanged;call super::itemfocuschanged;//
choose case dwo.name
	case "cartime"
		dw_1.selecttext( 1, 5 )
end choose

end event

type st_title from w_inheritance`st_title within w_whdocar_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whdocar_m
end type

type pb_compute from w_inheritance`pb_compute within w_whdocar_m
boolean visible = false
integer x = 1600
integer y = 32
integer width = 398
integer height = 104
integer taborder = 0
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;call super::clicked;////
//string   ls_custno, ls_sceneno, ls_custscene, ls_contents, ls_cargubun, ls_msg
//long     ll_row, ll_cnt,  ll_id, ll_pid
//date     ld_cardate
//datetime ldt_now
//integer  li_ret
//
//dw_1.accepttext()
//dw_2.accepttext()
//
//debugbreak()
//
//// 행삭제 확인
//for ll_row = dw_2.rowcount() to 1 step -1
//	ls_contents  = dw_2.object.contents[ll_row]
//	if isnull(ls_contents) OR ls_contents = "" then
//		dw_2.deleterow( ll_row )
//	end if
//next
//
//ls_cargubun = dw_1.object.car_gubun[1]
//if isnull(ls_cargubun) OR ls_cargubun = "" then 
//	MessageBox("확인", "차량구분을 선택하시기 바랍니다.")
//	RETURN
//end if
//
//ls_custno   = dw_1.object.car_custno[1]
//ls_sceneno  = dw_1.object.car_scene[1]
//ld_cardate  = dw_1.object.cardate[1]
//
//ls_msg = "해당하는 수주번호의 출고차량을 이미 배정하였습니다.~n~n계속해서 배정하시겠습니까?"
//li_ret = MessageBox("확인",ls_msg, Exclamation!, YesNo!, 2)
//if li_ret = 2 then RETURN
//
//
//ll_id = ll_id + 1
//
//ldt_now      = datetime( date(now()), time(now()) )		
//ld_cardate   = date(dw_1.object.cardate[1])
//ls_custscene = dw_1.object.car_destination[1]
//
//dw_1.reset()
//dw_1.insertrow(0)
//
//dw_1.object.car_custno[1]      = ls_custno
//dw_1.object.car_scene[1]       = ls_sceneno
//dw_1.object.user_id[1]         = gs_userid
//dw_1.object.cardate[1]         = ld_cardate
//dw_1.object.cartime[1]         = ldt_now
//dw_1.object.car_gubun[1]       = ls_cargubun
//dw_1.object.car_destination[1] = ls_custscene
//
//dw_2.reset()
//dw_2.insertrow(0)
//dw_2.object.seq[1]  = 1
////wf_update2( dw_1, dw_2, "Y" )
//
////pb_close.triggerevent( clicked! )
//
end event

type pb_print_part from w_inheritance`pb_print_part within w_whdocar_m
boolean visible = false
integer taborder = 0
end type

type pb_close from w_inheritance`pb_close within w_whdocar_m
integer x = 2811
integer y = 32
integer width = 398
integer height = 104
integer taborder = 40
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;//
ist_where.chk = "N"
closewithreturn(parent, ist_where)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whdocar_m
boolean visible = false
integer taborder = 0
end type

type pb_cancel from w_inheritance`pb_cancel within w_whdocar_m
boolean visible = false
integer taborder = 0
end type

type pb_delete from w_inheritance`pb_delete within w_whdocar_m
boolean visible = false
integer taborder = 0
end type

type pb_insert from w_inheritance`pb_insert within w_whdocar_m
integer x = 2007
integer y = 32
integer width = 398
integer height = 104
integer taborder = 20
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "추가"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_insert::mousemove;//
end event

event pb_insert::clicked;call super::clicked;//
long  ll_row

ll_row = dw_2.insertrow( 0 )

dw_2.object.seq[ll_row]     = ll_row
dw_2.object.user_id[ll_row] = gs_userid
dw_2.object.cartime[ll_row] = datetime( date(now()), time(now()) )

dw_2.scrolltorow( ll_row )
dw_2.setcolumn( "cartime" )
dw_2.setfocus()


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_whdocar_m
boolean visible = false
integer taborder = 0
end type

type gb_3 from w_inheritance`gb_3 within w_whdocar_m
boolean visible = false
integer x = 1925
integer y = 724
integer width = 709
integer height = 128
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_whdocar_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 3131
integer height = 1044
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_whdocar_m
boolean visible = false
integer x = 1408
integer y = 1328
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_whdocar_m
integer x = 23
integer y = 576
integer width = 3186
integer height = 816
integer taborder = 0
string dataobject = "d_oicarintervals_m2"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemfocuschanged;call super::itemfocuschanged;//
choose case dwo.name
	case "cartime"
		dw_2.selecttext( 1, 5 )
end choose

end event

type st_5 from statictext within w_whdocar_m
integer x = 37
integer y = 40
integer width = 1239
integer height = 132
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "배차계획 관리"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

