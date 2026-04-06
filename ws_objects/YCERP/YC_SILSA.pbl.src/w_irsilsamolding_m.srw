$PBExportHeader$w_irsilsamolding_m.srw
$PBExportComments$담당자 몰딩류 실사
forward 
global type w_irsilsamolding_m from w_inheritance
end type
type cb_3 from commandbutton within w_irsilsamolding_m
end type
type st_4 from statictext within w_irsilsamolding_m
end type
type cbx_1 from checkbox within w_irsilsamolding_m
end type
type dw_3 from datawindow within w_irsilsamolding_m
end type
type em_1 from editmask within w_irsilsamolding_m
end type
type st_1 from statictext within w_irsilsamolding_m
end type
type st_2 from statictext within w_irsilsamolding_m
end type
type em_2 from editmask within w_irsilsamolding_m
end type
type cbx_all from checkbox within w_irsilsamolding_m
end type
type gb_4 from groupbox within w_irsilsamolding_m
end type
end forward

global type w_irsilsamolding_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4210
integer height = 2556
string title = "담당자 몰딩류 실사(w_irsilsamolding_m)"
windowstate windowstate = normal!
cb_3 cb_3
st_4 st_4
cbx_1 cbx_1
dw_3 dw_3
em_1 em_1
st_1 st_1
st_2 st_2
em_2 em_2
cbx_all cbx_all
gb_4 gb_4
end type
global w_irsilsamolding_m w_irsilsamolding_m

type variables
gs_where istr_where
st_print i_print

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.visible  = false
dw_1.SetTransObject(SQLCA)
dw_3.SetTransObject(SQLCA)

string ls_getdate
ls_getdate = string(gf_today()) // 2011-11-23 15:01:50

em_1.text = LeftA(ls_getdate, 10)
em_2.text = "" // right(ls_getdate, 8)

//pb_retrieve.triggerevent(clicked!)
if gf_permission('담당자몰딩류실사', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if

end event

on w_irsilsamolding_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.em_2=create em_2
this.cbx_all=create cbx_all
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.em_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.em_2
this.Control[iCurrent+9]=this.cbx_all
this.Control[iCurrent+10]=this.gb_4
end on

on w_irsilsamolding_m.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.cbx_all)
destroy(this.gb_4)
end on

event resize;call super::resize;//
gb_2.width  = this.width  - 109
gb_2.height = this.height - 372

dw_1.width  = this.width  - 155
dw_1.height = this.height - 448

dw_3.x  = dw_1.x
dw_3.y  = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

end event

type pb_save from w_inheritance`pb_save within w_irsilsamolding_m
integer x = 3721
integer y = 64
end type

event pb_save::clicked;//
datetime ldt_time
long     ll_row

dw_1.accepttext()

if dw_1.rowcount() < 1 then return
if gf_permission('담당자몰딩류실사', gs_userid) = 'Y' then
else
	return
end if

SELECT top 1 getdate() INTO :ldt_time FROM login;

for ll_row = 1 to dw_1.rowcount()
	dw_1.object.checktime[ll_row] = ldt_time		// 저장시간 일치하도록
	
	if isnull(dw_1.object.groupitem[ll_row]) OR dw_1.object.groupitem[ll_row] <= "" THEN
		MessageBox("입력오류", string(ll_row) + " 번째 몰딩명을 선택하십시오")
		dw_1.setcolumn("groupitem")
		dw_1.setfocus()
		dw_1.scrolltorow(ll_row)
		return
	end if
next

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_irsilsamolding_m
integer x = 46
integer y = 276
integer width = 4055
integer height = 2108
string dataobject = "d_irsilsamolding_m"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;////
//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)
end event

type st_title from w_inheritance`st_title within w_irsilsamolding_m
integer width = 1321
string text = "담당자 몰딩류 실사"
end type

type st_tips from w_inheritance`st_tips within w_irsilsamolding_m
end type

type pb_compute from w_inheritance`pb_compute within w_irsilsamolding_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_irsilsamolding_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_irsilsamolding_m
integer x = 3913
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;//
close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irsilsamolding_m
integer x = 3529
integer y = 64
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 담당자 몰딩류 실사 리스트를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_irsilsamolding_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_irsilsamolding_m
integer x = 3337
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;string ls_driver, ls_bank_check
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_irsilsamolding_m
integer x = 3145
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;//
long     ll_row
DateTime ldt_OrderDateTime
date     ld_OrderDate
time     lt_OrderTime

string   ls_getdate
ls_getdate = string( gf_today() ) // 2011-11-23 15:01:50
em_1.text  = LeftA(ls_getdate, 10)
em_2.text  = RightA(ls_getdate, 8)

if Date( LeftA(ls_getdate,10) ) <> Date(em_1.text) then
		MessageBox("등록일자", ls_getdate + ", " + em_1.text + " 상호 일치하지 않습니다.~n~n시스템 일자로 등록합니다.")
end if

dw_1.accepttext()

ld_OrderDate = Date( LeftA(ls_getdate, 10) ) // Date(em_1.Text)
lt_OrderTime = Time(LeftA(em_2.text,5) + ":00.000")
ldt_OrderDateTime = DateTime( ld_OrderDate, lt_OrderTime)

if cbx_all.checked = true then
	INSERT INTO itemMOLDING
   SELECT getdate()
        , itemMOLDING.groupitem
        , itemMOLDING.qa   
        , itemMOLDING.color   
        , 0   
        , itemMOLDING.bigo  
     FROM itemMOLDING 
    WHERE convert(char(10),checktime,111) = '2014/07/25';
	if SQLCA.SQLCode = -1 then
		ROLLBACK;
		MessageBox("SQL error", SQLCA.SQLErrText)
	else
		COMMIT;
	end if
	
	pb_retrieve.triggerevent( clicked! )
else	
	ll_row = dw_1.insertrow(0)
	dw_1.object.checktime[ll_row] = ldt_OrderDateTime
	
	dw_1.scrolltorow(ll_row)
	dw_1.setcolumn('groupitem')
	dw_1.setfocus()
end if

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_irsilsamolding_m
integer x = 2953
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
string ls_getdate

ls_getdate = em_1.text + " " + em_2.text + ":00.000"
dw_1.retrieve( ls_getdate )
dw_3.retrieve( ls_getdate )

end event

type gb_3 from w_inheritance`gb_3 within w_irsilsamolding_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_irsilsamolding_m
integer x = 27
integer width = 4101
integer height = 2184
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_irsilsamolding_m
integer x = 2917
integer y = 16
integer width = 1211
integer height = 212
integer weight = 400
long textcolor = 0
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_irsilsamolding_m
boolean visible = false
integer x = 1509
integer y = 32
integer width = 82
integer height = 64
integer taborder = 60
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type cb_3 from commandbutton within w_irsilsamolding_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

type st_4 from statictext within w_irsilsamolding_m
integer x = 32
integer y = 208
integer width = 453
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "담당자몰딩류실사"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_irsilsamolding_m
integer x = 2217
integer y = 72
integer width = 576
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
string text = "몰딩류 현황보기"
end type

event clicked;//
if this.checked = true then	
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
	dw_1.visible = false
	dw_3.visible = true
else
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled   = true
	dw_1.visible = true
	dw_3.visible = false
end if

end event

type dw_3 from datawindow within w_irsilsamolding_m
integer x = 270
integer y = 604
integer width = 3689
integer height = 1564
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_itemmolding_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type em_1 from editmask within w_irsilsamolding_m
integer x = 1765
integer y = 60
integer width = 352
integer height = 76
integer taborder = 110
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
string mask = "yyyy-mm-dd"
boolean autoskip = true
end type

event modified;//id_start = date(this.text)
//messagebox("",string(id_date))

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_irsilsamolding_m
integer x = 1477
integer y = 80
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "등록일자"
boolean focusrectangle = false
end type

type st_2 from statictext within w_irsilsamolding_m
integer x = 1477
integer y = 148
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "등록시간"
boolean focusrectangle = false
end type

type em_2 from editmask within w_irsilsamolding_m
integer x = 1765
integer y = 136
integer width = 352
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
end type

type cbx_all from checkbox within w_irsilsamolding_m
integer x = 2217
integer y = 152
integer width = 576
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
string text = "일괄추가"
end type

type gb_4 from groupbox within w_irsilsamolding_m
integer x = 1440
integer y = 16
integer width = 1408
integer height = 212
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

