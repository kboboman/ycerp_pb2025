$PBExportHeader$w_ipcoilclass_m.srw
$PBExportComments$코일 등급/특기 관리(2001/05/22,이인호)
forward
global type w_ipcoilclass_m from w_inheritance
end type
type em_1 from editmask within w_ipcoilclass_m
end type
type em_2 from editmask within w_ipcoilclass_m
end type
type st_2 from statictext within w_ipcoilclass_m
end type
end forward

global type w_ipcoilclass_m from w_inheritance
integer width = 4590
integer height = 2796
string title = "코일 등급/특기 관리(w_ipcoilclass_m)"
em_1 em_1
em_2 em_2
st_2 st_2
end type
global w_ipcoilclass_m w_ipcoilclass_m

type variables
st_print  i_print
date id_start, id_end
end variables

on w_ipcoilclass_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.st_2
end on

on w_ipcoilclass_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

datawindowchild ldwc_loc, ldwc_item

em_1.text = string(today(),'yyyy/mm/dd')
em_2.text = string(today(),'yyyy/mm/dd')
id_start  = date(em_1.text)
id_end    = date(em_2.text)

dw_2.insertrow(0)
dw_2.getchild('loc_no',ldwc_loc)
ldwc_loc.insertrow(1)
ldwc_loc.setitem(1,'loc_no','%')
ldwc_loc.setitem(1,'loc_name','전체')
ldwc_loc.accepttext()

dw_2.getchild('item_no',ldwc_item)
ldwc_item.insertrow(1)
ldwc_item.setitem(1,'item_no','%')
ldwc_item.setitem(1,'item_name','전체')
ldwc_item.accepttext()

end event

event resize;call super::resize;//
gb_2.width  = this.width  - 128
gb_2.height = this.height - 360

dw_1.width  = this.width  - 192
dw_1.height = this.height - 544


end event

type pb_save from w_inheritance`pb_save within w_ipcoilclass_m
integer x = 4064
integer y = 60
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_ipcoilclass_m
integer x = 73
integer y = 384
integer width = 4398
integer height = 2252
integer taborder = 60
string dataobject = "d_ipcoilclass_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_ipcoilclass_m
integer x = 73
integer y = 284
integer width = 2757
integer height = 84
integer taborder = 70
string dataobject = "d_iocoilqoh_s"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;string  ls_flag
dw_2.accepttext()

if dwo.name <> 'flag' then return

if trim(dw_2.object.flag[1]) = 'W' then
	em_1.visible = true
	em_2.visible = true
	st_2.visible = true
else
	em_1.visible = false
	em_2.visible = false
	st_2.visible = false
end if


end event

type st_title from w_inheritance`st_title within w_ipcoilclass_m
integer x = 41
integer y = 44
integer width = 1312
integer height = 144
string text = "코일 등급/특기 관리"
end type

type st_tips from w_inheritance`st_tips within w_ipcoilclass_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipcoilclass_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_ipcoilclass_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipcoilclass_m
integer x = 4274
integer y = 60
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipcoilclass_m
integer x = 3867
integer y = 60
integer taborder = 120
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print

dw_2.retrieve()
i_print.st_datawindow  = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc  = " 이 프로그램은 코일등급 내역을 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=120'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ipcoilclass_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_ipcoilclass_m
boolean visible = false
integer x = 2747
integer y = 60
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_ipcoilclass_m
boolean visible = false
integer x = 2555
integer y = 60
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipcoilclass_m
integer x = 3671
integer y = 60
integer taborder = 150
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_loc, ls_item, ls_flag
dw_2.accepttext()

ls_loc  = trim(dw_2.object.loc_no[1])
ls_item = trim(dw_2.object.item_no[1])
ls_flag = trim(dw_2.object.flag[1])

if ls_flag = 'W' then
	if dw_1.retrieve(ls_loc, ls_item, ls_flag, id_start, id_end) < 1 then
		messagebox('확인','해당일자에는 자료가 없읍니다.',information!)
	end if
else
	if dw_1.retrieve(ls_loc, ls_item, ls_flag, id_start, id_end) < 1 then
		messagebox('확인','해당일자에는 자료가 없읍니다.',information!)
	end if
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ipcoilclass_m
boolean visible = false
integer x = 1627
integer y = 16
integer width = 1097
integer height = 204
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "입고일자"
end type

type gb_2 from w_inheritance`gb_2 within w_ipcoilclass_m
integer x = 41
integer width = 4462
integer height = 2436
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ipcoilclass_m
integer x = 3630
integer y = 16
integer width = 873
integer height = 208
integer textsize = -10
integer weight = 400
end type

type em_1 from editmask within w_ipcoilclass_m
integer x = 2926
integer y = 288
integer width = 366
integer height = 76
integer taborder = 40
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

event modified;	id_start = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_start = date(this.text)

end event

type em_2 from editmask within w_ipcoilclass_m
integer x = 3351
integer y = 288
integer width = 366
integer height = 76
integer taborder = 50
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

event modified;	id_end = date(this.text)

end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
id_end = date(this.text)

end event

type st_2 from statictext within w_ipcoilclass_m
integer x = 3301
integer y = 284
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

