$PBExportHeader$w_mpmprcpt_r.srw
$PBExportComments$생산계획별 입고 조회(1998/05/11, 이인호)
forward 
global type w_mpmprcpt_r from w_inheritance
end type
type tab_1 from tab within w_mpmprcpt_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_mpmprcpt_r
tabpage_1 tabpage_1
end type
type dw_4 from datawindow within w_mpmprcpt_r
end type
type gb_15 from groupbox within w_mpmprcpt_r
end type
type gb_4 from groupbox within w_mpmprcpt_r
end type
type dw_area from datawindow within w_mpmprcpt_r
end type
type em_1 from editmask within w_mpmprcpt_r
end type
type em_2 from editmask within w_mpmprcpt_r
end type
end forward

global type w_mpmprcpt_r from w_inheritance
integer width = 4055
integer height = 2208
string title = "생산계획 입고조회(w_mpmprcpt_r)"
long backcolor = 78160032
tab_1 tab_1
dw_4 dw_4
gb_15 gb_15
gb_4 gb_4
dw_area dw_area
em_1 em_1
em_2 em_2
end type
global w_mpmprcpt_r w_mpmprcpt_r

type variables
st_print i_print
string is_orderno
date id_date1, id_date2
end variables

on w_mpmprcpt_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.dw_4=create dw_4
this.gb_15=create gb_15
this.gb_4=create gb_4
this.dw_area=create dw_area
this.em_1=create em_1
this.em_2=create em_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.gb_15
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.em_2
end on

on w_mpmprcpt_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.dw_4)
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.dw_area)
destroy(this.em_1)
destroy(this.em_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
em_1.text = string(RelativeDate(today(), - 3), 'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

id_date1  = date(em_1.text)
id_date2  = today()


// area 추가 2003/02/26 임기천
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area
// area 추가 2003/02/26 임기천

end event

event resize;call super::resize;//gb_2.width  = this.width  - 2903
gb_2.height = this.height - 408

//dw_1.width  = this.width  - 2940
dw_1.height = this.height - 476

tab_1.width  = this.width  - 1285
tab_1.height = this.height - 780

tab_1.tabpage_1.dw_3.width  = this.width  - 1340
tab_1.tabpage_1.dw_3.height = this.height - 924


end event

type pb_save from w_inheritance`pb_save within w_mpmprcpt_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpmprcpt_r
integer x = 46
integer y = 276
integer width = 1115
integer height = 1756
integer taborder = 70
string dataobject = "d_mpquery_s"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

is_orderno = dw_1.object.order_no[ll_row]
dw_2.retrieve(is_orderno)
tab_1.tabpage_1.dw_3.retrieve(is_orderno)

end event

type st_title from w_inheritance`st_title within w_mpmprcpt_r
integer x = 32
integer width = 1147
string text = "생산계획 입고조회"
end type

type st_tips from w_inheritance`st_tips within w_mpmprcpt_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpmprcpt_r
boolean visible = false
integer taborder = 160
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpmprcpt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpmprcpt_r
integer x = 3762
integer y = 56
integer taborder = 170
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpmprcpt_r
integer x = 3570
integer y = 56
integer taborder = 180
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

IF tab_1.tabpage_1.dw_3.getrow() <= 0 THEN
   RETURN
END IF
tab_1.tabpage_1.dw_3.RowsCopy(1,  tab_1.tabpage_1.dw_3.RowCount(), Primary!, dw_4, 1, Primary!)

i_print.st_datawindow = dw_4
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 생산계획번호별 생산계획내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=87'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpmprcpt_r
boolean visible = false
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_mpmprcpt_r
boolean visible = false
integer taborder = 200
end type

type pb_insert from w_inheritance`pb_insert within w_mpmprcpt_r
boolean visible = false
integer taborder = 220
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpmprcpt_r
integer x = 3383
integer y = 56
integer taborder = 210
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
string ls_date 

ls_date = em_1.text
if isdate(ls_date) = false then return
id_date1 = date(ls_date)

ls_date = em_2.text
if isdate(ls_date) = false then return

id_date2 = date(ls_date)
dw_1.reset()
dw_2.reset()
tab_1.tabpage_1.dw_3.reset()

dw_1.retrieve(id_date1,id_date2, dw_area.object.area[1])
if dw_1.rowcount() < 1 then
	messagebox("에러","조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpmprcpt_r
integer x = 1207
integer width = 2766
integer height = 356
integer taborder = 140
end type

type gb_2 from w_inheritance`gb_2 within w_mpmprcpt_r
integer x = 27
integer width = 1152
integer taborder = 150
end type

type gb_1 from w_inheritance`gb_1 within w_mpmprcpt_r
integer x = 3355
integer y = 16
integer width = 622
end type

type dw_2 from w_inheritance`dw_2 within w_mpmprcpt_r
integer x = 1221
integer y = 272
integer width = 2734
integer height = 296
integer taborder = 130
string dataobject = "d_mpquery1_s"
boolean hscrollbar = true
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = true
end type

type tab_1 from tab within w_mpmprcpt_r
integer x = 1202
integer y = 604
integer width = 2770
integer height = 1452
integer taborder = 120
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 78160032
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2734
integer height = 1324
long backcolor = 78160032
string text = "입고내역"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "Project!"
long picturemaskcolor = 553648127
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer x = 5
integer y = 16
integer width = 2715
integer height = 1308
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpmprcpt_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_mpmprcpt_r
boolean visible = false
integer x = 2002
integer y = 72
integer width = 210
integer height = 116
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_mpmprcpt_r"
boolean livescroll = true
end type

type gb_15 from groupbox within w_mpmprcpt_r
integer x = 1271
integer y = 36
integer width = 567
integer height = 168
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_4 from groupbox within w_mpmprcpt_r
integer x = 1851
integer y = 36
integer width = 997
integer height = 168
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_area from datawindow within w_mpmprcpt_r
integer x = 1307
integer y = 96
integer width = 503
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type em_1 from editmask within w_mpmprcpt_r
integer x = 1961
integer y = 96
integer width = 366
integer height = 80
integer taborder = 60
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
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpmprcpt_r
integer x = 2414
integer y = 96
integer width = 366
integer height = 80
integer taborder = 60
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
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

