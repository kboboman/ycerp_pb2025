$PBExportHeader$w_mpsfcday_r.srw
$PBExportComments$생산일보 조회(1998/05/06, 이인호)
forward
global type w_mpsfcday_r from w_inheritance
end type
type tab_1 from tab within w_mpsfcday_r
end type
type tabpage_1 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type ddlb_4 from dropdownlistbox within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type ddlb_3 from dropdownlistbox within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
ddlb_4 ddlb_4
st_4 st_4
ddlb_3 ddlb_3
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_2
end type
type rb_4 from radiobutton within tabpage_2
end type
type rb_5 from radiobutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_4 dw_4
rb_4 rb_4
rb_5 rb_5
end type
type tabpage_3 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_4 from userobject within tab_1
end type
type cbx_1 from checkbox within tabpage_4
end type
type pb_3 from picturebutton within tabpage_4
end type
type dw_8 from datawindow within tabpage_4
end type
type em_calc from editmask within tabpage_4
end type
type st_1 from statictext within tabpage_4
end type
type pb_4 from picturebutton within tabpage_4
end type
type cbx_7 from checkbox within tabpage_4
end type
type cbx_edit from checkbox within tabpage_4
end type
type ddlb_2 from dropdownlistbox within tabpage_4
end type
type cb_12 from commandbutton within tabpage_4
end type
type cb_4 from commandbutton within tabpage_4
end type
type cb_filteroff from commandbutton within tabpage_4
end type
type cb_filteron from commandbutton within tabpage_4
end type
type st_9 from statictext within tabpage_4
end type
type ddlb_col from dropdownlistbox within tabpage_4
end type
type sle_value from singlelineedit within tabpage_4
end type
type cbx_all from checkbox within tabpage_4
end type
type dw_7 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cbx_1 cbx_1
pb_3 pb_3
dw_8 dw_8
em_calc em_calc
st_1 st_1
pb_4 pb_4
cbx_7 cbx_7
cbx_edit cbx_edit
ddlb_2 ddlb_2
cb_12 cb_12
cb_4 cb_4
cb_filteroff cb_filteroff
cb_filteron cb_filteron
st_9 st_9
ddlb_col ddlb_col
sle_value sle_value
cbx_all cbx_all
dw_7 dw_7
end type
type tab_1 from tab within w_mpsfcday_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type gb_15 from groupbox within w_mpsfcday_r
end type
type gb_4 from groupbox within w_mpsfcday_r
end type
type em_1 from editmask within w_mpsfcday_r
end type
type em_2 from editmask within w_mpsfcday_r
end type
type dw_area from datawindow within w_mpsfcday_r
end type
type dw_5 from datawindow within w_mpsfcday_r
end type
type pb_1 from picturebutton within w_mpsfcday_r
end type
type pb_2 from picturebutton within w_mpsfcday_r
end type
end forward

global type w_mpsfcday_r from w_inheritance
integer width = 4430
integer height = 2640
string title = "생산일보 조회(w_mpsfcday_r)"
tab_1 tab_1
gb_15 gb_15
gb_4 gb_4
em_1 em_1
em_2 em_2
dw_area dw_area
dw_5 dw_5
pb_1 pb_1
pb_2 pb_2
end type
global w_mpsfcday_r w_mpsfcday_r

type prototypes

end prototypes

type variables
st_print i_print
date     id_start,id_end
string   is_mess , is_wcno
datawindowchild idwc_wc
end variables

on w_mpsfcday_r.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.gb_15=create gb_15
this.gb_4=create gb_4
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.dw_5=create dw_5
this.pb_1=create pb_1
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.gb_15
this.Control[iCurrent+3]=this.gb_4
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.pb_2
end on

on w_mpsfcday_r.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.gb_15)
destroy(this.gb_4)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.pb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_7.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_8.SetTransObject(SQLCA)	// 계산식 목록

tab_1.tabpage_4.dw_8.x = tab_1.tabpage_4.pb_3.x
tab_1.tabpage_4.dw_8.visible = false
tab_1.tabpage_4.dw_8.retrieve()

dw_5.visible = false
tab_1.tabpage_1.ddlb_1.text = "거래처별 합계"

//
dw_1.insertrow(1)
dw_1.object.wc_no[1] = "%"
dw_1.getchild('wc_no',idwc_wc)

idwc_wc.settransobject(sqlca)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no','%')
idwc_wc.setitem(1,'work_name','전체')
idwc_wc.accepttext()

em_1.text = string(RelativeDate( today(), - 7 ), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

id_start  = date(em_1.text)
id_end    = date(em_2.text)
dw_2.visible = false

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

tab_1.tabpage_4.cbx_edit.checked = false
tab_1.tabpage_4.cbx_edit.triggerevent( clicked! )

end event

event resize;call super::resize;//
tab_1.width  = this.width  - 128
tab_1.height = this.height - 396

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 78
tab_1.tabpage_1.dw_3.height = tab_1.height - 256

tab_1.tabpage_2.dw_4.width  = tab_1.tabpage_1.dw_3.width
tab_1.tabpage_2.dw_4.height = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_3.dw_6.width  = tab_1.tabpage_1.dw_3.width
tab_1.tabpage_3.dw_6.height = tab_1.tabpage_1.dw_3.height

tab_1.tabpage_4.dw_7.width  = tab_1.tabpage_1.dw_3.width
tab_1.tabpage_4.dw_7.height = tab_1.tabpage_1.dw_3.height

end event

type pb_save from w_inheritance`pb_save within w_mpsfcday_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcday_r
integer x = 2199
integer y = 60
integer width = 873
integer height = 88
integer taborder = 30
string dataobject = "d_mpwcno_s"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_1::itemchanged;long ll_row

this.accepttext()
is_wcno = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) 
if is_wcno = '전체' then
	is_wcno = ''
end if

end event

type dw_2 from w_inheritance`dw_2 within w_mpsfcday_r
integer x = 905
integer y = 16
integer width = 101
integer height = 72
integer taborder = 70
string dataobject = "d_mpsfcday_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_mpsfcday_r
integer x = 41
integer width = 983
integer height = 128
string text = "생산일보 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcday_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcday_r
boolean visible = false
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcday_r
boolean visible = false
integer taborder = 40
end type

type pb_close from w_inheritance`pb_close within w_mpsfcday_r
integer x = 4114
integer y = 68
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcday_r
integer x = 3726
integer y = 68
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_print_str lstr_print
w_repsuper   w_print
string ls_sql, ls_where, ls_source

if tab_1.selectedtab = 1 then
	choose case tab_1.tabpage_1.ddlb_1.text
		case "거래처별 합계"
			gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
			dw_2.dataobject  = 'd_mpsfcday_r'

		case "작업장별 합계"
         gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.top = 304'
			dw_2.dataobject  = 'd_mpsfcday_r2'

		case "일자별"
         gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.top = 304'
			dw_2.dataobject  = 'd_mpsfcday_r3'

		case "리스트"
			gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=95  DataWindow.print.margin.left = 304'
			dw_2.dataobject  = 'd_mpsfcday_t4'
		case "CHK리스트"
	end choose

	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_1.dw_3.sharedata(dw_2)
	
elseif tab_1.selectedtab = 2 then
	if tab_1.tabpage_2.rb_4.checked = true then
		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=85  DataWindow.print.margin.left = 304'
		dw_2.dataobject  = 'd_mpsfcday2_t'
	elseif tab_1.tabpage_2.rb_5.checked = true then
		gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
	   dw_2.dataobject  = 'd_mpsfcday2_t2'
	END if
	
	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_2.dw_4.sharedata(dw_2)
	
else
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100  DataWindow.print.margin.left = 304'
	dw_2.dataobject  = 'd_mpsfcday_use'
	
	dw_2.SetTransObject(SQLCA)
	tab_1.tabpage_3.dw_6.sharedata(dw_2)
end if

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 생산일보 및 사용내역을 출력합니다." 

OpenSheetWithParm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcday_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcday_r
boolean visible = false
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcday_r
boolean visible = false
integer taborder = 170
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcday_r
integer x = 3534
integer y = 68
integer taborder = 80
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_workno, ls_worknm, ls_itemno, ls_qa, ls_sdate, ls_edate
long   ll_row,  ll_qty, ll_ret
dec    ld_calc

ls_sdate     = string(id_start,"yyyy/mm/dd")
ls_edate     = string(id_end,  "yyyy/mm/dd")
ls_area      = dw_area.object.area[1]
ls_workno    = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_no')) 
ls_worknm    = trim(idwc_wc.getitemstring(idwc_wc.getrow(),'work_name')) 
if ls_workno = "%"    then ls_workno = "%"
if ls_worknm = "전체" then ls_worknm = ""

CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if tab_1.tabpage_1.dw_3.retrieve(is_wcno, ls_sdate, ls_edate, ls_area) < 1  then
			MessageBox("에러","[일일생산일보내역]~n조회한 자료가 없습니다",Exclamation!)
		end if
		
	CASE 2
		if tab_1.tabpage_2.dw_4.retrieve(ls_area, is_wcno, em_1.text, em_2.text) < 1  then
			MessageBox("에러","[일일사용자재내역]~n조회한 자료가 없습니다",Exclamation!)
		end if
		
	CASE 3
		if tab_1.tabpage_3.dw_6.retrieve(ls_area, ls_worknm, em_1.text, em_2.text) < 1 then
			MessageBox("에러","[생산일보 및 사용자재]~n조회한 자료가 없습니다",Exclamation!)
		end if

	CASE 4
		if tab_1.tabpage_4.dw_7.retrieve(is_wcno, ls_sdate, ls_edate, ls_area) < 1  then
			MessageBox("확인","계산식 설정된 품목이 없습니다",Exclamation!)
		end if
END CHOOSE

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcday_r
integer x = 2162
integer y = 20
integer width = 942
integer height = 212
integer taborder = 120
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcday_r
boolean visible = false
integer x = 1856
integer y = 36
integer width = 978
integer height = 204
integer taborder = 0
integer textsize = -8
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcday_r
integer x = 3118
integer y = 20
integer width = 1216
integer height = 212
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type tab_1 from tab within w_mpsfcday_r
integer x = 37
integer y = 256
integer width = 4302
integer height = 2244
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4265
integer height = 2116
long backcolor = 79741120
string text = "일일생산일보내역"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "Project!"
long picturemaskcolor = 553648127
cb_5 cb_5
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
ddlb_4 ddlb_4
st_4 st_4
ddlb_3 ddlb_3
st_3 st_3
st_2 st_2
ddlb_1 ddlb_1
dw_3 dw_3
end type

on tabpage_1.create
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.ddlb_4=create ddlb_4
this.st_4=create st_4
this.ddlb_3=create ddlb_3
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.dw_3=create dw_3
this.Control[]={this.cb_5,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_1,&
this.ddlb_4,&
this.st_4,&
this.ddlb_3,&
this.st_3,&
this.st_2,&
this.ddlb_1,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.ddlb_4)
destroy(this.st_4)
destroy(this.ddlb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.dw_3)
end on

type cb_5 from commandbutton within tabpage_1
integer x = 3049
integer y = 12
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
string text = "내림"
end type

event clicked;//
string ls_col

choose case trim(ddlb_3.text)
	case "거래처"
		ls_col  = "sfcday_cust_name "
	case "현장"
		ls_col  = "scene_scene_desc "
	case "품목"
		ls_col  = "sfcday_item_no "
	case "품명"
		ls_col  = "groupitem_item_name "
	case "규격"
		ls_col  = "sfcday_qa "
	case "단위"
		ls_col  = "sfcday_uom "
	case "생산량"
		ls_col  = "sum_qty "
	case "환산수량"
		ls_col  = "uf_getqty "
	case "환산실적"
		ls_col  = "calc "		
end choose		

dw_3.SetSort(ls_col + "D")
dw_3.sort()

end event

type cb_3 from commandbutton within tabpage_1
integer x = 2885
integer y = 12
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
string text = "오름"
end type

event clicked;//
string ls_col

choose case trim(ddlb_3.text)
	case "거래처"
		ls_col  = "sfcday_cust_name "
	case "현장"
		ls_col  = "scene_scene_desc "
	case "품목"
		ls_col  = "sfcday_item_no "
	case "품명"
		ls_col  = "groupitem_item_name "
	case "규격"
		ls_col  = "sfcday_qa "
	case "단위"
		ls_col  = "sfcday_uom "
	case "생산량"
		ls_col  = "sum_qty "
	case "환산수량"
		ls_col  = "uf_getqty "
	case "환산실적"
		ls_col  = "calc "		
end choose		

dw_3.SetSort(ls_col + "A")
dw_3.sort()

end event

type cb_2 from commandbutton within tabpage_1
integer x = 2720
integer y = 12
integer width = 160
integer height = 76
integer taborder = 70
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
ddlb_4.text = "LIKE"
ddlb_3.text = "품명"
sle_1.text  = ""

dw_3.setfilter("")
dw_3.filter()

end event

type cb_1 from commandbutton within tabpage_1
integer x = 2555
integer y = 12
integer width = 160
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_3.FilteredCount() > 0 THEN
	dw_3.setfilter(ls_temp)
	dw_3.filter()
end if

// 필드
if trim(ddlb_3.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_3.text)
		case "거래처"
			ls_col  = "sfcday_cust_name "
		case "현장"
			ls_col  = "scene_scene_desc "
		case "품목"
			ls_col  = "sfcday_item_no "
		case "품명"
			ls_col  = "groupitem_item_name "
		case "규격"
			ls_col  = "sfcday_qa "
		case "단위"
			ls_col  = "sfcday_uom "
		case "생산량"
			ls_col  = "sum_qty "
		case "환산수량"
			ls_col  = "uf_getqty "
		case "환산실적"
			ls_col  = "calc "
	end choose

	if trim(ddlb_4.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_4.text) + " '%" + trim(sle_1.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_4.text) + " #" + trim(sle_1.text) + "# "
		elseif ls_col = "sum_qty " or ls_col = "uf_getqty " or ls_col = "calc " then
			ls_column = ls_col + trim(ddlb_4.text) + " "  + trim(sle_1.text) + " "
		else
			ls_column = ls_col + trim(ddlb_4.text) + " '" + trim(sle_1.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_3.setfilter(ls_temp)
dw_3.filter()

dw_3.scrolltorow(1)


end event

type sle_1 from singlelineedit within tabpage_1
integer x = 1984
integer y = 12
integer width = 567
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_4 from dropdownlistbox within tabpage_1
integer x = 1664
integer y = 4
integer width = 297
integer height = 512
integer taborder = 80
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

type st_4 from statictext within tabpage_1
integer x = 1495
integer y = 20
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

type ddlb_3 from dropdownlistbox within tabpage_1
integer x = 1065
integer y = 4
integer width = 402
integer height = 532
integer taborder = 70
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
string item[] = {"거래처","현장","품목","품명","규격","단위","생산량","환산수량","환산실적"}
end type

type st_3 from statictext within tabpage_1
integer x = 878
integer y = 20
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

type st_2 from statictext within tabpage_1
integer x = 46
integer y = 20
integer width = 274
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "조회작업"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 334
integer y = 4
integer width = 498
integer height = 532
integer taborder = 50
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
string item[] = {"거래처별 합계","작업장별 합계","일자별","리스트","CHK리스트"}
end type

event selectionchanged;//
choose case trim(ddlb_1.text)
	case "거래처별 합계"
		dw_3.dataobject = 'd_mpsfcday_t'
		
	case "작업장별 합계"
		dw_3.dataobject = 'd_mpsfcday_t2'		
		
	case "일자별"
		dw_3.dataobject = 'd_mpsfcday_t3'		
		
	case "리스트"
		dw_3.dataobject = 'd_mpsfcday_t4'
		dw_3.sharedata(dw_5)
		
	case "CHK리스트"
		dw_3.dataobject = 'd_mpsfcday_plansos'
end choose

dw_3.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')

end event

type dw_3 from datawindow within tabpage_1
string tag = "d_mpsfcday_t"
integer x = 23
integer y = 96
integer width = 4224
integer height = 1988
integer taborder = 31
string title = "d_mpsfcday_plansos"
string dataobject = "d_mpsfcday_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )
choose case dwo.name
	case "sfcday_cust_name"
		ls_col  = "거래처"
		ls_text = string(this.object.sfcday_cust_name[row])
	case "scene_scene_desc"
		ls_col  = "현장"
		ls_text = string(this.object.scene_scene_desc[row])
	case "sfcday_item_no"
		ls_col  = "품목"
		ls_text = string(this.object.sfcday_item_no[row])		
	case "groupitem_item_name"
		ls_col  = "품명"
		ls_text = string(this.object.groupitem_item_name[row])
	case "sfcday_qa"
		ls_col  = "규격"
		ls_text = string(this.object.sfcday_qa[row])
	case "sfcday_uom"
		ls_col  = "단위"
		ls_text = string(this.object.sfcday_uom[row])
	case "sum_qty"
		ls_col  = "생산량"
		ls_text = string(this.object.sum_qty[row])
	case "uf_getqty"
		ls_col  = "환산수량"
		ls_text = string(this.object.uf_getqty[row])
	case "calc"
		ls_col  = "환산실적"
		ls_text = string(this.object.calc[row])
end choose

choose case ls_col
	case "생산량", "환산수량", "환산실적"
		ddlb_4.text = "="
	case else
		ddlb_4.text = "LIKE"
end choose

ddlb_3.text = ls_col
sle_1.text  = ls_text


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4265
integer height = 2116
long backcolor = 79741120
string text = "일일사용자재내역"
long tabtextcolor = 8388608
long tabbackcolor = 79741120
string picturename = "ArrangeIcons!"
long picturemaskcolor = 553648127
dw_4 dw_4
rb_4 rb_4
rb_5 rb_5
end type

on tabpage_2.create
this.dw_4=create dw_4
this.rb_4=create rb_4
this.rb_5=create rb_5
this.Control[]={this.dw_4,&
this.rb_4,&
this.rb_5}
end on

on tabpage_2.destroy
destroy(this.dw_4)
destroy(this.rb_4)
destroy(this.rb_5)
end on

type dw_4 from datawindow within tabpage_2
integer x = 23
integer y = 96
integer width = 4224
integer height = 1988
integer taborder = 1
boolean bringtotop = true
string dataobject = "d_mpsfcday2_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_4 from radiobutton within tabpage_2
integer x = 41
integer y = 12
integer width = 256
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
string text = "전체"
boolean checked = true
end type

event clicked;dw_4.dataobject = 'd_mpsfcday2_t'
dw_4.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')
end event

type rb_5 from radiobutton within tabpage_2
integer x = 361
integer y = 12
integer width = 288
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
string text = "일자별"
end type

event clicked;dw_4.dataobject = 'd_mpsfcday2_t2'
dw_4.SetTransObject(SQLCA)
pb_retrieve.triggerevent('clicked')
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4265
integer height = 2116
long backcolor = 78160032
string text = "생산일보 및 사용자재"
long tabtextcolor = 33554432
long tabbackcolor = 78160032
string picturename = "CrossTab!"
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_3.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_3.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_3
integer x = 23
integer y = 96
integer width = 4224
integer height = 1988
integer taborder = 20
string title = "none"
string dataobject = "d_mpsfcday_use"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4265
integer height = 2116
long backcolor = 78160032
string text = "계산식설정"
long tabtextcolor = 128
long tabbackcolor = 78160032
string picturename = "Custom043!"
long picturemaskcolor = 536870912
cbx_1 cbx_1
pb_3 pb_3
dw_8 dw_8
em_calc em_calc
st_1 st_1
pb_4 pb_4
cbx_7 cbx_7
cbx_edit cbx_edit
ddlb_2 ddlb_2
cb_12 cb_12
cb_4 cb_4
cb_filteroff cb_filteroff
cb_filteron cb_filteron
st_9 st_9
ddlb_col ddlb_col
sle_value sle_value
cbx_all cbx_all
dw_7 dw_7
end type

on tabpage_4.create
this.cbx_1=create cbx_1
this.pb_3=create pb_3
this.dw_8=create dw_8
this.em_calc=create em_calc
this.st_1=create st_1
this.pb_4=create pb_4
this.cbx_7=create cbx_7
this.cbx_edit=create cbx_edit
this.ddlb_2=create ddlb_2
this.cb_12=create cb_12
this.cb_4=create cb_4
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.st_9=create st_9
this.ddlb_col=create ddlb_col
this.sle_value=create sle_value
this.cbx_all=create cbx_all
this.dw_7=create dw_7
this.Control[]={this.cbx_1,&
this.pb_3,&
this.dw_8,&
this.em_calc,&
this.st_1,&
this.pb_4,&
this.cbx_7,&
this.cbx_edit,&
this.ddlb_2,&
this.cb_12,&
this.cb_4,&
this.cb_filteroff,&
this.cb_filteron,&
this.st_9,&
this.ddlb_col,&
this.sle_value,&
this.cbx_all,&
this.dw_7}
end on

on tabpage_4.destroy
destroy(this.cbx_1)
destroy(this.pb_3)
destroy(this.dw_8)
destroy(this.em_calc)
destroy(this.st_1)
destroy(this.pb_4)
destroy(this.cbx_7)
destroy(this.cbx_edit)
destroy(this.ddlb_2)
destroy(this.cb_12)
destroy(this.cb_4)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.st_9)
destroy(this.ddlb_col)
destroy(this.sle_value)
destroy(this.cbx_all)
destroy(this.dw_7)
end on

type cbx_1 from checkbox within tabpage_4
integer x = 3374
integer y = 24
integer width = 238
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "규격"
end type

type pb_3 from picturebutton within tabpage_4
integer x = 2866
integer y = 4
integer width = 370
integer height = 88
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식목록"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
tab_1.tabpage_4.dw_8.visible = true

end event

type dw_8 from datawindow within tabpage_4
string tag = "d_cditemcalc_pub_c"
integer x = 1262
integer y = 532
integer width = 2290
integer height = 920
integer taborder = 70
boolean titlebar = true
string title = "계산식(TYPE)"
string dataobject = "d_cdcalc_pub_list"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
string icon = "Information!"
boolean livescroll = true
end type

event clicked;//
if this.rowcount() < 1 then return

tab_1.tabpage_4.em_calc.text = string(dw_8.object.sort[row])



end event

type em_calc from editmask within tabpage_4
integer x = 3250
integer y = 12
integer width = 105
integer height = 76
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
string mask = "#"
end type

type st_1 from statictext within tabpage_4
integer x = 283
integer y = 20
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

type pb_4 from picturebutton within tabpage_4
integer x = 3877
integer y = 4
integer width = 370
integer height = 88
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식저장"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;/*
  1. CODEMST(계산식_관리(도장,절곡) 계산식 등록
  2. UF_GetItemCalc_PUB, UF_GetItemCalc_PUB2 SQL 함수 등록

  IF @item_no = 'PZAARMDB0Z' AND @qa4 = 0            BEGIN /* R-몰딩(도장) 3가지 계산식 */
  IF @item_no = 'PZZZACCZZZ' AND @qa4 = 0            BEGIN /* SELF-CLEANING COATING 에서 길이가 = ZERO */
  IF substring(@item_no,1,6) = 'PCWSVR' AND @qa4 = 0 BEGIN /* 스마트패널(벽체용) 류에서 길이가 = ZERO */
  IF charindex('STL 절곡판넬', @item_name) > 0 AND @qa4 = 0 BEGIN    /* STL 절곡판넬 류에서 길이가 = ZERO */
  
  PS: 품목하나에 규격별로 여러가지 계산식이 존재할 경우는 함수에서 별도처리
      품목에 하나의 계산식이 존재할 경우 자유규격('999X9999X9999X99999') 만 등록
*/
dec    ld_value
int    li_calc
long   ll_row, ll_qty, ll_cnt, ll_item999
string ls_chk, ls_workno,  ls_itemno, ls_itemnm, ls_qa, ls_formula

if MessageBox("확인","저장 하시겠습니까?", Exclamation!, OKCancel!, 1) = 2 then RETURN

ll_cnt  = 0
dw_7.accepttext()

for ll_row = dw_7.rowcount() to 1 step -1
	ls_chk     = dw_7.object.chk[ll_row] 		   // 선택
	ls_formula = dw_7.object.formula[ll_row]		// 계산식
	if ls_formula = "" or isnull(ls_formula) then
	else
		if ls_chk = "Y" then
			ls_workno   = dw_7.object.wc_no[ll_row] 
			ls_itemno   = dw_7.object.item_no[ll_row]
			if cbx_1.checked = true then
				ls_qa    = "999X9999X9999X99999"
			else
				ls_qa    = dw_7.object.qa[ll_row]
			end if
			ls_itemnm   = dw_7.object.item_name[ll_row]		
			li_calc     = integer(em_calc.text)
			ll_qty      = dw_7.object.qty[ll_row]	
			ls_formula  = ""
	      SELECT bigo INTO :ls_formula FROM codemst 
			 WHERE type = '계산식_관리(도장,절곡)' AND item_cd = :ls_workno AND sort = :li_calc;
			
			// 품목의 자유규격이 존재하면 등록안함 
			ll_item999  = 0
			SELECT count(*) INTO :ll_item999  
			  FROM itemcalc_pub a
			       LEFT OUTER JOIN groupitem b  ON a.item_no = b.item_no
			 WHERE a.work_no = :ls_workno  AND a.item_no = :ls_itemno AND a.qa = '999X9999X9999X99999';
			/*
            AND NOT ( a.item_no = 'PZAARMDB0Z' OR a.item_no = 'PZZZACCZZZ' OR substring(a.item_no,1,6) = 'PCWSVR' OR
                      charindex('STL 절곡판넬', b.item_name) > 0
                    );
         */
			if ll_item999 = 0 then
				INSERT INTO itemcalc_pub (work_no, item_no, qa, item_name, formula, calc)
				VALUES (:ls_workno, :ls_itemno, :ls_qa, :ls_itemnm, :ls_formula, :li_calc);
				if SQLCA.SQLCode = 0 then
					COMMIT;
					ll_cnt = ll_cnt + 1
				else
					ROLLBACK;
				end if
			end if
	
			dw_7.scrolltorow(ll_row)			
		end if
	end if
next

cbx_1.checked = false
if ll_cnt > 0 then
	if MessageBox("확인",string(ll_cnt,"#,##0") + "건 저장완료. 다시 조회합니까?", Exclamation!, OKCancel!, 1) = 1 then
		pb_retrieve.triggerevent( clicked! )
	end if
else
	MessageBox("확인","저장된 품목이 없습니다.", Exclamation!)
end if

end event

type cbx_7 from checkbox within tabpage_4
integer x = 3621
integer y = 24
integer width = 242
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "적용"
end type

event clicked;//
long   ll_row, ll_calc, ll_qty, ll_chk
dec    ld_calvalue
string ls_workno, ls_itemno, ls_qa, ls_formula

if this.checked = true then
	for ll_row = 1 to dw_7.rowcount()
		if dw_7.object.chk[ll_row]  = "Y" then
			ll_chk = ll_chk + 1
		end if
	next
	if ll_chk < 1 then 
		MessageBox("확인","적용대상을 먼저 선택하시기 바랍니다.", Exclamation!)
		this.checked = false
		RETURN
	end if
	
	
	ll_calc    = integer(em_calc.text)
	ls_formula = dw_8.object.bigo[ll_calc]
	
	for ll_row = 1 to dw_7.rowcount()
		if dw_7.object.chk[ll_row]      = "Y" then
			ls_workno   = dw_7.object.wc_no[ll_row] 
			ls_itemno   = dw_7.object.item_no[ll_row]
			ls_qa       = dw_7.object.qa[ll_row]
			ll_qty      = dw_7.object.qty[ll_row]
			if ll_qty = 0 then ll_qty = 1
			
			SELECT top 1 dbo.UF_GetItemCalc_PUB2(:ls_workno, :ls_itemno, :ls_qa, :ll_qty, :ll_calc) INTO :ld_calvalue FROM itemcalc_pub;
			dw_7.object.calvalue[ll_row] = ld_calvalue		
			dw_7.object.calc[ll_row]     = ll_calc		
			dw_7.object.formula[ll_row]  = ls_formula				
		end if
	next
	
	this.checked = false
end if

end event

type cbx_edit from checkbox within tabpage_4
integer x = 2629
integer y = 28
integer width = 242
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "편집"
end type

event clicked;//
if this.checked = true then	// 편집모드
	tab_1.tabpage_4.dw_7.object.calc.protect  = false
else
	tab_1.tabpage_4.dw_7.object.calc.protect  = true
end if

end event

type ddlb_2 from dropdownlistbox within tabpage_4
integer x = 1070
integer y = 4
integer width = 297
integer height = 512
integer taborder = 60
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

type cb_12 from commandbutton within tabpage_4
integer x = 2455
integer y = 12
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
string text = "내림"
end type

event clicked;//
string ls_col

choose case trim(ddlb_col.text)
	case "선택"
		ls_col  = "chk "
	case "작업장"
		ls_col  = "work_name "
	case "물품코드"
		ls_col  = "item_no "
	case "품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "단위"
		ls_col  = "uom "
	case "생산량"
		ls_col  = "qty "
	case "계산식(TYPE)"
		ls_col  = "formula "
end choose		

dw_7.SetSort(ls_col + "D")
dw_7.sort()

end event

type cb_4 from commandbutton within tabpage_4
integer x = 2290
integer y = 12
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
string text = "오름"
end type

event clicked;//
string ls_col

choose case trim(ddlb_col.text)
	case "선택"
		ls_col  = "chk "
	case "작업장"
		ls_col  = "work_name "
	case "물품코드"
		ls_col  = "item_no "
	case "품명"
		ls_col  = "item_name "
	case "규격"
		ls_col  = "qa "
	case "단위"
		ls_col  = "uom "
	case "생산량"
		ls_col  = "qty "
	case "계산식(TYPE)"
		ls_col  = "formula "
end choose		

dw_7.SetSort(ls_col + "A")
dw_7.sort()

end event

type cb_filteroff from commandbutton within tabpage_4
integer x = 2126
integer y = 12
integer width = 160
integer height = 76
integer taborder = 60
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
ddlb_2.text     = "LIKE"
ddlb_col.text   = "품명"
sle_value.text  = ""

dw_7.setfilter("")
dw_7.filter()

end event

type cb_filteron from commandbutton within tabpage_4
integer x = 1961
integer y = 12
integer width = 160
integer height = 76
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp, ls_text

ls_temp = ""
if dw_7.FilteredCount() > 0 THEN
	dw_7.setfilter(ls_temp)
	dw_7.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "선택"
			ls_col  = "chk "
		case "작업장"
			ls_col  = "work_name "
		case "물품코드"
			ls_col  = "item_no "
		case "품명"
			ls_col  = "item_name "
		case "규격"
			ls_col  = "qa "
		case "단위"
			ls_col  = "uom "
		case "생산량"
			ls_col  = "qty "
		case "계산식(TYPE)"
			ls_col  = "formula "
end choose

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		if ls_col = "msgdate " then
			ls_column = ls_col + trim(ddlb_2.text) + " #" + trim(sle_value.text) + "# "
		elseif ls_col = "qty " then
			ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
		else
			ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end if
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_7.setfilter(ls_temp)
dw_7.filter()

dw_7.scrolltorow(1)
dw_7.triggerevent(rowfocuschanged!)

end event

type st_9 from statictext within tabpage_4
integer x = 901
integer y = 20
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

type ddlb_col from dropdownlistbox within tabpage_4
integer x = 471
integer y = 4
integer width = 402
integer height = 532
integer taborder = 60
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
string item[] = {"선택","작업장","물품코드","품명","규격","단위","생산량","계산식(TYPE)"}
end type

type sle_value from singlelineedit within tabpage_4
integer x = 1390
integer y = 12
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

type cbx_all from checkbox within tabpage_4
integer x = 41
integer y = 20
integer width = 238
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

event clicked;long ll_row

for ll_row = 1 to dw_7.rowcount()
	if this.checked = true then
		dw_7.object.chk[ll_row] = "Y"
	else
		dw_7.object.chk[ll_row] = "N"
	end if
next
end event

type dw_7 from datawindow within tabpage_4
integer x = 23
integer y = 96
integer width = 4224
integer height = 1988
integer taborder = 20
string title = "none"
string dataobject = "d_mpsfcday_calc_check"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_col, ls_text

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

this.scrolltorow( row )
choose case dwo.name
	case "chk"
		ls_col  = "선택"
		ls_text = string(this.object.chk[row])
	case "work_name"
		ls_col  = "작업장"
		ls_text = string(this.object.work_name[row])
	case "item_no"
		ls_col  = "물품코드"
		ls_text = string(this.object.item_no[row])
	case "item_name"
		ls_col  = "품명"
		ls_text = string(this.object.item_name[row])
	case "qa"
		ls_col  = "규격"
		ls_text = string(this.object.qa[row])
	case "uom"
		ls_col  = "단위"
		ls_text = string(this.object.uom[row])
	case "qty"
		ls_col  = "생산량"
		ls_text = string(this.object.qty[row])
	case "formula"
		ls_col  = "계산식(TYPE)"
		ls_text = string(this.object.formula[row])
end choose

choose case ls_col
	case "선택", "생산량", "계산식(TYPE)"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text



end event

type gb_15 from groupbox within w_mpsfcday_r
integer x = 1559
integer y = 20
integer width = 590
integer height = 212
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "사업장"
end type

type gb_4 from groupbox within w_mpsfcday_r
integer x = 1961
integer y = 248
integer width = 978
integer height = 204
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
end type

type em_1 from editmask within w_mpsfcday_r
integer x = 2203
integer y = 144
integer width = 407
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
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
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_start = date(this.text)

end event

type em_2 from editmask within w_mpsfcday_r
integer x = 2651
integer y = 144
integer width = 407
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
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
end type

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_end = date(this.text)

end event

type dw_area from datawindow within w_mpsfcday_r
integer x = 1595
integer y = 104
integer width = 521
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_5 from datawindow within w_mpsfcday_r
integer x = 1047
integer y = 16
integer width = 105
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcday_t4_ex"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_mpsfcday_r
event mousemove pbm_mousemove
integer x = 3918
integer y = 68
integer width = 187
integer height = 144
integer taborder = 70
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
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datawindow dw_dest

choose case tab_1.SelectedTab
	case 1
		choose case tab_1.tabpage_1.ddlb_1.text
			case "리스트"
				dw_dest = dw_5

			case else
				dw_dest = tab_1.tabpage_1.dw_3
		end choose
	
	case 2
      dw_dest = tab_1.tabpage_2.dw_4

	case 3
      dw_dest = tab_1.tabpage_3.dw_6		

	case 4
      dw_dest = tab_1.tabpage_4.dw_7		
end choose

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type pb_2 from picturebutton within w_mpsfcday_r
integer x = 3145
integer y = 68
integer width = 384
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계산식관리"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;//
if IsValid(w_o_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_o_main, 5, original!)
elseif IsValid(w_i_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_i_main, 5, original!)
elseif IsValid(w_m_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_m_main, 5, original!)
elseif IsValid(w_all_main) then 
	OpenSheet(w_cdcalc_pub_m,  w_all_main, 5, original!)
end if

//w_cdcalc_pub_m.WindowState = Normal!

end event

