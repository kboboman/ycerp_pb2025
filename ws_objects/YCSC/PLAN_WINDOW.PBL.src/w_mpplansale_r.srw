$PBExportHeader$w_mpplansale_r.srw
$PBExportComments$생산계획조회
forward
global type w_mpplansale_r from w_inheritance
end type
type em_1 from editmask within w_mpplansale_r
end type
type em_2 from editmask within w_mpplansale_r
end type
type st_2 from statictext within w_mpplansale_r
end type
type st_1 from statictext within w_mpplansale_r
end type
type st_3 from statictext within w_mpplansale_r
end type
type dw_area from datawindow within w_mpplansale_r
end type
type pb_excel from picturebutton within w_mpplansale_r
end type
type tab_1 from tab within w_mpplansale_r
end type
type tabpage_1 from userobject within tab_1
end type
type cb_13 from commandbutton within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type ddlb_col from dropdownlistbox within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type sle_value from singlelineedit within tabpage_1
end type
type cb_filteron from commandbutton within tabpage_1
end type
type cb_filteroff from commandbutton within tabpage_1
end type
type cb_11 from commandbutton within tabpage_1
end type
type cb_12 from commandbutton within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_13 cb_13
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
ddlb_1 ddlb_1
st_4 st_4
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type cb_7 from commandbutton within tabpage_2
end type
type ddlb_col1 from dropdownlistbox within tabpage_2
end type
type cb_5 from commandbutton within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type cb_2 from commandbutton within tabpage_2
end type
type sle_value1 from singlelineedit within tabpage_2
end type
type ddlb_4 from dropdownlistbox within tabpage_2
end type
type st_7 from statictext within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_7 cb_7
ddlb_col1 ddlb_col1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
sle_value1 sle_value1
ddlb_4 ddlb_4
st_7 st_7
st_6 st_6
dw_4 dw_4
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
end type
type tab_1 from tab within w_mpplansale_r
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_1 from commandbutton within w_mpplansale_r
end type
type st_5 from statictext within w_mpplansale_r
end type
type st_time from statictext within w_mpplansale_r
end type
type cb_6 from commandbutton within w_mpplansale_r
end type
type gb_4 from groupbox within w_mpplansale_r
end type
end forward

global type w_mpplansale_r from w_inheritance
integer x = 5
integer y = 72
integer width = 4443
integer height = 2592
string title = "생산계획 조회(w_mpplansale_r)"
string icon = "OleGenReg!"
em_1 em_1
em_2 em_2
st_2 st_2
st_1 st_1
st_3 st_3
dw_area dw_area
pb_excel pb_excel
tab_1 tab_1
cb_1 cb_1
st_5 st_5
st_time st_time
cb_6 cb_6
gb_4 gb_4
end type
global w_mpplansale_r w_mpplansale_r

type variables
st_print i_print
string is_wcname, is_area
datawindowchild idwc_wc
datawindow  dw3, dw4, dw5

end variables

forward prototypes
public subroutine wf_area (string as_area)
end prototypes

public subroutine wf_area (string as_area);string ls_name

SELECT REPLACE(area_name,'사업장','') INTO :ls_name 
  FROM area
 WHERE area_no = :as_area;

end subroutine

on w_mpplansale_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.dw_area=create dw_area
this.pb_excel=create pb_excel
this.tab_1=create tab_1
this.cb_1=create cb_1
this.st_5=create st_5
this.st_time=create st_time
this.cb_6=create cb_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.pb_excel
this.Control[iCurrent+8]=this.tab_1
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.st_time
this.Control[iCurrent+12]=this.cb_6
this.Control[iCurrent+13]=this.gb_4
end on

on w_mpplansale_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.pb_excel)
destroy(this.tab_1)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_time)
destroy(this.cb_6)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_clause, ls_where
dw3 = tab_1.tabpage_1.dw_3
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5

dw_1.visible = false

dw_2.insertrow(0)
dw_2.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,"work_no"," ")
idwc_wc.setitem(1,"work_name","전체")
idwc_wc.accepttext()

dw_area.SetTransObject(SQLCA)
dw_area.insertrow(0)  
dw_area.object.area[1] = "S0001" //gs_area
//dw_area.accepttext()

dw3.object.pri.width = 0	// 순위
dw3.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')

pb_retrieve.PostEvent(Clicked!)

end event

event resize;call super::resize;tab_1.width  = this.width  - 128
tab_1.height = this.height - 560

dw3.width  = this.width  - 219
dw3.height = this.height - 792

dw4.width  = this.width  - 219
dw4.height = this.height - 792

dw5.width  = this.width  - 219
dw5.height = this.height - 792

end event

type pb_save from w_inheritance`pb_save within w_mpplansale_r
boolean visible = false
integer x = 2487
end type

type dw_1 from w_inheritance`dw_1 within w_mpplansale_r
integer x = 1312
integer y = 88
integer width = 119
integer height = 84
string dataobject = "d_mpplansale_r"
boolean hscrollbar = false
boolean vscrollbar = false
end type

event dw_1::rowfocuschanged;//long ll_row
//
//ll_row = this.getrow()
//if ll_row < 1 then
//	return
//end if
//
//is_wcno = dw_1.object.wc_no[ll_row]
//dw_2.retrieve(is_wcno)
//tab_1.tabpage_1.dw_3.retrieve(is_wcno,id_start,id_end)
//
end event

type dw_2 from w_inheritance`dw_2 within w_mpplansale_r
integer x = 914
integer y = 296
integer width = 626
integer height = 84
string dataobject = "d_whwc_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
this.accepttext()

pb_retrieve.PostEvent(Clicked!)

end event

type st_title from w_inheritance`st_title within w_mpplansale_r
integer x = 50
integer width = 1211
string text = "생산계획 조회"
end type

type st_tips from w_inheritance`st_tips within w_mpplansale_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpplansale_r
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpplansale_r
boolean visible = false
integer x = 2295
end type

type pb_close from w_inheritance`pb_close within w_mpplansale_r
integer x = 4142
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpplansale_r
integer x = 3950
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_sql, ls_where
w_repsuper w_print
st_print   l_print

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 작업장별 생산계획 현황을 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
	
end event

type pb_cancel from w_inheritance`pb_cancel within w_mpplansale_r
boolean visible = false
integer x = 2107
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpplansale_r
boolean visible = false
integer x = 1915
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpplansale_r
boolean visible = false
integer x = 1723
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpplansale_r
integer x = 3557
integer y = 56
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_sdate, ls_edate, ls_wcname, ls_flag, ls_Filter
long   ll_row

DateTime ld_time
SELECT TOP 1 GETDATE() INTO :ld_time FROM LOGIN;
st_time.text = string(ld_time,"yyyy/mm/dd hh:mm:ss")

//tab_1.selecttab(1)
ls_sdate = em_1.text
ls_edate = em_2.text

dw3.setfilter("")
dw3.filter()

ls_area   = dw_area.object.area[dw_area.getrow()]
ls_wcname = idwc_wc.getitemstring(idwc_wc.getrow(), "work_name")
if ls_wcname = "전체" then ls_wcname = ""
ls_wcname = trim(ls_wcname) + "%"  //작업장명

choose case tab_1.selectedtab
	case 3
		if dw5.retrieve( ls_area, ls_wcname ) < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
		end if
	case 2 
		if dw4.retrieve( ls_area, ls_wcname, ls_sdate, ls_edate, "Y" )	< 1 then	// 생산계획
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
		end if
	case 1	
		dw3.reset()
		dw3.Modify("DataWindow.Trailer.1.Height=0")
		
		if dw3.retrieve( ls_area ) < 1 then
			MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.", Exclamation!)
		else
			if MidA(ls_wcname,2,2) = '00' then
				ls_wcname = MidA(ls_wcname,1,1) + '%'
				ls_Filter = "wc_no like '" + ls_wcname + "'"
			else
				ls_Filter = "wc_no like '" + ls_wcname + "'"
			end if
			dw3.SetFilter(ls_Filter)
			dw3.Filter()
			
			////////////////////////////////////////////////////////
			// 작업장별 수주품목이 없으면 물품별소계 기능 DISABLE
			////////////////////////////////////////////////////////
			ll_row = dw3.FilteredCount()
			ll_row = dw3.RowCount()
			if ll_row > 0 then
				cb_1.enabled = true
			else
				cb_1.enabled = false
			end if
		end if	
end choose

end event

type gb_3 from w_inheritance`gb_3 within w_mpplansale_r
boolean visible = false
integer x = 64
integer y = 216
integer width = 1019
integer height = 188
integer taborder = 70
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpplansale_r
integer x = 640
integer y = 232
integer width = 3721
integer height = 172
integer taborder = 80
integer textsize = -9
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpplansale_r
integer x = 2437
integer y = 16
integer width = 1920
end type

type em_1 from editmask within w_mpplansale_r
integer x = 1851
integer y = 292
integer width = 366
integer height = 76
integer taborder = 100
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

type em_2 from editmask within w_mpplansale_r
integer x = 2267
integer y = 292
integer width = 366
integer height = 76
integer taborder = 110
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

type st_2 from statictext within w_mpplansale_r
integer x = 2217
integer y = 304
integer width = 46
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

type st_1 from statictext within w_mpplansale_r
integer x = 690
integer y = 304
integer width = 224
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
boolean enabled = false
string text = "작업장:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_mpplansale_r
integer x = 1554
integer y = 304
integer width = 302
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
boolean enabled = false
string text = "생산일자:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpplansale_r
integer x = 73
integer y = 296
integer width = 526
integer height = 84
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()

dw_2.object.wc_no[1] = " "
dw_2.accepttext()

dw_2.postevent(itemchanged!)

end event

type pb_excel from picturebutton within w_mpplansale_r
event mousemove pbm_mousemove
integer x = 3753
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

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow dwxls

if tab_1.selectedtab = 1 then
	dwxls = dw3
else
	dwxls = dw4
end if

if dwxls.rowcount() < 1 then return
ls_value = GetFileSaveName("Select File",  & 
	                        ls_Docname, ls_Named, "XLS", &
	                        "엑셀 (*.XLS), *.XLS," + &
                           "CSV(쉽표로 분리), *.CSV,")
li_Pos = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
if ls_Value = 1 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dwxls.SaveAsascii(ls_DocName)
	elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
		dwxls.SaveAs(ls_DocName, CSV!, TRUE)
	end if
end if

end event

type tab_1 from tab within w_mpplansale_r
integer x = 46
integer y = 428
integer width = 4315
integer height = 2032
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;//
st_time.text = ""

choose case newindex
	case 1, 3
		em_1.enabled = false
		em_2.enabled = false
	case else
		em_1.enabled = true
		em_2.enabled = true
end choose

pb_retrieve.triggerevent( clicked! )

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4279
integer height = 1904
long backcolor = 79741120
string text = "미생산계획"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "StopSign!"
long picturemaskcolor = 536870912
cb_13 cb_13
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_2 ddlb_2
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
ddlb_1 ddlb_1
st_4 st_4
dw_3 dw_3
end type

on tabpage_1.create
this.cb_13=create cb_13
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_2=create ddlb_2
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.ddlb_1=create ddlb_1
this.st_4=create st_4
this.dw_3=create dw_3
this.Control[]={this.cb_13,&
this.st_8,&
this.ddlb_col,&
this.st_9,&
this.ddlb_2,&
this.sle_value,&
this.cb_filteron,&
this.cb_filteroff,&
this.cb_11,&
this.cb_12,&
this.ddlb_1,&
this.st_4,&
this.dw_3}
end on

on tabpage_1.destroy
destroy(this.cb_13)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_2)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.ddlb_1)
destroy(this.st_4)
destroy(this.dw_3)
end on

type cb_13 from commandbutton within tabpage_1
integer x = 3790
integer y = 8
integer width = 462
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw3.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw3.GetClickedColumn()

lst_where.str1 = trim(dw3.object.item_no[ll_row])
lst_where.str2 = trim(dw3.object.qa[ll_row])
lst_where.str3 = "WS00000000" //trim(dw_2.object.loc_no[1])
lst_where.name = trim(dw3.object.groupitem_item_name[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type st_8 from statictext within tabpage_1
integer x = 901
integer y = 24
integer width = 160
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

type ddlb_col from dropdownlistbox within tabpage_1
integer x = 1079
integer y = 8
integer width = 402
integer height = 532
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"작업장","수주물품","규격","예정일자","납기일자","주문량","계획량","환산수량","출고량","분할","색상","거래처","현장","진행","수주번호","비고"}
end type

type st_9 from statictext within tabpage_1
integer x = 1495
integer y = 24
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

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 1664
integer y = 8
integer width = 279
integer height = 512
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within tabpage_1
integer x = 1957
integer y = 8
integer width = 704
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

type cb_filteron from commandbutton within tabpage_1
integer x = 2670
integer y = 8
integer width = 146
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw3.FilteredCount() > 0 THEN
	dw3.setfilter(ls_temp)
	dw3.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "작업장"
			ls_col = "wc_no "
		case "수주물품"
			ls_col = "item_name1 "
		case "규격"
			ls_col = "qa "
		case "예정일자"
			ls_col = "work_date "
		case "납기일자"
			ls_col = "napgi_date "
			
		case "주문량"
			ls_col = "order_qty "
		case "계획량"
			ls_col = "plan_qty "
		case "환산수량"
			ls_col = "obj_24092413 "
		case "출고량"
			ls_col = "dodet_ship_qty "
			
		case "분할"
			ls_col = "division "
		case "색상"
			ls_col = "color_name "
		case "거래처"
			ls_col = "customer_cust_name "
			
		case "현장"
			ls_col = "scene_scene_desc "
		case "진행"
			ls_col = "process_flag "
		case "순위"
			ls_col = "operation "
		case "수주번호"
			ls_col = "sale_no "
		case "순번"
			ls_col = "seq_no "
		case "비고"
			ls_col = "routtempnew_rem "
	end choose		

	if trim(ddlb_2.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_2.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "work_date ", "napgi_date "
				ls_column = ls_col + trim(ddlb_2.text) + "datetime('" + trim(sle_value.text) + "') "
			case "order_qty ", "plan_qty ", "obj_24092413 ", "dodet_ship_qty ", "division ", "operation ", "seq_no "
				ls_column = ls_col + trim(ddlb_2.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_2.text) + " '" + trim(sle_value.text) + "' "
		end choose 
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

dw3.setfilter(ls_temp)
dw3.filter()

dw3.scrolltorow(1)


end event

type cb_filteroff from commandbutton within tabpage_1
integer x = 2821
integer y = 8
integer width = 146
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_2.text     = "LIKE"
ddlb_col.text   = "현장명"
sle_value.text  = ""

dw3.setfilter("")
dw3.filter()

dw3.scrolltorow(1)

end event

type cb_11 from commandbutton within tabpage_1
integer x = 2971
integer y = 8
integer width = 146
integer height = 76
integer taborder = 80
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
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col = "wc_no "
	case "수주물품"
		ls_col = "item_name1 "
	case "규격"
		ls_col = "qa "
	case "예정일자"
		ls_col = "work_date "
	case "납기일자"
		ls_col = "napgi_date "
		
	case "주문량"
		ls_col = "order_qty "
	case "계획량"
		ls_col = "plan_qty "
	case "환산수량"
		ls_col = "obj_24092413 "
	case "출고량"
		ls_col = "dodet_ship_qty "
		
	case "분할"
		ls_col = "division "
	case "색상"
		ls_col = "color_name "
	case "거래처"
		ls_col = "customer_cust_name "
		
	case "현장"
		ls_col = "scene_scene_desc "
	case "진행"
		ls_col = "process_flag "
	case "수주번호"
		ls_col = "sale_no "
	case "순번"
		ls_col = "seq_no "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw3.SetSort(ls_col + "A")
dw3.sort()

end event

type cb_12 from commandbutton within tabpage_1
integer x = 3118
integer y = 8
integer width = 146
integer height = 76
integer taborder = 90
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
choose case trim(ddlb_col.text)
	case "작업장"
		ls_col = "wc_no "
	case "수주물품"
		ls_col = "item_name1 "
	case "규격"
		ls_col = "qa "
	case "예정일자"
		ls_col = "work_date "
	case "납기일자"
		ls_col = "napgi_date "
		
	case "주문량"
		ls_col = "order_qty "
	case "계획량"
		ls_col = "plan_qty "
	case "환산수량"
		ls_col = "obj_24092413 "
	case "출고량"
		ls_col = "dodet_ship_qty "
		
	case "분할"
		ls_col = "division "
	case "색상"
		ls_col = "color_name "
	case "거래처"
		ls_col = "customer_cust_name "
		
	case "현장"
		ls_col = "scene_scene_desc "
	case "진행"
		ls_col = "process_flag "
	case "수주번호"
		ls_col = "sale_no "
	case "순번"
		ls_col = "seq_no "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw3.SetSort(ls_col + "D")
dw3.sort()

end event

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 187
integer y = 8
integer width = 699
integer height = 532
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"순위","-","예정일 + 수주번호","수주번호 + 예정일","수주번호 + 제품코드","-","예정일 + 색상","색상 + 예정일","-","예정일 + 제품코드","제품코드 + 예정일","-","작업장","납기일"}
end type

event selectionchanged;string ls_sort

choose case index
	case 1
		 ls_sort = "if (pri = 0 , 999, pri)"
	case 3
		 ls_sort = "work_date A, sale_no A, seq_no A "
	case 4
		 ls_sort = "sale_no A, seq_no A , work_date A"	
	case 5
		 ls_sort = "sale_no A, item_no A, qa A"	
	case 7
		 ls_sort = "work_date A, item_color A, item_no A, qa A, sale_no A, seq_no A "
	case 8
		 ls_sort = "item_color A, work_date A, item_no A, qa A, sale_no A, seq_no A "
	case 10
		 ls_sort = "work_date A, item_no A, qa A, sale_no A, seq_no A "		
	case 11
		 ls_sort = "item_no A, qa A, work_date A, sale_no A, seq_no A "	
	case 13
		 ls_sort = "wc_no A, sale_no A, seq_no A, work_date A "	
	case 14
		 ls_sort = "napgi_date A, sale_no A, seq_no A, work_date A "	
	case else
		return
end choose
dw3.SetSort(ls_sort)
dw3.Sort()
dw3.groupcalc()

end event

type st_4 from statictext within tabpage_1
integer x = 37
integer y = 24
integer width = 146
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "정렬"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_1
event mousemove pbm_dwnmousemove
integer x = 27
integer y = 92
integer width = 4224
integer height = 1800
integer taborder = 70
string dataobject = "d_mpplansale_list1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int    li_int
string ls_sale

if row < 1 then return

this.scrolltorow(row)
ls_sale = trim(dw3.object.sale_no[row])

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

ls_sale = trim(this.object.sale_no[row])
choose case gs_print_control
	case 'PROC'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
		
	case 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
end choose


end event

event clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "wc_no"
		ls_col  = "작업장"
		ls_text = this.object.wc_no[row]
	case "item_name1"
		ls_col  = "수주물품"
		ls_text = this.object.item_name1[row]
	case "qa"
		ls_col  = "규격"
		ls_text = this.object.qa[row]
	case "work_date"
		ls_col  = "예정일자"
		ls_text = string(this.object.work_date[row])
	case "napgi_date"
		ls_col  = "납기일자"
		ls_text = string(this.object.napgi_date[row])
		
	case "order_qty"
		ls_col  = "주문량"
		ls_text = string(this.object.order_qty[row])
	case "plan_qty"
		ls_col  = "계획량"
		ls_text = string(this.object.plan_qty[row])
	case "obj_24092413"
		ls_col  = "환산수량"
		ls_text = string(this.object.obj_24092413[row])
	case "dodet_ship_qty"
		ls_col  = "출고량"
		ls_text = string(this.object.dodet_ship_qty[row])
		
	case "division"
		ls_col  = "분할"
		ls_text = string(this.object.division[row])
	case "color_name"
		ls_col  = "색상"
		ls_text = this.object.color_name[row]

	case "customer_cust_name"
		ls_col  = "거래처"
		ls_text = this.object.customer_cust_name[row]
	case "scene_scene_desc"
		ls_col  = "현장"
		ls_text = this.object.scene_scene_desc[row]
	case "process_flag"
		ls_col  = "진행"
		ls_text = this.object.process_flag[row]
	case "operation"
		ls_col  = "순위"
		ls_text = string(this.object.operation[row])

	case "sale_no"
		ls_col  = "수주번호"
		ls_text = this.object.sale_no[row]
	case "seq_no"
		ls_col  = "순번"
		ls_text = string(this.object.seq_no[row])
	case "routtempnew_rem"
		ls_col  = "비고"
		ls_text = this.object.routtempnew_rem[row]
end choose

choose case ls_col
	case "주문량", "계획량", "환산수량", "출고량", "분할", "예정일자", "납기일자", "순위", "순번"
		ddlb_2.text = "="
	case else
		ddlb_2.text = "LIKE"
end choose

ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4279
integer height = 1904
long backcolor = 79741120
string text = "생산계획"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom035!"
long picturemaskcolor = 536870912
cb_7 cb_7
ddlb_col1 ddlb_col1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
sle_value1 sle_value1
ddlb_4 ddlb_4
st_7 st_7
st_6 st_6
dw_4 dw_4
end type

on tabpage_2.create
this.cb_7=create cb_7
this.ddlb_col1=create ddlb_col1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.sle_value1=create sle_value1
this.ddlb_4=create ddlb_4
this.st_7=create st_7
this.st_6=create st_6
this.dw_4=create dw_4
this.Control[]={this.cb_7,&
this.ddlb_col1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.sle_value1,&
this.ddlb_4,&
this.st_7,&
this.st_6,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.cb_7)
destroy(this.ddlb_col1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.sle_value1)
destroy(this.ddlb_4)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_4)
end on

type cb_7 from commandbutton within tabpage_2
integer x = 3790
integer y = 8
integer width = 462
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "재고이력검색"
end type

event clicked;long ll_row

ll_row = dw4.getrow()
if ll_row < 1 then return

gs_where lst_where

int ls_a
ls_a = dw4.GetClickedColumn()

lst_where.str1 = trim(dw4.object.assy_item[ll_row])
lst_where.str2 = trim(dw4.object.assy_qa[ll_row])
lst_where.str3 = "WS00000000" //trim(dw_2.object.loc_no[1])
lst_where.name = trim(dw4.object.item_name[ll_row])

openwithparm(w_whinaudit_w, lst_where)
w_whinaudit_w.WindowState = Normal!
lst_where = message.powerobjectparm

end event

type ddlb_col1 from dropdownlistbox within tabpage_2
integer x = 215
integer y = 8
integer width = 402
integer height = 532
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"예정일자","작업장","NO","납기일자","수주번호","야","거래처","현장명","품명","규격","색상","비고"}
end type

type cb_5 from commandbutton within tabpage_2
integer x = 2258
integer y = 8
integer width = 146
integer height = 76
integer taborder = 100
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
choose case trim(ddlb_col1.text)
	case "예정일자"
		ls_col = "work_date "
	case "작업장"
		ls_col = "work_name "
	case "NO"
		ls_col = "pri "
	case "납기일자"
		ls_col = "napgi_date "
	case "수주번호"
		ls_col = "sale_no "			
	case "야"
		ls_col = "overtime "
	case "거래처"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
	case "품명"
		ls_col = "item_name "			
	case "규격"
		ls_col = "assy_qa "
	case "색상"
		ls_col = "color_name "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw4.SetSort(ls_col + "D")
dw4.sort()

end event

type cb_4 from commandbutton within tabpage_2
integer x = 2112
integer y = 8
integer width = 146
integer height = 76
integer taborder = 90
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
choose case trim(ddlb_col1.text)
	case "예정일자"
		ls_col = "work_date "
	case "작업장"
		ls_col = "work_name "
	case "NO"
		ls_col = "pri "
	case "납기일자"
		ls_col = "napgi_date "
	case "수주번호"
		ls_col = "sale_no "			
	case "야"
		ls_col = "overtime "
	case "거래처"
		ls_col = "cust_name "
	case "현장명"
		ls_col = "scene_desc "
	case "품명"
		ls_col = "item_name "			
	case "규격"
		ls_col = "assy_qa "
	case "색상"
		ls_col = "color_name "
	case "비고"
		ls_col = "routtempnew_rem "
end choose		

dw4.SetSort(ls_col + "A")
dw4.sort()

end event

type cb_3 from commandbutton within tabpage_2
integer x = 1961
integer y = 8
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_4.text     = "LIKE"
ddlb_col1.text   = "작업장"
sle_value1.text  = ""

dw4.setfilter("")
dw4.filter()

dw4.scrolltorow(1)

end event

type cb_2 from commandbutton within tabpage_2
integer x = 1810
integer y = 8
integer width = 146
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw4.FilteredCount() > 0 THEN
	dw4.setfilter(ls_temp)
	dw4.filter()
end if

// 필드
if trim(ddlb_col1.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col1.text)
		case "예정일자"
			ls_col = "work_date "
		case "작업장"
			ls_col = "work_name "
		case "NO"
			ls_col = "pri "
		case "납기일자"
			ls_col = "napgi_date "
		case "수주번호"
			ls_col = "sale_no "			
		case "야"
			ls_col = "overtime "
		case "거래처"
			ls_col = "cust_name "
		case "현장명"
			ls_col = "scene_desc "
		case "품명"
			ls_col = "item_name "			
		case "규격"
			ls_col = "assy_qa "
		case "색상"
			ls_col = "color_name "
		case "비고"
			ls_col = "routtempnew_rem "
	end choose		

	if trim(ddlb_4.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_4.text) + " '%" + trim(sle_value1.text) + "%' "
	else
		choose case ls_col
			case "work_date ", "napgi_date "
				ls_column = ls_col + trim(ddlb_4.text) + "datetime('" + trim(sle_value1.text) + "') "
			case "NO "
				ls_column = ls_col + trim(ddlb_4.text) + " "  + trim(sle_value1.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_4.text) + " '" + trim(sle_value1.text) + "' "
		end choose 
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

dw4.setfilter(ls_temp)
dw4.filter()

dw4.scrolltorow(1)


end event

type sle_value1 from singlelineedit within tabpage_2
integer x = 1097
integer y = 8
integer width = 704
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_4 from dropdownlistbox within tabpage_2
integer x = 805
integer y = 8
integer width = 279
integer height = 512
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
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

type st_7 from statictext within tabpage_2
integer x = 635
integer y = 24
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

type st_6 from statictext within tabpage_2
integer x = 41
integer y = 24
integer width = 160
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
event mousemove pbm_dwnmousemove
integer x = 27
integer y = 92
integer width = 4224
integer height = 1804
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_mpplansale_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;int    li_int
string ls_sale

if row < 1 then return
this.scrolltorow(row)

m_manager NewMenu

NewMenu = CREATE m_manager
gs_print_control = ""
li_int = m_manager.m_plan.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())

ls_sale = this.object.sale_no[row]
choose case gs_print_control
	case 'SALE'
		open(w_whsaleproc_w)
		w_whsaleproc_w.sle_1.text = ls_sale
		w_whsaleproc_w.pb_1.postevent(clicked!)
end choose

end event

event clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "work_date"
		ls_col  = "예정일자"
		ls_text = string(this.object.work_date[row])
	case "work_name"
		ls_col  = "작업장"
		ls_text = this.object.work_name[row]
	case "pri"
		ls_col  = "NO"
		ls_text = this.object.pri[row]
	case "napgi_date"
		ls_col  = "납기일자"
		ls_text = string(this.object.napgi_date[row])
	case "sale_no"
		ls_col  = "수주번호"
		ls_text = this.object.sale_no[row]
	case "overtime"
		ls_col  = "야"
		ls_text = this.object.overtime[row]
	case "cust_name"
		ls_col  = "거래처"
		ls_text = this.object.cust_name[row]
	case "scene_desc"
		ls_col  = "현장명"
		ls_text = this.object.scene_desc[row]	
	case "item_name"
		ls_col  = "품명"
		ls_text = this.object.item_name[row]
	case "assy_qa"
		ls_col  = "규격"
		ls_text = this.object.assy_qa[row]	
	case "color_name"
		ls_col  = "색상"
		ls_text = this.object.color_name[row]
	case "routtempnew_rem"
		ls_col  = "비고"
		ls_text = this.object.routtempnew_rem[row]
end choose

choose case ls_col
	case "예정일자", "납기일자", "색상"
		ddlb_4.text = "="
	case else
		ddlb_4.text = "LIKE"
end choose

ddlb_col1.text  = ls_col
sle_value1.text = ls_text

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4279
integer height = 1904
long backcolor = 79741120
string text = "작업장 품목"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Continue!"
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_3.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_3.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_3
integer x = 27
integer y = 92
integer width = 4224
integer height = 1804
integer taborder = 80
string title = "none"
string dataobject = "d_mpplansale_list3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_mpplansale_r
integer x = 3008
integer y = 56
integer width = 530
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "물품별 소계"
end type

event clicked;string ls_wc, ls_sort, ls_group, ls_column1, ls_column2, ls_err
int    li_rc

ls_wc = dw_2.object.wc_no[1]
if isnull(ls_wc) or trim(ls_wc) = "" then return

dw3.Modify("DataWindow.Trailer.1.Height=64")
if ls_wc = 'F19' or ls_wc = 'F20' or ls_wc = 'F21' then // AL
	ls_sort = "item_no, qa, wc_no"	
else
	ls_sort = "qa, item_no, wc_no"	
end if

dw3.SetSort(ls_sort)
li_rc = dw3.Sort()
if li_rc = 1 then
	li_rc = dw3.GroupCalc()
	if li_rc = 1 then
	else
		MessageBox("확인", "물품별 소계 계산중 오류가 발생 했습니다.[" + ls_sort + "]")
	end if
else
	MessageBox("확인", "물품별 소계 정렬중 오류가 발생 했습니다.[" + ls_sort + "]")
end if

end event

type st_5 from statictext within w_mpplansale_r
integer x = 2990
integer y = 304
integer width = 206
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "조회:"
boolean focusrectangle = false
end type

type st_time from statictext within w_mpplansale_r
integer x = 3200
integer y = 304
integer width = 1079
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "2011/12/31 08:30"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_mpplansale_r
integer x = 2469
integer y = 56
integer width = 530
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주현황"
end type

event clicked;string ls_sale
long   ll_row
gs_where2 lst_str 
datawindow dwsale

if tab_1.selectedtab = 1 then
	dwsale = dw3
else
	dwsale = dw4
end if

if dwsale.rowcount() < 1 then return

ll_row  = dwsale.getrow()
ls_sale = dwsale.object.sale_no[ll_row]

if ls_sale = "" or isnull(ls_sale) or LenA(ls_sale) <> 14  then return

lst_str.str1[1] = ls_sale
OpenWithParm(w_whsaleall_w, lst_str)

end event

type gb_4 from groupbox within w_mpplansale_r
integer x = 46
integer y = 232
integer width = 581
integer height = 172
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

