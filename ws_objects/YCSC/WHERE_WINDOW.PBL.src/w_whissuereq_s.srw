$PBExportHeader$w_whissuereq_s.srw
$PBExportComments$출고의뢰현황(2003/10/04,이인호)
forward
global type w_whissuereq_s from window
end type
type cb_2 from commandbutton within w_whissuereq_s
end type
type cb_1 from commandbutton within w_whissuereq_s
end type
type st_1 from statictext within w_whissuereq_s
end type
type cb_3 from commandbutton within w_whissuereq_s
end type
type st_5 from statictext within w_whissuereq_s
end type
type em_1 from editmask within w_whissuereq_s
end type
type dw_1 from datawindow within w_whissuereq_s
end type
type dw_3 from datawindow within w_whissuereq_s
end type
type gb_4 from groupbox within w_whissuereq_s
end type
end forward

global type w_whissuereq_s from window
string tag = "출고지시=>더블클릭   -  SIZE가 조정가능합니다...."
integer x = 2149
integer width = 4471
integer height = 2520
boolean titlebar = true
string title = "출고지시=>더블클릭   -  SIZE가 조정가능합니다...."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 79741120
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_1 st_1
cb_3 cb_3
st_5 st_5
em_1 em_1
dw_1 dw_1
dw_3 dw_3
gb_4 gb_4
end type
global w_whissuereq_s w_whissuereq_s

type variables
Integer	 ii_WindowBorder = 15, il_row
datawindow dw1, dw2
gs_where2 istr_select

end variables

forward prototypes
public function string wf_detail (string as_flag)
public function string wf_header ()
end prototypes

public function string wf_detail (string as_flag);//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where

dw_1.accepttext()
lstr_where.str1 = em_1.text
lstr_where.str2 = dw_3.object.issuereq_salesman[dw_3.getrow()]
lstr_where.str3 = string(dw_3.object.issuereq_req_seq[dw_3.getrow()])
lstr_where.str4 = as_flag
lstr_where.chk = 'N'
if dw_1.getrow() > 0 then
	lstr_where.str5 = string(dw_1.getrow())
else
	lstr_where.str5 = '0'
end if
openwithparm(w_whissuereqdet_m, lstr_where)

lstr_where = Message.PowerObjectParm
return lstr_where.chk

end function

public function string wf_header ();//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where

dw_1.accepttext()
lstr_where.str1 = em_1.text
lstr_where.str2 = dw_3.object.issuereq_salesman[dw_3.getrow()]
lstr_where.str3 = string(dw_3.object.issuereq_req_seq[dw_3.getrow()])
lstr_where.chk = "N"
openwithparm(w_whissuereq_m, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk = "Y" then
	em_1.text = lstr_where.str3
end if
return lstr_where.chk
end function

on w_whissuereq_s.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_3=create cb_3
this.st_5=create st_5
this.em_1=create em_1
this.dw_1=create dw_1
this.dw_3=create dw_3
this.gb_4=create gb_4
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_1,&
this.cb_3,&
this.st_5,&
this.em_1,&
this.dw_1,&
this.dw_3,&
this.gb_4}
end on

on w_whissuereq_s.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.dw_3)
destroy(this.gb_4)
end on

event open;//
dw_3.settransobject(sqlca)
em_1.text = string(today(), 'yyyy/mm/dd')
dw1 = w_oido_m.dw_1
dw2 = w_oido_m.dw_2
dw_1.settransobject(sqlca)

cb_3.postevent(clicked!)

end event

event resize;//dw_1.Resize (this.WorkSpaceWidth(), this.WorkSpaceHeight() - dw_1.Y)

//dw_1.Resize(newwidth - (2 * ii_WindowBorder), newheight - (dw_1.Y + ii_WindowBorder) -120)
//cb_ok.Move(dw_1.x + dw_1.width - cb_ok.width - 10, dw_1.y + dw_1.height + 10)
//dw_3.width = dw_1.width -30
//gb_4.width = dw_1.width
//st_1.y = dw_1.y + dw_1.height + 5


gb_4.width  = this.width  - 137
//gb_4.height = this.height - 2140

dw_3.width  = this.width  - 210
//dw_3.height = this.height - 2356

dw_1.width  = this.width  - 137
dw_1.height = this.height - 548

end event

type cb_2 from commandbutton within w_whissuereq_s
integer x = 1253
integer y = 56
integer width = 229
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;Close(parent)
end event

type cb_1 from commandbutton within w_whissuereq_s
integer x = 1010
integer y = 56
integer width = 229
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "출력"
end type

event clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then
	return
end if
parent.WindowState = Minimized!
//l_print.name = 'd_orsalesalemanrep_r1'
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 출고의뢰현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=86'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
w_print.setfocus()


end event

type st_1 from statictext within w_whissuereq_s
integer x = 69
integer y = 304
integer width = 4261
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "이름, 상세내역을 더블클릭시 조회가 됩니다."
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_whissuereq_s
integer x = 773
integer y = 56
integer width = 229
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
boolean default = true
end type

event clicked;dw_1.reset()
string ls_area

setnull(ls_area)
select issuereq_area into :ls_area from login
 where user_id = :gs_userid;
if gs_userid = '1999010s' or  &
	gs_userid = 'root' or  gs_userid = 'roots' or  gs_userid = 'rooth' or gs_userid = 'rootb' then
	ls_area = '%'
end if

il_row = dw_3.retrieve(ls_area, date(em_1.text), 'Y') // 'Y' : 확정된것만 조
//il_row = dw_3.retrieve('dbjung', date(em_1.text))

end event

type st_5 from statictext within w_whissuereq_s
integer x = 443
integer y = 72
integer width = 306
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
string text = "의 의뢰자"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whissuereq_s
integer x = 73
integer y = 60
integer width = 361
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;cb_3.postevent(clicked!)

end event

event rbuttondown;openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
	cb_3.postevent(clicked!)
end if

end event

type dw_1 from datawindow within w_whissuereq_s
integer x = 41
integer y = 400
integer width = 4334
integer height = 1956
integer taborder = 20
string dataobject = "d_oiissuereq_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
long  ll_row

opensheet(w_oido_m, w_o_main, 5, original!)
if dw_3.rowcount() < 1 then return
string ls_sale
choose case row
	case 0
		if wf_header() <> "Y" then 
		else
//			pb_retrieve.postevent(clicked!)
		end if
	case else
		string ls_flag
		
		ls_flag = this.object.issuereqdet_req_flag[row]
		choose case ls_flag
			case 'A'
				ls_sale = this.object.issuereqdet_sale_no[row]
				w_oido_m.em_3.text = ReplaceA(ls_sale, 11, 1, '')
				w_oido_m.pb_compute.triggerevent(clicked!)
				for ll_row = 1 to w_oido_m.dw_2.rowcount()
					if isnull(w_oido_m.dw_2.object.loc_no[ll_row]) &
						or trim(w_oido_m.dw_2.object.loc_no[ll_row]) = '' then
					else
						w_oido_m.dw_2.object.source[ll_row] = 'Y'
					end if
				next
				if w_oido_m.dw_1.rowcount() > 0 then
					w_oido_m.dw_1.object.do_area_no[1] = gs_area
				end if
// 정갑용- YSP사업장에서 작성할때는 미수불로 작성 2003년 10월 11일(한달정도 더 미수불로 하게요청(유갑부장))
//				If gs_area = 'B0001' Then
//					w_oido_m.wf_locno('C')
//				Else
					w_oido_m.wf_locno('A')
//				End IF
				
//				if wf_detail('A') <> "Y" then return
			case 'B', 'P'
				if wf_detail('P') <> "Y" then return
			case 'Z'
				if wf_header() <> "Y" then return
//			case else
//				if wf_detail('A') <> "Y" then return
		end choose
//		pb_retrieve.postevent(clicked!)
		//출고의뢰 상세 조회.
end choose

end event

event rowfocuschanged;////issuereqdet.req_flag = 'A' : 출고의뢰 .
////issuereqdet.req_flag = 'B' : "생산확인" text
////issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
////issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
//string ls_order
//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then return
//
//this.selectrow(0, false)
//this.selectrow(ll_row, true)
//
//ls_order = this.object.sale_order_no[ll_row]
//dw2.setredraw(false)
//
//dw2.retrieve(ls_order)
//
//dw2.setredraw(true)
//
end event

event getfocus;this.BringToTop = TRUE
end event

event buttonclicked;//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
long  ll_row

if dw_3.rowcount() < 1 then return
string ls_sale
choose case row
	case 0
	case else
		string ls_flag
		
		ls_flag = this.object.issuereqdet_req_flag[row]
		choose case ls_flag
			case 'A'
				if wf_detail('A') <> "Y" then return
			case 'B', 'P'
				if wf_detail('P') <> "Y" then return
			case 'Z'
				if wf_header() <> "Y" then return
			case else
				if wf_header() <> "Y" then return
		end choose
end choose

end event

type dw_3 from datawindow within w_whissuereq_s
integer x = 69
integer y = 144
integer width = 4261
integer height = 148
integer taborder = 10
string dataobject = "d_whissuereq_s"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

event clicked;//
this.BringToTop = true
if row < 1 or row > il_row then return

this.scrolltorow(row)

date     ld_date
string   ls_user, ls_time
int      li_seq
DateTime ld_time
string   ls_area

SELECT top 1 getdate() INTO :ld_time FROM login;
ls_time = string(ld_time,"yyyy/mm/dd hh:mm:ss")

ld_date = date(em_1.text)
ls_user = dw_3.object.issuereq_salesman[row]
li_seq  = dw_3.object.issuereq_req_seq[row]

dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()

this.BringToTop = true
this.setfocus()

end event

type gb_4 from groupbox within w_whissuereq_s
integer x = 41
integer y = 16
integer width = 4334
integer height = 364
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

