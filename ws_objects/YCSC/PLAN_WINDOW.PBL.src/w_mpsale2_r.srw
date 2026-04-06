$PBExportHeader$w_mpsale2_r.srw
$PBExportComments$물품별 수주일보(집계)(1998/10/29,곽용덕)
forward
global type w_mpsale2_r from w_inheritance
end type
type em_1 from editmask within w_mpsale2_r
end type
type em_2 from editmask within w_mpsale2_r
end type
type gb_4 from groupbox within w_mpsale2_r
end type
end forward

global type w_mpsale2_r from w_inheritance
integer y = 112
integer width = 4690
integer height = 2412
string title = "물품별 수주일보(집계)(w_mpsale2_r)"
em_1 em_1
em_2 em_2
gb_4 gb_4
end type
global w_mpsale2_r w_mpsale2_r

type variables
date id_date1, id_date2
st_print i_print
string is_ret
end variables

on w_mpsale2_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.gb_4
end on

on w_mpsale2_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.gb_4)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_chk
select isnull(sale_price,'N') into :ls_chk from login
 where user_id = :gs_userid; 
if ls_chk = 'Y' Then
	is_ret = '%'
else
	is_ret = gs_userid
end if
this.x = 1
this.y = 1
dw_1.settransobject(sqlca)

em_1.text = string(today(),'yyyy/mm/dd')
id_date1 = today()

em_2.text = string(today(),'yyyy/mm/dd')
id_date2 = today()

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

end event

event resize;call super::resize;gb_2.width  = this.width  - 109
gb_2.height = this.height - 388

dw_1.width  = this.width  - 178
dw_1.height = this.height - 480

end event

type pb_save from w_inheritance`pb_save within w_mpsale2_r
boolean visible = false
integer x = 3017
integer y = 56
end type

type dw_1 from w_inheritance`dw_1 within w_mpsale2_r
integer y = 292
integer width = 4512
integer height = 1932
integer taborder = 80
string dataobject = "d_mpsale2_r"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;datawindowchild ldwc_item
this.accepttext()
choose case dwo.name
	case 'item_no'
        this.getchild('item_no',ldwc_item)
        this.object.bitem_item_name[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'item_name')
        this.object.team_code[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'team_code')
        this.object.rcpt_qty[row] = ldwc_item.getitemnumber(ldwc_item.getrow(),'qty')
		  this.object.uom[row] = ldwc_item.getitemstring(ldwc_item.getrow(),'uom')
		  this.object.in_date[row] = ldwc_item.getitemdatetime(ldwc_item.getrow(),'sys_date')
end choose
end event

type dw_2 from w_inheritance`dw_2 within w_mpsale2_r
boolean visible = false
integer x = 1760
integer y = 96
integer width = 174
integer height = 96
integer taborder = 90
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;datawindowchild ldwc_pur
string ls_pur
this.accepttext()
ls_pur = trim(this.object.pur_no[1])
dw_1.retrieve(ls_pur)
choose case dwo.name
	case 'pur_no'
        this.getchild('pur_no',ldwc_pur)
        this.object.sign_date[1] = ldwc_pur.getitemdatetime(ldwc_pur.getrow(),'sign_date')
end choose
end event

type st_title from w_inheritance`st_title within w_mpsale2_r
integer x = 32
integer width = 1710
string text = "물품별 수주일보(집계)"
end type

type st_tips from w_inheritance`st_tips within w_mpsale2_r
end type

type pb_compute from w_inheritance`pb_compute within w_mpsale2_r
boolean visible = false
integer x = 3008
integer taborder = 120
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpsale2_r
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpsale2_r
integer x = 4398
integer y = 56
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpsale2_r
integer x = 4201
integer y = 56
integer taborder = 140
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
string ls_pur

i_print.st_datawindow = dw_1
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품별 수주일보(집계)를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_mpsale2_r
boolean visible = false
integer taborder = 150
end type

type pb_delete from w_inheritance`pb_delete within w_mpsale2_r
boolean visible = false
integer x = 2825
integer y = 56
integer taborder = 160
end type

type pb_insert from w_inheritance`pb_insert within w_mpsale2_r
boolean visible = false
integer x = 2633
integer y = 56
integer taborder = 180
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpsale2_r
integer x = 4005
integer y = 56
integer taborder = 170
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date 

ls_date = trim(em_1.text)
if isdate(ls_date) = false then return
id_date1 = date(ls_date)

ls_date = trim(em_2.text)
if isdate(ls_date) = false then return

id_date2 = date(ls_date)
dw_1.retrieve(id_date1,id_date2, is_ret)

end event

type gb_3 from w_inheritance`gb_3 within w_mpsale2_r
integer x = 3090
integer y = 36
integer width = 846
integer height = 180
integer taborder = 100
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "수주기간"
end type

type gb_2 from w_inheritance`gb_2 within w_mpsale2_r
integer y = 232
integer width = 4581
integer height = 2024
integer taborder = 110
integer textsize = -10
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_mpsale2_r
integer x = 3982
integer y = 16
integer width = 631
integer taborder = 70
end type

type em_1 from editmask within w_mpsale2_r
integer x = 3145
integer y = 104
integer width = 357
integer height = 80
integer taborder = 70
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

type em_2 from editmask within w_mpsale2_r
integer x = 3525
integer y = 104
integer width = 357
integer height = 80
integer taborder = 80
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

type gb_4 from groupbox within w_mpsale2_r
boolean visible = false
integer x = 1851
integer y = 40
integer width = 133
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 12632256
end type

