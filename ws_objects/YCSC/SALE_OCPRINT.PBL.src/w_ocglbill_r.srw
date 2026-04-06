$PBExportHeader$w_ocglbill_r.srw
$PBExportComments$발행자별 어음현황(1998/05/12, 정재수)
forward
global type w_ocglbill_r from w_inheritance
end type
type dw_3 from datawindow within w_ocglbill_r
end type
type em_1 from editmask within w_ocglbill_r
end type
type st_3 from statictext within w_ocglbill_r
end type
type em_2 from editmask within w_ocglbill_r
end type
type st_4 from statictext within w_ocglbill_r
end type
type st_5 from statictext within w_ocglbill_r
end type
type pb_1 from picturebutton within w_ocglbill_r
end type
end forward

global type w_ocglbill_r from w_inheritance
integer y = 112
integer width = 3845
integer height = 2188
string title = "발행자별 어음현황(w_ocglbill_r)"
dw_3 dw_3
em_1 em_1
st_3 st_3
em_2 em_2
st_4 st_4
st_5 st_5
pb_1 pb_1
end type
global w_ocglbill_r w_ocglbill_r

type variables

end variables

on w_ocglbill_r.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.em_1=create em_1
this.st_3=create st_3
this.em_2=create em_2
this.st_4=create st_4
this.st_5=create st_5
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.pb_1
end on

on w_ocglbill_r.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.em_2)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

dw_3.settransobject(sqlca)
//dw_2.insertrow(0)
datawindowchild ldwc_car
dw_2.insertrow(0)
dw_2.getchild('draft',ldwc_car)
ldwc_car.insertrow(1)
ldwc_car.setitem(1,'draft','%')
ldwc_car.accepttext()
ldwc_car.scrolltorow(1)

dw_3.visible = false
dw_1.sharedata(dw_3)

end event

type pb_save from w_inheritance`pb_save within w_ocglbill_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_ocglbill_r
integer x = 37
integer y = 272
integer width = 3712
integer height = 1764
integer taborder = 0
string dataobject = "d_ocglbillrep_r"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ocglbill_r
integer x = 1330
integer y = 80
integer width = 791
integer height = 92
integer taborder = 10
string dataobject = "d_ocglbillrep_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocglbill_r
integer y = 40
integer width = 1198
string text = "발행자별 어음현황"
end type

type st_tips from w_inheritance`st_tips within w_ocglbill_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocglbill_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocglbill_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_ocglbill_r
integer x = 3557
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocglbill_r
integer x = 3173
integer taborder = 30
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 발행자별 어음현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=96'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ocglbill_r
boolean visible = false
integer taborder = 90
end type

type pb_delete from w_inheritance`pb_delete within w_ocglbill_r
boolean visible = false
integer taborder = 100
end type

type pb_insert from w_inheritance`pb_insert within w_ocglbill_r
boolean visible = false
integer taborder = 110
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocglbill_r
integer x = 2981
integer taborder = 20
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.accepttext()
dw_1.retrieve(dw_2.object.draft[1], em_1.text, em_2.text)


end event

type gb_3 from w_inheritance`gb_3 within w_ocglbill_r
integer x = 1298
integer y = 20
integer width = 1614
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
string text = "발행자/만기일자"
end type

type gb_2 from w_inheritance`gb_2 within w_ocglbill_r
integer x = 23
integer y = 232
integer width = 3749
integer height = 1816
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_ocglbill_r
integer x = 2953
integer width = 818
integer taborder = 0
end type

type dw_3 from datawindow within w_ocglbill_r
integer x = 1166
integer width = 73
integer height = 52
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_ocglbillrep_r1"
boolean livescroll = true
end type

type em_1 from editmask within w_ocglbill_r
integer x = 2121
integer y = 84
integer width = 357
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_ocglbill_r
integer x = 2473
integer y = 68
integer width = 64
integer height = 72
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_ocglbill_r
integer x = 2537
integer y = 80
integer width = 357
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_4 from statictext within w_ocglbill_r
integer x = 247
integer y = 196
integer width = 206
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "미결재"
boolean focusrectangle = false
end type

type st_5 from statictext within w_ocglbill_r
integer x = 46
integer y = 196
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "결재"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocglbill_r
event mousemove pbm_mousemove
integer x = 3365
integer y = 52
integer width = 187
integer height = 144
integer taborder = 120
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
if dw_1.rowcount() < 1 then return
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



end event

