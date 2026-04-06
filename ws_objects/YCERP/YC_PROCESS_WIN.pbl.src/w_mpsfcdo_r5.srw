$PBExportHeader$w_mpsfcdo_r5.srw
$PBExportComments$생산 현황
forward
global type w_mpsfcdo_r5 from w_inheritance
end type
type em_1 from editmask within w_mpsfcdo_r5
end type
type em_2 from editmask within w_mpsfcdo_r5
end type
type dw_area from datawindow within w_mpsfcdo_r5
end type
type pb_1 from pb_print within w_mpsfcdo_r5
end type
type pb_2 from picturebutton within w_mpsfcdo_r5
end type
type st_3 from statictext within w_mpsfcdo_r5
end type
type ddlb_fld from dropdownlistbox within w_mpsfcdo_r5
end type
type st_4 from statictext within w_mpsfcdo_r5
end type
type ddlb_op from dropdownlistbox within w_mpsfcdo_r5
end type
type sle_value from singlelineedit within w_mpsfcdo_r5
end type
type cb_1 from commandbutton within w_mpsfcdo_r5
end type
type cb_2 from commandbutton within w_mpsfcdo_r5
end type
type cb_3 from commandbutton within w_mpsfcdo_r5
end type
type cb_5 from commandbutton within w_mpsfcdo_r5
end type
type gb_4 from groupbox within w_mpsfcdo_r5
end type
type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r5
end type
type st_2 from statictext within w_mpsfcdo_r5
end type
type st_1 from statictext within w_mpsfcdo_r5
end type
type st_7 from statictext within w_mpsfcdo_r5
end type
type dw_4 from datawindow within w_mpsfcdo_r5
end type
type st_5 from statictext within w_mpsfcdo_r5
end type
type cbx_openclose from checkbox within w_mpsfcdo_r5
end type
type em_3 from editmask within w_mpsfcdo_r5
end type
type st_6 from statictext within w_mpsfcdo_r5
end type
type ddlb_term from dropdownlistbox within w_mpsfcdo_r5
end type
type rb_1 from radiobutton within w_mpsfcdo_r5
end type
type rb_2 from radiobutton within w_mpsfcdo_r5
end type
type ddlb_wc from dropdownlistbox within w_mpsfcdo_r5
end type
type st_9 from statictext within w_mpsfcdo_r5
end type
type st_8 from statictext within w_mpsfcdo_r5
end type
type gb_5 from groupbox within w_mpsfcdo_r5
end type
type gb_6 from groupbox within w_mpsfcdo_r5
end type
end forward

global type w_mpsfcdo_r5 from w_inheritance
integer width = 6587
integer height = 3360
string title = "생산현황 리스트(w_mpsfcdo_r5)"
em_1 em_1
em_2 em_2
dw_area dw_area
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
gb_4 gb_4
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
st_1 st_1
st_7 st_7
dw_4 dw_4
st_5 st_5
cbx_openclose cbx_openclose
em_3 em_3
st_6 st_6
ddlb_term ddlb_term
rb_1 rb_1
rb_2 rb_2
ddlb_wc ddlb_wc
st_9 st_9
st_8 st_8
gb_5 gb_5
gb_6 gb_6
end type
global w_mpsfcdo_r5 w_mpsfcdo_r5

type variables
st_print i_print
datawindowchild idwc_area, idwc_user
long i_row

end variables

on w_mpsfcdo_r5.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_area=create dw_area
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.gb_4=create gb_4
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.st_1=create st_1
this.st_7=create st_7
this.dw_4=create dw_4
this.st_5=create st_5
this.cbx_openclose=create cbx_openclose
this.em_3=create em_3
this.st_6=create st_6
this.ddlb_term=create ddlb_term
this.rb_1=create rb_1
this.rb_2=create rb_2
this.ddlb_wc=create ddlb_wc
this.st_9=create st_9
this.st_8=create st_8
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.ddlb_op
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_5
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.ddlb_dwtitles
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.dw_4
this.Control[iCurrent+21]=this.st_5
this.Control[iCurrent+22]=this.cbx_openclose
this.Control[iCurrent+23]=this.em_3
this.Control[iCurrent+24]=this.st_6
this.Control[iCurrent+25]=this.ddlb_term
this.Control[iCurrent+26]=this.rb_1
this.Control[iCurrent+27]=this.rb_2
this.Control[iCurrent+28]=this.ddlb_wc
this.Control[iCurrent+29]=this.st_9
this.Control[iCurrent+30]=this.st_8
this.Control[iCurrent+31]=this.gb_5
this.Control[iCurrent+32]=this.gb_6
end on

on w_mpsfcdo_r5.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.gb_4)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.dw_4)
destroy(this.st_5)
destroy(this.cbx_openclose)
destroy(this.em_3)
destroy(this.st_6)
destroy(this.ddlb_term)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.ddlb_wc)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.settransobject(sqlca)
dw_2.visible = false

datetime ldt_sdate, ldt_edate

SELECT 
	top 1 DateAdd(month, -1, getdate()), DateAdd(day, -1, getdate()) 
INTO 
	:ldt_sdate, :ldt_edate 
FROM 
	login
using sqlca;

em_1.text = string(ldt_sdate, "yyyy/mm/dd")
em_2.text = string(ldt_edate, "yyyy/mm/dd")

// 사업장
dw_area.object.area.Background.Color   = 67108864
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_area.object.area[1] = 'S0001'  // gs_area

// 담당자
dw_4.insertrow(1)
dw_4.getchild("user",idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,"user_id","%")
idwc_user.setitem(1,"user_name","전체")
idwc_user.accepttext()
dw_4.object.user[1] = "%"

ddlb_term.text = ' 7일이후'

ddlb_wc.text = '전체         %'
end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (32 * 2)

dw_1.width  = newwidth  - (32 * 2)
dw_1.height = newheight - dw_1.y - 32




end event

type pb_save from w_inheritance`pb_save within w_mpsfcdo_r5
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_mpsfcdo_r5
integer x = 32
integer y = 424
integer width = 4498
integer height = 1912
integer taborder = 60
string dataobject = "d_mpsfcdo_r5_01"
boolean livescroll = false
end type

event dw_1::clicked;call super::clicked;GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type st_title from w_inheritance`st_title within w_mpsfcdo_r5
integer x = 32
integer y = 28
integer width = 1088
integer height = 144
string text = "생산현황 리스트"
end type

type st_tips from w_inheritance`st_tips within w_mpsfcdo_r5
end type

type pb_compute from w_inheritance`pb_compute within w_mpsfcdo_r5
boolean visible = false
integer taborder = 340
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsfcdo_r5
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsfcdo_r5
integer x = 5495
integer y = 72
integer taborder = 250
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsfcdo_r5
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 220
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//w_repsuper w_print
//gs_print_str lstr_print
//datawindow dw_print
//string ls_sql, ls_where, ls_source
//
//if dw_3.getrow() <= 0 then RETURN
//
//if rb_3.checked = true then
//	if rb_1.checked = true then
//		dw_2.dataobject = 'd_mpsfcwc_r1'
//	else
//		dw_2.dataobject = 'd_mpsfcwc_r2'
//	end if
//	dw_2.SetTransObject(SQLCA)
//	
//	dw_3.sharedata(dw_2)
//	dw_print = dw_2
//	gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//else
//	dw_print = dw_4
//	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//end if
//
//i_print.st_datawindow = dw_print
//i_print.st_print_sheet = " 프린트용지 : A4"
//i_print.st_print_desc = " 이 프로그램은 작업장별 생산현황을 출력합니다." 
//
//opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
//
//
end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsfcdo_r5
boolean visible = false
integer taborder = 350
end type

type pb_delete from w_inheritance`pb_delete within w_mpsfcdo_r5
boolean visible = false
integer taborder = 360
end type

type pb_insert from w_inheritance`pb_insert within w_mpsfcdo_r5
boolean visible = false
integer taborder = 370
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsfcdo_r5
integer x = 5102
integer y = 72
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_sdate, ls_edate, ls_salesman, ls_area, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

ls_sdate = em_1.text
ls_edate = em_2.text

select  
	substring(a.ls_date,1,4) + '/' + substring(a.ls_date,5,2) + '/' + substring(a.ls_date,7,2) lsdate
into 
	:ls_ssale_date
from 
	(   
	select MIN(SUBSTRING(sfcday.SALE_NO,3,8)) ls_date
	from sfcday with(nolock)
	where sfcday.sfc_date between :ls_sdate + ' 00:00:00' AND :ls_edate + ' 23:59:59' 
	and sfcday.item_no = sfcday.assembly
	and sfcday.qa = sfcday.assembly_qa
	and sfcday.type = 'C'
	and sfcday.cust_no  <> ''  
	AND ISNULL(sfcday.MAKE_QTY,0) > 0
	) a
using sqlca;

// 사업장
dw_area.accepttext()
ls_area     = dw_area.object.area[1]

if ls_area <> '%' then
	ls_area = '%'+ls_area+'%'
end if

// 담당자
dw_4.accepttext()
ls_salesman = dw_4.object.user[1]

// 마감제외
if cbx_openclose.checked = true then
	ls_openclose = "O"
else
	ls_openclose = ""
end if

// 경과
ls_calctime = trim(LeftA(ddlb_term.text,2))
ls_wc_no = trim(RightA(ddlb_wc.text,3))
ls_wc_no = LeftA(ls_wc_no,1)+'%'

//조회
dw_1.retrieve( ls_area, ls_salesman, ls_sdate, ls_edate, ls_openclose, ls_calctime, ls_ssale_date, ls_wc_no)
if dw_1.rowcount() < 1 then
	MessageBox("확인","해당월에 조회한 자료가 없습니다",Exclamation!)
else
	MessageBox("확인","조회완료")
end if

end event

type gb_3 from w_inheritance`gb_3 within w_mpsfcdo_r5
integer x = 1166
integer y = 16
integer width = 581
integer height = 232
integer taborder = 310
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_mpsfcdo_r5
integer x = 1760
integer y = 16
integer width = 800
integer height = 232
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_mpsfcdo_r5
integer x = 5088
integer y = 16
integer width = 617
integer height = 232
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_mpsfcdo_r5
integer x = 105
integer y = 148
integer width = 105
integer height = 72
integer taborder = 80
string dataobject = "d_mpsfcwc_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_mpsfcdo_r5
integer x = 1792
integer y = 144
integer width = 361
integer height = 72
integer taborder = 120
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
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type em_2 from editmask within w_mpsfcdo_r5
integer x = 2162
integer y = 144
integer width = 361
integer height = 72
integer taborder = 200
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
boolean autoskip = true
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//OpenWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm),"yyyy/mm/dd")
//end if
//
end event

type dw_area from datawindow within w_mpsfcdo_r5
integer x = 1193
integer y = 140
integer width = 526
integer height = 80
integer taborder = 330
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type pb_1 from pb_print within w_mpsfcdo_r5
integer x = 2386
integer y = 40
integer taborder = 90
boolean bringtotop = true
string picturename = "CrossTab!"
end type

type pb_2 from picturebutton within w_mpsfcdo_r5
integer x = 5298
integer y = 72
integer width = 187
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

dwxls = dw_1

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			//	dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
end if
MessageBox("확인","엑셀파일 작업완료.")

end event

type st_3 from statictext within w_mpsfcdo_r5
integer x = 105
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_mpsfcdo_r5
integer x = 293
integer y = 308
integer width = 448
integer height = 632
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
end type

type st_4 from statictext within w_mpsfcdo_r5
integer x = 791
integer y = 324
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

type ddlb_op from dropdownlistbox within w_mpsfcdo_r5
integer x = 960
integer y = 308
integer width = 297
integer height = 512
integer taborder = 40
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

type sle_value from singlelineedit within w_mpsfcdo_r5
integer x = 1280
integer y = 316
integer width = 567
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_mpsfcdo_r5
integer x = 1851
integer y = 316
integer width = 160
integer height = 76
integer taborder = 190
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

type cb_2 from commandbutton within w_mpsfcdo_r5
integer x = 2016
integer y = 316
integer width = 160
integer height = 76
integer taborder = 210
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

type cb_3 from commandbutton within w_mpsfcdo_r5
integer x = 2181
integer y = 316
integer width = 160
integer height = 76
integer taborder = 230
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

type cb_5 from commandbutton within w_mpsfcdo_r5
integer x = 2345
integer y = 316
integer width = 160
integer height = 76
integer taborder = 260
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

type gb_4 from groupbox within w_mpsfcdo_r5
integer x = 183
integer y = 260
integer width = 4343
integer height = 152
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type ddlb_dwtitles from dropdownlistbox within w_mpsfcdo_r5
integer x = 334
integer y = 320
integer width = 311
integer height = 88
integer taborder = 240
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

type st_2 from statictext within w_mpsfcdo_r5
integer x = 1193
integer y = 60
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

type st_1 from statictext within w_mpsfcdo_r5
integer x = 1792
integer y = 60
integer width = 731
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "생산일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_mpsfcdo_r5
integer x = 2601
integer y = 60
integer width = 658
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_mpsfcdo_r5
integer x = 2597
integer y = 140
integer width = 663
integer height = 84
integer taborder = 280
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

end event

type st_5 from statictext within w_mpsfcdo_r5
integer x = 91
integer y = 256
integer width = 1545
integer height = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "출고수량은 반품수량을 포함하지 않음.(물품이동 포함)"
boolean focusrectangle = false
end type

type cbx_openclose from checkbox within w_mpsfcdo_r5
integer x = 4242
integer y = 64
integer width = 375
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "마감제외"
end type

type em_3 from editmask within w_mpsfcdo_r5
boolean visible = false
integer x = 4818
integer y = 464
integer width = 183
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean enabled = false
string text = "15"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type st_6 from statictext within w_mpsfcdo_r5
integer x = 3319
integer y = 64
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "생산일기준"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_term from dropdownlistbox within w_mpsfcdo_r5
integer x = 3739
integer y = 64
integer width = 475
integer height = 428
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean sorted = false
string item[] = {" 3일이후"," 5일이후"," 7일이후","15일이후","30일이후"}
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_mpsfcdo_r5
integer x = 4690
integer y = 68
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "담당자순"
boolean checked = true
end type

event clicked;dw_1.dataobject = 'd_mpsfcdo_r5_01'
dw_1.settrans( sqlca )

ddlb_wc.text = '전체         %'

ddlb_wc.enabled = true
st_9.enabled = true
end event

type rb_2 from radiobutton within w_mpsfcdo_r5
integer x = 4690
integer y = 148
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "제품순"
end type

event clicked;dw_1.dataobject = 'd_mpsfcdo_r5_02'
dw_1.settrans( sqlca )

dw_4.object.user[1] = "%"
dw_4.enabled = false

ddlb_wc.enabled = true
st_9.enabled = true

end event

type ddlb_wc from dropdownlistbox within w_mpsfcdo_r5
integer x = 3739
integer y = 152
integer width = 475
integer height = 920
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체         %","절곡         B00","성형         F00","도장         P00","유압         U00","화성         T00","YSP         Y00","",""}
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_mpsfcdo_r5
integer x = 3319
integer y = 152
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "생산처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_mpsfcdo_r5
integer x = 2583
integer y = 272
integer width = 1166
integer height = 124
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "작업중....."
long bordercolor = 255
boolean focusrectangle = false
end type

type gb_5 from groupbox within w_mpsfcdo_r5
integer x = 2578
integer y = 16
integer width = 713
integer height = 232
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

type gb_6 from groupbox within w_mpsfcdo_r5
integer x = 3305
integer y = 16
integer width = 1765
integer height = 232
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 79219928
end type

