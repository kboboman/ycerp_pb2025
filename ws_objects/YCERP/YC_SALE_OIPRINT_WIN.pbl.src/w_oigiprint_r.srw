$PBExportHeader$w_oigiprint_r.srw
$PBExportComments$출고의뢰 담당자별 조회
forward
global type w_oigiprint_r from w_inheritance
end type
type pb_1 from picturebutton within w_oigiprint_r
end type
type st_3 from statictext within w_oigiprint_r
end type
type ddlb_fld from dropdownlistbox within w_oigiprint_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oigiprint_r
end type
type st_4 from statictext within w_oigiprint_r
end type
type sle_value from singlelineedit within w_oigiprint_r
end type
type cb_1 from commandbutton within w_oigiprint_r
end type
type cb_2 from commandbutton within w_oigiprint_r
end type
type cb_3 from commandbutton within w_oigiprint_r
end type
type cb_5 from commandbutton within w_oigiprint_r
end type
type dw_3 from datawindow within w_oigiprint_r
end type
type ddlb_op from dropdownlistbox within w_oigiprint_r
end type
type em_3 from editmask within w_oigiprint_r
end type
type pb_2 from picturebutton within w_oigiprint_r
end type
type em_1 from editmask within w_oigiprint_r
end type
type em_2 from editmask within w_oigiprint_r
end type
type st_1 from statictext within w_oigiprint_r
end type
type pb_3 from picturebutton within w_oigiprint_r
end type
type gb_6 from groupbox within w_oigiprint_r
end type
type gb_4 from groupbox within w_oigiprint_r
end type
type dw_4 from datawindow within w_oigiprint_r
end type
type rb_1 from radiobutton within w_oigiprint_r
end type
type rb_2 from radiobutton within w_oigiprint_r
end type
end forward

global type w_oigiprint_r from w_inheritance
integer width = 6135
integer height = 2340
string title = "거래명세세서_리스트(KCC전용)[w_oigiprint_r]"
pb_1 pb_1
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_3 dw_3
ddlb_op ddlb_op
em_3 em_3
pb_2 pb_2
em_1 em_1
em_2 em_2
st_1 st_1
pb_3 pb_3
gb_6 gb_6
gb_4 gb_4
dw_4 dw_4
rb_1 rb_1
rb_2 rb_2
end type
global w_oigiprint_r w_oigiprint_r

type variables
string is_dw, is_scenesql, is_custscenesql, ls_cust_a[]

datawindowchild idwc_scene, idwc_custno
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

on w_oigiprint_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_3=create dw_3
this.ddlb_op=create ddlb_op
this.em_3=create em_3
this.pb_2=create pb_2
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.pb_3=create pb_3
this.gb_6=create gb_6
this.gb_4=create gb_4
this.dw_4=create dw_4
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.dw_3
this.Control[iCurrent+12]=this.ddlb_op
this.Control[iCurrent+13]=this.em_3
this.Control[iCurrent+14]=this.pb_2
this.Control[iCurrent+15]=this.em_1
this.Control[iCurrent+16]=this.em_2
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.pb_3
this.Control[iCurrent+19]=this.gb_6
this.Control[iCurrent+20]=this.gb_4
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.rb_1
this.Control[iCurrent+23]=this.rb_2
end on

on w_oigiprint_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.ddlb_op)
destroy(this.em_3)
destroy(this.pb_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.pb_3)
destroy(this.gb_6)
destroy(this.gb_4)
destroy(this.dw_4)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event open;call super::open;string ls_name, ls_cust_no_a[], ls_where, ls_sql

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_4.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(0)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_4.insertrow(0)

dw_1.visible = false
dw_2.visible = false

em_1.text = MidA(string(today(),"yyyy/mm/dd"),1,8)+'01'
em_2.text = string(today(),"yyyy/mm/dd")

em_3.text = LeftA(gs_area,1) + "D" + string(today(),'yyyymmdd')
em_3.SelectText(9, 2)
em_3.setfocus()

dw_4.getchild("cust_no", idwc_custno)
idwc_custno.insertrow(0)
idwc_custno.settransobject(sqlca)
is_custscenesql = idwc_custno.describe("datawindow.table.select")

//{'S131', 'N189', 'S113', 'U713'}
ls_cust_no_a[1] =  'S131'
ls_cust_no_a[2] =  'N189'		
ls_cust_no_a[3] =  'S113'		
ls_cust_no_a[4] =  'U713'			
ls_cust_no_a[5] =  'N718'	
ls_cust_no_a[6] =  'N719'	


ls_where =  " SELECT customer.cust_no,   " +&
			    "       customer.cust_name,       " +&
			    "       customer.open_close      "  +&
			    "    FROM customer  "                 +&
			    "   where customer.cust_no in ( ~~'" + ls_cust_no_a[1] + "~~', ~~'" + ls_cust_no_a[2] + "~~', ~~'" + ls_cust_no_a[3] + "~~', ~~'" + ls_cust_no_a[4] + "~~', ~~'" + ls_cust_no_a[5] + "~~', ~~'" + ls_cust_no_a[6] + "~~' )" + &			 
			   "  order by customer.open_close DESC " +&
			   "     , customer.cust_name ASC " 

ls_sql = "datawindow.table.select = '" + ls_where + "'"

idwc_custno.modify(ls_sql)
idwc_custno.retrieve()

//dw_4.object.idwc_custno.protect = 0
//dw_4.object.idwc_custno.background.color = RGB(255,255,255)

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

dw_3.width  = newwidth  - (gb_3.x * 2)
dw_3.height = newheight - dw_3.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_oigiprint_r
boolean visible = false
integer x = 5266
integer y = 660
integer taborder = 30
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_oigiprint_r
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

end event

type st_title from w_inheritance`st_title within w_oigiprint_r
integer y = 24
integer width = 1527
integer height = 140
string text = "거래명세서_리스트(KCC전용)"
end type

type st_tips from w_inheritance`st_tips within w_oigiprint_r
end type

type pb_compute from w_inheritance`pb_compute within w_oigiprint_r
boolean visible = false
integer x = 4987
integer y = 532
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

type pb_print_part from w_inheritance`pb_print_part within w_oigiprint_r
integer x = 5536
integer y = 88
integer height = 152
integer taborder = 20
string picturename = "c:\bmp\print.bmp"
end type

event pb_print_part::clicked;call super::clicked;w_repsuper w_print
st_print l_print
 
if dw_3.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_3
l_print.st_print_desc = " 이 프로그램은 KCC 거래명세 리스트를  출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"

IF rb_1.checked THEN 
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=10 ' + &
	                   'Datawindow.Zoom=57'
ELSE
gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=10 ' + &
	                   'Datawindow.Zoom=41'	
END IF							

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_close from w_inheritance`pb_close within w_oigiprint_r
integer x = 5737
integer y = 88
integer height = 152
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oigiprint_r
boolean visible = false
integer x = 5339
integer y = 88
integer height = 152
integer taborder = 160
end type

type pb_cancel from w_inheritance`pb_cancel within w_oigiprint_r
boolean visible = false
integer x = 4055
integer y = 276
integer taborder = 170
boolean bringtotop = true
end type

type pb_delete from w_inheritance`pb_delete within w_oigiprint_r
boolean visible = false
integer x = 4041
integer y = 280
integer taborder = 180
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oigiprint_r
boolean visible = false
integer x = 3845
integer y = 280
integer taborder = 200
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oigiprint_r
integer x = 5147
integer y = 88
integer height = 152
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;call super::clicked;string   ls_cust_no, ls_scene_code, ls_where, ls_sql, ls_curr_code, ls_start, ls_end, ls_cust_no_a[]
dec      ld_curr_rate
datetime ldt_dodate

dw_4.accepttext()
ls_cust_no_a[1]    = trim(dw_4.object.cust_no[1])
ls_scene_code = trim(dw_4.object.scene_code[1])
ls_start      = LeftA(em_1.text,4) + MidA(em_1.text,6,2) + RightA(em_1.text,2)
ls_end       = LeftA(em_2.text,4) + MidA(em_2.text,6,2) + RightA(em_2.text,2)

//{'S131', 'N189', 'S113', 'U713'}
if isnull(ls_cust_no_a[1]) or ls_cust_no_a[1]  = '' then
	ls_cust_no_a[1] =  'S131'
	ls_cust_no_a[2] =  'N189'		
	ls_cust_no_a[3] =  'S113'		
	ls_cust_no_a[4] =  'U713'			
	ls_cust_no_a[5] =  'N718'	
	ls_cust_no_a[6] =  'N719'		
else
	
end if


if isnull(ls_scene_code) or ls_scene_code = '' then
	ls_scene_code = '%'
end if

//IF cbx_3.checked THEN
//	ls_cust_no_a[1] =  'S131'
//	ls_cust_no_a[2] =  'N189'		
//	ls_scene_code = '%'	
//END IF

dw_3.retrieve(ls_cust_no_a, ls_scene_code, ls_start, ls_end)
end event

type gb_3 from w_inheritance`gb_3 within w_oigiprint_r
integer x = 32
integer y = 232
integer width = 4078
integer height = 168
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 67108864
end type

type gb_2 from w_inheritance`gb_2 within w_oigiprint_r
integer x = 1582
integer y = 80
integer width = 2994
integer height = 164
integer taborder = 130
integer textsize = -9
long textcolor = 0
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oigiprint_r
integer x = 5106
integer y = 28
integer width = 873
integer height = 248
integer taborder = 40
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oigiprint_r
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


dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
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

dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)
this.setfocus()

end event

type pb_1 from picturebutton within w_oigiprint_r
event mousemove pbm_mousemove
integer x = 5339
integer y = 88
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

ldw_sel = dw_3

if ldw_sel.rowcount() < 1 then RETURN

ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)

if ls_Value = 1 then
	
		
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		ldw_sel.SaveAs(ls_DocName, EXCEL!, TRUE)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type st_3 from statictext within w_oigiprint_r
integer x = 82
integer y = 304
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

type ddlb_fld from dropdownlistbox within w_oigiprint_r
integer x = 270
integer y = 288
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

type ddlb_dwtitles from dropdownlistbox within w_oigiprint_r
boolean visible = false
integer x = 302
integer y = 300
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
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
end type

type st_4 from statictext within w_oigiprint_r
integer x = 741
integer y = 304
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

type sle_value from singlelineedit within w_oigiprint_r
integer x = 1230
integer y = 292
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

type cb_1 from commandbutton within w_oigiprint_r
integer x = 1751
integer y = 292
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

type cb_2 from commandbutton within w_oigiprint_r
integer x = 1915
integer y = 292
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

type cb_3 from commandbutton within w_oigiprint_r
integer x = 2080
integer y = 292
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

type cb_5 from commandbutton within w_oigiprint_r
integer x = 2245
integer y = 292
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

type dw_3 from datawindow within w_oigiprint_r
integer x = 32
integer y = 412
integer width = 4078
integer height = 1580
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oigiprint_r2"
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

type ddlb_op from dropdownlistbox within w_oigiprint_r
integer x = 919
integer y = 284
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

type em_3 from editmask within w_oigiprint_r
boolean visible = false
integer x = 1893
integer y = 108
integer width = 489
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "HD2000"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!########-###"
boolean autoskip = true
end type

event losefocus;pb_compute.default = true

end event

type pb_2 from picturebutton within w_oigiprint_r
boolean visible = false
integer x = 1486
integer y = 172
integer width = 151
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;////
//string ls_cust, ls_scene, ls_dono, ls_name, ls_where, ls_sql
//long ll_row, ll_found, ll_cnt
// 
//ls_dono = TRIM(em_3.TEXT)
//
//if isnull(ls_dono) or ls_dono = '' then return
//
//setnull(ls_cust) ; setnull(ls_scene)
//
//SELECT cust_no, spot_code INTO :ls_cust, :ls_scene FROM do WHERE do_no = :ls_dono;
//if sqlca.sqlcode = 100 then 
//	em_3.setfocus()
//	return
//end if
//
//dw_3.object.cust_no[1]    = ls_cust
//dw_3.object.scene_code[1] = ls_scene
//if isnull(ls_scene) or trim(ls_scene) = '' then
//	dw_3.object.scene_code.protect = 1 
//	dw_3.object.scene_code.background.color = 78682240
//else
//	dw_3.getchild("scene_code", idwc_scene)
//	setnull(ls_name)
//	ls_where = " AND do.cust_no = ~~'" + ls_cust + "~~'"
//	ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
//	
//	idwc_scene.modify(ls_sql)
//	idwc_scene.retrieve()
//	dw_3.object.scene_code.protect = 0
//	dw_3.object.scene_code.background.color = RGB(255,255,255)
//end if
//
//this.default = false
//em_1.text = mid(em_3.TEXT, 3,4) + "/" + mid(em_3.TEXT, 7,2) + "/" + mid(em_3.TEXT, 9,2)
//em_2.text = mid(em_3.TEXT, 3,4) + "/" + mid(em_3.TEXT, 7,2) + "/" + mid(em_3.TEXT, 9,2)
//
//pb_retrieve.triggerevent(clicked!)
//
//ll_found = dw_4.Find( "do_no = '"+ ls_dono +"'", 1, dw_4.rowcount())
//if ll_found = 0 then
//	if dw_4.rowcount() > 0 then
//		messagebox("확인", "검색한 송장번호가 없습니다.")
//	end if
//	em_3.setfocus()
//else
//	dw_4.scrolltorow(ll_found)
//end if 
//
//
//
end event

type em_1 from editmask within w_oigiprint_r
integer x = 4603
integer y = 108
integer width = 357
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if

end event

type em_2 from editmask within w_oigiprint_r
integer x = 4699
integer y = 184
integer width = 357
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_1 from statictext within w_oigiprint_r
integer x = 4603
integer y = 184
integer width = 73
integer height = 72
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_oigiprint_r
boolean visible = false
integer x = 2382
integer y = 96
integer width = 137
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = left!
end type

event clicked;//
string ls_cust, ls_scene, ls_dono, ls_name, ls_where, ls_sql
long ll_row, ll_found, ll_cnt
 
ls_dono = TRIM(em_3.TEXT)

if isnull(ls_dono) or ls_dono = '' then return

setnull(ls_cust) ; setnull(ls_scene)

SELECT cust_no, spot_code INTO :ls_cust, :ls_scene FROM do WHERE do_no = :ls_dono;

if sqlca.sqlcode = 100 then 
	em_3.setfocus()
	return
end if

dw_4.object.cust_no[1]    = ls_cust
dw_4.object.scene_code[1] = ls_scene

if isnull(ls_scene) or trim(ls_scene) = '' then
	dw_4.object.scene_code.protect = 1 
	dw_4.object.scene_code.background.color = 78682240
else
	dw_4.getchild("scene_code", idwc_scene)
	setnull(ls_name)
	ls_where = " AND do.cust_no = ~~'" + ls_cust + "~~'"
	ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
	
	idwc_scene.modify(ls_sql)
	idwc_scene.retrieve()
	dw_4.object.scene_code.protect = 0
	dw_4.object.scene_code.background.color = RGB(255,255,255)
end if

this.default = false
em_1.text = MidA(em_3.TEXT, 3,4) + "/" + MidA(em_3.TEXT, 7,2) + "/" + MidA(em_3.TEXT, 9,2)
em_2.text = MidA(em_3.TEXT, 3,4) + "/" + MidA(em_3.TEXT, 7,2) + "/" + MidA(em_3.TEXT, 9,2)

pb_retrieve.triggerevent(clicked!)
end event

type gb_6 from groupbox within w_oigiprint_r
integer x = 4576
integer y = 56
integer width = 503
integer height = 216
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "출고일자"
end type

type gb_4 from groupbox within w_oigiprint_r
boolean visible = false
integer x = 1865
integer y = 32
integer width = 677
integer height = 216
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "출고번호"
end type

type dw_4 from datawindow within w_oigiprint_r
integer x = 1637
integer y = 124
integer width = 2898
integer height = 92
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_oigiuodate_ps"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_cust_no, ls_where, ls_sql, ls_null
long   ll_cnt

IF dwo.name <> 'cust_no' THEN	return

dw_4.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

this.accepttext()

ls_cust_no = this.getitemstring(1, "cust_no")	
setnull(ls_null)
this.object.scene_code[1] = ls_null

select count(*) into :ll_cnt from scene where cust_no = :ls_cust_no;
if ll_cnt < 0 then return

ls_where = " AND do.cust_no = ~~'" + ls_cust_no + "~~'"
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

idwc_scene.modify(ls_sql)
idwc_scene.retrieve()
	
if idwc_scene.rowcount() > 0 then
	this.object.scene_code.protect = 0
	this.object.scene_code.background.color = RGB(255,255,255)
else
	this.object.scene_code.protect = 1 
	this.object.scene_code.background.color = 78682240
end if

this.setfocus()

end event

type rb_1 from radiobutton within w_oigiprint_r
integer x = 1632
integer y = 24
integer width = 457
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "업체제출용"
boolean checked = true
end type

event clicked;IF THIS.CHECKED THEN
	DW_3.DATAOBJECT = 'd_oigiprint_r2'
ELSE
	DW_3.DATAOBJECT = 'd_oigiprint_r3'	
END IF

dw_3.settransobject(sqlca)
end event

type rb_2 from radiobutton within w_oigiprint_r
integer x = 2144
integer y = 24
integer width = 457
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "자사자료용"
end type

event clicked;IF THIS.CHECKED THEN
	DW_3.DATAOBJECT = 'd_oigiprint_r3'
ELSE
	DW_3.DATAOBJECT = 'd_oigiprint_r2'	
END IF

dw_3.settransobject(sqlca)
end event

