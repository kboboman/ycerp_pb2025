$PBExportHeader$w_iolocmove_r.srw
$PBExportComments$일별 물품이동 현황(2001/05/23, 이인호)
forward
global type w_iolocmove_r from w_inheritance
end type
type st_1 from statictext within w_iolocmove_r
end type
type em_1 from editmask within w_iolocmove_r
end type
type em_2 from editmask within w_iolocmove_r
end type
type dw_3 from datawindow within w_iolocmove_r
end type
type st_2 from statictext within w_iolocmove_r
end type
type st_3 from statictext within w_iolocmove_r
end type
type pb_1 from picturebutton within w_iolocmove_r
end type
end forward

global type w_iolocmove_r from w_inheritance
integer width = 4562
integer height = 2668
string title = "일별물품 이동현황(w_iolocmove_r)"
st_1 st_1
em_1 em_1
em_2 em_2
dw_3 dw_3
st_2 st_2
st_3 st_3
pb_1 pb_1
end type
global w_iolocmove_r w_iolocmove_r

type variables
st_print i_print
date id_start, id_end
datawindowchild idwc_loc
end variables

on w_iolocmove_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.st_2=create st_2
this.st_3=create st_3
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.pb_1
end on

on w_iolocmove_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.insertrow(0)
dw_2.visible = false
em_1.text = string(RelativeDate(today(), - 7), "YYYY/MM/DD")
em_2.text = string(today(), "YYYY/MM/DD")

dw_3.SetTransObject(SQLCA)
dw_3.insertrow(0)
dw_3.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(SQLCA)

idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", "%")
idwc_loc.setitem(1, "loc_name", "전체")


end event

event resize;call super::resize;//
gb_3.width  = this.width  - 100
gb_3.height = this.height - 368

dw_1.width  = this.width  - 178
dw_1.height = this.height - 464

end event

type pb_save from w_inheritance`pb_save within w_iolocmove_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_iolocmove_r
integer x = 69
integer y = 308
integer width = 4384
integer height = 2204
integer taborder = 30
string dataobject = "d_iolocmove_t"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_iolocmove_r
integer x = 1307
integer y = 16
integer width = 110
integer height = 84
integer taborder = 40
string dataobject = "d_iolocmove_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_iolocmove_r
integer x = 41
integer width = 1335
integer height = 136
string text = "일별물품 이동현황"
end type

type st_tips from w_inheritance`st_tips within w_iolocmove_r
end type

type pb_compute from w_inheritance`pb_compute within w_iolocmove_r
boolean visible = false
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_iolocmove_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iolocmove_r
integer x = 4270
integer y = 60
integer taborder = 70
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iolocmove_r
integer x = 3890
integer y = 60
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_sql, ls_where, ls_source
gs_print_str lstr_print

if dw_1.getrow() <= 0 then return

dw_2.SetTransObject(SQLCA)
dw_1.sharedata(dw_2)

i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 일별물품 이동현황을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)


end event

type pb_cancel from w_inheritance`pb_cancel within w_iolocmove_r
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_iolocmove_r
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_iolocmove_r
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iolocmove_r
integer x = 3698
integer y = 60
integer taborder = 50
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date ld_start, ld_end
string ls_loc

ld_start = date(em_1.text)
ld_end = date(em_2.text)
ls_loc  = trim(dw_3.object.loc_no[1])

if isnull(ls_loc) or ls_loc = "" then
	messagebox('오류','저장소를 입력하십시요.',exclamation!)
	return
end if

dw_1.reset()
dw_1.SetTransObject(SQLCA)
dw_1.retrieve( ld_start, ld_end, ls_loc)
if dw_1.rowcount() < 1 then
	messagebox("에러","해당일에 조회한 자료가 없습니다",Exclamation!)
end if

end event

type gb_3 from w_inheritance`gb_3 within w_iolocmove_r
integer x = 32
integer y = 248
integer width = 4462
integer height = 2300
integer taborder = 80
integer textsize = -9
end type

type gb_2 from w_inheritance`gb_2 within w_iolocmove_r
integer x = 2574
integer y = 16
integer width = 1083
integer height = 204
integer taborder = 0
integer textsize = -8
long textcolor = 8388608
end type

type gb_1 from w_inheritance`gb_1 within w_iolocmove_r
integer x = 3671
integer y = 16
integer width = 814
integer taborder = 0
end type

type st_1 from statictext within w_iolocmove_r
integer x = 3195
integer y = 120
integer width = 59
integer height = 76
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_iolocmove_r
integer x = 2825
integer y = 132
integer width = 361
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
boolean autoskip = true
end type

event modified;id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_iolocmove_r
integer x = 3255
integer y = 132
integer width = 361
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
boolean autoskip = true
end type

event modified;id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_3 from datawindow within w_iolocmove_r
integer x = 2775
integer y = 44
integer width = 864
integer height = 84
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_iolocmove_r
integer x = 2619
integer y = 48
integer width = 155
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "입고"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_iolocmove_r
integer x = 2619
integer y = 132
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = StyleLowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_iolocmove_r
event mousemove pbm_mousemove
integer x = 4078
integer y = 60
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

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

