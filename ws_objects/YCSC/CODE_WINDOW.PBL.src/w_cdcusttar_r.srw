$PBExportHeader$w_cdcusttar_r.srw
$PBExportComments$매출,수금 목표관리현황
forward
global type w_cdcusttar_r from w_inheritance
end type
type em_1 from editmask within w_cdcusttar_r
end type
type st_1 from statictext within w_cdcusttar_r
end type
type dw_3 from datawindow within w_cdcusttar_r
end type
type st_2 from statictext within w_cdcusttar_r
end type
end forward

global type w_cdcusttar_r from w_inheritance
integer width = 4690
integer height = 2880
string title = "거래처별 목표관리 현황(w_cdcusttar_r)"
em_1 em_1
st_1 st_1
dw_3 dw_3
st_2 st_2
end type
global w_cdcusttar_r w_cdcusttar_r

type variables
datawindowchild idwc_user
end variables

on w_cdcusttar_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_3=create dw_3
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_2
end on

on w_cdcusttar_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.st_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_date, ls_mon, ls_sale_id
long   ll_year, ll_mon

em_1.text = string(today(),'yyyy/mm')
ls_date   = em_1.text
ls_mon    = RightA(em_1.text,2)
ll_year   = long(LeftA(ls_date, 4))
ll_mon    = long(LeftA(ls_mon, 2))


dw_2.visible = false
dw_1.sharedata(dw_2)

dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_3.getchild('user',idwc_user)

idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
dw_3.object.user[1] = '%'
dw_3.enabled = true

idwc_user.accepttext()

end event

event resize;call super::resize;dw_1.width  = this.width - 120
dw_1.height = this.height - 420

end event

type pb_save from w_inheritance`pb_save within w_cdcusttar_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_cdcusttar_r
integer x = 41
integer y = 272
integer width = 4549
integer height = 2460
integer taborder = 60
string dataobject = "d_cust_aim2_r"
boolean resizable = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::resize;call super::resize;gb_2.width = dw_1.width + 35
gb_2.height = dw_1.height + 50

end event

type dw_2 from w_inheritance`dw_2 within w_cdcusttar_r
integer x = 1824
integer y = 32
integer width = 114
integer height = 88
integer taborder = 0
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cdcusttar_r
integer y = 52
integer width = 1742
string text = "거래처별 목표관리 현황"
end type

type st_tips from w_inheritance`st_tips within w_cdcusttar_r
end type

type pb_compute from w_inheritance`pb_compute within w_cdcusttar_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdcusttar_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_cdcusttar_r
integer x = 4407
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdcusttar_r
integer x = 4215
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;string ls_Docname, ls_Named, ls_ExpandName
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

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdcusttar_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_cdcusttar_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_cdcusttar_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdcusttar_r
integer x = 4009
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_date, ls_year, ls_month, ls_colx
long   ll_year, ll_mon

st_security lst_security

dw_1.reset()
dw_2.reset()
dw_3.AcceptText()

if em_1.text = '' then
	messagebox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_date  = em_1.text
ls_year  = LeftA(ls_date, 4)
ls_month = RightA(ls_date, 2)
ll_year  = long(LeftA(ls_date, 4))
ll_mon   = long(RightA(ls_date,2))

string ls_level_userid

choose case gs_level
	case "A", "B"
		ls_level_userid = dw_3.object.user[1]
	case 'C'
		ls_level_userid = gs_userid
		dw_3.enabled    = false
end choose

dw_1.setredraw(false)
dw_1.object.cust_aim_tar_year.visible = false
dw_1.object.inv_01.visible = false
dw_1.object.inv_02.visible = false
dw_1.object.inv_03.visible = false
dw_1.object.inv_04.visible = false
dw_1.object.inv_05.visible = false
dw_1.object.inv_06.visible = false
dw_1.object.inv_07.visible = false
dw_1.object.inv_08.visible = false
dw_1.object.inv_09.visible = false
dw_1.object.inv_10.visible = false
dw_1.object.inv_11.visible = false
dw_1.object.inv_12.visible = false
dw_1.object.cust_aim_mod_01.visible = false
dw_1.object.cust_aim_mod_02.visible = false
dw_1.object.cust_aim_mod_03.visible = false
dw_1.object.cust_aim_mod_04.visible = false
dw_1.object.cust_aim_mod_05.visible = false
dw_1.object.cust_aim_mod_06.visible = false
dw_1.object.cust_aim_mod_07.visible = false
dw_1.object.cust_aim_mod_08.visible = false
dw_1.object.cust_aim_mod_09.visible = false
dw_1.object.cust_aim_mod_10.visible = false
dw_1.object.cust_aim_mod_11.visible = false
dw_1.object.cust_aim_mod_12.visible = false
dw_1.object.opeom_inv_01.visible = false
dw_1.object.opeom_inv_02.visible = false
dw_1.object.opeom_inv_03.visible = false
dw_1.object.opeom_inv_04.visible = false
dw_1.object.opeom_inv_05.visible = false
dw_1.object.opeom_inv_06.visible = false
dw_1.object.opeom_inv_07.visible = false
dw_1.object.opeom_inv_08.visible = false
dw_1.object.opeom_inv_09.visible = false
dw_1.object.opeom_inv_10.visible = false
dw_1.object.opeom_inv_11.visible = false
dw_1.object.opeom_inv_12.visible = false
dw_1.object.com_inv_1.visible = false
dw_1.object.com_inv_2.visible = false
dw_1.object.com_inv_3.visible = false
dw_1.object.com_inv_4.visible = false
dw_1.object.com_inv_5.visible = false
dw_1.object.com_inv_6.visible = false
dw_1.object.com_inv_7.visible = false
dw_1.object.com_inv_8.visible = false
dw_1.object.com_inv_9.visible = false
dw_1.object.com_inv_10.visible = false
dw_1.object.com_inv_11.visible = false
dw_1.object.com_inv_12.visible = false

dw_1.object.coll_01.visible = false
dw_1.object.coll_02.visible = false
dw_1.object.coll_03.visible = false
dw_1.object.coll_04.visible = false
dw_1.object.coll_05.visible = false
dw_1.object.coll_06.visible = false
dw_1.object.coll_07.visible = false
dw_1.object.coll_08.visible = false
dw_1.object.coll_09.visible = false
dw_1.object.coll_10.visible = false
dw_1.object.coll_11.visible = false
dw_1.object.coll_12.visible = false
dw_1.object.cust_aim_del_01.visible = false
dw_1.object.cust_aim_del_02.visible = false
dw_1.object.cust_aim_del_03.visible = false
dw_1.object.cust_aim_del_04.visible = false
dw_1.object.cust_aim_del_05.visible = false
dw_1.object.cust_aim_del_06.visible = false
dw_1.object.cust_aim_del_07.visible = false
dw_1.object.cust_aim_del_08.visible = false
dw_1.object.cust_aim_del_09.visible = false
dw_1.object.cust_aim_del_10.visible = false
dw_1.object.cust_aim_del_11.visible = false
dw_1.object.cust_aim_del_12.visible = false
dw_1.object.opeom_coll_01.visible = false
dw_1.object.opeom_coll_02.visible = false
dw_1.object.opeom_coll_03.visible = false
dw_1.object.opeom_coll_04.visible = false
dw_1.object.opeom_coll_05.visible = false
dw_1.object.opeom_coll_06.visible = false
dw_1.object.opeom_coll_07.visible = false
dw_1.object.opeom_coll_08.visible = false
dw_1.object.opeom_coll_09.visible = false
dw_1.object.opeom_coll_10.visible = false
dw_1.object.opeom_coll_11.visible = false
dw_1.object.opeom_coll_12.visible = false
dw_1.object.com_coll_1.visible = false
dw_1.object.com_coll_2.visible = false
dw_1.object.com_coll_3.visible = false
dw_1.object.com_coll_4.visible = false
dw_1.object.com_coll_5.visible = false
dw_1.object.com_coll_6.visible = false
dw_1.object.com_coll_7.visible = false
dw_1.object.com_coll_8.visible = false
dw_1.object.com_coll_9.visible = false
dw_1.object.com_coll_10.visible = false
dw_1.object.com_coll_11.visible = false
dw_1.object.com_coll_12.visible = false
dw_1.object.opeom_balbf_amount.visible = false
dw_1.object.bal_1.visible = false
dw_1.object.bal_2.visible = false
dw_1.object.bal_3.visible = false
dw_1.object.bal_4.visible = false
dw_1.object.bal_5.visible = false
dw_1.object.bal_6.visible = false
dw_1.object.bal_7.visible = false
dw_1.object.bal_8.visible = false
dw_1.object.bal_9.visible = false
dw_1.object.bal_10.visible = false
dw_1.object.bal_11.visible = false
dw_1.object.bal_12.visible = false

choose case ll_mon
	case 1
		dw_1.object.inv_01.visible = true
		dw_1.object.cust_aim_mod_01.visible = true
		dw_1.object.opeom_inv_01.visible = true
		dw_1.object.com_inv_1.visible = true
		dw_1.object.coll_01.visible = true
		dw_1.object.cust_aim_del_01.visible = true
		dw_1.object.opeom_coll_01.visible = true
		dw_1.object.com_coll_1.visible = true
		dw_1.object.bal_1.visible = true
	case 2
		dw_1.object.inv_02.visible = true
		dw_1.object.cust_aim_mod_02.visible = true
		dw_1.object.opeom_inv_02.visible = true
		dw_1.object.com_inv_2.visible = true
		dw_1.object.coll_02.visible = true
		dw_1.object.cust_aim_del_02.visible = true
		dw_1.object.opeom_coll_02.visible = true
		dw_1.object.com_coll_2.visible = true
		dw_1.object.bal_2.visible = true
	case 3
		dw_1.object.inv_03.visible = true
		dw_1.object.cust_aim_mod_03.visible = true
		dw_1.object.opeom_inv_03.visible = true
		dw_1.object.com_inv_3.visible = true
		dw_1.object.coll_03.visible = true
		dw_1.object.cust_aim_del_03.visible = true
		dw_1.object.opeom_coll_03.visible = true
		dw_1.object.com_coll_3.visible = true
		dw_1.object.bal_3.visible = true
	case 4
		dw_1.object.inv_04.visible = true
		dw_1.object.cust_aim_mod_04.visible = true
		dw_1.object.opeom_inv_04.visible = true
		dw_1.object.com_inv_4.visible = true
		dw_1.object.coll_04.visible = true
		dw_1.object.cust_aim_del_04.visible = true
		dw_1.object.opeom_coll_04.visible = true
		dw_1.object.com_coll_4.visible = true
		dw_1.object.bal_4.visible = true
	case 5
		dw_1.object.inv_05.visible = true
		dw_1.object.cust_aim_mod_05.visible = true
		dw_1.object.opeom_inv_05.visible = true
		dw_1.object.com_inv_5.visible = true
		dw_1.object.coll_05.visible = true
		dw_1.object.cust_aim_del_05.visible = true
		dw_1.object.opeom_coll_05.visible = true
		dw_1.object.com_coll_5.visible = true
		dw_1.object.bal_5.visible = true
	case 6
		dw_1.object.inv_06.visible = true
		dw_1.object.cust_aim_mod_06.visible = true
		dw_1.object.opeom_inv_06.visible = true
		dw_1.object.com_inv_6.visible = true
		dw_1.object.coll_06.visible = true
		dw_1.object.cust_aim_del_06.visible = true
		dw_1.object.opeom_coll_06.visible = true
		dw_1.object.com_coll_6.visible = true
		dw_1.object.bal_6.visible = true
	case 7
		dw_1.object.inv_07.visible = true
		dw_1.object.cust_aim_mod_07.visible = true
		dw_1.object.opeom_inv_07.visible = true
		dw_1.object.com_inv_7.visible = true
		dw_1.object.coll_07.visible = true
		dw_1.object.cust_aim_del_07.visible = true
		dw_1.object.opeom_coll_07.visible = true
		dw_1.object.com_coll_7.visible = true
		dw_1.object.bal_7.visible = true
	case 8
		dw_1.object.inv_08.visible = true
		dw_1.object.cust_aim_mod_08.visible = true
		dw_1.object.opeom_inv_08.visible = true
		dw_1.object.com_inv_8.visible = true
		dw_1.object.coll_08.visible = true
		dw_1.object.cust_aim_del_08.visible = true
		dw_1.object.opeom_coll_08.visible = true
		dw_1.object.com_coll_8.visible = true
		dw_1.object.bal_8.visible = true
	case 9
		dw_1.object.inv_09.visible = true
		dw_1.object.cust_aim_mod_09.visible = true
		dw_1.object.opeom_inv_09.visible = true
		dw_1.object.com_inv_9.visible = true
		dw_1.object.coll_09.visible = true
		dw_1.object.cust_aim_del_09.visible = true
		dw_1.object.opeom_coll_09.visible = true
		dw_1.object.com_coll_9.visible = true
		dw_1.object.bal_9.visible = true
	case 10
		dw_1.object.inv_10.visible = true
		dw_1.object.cust_aim_mod_10.visible = true
		dw_1.object.opeom_inv_10.visible = true
		dw_1.object.com_inv_10.visible = true
		dw_1.object.coll_10.visible = true
		dw_1.object.cust_aim_del_10.visible = true
		dw_1.object.opeom_coll_10.visible = true
		dw_1.object.com_coll_10.visible = true
		dw_1.object.bal_10.visible = true
	case 11
		dw_1.object.inv_11.visible = true
		dw_1.object.cust_aim_mod_11.visible = true
		dw_1.object.opeom_inv_11.visible = true
		dw_1.object.com_inv_11.visible = true
		dw_1.object.coll_11.visible = true
		dw_1.object.cust_aim_del_11.visible = true
		dw_1.object.opeom_coll_11.visible = true
		dw_1.object.com_coll_11.visible = true
		dw_1.object.bal_11.visible = true
	case 12
		dw_1.object.inv_12.visible = true
		dw_1.object.cust_aim_mod_12.visible = true
		dw_1.object.opeom_inv_12.visible = true
		dw_1.object.com_inv_12.visible = true
		dw_1.object.coll_12.visible = true
		dw_1.object.cust_aim_del_12.visible = true
		dw_1.object.opeom_coll_12.visible = true
		dw_1.object.com_coll_12.visible = true
		dw_1.object.bal_12.visible = true		
end choose
dw_1.setredraw(true)

dw_1.retrieve(ls_level_userid, ll_year)

ls_colx = dw_1.object.inv_01.x
dw_1.object.datawindow.horizontalscrollsplit= ls_colx
	
end event

type gb_3 from w_inheritance`gb_3 within w_cdcusttar_r
integer x = 2912
integer y = 12
integer width = 1051
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdcusttar_r
integer x = 18
integer y = 224
integer width = 4603
integer height = 2528
integer taborder = 0
end type

type gb_1 from w_inheritance`gb_1 within w_cdcusttar_r
integer x = 3973
integer width = 649
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_cdcusttar_r
integer x = 2944
integer y = 124
integer width = 311
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
string displaydata = "T"
end type

type st_1 from statictext within w_cdcusttar_r
integer x = 2944
integer y = 48
integer width = 311
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "해당 년월"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdcusttar_r
integer x = 3264
integer y = 124
integer width = 663
integer height = 76
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_cdcusttar_r
integer x = 3264
integer y = 48
integer width = 663
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

