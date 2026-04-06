$PBExportHeader$w_iointemp_r.srw
$PBExportComments$가입고조회(2003/08/27, 이인호)
forward
global type w_iointemp_r from w_inheritance
end type
type em_1 from editmask within w_iointemp_r
end type
type em_2 from editmask within w_iointemp_r
end type
type dw_3 from datawindow within w_iointemp_r
end type
type st_1 from statictext within w_iointemp_r
end type
type st_2 from statictext within w_iointemp_r
end type
type dw_4 from datawindow within w_iointemp_r
end type
type pb_1 from picturebutton within w_iointemp_r
end type
end forward

global type w_iointemp_r from w_inheritance
integer width = 3657
integer height = 2172
string title = "가입고 조회(w_iointemp_r)"
em_1 em_1
em_2 em_2
dw_3 dw_3
st_1 st_1
st_2 st_2
dw_4 dw_4
pb_1 pb_1
end type
global w_iointemp_r w_iointemp_r

type variables
datawindowchild idwc_item,idwc_qa

end variables

on w_iointemp_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.st_1=create st_1
this.st_2=create st_2
this.dw_4=create dw_4
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_4
this.Control[iCurrent+7]=this.pb_1
end on

on w_iointemp_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_4)
destroy(this.pb_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

this.x = 1
this.y = 1
dw_3.SetTransObject(SQLCA)
dw_4.SetTransObject(SQLCA)
dw_3.insertrow(1)
dw_4.visible = false

string ls_loc

em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')
select def_loc into :ls_loc from area
 where area_no = :gs_area;
dw_3.object.loc_no[1] = ls_loc
dw_3.accepttext()

if gs_userid = 'root' or gs_userid = '1999010s' then
	dw_3.enabled = true
else
	dw_3.enabled = false
end if

em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")
dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

end event

event resize;call super::resize;//
dw_1.width  = this.width  - 87

dw_2.width  = this.width  - 87
dw_2.height = this.height - 740

end event

type pb_save from w_inheritance`pb_save within w_iointemp_r
boolean visible = false
integer x = 3191
end type

type dw_1 from w_inheritance`dw_1 within w_iointemp_r
integer x = 23
integer y = 240
integer width = 3570
integer height = 360
integer taborder = 50
string dataobject = "d_iointemp_s1"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_iointemp_r
integer x = 23
integer y = 616
integer width = 3570
integer height = 1432
integer taborder = 60
string dataobject = "d_iointemp_s"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;long ll_row

ll_row = this.getrow()
if ll_row < 1 then return

string ls_order
long ll_seq

ls_order = this.object.intemp_no[ll_row]
ll_seq = this.object.seq[ll_row]
dw_1.retrieve(ls_order, ll_seq)

end event

event dw_2::clicked;call super::clicked;if row < 1 then return

this.scrolltorow(row)

end event

type st_title from w_inheritance`st_title within w_iointemp_r
integer x = 32
integer y = 44
integer width = 969
string text = "가입고 조회"
end type

type st_tips from w_inheritance`st_tips within w_iointemp_r
integer x = 206
integer y = 176
end type

type pb_compute from w_inheritance`pb_compute within w_iointemp_r
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_iointemp_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iointemp_r
integer x = 3374
integer taborder = 110
fontcharset fontcharset = ansi!
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iointemp_r
integer x = 2990
integer taborder = 120
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	return
end if

l_print.st_datawindow = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 가입고 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_iointemp_r
boolean visible = false
integer x = 2601
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_iointemp_r
boolean visible = false
integer x = 2807
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_iointemp_r
boolean visible = false
integer x = 2999
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iointemp_r
integer x = 2793
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_start, ls_end

dw_1.reset()
dw_2.reset()
ls_start = em_1.text
ls_end = em_2.text
dw_2.retrieve(dw_3.object.loc_no[1], date(ls_start), date(ls_end))
dw_4.retrieve(dw_3.object.loc_no[1], date(ls_start), date(ls_end))

end event

type gb_3 from w_inheritance`gb_3 within w_iointemp_r
boolean visible = false
integer x = 2139
integer y = 24
integer width = 288
integer height = 184
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_iointemp_r
integer x = 1573
integer y = 8
integer width = 1161
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_iointemp_r
integer x = 2761
integer y = 8
integer width = 832
integer height = 216
integer weight = 400
long textcolor = 0
end type

type em_1 from editmask within w_iointemp_r
integer x = 1838
integer y = 128
integer width = 366
integer height = 76
integer taborder = 70
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

type em_2 from editmask within w_iointemp_r
integer x = 2313
integer y = 128
integer width = 366
integer height = 76
integer taborder = 70
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

type dw_3 from datawindow within w_iointemp_r
integer x = 1833
integer y = 40
integer width = 859
integer height = 84
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "d_location"
boolean border = false
boolean livescroll = true
end type

event losefocus;dw_3.accepttext()

end event

type st_1 from statictext within w_iointemp_r
integer x = 1591
integer y = 52
integer width = 233
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "저장소:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_iointemp_r
integer x = 2217
integer y = 120
integer width = 87
integer height = 72
boolean bringtotop = true
integer textsize = -20
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

type dw_4 from datawindow within w_iointemp_r
integer x = 1138
integer y = 56
integer width = 110
integer height = 96
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_iointemp_r"
boolean livescroll = true
end type

type pb_1 from picturebutton within w_iointemp_r
event mousemove pbm_mousemove
integer x = 3182
integer y = 52
integer width = 187
integer height = 144
integer taborder = 100
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
long ll_cnt

ll_cnt = dw_2.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_2.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_2.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

