$PBExportHeader$w_mpsfcrelsort_m.srw
$PBExportComments$작업지시순서도
forward 
global type w_mpsfcrelsort_m from w_inheritance
end type
type em_1 from editmask within w_mpsfcrelsort_m
end type
type st_2 from statictext within w_mpsfcrelsort_m
end type
type st_vertical from u_splitbar_vertical within w_mpsfcrelsort_m
end type
type st_3 from statictext within w_mpsfcrelsort_m
end type
type dw_area from datawindow within w_mpsfcrelsort_m
end type
type st_4 from statictext within w_mpsfcrelsort_m
end type
type ddlb_fld from dropdownlistbox within w_mpsfcrelsort_m
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcrelsort_m
end type
type st_5 from statictext within w_mpsfcrelsort_m
end type
type ddlb_op from dropdownlistbox within w_mpsfcrelsort_m
end type
type sle_value from singlelineedit within w_mpsfcrelsort_m
end type
type cb_1 from commandbutton within w_mpsfcrelsort_m
end type
type cb_2 from commandbutton within w_mpsfcrelsort_m
end type
type cb_3 from commandbutton within w_mpsfcrelsort_m
end type
type cb_5 from commandbutton within w_mpsfcrelsort_m
end type
type dw_3 from datawindow within w_mpsfcrelsort_m
end type
type st_horizontal from u_splitbar_horizontal within w_mpsfcrelsort_m
end type
type cbx_grp from checkbox within w_mpsfcrelsort_m
end type
type pb_1 from picturebutton within w_mpsfcrelsort_m
end type
type cb_ins from commandbutton within w_mpsfcrelsort_m
end type
type dw_4 from datawindow within w_mpsfcrelsort_m
end type
type cbx_daysum from checkbox within w_mpsfcrelsort_m
end type
type gb_4 from groupbox within w_mpsfcrelsort_m
end type
type gb_5 from groupbox within w_mpsfcrelsort_m
end type
end forward

global type w_mpsfcrelsort_m from w_inheritance
integer width = 4343
integer height = 2288
string title = "작업지시 야간(w_mpsfcrelsort_m)"
em_1 em_1
st_2 st_2
st_vertical st_vertical
st_3 st_3
dw_area dw_area
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_3 dw_3
st_horizontal st_horizontal
cbx_grp cbx_grp
pb_1 pb_1
cb_ins cb_ins
dw_4 dw_4
cbx_daysum cbx_daysum
gb_4 gb_4
gb_5 gb_5
end type
global w_mpsfcrelsort_m w_mpsfcrelsort_m

type variables
st_print i_print

string is_dw, is_wcno, is_mess
long   il_seq, il_row[],  il_null[]

datawindowchild idwc_area
end variables

forward prototypes
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
end prototypes

public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col);// string = wf_crosstab_title( arg_dw, al_row, al_col )
string ls_col, ls_value, ls_today
long   ll_row, ll_col

ll_row    = al_row
ll_col    = al_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ls_today = string(gf_today(), "mm/dd")

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
else
	ls_title = ""
	RETURN ls_title
end if

//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to UpperBound(ls_bandname)
   if Upper(LeftA(ls_bandname[i], 4)) = "HEAD" then
      li_pos = PosA(ls_bandname[i], "[")
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], "]")
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then li_header2 = li_header1
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = "HEADER"
else
   ls_lastheader = "HEADER[" + string(li_header2) + "]"
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")	 
ll_objects = GF_SPLIT(ls_objects, "~t", ls_object)

for i = 1 to UpperBound(ls_object)
   ls_objname = Trim(ls_object[i])
   ls_type    = Upper(arg_dw.Describe( ls_objname + ".type" ))
	
	choose case ls_type
		case "COLUMN", "COMPUTE"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = "DETAIL" then
				ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
				
				if ls_visible = "1" then
					j++
					
					ls_detail[j]  = ls_objname
					ls_objtype[j] = ls_type
				end if
			end if
		
		case "TEXT"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = ls_lastheader then
				li_pos = integer(arg_dw.Describe( ls_objname + ".x" ))
				if li_pos > 0 then ls_header[li_pos] = ls_objname
			end if
	end choose
next

//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_colcount = UpperBound(ls_detail)
for j = 1 to li_colcount
   ls_colname  = arg_dw.Describe(ls_detail[j] + ".name")
   li_pos      = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	
	if li_pos > UpperBound(ls_header) then
		//
	else
		if li_pos > 0 then
			ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )
	
			if al_col = j then
				ls_title = ls_coltext[j]
			end if
			
			if ls_today = ls_coltext[j] then
				arg_dw.Modify(ls_colname + ".Background.Mode='0'")
				arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
			end if
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
RETURN ls_title

end function

on w_mpsfcrelsort_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_2=create st_2
this.st_vertical=create st_vertical
this.st_3=create st_3
this.dw_area=create dw_area
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_3=create dw_3
this.st_horizontal=create st_horizontal
this.cbx_grp=create cbx_grp
this.pb_1=create pb_1
this.cb_ins=create cb_ins
this.dw_4=create dw_4
this.cbx_daysum=create cbx_daysum
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_vertical
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.st_horizontal
this.Control[iCurrent+18]=this.cbx_grp
this.Control[iCurrent+19]=this.pb_1
this.Control[iCurrent+20]=this.cb_ins
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.cbx_daysum
this.Control[iCurrent+23]=this.gb_4
this.Control[iCurrent+24]=this.gb_5
end on

on w_mpsfcrelsort_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_vertical)
destroy(this.st_3)
destroy(this.dw_area)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_3)
destroy(this.st_horizontal)
destroy(this.cbx_grp)
destroy(this.pb_1)
destroy(this.cb_ins)
destroy(this.dw_4)
destroy(this.cbx_daysum)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_topobject(dw_2)
st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_bottomobject(dw_3)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject( SQLCA )
dw_4.SetTransObject( SQLCA )
dw_4.visible = false

// 사업장
dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
//idwc_area.insertrow(1)
//idwc_area.setitem(1, 'area_no', ' ')
//idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = "S0001"	// gs_area
//dw_area.enabled = false

// 작업일자
em_1.text = string( today(), "yyyy/mm/dd")

// 그룹핑
cb_ins.enabled = false

// 저장
pb_save.enabled = false
if GF_Permission("작업지시_야간순서", gs_userid) = "Y" then
	pb_save.enabled = true
end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x       = dw_1.x + dw_1.width
st_vertical.height  = dw_1.height

dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = dw_1.height

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = gb_3.width

dw_3.y      = st_horizontal.y + st_horizontal.height
dw_3.width  = gb_3.width
dw_3.height = newheight - dw_3.y - gb_3.x

//
dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = newwidth  - (gb_3.x * 2)
dw_4.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_mpsfcrelsort_m
integer x = 3145
integer y = 48
end type

event pb_save::clicked;call super::clicked;//
///////////////////////////////////////
WF_Update1( dw_2, "Y" )
///////////////////////////////////////

// 초기화
cbx_grp.checked = false
cbx_grp.triggerevent( clicked! )

il_row = il_null
il_seq = 0

dw_1.SelectRow(0, FALSE)

// 조회
pb_retrieve.triggerevent( clicked! )

end event

type dw_1 from w_inheritance`dw_1 within w_mpsfcrelsort_m
integer x = 32
integer y = 404
integer width = 2272
integer height = 1380
string dataobject = "d_mpsfcrelsort"
borderstyle borderstyle = stylelowered!
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

// 그룹핑
string   ls_wcno, ls_overtime
datetime ldt_orderdate
Boolean  lb_result

ldt_orderdate = datetime( date(em_1.text), time("00:00:00.000") )

if cbx_grp.checked = true then
	This.SelectRow(Row, NOT This.IsSelected(Row))

	lb_result = This.IsSelected(Row)	
	if lb_result = true then
		il_seq = il_seq + 1
		il_row[il_seq] = row		
	end if
else
	This.SelectRow(0, FALSE)
	
	if isnull(row) OR row < 1 then RETURN
	
	ls_wcno      = this.object.wc_no[row]
	ls_overtime  = this.object.overtime[row]
	if ls_overtime = "" then setnull(ls_overtime)
	
	dw_3.retrieve( ls_wcno, ldt_orderdate, ls_overtime )
end if

end event

type st_title from w_inheritance`st_title within w_mpsfcrelsort_m
integer x = 37
integer y = 28
integer width = 1120
integer height = 140
string text = "작업지시 순서도"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcrelsort_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcrelsort_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcrelsort_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcrelsort_m
integer x = 3534
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcrelsort_m
boolean visible = false
integer x = 3858
integer y = 48
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcrelsort_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcrelsort_m
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcrelsort_m
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcrelsort_m
integer x = 2953
integer y = 48
integer taborder = 150
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string   ls_area, ls_wcno, ls_overtime, ls_seq
long     ll_row, ll_find
datetime ldt_workdate

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ldt_workdate = datetime( date(em_1.text), time("00:00:00.000") )

if cbx_daysum.checked = true then
	dw_3.reset()
	dw_4.retrieve( ls_area, ldt_workdate )
else
	dw_3.reset()
	dw_1.retrieve( ls_area, ldt_workdate )
	dw_2.retrieve( ls_area, ldt_workdate )

	// 사업장체크
	if gs_userid <> "1999010s" then
		if gs_area = ls_area then
		else
			pb_save.enabled = false
		end if
	end if
	
	for ll_row = 1 to dw_2.rowcount()
		ls_wcno     = dw_2.object.wc_no[ll_row]
		ls_overtime = dw_2.object.overtime[ll_row]
		ls_seq      = dw_2.object.seq[ll_row]
		
		if isnull(ls_seq) OR ls_seq = "" then
		else
			ll_find = dw_1.find( "wc_no = '" + ls_wcno + "' and overtime = '" + ls_overtime + "'", 1, dw_1.rowcount() )
			if ll_find > 0 then
				dw_1.object.chk[ll_find] = "Y"
			end if
		end if
	next
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcrelsort_m
integer x = 32
integer width = 4238
integer height = 164
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcrelsort_m
integer x = 1824
integer y = 4
integer width = 562
integer height = 212
integer taborder = 80
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcrelsort_m
integer x = 2898
integer y = 4
integer width = 850
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcrelsort_m
integer x = 2363
integer y = 404
integer width = 1906
integer height = 1380
integer taborder = 60
string dataobject = "d_mpsfcrelsort_m"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)


end event

type em_1 from editmask within w_mpsfcrelsort_m
integer x = 1865
integer y = 116
integer width = 471
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
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

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_2 from statictext within w_mpsfcrelsort_m
integer x = 1865
integer y = 40
integer width = 471
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_mpsfcrelsort_m
integer x = 2327
integer y = 404
integer height = 1380
boolean bringtotop = true
end type

type st_3 from statictext within w_mpsfcrelsort_m
integer x = 1243
integer y = 40
integer width = 521
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_mpsfcrelsort_m
integer x = 1243
integer y = 120
integer width = 526
integer height = 80
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_4 from statictext within w_mpsfcrelsort_m
integer x = 110
integer y = 296
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

type ddlb_fld from dropdownlistbox within w_mpsfcrelsort_m
integer x = 297
integer y = 280
integer width = 448
integer height = 632
integer taborder = 20
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

type ddlb_dwtitles from dropdownlistbox within w_mpsfcrelsort_m
integer x = 338
integer y = 292
integer width = 311
integer height = 88
integer taborder = 110
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

type st_5 from statictext within w_mpsfcrelsort_m
integer x = 795
integer y = 296
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

type ddlb_op from dropdownlistbox within w_mpsfcrelsort_m
integer x = 965
integer y = 280
integer width = 297
integer height = 512
integer taborder = 30
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

type sle_value from singlelineedit within w_mpsfcrelsort_m
integer x = 1285
integer y = 288
integer width = 567
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

type cb_1 from commandbutton within w_mpsfcrelsort_m
integer x = 1856
integer y = 288
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_mpsfcrelsort_m
integer x = 2021
integer y = 288
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_mpsfcrelsort_m
integer x = 2185
integer y = 288
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_mpsfcrelsort_m
integer x = 2350
integer y = 288
integer width = 160
integer height = 76
integer taborder = 120
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_3 from datawindow within w_mpsfcrelsort_m
integer x = 32
integer y = 1836
integer width = 4238
integer height = 320
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcrelsort_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)


end event

type st_horizontal from u_splitbar_horizontal within w_mpsfcrelsort_m
integer x = 32
integer y = 1800
integer width = 4238
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_1.height

end event

type cbx_grp from checkbox within w_mpsfcrelsort_m
integer x = 2560
integer y = 288
integer width = 334
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "그룹핑"
end type

event clicked;// 그룹핑
if this.checked = true then
	cb_ins.enabled = true
else
	cb_ins.enabled = false
end if

end event

type pb_1 from picturebutton within w_mpsfcrelsort_m
event mousemove pbm_mousemove
integer x = 3337
integer y = 48
integer width = 187
integer height = 144
integer taborder = 80
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

choose case is_dw
	case "dw_1"
		dw_dest = dw_1
	
	case "dw_2"
		dw_dest = dw_2

	case "dw_3"
		dw_dest = dw_3
end choose

string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos,   li_value

if dw_dest.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_dest.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_dest.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type cb_ins from commandbutton within w_mpsfcrelsort_m
integer x = 2926
integer y = 272
integer width = 471
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "INS"
end type

event clicked;// 추가
//
string   ls_area, ls_seq, ls_wcno, ls_wcname, ls_overtime
datetime ldt_workdate
decimal  ld_calcqty
long     ll_row, ll_seq, ll_max, ll_find

debugbreak()

ll_max  = 0
if dw_2.rowcount() > 0 then
	ls_seq  = LeftA(dw_2.object.tseq[1],1)
end if

if isnull(ls_seq) OR ls_seq = "" OR ls_seq = "Z" then 
	ls_seq = "A"
else
	ls_seq = CharA(AscA(ls_seq) + 1)
end if

ldt_workdate = datetime( date(em_1.text), time("00:00:00.000") )

for ll_row = 1 to UpperBound(il_row)
	if isnull(il_row[ll_row]) OR il_row[ll_row] < 1 then CONTINUE
	
	ll_seq      = il_row[ll_row]
	
	ls_area     = dw_1.object.area_no[ll_seq]
	ls_wcno     = dw_1.object.wc_no[ll_seq]
	ls_wcname   = dw_1.object.work_nm[ll_seq] 
	ls_overtime = dw_1.object.overtime[ll_seq]
	if isnull(ls_overtime) then ls_overtime = ""	
	ld_calcqty  = dw_1.object.calc_qty[ll_seq]
	
	ll_find = dw_2.find( "wc_no = '" + ls_wcno + "' and overtime = '" + ls_overtime + "'", 1, dw_2.rowcount() )
	if ll_find > 0 then
		dw_2.object.calc_qty[ll_find] = ld_calcqty
		dw_2.object.seq[ll_find]      = ls_seq + RightA("00" + string(ll_max),2)
	else
		ll_max  = ll_max + 1
		
		ll_find = dw_2.insertrow( 0 )
		
		dw_2.object.area_no[ll_find]    = ls_area
		dw_2.object.wc_no[ll_find]      = ls_wcno
		dw_2.object.work_nm[ll_find]    = ls_wcname
		
		dw_2.object.order_date[ll_find] = ldt_workdate
		dw_2.object.calc_qty[ll_find]   = ld_calcqty
		dw_2.object.overtime[ll_find]   = ls_overtime
		dw_2.object.seq[ll_find]        = ls_seq + RightA("00" + string(ll_max),2)
	end if
next

// 초기화
cbx_grp.checked = false
cbx_grp.triggerevent( clicked! )

il_row = il_null
il_seq = 0

dw_1.SelectRow(0, FALSE)

end event

type dw_4 from datawindow within w_mpsfcrelsort_m
integer x = 827
integer y = 712
integer width = 2459
integer height = 760
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_mpsfcrelsort_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;// 
string   ls_value, ls_title, ls_wcno, ls_wcnm, ls_overtime
long     ll_row, ll_col
datetime ldt_orderdate

ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_value  = string( this.GetItemNumber( ll_row, ll_col) )

// @order_date 이전컬럼 클릭시 
if ll_col < 3 then RETURN		// @col
if isnull(ls_value) OR ls_value = "" then RETURN

ls_title      = WF_CrossTab_Title( this, ll_row, ll_col )
ldt_orderdate = datetime( date(ls_title), time("00:00:00.000") )

ls_wcnm      = this.object.work_nm[ll_row]
ls_overtime  = this.object.overtime[ll_row]
if ls_overtime = "" then setnull(ls_overtime)

SELECT work_no INTO :ls_wcno FROM wc WHERE work_name = :ls_wcnm;

debugbreak()

if isnull(ls_wcno) OR ls_wcno = "" then	
else	
	dw_3.retrieve( ls_wcno, ldt_orderdate, ls_overtime )
	MessageBox("확인","조회완료")
end if

end event

event clicked;//
This.SelectRow( 0, false )
This.SelectRow( row, true )

end event

type cbx_daysum from checkbox within w_mpsfcrelsort_m
integer x = 2459
integer y = 88
integer width = 384
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "일별집계"
end type

event clicked;//
if this.checked = true then
	dw_4.visible = true
	cbx_grp.enabled = false
else
	dw_4.visible = false
	cbx_grp.enabled = true
end if

end event

type gb_4 from groupbox within w_mpsfcrelsort_m
integer x = 1211
integer y = 4
integer width = 590
integer height = 212
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
end type

type gb_5 from groupbox within w_mpsfcrelsort_m
integer x = 2405
integer y = 4
integer width = 480
integer height = 212
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

