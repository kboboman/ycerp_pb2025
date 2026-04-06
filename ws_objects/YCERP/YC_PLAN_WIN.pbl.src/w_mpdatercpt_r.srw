$PBExportHeader$w_mpdatercpt_r.srw
$PBExportComments$일자별 입고 조회(1998/05/11, 이인호)
forward 
global type w_mpdatercpt_r from w_inheritance
end type
type tab_1 from tab within w_mpdatercpt_r
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tab_1 from tab within w_mpdatercpt_r
tabpage_1 tabpage_1
end type
type pb_1 from picturebutton within w_mpdatercpt_r
end type
end forward

global type w_mpdatercpt_r from w_inheritance
integer width = 4544
integer height = 2300
string title = "기간별 입고현황(w_mpdatercpt_r)"
long backcolor = 78160032
tab_1 tab_1
pb_1 pb_1
end type
global w_mpdatercpt_r w_mpdatercpt_r

type variables
datawindowchild idwc_type,idwc_loc
string is_select,is_clause,is_where,is_select1
string is_select2,is_clause2,is_where2
string is_select3
string is_loc, is_type
date id_fromdate, id_todate
st_print i_print
end variables

on w_mpdatercpt_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.pb_1
end on

on w_mpdatercpt_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_clause, ls_where
long   ll_row

dw_2.visible = false
tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_3.sharedata(dw_2)
is_select1   = dw_1.Describe("DataWindow.Table.Select")

dw_1.insertrow(1)
dw_1.object.fromdate[1] = RelativeDate(today(), - 7)
dw_1.object.todate[1]   = today()

// 입출고 유형
dw_1.getchild('inaudit_type',idwc_type)
idwc_type.settransobject(sqlca)
is_select2 = idwc_type.Describe("DataWindow.Table.Select")

ls_clause = " where iotype.inaudit_type like ~~'R%~~'"
ls_where  = "DataWindow.Table.Select='" + is_select2 + ls_clause + "'"
idwc_type.Modify(ls_where)
idwc_type.Retrieve()

idwc_type.insertrow(1)
idwc_type.setitem(1,'inaudit_type','%')
idwc_type.setitem(1,'remarks','전체')
dw_1.object.inaudit_type[1] = "%"

//저장소
dw_1.getchild('loc_no',idwc_loc)
idwc_loc.settransobject(sqlca)
is_select3 = idwc_loc.Describe("DataWindow.Table.Select")

idwc_loc.insertrow(1)
idwc_loc.setitem(1,'loc_no','%')
idwc_loc.setitem(1,'loc_name','전체')



end event

event resize;call super::resize;//
tab_1.width  = this.width  - 96
tab_1.height = this.height - 548
tab_1.tabpage_1.dw_3.width  = tab_1.width  - 46
tab_1.tabpage_1.dw_3.height = tab_1.height - 136

end event

type pb_save from w_inheritance`pb_save within w_mpdatercpt_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpdatercpt_r
integer x = 46
integer width = 3237
integer height = 88
integer taborder = 50
string dataobject = "d_mpdatercpt_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;call super::itemchanged;long ll_row

this.accepttext()
ll_row = this.getrow()

is_loc = trim(this.object.loc_no[ll_row])
is_type = trim(this.object.inaudit_type[ll_row])
id_fromdate = date(this.object.fromdate[ll_row])
id_todate = date(this.object.todate[ll_row])



end event

type st_title from w_inheritance`st_title within w_mpdatercpt_r
integer width = 1371
string text = "기간별 입고현황"
end type

type st_tips from w_inheritance`st_tips within w_mpdatercpt_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpdatercpt_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpdatercpt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpdatercpt_r
integer x = 4261
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpdatercpt_r
integer x = 3854
integer y = 56
integer taborder = 110
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
gs_print_str lstr_print

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 기간별 입고 내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpdatercpt_r
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mpdatercpt_r
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpdatercpt_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpdatercpt_r
integer x = 3657
integer y = 56
integer taborder = 140
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long ll_found 

dw_1.accepttext()
ll_found = tab_1.tabpage_1.dw_3.retrieve(is_type, is_loc, id_fromdate, id_todate)
if ll_found < 1 then
	messagebox("확인", "선택한 자료가 없습니다.")
end if
//messagebox("", string(ll_found))

end event

type gb_3 from w_inheritance`gb_3 within w_mpdatercpt_r
boolean visible = false
integer x = 2066
integer y = 4
integer width = 366
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpdatercpt_r
integer x = 23
integer y = 224
integer width = 3296
integer height = 172
integer taborder = 80
long textcolor = 8388608
string text = "선택"
end type

type gb_1 from w_inheritance`gb_1 within w_mpdatercpt_r
integer x = 3621
integer y = 16
integer width = 855
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_mpdatercpt_r
integer x = 1719
integer y = 92
integer width = 119
integer height = 88
integer taborder = 60
string dataobject = "d_mpdatercpt_r"
boolean vscrollbar = false
end type

type tab_1 from tab within w_mpdatercpt_r
integer x = 23
integer y = 408
integer width = 4448
integer height = 1752
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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
integer width = 4411
integer height = 1624
long backcolor = 78160032
string text = "입고내역"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "CreateRuntime!"
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
integer y = 12
integer width = 4402
integer height = 1616
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpdatercpt_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_mpdatercpt_r
event mousemove pbm_mousemove
integer x = 4050
integer y = 56
integer width = 187
integer height = 144
integer taborder = 130
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

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if tab_1.tabpage_1.dw_3.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS," + "CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			tab_1.tabpage_1.dw_3.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			tab_1.tabpage_1.dw_3.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

