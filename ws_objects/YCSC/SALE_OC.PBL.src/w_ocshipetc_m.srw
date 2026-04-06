$PBExportHeader$w_ocshipetc_m.srw
$PBExportComments$운반비 기타관리(2002/12/11,이인호)
forward
global type w_ocshipetc_m from w_inheritance
end type
type em_1 from editmask within w_ocshipetc_m
end type
type em_2 from editmask within w_ocshipetc_m
end type
type rb_1 from radiobutton within w_ocshipetc_m
end type
type rb_2 from radiobutton within w_ocshipetc_m
end type
type rb_3 from radiobutton within w_ocshipetc_m
end type
type dw_area from datawindow within w_ocshipetc_m
end type
type st_2 from statictext within w_ocshipetc_m
end type
type dw_3 from dw_2 within w_ocshipetc_m
end type
type cbx_1 from checkbox within w_ocshipetc_m
end type
type st_1 from statictext within w_ocshipetc_m
end type
type st_3 from statictext within w_ocshipetc_m
end type
type gb_4 from groupbox within w_ocshipetc_m
end type
end forward

global type w_ocshipetc_m from w_inheritance
integer width = 4507
integer height = 2172
string title = "운반비 기타관리(w_ocshipetc_m)"
em_1 em_1
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_area dw_area
st_2 st_2
dw_3 dw_3
cbx_1 cbx_1
st_1 st_1
st_3 st_3
gb_4 gb_4
end type
global w_ocshipetc_m w_ocshipetc_m

type variables
st_print i_print
gs_itembaldo_str  ist_code
string is_oc = 'O', is_scenesql
datawindowchild idwc_car, idwc_scene, idwc_cust
datawindowchild idwc_area

end variables

on w_ocshipetc_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_area=create dw_area
this.st_2=create st_2
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.st_1=create st_1
this.st_3=create st_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.dw_3
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.gb_4
end on

on w_ocshipetc_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_area)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_3.visible = false

dw_3.settransobject(sqlca)
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild('area',idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1,'area_no','%')
idwc_area.setitem(1,'area_name','전체')
dw_area.object.area[1] = gs_area

dw_area.accepttext()
dw_1.getchild("driver", idwc_car)

em_1.text = string(today(), "yyyy/mm/01")
em_2.text = string(today(), "yyyy/mm/dd")

dw_1.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(0)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_1.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)

//if gs_userid = '1999010s' or gs_userid = 'root' then
//	dw_area.enabled = true
//else
//	dw_area.enabled = false
//end if
end event

event resize;call super::resize;dw_1.width  = this.width  - 82
dw_1.height = this.height - 540

end event

type pb_save from w_inheritance`pb_save within w_ocshipetc_m
event ue_print pbm_custom01
integer x = 4014
integer y = 60
integer taborder = 70
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_ocshipetc_m
integer x = 41
integer y = 436
integer width = 4379
integer height = 1584
integer taborder = 30
string dataobject = "d_ocshipetc_m"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;string ls_where, ls_sql, ls_data, ls_cust, ls_scene, ls_desc, ls_sale
string ls_cargo_name, ls_drv_name, ls_driver, ls_shipamt_case, ls_ship_flag
long ll_found, ll_ship_amount

ll_found = 0
choose case dwo.name
	case 'driver'
		this.object.drv_name[row] = idwc_car.getitemstring(idwc_car.getrow(),'name')
		this.object.cargo_name[row] = idwc_car.getitemstring(idwc_car.getrow(),'cargo_name')

	case 'etc_flag'
		if data = 'Y' then
			messagebox("확인","결재완료를 선택하실수는 없습니다")
			return 1
		end if
	case 'sale_no', 'do_no'
		ls_data = data
		setnull(ls_cust)
		setnull(ls_scene)
		this.object.cust_no[row] = ls_cust
		this.object.scene_code[row] = ls_scene
		if dwo.name = 'do_no' then
			select cust_no, spot_code, docar.cargo_name, docar.name, docar.driver, 
					 ship_amount, shipamt_case, ship_flag 
			  into :ls_cust, :ls_scene, :ls_cargo_name, :ls_drv_name, :ls_driver, 
			  		:ll_ship_amount, :ls_shipamt_case, :ls_ship_flag 
			  FROM do LEFT OUTER JOIN docar ON do.driver = docar.driver
			 WHERE do_no = :ls_data;
				 
			select top 1 sale_no into :ls_sale from dodet
			 where do_no = :ls_data order by oi_no ;
			 
			this.object.sale_no[row] = ls_sale
			this.object.cargo_name[row] = ls_cargo_name
			this.object.drv_name[row] = ls_drv_name
			this.object.driver[row] = ls_driver
			this.object.ship_amount[row] = ll_ship_amount
			this.object.shipamt_case[row] = ls_shipamt_case
			this.object.ship_flag[row] = ls_ship_flag
//			cargo_name, drv_name, driver, ship_amount, shipamt_case, ship_flag
			
		else
			select cust_no, scene_code into :ls_cust, :ls_scene from sale
			 where order_no = :ls_data;
		end if
		if isnull(ls_cust) then
			messagebox("확인","존재하지 않는 번호입니다!",exclamation!)
			return 1
		end if
		this.setredraw(false)
		this.object.cust_no[row] = ls_cust
		this.object.scene_code[row] = ls_scene

		select scene_desc into :ls_desc from scene
		 where scene_code = :ls_scene;
		this.object.scene_desc[row] = ls_desc

		this.setredraw(true)
		ls_where = "WHERE scene.cust_no = ~~'" + ls_cust + "~~'"
		ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

		dw_1.getchild("scene_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		idwc_scene.modify(ls_sql)
		if idwc_scene.retrieve() > 0 then
			this.object.protect[row] = 'N'
		else
			this.object.protect[row] = 'Y'
		end if

	case 'cust_no'
		ls_data = data
		setnull(ls_scene)
		this.object.scene_code[row] = ls_scene
		this.object.scene_desc[row] = ls_scene
		select count(*) into :ll_found from customer
		 where cust_no = :ls_data;
		if ll_found = 0 then
			messagebox("확인","위와 같은고객이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		ls_where = "WHERE scene.cust_no = ~~'" + ls_data + "~~'"
		ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
		
		dw_1.getchild("scene_code", idwc_scene)
		idwc_scene.settransobject(sqlca)
		idwc_scene.modify(ls_sql)
		if idwc_scene.retrieve() > 0 then
			this.object.protect[row] = 'N'
		else
			this.object.protect[row] = 'Y'
		end if

	case 'scene_code'
		ls_data = data
		select count(*) into :ll_found from scene
		 where scene_code = :ls_data;
		if ll_found = 0 then
			messagebox("확인","위와 같은현장은 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select scene_desc into :ls_desc from scene
		 where scene_code = :ls_data;
		this.object.scene_desc[row] = ls_desc
end choose

end event

event dw_1::itemerror;string ls_null
setnull(ls_null)
CHOOSE CASE dwo.name
	CASE 'etc_flag'
		this.object.etc_flag[row] = 'O'
	CASE 'cust_no'
		this.object.cust_no[row] = ls_null
	CASE 'scene_code'
		this.object.scene_code[row] = ls_null
END CHOOSE
return 2
end event

event dw_1::clicked;call super::clicked;if row < 1 then return
if cbx_1.checked = true then
	this.SelectRow(row, NOT this.IsSelected(row))
end if
end event

type dw_2 from w_inheritance`dw_2 within w_ocshipetc_m
integer x = 969
integer y = 20
integer width = 82
integer height = 72
string dataobject = "d_ocshipetc_r"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_ocshipetc_m
integer x = 55
integer y = 32
integer width = 1115
integer height = 136
string text = "운반비 기타관리"
end type

type st_tips from w_inheritance`st_tips within w_ocshipetc_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocshipetc_m
boolean visible = false
integer x = 3314
integer y = 1036
integer taborder = 90
string picturename = "c:\bmp\delete.bmp"
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocshipetc_m
integer x = 3986
integer y = 276
integer width = 407
integer height = 124
integer taborder = 60
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택출력"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;call super::clicked;w_repsuper w_print
st_print l_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
if cbx_1.checked = false and dw_1.rowcount() < 1 then return

long ll_row, ll_cnt
long li_ret[]

ll_cnt = 0
for ll_row = 1 to dw_1.rowcount()
	if dw_1.IsSelected(ll_row) then
		ll_cnt = ll_cnt + 1
		li_ret[ll_cnt] = dw_1.object.etc_serial[ll_row]
	end if
next
if ll_cnt = 0 then
	for ll_row = 1 to dw_1.rowcount()
		li_ret[ll_row] = dw_1.object.etc_serial[ll_row]
	next
end if
dw_3.retrieve(li_ret[])

l_print.st_datawindow = dw_3
l_print.st_print_desc = " 이 프로그램은 운반비 변경요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_close from w_inheritance`pb_close within w_ocshipetc_m
integer x = 4206
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocshipetc_m
integer x = 3438
integer y = 60
integer taborder = 110
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
 
if dw_1.getrow() < 1 then
	return
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_2.retrieve(dw_1.object.etc_serial[dw_1.getrow()])

l_print.st_datawindow = dw_2
l_print.st_print_desc = " 이 프로그램은 운반비 변경요청서를 출력합니다." 
l_print.st_print_sheet = " 프린트용지 : A4"
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
	                   'Datawindow.Zoom=100'

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4, 13-B5 182 x 257 mm

opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocshipetc_m
boolean visible = false
integer x = 2510
integer y = 48
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocshipetc_m
integer x = 3822
integer y = 60
integer taborder = 130
end type

event pb_delete::clicked;string ls_flag

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_flag = dw_1.object.etc_flag[dw_1.getrow()]
if trim(ls_flag) = 'Y' then
	messagebox("확인","이미 결재가 되었습니다. 결재 취소추 삭제가 가능합니다.")
	return
end if
dw_1.deleterow(0)

end event

type pb_insert from w_inheritance`pb_insert within w_ocshipetc_m
integer x = 3630
integer y = 60
string text = " "
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;long   ll_row, ll_dw4row
string ls_area

ll_row  = dw_1.insertrow(0)
dw_1.object.etc_date[ll_row] = wf_today()

ls_area = dw_area.object.area[1]
if ls_area = '%' then setnull(ls_area)

dw_1.object.etc_area[ll_row] = ls_area
dw_1.object.user_id[ll_row]  = gs_userid

dw_1.object.etc_flag[ll_row] = "O"


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ocshipetc_m
integer x = 3246
integer y = 60
integer taborder = 40
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

date  ld_start_date, ld_end_date
string ls_area
 
dw_1.setredraw(false)
dw_1.reset()
ld_start_date = date(em_1.text)
ld_end_date   = date(em_2.text)
ls_area = dw_area.object.area[1]

dw_1.retrieve(ld_start_date,ld_end_date,is_oc,ls_area)
dw_1.setredraw(true)


end event

type gb_3 from w_inheritance`gb_3 within w_ocshipetc_m
integer x = 41
integer y = 236
integer width = 4379
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_ocshipetc_m
integer x = 2647
integer y = 16
integer width = 549
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 16711680
end type

type gb_1 from w_inheritance`gb_1 within w_ocshipetc_m
integer x = 3218
integer y = 16
integer width = 1202
integer height = 216
integer taborder = 80
integer weight = 400
end type

type em_1 from editmask within w_ocshipetc_m
integer x = 1847
integer y = 136
integer width = 366
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type em_2 from editmask within w_ocshipetc_m
integer x = 2231
integer y = 136
integer width = 366
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type rb_1 from radiobutton within w_ocshipetc_m
integer x = 2930
integer y = 72
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미결"
boolean checked = true
end type

event clicked;dw_1.reset()
pb_insert.enabled = true
pb_save.enabled = true
pb_delete.enabled = true
is_oc = 'O'

end event

type rb_2 from radiobutton within w_ocshipetc_m
integer x = 2930
integer y = 140
integer width = 247
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "기결"
end type

event clicked;dw_1.reset()
pb_insert.enabled = false
pb_save.enabled = false
pb_delete.enabled = false
is_oc = 'Y'
end event

type rb_3 from radiobutton within w_ocshipetc_m
integer x = 2693
integer y = 72
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전결"
end type

event clicked;dw_1.reset()
pb_insert.enabled = true
pb_save.enabled = true
pb_delete.enabled = true
is_oc = 'A'
end event

type dw_area from datawindow within w_ocshipetc_m
integer x = 1303
integer y = 136
integer width = 526
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
this.accepttext()

dw_1.reset()
pb_retrieve.setfocus()

end event

type st_2 from statictext within w_ocshipetc_m
integer x = 1847
integer y = 52
integer width = 750
integer height = 84
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
string text = "조회일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from dw_2 within w_ocshipetc_m
integer x = 1070
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_ocshipetc_r2"
end type

type cbx_1 from checkbox within w_ocshipetc_m
integer x = 3753
integer y = 312
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "선택"
end type

event clicked;//
if this.checked = false then dw_1.SelectRow(0,false)

end event

type st_1 from statictext within w_ocshipetc_m
integer x = 1303
integer y = 52
integer width = 526
integer height = 84
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
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocshipetc_m
integer x = 46
integer y = 196
integer width = 494
integer height = 48
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79741120
string text = "운반비_마감관리"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_ocshipetc_m
integer x = 1271
integer y = 16
integer width = 1362
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

