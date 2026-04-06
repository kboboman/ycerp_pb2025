$PBExportHeader$w_ocglbillen_r.srw
$PBExportComments$어음번호별 배서자현황(1998/07/06,성삼지)
forward
global type w_ocglbillen_r from w_inheritance
end type
type st_1 from statictext within w_ocglbillen_r
end type
type ddlb_fld from dropdownlistbox within w_ocglbillen_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ocglbillen_r
end type
type st_2 from statictext within w_ocglbillen_r
end type
type sle_value from singlelineedit within w_ocglbillen_r
end type
type cb_1 from commandbutton within w_ocglbillen_r
end type
type cb_2 from commandbutton within w_ocglbillen_r
end type
type cb_3 from commandbutton within w_ocglbillen_r
end type
type cb_5 from commandbutton within w_ocglbillen_r
end type
type pb_1 from picturebutton within w_ocglbillen_r
end type
type ddlb_op from dropdownlistbox within w_ocglbillen_r
end type
end forward

global type w_ocglbillen_r from w_inheritance
integer y = 112
integer width = 3845
integer height = 2188
string title = "어음번호별 배서자현황(w_ocglbillen_r)"
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_2 st_2
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
pb_1 pb_1
ddlb_op ddlb_op
end type
global w_ocglbillen_r w_ocglbillen_r

type variables

end variables

on w_ocglbillen_r.create
int iCurrent
call super::create
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_2=create st_2
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.pb_1=create pb_1
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.ddlb_op
end on

on w_ocglbillen_r.destroy
call super::destroy
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_2)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.pb_1)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_1.sharedata(dw_2)
dw_2.visible = false
end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_ocglbillen_r
boolean visible = false
integer taborder = 60
end type

type dw_1 from w_inheritance`dw_1 within w_ocglbillen_r
integer x = 32
integer y = 420
integer width = 3744
integer height = 1612
integer taborder = 0
string dataobject = "d_ocglbillen_r"
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_ocglbillen_r
integer x = 37
integer y = 32
integer width = 1550
string text = "어음번호별 배서자현황"
end type

type st_tips from w_inheritance`st_tips within w_ocglbillen_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocglbillen_r
boolean visible = false
integer taborder = 70
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocglbillen_r
boolean visible = false
integer taborder = 50
end type

type pb_close from w_inheritance`pb_close within w_ocglbillen_r
integer x = 3543
integer y = 60
integer taborder = 40
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocglbillen_r
integer x = 3145
integer y = 60
integer taborder = 30
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 어음번호별 배서자현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_ocglbillen_r
boolean visible = false
integer taborder = 80
end type

type pb_delete from w_inheritance`pb_delete within w_ocglbillen_r
boolean visible = false
integer taborder = 90
end type

type pb_insert from w_inheritance`pb_insert within w_ocglbillen_r
boolean visible = false
integer taborder = 100
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocglbillen_r
integer x = 2953
integer y = 60
integer taborder = 20
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.retrieve()	
end event

type gb_3 from w_inheritance`gb_3 within w_ocglbillen_r
boolean visible = false
integer x = 2290
integer y = 48
integer width = 837
integer height = 168
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
string text = "발행자"
end type

type gb_2 from w_inheritance`gb_2 within w_ocglbillen_r
integer y = 244
integer width = 3744
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocglbillen_r
integer x = 2921
integer width = 850
integer height = 220
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocglbillen_r
integer x = 50
integer y = 180
integer width = 87
integer height = 68
integer taborder = 10
string dataobject = "d_ocglbillen_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::editchanged;call super::editchanged;datawindowchild ldwc_draft
string ls_data
long ll_found,ll_row
int li_line

this.getchild("draft", ldwc_draft)
ldwc_draft.settransobject(sqlca)

choose case dwo.name
	case 'draft'
		 ls_data = data + '%'
		 ll_row = ldwc_draft.RowCount( )
		 ll_found = ldwc_draft.Find("draft like '" + ls_data + "'", 1, ll_row)
		 li_line = integer(this.Describe("draft.dddw.Line"))
		 if ll_found > li_line then
			 ll_found = ll_found + li_line
			 if ll_found > ll_row then ll_found = ll_row
		 end if
		 ldwc_draft.scrolltorow(ll_found)
end choose

RETURN 0
end event

event dw_2::itemchanged;call super::itemchanged;this.accepttext()
dw_1.retrieve(this.getitemstring(this.getrow(), "draft"))


end event

type st_1 from statictext within w_ocglbillen_r
integer x = 69
integer y = 308
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

type ddlb_fld from dropdownlistbox within w_ocglbillen_r
integer x = 256
integer y = 292
integer width = 443
integer height = 632
integer taborder = 100
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

type ddlb_dwtitles from dropdownlistbox within w_ocglbillen_r
integer x = 288
integer y = 304
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

type st_2 from statictext within w_ocglbillen_r
integer x = 727
integer y = 308
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

type sle_value from singlelineedit within w_ocglbillen_r
integer x = 1216
integer y = 300
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

type cb_1 from commandbutton within w_ocglbillen_r
integer x = 1787
integer y = 300
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

type cb_2 from commandbutton within w_ocglbillen_r
integer x = 1952
integer y = 300
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

arg_dw = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_ocglbillen_r
integer x = 2117
integer y = 300
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_ocglbillen_r
integer x = 2281
integer y = 300
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_ocglbillen_r
event mousemove pbm_mousemove
integer x = 3337
integer y = 60
integer width = 187
integer height = 144
integer taborder = 50
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

type ddlb_op from dropdownlistbox within w_ocglbillen_r
integer x = 905
integer y = 292
integer width = 302
integer height = 500
integer taborder = 120
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

