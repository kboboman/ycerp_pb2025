$PBExportHeader$w_iplessjajae_r.srw
$PBExportComments$부족자재리스트(1998/03/17,곽용덕)
forward
global type w_iplessjajae_r from w_inheritance
end type
type pb_1 from picturebutton within w_iplessjajae_r
end type
end forward

global type w_iplessjajae_r from w_inheritance
integer width = 4695
integer height = 2896
string title = "부족자재 리스트(w_iplessjajae_r)"
pb_1 pb_1
end type
global w_iplessjajae_r w_iplessjajae_r

type variables
st_print i_print
end variables

on w_iplessjajae_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
end on

on w_iplessjajae_r.destroy
call super::destroy
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

end event

type pb_save from w_inheritance`pb_save within w_iplessjajae_r
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_iplessjajae_r
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
string dataobject = "d_iplessjajae_t"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_iplessjajae_r
boolean visible = false
integer x = 1563
integer y = 28
integer width = 178
integer height = 156
string dataobject = "d_iplessjajae_r"
end type

type st_title from w_inheritance`st_title within w_iplessjajae_r
integer x = 55
integer y = 72
integer width = 1189
integer height = 136
string text = "부족자재 리스트"
end type

type st_tips from w_inheritance`st_tips within w_iplessjajae_r
end type

type pb_compute from w_inheritance`pb_compute within w_iplessjajae_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_iplessjajae_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_iplessjajae_r
integer x = 4407
integer y = 56
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_iplessjajae_r
integer x = 4009
integer y = 56
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

dw_2.retrieve()
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 부족자재리스트를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=84'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_iplessjajae_r
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_iplessjajae_r
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_iplessjajae_r
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_iplessjajae_r
integer x = 3813
integer y = 56
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_colx

dw_1.retrieve()
ls_colx = dw_1.object.item_name.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx



end event

type gb_3 from w_inheritance`gb_3 within w_iplessjajae_r
boolean visible = false
integer x = 2130
integer y = 36
integer width = 91
integer height = 128
end type

type gb_2 from w_inheritance`gb_2 within w_iplessjajae_r
integer y = 344
integer width = 4590
integer height = 2424
end type

type gb_1 from w_inheritance`gb_1 within w_iplessjajae_r
integer x = 3776
integer y = 16
integer width = 846
end type

type pb_1 from picturebutton within w_iplessjajae_r
event mousemove pbm_mousemove
integer x = 4201
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

