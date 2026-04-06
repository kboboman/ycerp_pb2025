$PBExportHeader$w_oestand_aim_m.srw
$PBExportComments$거래처현장별 물량목표
forward
global type w_oestand_aim_m from w_inheritance
end type
type dw_3 from datawindow within w_oestand_aim_m
end type
type dw_5 from datawindow within w_oestand_aim_m
end type
type pb_1 from picturebutton within w_oestand_aim_m
end type
type pb_2 from picturebutton within w_oestand_aim_m
end type
type st_3 from statictext within w_oestand_aim_m
end type
type ddlb_fld from dropdownlistbox within w_oestand_aim_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oestand_aim_m
end type
type st_4 from statictext within w_oestand_aim_m
end type
type sle_value from singlelineedit within w_oestand_aim_m
end type
type cb_1 from commandbutton within w_oestand_aim_m
end type
type cb_2 from commandbutton within w_oestand_aim_m
end type
type cb_3 from commandbutton within w_oestand_aim_m
end type
type cb_5 from commandbutton within w_oestand_aim_m
end type
type st_2 from statictext within w_oestand_aim_m
end type
type dw_area from datawindow within w_oestand_aim_m
end type
type st_1 from statictext within w_oestand_aim_m
end type
type st_5 from statictext within w_oestand_aim_m
end type
type dw_4 from datawindow within w_oestand_aim_m
end type
type em_1 from editmask within w_oestand_aim_m
end type
type st_6 from statictext within w_oestand_aim_m
end type
type em_2 from editmask within w_oestand_aim_m
end type
type cbx_1 from checkbox within w_oestand_aim_m
end type
type em_3 from editmask within w_oestand_aim_m
end type
type st_7 from statictext within w_oestand_aim_m
end type
type st_8 from statictext within w_oestand_aim_m
end type
type cbx_2 from checkbox within w_oestand_aim_m
end type
type ddlb_op from dropdownlistbox within w_oestand_aim_m
end type
type gb_4 from groupbox within w_oestand_aim_m
end type
type gb_6 from groupbox within w_oestand_aim_m
end type
end forward

global type w_oestand_aim_m from w_inheritance
integer x = 5
integer y = 172
integer width = 4736
integer height = 2644
string title = "거래처현장별 물량목표(w_oestand_aim_m)"
dw_3 dw_3
dw_5 dw_5
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
dw_area dw_area
st_1 st_1
st_5 st_5
dw_4 dw_4
em_1 em_1
st_6 st_6
em_2 em_2
cbx_1 cbx_1
em_3 em_3
st_7 st_7
st_8 st_8
cbx_2 cbx_2
ddlb_op ddlb_op
gb_4 gb_4
gb_6 gb_6
end type
global w_oestand_aim_m w_oestand_aim_m

type variables
st_print i_print

datawindowchild idwc_item, idwc_qa
datawindowchild idwc_area, idwc_cust

string is_item_no, is_cust, is_area, id_date1, id_date2

end variables

forward prototypes
public function decimal wf_price (string as_item, string as_qa)
end prototypes

public function decimal wf_price (string as_item, string as_qa);//
decimal lr_price
	
SELECT price_a INTO :lr_price FROM item WHERE item_no = :as_item AND qa = :as_qa;		
return(lr_price)

	
	
end function

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

dw_5.visible = false
dw_3.SetTransObject(SQLCA)
dw_4.settransobject(sqlca)
dw_5.SetTransObject(SQLCA)

dw_3.getchild("item_no", idwc_item)
gs_ds_itemall.ShareData(idwc_item)

dw_3.getchild("qa_y", idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

if GF_PERMISSION("일위대가_관리", gs_userid) = "Y" then
else
// 20060619 전체관리로변경

//	pb_insert.visible = false
//	pb_delete.visible = false
//	pb_save.visible   = false
//	dw_3.object.item_no.TabSequence = 0
//	dw_3.object.qty.TabSequence     = 0
//	dw_3.object.amt_y.TabSequence   = 0
//	dw_3.object.rem.TabSequence     = 0
end if

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

idwc_area.setredraw(false)
dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", " ")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = " "

// 전체거래처
dw_4.settransobject(sqlca)
dw_4.insertrow(0)  

idwc_cust.setredraw(false)
dw_4.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")

dw_4.object.cust_no[1] = "N014" // (주)유창플러스
idwc_cust.accepttext()
idwc_cust.setredraw(false)
dw_4.object.cust_no.background.color = 78682240		// 1087434968
dw_4.enabled = false
idwc_cust.accepttext()
idwc_cust.setredraw(false)


pb_1.enabled = false
dw_2.enabled = false

em_3.enabled = false		// 적용물량
em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")

dw_2.object.sname.background.color = 78682240	// 1087434968
dw_2.object.use_flag_t.visible = false
dw_2.object.use_flag.visible   = false


end event

on w_oestand_aim_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_5=create dw_5
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
this.dw_area=create dw_area
this.st_1=create st_1
this.st_5=create st_5
this.dw_4=create dw_4
this.em_1=create em_1
this.st_6=create st_6
this.em_2=create em_2
this.cbx_1=create cbx_1
this.em_3=create em_3
this.st_7=create st_7
this.st_8=create st_8
this.cbx_2=create cbx_2
this.ddlb_op=create ddlb_op
this.gb_4=create gb_4
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_5
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_fld
this.Control[iCurrent+7]=this.ddlb_dwtitles
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.sle_value
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.dw_area
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.em_1
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.em_2
this.Control[iCurrent+22]=this.cbx_1
this.Control[iCurrent+23]=this.em_3
this.Control[iCurrent+24]=this.st_7
this.Control[iCurrent+25]=this.st_8
this.Control[iCurrent+26]=this.cbx_2
this.Control[iCurrent+27]=this.ddlb_op
this.Control[iCurrent+28]=this.gb_4
this.Control[iCurrent+29]=this.gb_6
end on

on w_oestand_aim_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_5)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.dw_4)
destroy(this.em_1)
destroy(this.st_6)
destroy(this.em_2)
destroy(this.cbx_1)
destroy(this.em_3)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.cbx_2)
destroy(this.ddlb_op)
destroy(this.gb_4)
destroy(this.gb_6)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.height = newheight - dw_1.y - gb_2.x

gb_3.width  = newwidth  - gb_3.x - gb_2.x

gb_4.width  = newwidth  - gb_4.x - gb_2.x

dw_3.width  = newwidth  - dw_3.x - gb_2.x
dw_3.height = newheight - dw_3.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_oestand_aim_m
integer x = 4256
integer y = 64
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
datawindowchild ldwc_item, ldwc_item_name
long    ll_row, ll_seq
decimal ld_sidqty
string  ls_sidqa

if dw_2.rowcount() < 1 then return

for ll_row = 1 to dw_3.rowcount()
	ls_sidqa  = dw_3.object.sidqa[ll_row]
	ld_sidqty = dw_3.object.sidqty[ll_row]
	ll_seq    = dw_3.object.seq[ll_row]
next

if MessageBox("저장","저장하시겠습니까?",information!,okcancel!,1) = 2 then return

dw_3.accepttext()

setpointer(hourglass!)
if dw_3.rowcount() > 0 then
	if wf_nullchk(dw_3) = false then return
end if
		
//l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
if wf_update1( dw_3, "Y" ) = false then return

//if l_status = newmodified! or l_status = DataModified! then
//	integer li_dw1row
//   li_dw1row = dw_1.getrow()
//
//	dw_1.reset()
//	dw_1.retrieve()
//	dw_1.setrow(li_dw1row)
//end if

end event

type dw_1 from w_inheritance`dw_1 within w_oestand_aim_m
integer x = 32
integer y = 424
integer width = 1646
integer height = 2084
integer taborder = 70
string dataobject = "d_oestand_aim_s"
end type

event dw_1::rowfocuschanged;//
long   ll_row
string ls_custno, ls_scenecode

dw_2.reset()
dw_3.reset()

ll_row = this.getrow()
if ll_row < 1 then return

ls_custno    = this.getitemstring( currentrow, "cust_no" )
ls_scenecode = this.getitemstring( currentrow, "scene_code" )

if dw_2.rowcount() < 1 then 
	dw_2.insertrow(0)
end if
dw_3.retrieve( ls_scenecode )

dw_2.object.sname.background.color = 78682240	// 1087434968
dw_2.object.use_flag_t.visible = false
dw_2.object.use_flag.visible   = false


end event

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_oestand_aim_m
integer x = 23
integer y = 32
integer width = 1609
integer height = 132
string text = "거래처현장별 물량목표"
end type

type st_tips from w_inheritance`st_tips within w_oestand_aim_m
end type

type pb_compute from w_inheritance`pb_compute within w_oestand_aim_m
boolean visible = false
integer y = 48
integer taborder = 130
end type

type pb_print_part from w_inheritance`pb_print_part within w_oestand_aim_m
integer x = 3959
integer y = 908
integer width = 338
integer height = 112
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "다중선택"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_print_part::clicked;//
gs_where2 lstr_where
string ls_location
long   ll_row, ll_cnt

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

lstr_where.chk = 'M' //M:multi S:single
//lstr_where.chk1 = dw_2.object.loc_no[1]
OpenwithParm( w_whitemlocqohmulti_w, lstr_where )
lstr_where = Message.PowerObjectParm
if lstr_where.chk <> "Y" then return

for ll_row = 1 to UpperBound(lstr_where.str1)						
	ll_cnt = dw_3.insertrow(0)

	dw_3.object.item_no[ll_cnt]  = dw_2.getitemstring(dw_2.getrow(), "item_no")
	dw_3.object.item_no[ll_cnt]  = trim(lstr_where.str1[ll_row])
	dw_3.object.qa_y[ll_cnt]     = trim(lstr_where.str2[ll_row])
	dw_3.object.uom[ll_cnt]      = trim(lstr_where.str3[ll_row])
	dw_3.object.itemnm_y[ll_cnt] = trim(lstr_where.name[ll_row])
	
	dw_3.object.std_cost[ll_cnt] = &
	wf_price( trim(lstr_where.str1[ll_row]), trim(lstr_where.str2[ll_row]) )
next

dw_3.accepttext()
dw_3.scrolltorow(1)
idwc_qa.setfilter("item_no = '" + dw_3.object.asc_item[1] + "'")
idwc_qa.filter()

dw_3.setcolumn('qty')
dw_3.setfocus()


end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_oestand_aim_m
integer x = 4448
integer y = 64
integer taborder = 140
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oestand_aim_m
integer x = 4064
integer y = 64
integer taborder = 150
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

if dw_5.rowcount() < 1  then return

l_print.st_datawindow  = dw_5
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 일위대가를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_oestand_aim_m
boolean visible = false
integer taborder = 160
end type

type pb_delete from w_inheritance`pb_delete within w_oestand_aim_m
integer x = 3872
integer y = 64
integer taborder = 170
string disabledname = "c:\bmp\delete.bmp"
end type

event pb_delete::clicked;////
//dwitemstatus l_status
//string ls_item_no
//long   ll_cnt
//
//if dw_2.rowcount() < 1 then return	
//
//if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then	return
//
//l_status = dw_2.getitemstatus(1, 0, primary!)
//if l_status = new! or l_status = newmodified! then
//	dw_2.reset()
//	dw_3.reset()
//else
//	ls_item_no = dw_2.getitemstring(1, "item_no")
//	select count(*) into :ll_cnt from estimate_head where system_no = :ls_item_no;
//	if ll_cnt > 0 then
//		messagebox("확인", "이시스템 코드는 이미 견적서 작성중입니다 ~r~n" &
//								+ "견적서를 삭제후 삭제가 가능합니다.")
//		return
//	end if
//	dw_2.deleterow(1)
//	
//	dw_3.rowsmove(1,dw_3.rowcount(),  Primary!, dw_3, 1, Delete!)
//	
//	dw_2.accepttext()
//	dw_3.accepttext()
//
//	if wf_update2(dw_2, dw_3, "Y") = false then return
//	dw_1.retrieve()
//end if
//
//
end event

type pb_insert from w_inheritance`pb_insert within w_oestand_aim_m
integer x = 3680
integer y = 64
integer taborder = 190
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;// 추가

pb_1.enabled = true

dw_2.enabled = true
dw_2.reset()

dw_2.insertrow(1)
dw_2.object.sysuser[1] = gs_userid
dw_2.object.sysdate[1] = gf_today()

dw_2.object.sname.background.color = 1087434968

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oestand_aim_m
integer x = 3488
integer y = 64
integer taborder = 180
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_area, ls_cust,  ls_start, ls_end, ls_category
long   ll_row

dw_area.accepttext()
ls_area   = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

dw_4.accepttext()
ls_cust   = trim(dw_4.object.cust_no[1])
if isnull(ls_cust) or ls_cust = "" then ls_cust = "%"

ls_start  = em_1.text
ls_end    = em_2.text

dw_1.reset()
dw_1.setredraw( false )
dw_1.retrieve( ls_cust )
dw_1.setredraw( true )

dw_2.object.sname.background.color = 78682240	// 1087434968
dw_2.object.use_flag_t.visible = false
dw_2.object.use_flag.visible   = false


end event

type gb_3 from w_inheritance`gb_3 within w_oestand_aim_m
integer x = 1705
integer y = 408
integer width = 2953
integer height = 456
integer taborder = 110
integer textsize = -8
long backcolor = 79219928
end type

type gb_2 from w_inheritance`gb_2 within w_oestand_aim_m
integer y = 240
integer width = 4640
integer height = 156
integer taborder = 120
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79219928
string text = "현장목록"
end type

type gb_1 from w_inheritance`gb_1 within w_oestand_aim_m
integer x = 3465
integer y = 16
integer width = 1198
integer height = 216
integer taborder = 60
long backcolor = 79219928
end type

type dw_2 from w_inheritance`dw_2 within w_oestand_aim_m
integer x = 1737
integer y = 452
integer width = 2880
integer height = 392
integer taborder = 80
string dataobject = "d_oestand_new_m"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;//
datawindowchild ldwc_sname

string  ls_sid, ls_sname, ls_uom, ls_remark, ls_use_flag, ls_sysuser
decimal ld_amt1, ld_amt2, ld_amt3, ld_amount, ls_user_name
datetime ldt_sdate, ldt_sysdate

debugbreak()
choose case dwo.name
	case "sid"
		dw_2.getchild("sid", ldwc_sname)
		ls_sid = ldwc_sname.getitemstring( ldwc_sname.getrow(), 'SID' )

	case "sname"
		dw_2.getchild("sname", ldwc_sname)
		ls_sid = ldwc_sname.getitemstring( ldwc_sname.getrow(), 'SID' )

		if isnull(ls_sid) or ls_sid = "" then
		else
			SELECT a.sid, a.sname, a.sdate, a.uom, a.remark, a.use_flag, a.sysuser, a.sysdate
				  , isnull(a.amt1,0), isnull(a.amt2,0), isnull(a.amt3,0), isnull(a.amount,0), b.user_name
			  INTO :ls_sid, :ls_sname, :ldt_sdate, :ls_uom, :ls_remark, :ls_use_flag, :ls_sysuser, :ldt_sysdate
				  , :ld_amt1, :ld_amt2, :ld_amt3, :ld_amount, :ls_user_name
			  FROM NBASIS_MST a
					 LEFT OUTER JOIN login b  ON a.sysuser = b.user_id
			 WHERE a.sid      = :ls_sid;
			 
			 dw_2.object.sid[row]       = ls_sid
			 dw_2.object.sdate[row]     = ldt_sdate
			 dw_2.object.uom[row]       = ls_uom
			 dw_2.object.remark[row]    = ls_remark
			 dw_2.object.use_flag[row]  = ls_use_flag
			 dw_2.object.sysuser[row]   = ls_sysuser
			 dw_2.object.sysdate[row]   = ldt_sysdate
			 dw_2.object.amt1[row]      = ld_amt1
			 dw_2.object.amt2[row]      = ld_amt2
			 dw_2.object.amt3[row]      = ld_amt3
			 dw_2.object.amount[row]    = ld_amount
		//  dw_2.object.sysuser[row]   = ls_user_name			 
			 
		//	 dw_2.setcolumn("use_flag")
		//	 dw_2.setfocus()
			 
			 dw_5.retrieve( ls_sid )	// 일위대가 시스템 목록
		end if
 end choose

end event

type dw_3 from datawindow within w_oestand_aim_m
integer x = 1705
integer y = 1060
integer width = 2953
integer height = 1452
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_oestand_aim_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//		
string   ls_findvalue
string   ls_null, ls_sid_save, ls_sidqa_save		// save
decimal  ld_sidqty, ld_sidqty_save, ld_sidqtybf, ld_act_qty, ld_totqty, ld_act_price, ld_rate	// save
int      li_totqty
long     ll_row, ll_row_save, ll_seq, ll_found
boolean  lb_exist

string   ls_sid, ls_sidqa

debugbreak()
ld_rate     = integer(em_3.text) / 100
ld_sidqtybf = dw_3.object.sidqty[row]

setnull(ls_null)
dw_3.accepttext()
choose case dwo.name
	case 'chk'		// 선택
			if cbx_2.checked = true then	// 시스템+적용규격 중복 확인
				ls_sid    = dw_3.object.sid[row]
				ls_sidqa  = dw_3.object.sidqa[row]
				ld_sidqty = dw_3.object.sidqty[row]
				
				for ll_row = 1 to dw_3.rowcount()
					if ll_row = row then
					else
						if ls_sid = dw_3.object.sid[ll_row] then
							if ls_sidqa = dw_3.object.sidqa[ll_row] then
								if ld_sidqty = dw_3.object.sidqty[ll_row] then
									if dw_3.object.chk[ll_row] = "N" then
										dw_3.object.chk[ll_row] = "Y"
									else
										dw_3.object.chk[ll_row] = "N"
									end if
								end if
							end if
						end if
					end if
				next
			end if
		
	case 'sidqa'	// 적용규격: 중복검사
		ll_row_save   = row		// 현재행
		ls_sid_save   = this.object.sid[row]
		ls_sidqa_save = this.object.sidqa[row]

      ls_findvalue  = "sid = '" + ls_sid_save + "' AND sidqa = '" + ls_sidqa_save + "' AND chk = 'N'"
		ll_found      = this.Find( ls_findvalue, 1, this.RowCount())
		if ll_found = 0 then
		else
			MessageBox("확인1","일위대가시스템의 적용규격이 중복될 수 없습니다.")
			RETURN 1
		end if
		
		for ll_row = 1 to this.rowcount()		// 규격 채워넣기
			if this.object.chk[ll_row] = 'Y' then
				this.object.sidqa[ll_row] = ls_sidqa_save
			end if
		next

	case 'sidqty'	// 산출물량 수정시(나머지 행 물량 채워넣기)
		if Not (cbx_2.checked = true And this.object.chk[row] = "Y") then	// 시스템+적용규격 중복 확인
			MessageBox("확인","산출물량을 변경할 경우는 [시스템+적용규격 중복 확인] 을 반드시 체크 하시기 바랍니다.")
			dw_3.object.sidqty[row] = ld_sidqtybf
			RETURN 1
		end if
		
		ll_row_save   = row
		ls_sid_save   = this.object.sid[row]
		ls_sidqa_save = this.object.sidqa[row]
		ld_sidqty_save= this.object.sidqty[row]

		for ll_row = 1 to this.rowcount()		// 물량, 총수량, 금액 계산하기
			if this.object.chk[ll_row] = 'Y' then
				ld_act_qty   = this.object.act_qty[ll_row]		// 수량
				ld_act_price = this.object.act_price[ll_row]		// 단가
				
				// Ex: 608 * 2.20 = 1,337.6 => 1,337 가까운 정수로 내림(엑셀: int(1,337.6) => 1,337)
				// li_totqty = int(608 * 2.20)
				li_totqty    = int(ld_sidqty_save * ld_act_qty)
				ld_totqty    = li_totqty
				
				this.object.sidqty[ll_row]     = ld_sidqty_save					// 물량
				this.object.act_totqty[ll_row] = ld_totqty * ld_rate        // 총수량
				this.object.act_amount[ll_row] = ld_totqty * ld_rate * ld_act_price	// 금액
			end if
		next
end choose
dw_3.accepttext()

end event

event clicked;//
datawindowchild ldwc_sname
string   ls_sid, ls_sname, ls_uom,  ls_remark, ls_use_flag, ls_sysuser
decimal  ld_amt1, ld_amt2, ld_amt3, ld_amount, ls_user_name
datetime ldt_sdate, ldt_sysdate
long     ll_row

choose case dwo.name
	case 'sid', 'sidqa', 'sidqty'		// 시스템
		ls_sid = this.object.sid[row]
end choose

if isnull(ls_sid) or ls_sid = "" then
else
	SELECT a.sid, a.sname, a.sdate, a.uom, a.remark, a.use_flag, a.sysuser, a.sysdate
		  , isnull(a.amt1,0), isnull(a.amt2,0), isnull(a.amt3,0), isnull(a.amount,0), b.user_name
	  INTO :ls_sid, :ls_sname, :ldt_sdate, :ls_uom, :ls_remark, :ls_use_flag, :ls_sysuser, :ldt_sysdate
		  , :ld_amt1, :ld_amt2, :ld_amt3, :ld_amount, :ls_user_name
	  FROM NBASIS_MST a
			 LEFT OUTER JOIN login b  ON a.sysuser = b.user_id
	 WHERE a.sid      = :ls_sid;
	 
	 dw_2.object.sid[row]       = ls_sid
	 dw_2.object.sname[row]     = ls_sname
	 dw_2.object.sdate[row]     = ldt_sdate
	 dw_2.object.uom[row]       = ls_uom
	 dw_2.object.remark[row]    = ls_remark
	 dw_2.object.use_flag[row]  = ls_use_flag
	 dw_2.object.sysuser[row]   = ls_sysuser
	 dw_2.object.sysdate[row]   = ldt_sysdate
	 dw_2.object.amt1[row]      = ld_amt1
	 dw_2.object.amt2[row]      = ld_amt2
	 dw_2.object.amt3[row]      = ld_amt3
	 dw_2.object.amount[row]    = ld_amount
  //dw_2.object.sysuser[row]   = ls_user_name			 
	 
	 dw_5.retrieve( ls_sid )	// 일위대가 시스템 목록
end if

end event

event itemfocuschanged;// 산출물량 값 선택하기
string ls_colname, ls_sidqty
long   ll_len

choose case dwo.name
	case 'sidqty'
		ls_sidqty = string(this.object.sidqty[row], "#,##0")
		ll_len    = LenA(ls_sidqty)
		this.SelectText( 1, LenA( ls_sidqty ) )
		this.SetFocus()
end choose

end event

type dw_5 from datawindow within w_oestand_aim_m
integer x = 1499
integer y = 20
integer width = 197
integer height = 128
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string dataobject = "d_oestand_aim_m2"
boolean resizable = true
boolean livescroll = true
end type

type pb_1 from picturebutton within w_oestand_aim_m
event mousemove pbm_mousemove
integer x = 4302
integer y = 908
integer width = 155
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
string disabledname = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event clicked;// 일위대가 품목+규격 추가
long   ll_row, ll_dw3cnt, ll_dw3row_save
string ls_cust, ls_scenecode, ls_sname, ls_qa, ls_qa_y, ls_itemno
decimal ld_rate

ld_rate  = integer(em_3.text) / 100
ls_cust  = dw_4.object.cust_no[1]
if isnull(ls_cust) or ls_cust = "" then 
	MessageBox("확인","거래처가 선택되지 않았습니다.")
	return
end if

ls_scenecode = dw_1.object.scene_code[dw_1.getrow()]
if isnull(ls_scenecode) or ls_scenecode = "" then 
	MessageBox("확인","거래처 현장이 선택되지 않았습니다.")
	return
end if

ls_sname = dw_2.object.sname[dw_2.getrow()]
if isnull(ls_sname) or ls_sname = "" then 
	MessageBox("확인","일위대가 시스템이 선택되지 않았습니다.")
	return
end if

// 선택해지
for ll_row = 1 to dw_3.rowcount()
	dw_3.object.chk[ll_row] = 'N'
next

if dw_5.rowcount() < 1 then
	MessageBox("확인","일위대가 시스템 내역이 존재하지 않습니다.")
	return
else
	ll_dw3row_save = dw_3.rowcount()	
	for ll_row = 1 to dw_5.rowcount()
		ll_dw3cnt = dw_3.insertrow(0)
   	dw_3.scrolltorow(ll_dw3cnt)
	
		dw_3.object.chk[ll_dw3cnt]         = 'Y'	                             /* 선택          */
		dw_3.object.cust_no[ll_dw3cnt]     = ls_cust	                          /* 거래처        */
		dw_3.object.scene_code[ll_dw3cnt]  = ls_scenecode                      /* 현장          */
		dw_3.object.sid[ll_dw3cnt]         = dw_5.object.sid[ll_row]           /* 일위대가 SID  */
		dw_3.object.sidqa[ll_dw3cnt]       = dw_5.object.sidqa[ll_row]         /* 일위대가 규격 */
		dw_3.object.sidqty[ll_dw3cnt]      = dw_5.object.sidqty[ll_row]        /* 일위대가 물량 */
    //dw_3.object.scene_name[ll_dw3cnt]  = ''                                /* 현장명        */
		dw_3.object.sub_seq[ll_dw3cnt]     = ''                                /* 소공사순번    */
		dw_3.object.subcon_name[ll_dw3cnt] = ''                                /* 소공사명      */
		dw_3.object.con_seq[ll_dw3cnt]     = ''                                /* 공종순번      */
		dw_3.object.con_name[ll_dw3cnt]    = ''                                /* 공종명        */
		dw_3.object.seq[ll_dw3cnt]         = dw_5.object.seq[ll_row]           /* 순번          */
		dw_3.object.item_no[ll_dw3cnt]     = dw_5.object.item_no[ll_row]       /* 자재코드      */
      dw_3.object.item_name[ll_dw3cnt]   = dw_5.object.item_name[ll_row]     /* 자재명        */
		dw_3.object.qa[ll_dw3cnt]          = dw_5.object.qa[ll_row]            /* 자재규격      */
		dw_3.object.uom[ll_dw3cnt]         = dw_5.object.uom[ll_row]           /* 단위          */
		dw_3.object.act_qty[ll_dw3cnt]     = dw_5.object.qty[ll_row] * ld_rate /* 소요량        */
		dw_3.object.act_price[ll_dw3cnt]   = dw_5.object.act_price[ll_row]     /* 단가          */
		dw_3.object.act_totqty[ll_dw3cnt]  = dw_5.object.act_totqty[ll_row]    /* 총수량        */
		dw_3.object.act_amount[ll_dw3cnt]  = dw_5.object.atc_amount[ll_row]    /* 금액          */
	next
end if

debugbreak()
//dw_3.scrolltorow( ll_dw3row_save + 1 )
dw_3.setrow( ll_dw3row_save + 1 )
dw_3.setcolumn('sidqa')
dw_3.setfocus()

end event

type pb_2 from picturebutton within w_oestand_aim_m
event mousemove pbm_mousemove
integer x = 4462
integer y = 908
integer width = 155
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
string disabledname = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)

end event

event clicked;// 일위대가 품목+규격 삭제
string   ls_sid_save, ls_sidqa_save		// save
decimal  ld_sidqty_save						// save
long     ll_row

if dw_3.rowcount() < 1 then return

dw_3.accepttext()

ll_row = dw_3.getrow()
ls_sid_save   = dw_3.object.sid[ll_row]
ls_sidqa_save = dw_3.object.sidqa[ll_row]
ld_sidqty_save= dw_3.object.sidqty[ll_row]

for ll_row = dw_3.rowcount() to 1 step -1
	if ls_sid_save = dw_3.object.sid[ll_row] then
		if ls_sidqa_save = dw_3.object.sidqa[ll_row] then
			if ld_sidqty_save = dw_3.object.sidqty[ll_row] then
				dw_3.deleterow( ll_row )
			end if
		end if
	end if
next

end event

type st_3 from statictext within w_oestand_aim_m
integer x = 69
integer y = 300
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

type ddlb_fld from dropdownlistbox within w_oestand_aim_m
integer x = 256
integer y = 284
integer width = 480
integer height = 632
integer taborder = 90
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

type ddlb_dwtitles from dropdownlistbox within w_oestand_aim_m
integer x = 297
integer y = 296
integer width = 311
integer height = 88
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

type st_4 from statictext within w_oestand_aim_m
integer x = 754
integer y = 300
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

type sle_value from singlelineedit within w_oestand_aim_m
integer x = 1243
integer y = 292
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oestand_aim_m
integer x = 1815
integer y = 292
integer width = 160
integer height = 76
integer taborder = 80
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

type cb_2 from commandbutton within w_oestand_aim_m
integer x = 1979
integer y = 292
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

type cb_3 from commandbutton within w_oestand_aim_m
integer x = 2144
integer y = 292
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oestand_aim_m
integer x = 2309
integer y = 292
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_2 from statictext within w_oestand_aim_m
integer x = 1797
integer y = 56
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oestand_aim_m
integer x = 1797
integer y = 132
integer width = 521
integer height = 84
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText() 

end event

event rowfocuschanged;//
dw_1.reset()
this.accepttext()

is_area    = trim(this.object.area[1])
if isnull(is_area) or is_area = "" then is_area = "%"

end event

type st_1 from statictext within w_oestand_aim_m
integer x = 2322
integer y = 56
integer width = 229
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
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_oestand_aim_m
integer x = 2322
integer y = 140
integer width = 229
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_oestand_aim_m
integer x = 2555
integer y = 52
integer width = 869
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()

end event

event rowfocuschanged;//
dw_1.reset()
this.accepttext()

is_cust    = trim(this.object.cust_no[1])
if isnull(is_cust) or is_cust = "" then is_cust = "%"

end event

type em_1 from editmask within w_oestand_aim_m
integer x = 2555
integer y = 136
integer width = 407
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;//id_date1 = date(this.text)

end event

event rbuttondown;//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//id_date1 = date(this.text)
//
end event

type st_6 from statictext within w_oestand_aim_m
integer x = 2967
integer y = 148
integer width = 46
integer height = 52
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "~~"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_2 from editmask within w_oestand_aim_m
integer x = 3013
integer y = 136
integer width = 407
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
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

event modified;////
//id_date2 = date(this.text)
//pb_retrieve.default = true
//
end event

event rbuttondown;//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//id_date2 = date(this.text)
//
end event

type cbx_1 from checkbox within w_oestand_aim_m
integer x = 1769
integer y = 944
integer width = 229
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "선택"
end type

event clicked;// 선택
long ll_row

for ll_row = 1 to dw_3.rowcount()
	if this.checked = true then
		dw_3.object.chk[ll_row] = 'Y'
	else
		dw_3.object.chk[ll_row] = 'N'
	end if
next

end event

type em_3 from editmask within w_oestand_aim_m
integer x = 3657
integer y = 928
integer width = 183
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "80"
alignment alignment = center!
string mask = "###,##0"
end type

type st_7 from statictext within w_oestand_aim_m
integer x = 3365
integer y = 940
integer width = 279
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "적용물량"
boolean focusrectangle = false
end type

type st_8 from statictext within w_oestand_aim_m
integer x = 3849
integer y = 940
integer width = 82
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
string text = "%"
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_oestand_aim_m
integer x = 2039
integer y = 944
integer width = 905
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "시스템+적용규격 중복 확인"
boolean checked = true
end type

type ddlb_op from dropdownlistbox within w_oestand_aim_m
integer x = 933
integer y = 284
integer width = 302
integer height = 500
integer taborder = 130
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

type gb_4 from groupbox within w_oestand_aim_m
integer x = 1705
integer y = 864
integer width = 2953
integer height = 184
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79219928
end type

type gb_6 from groupbox within w_oestand_aim_m
integer x = 1765
integer y = 16
integer width = 1678
integer height = 216
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

