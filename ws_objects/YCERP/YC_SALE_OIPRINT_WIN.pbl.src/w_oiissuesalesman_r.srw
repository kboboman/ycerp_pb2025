$PBExportHeader$w_oiissuesalesman_r.srw
$PBExportComments$출고의뢰 담당자별 조회
forward
global type w_oiissuesalesman_r from w_inheritance
end type
type em_1 from editmask within w_oiissuesalesman_r
end type
type pb_1 from picturebutton within w_oiissuesalesman_r
end type
type dw_area from datawindow within w_oiissuesalesman_r
end type
type st_3 from statictext within w_oiissuesalesman_r
end type
type ddlb_fld from dropdownlistbox within w_oiissuesalesman_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiissuesalesman_r
end type
type st_4 from statictext within w_oiissuesalesman_r
end type
type sle_value from singlelineedit within w_oiissuesalesman_r
end type
type cb_1 from commandbutton within w_oiissuesalesman_r
end type
type cb_2 from commandbutton within w_oiissuesalesman_r
end type
type cb_3 from commandbutton within w_oiissuesalesman_r
end type
type cb_5 from commandbutton within w_oiissuesalesman_r
end type
type dw_locno from datawindow within w_oiissuesalesman_r
end type
type dw_sales from datawindow within w_oiissuesalesman_r
end type
type st_1 from statictext within w_oiissuesalesman_r
end type
type st_5 from statictext within w_oiissuesalesman_r
end type
type st_6 from statictext within w_oiissuesalesman_r
end type
type gb_4 from groupbox within w_oiissuesalesman_r
end type
type dw_3 from datawindow within w_oiissuesalesman_r
end type
type cbx_inside from checkbox within w_oiissuesalesman_r
end type
type cbx_hap from checkbox within w_oiissuesalesman_r
end type
type ddlb_op from dropdownlistbox within w_oiissuesalesman_r
end type
end forward

global type w_oiissuesalesman_r from w_inheritance
integer width = 4178
integer height = 2136
string title = "출고의뢰서(영업담당)[w_oiissuesalesman_r]"
em_1 em_1
pb_1 pb_1
dw_area dw_area
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_locno dw_locno
dw_sales dw_sales
st_1 st_1
st_5 st_5
st_6 st_6
gb_4 gb_4
dw_3 dw_3
cbx_inside cbx_inside
cbx_hap cbx_hap
ddlb_op ddlb_op
end type
global w_oiissuesalesman_r w_oiissuesalesman_r

type variables
st_print i_print
Integer  il_row
Date     id_start, id_end
String   is_dw, is_ret,   is_old_cust, is_dw6sql
DataWindowChild idwc_user, idwc_area, idwc_locno

end variables

forward prototypes
public function string wf_header ()
public subroutine wf_issuereq_mark (long al_dw2row)
end prototypes

public function string wf_header ();// wf_header retrun : string
//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where
string ls_reqdate, ls_salesman, ls_reqseq, ls_confirm, ls_acceptuser, ls_manager, ls_locno
long   ll_row

dw_1.accepttext()

ll_row        = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then
else
	ls_reqdate    = string(dw_2.object.req_date[dw_2.getrow()])
	ls_salesman   = dw_2.object.req_salesman[dw_2.getrow()]
	ls_reqseq     = string(dw_2.object.req_seq[dw_2.getrow()])
	ls_confirm    = dw_2.object.confirm_flag[dw_2.getrow()]
	ls_acceptuser = dw_2.object.accept_user[dw_2.getrow()]
end if

if ls_confirm = "Y" then	// 확정
	SELECT item_cd, rtrim(bigo) INTO :ls_manager, :ls_locno
	  FROM codemst 
    WHERE type =  '출고의뢰서_관리자' AND use_yn = 'Y' AND item_cd = :gs_userid;
	if gs_userid = ls_manager then
		lstr_where.str1 = ls_reqdate
		lstr_where.str2 = ls_salesman
		lstr_where.str3 = ls_reqseq
		lstr_where.chk  = "N"

		OpenWithParm( w_whissuereq_m, lstr_where )
		lstr_where = Message.PowerObjectParm
	else
		if gs_userid = ls_acceptuser then
			lstr_where.str1 = ls_reqdate
			lstr_where.str2 = ls_salesman
			lstr_where.str3 = ls_reqseq
			lstr_where.chk  = "N"
	
			OpenWithParm( w_whissuereq_m, lstr_where )
			lstr_where = Message.PowerObjectParm
		end if
	end if
else
	MessageBox("확인","미확정분은 출고담당자가 확정할 수 없습니다.")
end if
	
RETURN lstr_where.chk

end function

public subroutine wf_issuereq_mark (long al_dw2row);///////////////////////////////////////////////////////////////////
// ReturnType None : wf_issuereq_mark( al_dw2row long )
// 출고의뢰서 출력시 담당자 출력표시하기 
///////////////////////////////////////////////////////////////////
datetime   ldt_reqdate
string     ls_salesman, ls_accept, ls_chk, ls_chk0, ls_chk1, ls_chk2, ls_chk3, ls_chk4, ls_chk5
string     ls_confirm,  ls_sqlerrtext
long       ll_seq,  ll_row, ll_col, ll_dw2row

if isnull(al_dw2row) OR al_dw2row < 1 OR al_dw2row > dw_2.rowcount() then RETURN

ll_dw2row   = al_dw2row
ldt_reqdate = dw_2.object.req_date[ll_dw2row]
ls_salesman = dw_2.object.req_salesman[ll_dw2row]
ll_seq      = dw_2.object.req_seq[ll_dw2row]

// 담당자별 구분 없도록 변경
//for ll_col = 0 to 5 
//	ls_chk    = dw_2.GetItemString( ll_dw2row, "chk"+string(ll_col) )
//	
//	if ll_col = 0 then
//		ls_accept = dw_2.GetItemString( ll_dw2row, "accept_user" )
//	else
//		ls_accept = dw_2.GetItemString( ll_dw2row, "accept"+string(ll_col) )
//	end if
//	
//	if ls_accept = gs_userid then		
//		choose case ll_col
//			case 0
				dw_2.object.chk0[ll_dw2row] = "Y"

				UPDATE issuereq 
					SET chk0 = 'Y' 
				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
				 
//			case 1
//				dw_2.object.chk1[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk1 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 2
//				dw_2.object.chk2[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk2 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 3
//				dw_2.object.chk3[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk3 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 4
//				dw_2.object.chk4[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk4 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 5
//				dw_2.object.chk5[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk5 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//		end choose
//		dw_2.object.chkfont[ll_dw2row] = "Y"	// 표시하기
//
		if SQLCA.SQLCode <> 0 then
			ls_sqlerrtext = SQLCA.SQLErrText
			ROLLBACK;
			MessageBox("SQL error", ls_sqlerrtext)
		else
			COMMIT;			
		end if		
		
//		EXIT		// Loop Exit
//	end if
//next
//
end subroutine

on w_oiissuesalesman_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.pb_1=create pb_1
this.dw_area=create dw_area
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_locno=create dw_locno
this.dw_sales=create dw_sales
this.st_1=create st_1
this.st_5=create st_5
this.st_6=create st_6
this.gb_4=create gb_4
this.dw_3=create dw_3
this.cbx_inside=create cbx_inside
this.cbx_hap=create cbx_hap
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.dw_locno
this.Control[iCurrent+14]=this.dw_sales
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.dw_3
this.Control[iCurrent+20]=this.cbx_inside
this.Control[iCurrent+21]=this.cbx_hap
this.Control[iCurrent+22]=this.ddlb_op
end on

on w_oiissuesalesman_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_locno)
destroy(this.dw_sales)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.cbx_inside)
destroy(this.cbx_hap)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_1.visible = false
dw_2.visible = false

string ls_locno
long   ll_cnt

// 의뢰자
dw_sales.settransobject(sqlca)
dw_sales.insertrow(1)
dw_sales.getchild("user",idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1, "user_id",  "%")
idwc_user.setitem(1, "user_name","전체")
idwc_user.accepttext()
dw_sales.object.user[1] = "%"

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no",   "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()
dw_area.object.area[1] = "%"

// 저장소
dw_locno.SetTransObject(sqlca)		
dw_locno.insertrow(0)  

dw_locno.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)
idwc_locno.insertrow(1)
idwc_locno.setitem(1, "loc_no",   "%")
idwc_locno.setitem(1, "loc_name", "전체저장소")
idwc_locno.accepttext()

// 사업장의 기본저장소
SELECT count(loc_no) INTO :ll_cnt
  FROM location
 WHERE loc_manager is not null
   AND tel_no      is not null
   AND use_yn       = 'Y'
   AND area_no      = :gs_area;
if ll_cnt > 1 then
	SELECT def_loc  INTO :ls_locno FROM area WHERE area_no = :gs_area;
else
	ls_locno = "%"
end if
//idwc_locno.setfilter( "area_no = '" + gs_area + "'" )
//idwc_locno.filter()

dw_locno.object.loc_no[1] = "%"		// 기본값 설정	
dw_locno.accepttext()

//
em_1.text = string(today(), 'yyyy/mm/dd')


end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_oiissuesalesman_r
boolean visible = false
integer x = 3200
integer taborder = 30
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_oiissuesalesman_r
integer x = 59
integer y = 168
integer width = 128
integer height = 108
integer taborder = 50
end type

event dw_1::clicked;call super::clicked;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)
ldt_dodate  = dw_1.object.do_date[row]						// 출하시간

ldt_reqdate = dw_1.object.req_date[row]
ls_salesman = dw_1.object.salesman[row]
ll_reqseq   = dw_1.object.req_seq[row]
ll_seq      = dw_1.object.issuereqdet_seq[row]
ls_orderno  = dw_1.object.issuereqdet_sale_no[row]

end event

event dw_1::doubleclicked;call super::doubleclicked;////issuereqdet.req_flag = 'A' : 출고의뢰 .
////issuereqdet.req_flag = 'B' : "생산확인" text
////issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
////issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

ws_process st_process
string ls_sale

debugbreak()

if isnull(row) then RETURN

choose case row
	case 0		// header 선택
		if wf_header() <> "Y" then 
		else
			pb_retrieve.postevent(clicked!)
		end if
		
	case else	// detail 선택
		string ls_flag, ls_area
 
//		ls_area = this.object.issuereq_accept_area[row]
		ls_flag = this.object.issuereqdet_req_flag[row]
//		choose case ls_flag
//			case 'A'
////				if wf_detail('A') <> "Y" then return
//			case 'B', 'P'
////				if wf_detail('P') <> "Y" then return
//			case 'Z'
//				if wf_header()    <> "Y" then return
//			case else
////				if wf_detail('A') <> "Y" then return
//		end choose
//
//		//출고의뢰 상세 조회.
//		pb_retrieve.postevent(clicked!)

		st_process.sale_no = this.object.issuereqdet_sale_no[row]
		OpenWithParm( w_whsaledodet_w, st_process )
end choose

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(currentrow) OR currentrow < 1 then RETURN

this.scrolltorow(currentrow)
ldt_dodate  = dw_1.object.do_date[currentrow]						// 출하시간

ldt_reqdate = dw_1.object.req_date[currentrow]
ls_salesman = dw_1.object.salesman[currentrow]
ll_reqseq   = dw_1.object.req_seq[currentrow]
ll_seq      = dw_1.object.issuereqdet_seq[currentrow]
ls_orderno  = dw_1.object.issuereqdet_sale_no[currentrow]

end event

event dw_1::buttonclicked;call super::buttonclicked;//
gs_where lstr_where
string   ls_area
long     ll_row

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

choose case dwo.name
	case "b_car"
		dw_1.accepttext()
		
		lstr_where.str1 = this.object.issuereqdet_cust_no[row]
		lstr_where.str2 = this.object.issuereqdet_scene_code[row]
		lstr_where.str3 = string(this.object.req_date[row],"yyyy/mm/dd")		// 
		lstr_where.str4 = ls_area
		lstr_where.str5 = this.object.compute_3[row]
		lstr_where.chk  = ""
		
		OpenWithParm( w_whdocar_m, lstr_where )
		lstr_where = Message.PowerObjectParm
		
//		if lstr_where.chk = "Y" then
//			em_2.text = lstr_where.str3		// 차수
//		end if
end choose
end event

type st_title from w_inheritance`st_title within w_oiissuesalesman_r
integer x = 0
integer y = 0
integer width = 1330
integer height = 140
string text = "출고의뢰서(영업담당)"
end type

type st_tips from w_inheritance`st_tips within w_oiissuesalesman_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiissuesalesman_r
boolean visible = false
integer x = 2290
integer y = 0
integer width = 165
integer height = 132
integer taborder = 140
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = ""
alignment htextalign = center!
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiissuesalesman_r
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiissuesalesman_r
integer x = 3671
integer y = 76
integer height = 152
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oiissuesalesman_r
boolean visible = false
integer x = 3474
integer y = 76
integer height = 152
integer taborder = 160
end type

type pb_cancel from w_inheritance`pb_cancel within w_oiissuesalesman_r
boolean visible = false
integer x = 2821
integer y = 48
integer taborder = 170
boolean bringtotop = true
end type

type pb_delete from w_inheritance`pb_delete within w_oiissuesalesman_r
boolean visible = false
integer x = 2807
integer taborder = 180
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oiissuesalesman_r
boolean visible = false
integer x = 2610
integer taborder = 200
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuesalesman_r
integer x = 3282
integer y = 76
integer height = 152
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;call super::clicked;//
string  ls_area, ls_locno, ls_salesman, ls_inside, ls_sdate
date    ld_sdate

//
ls_sdate = em_1.text
ld_sdate = date(em_1.text)

//
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

//
dw_locno.accepttext()
ls_locno = dw_locno.object.loc_no[1]

//
dw_sales.accepttext()
ls_salesman = dw_sales.object.user[1]

// 계열사 제외
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "N"
end if

//
dw_3.retrieve( ls_sdate, ls_inside )
if dw_3.rowcount() < 1 then
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oiissuesalesman_r
integer x = 32
integer y = 272
integer width = 4078
integer height = 168
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 67108864
end type

type gb_2 from w_inheritance`gb_2 within w_oiissuesalesman_r
integer x = 1381
integer y = 16
integer width = 891
integer height = 248
integer taborder = 130
integer textsize = -9
long textcolor = 0
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oiissuesalesman_r
integer x = 3241
integer y = 16
integer width = 663
integer height = 248
integer taborder = 40
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oiissuesalesman_r
integer x = 201
integer y = 168
integer width = 128
integer height = 108
integer taborder = 60
string title = "출고의뢰 상세내역"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
datetime ldt_dodate
date   ld_date
string ls_user, ls_time, ls_confirm
int    li_seq

if isnull(row) OR row < 1 or row > this.rowcount() then RETURN

//
is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.scrolltorow(row)

ld_date    = date(em_1.text)
ls_user    = dw_2.object.req_salesman[row]
li_seq     = dw_2.object.req_seq[row]
ls_confirm = dw_2.object.confirm_flag[row]

dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)

this.setfocus()

end event

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
datetime ldt_dodate
date   ld_date
string ls_user, ls_time, ls_confirm
int    li_seq

if isnull(currentrow) OR currentrow < 1 or currentrow > this.rowcount() then RETURN

this.scrolltorow(currentrow)

ld_date    = date(em_1.text)
ls_user    = dw_2.object.req_salesman[currentrow]
li_seq     = dw_2.object.req_seq[currentrow]
ls_confirm = dw_2.object.confirm_flag[currentrow]

dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)
this.setfocus()

end event

type em_1 from editmask within w_oiissuesalesman_r
integer x = 2528
integer y = 160
integer width = 658
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -11
integer weight = 700
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
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_1 from picturebutton within w_oiissuesalesman_r
event mousemove pbm_mousemove
integer x = 3474
integer y = 76
integer width = 187
integer height = 152
integer taborder = 110
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

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value, iRet
DataWindow ldw_sel

choose case is_dw
	case "dw_2"
		ldw_sel = dw_2
	case "dw_3"
		ldw_sel = dw_3
	case else
		ldw_sel = dw_1
end choose
if ldw_sel.rowcount() < 1 then RETURN

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)

if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		ldw_sel.SaveAsAscII(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type dw_area from datawindow within w_oiissuesalesman_r
integer x = 1618
integer y = 68
integer width = 530
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////////////////////////////////////////////////////////////
//// 기본사업장에 다수의 저장소 존재시(기본저장소)			
////////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_defno
long   ll_cnt

dw_area.accepttext()
ls_area = trim(data)

//
if ls_area = "%" then
	idwc_locno.setfilter( "" )
else
	idwc_locno.setfilter( "area_no = '" + ls_area + "'" )
end if
idwc_locno.filter()

end event

type st_3 from statictext within w_oiissuesalesman_r
integer x = 82
integer y = 344
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

type ddlb_fld from dropdownlistbox within w_oiissuesalesman_r
integer x = 270
integer y = 328
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

type ddlb_dwtitles from dropdownlistbox within w_oiissuesalesman_r
integer x = 302
integer y = 340
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

type st_4 from statictext within w_oiissuesalesman_r
integer x = 741
integer y = 344
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

type sle_value from singlelineedit within w_oiissuesalesman_r
integer x = 1230
integer y = 332
integer width = 512
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

type cb_1 from commandbutton within w_oiissuesalesman_r
integer x = 1751
integer y = 332
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
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiissuesalesman_r
integer x = 1915
integer y = 332
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
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiissuesalesman_r
integer x = 2080
integer y = 332
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
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiissuesalesman_r
integer x = 2245
integer y = 332
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
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_locno from datawindow within w_oiissuesalesman_r
integer x = 1408
integer y = 156
integer width = 841
integer height = 84
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type dw_sales from datawindow within w_oiissuesalesman_r
integer x = 2528
integer y = 68
integer width = 672
integer height = 84
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_oiissuesalesman_r
integer x = 1408
integer y = 68
integer width = 210
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oiissuesalesman_r
integer x = 2318
integer y = 72
integer width = 210
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

type st_6 from statictext within w_oiissuesalesman_r
integer x = 2318
integer y = 160
integer width = 210
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
string text = "출고일"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oiissuesalesman_r
integer x = 2286
integer y = 16
integer width = 942
integer height = 248
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

type dw_3 from datawindow within w_oiissuesalesman_r
integer x = 32
integer y = 456
integer width = 4078
integer height = 1536
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oiissuereq_s_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_inside from checkbox within w_oiissuesalesman_r
integer x = 2441
integer y = 344
integer width = 466
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "계열사 제외"
end type

type cbx_hap from checkbox within w_oiissuesalesman_r
integer x = 2953
integer y = 344
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_2.visible = true then
	arg_dw = dw_2
elseif dw_3.visible = true then
	arg_dw = dw_3
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
	RETURN
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type ddlb_op from dropdownlistbox within w_oiissuesalesman_r
integer x = 919
integer y = 324
integer width = 302
integer height = 500
integer taborder = 180
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

