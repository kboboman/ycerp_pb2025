$PBExportHeader$w_mpsalercpt_r.srw
$PBExportComments$수주별 입고 조회(1998/05/11, 이인호)
forward
global type w_mpsalercpt_r from w_inheritance
end type
type tab_1 from tab within w_mpsalercpt_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_5 dw_5
end type
type tab_1 from tab within w_mpsalercpt_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_4 from datawindow within w_mpsalercpt_r
end type
type em_1 from editmask within w_mpsalercpt_r
end type
type em_3 from editmask within w_mpsalercpt_r
end type
type em_2 from editmask within w_mpsalercpt_r
end type
type em_4 from editmask within w_mpsalercpt_r
end type
type gb_4 from groupbox within w_mpsalercpt_r
end type
end forward

global type w_mpsalercpt_r from w_inheritance
integer width = 3579
string title = "수주별 입/출고조회(w_mpsalercpt_r)"
tab_1 tab_1
dw_4 dw_4
em_1 em_1
em_3 em_3
em_2 em_2
em_4 em_4
gb_4 gb_4
end type
global w_mpsalercpt_r w_mpsalercpt_r

type variables
st_print i_print
string is_saleno, is_custdosql
date id_date1, id_date2
end variables

on w_mpsalercpt_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.dw_4=create dw_4
this.em_1=create em_1
this.em_3=create em_3
this.em_2=create em_2
this.em_4=create em_4
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.em_4
this.Control[iCurrent+7]=this.gb_4
end on

on w_mpsalercpt_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_4)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_5.SetTransObject(SQLCA)
is_custdosql = tab_1.tabpage_2.dw_5.describe("datawindow.table.select")

em_1.text = string(today(),'yyyy')
em_3.text = MidA(string(today(),'yyyymmdd'), 5, 4)
id_date1 = today()
em_2.text = string(today(),'yyyy')
em_4.text = MidA(string(today(),'yyyymmdd'), 5, 4)
id_date2 = today()
em_3.setfocus()

end event

type pb_save from w_inheritance`pb_save within w_mpsalercpt_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpsalercpt_r
integer x = 55
integer y = 276
integer width = 539
integer height = 1756
integer taborder = 50
string dataobject = "d_mpsaleq_s"
boolean hscrollbar = false
boolean border = false
end type

event dw_1::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then
	return
end if

is_saleno = dw_1.object.order_no[ll_row]
dw_2.retrieve(is_saleno)
tab_1.tabpage_1.dw_3.retrieve(is_saleno)

string ls_where, ls_sql

ls_where = " and dodet.sale_no = ~~'" + is_saleno + "~~' "
ls_sql = "datawindow.table.select = '" + is_custdosql + ls_where + "'"
tab_1.tabpage_2.dw_5.modify(ls_sql)
tab_1.tabpage_2.dw_5.retrieve()
end event

type dw_2 from w_inheritance`dw_2 within w_mpsalercpt_r
integer x = 649
integer y = 272
integer width = 2843
integer height = 304
integer taborder = 70
string dataobject = "d_mpsaleq_t"
boolean vscrollbar = false
boolean border = false
end type

type st_title from w_inheritance`st_title within w_mpsalercpt_r
integer y = 40
integer width = 1554
string text = "수주별 입/출고 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsalercpt_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsalercpt_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsalercpt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsalercpt_r
integer x = 3296
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsalercpt_r
integer x = 3104
integer y = 64
integer taborder = 120
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
i_print.st_print_desc = " 이 프로그램은 수주별 입고내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsalercpt_r
boolean visible = false
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_mpsalercpt_r
boolean visible = false
integer taborder = 180
end type

type pb_insert from w_inheritance`pb_insert within w_mpsalercpt_r
boolean visible = false
integer taborder = 200
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsalercpt_r
integer x = 2917
integer y = 64
integer taborder = 190
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date 

ls_date = trim(em_1.text) + "/" + em_3.text
if isdate(ls_date) = false then
	beep(1)
	em_3.setfocus()
	return
end if
id_date1 = date(ls_date)

ls_date = trim(em_2.text) + "/" + em_4.text
if isdate(ls_date) = false then
	beep(1)
	em_4.setfocus()
	return
end if

id_date2 = date(ls_date)

tab_1.tabpage_1.dw_3.reset()
tab_1.tabpage_2.dw_5.reset()
dw_1.retrieve(id_date1,id_date2)

if dw_1.rowcount() < 1 then
	messagebox("에러","조회한 자료가 없습니다",Exclamation!)
end if
end event

type gb_3 from w_inheritance`gb_3 within w_mpsalercpt_r
integer x = 626
integer width = 2894
integer height = 368
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_mpsalercpt_r
integer width = 585
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_mpsalercpt_r
integer x = 2889
integer y = 24
integer width = 622
end type

type tab_1 from tab within w_mpsalercpt_r
integer x = 631
integer y = 604
integer width = 2889
integer height = 1452
integer taborder = 60
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
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2853
integer height = 1324
long backcolor = 79741120
string text = "입고내역"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "Custom034!"
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
integer y = 12
integer width = 2848
integer height = 1308
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpsalercpt_s"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2853
integer height = 1324
long backcolor = 79741120
string text = "출고내역"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "Custom033!"
long picturemaskcolor = 553648127
dw_5 dw_5
end type

on tabpage_2.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_2.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_2
integer x = 5
integer y = 12
integer width = 2848
integer height = 1308
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oicustdo_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_mpsalercpt_r
boolean visible = false
integer x = 1838
integer y = 60
integer width = 210
integer height = 116
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_mpsalercpt_r"
boolean livescroll = true
end type

type em_1 from editmask within w_mpsalercpt_r
integer x = 1810
integer y = 88
integer width = 192
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
boolean autoskip = true
end type

type em_3 from editmask within w_mpsalercpt_r
integer x = 2007
integer y = 88
integer width = 242
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "##/##"
boolean autoskip = true
end type

type em_2 from editmask within w_mpsalercpt_r
integer x = 2331
integer y = 88
integer width = 197
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
end type

type em_4 from editmask within w_mpsalercpt_r
integer x = 2528
integer y = 88
integer width = 242
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "##/##"
boolean autoskip = true
end type

type gb_4 from groupbox within w_mpsalercpt_r
integer x = 1783
integer y = 16
integer width = 1015
integer height = 196
integer taborder = 120
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

