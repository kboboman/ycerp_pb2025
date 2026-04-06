$PBExportHeader$w_mpwcplan_r.srw
$PBExportComments$생산계획 대비 실적조회(1998/05/05, 이인호)
forward
global type w_mpwcplan_r from w_inheritance
end type
type dw_3 from datawindow within w_mpwcplan_r
end type
type rb_1 from radiobutton within w_mpwcplan_r
end type
type rb_2 from radiobutton within w_mpwcplan_r
end type
type dw_area from datawindow within w_mpwcplan_r
end type
type em_1 from editmask within w_mpwcplan_r
end type
type st_2 from statictext within w_mpwcplan_r
end type
type em_2 from editmask within w_mpwcplan_r
end type
type dw_4 from datawindow within w_mpwcplan_r
end type
type rb_3 from radiobutton within w_mpwcplan_r
end type
type rb_4 from radiobutton within w_mpwcplan_r
end type
type rb_5 from radiobutton within w_mpwcplan_r
end type
end forward

global type w_mpwcplan_r from w_inheritance
integer width = 3712
integer height = 2180
string title = "생산계획 대비 실적 조회(w_mpwcplan_r)"
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
dw_area dw_area
em_1 em_1
st_2 st_2
em_2 em_2
dw_4 dw_4
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
end type
global w_mpwcplan_r w_mpwcplan_r

type variables
st_print i_print
datawindowchild idwc_wc
string is_wc = ''
gs_itembaldo_str ist_code

end variables

on w_mpwcplan_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.dw_area=create dw_area
this.em_1=create em_1
this.st_2=create st_2
this.em_2=create em_2
this.dw_4=create dw_4
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.dw_area
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.dw_4
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.rb_4
this.Control[iCurrent+11]=this.rb_5
end on

on w_mpwcplan_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.dw_area)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.dw_4)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_4.insertrow(0)  
dw_4.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

dw_2.visible = false
dw_3.visible = false
string ls_colx

//ddlb_1.taxt = "작업장+납기+수주+제품코드"
dw_1.sharedata(dw_2)
dw_1.sharedata(dw_3)
ls_colx = dw_1.object.item_name1.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx

// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천

pb_retrieve.postevent(clicked!)
end event

event resize;call super::resize;dw_1.width  = this.width  - 105
dw_1.height = this.height - 504

end event

type pb_save from w_inheritance`pb_save within w_mpwcplan_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpwcplan_r
integer x = 23
integer y = 352
integer width = 3607
integer height = 1676
integer taborder = 50
string dataobject = "d_mpwcplan_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_mpwcplan_r
integer x = 1824
integer y = 48
integer width = 78
integer height = 68
integer taborder = 60
string dataobject = "d_mpplansale_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpwcplan_r
integer x = 55
integer y = 36
integer width = 1696
integer height = 128
string text = "생산계획 대비실적 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpwcplan_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpwcplan_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpwcplan_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpwcplan_r
integer x = 3410
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpwcplan_r
integer x = 3218
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if rb_1.checked = true then
	l_print.st_datawindow = dw_2
else
	l_print.st_datawindow = dw_3
end if
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 작업장별 생산계획 대비 실적 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpwcplan_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpwcplan_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpwcplan_r
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpwcplan_r
integer x = 3031
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_flag

if rb_3.checked = true then
	ls_flag = "%"   //생산계획여부
else
	if rb_4.checked = true then
		ls_flag = "Y%"
	else
		ls_flag = "N%"
	end if
end if
if is_wc = '전체' then is_wc = ''
dw_1.retrieve(is_wc + '%', date(em_1.text), date(em_2.text), ls_flag, dw_area.object.area[1])
if dw_1.rowcount() < 1 then
	messagebox("확인", "조회조건에 만족하는 내역이 없습니다.",information!)
   return
end if
	
end event

type gb_3 from w_inheritance`gb_3 within w_mpwcplan_r
integer x = 23
integer y = 216
integer width = 3607
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpwcplan_r
integer x = 2258
integer y = 12
integer width = 718
integer height = 204
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_mpwcplan_r
integer x = 3003
integer width = 622
end type

type dw_3 from datawindow within w_mpwcplan_r
integer x = 1938
integer y = 48
integer width = 78
integer height = 68
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpplansale_r2"
boolean livescroll = true
end type

type rb_1 from radiobutton within w_mpwcplan_r
integer x = 2322
integer y = 88
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "계획용"
boolean checked = true
end type

type rb_2 from radiobutton within w_mpwcplan_r
integer x = 2651
integer y = 88
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "보고용"
end type

type dw_area from datawindow within w_mpwcplan_r
integer x = 78
integer y = 248
integer width = 503
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type em_1 from editmask within w_mpwcplan_r
integer x = 1582
integer y = 252
integer width = 366
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
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
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_mpwcplan_r
integer x = 1975
integer y = 260
integer width = 55
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_mpwcplan_r
integer x = 2034
integer y = 252
integer width = 366
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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
string displaydata = "~b"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_4 from datawindow within w_mpwcplan_r
integer x = 654
integer y = 252
integer width = 846
integer height = 80
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_whwc_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

event itemchanged;is_wc = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")

end event

type rb_3 from radiobutton within w_mpwcplan_r
integer x = 2482
integer y = 252
integer width = 270
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "전체"
boolean checked = true
end type

type rb_4 from radiobutton within w_mpwcplan_r
integer x = 2775
integer y = 252
integer width = 389
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "생산계획"
end type

type rb_5 from radiobutton within w_mpwcplan_r
integer x = 3159
integer y = 252
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79220952
string text = "미생산계획"
end type

