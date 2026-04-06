$PBExportHeader$w_orsaleday_r.srw
$PBExportComments$수주일보 (1998/05/12, 정재수)
forward
global type w_orsaleday_r from w_inheritance
end type
type em_1 from editmask within w_orsaleday_r
end type
type em_2 from editmask within w_orsaleday_r
end type
type dw_6 from datawindow within w_orsaleday_r
end type
type dw_3 from datawindow within w_orsaleday_r
end type
type pb_2 from picturebutton within w_orsaleday_r
end type
type st_1 from statictext within w_orsaleday_r
end type
type st_4 from statictext within w_orsaleday_r
end type
type ddlb_fld from dropdownlistbox within w_orsaleday_r
end type
type ddlb_dwtitles from dropdownlistbox within w_orsaleday_r
end type
type st_5 from statictext within w_orsaleday_r
end type
type ddlb_op from dropdownlistbox within w_orsaleday_r
end type
type sle_value from singlelineedit within w_orsaleday_r
end type
type cb_3 from commandbutton within w_orsaleday_r
end type
type cb_4 from commandbutton within w_orsaleday_r
end type
type cb_5 from commandbutton within w_orsaleday_r
end type
type cb_6 from commandbutton within w_orsaleday_r
end type
type cbx_close from checkbox within w_orsaleday_r
end type
type dw_4 from datawindow within w_orsaleday_r
end type
type cbx_sum from checkbox within w_orsaleday_r
end type
type cbx_view from checkbox within w_orsaleday_r
end type
type cbx_fix from checkbox within w_orsaleday_r
end type
type dw_7 from datawindow within w_orsaleday_r
end type
type st_6 from statictext within w_orsaleday_r
end type
type st_2 from statictext within w_orsaleday_r
end type
type cbx_inside from checkbox within w_orsaleday_r
end type
type dw_8 from datawindow within w_orsaleday_r
end type
type cbx_order from checkbox within w_orsaleday_r
end type
type dw_9 from datawindow within w_orsaleday_r
end type
type cbx_hap from checkbox within w_orsaleday_r
end type
type st_10 from statictext within w_orsaleday_r
end type
type dw_work from datawindow within w_orsaleday_r
end type
type dw_5 from datawindow within w_orsaleday_r
end type
type gb_4 from groupbox within w_orsaleday_r
end type
type gb_5 from groupbox within w_orsaleday_r
end type
end forward

global type w_orsaleday_r from w_inheritance
integer y = 112
integer width = 5335
integer height = 2568
string title = "수주일보(w_orsaleday_r)"
em_1 em_1
em_2 em_2
dw_6 dw_6
dw_3 dw_3
pb_2 pb_2
st_1 st_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cbx_close cbx_close
dw_4 dw_4
cbx_sum cbx_sum
cbx_view cbx_view
cbx_fix cbx_fix
dw_7 dw_7
st_6 st_6
st_2 st_2
cbx_inside cbx_inside
dw_8 dw_8
cbx_order cbx_order
dw_9 dw_9
cbx_hap cbx_hap
st_10 st_10
dw_work dw_work
dw_5 dw_5
gb_4 gb_4
gb_5 gb_5
end type
global w_orsaleday_r w_orsaleday_r

type variables
string  is_dw
Integer ii_sort
datawindowchild idwc_area, idwc_cust, idwc_itemtop, idwc_work
end variables

forward prototypes
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col, long al_head)
end prototypes

public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col);// string = wf_crosstab_title( arg_dw, al_row, al_col )
string ls_col, ls_value, ls_today
long   ll_row, ll_col

ll_row    = al_row
ll_col    = al_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ls_today = string(gf_today(), "mm/dd")

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
else
	ls_title = ""
	RETURN ls_title
end if

//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to UpperBound(ls_bandname)
   if Upper(LeftA(ls_bandname[i], 4)) = "HEAD" then
      li_pos = PosA(ls_bandname[i], "[")
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], "]")
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then li_header2 = li_header1
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = "HEADER"
else
   ls_lastheader = "HEADER[" + string(li_header2) + "]"
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")	 
ll_objects = GF_SPLIT(ls_objects, "~t", ls_object)

for i = 1 to UpperBound(ls_object)
   ls_objname = Trim(ls_object[i])
   ls_type    = Upper(arg_dw.Describe( ls_objname + ".type" ))
	
	choose case ls_type
		case "COLUMN", "COMPUTE"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = "DETAIL" then
				ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
				
				if ls_visible = "1" then
					j++
					
					ls_detail[j]  = ls_objname
					ls_objtype[j] = ls_type
				end if
			end if
		
		case "TEXT"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = ls_lastheader then
				li_pos = integer(arg_dw.Describe( ls_objname + ".x" ))
				if li_pos > 0 then ls_header[li_pos] = ls_objname
			end if
	end choose
next

//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_colcount = UpperBound(ls_detail)
for j = 1 to li_colcount
   ls_colname  = arg_dw.Describe(ls_detail[j] + ".name")
   li_pos      = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	
	if li_pos > UpperBound(ls_header) then
		//
	else
		if li_pos > 0 then
			ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )
	
			if al_col = j then
				ls_title = ls_coltext[j]
			end if
			
			if ls_today = ls_coltext[j] then
				arg_dw.Modify(ls_colname + ".Background.Mode='0'")
				arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
			end if
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
RETURN ls_title

end function

public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col, long al_head);// string = wf_crosstab_title2( arg_dw, al_row, al_col, al_head )
// al_head : column 배열수 
string   ls_col, ls_value, ls_today, ls_day
long     ll_row, ll_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount, li_head
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ll_row    = al_row
ll_col    = al_col

ls_day    = string(daynumber(date(gf_today())))
if ls_day = "1" then ls_day = "(일)"
if ls_day = "2" then ls_day = "(월)"
if ls_day = "3" then ls_day = "(화)"
if ls_day = "4" then ls_day = "(수)"
if ls_day = "5" then ls_day = "(목)"
if ls_day = "6" then ls_day = "(금)"
if ls_day = "7" then ls_day = "(토)"
ls_today  = string(gf_today(), "yy/mm/dd") + ls_day

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
else
	ls_title = ""
	RETURN ls_title
end if

//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to UpperBound(ls_bandname)
   if Upper(LeftA(ls_bandname[i], 4)) = "HEAD" then
      li_pos = PosA(ls_bandname[i], "[")
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], "]")
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then 
				li_header2 = li_header1
			end if
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = "HEADER"
else
   ls_lastheader = "HEADER[" + string(li_header2) + "]"
   ls_lastheader = "HEADER[2]"
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")	 
ll_objects = GF_SPLIT(ls_objects, "~t", ls_object)

for i = 1 to UpperBound(ls_object)
   ls_objname = Trim(ls_object[i])
	ls_band    = Upper(arg_dw.Describe( ls_objname + ".band" ))
   ls_type    = Upper(arg_dw.Describe( ls_objname + ".type" ))	
	
	choose case ls_type
		case "TEXT"			
			if ls_band = ls_lastheader then
				li_pos = integer(arg_dw.Describe( ls_objname + ".x" ))
				if li_pos > 0 then 
					ls_header[li_pos] = ls_objname

					ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
					if ls_visible = "1" then
						j++
						
						ls_detail[j]  = ls_objname
						ls_objtype[j] = ls_type
					end if
				end if
			end if

		case "COLUMN", "COMPUTE"			
			if ls_band = "DETAIL" then
				ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
				
				if ls_visible = "1" then
					j++
					
					ls_detail[j]  = ls_objname
					ls_objtype[j] = ls_type
				end if
			end if		
	end choose
next

debugbreak()

//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_head     = Ceiling((al_col - 1) / al_head)
if li_head = 0 then li_head = 1

li_colcount = UpperBound(ls_detail)
for j = 1 to li_colcount
   ls_colname  = arg_dw.Describe(ls_detail[j] + ".name")
   li_pos      = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	
	if li_pos > UpperBound(ls_header) then
		//
	else
		if li_pos > 0 then
			ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )
	
			if li_head = j then
				ls_title = ls_coltext[j]
			end if
			
			//if ls_today = ls_coltext[j] then
			//	arg_dw.Modify(ls_colname + ".Background.Mode='0'")
			//	arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
			//end if
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
RETURN ls_title

end function

on w_orsaleday_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.em_2=create em_2
this.dw_6=create dw_6
this.dw_3=create dw_3
this.pb_2=create pb_2
this.st_1=create st_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cbx_close=create cbx_close
this.dw_4=create dw_4
this.cbx_sum=create cbx_sum
this.cbx_view=create cbx_view
this.cbx_fix=create cbx_fix
this.dw_7=create dw_7
this.st_6=create st_6
this.st_2=create st_2
this.cbx_inside=create cbx_inside
this.dw_8=create dw_8
this.cbx_order=create cbx_order
this.dw_9=create dw_9
this.cbx_hap=create cbx_hap
this.st_10=create st_10
this.dw_work=create dw_work
this.dw_5=create dw_5
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.dw_6
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.pb_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.ddlb_op
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.cb_6
this.Control[iCurrent+17]=this.cbx_close
this.Control[iCurrent+18]=this.dw_4
this.Control[iCurrent+19]=this.cbx_sum
this.Control[iCurrent+20]=this.cbx_view
this.Control[iCurrent+21]=this.cbx_fix
this.Control[iCurrent+22]=this.dw_7
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.st_2
this.Control[iCurrent+25]=this.cbx_inside
this.Control[iCurrent+26]=this.dw_8
this.Control[iCurrent+27]=this.cbx_order
this.Control[iCurrent+28]=this.dw_9
this.Control[iCurrent+29]=this.cbx_hap
this.Control[iCurrent+30]=this.st_10
this.Control[iCurrent+31]=this.dw_work
this.Control[iCurrent+32]=this.dw_5
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_5
end on

on w_orsaleday_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_6)
destroy(this.dw_3)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cbx_close)
destroy(this.dw_4)
destroy(this.cbx_sum)
destroy(this.cbx_view)
destroy(this.cbx_fix)
destroy(this.dw_7)
destroy(this.st_6)
destroy(this.st_2)
destroy(this.cbx_inside)
destroy(this.dw_8)
destroy(this.cbx_order)
destroy(this.dw_9)
destroy(this.cbx_hap)
destroy(this.st_10)
destroy(this.dw_work)
destroy(this.dw_5)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.visible = false
dw_4.SetTransObject(SQLCA)
dw_5.visible = false
dw_5.SetTransObject(SQLCA)
dw_8.visible = false
dw_8.SetTransObject(SQLCA)
dw_9.visible = false
dw_9.SetTransObject(SQLCA)

string ls_chk

//SELECT isnull(sale_price,'N') INTO :ls_chk FROM login WHERE user_id = :gs_userid; 
//if ls_chk = 'Y' Then
//	is_ret = '%'
//else
//	is_ret = gs_userid
//end if

// 일자
em_1.text = string(today(), 'yyyy/mm/dd')
em_2.text = string(today(), 'yyyy/mm/dd')

// 사업장
dw_6.settransobject(sqlca)
dw_6.insertrow(0)  

dw_6.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')
dw_6.object.area[1] = '%'  // gs_area

// 대분류
dw_7.settransobject(sqlca)
dw_7.insertrow(0)  

dw_7.getchild("itemtop10", idwc_itemtop)
idwc_itemtop.settransobject(sqlca)
idwc_itemtop.insertrow(1)
idwc_itemtop.setitem(1, 'item_cd', '%')
idwc_itemtop.setitem(1, 'item_nm', '전체대분류')
dw_7.object.itemtop10[1] = "%"	// 

// 거래처
dw_3.SetTransObject(SQLCA)
//dw_3.insertrow(0)  
//dw_1.enabled = false
//dw_1.object.cust_no.Background.Color = 67108864

dw_3.SetTransObject(SQLCA)
dw_3.getchild("cust_no", idwc_cust)
idwc_cust.SetTransObject(sqlca)

if GF_Permission("수주일보(기간별)", gs_userid) = "Y" then
	idwc_cust.retrieve( "%" )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "1.전체거래처")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "%"
else
	idwc_cust.retrieve( gs_userid )
	idwc_cust.insertrow(1)
	idwc_cust.setitem(1, "cust_no", "ALL")
	idwc_cust.setitem(1, "cust_name", "1.담당전체")
	idwc_cust.accepttext()
	dw_3.object.cust_no[1] = "ALL"
end if

// 작업장 
string ls_work
dw_work.settransobject(sqlca)
dw_work.insertrow(0)  

dw_work.getchild("work_no", idwc_work)
idwc_work.settransobject(sqlca)
idwc_work.insertrow(1)
idwc_work.setitem(1, "work_no", "AA")
idwc_work.setitem(1, "work_name", "성형+화성")

idwc_work.insertrow(1)
idwc_work.setitem(1, "work_no", "%")
idwc_work.setitem(1, "work_name", "전체작업장")
idwc_work.accepttext()

ls_work = "%"	
dw_work.object.work_no[1] = ls_work

//
dw_2.visible = false
cbx_fix.enabled = false
//cbx_view.enabled = false

cbx_sum.checked = true
cbx_sum.triggerevent( clicked! )

end event

event resize;call super::resize;//
gb_4.width  = newwidth  - (gb_4.x * 2)

dw_1.width  = newwidth  - (gb_4.x * 2)
dw_1.height = newheight - dw_1.y - gb_4.x

dw_4.x      = dw_1.x
dw_4.y      = dw_1.y
dw_4.width  = dw_1.width
dw_4.height = dw_1.height

dw_5.x      = dw_1.x
dw_5.y      = dw_1.y
dw_5.width  = dw_1.width
dw_5.height = dw_1.height

dw_8.x      = dw_1.x
dw_8.y      = dw_1.y
dw_8.width  = dw_1.width
dw_8.height = dw_1.height

dw_9.x      = (dw_1.width / 2) + dw_1.x
dw_9.y      = dw_1.y
dw_9.width  = dw_1.width / 2
dw_9.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_orsaleday_r
boolean visible = false
integer taborder = 130
end type

type dw_1 from w_inheritance`dw_1 within w_orsaleday_r
integer x = 32
integer y = 472
integer width = 4640
integer height = 1960
integer taborder = 0
string dataobject = "d_orsaledayrep_r"
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'cust_no' or dwo.name = 'cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_orsaleday_r
integer y = 24
integer width = 1115
integer height = 136
string text = "수주일보(기간별)"
end type

type st_tips from w_inheritance`st_tips within w_orsaleday_r
end type

type pb_compute from w_inheritance`pb_compute within w_orsaleday_r
boolean visible = false
integer taborder = 150
end type

type pb_print_part from w_inheritance`pb_print_part within w_orsaleday_r
boolean visible = false
integer taborder = 110
end type

type pb_close from w_inheritance`pb_close within w_orsaleday_r
integer x = 4855
integer y = 80
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_orsaleday_r
integer x = 4466
integer y = 80
integer taborder = 90
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print
string     ls_text
long       ll_row

if cbx_sum.checked = true then
	MessageBox("확인","수주집계 조회시에는 출력작업을 지원하지 않습니다.")	
	RETURN
end if

dw_1.ShareData( dw_2 )
if dw_2.rowcount() < 1 then RETURN

ls_text = '(' + trim(idwc_area.getitemstring(idwc_area.getrow(),'area_name')) + ',전체)'
for ll_row = 1 to dw_2.rowcount()
	dw_2.object.c_text[ll_row] = ls_text
next

//l_print.name = 'd_orsaledayrep_r1'
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc  = " 이 프로그램은 수주일보를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 Datawindow.Zoom=100'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_orsaleday_r
boolean visible = false
integer taborder = 220
end type

type pb_delete from w_inheritance`pb_delete within w_orsaleday_r
boolean visible = false
integer taborder = 260
end type

type pb_insert from w_inheritance`pb_insert within w_orsaleday_r
boolean visible = false
integer taborder = 280
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_orsaleday_r
integer x = 4274
integer y = 76
integer taborder = 50
end type

event pb_retrieve::clicked;//
string ls_gubun, ls_area, ls_custno, ls_inside, ls_openclose, ls_itemtop10
string ls_colx, ls_sdate, ls_edate, ls_yymm, ls_work, ls_sdate1, ls_edate1
date   ld_sdate, ld_edate

if em_1.text = '' then
	MessageBox("확인","주문기간을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
elseif em_2.text = '' then
	MessageBox("확인","주문기간을 입력하세요!",information!)
	em_2.setfocus()
	RETURN
elseif em_1.text > em_2.text then
	MessageBox("확인","주문기간을 잘못 입력하였습니다!",information!)
	em_1.setfocus()
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 조회일자
ls_sdate = em_1.text
ls_edate = em_2.text
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 사업장
dw_6.accepttext()
ls_area    = trim(LeftA(dw_6.object.area[1],1)) + "%"
if ls_area = "%%" then ls_area = "%"

// 전체거래처
dw_3.accepttext()
ls_custno = trim(dw_3.object.cust_no[1])

// 대분류
dw_7.accepttext()
ls_itemtop10 = trim(dw_7.object.itemtop10[1])

// 작업장
dw_work.AcceptText()
ls_work = LeftA(dw_work.object.work_no[1],1) + "%"
if ls_work = "%%" then ls_work = "%"

// 내부업체 제외
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

// 마감포함
if cbx_close.checked = true then
	ls_openclose = 'Y'
else
	ls_openclose = '%'
end if

// 수주일 집계
if cbx_view.checked = true then 
	ls_yymm = "Y"
else
	ls_yymm  = "N"	
end if 

// 수주집계
time lt_stime, lt_etime
long ll_calctime

lt_stime = now()
if cbx_sum.checked = true then
	
	if ls_work = "%" then
		dw_1.visible = false ; dw_4.visible = true ; dw_5.visible = false ; dw_8.visible = false ; dw_9.visible = false
		
		dw_4.retrieve( ls_area, ls_sdate, ls_edate, ls_yymm, ls_itemtop10, ls_openclose, ls_inside )		
		dw_4.setfocus()
	
		cbx_fix.enabled = true
		cbx_fix.triggerevent( clicked! )
	else
		cbx_fix.enabled  = false

		dw_1.visible = false ; dw_4.visible = false ; dw_5.visible = true ; dw_8.visible = false ; dw_9.visible = false

		dw_5.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_itemtop10, ls_inside, ls_work )
		dw_5.setfocus()
	end if
else
//   cbx_view.enabled = false

	// 입력자별 집계
	if cbx_order.checked = true then
		cbx_fix.enabled  = true		

		dw_1.visible = false ; dw_4.visible = false ; dw_5.visible = false ; dw_8.visible = true ; dw_9.visible = false


		 ls_sdate = LeftA(ls_sdate,4)+MidA(ls_sdate,6,2)+RightA(ls_sdate,2)
		 ls_edate = LeftA(ls_edate,4)+MidA(ls_edate,6,2)+RightA(ls_edate,2)

		dw_8.retrieve(ls_area, ls_sdate, ls_edate, ls_itemtop10, ls_openclose, ls_inside )
		dw_8.setfocus()
	else
		// 작업장
		if ls_work = "%" then
			cbx_fix.enabled  = false
	
			dw_1.visible = true ; dw_4.visible = false ; dw_5.visible = false ; dw_8.visible = false ; dw_9.visible = false
	
			dw_1.retrieve( ls_area, ld_sdate, ld_edate, ls_custno, ls_itemtop10, ls_openclose, ls_inside )
			dw_1.setfocus()
		else
			cbx_fix.enabled  = false
	
			dw_1.visible = false ; dw_4.visible = false ; dw_5.visible = true ; dw_8.visible = false ; dw_9.visible = false
	
			dw_5.retrieve( ls_area, ld_sdate, ld_edate, ls_yymm, ls_itemtop10, ls_inside, ls_work )
			dw_5.setfocus()
		end if
	end if
end if
lt_etime = now()

//
ll_calctime = SecondsAfter(lt_stime, lt_etime)
//MessageBox("확인","조회완료[" + string(ll_calctime) + "]초")


end event

type gb_3 from w_inheritance`gb_3 within w_orsaleday_r
integer x = 2158
integer y = 16
integer width = 1033
integer height = 244
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_2 from w_inheritance`gb_2 within w_orsaleday_r
integer x = 1193
integer y = 16
integer width = 946
integer height = 244
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_orsaleday_r
integer x = 4238
integer y = 16
integer width = 841
integer height = 244
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_orsaleday_r
integer x = 37
integer y = 180
integer width = 105
integer height = 84
integer taborder = 0
boolean enabled = false
string dataobject = "d_orsaledayrep_r1"
boolean vscrollbar = false
boolean livescroll = false
end type

event dw_2::itemchanged;call super::itemchanged;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

type em_1 from editmask within w_orsaleday_r
integer x = 3246
integer y = 68
integer width = 370
integer height = 80
integer taborder = 10
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
boolean autoskip = true
string displaydata = ""
end type

event modified;//
em_2.setfocus()

if dw_1.rowcount() > 0 then dw_1.reset()

end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_orsaleday_r
integer x = 3246
integer y = 156
integer width = 370
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type dw_6 from datawindow within w_orsaleday_r
integer x = 1499
integer y = 68
integer width = 526
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type dw_3 from datawindow within w_orsaleday_r
integer x = 1499
integer y = 156
integer width = 613
integer height = 84
integer taborder = 270
boolean bringtotop = true
string dataobject = "d_oiscenecust_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_custno

this.accepttext()

ls_custno = trim(data)		// dw_3.object.cust_no[1]
if ls_custno = "" then
	cbx_inside.visible = true
else
	cbx_inside.visible = false
end if

end event

type pb_2 from picturebutton within w_orsaleday_r
event mousemove pbm_mousemove
integer x = 4658
integer y = 80
integer width = 187
integer height = 144
integer taborder = 240
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

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

// 수주집계
if dw_1.visible = true then ldw_sel = dw_1
if dw_4.visible = true then ldw_sel = dw_4
if dw_5.visible = true then ldw_sel = dw_5
if dw_8.visible = true then ldw_sel = dw_8
if dw_9.visible = true then ldw_sel = dw_9

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_1 from statictext within w_orsaleday_r
integer x = 1221
integer y = 156
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_orsaleday_r
integer x = 78
integer y = 348
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

type ddlb_fld from dropdownlistbox within w_orsaleday_r
integer x = 265
integer y = 332
integer width = 480
integer height = 632
integer taborder = 160
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

type ddlb_dwtitles from dropdownlistbox within w_orsaleday_r
integer x = 320
integer y = 348
integer width = 311
integer height = 88
integer taborder = 190
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

type st_5 from statictext within w_orsaleday_r
integer x = 782
integer y = 348
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

type ddlb_op from dropdownlistbox within w_orsaleday_r
integer x = 951
integer y = 332
integer width = 297
integer height = 512
integer taborder = 200
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_orsaleday_r
integer x = 1271
integer y = 336
integer width = 567
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_orsaleday_r
integer x = 1851
integer y = 336
integer width = 160
integer height = 76
integer taborder = 140
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	MessageBox("확인","DataWindow 를 선택하시기 바랍니다.")
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_orsaleday_r
integer x = 2016
integer y = 336
integer width = 160
integer height = 76
integer taborder = 170
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	//arg_dw  = dw_5
end if
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_orsaleday_r
integer x = 2181
integer y = 336
integer width = 160
integer height = 76
integer taborder = 210
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	//arg_dw  = dw_5
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_orsaleday_r
integer x = 2345
integer y = 336
integer width = 160
integer height = 76
integer taborder = 250
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	//arg_dw  = dw_5
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type cbx_close from checkbox within w_orsaleday_r
integer x = 3648
integer y = 80
integer width = 375
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "마감포함"
end type

type dw_4 from datawindow within w_orsaleday_r
integer x = 192
integer y = 720
integer width = 1833
integer height = 828
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsaledet_ct1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
if isnull(row) OR row < 1 then RETURN

This.scrolltorow( row )

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type cbx_sum from checkbox within w_orsaleday_r
integer x = 2619
integer y = 312
integer width = 384
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "수주집계"
boolean checked = true
end type

event clicked;// 수주집계ON
if this.checked = true then
	dw_work.object.work_no.Background.Color   = rgb(255, 255, 255)
	dw_work.enabled = true
	
	dw_1.visible = false		// 수주리스트	
	dw_4.visible = true		// 집계리스트
	if dw_4.rowcount() > 0 then
		if MessageBox("확인","새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_retrieve.triggerevent( clicked! )
		end if
	end if

	cbx_order.enabled = false
	cbx_close.enabled = false
	cbx_fix.enabled   = true
//   cbx_view.enabled  = true
// 수주집계OFF
else	
	dw_work.object.work_no.Background.Color   = 67108864
	dw_work.enabled = false

	dw_1.visible = true		// 수주리스트
	dw_4.visible = false		// 집계리스트	
	if dw_1.rowcount() > 0 then
		if MessageBox("확인","데이터를 새로고침 하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
			pb_retrieve.triggerevent( clicked! )
		end if
	end if

	cbx_order.enabled = true
	cbx_close.enabled = true
	cbx_fix.enabled   = false
//   cbx_view.enabled  = false
end if

// 틀고정
cbx_fix.triggerevent( clicked! )

end event

type cbx_view from checkbox within w_orsaleday_r
integer x = 2619
integer y = 380
integer width = 320
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "년월별"
boolean checked = true
end type

event clicked;////
//if this.checked = true then
//	dw_4.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw_4.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//else
//	dw_4.Modify("DataWindow.Detail.Height=80")		// Detail
//	dw_4.Modify("DataWindow.Trailer.1.Height=80")	// 대분류계
//end if
//
//
//
if cbx_order.checked then
	if cbx_view.checked = true then	
		dw_8.dataobject = "d_orsaledaysum_month_r"				
	else
		dw_8.dataobject = "d_orsaledaysum_r"		
	end if
	dw_8.SetTransObject(sqlca)	
end if	

end event

type cbx_fix from checkbox within w_orsaleday_r
integer x = 3634
integer y = 380
integer width = 315
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;//
string ls_colx

if this.checked = true then
	if cbx_order.checked = true then
		ls_colx = string(integer(dw_8.object.org_user.x)  + integer(dw_8.object.org_user.width))
		dw_8.object.datawindow.horizontalscrollsplit = ls_colx
	else
		ls_colx = string(integer(dw_4.object.item_name.x) + integer(dw_4.object.item_name.width))
		dw_4.object.datawindow.horizontalscrollsplit = ls_colx
	end if
else
	if cbx_order.checked = true then
		ls_colx = "0"
		dw_8.object.datawindow.horizontalscrollsplit = ls_colx
	else
		ls_colx = "0"
		dw_4.object.datawindow.horizontalscrollsplit = ls_colx
	end if
end if



end event

type dw_7 from datawindow within w_orsaleday_r
integer x = 2578
integer y = 64
integer width = 599
integer height = 84
integer taborder = 290
boolean bringtotop = true
string title = "none"
string dataobject = "d_cditemtop10_s"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_orsaleday_r
integer x = 2185
integer y = 64
integer width = 389
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "대/중분류"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_orsaleday_r
integer x = 1221
integer y = 68
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_inside from checkbox within w_orsaleday_r
integer x = 3648
integer y = 168
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "매출제외 업체"
end type

type dw_8 from datawindow within w_orsaleday_r
integer x = 2085
integer y = 728
integer width = 1925
integer height = 808
integer taborder = 300
boolean bringtotop = true
string title = "등록집계"
string dataobject = "d_orsaledaysum_r"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

//
dw_8.width   = dw_1.width
dw_9.visible = false

end event

event doubleclicked;//
string ls_value, ls_title, ls_openclose, ls_salesman
long   ll_row, ll_col
date   ld_sdate, ld_edate

// 마감포함
if cbx_close.checked = true then
	ls_openclose = 'Y'
else
	ls_openclose = '%'
end if

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 
ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_value  = string( this.GetItemNumber( ll_row, ll_col) )

// 등록자 이전컬럼 클릭시 
if ll_col < 2 then RETURN		// @col
if isnull(ls_value) OR ls_value = "" then RETURN

dw_9.visible = true
dw_9.reset()

ls_title  = WF_CrossTab_Title2( this, ll_row, ll_col, 3 )
ls_title  = "20" + LeftA(ls_title, LenA(ls_title) - 4)	// (일)
ld_sdate  = date(ls_title)
ld_edate  = date(ls_title)

ls_title  = WF_CrossTab_Title( this, ll_row, ll_col )

//MessageBox("확인", ls_title )

// 입력자
ls_salesman = this.getitemstring(ll_row, "org_user")
SELECT user_id INTO :ls_salesman FROM login WHERE user_name = :ls_salesman AND use_flag = 'Y';

dw_9.retrieve( ls_openclose, ld_sdate, ld_edate, ls_salesman )


////first the key to getting this to work is the crosstab must
////be in static mode.  After the retrieve code:
////this.modify('datawindow.crosstab.staticmode=yes')
//
////Now get the values in the doubleclick event:
//string ls_object, ls_name, ls_rowvalue, ls_colvalue
//long   ll_pos, ll_value, ll_numb
//
//ls_object   = this.GetObjectAtPointer()
//ll_pos      = pos(ls_object, '~t',1)
//ls_name     = left(ls_object, ll_pos - 1)
//ll_row      = long( right(ls_object, len(ls_object) - ll_pos ) )
//ll_value    = this.getitemnumber(ll_row, ls_name)
//ls_rowvalue = this.getitemstring(ll_row, 1)
//ls_colvalue = this.describe(ls_name+'_t.text')
//messagebox('', string(ll_row) + '  '+ ls_name + '   ' + string(ll_value))
//messagebox('', ls_rowvalue + '   ' + ls_colvalue)


end event

type cbx_order from checkbox within w_orsaleday_r
integer x = 3017
integer y = 312
integer width = 558
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "입력자별 집계"
end type

event clicked;// 등록집계
if this.checked = true then
	if cbx_view.checked = true then	
		dw_8.dataobject = "d_orsaledaysum_month_r"				
	else
		dw_8.dataobject = "d_orsaledaysum_r"		
	end if
	
	dw_8.SetTransObject(sqlca)
	
	cbx_fix.enabled = true
	dw_8.visible    = true
else
	cbx_fix.enabled = false
	dw_8.visible    = false
	dw_9.visible    = false
end if

end event

type dw_9 from datawindow within w_orsaleday_r
integer x = 2094
integer y = 1588
integer width = 1893
integer height = 628
integer taborder = 300
boolean bringtotop = true
string dataobject = "d_orsaledaysum_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_hap from checkbox within w_orsaleday_r
integer x = 3634
integer y = 312
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;// 합계만 보기
DataWindow arg_dw

if dw_1.visible = true then
	arg_dw = dw_1
elseif dw_4.visible = true then
	arg_dw = dw_4	
elseif dw_5.visible = true then
	arg_dw = dw_5	
elseif dw_8.visible = true then
	arg_dw = dw_8
elseif dw_9.visible = true then
	arg_dw = dw_9
end if

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	if dw_5.visible = true then
		arg_dw.Modify("DataWindow.Detail.Height=0")			
		arg_dw.Modify("DataWindow.Trailer.2.Height=80")		
		arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
	else
		arg_dw.Modify("DataWindow.Detail.Height=0")			
		arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
		arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
	end if
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type st_10 from statictext within w_orsaleday_r
integer x = 2185
integer y = 156
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 12639424
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_work from datawindow within w_orsaleday_r
integer x = 2569
integer y = 156
integer width = 526
integer height = 80
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdvwork_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_work

// 대,중분류
dw_7.accepttext()
dw_7.object.itemtop10[1] = "%"	// 

//
this.accepttext()
ls_work  = this.object.work_no[row]

// 작업장
if ls_work = "%" then
	dw_1.visible = false ; dw_4.visible = true  ; dw_5.visible = false 
	dw_8.visible = false ; dw_9.visible = false

	cbx_sum.enabled  = true
	cbx_hap.enabled  = true
	cbx_fix.enabled  = true

	cbx_view.enabled = true
else
	dw_1.visible = false ; dw_4.visible = false ; dw_5.visible = true 
	dw_8.visible = false ; dw_9.visible = false

	cbx_sum.enabled  = false
	cbx_hap.enabled  = true
	cbx_fix.enabled  = false
	
	cbx_view.enabled = true
end if

end event

type dw_5 from datawindow within w_orsaleday_r
integer x = 187
integer y = 1568
integer width = 1833
integer height = 692
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsaledet_ct2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
//
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

end event

type gb_4 from groupbox within w_orsaleday_r
integer x = 32
integer y = 268
integer width = 4640
integer height = 184
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_5 from groupbox within w_orsaleday_r
integer x = 3209
integer y = 16
integer width = 1010
integer height = 244
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

