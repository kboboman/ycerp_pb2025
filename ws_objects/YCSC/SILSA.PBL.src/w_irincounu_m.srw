$PBExportHeader$w_irincounu_m.srw
$PBExportComments$담당자별실사품목관리(2001/09/14,이대준)
forward
global type w_irincounu_m from w_inheritance
end type
type dw_3 from datawindow within w_irincounu_m
end type
type st_1 from statictext within w_irincounu_m
end type
type dw_5 from datawindow within w_irincounu_m
end type
type gb_4 from groupbox within w_irincounu_m
end type
end forward

global type w_irincounu_m from w_inheritance
integer width = 4197
integer height = 2168
string title = "담당자별 품목관리(w_irincounu_m)"
dw_3 dw_3
st_1 st_1
dw_5 dw_5
gb_4 gb_4
end type
global w_irincounu_m w_irincounu_m

type variables
st_print i_print
string is_where
datawindowchild idwc_item, idwc_qa
end variables

on w_irincounu_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_1=create st_1
this.dw_5=create dw_5
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.gb_4
end on

on w_irincounu_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_3.settransobject(sqlca)
dw_3.insertrow(1)
dw_5.settransobject(sqlca)
dw_5.insertrow(1)
dw_3.setitem(1,'user_id',gs_userid)

dw_1.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_1.getchild("qa", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_1.sharedata(dw_2)

end event

event resize;call super::resize;gb_2.width  = this.width  - 128
gb_2.height = this.height - 540

dw_1.width  = this.width  - 165
dw_1.height = this.height - 624


end event

type pb_save from w_inheritance`pb_save within w_irincounu_m
integer x = 3707
integer y = 48
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.accepttext()
if wf_nullchk(dw_1) = false then
	return
end if
wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_irincounu_m
integer y = 444
integer width = 4032
integer height = 1544
integer taborder = 60
string dataobject = "d_incounu_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;string ls_item_no, ls_qa,  ls_item_name, ls_data, ls_null
long ll_row, ll_found, ll_row1

this.accepttext()

ll_row = this.getrow()
ls_item_no = this.getitemstring(ll_row, "item_no")
ls_qa = this.getitemstring(ll_row, "qa")
setnull(ls_null)

choose case dwo.name
	

	case 'item_no'

		this.object.qa[ll_row] = ls_null
		this.object.qa.tabsequence = 0
		
		this.getchild("item_no", idwc_item)
		gs_ds_itemall.ShareData(idwc_item)
		
		ls_data = data
  	   ll_row1 = idwc_item.RowCount( )
		ll_found = idwc_item.Find("item_no = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			messagebox("확인","위와 같은 물품이 존재하지 않습니다!",exclamation!)
			return 1
		end if
		select item_name into :ls_item_name from groupitem 
		 where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
			return 1
		end if

		this.object.item_name[this.getrow()] = ls_item_name
		
		if ls_item_no <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
			idwc_qa.filter()
		
			if idwc_qa.rowcount() > 0 then
				this.object.qa.tabsequence = 1
//				this.object.qa.background.color = 1087434968
				this.setcolumn("qa")
				this.setfocus()
//			else
//				this.object.qa.tabsequence = 0
//				this.object.qa.background.color = 78682240
//				this.setcolumn("item_no")
//				this.setfocus()
			end if
		end if

end choose

end event

event dw_1::itemerror;string ls_null

setnull(ls_null)

CHOOSE CASE dwo.name
	CASE 'item_no'
		this.object.item_no[this.getrow()] = ls_null
END CHOOSE

return 2
end event

event dw_1::rowfocuschanging;string  ls_item_no

this.accepttext()
if this.getrow() < 1 then return

ls_item_no = this.object.item_no[this.getrow()]
if ls_item_no = '' or isnull(ls_item_no) then
	return
else
		idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
		idwc_qa.filter()
end if

end event

type dw_2 from w_inheritance`dw_2 within w_irincounu_m
integer x = 1559
integer y = 124
integer width = 73
integer height = 64
integer taborder = 80
string dataobject = "d_incounu_r"
end type

type st_title from w_inheritance`st_title within w_irincounu_m
integer x = 46
string text = "담당자별 품목관리"
end type

type st_tips from w_inheritance`st_tips within w_irincounu_m
end type

type pb_compute from w_inheritance`pb_compute within w_irincounu_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_irincounu_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_irincounu_m
integer x = 3899
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_irincounu_m
integer x = 3515
integer y = 48
integer taborder = 130
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then return 

w_repsuper w_print
i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 담당자별 품목관리를 출력합니다." 
//i_print.name = 'd_irincoun_r'
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_irincounu_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_irincounu_m
integer x = 3323
integer y = 48
integer taborder = 150
end type

event pb_delete::clicked;dw_1.accepttext()
if dw_1.getrow() < 1 then return

dw_1.deleterow(dw_1.getrow())
end event

type pb_insert from w_inheritance`pb_insert within w_irincounu_m
integer x = 3131
integer y = 48
integer taborder = 170
end type

event pb_insert::clicked;string ls_id,ls_loc
long ll_row, ll_cnt, ll_cnt2
gs_where2 lstr_where

dw_3.accepttext()
dw_5.accepttext()
ls_id = dw_3.object.user_id[1]
ls_loc = dw_5.object.loc_no[1]

if (isnull(ls_id) or ls_id='') or (isnull(ls_loc) or ls_loc='') then
	messagebox('알림','담당자와 저장소를 선택하십시오')
	return
end if

//=====검색======
dw_1.accepttext()
if dw_1.rowcount() < 1 then 
	dw_1.reset()
	dw_3.accepttext()
	ls_id = dw_3.object.user_id[1]
	dw_1.retrieve(ls_id, dw_5.object.loc_no[1])
end if
//===============

lstr_where.chk = 'M' //M:multi S:single
lstr_where.chk1 = ls_loc
openwithparm(w_whitemlocqohmulti_w3, lstr_where)
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return
dw_1.SETREDRAW(false)

//dw_2.accepttext()
//dw_1.accepttext()
for ll_row = 1 to UpperBound(lstr_where.str1)	
	SELECT  Count(*)
	  INTO  :ll_cnt2
	  FROM  incounu
	 WHERE  item_no  =  :lstr_where.str1[ll_row]
	   AND  qa       =  :lstr_where.str2[ll_row]
		AND  user_id  =  :ls_id;
	IF  ll_cnt2  <= 0  THEN
		ll_cnt = dw_1.insertrow(0)
		dw_1.object.item_no[ll_cnt] = trim(lstr_where.str1[ll_row])
		dw_1.object.qa[ll_cnt] = trim(lstr_where.str2[ll_row])
		dw_1.object.item_name[ll_cnt] = trim(lstr_where.name[ll_row])
		dw_1.object.user_id[ll_cnt] = ls_id
		dw_1.object.loc_no[ll_cnt] = ls_loc
	END IF
next

dw_1.scrolltorow(1)
dw_1.setsort('item_no, qa')
dw_1.sort()
dw_1.SETREDRAW(TRUE)


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_irincounu_m
integer x = 2939
integer y = 48
integer taborder = 160
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_id

dw_3.accepttext()
dw_5.accepttext()
dw_1.reset()
ls_id = dw_3.object.user_id[1]
dw_1.retrieve(ls_id, dw_5.object.loc_no[1])
end event

type gb_3 from w_inheritance`gb_3 within w_irincounu_m
boolean visible = false
integer x = 1536
integer y = 60
integer width = 123
integer height = 156
integer taborder = 90
end type

type gb_2 from w_inheritance`gb_2 within w_irincounu_m
integer x = 46
integer y = 392
integer width = 4069
integer height = 1628
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_irincounu_m
integer x = 2907
integer y = 8
integer width = 1207
end type

type dw_3 from datawindow within w_irincounu_m
integer x = 306
integer y = 288
integer width = 635
integer height = 92
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_userid_c2"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_irincounu_m
integer x = 82
integer y = 292
integer width = 219
integer height = 76
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
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_irincounu_m
integer x = 1074
integer y = 288
integer width = 878
integer height = 88
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type gb_4 from groupbox within w_irincounu_m
integer x = 46
integer y = 240
integer width = 4069
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

