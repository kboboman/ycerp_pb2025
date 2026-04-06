$PBExportHeader$w_mpitemrcpt_r.srw
$PBExportComments$품목별 재고 조회(1998/05/12, 이인호)
forward 
global type w_mpitemrcpt_r from w_inheritance
end type
type em_1 from editmask within w_mpitemrcpt_r
end type
type em_2 from editmask within w_mpitemrcpt_r
end type
type tab_1 from tab within w_mpitemrcpt_r
end type
type tabpage_2 from userobject within tab_1
end type
type st_value2 from statictext within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type cb_5 from commandbutton within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type sle_value2 from singlelineedit within tabpage_2
end type
type st_3 from statictext within tabpage_2
end type
type st_8 from statictext within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type ddlb_col2 from dropdownlistbox within tabpage_2
end type
type ddlb_op2 from dropdownlistbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_value2 st_value2
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
sle_value2 sle_value2
st_3 st_3
st_8 st_8
dw_4 dw_4
ddlb_col2 ddlb_col2
ddlb_op2 ddlb_op2
end type
type tabpage_1 from userobject within tab_1
end type
type st_value1 from statictext within tabpage_1
end type
type sle_value1 from singlelineedit within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type cb_filteroff from commandbutton within tabpage_1
end type
type cb_filteron from commandbutton within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type ddlb_col1 from dropdownlistbox within tabpage_1
end type
type ddlb_op1 from dropdownlistbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_value1 st_value1
sle_value1 sle_value1
cb_2 cb_2
cb_1 cb_1
cb_filteroff cb_filteroff
cb_filteron cb_filteron
st_9 st_9
st_2 st_2
dw_3 dw_3
ddlb_col1 ddlb_col1
ddlb_op1 ddlb_op1
end type
type tab_1 from tab within w_mpitemrcpt_r
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type
type st_1 from statictext within w_mpitemrcpt_r
end type
type ddlb_loc from dropdownlistbox within w_mpitemrcpt_r
end type
type pb_2 from picturebutton within w_mpitemrcpt_r
end type
end forward

global type w_mpitemrcpt_r from w_inheritance
integer width = 4270
integer height = 2500
string title = "품목별 입출고 조회(w_mpitemrcpt_r)"
long backcolor = 78160032
em_1 em_1
em_2 em_2
tab_1 tab_1
st_1 st_1
ddlb_loc ddlb_loc
pb_2 pb_2
end type
global w_mpitemrcpt_r w_mpitemrcpt_r

type variables
st_print i_print
datawindowchild idwc_loc
string is_itemno, is_qa, is_loc, is_source
string is_select
date   id_fromdate, id_todate
long   il_row
end variables

on w_mpitemrcpt_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.tab_1=create tab_1
this.st_1=create st_1
this.ddlb_loc=create ddlb_loc
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.ddlb_loc
this.Control[iCurrent+6]=this.pb_2
end on

on w_mpitemrcpt_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.ddlb_loc)
destroy(this.pb_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_clause, ls_where, ls_cat, ls_loc, ls_locname, ls_loctype
long    ll_row
Integer li_int

dw_1.visible = false
dw_2.visible = false

gs_ds_qaall.sharedata(dw_1)
tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)

em_1.text = string(RelativeDate(today(), - 7), "yyyy/mm/dd")
em_2.text = string(today(),'yyyy/mm/dd')

DECLARE c_location CURSOR FOR  
 SELECT cat = substring(a.loc_no,1,1)
      , a.loc_no        
      , a.loc_name      
      , a.loc_type      
   FROM location a
  ORDER BY loc_type, cat, loc_no;

li_int = 0
ddlb_loc.Reset()
ddlb_loc.AddItem("전체")
ddlb_loc.text = "전체"

OPEN c_location;
FETCH c_location INTO :ls_cat, :ls_loc, :ls_locname, :ls_loctype;
DO WHILE sqlca.sqlcode = 0
	li_int = li_int + 1
	
	ddlb_loc.AddItem(ls_locname)
   FETCH c_location INTO :ls_cat, :ls_loc, :ls_locname, :ls_loctype;
LOOP
CLOSE c_location;

end event

event resize;call super::resize;tab_1.width  = this.width  - 78
tab_1.height = this.height - 480

tab_1.tabpage_1.dw_3.width  = tab_1.width  - 59
tab_1.tabpage_1.dw_3.height = tab_1.height - 232

tab_1.tabpage_2.dw_4.width  = tab_1.width  - 59
tab_1.tabpage_2.dw_4.height = tab_1.height - 232

end event

type pb_save from w_inheritance`pb_save within w_mpitemrcpt_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_mpitemrcpt_r
integer x = 2747
integer y = 52
integer width = 151
integer height = 96
integer taborder = 100
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::dragwithin;//this.scrolltorow(row)
end event

type st_title from w_inheritance`st_title within w_mpitemrcpt_r
integer x = 41
integer y = 32
integer width = 1454
string text = "품목별 입출고 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpitemrcpt_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpitemrcpt_r
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpitemrcpt_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpitemrcpt_r
integer x = 3982
integer y = 48
integer taborder = 160
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpitemrcpt_r
integer x = 3790
integer y = 48
integer taborder = 170
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
tab_1.tabpage_1.dw_3.RowsCopy(1,  tab_1.tabpage_1.dw_3.RowCount(), Primary!, dw_2, 1, Primary!)
dw_2.object.cas_from[1] = string(id_fromdate, "YYYY/MM/DD")
dw_2.object.cas_to[1] = string(id_todate, "YYYY/MM/DD")

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 품목별 입고내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_mpitemrcpt_r
boolean visible = false
integer taborder = 180
end type

type pb_delete from w_inheritance`pb_delete within w_mpitemrcpt_r
boolean visible = false
integer taborder = 190
end type

type pb_insert from w_inheritance`pb_insert within w_mpitemrcpt_r
boolean visible = false
integer taborder = 210
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpitemrcpt_r
integer x = 3387
integer y = 48
integer taborder = 200
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_row
String ls_sdate, ls_edate, ls_itemno
string ls_loc,   ls_item,  ls_qa, ls_source

if ddlb_loc.text = "전체" then
	ls_loc   = "%"
else
	ls_loc   = ddlb_loc.text + "%"
end if

ls_item  = "%"
ls_qa    = "%"
ls_source= "%"
ls_sdate = em_1.text
ls_edate = em_2.text

ll_row = tab_1.tabpage_1.dw_3.retrieve(ls_item, ls_qa, ls_source, ls_loc, ls_sdate, ls_edate)
ll_row = tab_1.tabpage_2.dw_4.retrieve(ls_item, ls_qa, ls_source, ls_loc, ls_sdate, ls_edate)
tab_1.SelectTab ( 1 )

if ll_row < 1 then
	messagebox("확인","조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpitemrcpt_r
integer x = 946
integer y = 200
integer width = 891
integer height = 168
integer taborder = 130
integer textsize = -10
integer weight = 400
long textcolor = 16711680
string text = "저장소"
end type

type gb_2 from w_inheritance`gb_2 within w_mpitemrcpt_r
integer x = 37
integer y = 200
integer width = 882
integer height = 168
integer taborder = 140
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "입출고일자"
end type

type gb_1 from w_inheritance`gb_1 within w_mpitemrcpt_r
integer x = 3355
integer y = 8
integer width = 841
end type

type dw_2 from w_inheritance`dw_2 within w_mpitemrcpt_r
integer x = 2953
integer y = 52
integer width = 151
integer height = 96
integer taborder = 120
string dataobject = "d_mpitemrcpt_r"
boolean vscrollbar = false
end type

type em_1 from editmask within w_mpitemrcpt_r
integer x = 87
integer y = 260
integer width = 357
integer height = 80
integer taborder = 40
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
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_mpitemrcpt_r
integer x = 517
integer y = 260
integer width = 357
integer height = 80
integer taborder = 90
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
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type tab_1 from tab within w_mpitemrcpt_r
integer x = 18
integer y = 376
integer width = 4192
integer height = 1996
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
alignment alignment = right!
integer selectedtab = 1
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_2,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_1)
end on

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4155
integer height = 1868
long backcolor = 78160032
string text = "품목집계"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "Search!"
long picturemaskcolor = 553648127
st_value2 st_value2
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
sle_value2 sle_value2
st_3 st_3
st_8 st_8
dw_4 dw_4
ddlb_col2 ddlb_col2
ddlb_op2 ddlb_op2
end type

on tabpage_2.create
this.st_value2=create st_value2
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.sle_value2=create sle_value2
this.st_3=create st_3
this.st_8=create st_8
this.dw_4=create dw_4
this.ddlb_col2=create ddlb_col2
this.ddlb_op2=create ddlb_op2
this.Control[]={this.st_value2,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.sle_value2,&
this.st_3,&
this.st_8,&
this.dw_4,&
this.ddlb_col2,&
this.ddlb_op2}
end on

on tabpage_2.destroy
destroy(this.st_value2)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.sle_value2)
destroy(this.st_3)
destroy(this.st_8)
destroy(this.dw_4)
destroy(this.ddlb_col2)
destroy(this.ddlb_op2)
end on

type st_value2 from statictext within tabpage_2
integer x = 2656
integer y = 20
integer width = 1477
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_6 from commandbutton within tabpage_2
integer x = 2464
integer y = 8
integer width = 178
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col
choose case trim(tab_1.tabpage_2.ddlb_col2.text)
	case "품명"
		ls_col = "item_name "
	case "규격"
		ls_col = "qa "
	case "입출고일자"
		ls_col = "inaudit_date "
	case "전일수량"
		ls_col = "ewol_qty "
	case "입고수량"
		ls_col = "inaudit_rcpt_qty "
	case "출고수량"
		ls_col = "issue_qty "
	case "재고"
		ls_col = "item_qoh "
	case "작업일보"
		ls_col = "make_qty "
	case "가입고"
		ls_col = "intemp_qty "
end choose				

tab_1.tabpage_2.dw_4.SetSort(ls_col + "D")
tab_1.tabpage_2.dw_4.sort()

end event

type cb_5 from commandbutton within tabpage_2
integer x = 2281
integer y = 8
integer width = 178
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col
choose case trim(tab_1.tabpage_2.ddlb_col2.text)
	case "품명"
		ls_col = "item_name "
	case "규격"
		ls_col = "qa "
	case "입출고일자"
		ls_col = "inaudit_date "
	case "전일수량"
		ls_col = "ewol_qty "
	case "입고수량"
		ls_col = "inaudit_rcpt_qty "
	case "출고수량"
		ls_col = "issue_qty "
	case "재고"
		ls_col = "item_qoh "
	case "작업일보"
		ls_col = "make_qty "
	case "가입고"
		ls_col = "intemp_qty "
end choose				

tab_1.tabpage_2.dw_4.SetSort(ls_col + "A")
tab_1.tabpage_2.dw_4.sort()

end event

type cb_4 from commandbutton within tabpage_2
integer x = 1952
integer y = 8
integer width = 320
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터해지"
end type

event clicked;//
tab_1.tabpage_2.st_value2.text   = ""
tab_1.tabpage_2.ddlb_col2.text   = " "
tab_1.tabpage_2.ddlb_op2.text    = " "
tab_1.tabpage_2.sle_value2.text  = ""

tab_1.tabpage_2.dw_4.setfilter("")
tab_1.tabpage_2.dw_4.filter()
pb_retrieve.default = true
end event

type cb_3 from commandbutton within tabpage_2
integer x = 1751
integer y = 8
integer width = 197
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if tab_1.tabpage_2.dw_4.FilteredCount() > 0 THEN
	tab_1.tabpage_2.dw_4.setfilter(ls_temp)
	tab_1.tabpage_2.dw_4.filter()
end if

// 필드
if trim(tab_1.tabpage_2.ddlb_col2.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(tab_1.tabpage_2.ddlb_col2.text)
		case "품명"
			ls_col = "item_name "
		case "규격"
			ls_col = "qa "
		case "입출고일자"
			ls_col = "inaudit_date "
		case "전일수량"
			ls_col = "ewol_qty "
		case "입고수량"
			ls_col = "inaudit_rcpt_qty "
		case "출고수량"
			ls_col = "issue_qty "
		case "재고"
			ls_col = "item_qoh "
		case "작업일보"
			ls_col = "make_qty "
		case "가입고"
			ls_col = "intemp_qty "
	end choose				
	
	if trim(tab_1.tabpage_2.ddlb_op2.text) = "LIKE" then
		choose case ls_col
			case "item_name ", "qa "
				ls_column = ls_col + trim(tab_1.tabpage_2.ddlb_op2.text) + " '%" + trim(tab_1.tabpage_2.sle_value2.text) + "%' "
			case else
				return 
		end choose
	else
		choose case ls_col
			case "item_name ", "qa "
				ls_column = ls_col + trim(tab_1.tabpage_2.ddlb_op2.text) + " '"  + trim(tab_1.tabpage_2.sle_value2.text) + "' "
			case else
				ls_column = ls_col + trim(tab_1.tabpage_2.ddlb_op2.text) + " "  + trim(tab_1.tabpage_2.sle_value2.text) + " "
		end choose
	end if
end if

choose case ls_custnm
	case ""
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_column
		else
			ls_temp = "(" + ls_column + ")"
		end if
		
	case else
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_custnm
		else
			ls_temp = "(" + ls_custnm + ") AND (" + ls_column + ")"
		end if		
end choose

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

tab_1.tabpage_2.st_value2.text = ls_temp
tab_1.tabpage_2.dw_4.setfilter(ls_temp)
tab_1.tabpage_2.dw_4.filter()

tab_1.tabpage_2.dw_4.scrolltorow(1)
tab_1.tabpage_2.dw_4.triggerevent(rowfocuschanged!)

end event

event getfocus;//

end event

type sle_value2 from singlelineedit within tabpage_2
integer x = 1271
integer y = 12
integer width = 471
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_3 from statictext within tabpage_2
integer x = 795
integer y = 28
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
string text = "연산: "
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_2
integer x = 23
integer y = 28
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

type dw_4 from datawindow within tabpage_2
integer y = 100
integer width = 4133
integer height = 1764
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_mpitemrcpt_t_sum"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
string ls_item, ls_qa, ls_string
long   ll_found

if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row,  true)

if tab_1.tabpage_1.dw_3.FilteredCount() > 0 THEN
else
	ls_item = this.object.item_name[row]
	ls_qa   = this.object.qa[row]
	
	ls_string = "item_name = '" + ls_item + "' and qa = '" + ls_qa + "'"
	ll_found  = tab_1.tabpage_1.dw_3.Find( ls_string, 1, tab_1.tabpage_1.dw_3.RowCount())
	if ll_found > 0 then
		tab_1.tabpage_1.dw_3.ScrollToRow(ll_found)
		tab_1.tabpage_1.dw_3.SelectRow(0,  false)
		tab_1.tabpage_1.dw_3.SelectRow(ll_found,  true)
	end if
end if
end event

type ddlb_col2 from dropdownlistbox within tabpage_2
integer x = 210
integer y = 8
integer width = 549
integer height = 648
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
string item[] = {"품명","규격","입출고일자","전일수량","입고수량","출고수량","재고","작업일보","가입고"}
end type

type ddlb_op2 from dropdownlistbox within tabpage_2
integer x = 978
integer y = 8
integer width = 279
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4155
integer height = 1868
long backcolor = 78160032
string text = "입출고내역"
long tabtextcolor = 8388608
long tabbackcolor = 78160032
string picturename = "Custom090!"
long picturemaskcolor = 553648127
st_value1 st_value1
sle_value1 sle_value1
cb_2 cb_2
cb_1 cb_1
cb_filteroff cb_filteroff
cb_filteron cb_filteron
st_9 st_9
st_2 st_2
dw_3 dw_3
ddlb_col1 ddlb_col1
ddlb_op1 ddlb_op1
end type

on tabpage_1.create
this.st_value1=create st_value1
this.sle_value1=create sle_value1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_filteroff=create cb_filteroff
this.cb_filteron=create cb_filteron
this.st_9=create st_9
this.st_2=create st_2
this.dw_3=create dw_3
this.ddlb_col1=create ddlb_col1
this.ddlb_op1=create ddlb_op1
this.Control[]={this.st_value1,&
this.sle_value1,&
this.cb_2,&
this.cb_1,&
this.cb_filteroff,&
this.cb_filteron,&
this.st_9,&
this.st_2,&
this.dw_3,&
this.ddlb_col1,&
this.ddlb_op1}
end on

on tabpage_1.destroy
destroy(this.st_value1)
destroy(this.sle_value1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_filteroff)
destroy(this.cb_filteron)
destroy(this.st_9)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.ddlb_col1)
destroy(this.ddlb_op1)
end on

type st_value1 from statictext within tabpage_1
integer x = 2633
integer y = 24
integer width = 1490
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_value1 from singlelineedit within tabpage_1
integer x = 1243
integer y = 8
integer width = 466
integer height = 80
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

type cb_2 from commandbutton within tabpage_1
integer x = 2432
integer y = 8
integer width = 183
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
String ls_col

choose case trim(tab_1.tabpage_1.ddlb_col1.text)
	case "품명"
		ls_col = "item_name "
	case "규격"
		ls_col = "qa "
	case "입출고일자"
		ls_col = "inaudit_date "
	case "전일수량"
		ls_col = "ewol_qty "
	case "입고수량"
		ls_col = "inaudit_rcpt_qty "
	case "출고수량"
		ls_col = "issue_qty "
	case "현재고"
		ls_col = "item_qoh "
	case "출고유형"
		ls_col = "iotype_remarks "
	case "코일번호"
		ls_col = "serial_id "
	case "주문번호"
		ls_col = "order_no "
	case "도착지"
		ls_col = "cust_name "
	case "비고"
		ls_col = "rem "
	case "출처"
		ls_col = "item_source "
end choose

tab_1.tabpage_1.dw_3.setsort(ls_col + "D")
tab_1.tabpage_1.dw_3.sort()

end event

type cb_1 from commandbutton within tabpage_1
integer x = 2245
integer y = 8
integer width = 183
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
String ls_col

choose case trim(tab_1.tabpage_1.ddlb_col1.text)
	case "품명"
		ls_col = "item_name "
	case "규격"
		ls_col = "qa "
	case "입출고일자"
		ls_col = "inaudit_date "
	case "전일수량"
		ls_col = "ewol_qty "
	case "입고수량"
		ls_col = "inaudit_rcpt_qty "
	case "출고수량"
		ls_col = "issue_qty "
	case "현재고"
		ls_col = "item_qoh "
	case "출고유형"
		ls_col = "iotype_remarks "
	case "코일번호"
		ls_col = "serial_id "
	case "주문번호"
		ls_col = "order_no "
	case "도착지"
		ls_col = "cust_name "
	case "비고"
		ls_col = "rem "
	case "출처"
		ls_col = "item_source "
end choose

tab_1.tabpage_1.dw_3.setsort(ls_col + "A")
tab_1.tabpage_1.dw_3.sort()

end event

type cb_filteroff from commandbutton within tabpage_1
integer x = 1920
integer y = 8
integer width = 320
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터해지"
end type

event clicked;//
tab_1.tabpage_1.st_value1.text   = ""
tab_1.tabpage_1.ddlb_col1.text   = " "
tab_1.tabpage_1.ddlb_op1.text    = " "
tab_1.tabpage_1.sle_value1.text  = ""

tab_1.tabpage_1.dw_3.setfilter("")
tab_1.tabpage_1.dw_3.filter()
pb_retrieve.default = true
end event

type cb_filteron from commandbutton within tabpage_1
integer x = 1719
integer y = 8
integer width = 197
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if tab_1.tabpage_1.dw_3.FilteredCount() > 0 THEN
	tab_1.tabpage_1.dw_3.setfilter(ls_temp)
	tab_1.tabpage_1.dw_3.filter()
end if

// 필드
if trim(tab_1.tabpage_1.ddlb_col1.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(tab_1.tabpage_1.ddlb_col1.text)
		case "품명"
			ls_col = "item_name "
		case "규격"
			ls_col = "qa "
		case "입출고일자"
			ls_col = "inaudit_date "
		case "전일수량"
			ls_col = "ewol_qty "
		case "입고수량"
			ls_col = "inaudit_rcpt_qty "
		case "출고수량"
			ls_col = "issue_qty "
		case "현재고"
			ls_col = "item_qoh "
		case "출고유형"
			ls_col = "iotype_remarks "
		case "코일번호"
			ls_col = "serial_id "
		case "주문번호"
			ls_col = "order_no "
		case "도착지"
			ls_col = "cust_name "
		case "비고"
			ls_col = "rem "
		case "출처"
			ls_col = "item_source "
	end choose

	if trim(tab_1.tabpage_1.ddlb_op1.text) = "LIKE" then
		choose case ls_col
			case "item_name ", "qa ", "iotype_remarks ", "serial_id ", "order_no ", "cust_name ", "rem ", "item_source "
				ls_column = ls_col + trim(tab_1.tabpage_1.ddlb_op1.text) + " '%" + trim(tab_1.tabpage_1.sle_value1.text) + "%' "
			case else
				return 
		end choose
	else
		choose case ls_col
			case "item_name ", "qa ", "iotype_remarks ", "serial_id ", "order_no ", "cust_name ", "rem ", "item_source "
				ls_column = ls_col + trim(tab_1.tabpage_1.ddlb_op1.text) + " '" + trim(tab_1.tabpage_1.sle_value1.text) + "' "
			case else
				ls_column = ls_col + trim(tab_1.tabpage_1.ddlb_op1.text) + " "  + trim(tab_1.tabpage_1.sle_value1.text) + " "
		end choose
	end if
end if

choose case ls_custnm
	case ""
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_column
		else
			ls_temp = " (" + ls_column + ")"
		end if
		
	case else
		ls_temp = ls_custnm
		if ls_column = "" then
			ls_temp = ls_custnm
		else
			ls_temp = "(" + ls_custnm + ") AND (" + ls_column + ")"
		end if		
end choose

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

tab_1.tabpage_1.st_value1.text = ls_temp
tab_1.tabpage_1.dw_3.setfilter(ls_temp)
tab_1.tabpage_1.dw_3.filter()

tab_1.tabpage_1.dw_3.scrolltorow(1)
tab_1.tabpage_1.dw_3.triggerevent(rowfocuschanged!)
end event

event getfocus;//

end event

type st_9 from statictext within tabpage_1
integer x = 773
integer y = 28
integer width = 178
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

type st_2 from statictext within tabpage_1
integer x = 18
integer y = 28
integer width = 183
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "필드:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_1
integer y = 100
integer width = 4133
integer height = 1764
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_mpitemrcpt_t"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//long   ll_row
//string ls_itemno, ls_qa
//
//ll_row = currentrow
//if currentrow < 1 then return
//
//this.SelectRow(0, false)
//this.SelectRow(currentrow, true)
//
//ls_itemno = tab_1.tabpage_1.dw_3.object.inaudit_item[currentrow]
//ls_qa     = tab_1.tabpage_1.dw_3.object.qa[currentrow]
//
//tab_1.tabpage_2.dw_4.retrieve(ls_itemno, ls_qa)
////tab_1.SelectTab ( 2 )
//
end event

event clicked;string ls_item, ls_qa, ls_string
long   ll_found

if row < 1 then return
this.SelectRow(0,  false)
this.SelectRow(row,  true)

if tab_1.tabpage_2.dw_4.FilteredCount() > 0 THEN
else
	ls_item = this.object.item_name[row]
	ls_qa   = this.object.qa[row]
	
	ls_string = "item_name = '" + ls_item + "' and qa = '" + ls_qa + "'"
	ll_found  = tab_1.tabpage_2.dw_4.Find( ls_string, 1, tab_1.tabpage_2.dw_4.RowCount())
	if ll_found > 0 then
		tab_1.tabpage_2.dw_4.ScrollToRow(ll_found)
		tab_1.tabpage_2.dw_4.SelectRow(0,  false)
		tab_1.tabpage_2.dw_4.SelectRow(ll_found,  true)
	end if
end if
end event

type ddlb_col1 from dropdownlistbox within tabpage_1
integer x = 210
integer y = 8
integer width = 549
integer height = 648
integer taborder = 41
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
string item[] = {"품명","규격","입출고일자","전일수량","입고수량","출고수량","현재고","출고유형","코일번호","주문번호","출처","비고"}
end type

type ddlb_op1 from dropdownlistbox within tabpage_1
integer x = 951
integer y = 8
integer width = 279
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE"}
end type

type st_1 from statictext within w_mpitemrcpt_r
integer x = 448
integer y = 276
integer width = 69
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_loc from dropdownlistbox within w_mpitemrcpt_r
integer x = 978
integer y = 256
integer width = 818
integer height = 708
integer taborder = 31
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type pb_2 from picturebutton within w_mpitemrcpt_r
event mousemove pbm_mousemove
integer x = 3589
integer y = 48
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

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

choose case tab_1.SelectedTab
	case 1	// 입출고내역
		ldw_sel = tab_1.tabpage_1.dw_3
		
	case 2	// 품목집계
		ldw_sel = tab_1.tabpage_2.dw_4		
end choose

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					ldw_sel.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

