$PBExportHeader$w_oidopricechk_r.srw
$PBExportComments$출고단가 체크
forward
global type w_oidopricechk_r from w_inheritance
end type
type dw_area from datawindow within w_oidopricechk_r
end type
type pb_1 from picturebutton within w_oidopricechk_r
end type
type st_3 from statictext within w_oidopricechk_r
end type
type st_4 from statictext within w_oidopricechk_r
end type
type ddlb_op from dropdownlistbox within w_oidopricechk_r
end type
type sle_value from singlelineedit within w_oidopricechk_r
end type
type cb_1 from commandbutton within w_oidopricechk_r
end type
type cb_2 from commandbutton within w_oidopricechk_r
end type
type cb_3 from commandbutton within w_oidopricechk_r
end type
type cb_5 from commandbutton within w_oidopricechk_r
end type
type st_2 from statictext within w_oidopricechk_r
end type
type ddlb_fld from dropdownlistbox within w_oidopricechk_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidopricechk_r
end type
type em_1 from editmask within w_oidopricechk_r
end type
type em_2 from editmask within w_oidopricechk_r
end type
type dw_3 from datawindow within w_oidopricechk_r
end type
type dw_4 from datawindow within w_oidopricechk_r
end type
type st_1 from statictext within w_oidopricechk_r
end type
type st_5 from statictext within w_oidopricechk_r
end type
type st_6 from statictext within w_oidopricechk_r
end type
type st_8 from statictext within w_oidopricechk_r
end type
type cb_4 from commandbutton within w_oidopricechk_r
end type
type cbx_dono from checkbox within w_oidopricechk_r
end type
type st_9 from statictext within w_oidopricechk_r
end type
type cbx_item from checkbox within w_oidopricechk_r
end type
type cbx_fix from checkbox within w_oidopricechk_r
end type
type cbx_basic from checkbox within w_oidopricechk_r
end type
type dw_7 from datawindow within w_oidopricechk_r
end type
type cbx_user from checkbox within w_oidopricechk_r
end type
type dw_8 from datawindow within w_oidopricechk_r
end type
type cbx_inside from checkbox within w_oidopricechk_r
end type
type dw_6 from datawindow within w_oidopricechk_r
end type
type dw_10 from datawindow within w_oidopricechk_r
end type
type cbx_sum from checkbox within w_oidopricechk_r
end type
type dw_11 from datawindow within w_oidopricechk_r
end type
type cb_6 from commandbutton within w_oidopricechk_r
end type
type cb_7 from commandbutton within w_oidopricechk_r
end type
type cb_8 from commandbutton within w_oidopricechk_r
end type
type cb_9 from commandbutton within w_oidopricechk_r
end type
type dw_12 from datawindow within w_oidopricechk_r
end type
type cb_popup from commandbutton within w_oidopricechk_r
end type
type cb_del from commandbutton within w_oidopricechk_r
end type
type dw_13 from datawindow within w_oidopricechk_r
end type
type cbx_minprice from checkbox within w_oidopricechk_r
end type
type dw_9 from datawindow within w_oidopricechk_r
end type
type dw_5 from datawindow within w_oidopricechk_r
end type
type gb_4 from groupbox within w_oidopricechk_r
end type
type gb_5 from groupbox within w_oidopricechk_r
end type
end forward

global type w_oidopricechk_r from w_inheritance
integer y = 112
integer width = 4974
integer height = 2596
string title = "거래처별 단가체크(w_oidopricechk_r)"
dw_area dw_area
pb_1 pb_1
st_3 st_3
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_2 st_2
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
em_1 em_1
em_2 em_2
dw_3 dw_3
dw_4 dw_4
st_1 st_1
st_5 st_5
st_6 st_6
st_8 st_8
cb_4 cb_4
cbx_dono cbx_dono
st_9 st_9
cbx_item cbx_item
cbx_fix cbx_fix
cbx_basic cbx_basic
dw_7 dw_7
cbx_user cbx_user
dw_8 dw_8
cbx_inside cbx_inside
dw_6 dw_6
dw_10 dw_10
cbx_sum cbx_sum
dw_11 dw_11
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
dw_12 dw_12
cb_popup cb_popup
cb_del cb_del
dw_13 dw_13
cbx_minprice cbx_minprice
dw_9 dw_9
dw_5 dw_5
gb_4 gb_4
gb_5 gb_5
end type
global w_oidopricechk_r w_oidopricechk_r

type variables
//
DataWindowChild idwc_area, idwc_cust, idwc_user
string is_dw, IS_Original_Filter, IS_Original_Sort

end variables

forward prototypes
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col)
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

if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
end if

RETURN ls_title

end function

public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col);// string = wf_crosstab_title2( arg_dw, al_row, al_col )
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
ls_lastheader = "HEADER[2]"

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

if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
end if

RETURN ls_title

end function

on w_oidopricechk_r.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.pb_1=create pb_1
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_2=create st_2
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.em_1=create em_1
this.em_2=create em_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_1=create st_1
this.st_5=create st_5
this.st_6=create st_6
this.st_8=create st_8
this.cb_4=create cb_4
this.cbx_dono=create cbx_dono
this.st_9=create st_9
this.cbx_item=create cbx_item
this.cbx_fix=create cbx_fix
this.cbx_basic=create cbx_basic
this.dw_7=create dw_7
this.cbx_user=create cbx_user
this.dw_8=create dw_8
this.cbx_inside=create cbx_inside
this.dw_6=create dw_6
this.dw_10=create dw_10
this.cbx_sum=create cbx_sum
this.dw_11=create dw_11
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.dw_12=create dw_12
this.cb_popup=create cb_popup
this.cb_del=create cb_del
this.dw_13=create dw_13
this.cbx_minprice=create cbx_minprice
this.dw_9=create dw_9
this.dw_5=create dw_5
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_op
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.em_1
this.Control[iCurrent+15]=this.em_2
this.Control[iCurrent+16]=this.dw_3
this.Control[iCurrent+17]=this.dw_4
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.st_8
this.Control[iCurrent+22]=this.cb_4
this.Control[iCurrent+23]=this.cbx_dono
this.Control[iCurrent+24]=this.st_9
this.Control[iCurrent+25]=this.cbx_item
this.Control[iCurrent+26]=this.cbx_fix
this.Control[iCurrent+27]=this.cbx_basic
this.Control[iCurrent+28]=this.dw_7
this.Control[iCurrent+29]=this.cbx_user
this.Control[iCurrent+30]=this.dw_8
this.Control[iCurrent+31]=this.cbx_inside
this.Control[iCurrent+32]=this.dw_6
this.Control[iCurrent+33]=this.dw_10
this.Control[iCurrent+34]=this.cbx_sum
this.Control[iCurrent+35]=this.dw_11
this.Control[iCurrent+36]=this.cb_6
this.Control[iCurrent+37]=this.cb_7
this.Control[iCurrent+38]=this.cb_8
this.Control[iCurrent+39]=this.cb_9
this.Control[iCurrent+40]=this.dw_12
this.Control[iCurrent+41]=this.cb_popup
this.Control[iCurrent+42]=this.cb_del
this.Control[iCurrent+43]=this.dw_13
this.Control[iCurrent+44]=this.cbx_minprice
this.Control[iCurrent+45]=this.dw_9
this.Control[iCurrent+46]=this.dw_5
this.Control[iCurrent+47]=this.gb_4
this.Control[iCurrent+48]=this.gb_5
end on

on w_oidopricechk_r.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_2)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_8)
destroy(this.cb_4)
destroy(this.cbx_dono)
destroy(this.st_9)
destroy(this.cbx_item)
destroy(this.cbx_fix)
destroy(this.cbx_basic)
destroy(this.dw_7)
destroy(this.cbx_user)
destroy(this.dw_8)
destroy(this.cbx_inside)
destroy(this.dw_6)
destroy(this.dw_10)
destroy(this.cbx_sum)
destroy(this.dw_11)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.dw_12)
destroy(this.cb_popup)
destroy(this.cb_del)
destroy(this.dw_13)
destroy(this.cbx_minprice)
destroy(this.dw_9)
destroy(this.dw_5)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
string ls_chk

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_5.settransobject(sqlca)
dw_5.visible = false

dw_6.settransobject(sqlca)
dw_6.visible = false

dw_7.settransobject(sqlca)
dw_7.visible = false

dw_8.settransobject(sqlca)
dw_8.visible = false

dw_9.settransobject(sqlca)
dw_9.visible = false

dw_10.settransobject(sqlca)
dw_10.visible = false

dw_11.settransobject(sqlca)
dw_11.visible = false

dw_12.settransobject(sqlca)
dw_12.visible = false

dw_13.settransobject(sqlca)
dw_13.visible = false

cbx_fix.enabled   = false
cbx_basic.enabled = false

dw_2.visible = false

// 판매단가
cbx_minprice.checked = true
cbx_minprice.TriggerEvent( clicked! )

// 일자
em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")

// 사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = "%"

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no', '%')
idwc_area.setitem(1, 'area_name', '전체사업장')

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area.Background.Color = 67108864
dw_area.enabled = false

// 전체거래처
dw_4.settransobject(sqlca)
dw_4.insertrow(0)  

idwc_cust.setredraw(false)
dw_4.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")
dw_4.object.cust_no[1] = "%"

// 담당자
dw_3.settransobject(sqlca)
dw_3.insertrow(0)

if GF_Permission("거래처별_단가체크", gs_userid) = "Y" then
	dw_3.getchild('user', idwc_user)
	idwc_user.insertrow(1)
	idwc_user.setitem(1, 'user_id', '%')
	idwc_user.setitem(1, 'user_name', '전체')
	idwc_user.accepttext()
	dw_3.object.user[1] = '%'
else
	dw_3.enabled = false
	dw_3.object.user[1] = gs_userid
	dw_3.object.user.background.color = 67108864
end if

end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

// 기본
dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = newheight - dw_1.y - gb_3.x

// 담당자(출고가)
dw_2.x      = dw_1.x
dw_2.y      = dw_1.y
dw_2.width  = dw_1.width
dw_2.height = dw_1.height * 0.7

// 담당자(출고가) 상세
dw_5.x      = dw_1.x
dw_5.y      = dw_1.y + (dw_1.height * 0.7)
dw_5.width  = dw_1.width
dw_5.height = dw_1.height * 0.3

// 매출평균
dw_6.x      = dw_1.x
dw_6.y      = dw_1.y
dw_6.width  = dw_1.width
dw_6.height = dw_1.height

// 담당자별 집계
dw_7.x      = dw_1.x
dw_7.y      = dw_1.y
dw_7.width  = dw_1.width
dw_7.height = dw_1.height / 2

// 담당자별 집계 상세
dw_8.x      = dw_1.x
dw_8.y      = dw_1.y + (dw_1.height / 2)
dw_8.width  = dw_1.width
dw_8.height = dw_1.height / 2

// 판매단가
dw_13.x      = dw_1.x
dw_13.y      = dw_1.y
dw_13.width  = dw_1.width
dw_13.height = dw_1.height * 0.7

// 기간별 환산수량, 매출액, 제품평균
dw_9.width  = newwidth  - dw_9.x - gb_3.x
dw_9.height = 268

end event

type pb_save from w_inheritance`pb_save within w_oidopricechk_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oidopricechk_r
integer x = 32
integer y = 492
integer width = 4357
integer height = 1964
integer taborder = 0
string dataobject = "d_oidopricechk_r"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;if dwo.name = 'cust_no' or dwo.name = 'cust_name' then
	gs_where lstr_where
	lstr_where.str1 = this.object.cust_no[row]
	lstr_where.name = this.object.cust_name[row]
	openwithparm(w_whopeom_w, lstr_where)
end if
end event

event dw_1::clicked;call super::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_2 from w_inheritance`dw_2 within w_oidopricechk_r
integer x = 55
integer y = 172
integer width = 151
integer height = 76
integer taborder = 0
string dataobject = "d_oidopricechk_r1"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::clicked;call super::clicked;// 거래처별
long     ll_row

ll_row   = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string   ls_custno, ls_itemno, ls_scenecode, ls_scenedesc
long     ll_find,  ll_docost
datetime ldt_sdate, ldt_edate

ldt_sdate  = DateTime( date(em_1.text), Time("00:00:00.000") )
ldt_edate  = DateTime( date(em_2.text), Time("00:00:00.000") )

ls_custno    = dw_2.object.cust_no[dw_2.getrow()]
ls_itemno    = dw_2.object.item_no[dw_2.getrow()]
ls_scenecode = dw_2.object.scene_code[dw_2.getrow()]
ls_scenedesc = dw_2.object.scene_desc[dw_2.getrow()]
ll_docost    = dw_2.object.do_cost[dw_2.getrow()]

dw_5.reset()
dw_5.retrieve( ls_custno, ls_scenecode, ls_itemno, ldt_sdate, ldt_edate )
ll_find = dw_5.find( "scene_scene_desc = '" + ls_scenedesc + "' AND price = " + string(ll_docost) + " ", 1, dw_5.rowcount() )
dw_5.scrolltorow( ll_find )

end event

type st_title from w_inheritance`st_title within w_oidopricechk_r
integer x = 37
integer y = 32
integer width = 1061
string text = "거래처별 단가체크"
end type

type st_tips from w_inheritance`st_tips within w_oidopricechk_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidopricechk_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidopricechk_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 40
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oidopricechk_r
integer x = 4530
integer y = 64
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidopricechk_r
integer x = 4338
integer y = 64
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print

string     ls_value, ls_month, ls_title
long       ll_row, ll_y, ll_num, i, ll_colcount 
boolean    lb_first = false
//
DataWindow arg_dw

debugbreak()

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		dw_2.ShareData( dw_12 )
		arg_dw  = dw_12
	case "dw_5"
		arg_dw  = dw_5
	case "dw_7"
		arg_dw  = dw_7
end choose		

//if arg_dw.rowcount() < 1 then
//   MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   RETURN
//end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_6.visible = true then
	window  lw_window
	long    ll_job
	integer ul_x, ul_y, ul_width, ul_height
	
	MessageBox("확인","프린트 인쇄방향을 '가로인쇄'로 선택하여 주시기 바랍니다.")
	PrintSetup()
	
	lw_window = this.GetParent() 
	ll_job    = PrintOpen()

	// 1: Landscape
	dw_6.Modify( "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80" )

	//lw_window.Print(ll_job, 0, 0, lw_window.width * 1.5, lw_window.height * 2.0)	
	PrintDataWindow(ll_job, dw_6)
	PrintClose(ll_job)	
	dw_6.Modify( "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100" )
	
	// PrintScreen ( printjobnumber, x, y {, width, height } ) 
	// Argument         Description 
	// printjobnumber   PrintOpen function이 print job에 할당한 번호
	// x                screen image의 왼쪽 상단부터 페이지의 x 좌표를 1인치의 1000분의 1로 표시한 integer.  
	// y                screen image의 왼쪽 상단부터 페이지의 y 좌표를 1인치의 1000분의 1로 표시한 integer.  
	// width (optional)  
	//                  1인치의 1000분의 1로 나타낸 print된 screen의 integer width. width를 생략한다면, 
	//                  PowerBuilder는 original width로 screen을 print하고 width를 명시한다면 반드시 height를 명시해야 한다. 
	// height (optional) 
	//                  1인치의 1000분의 1로 나타낸 print된 screen의 integer height. height를 생략한다면, 
	//                  PowerBuilder는 original height로 screen을 print 한다	
	ul_x      = UnitsToPixels(lw_window.X,      XUnitsToPixels!)
	ul_y      = UnitsToPixels(lw_window.Y,      XUnitsToPixels!)
	ul_width  = UnitsToPixels(lw_window.width,  XUnitsToPixels!)
	ul_height = UnitsToPixels(lw_window.height, XUnitsToPixels!)
	
	//PrintScreen(ll_job, ul_x, ul_y, ul_width, ul_height)
	//PrintScreen(ll_job, 0, 0) 	
	//PrintClose(ll_job)
	MessageBox("확인", "화면 출력완료", Information!)
else
	l_print.st_datawindow  = arg_dw
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 거래처별 단가체크를 출력합니다." 
	
	gs_print_control = "DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=90"
	OpenSheetWithParm(w_print, l_print, ParentWindow(), 1, Original!)
end if

end event

type pb_cancel from w_inheritance`pb_cancel within w_oidopricechk_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidopricechk_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oidopricechk_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidopricechk_r
integer x = 3954
integer y = 64
integer taborder = 10
end type

event pb_retrieve::clicked;//
gs_where2 lstr_where
string   ls_area, ls_salesman, ls_custno, ls_itemname, ls_inside
datetime ldt_sdate, ldt_edate
string   ls_month, ls_dodate
long     ll_docost, ll_row, ll_dw10cnt, ll_x, ll_y, ll_month

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]
if isnull(ls_area) OR ls_area = "" then ls_area = "%"

// 일자
ldt_sdate = datetime( date(em_1.text), time("00:00:00.000") )
ldt_edate = datetime( date(em_2.text), time("00:00:00.000") )

// 담당자
dw_3.accepttext()
ls_salesman    = dw_3.object.user[1]
if isnull(ls_salesman) OR ls_salesman = "" then ls_salesman = "%"
if ls_salesman = "%" then
	if MessageBox("확인", "전체 조회시 많은 시간이 소요됩니다. 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

// 거래처
dw_4.accepttext()
ls_custno    = dw_4.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then ls_custno = "%"

// 내부업체
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

// 판매단가
if cbx_minprice.checked = true then
	dw_5.reset()
	dw_13.retrieve( ls_salesman, ls_custno, ldt_sdate, ldt_edate, ls_inside )
	
	if dw_13.object.DataWindow.processing = "4" then 
		dw_13.object.DataWindow.CrossTab.StaticMode = "Yes"
		
//		ll_x, ll_y
//		for ll_x = 3 to dw_13.getcolumn( )
//		next
	end if
	
// 품목별
elseif cbx_item.checked = true then
	lstr_where.chk = "S" 
	OpenWithParm(w_whitemselectmulti_w, lstr_where)
	lstr_where = Message.PowerObjectParm
	if lstr_where.chk <> "Y" then RETURN
	
	ddlb_fld.text    = "품목"
	ddlb_op.text     = "="
	sle_value.text   = trim(lstr_where.name[1])

	ls_itemname      = sle_value.text
	
	// 제품평균단가
	dw_9.reset()
	dw_9.retrieve( ls_itemname, ldt_sdate, ldt_edate, ls_inside )
	
	dw_5.reset() ; dw_2.reset()
	dw_2.retrieve( ls_salesman, ls_custno, ls_itemname, ldt_sdate, ldt_edate, ls_inside )

	cb_1.triggerevent( clicked! )
	
	if dw_2.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_2.setfocus()
// 담당자별
elseif cbx_user.checked = true then
	lstr_where.chk = "S" 
	OpenWithParm(w_whitemselectmulti_w, lstr_where)
	lstr_where = Message.PowerObjectParm
	if lstr_where.chk <> "Y" then RETURN
	
	ddlb_fld.text    = "품목"
	ddlb_op.text     = "="
	sle_value.text   = trim(lstr_where.name[1])

	ls_itemname      = sle_value.text

	// 제품평균단가
	dw_9.reset()
	dw_9.retrieve( ls_itemname, ldt_sdate, ldt_edate, ls_inside )

	dw_8.reset() ; dw_7.reset()
	dw_7.setredraw( false )
	dw_7.retrieve( ls_salesman, ls_custno, ls_itemname, ldt_sdate, ldt_edate, ls_inside )	
   dw_7.Modify("docost.Text='" + string(dw_9.object.std_cost[1], "#,##0") + "'")

   ll_docost     = dw_9.object.std_cost[1]		
	dw_7.Modify( "do_cost.Color='0~tIf(do_cost>"+string(ll_docost)+",rgb(0,0,0),rgb(255,0,0))'")	
	dw_7.setredraw( true )
	
	if dw_7.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		cbx_fix.checked = true
		cbx_fix.triggerevent( clicked! )
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_7.setfocus()
// 매출평균
elseif cbx_sum.checked = true then
	if DaysAfter( date(ldt_sdate), date(ldt_edate) ) > 365 then
		MessageBox("확인", "1년 이상은 조회할 수 없습니다.",information!)
		RETURN
	end if
	
	string  ls_save, ls_savemon[12]
	decimal ll_sum, ll_avg
	long    ll_mon
		
	dw_6.reset() ; dw_10.reset()
	for ll_y = 1 to 14
		ls_month  = "mon" + RightA("00" + string(ll_y), 2)
		dw_6.Modify( ls_month + "_t.Text=''")
		dw_6.Modify( ls_month + ".font.weight='-10'" )
      dw_6.Modify( ls_month + "_t.Background.Color = '67108864'" )
	next
	
	dw_6.setredraw( false )
	dw_10.retrieve( ls_salesman, ls_custno, ldt_sdate, ldt_edate, ls_inside )
	
	for ll_dw10cnt = 1 to dw_10.rowcount()
		if ls_save <> dw_10.object.item_name[ll_dw10cnt] then
			ll_row   = dw_6.insertrow(0)		
			dw_6.object.category[ll_row]  = "평균단가"		
			dw_6.object.item_name[ll_row] = dw_10.object.item_name[ll_dw10cnt]

			ll_row   = dw_6.insertrow(0)		
			dw_6.object.category[ll_row]  = "환산수량"		
			dw_6.object.item_name[ll_row] = dw_10.object.item_name[ll_dw10cnt]
			
			ll_row   = dw_6.insertrow(0)		
			dw_6.object.category[ll_row]  = "매출금액"		
			dw_6.object.item_name[ll_row] = dw_10.object.item_name[ll_dw10cnt]

			ls_save  = dw_10.object.item_name[ll_dw10cnt]
		end if

		//
		ls_dodate   = dw_10.object.do_date[ll_dw10cnt]
		
		if ls_savemon[1]  = "" then
			ls_savemon[1]  = ls_dodate
		elseif ls_savemon[2]  = "" then 
			ls_savemon[2]  = ls_dodate
		elseif ls_savemon[3]  = "" then 
			ls_savemon[3]  = ls_dodate
		elseif ls_savemon[4]  = "" then 
			ls_savemon[4]  = ls_dodate
		elseif ls_savemon[5]  = "" then 
			ls_savemon[5]  = ls_dodate
		elseif ls_savemon[6]  = "" then 
			ls_savemon[6]  = ls_dodate
		elseif ls_savemon[7]  = "" then 
			ls_savemon[7]  = ls_dodate
		elseif ls_savemon[8]  = "" then 
			ls_savemon[8]  = ls_dodate
		elseif ls_savemon[9]  = "" then 
			ls_savemon[9]  = ls_dodate
		elseif ls_savemon[10] = "" then 
			ls_savemon[10] = ls_dodate
		elseif ls_savemon[11] = "" then 
			ls_savemon[11] = ls_dodate
		elseif ls_savemon[12] = "" then 
			ls_savemon[12] = ls_dodate
		end if
		
		for ll_y = 1 to UpperBound(ls_savemon)
			if ls_savemon[ll_y] = ls_dodate then
				exit
			end if
		next
		
		if ll_y > ll_mon then ll_mon = ll_y
		ls_month  = "mon" + RightA("00" + string(ll_y), 2)
		
		dw_6.setitem( ll_row -2, ls_month, dw_10.object.avg_price[ll_dw10cnt] )
		dw_6.setitem( ll_row -1, ls_month, dw_10.object.calc_qty[ll_dw10cnt] )
		dw_6.setitem( ll_row,    ls_month, dw_10.object.calc_amt[ll_dw10cnt] )

		// 타이틀변경
		//dw_6.Object.mon01_t.text = ls_dodate
		dw_6.Modify(ls_month +"_t.Text='" + ls_dodate + "'")
	next

	// 누계, 누계평균
	for ll_y = 1 to dw_6.rowcount()
		ll_sum = 0 ; ll_avg = 0
		
		for ll_x = 1 to ll_mon
			// 누계
			ls_month = "mon" + RightA("00" + string(ll_x), 2)
			ll_sum   = ll_sum + dw_6.GetItemDecimal( ll_y, ls_month )
		next
		
		if dw_6.object.category[ll_y] = "평균단가" then
			//
		else
			ls_month    = "mon" + RightA("00" + string(ll_mon + 1), 2)
			dw_6.setitem( ll_y, ls_month, ll_sum )
			dw_6.Modify( ls_month + "_t.Text='" + "누계" + "'")
			dw_6.Modify( ls_month + "_t.Background.Color = '12639424'" )
		end if

		// 누계평균
		ll_avg      = ll_sum / ll_mon
		
		ls_month    = "mon" + RightA("00" + string(ll_mon + 2), 2)
		dw_6.setitem( ll_y, ls_month, ll_avg )
		dw_6.Modify( ls_month + "_t.Text='" + "누계평균" + "'")
		dw_6.Modify( ls_month + ".font.weight='700'" )		// Bold
      dw_6.Modify( ls_month + "_t.Background.Color = '12639424'" )
	next
	dw_6.scrolltorow( 2 )
	dw_6.setredraw( true )
else
	dw_1.reset()
	dw_1.retrieve( ls_salesman, ls_custno, ldt_sdate, ldt_edate )
	if dw_1.rowcount() < 1 then
		MessageBox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
	else
		MessageBox("확인", "조회작업 완료.",information!)
	end if
	dw_1.setfocus()
end if

end event

type gb_3 from w_inheritance`gb_3 within w_oidopricechk_r
integer x = 32
integer y = 296
integer width = 4357
integer height = 184
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_oidopricechk_r
integer x = 1129
integer y = 16
integer width = 933
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidopricechk_r
integer x = 3922
integer y = 16
integer width = 832
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_area from datawindow within w_oidopricechk_r
integer x = 1385
integer y = 52
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type pb_1 from picturebutton within w_oidopricechk_r
event mousemove pbm_mousemove
integer x = 4146
integer y = 64
integer width = 187
integer height = 144
integer taborder = 110
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos,   li_value
long    ll_cnt
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
	case "dw_13"
		arg_dw  = dw_13
	case else
		MessageBox("확인","해당하는 데이터윈도우를 선택하시기 바랍니다.")
		RETURN
end choose

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if arg_dw.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			arg_dw.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

end event

type st_3 from statictext within w_oidopricechk_r
integer x = 78
integer y = 380
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

type st_4 from statictext within w_oidopricechk_r
integer x = 736
integer y = 380
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

type ddlb_op from dropdownlistbox within w_oidopricechk_r
integer x = 905
integer y = 364
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_oidopricechk_r
integer x = 1225
integer y = 372
integer width = 562
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oidopricechk_r
integer x = 1865
integer y = 372
integer width = 160
integer height = 76
integer taborder = 70
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose		
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidopricechk_r
integer x = 2030
integer y = 372
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose		
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_3 from commandbutton within w_oidopricechk_r
integer x = 2194
integer y = 372
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose		
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidopricechk_r
integer x = 2359
integer y = 372
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
	case "dw_7"
		arg_dw  = dw_7
end choose		
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_2 from statictext within w_oidopricechk_r
integer x = 2523
integer y = 384
integer width = 1797
integer height = 48
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_oidopricechk_r
integer x = 265
integer y = 364
integer width = 443
integer height = 632
integer taborder = 80
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

type ddlb_dwtitles from dropdownlistbox within w_oidopricechk_r
integer x = 297
integer y = 376
integer width = 311
integer height = 88
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

type em_1 from editmask within w_oidopricechk_r
integer x = 2405
integer y = 136
integer width = 407
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
string displaydata = ""
end type

event rbuttondown;//
//gs_calendar lstr_calendar
//
//lstr_calendar.sdate = em_1.text
//lstr_calendar.edate = em_2.text
//OpenWithParm(w_calendar2, lstr_calendar)
//lstr_calendar = Message.PowerObjectParm
//
//if lstr_calendar.chk <> 'N' then
//	em_1.text = lstr_calendar.sdate
//	em_2.text = lstr_calendar.edate
//end if

OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
	em_2.text = this.text
end if

end event

type em_2 from editmask within w_oidopricechk_r
integer x = 2821
integer y = 136
integer width = 407
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;//
//gs_calendar lstr_calendar
//
//lstr_calendar.sdate = em_1.text
//lstr_calendar.edate = em_2.text
//OpenWithParm(w_calendar2, lstr_calendar)
//lstr_calendar = Message.PowerObjectParm
//
//if lstr_calendar.chk <> 'N' then
//	em_1.text = lstr_calendar.sdate
//	em_2.text = lstr_calendar.edate
//end if

OpenWithParm(w_calendar, Message.StringParm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type dw_3 from datawindow within w_oidopricechk_r
integer x = 1385
integer y = 132
integer width = 663
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

event itemchanged;//
string ls_salesman

this.accepttext()

ls_salesman  = this.object.user[1]
if ls_salesman = "%" then
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "전체")
	idwc_cust.setitem(1, "salesman", "")
	
	idwc_cust.setfilter("")
	idwc_cust.filter()
//	idwc_cust.setsort("cust_name A")
//	idwc_cust.sort()
else
	idwc_cust.setitem(1, "cust_no", "%")
	idwc_cust.setitem(1, "cust_name", "전체")
	idwc_cust.setitem(1, "salesman", ls_salesman)
	
	idwc_cust.setfilter("salesman='"+ls_salesman+"'")
	idwc_cust.filter()
end if

end event

type dw_4 from datawindow within w_oidopricechk_r
integer x = 2405
integer y = 52
integer width = 869
integer height = 80
integer taborder = 120
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type st_1 from statictext within w_oidopricechk_r
integer x = 1152
integer y = 52
integer width = 229
integer height = 80
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

type st_5 from statictext within w_oidopricechk_r
integer x = 2103
integer y = 52
integer width = 293
integer height = 80
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

type st_6 from statictext within w_oidopricechk_r
integer x = 2103
integer y = 136
integer width = 293
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "출고일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_oidopricechk_r
integer x = 1152
integer y = 136
integer width = 229
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
string text = "담당자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_oidopricechk_r
integer x = 4005
integer y = 348
integer width = 763
integer height = 104
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서 수정/삭제"
end type

event clicked;// 거래명세서 수정 및 삭제 w_oidoupdate_m
string ls_dono
long   ll_row

debugbreak()

if dw_5.visible = true then
	if dw_5.rowcount() < 1 then RETURN
	
	ls_dono = dw_5.object.do_do_no[dw_5.getrow()]
	if isnull(ls_dono) OR ls_dono = "" then RETURN
	
	ll_row  = dw_5.object.dodet_oi_no[dw_5.getrow()]
	if isnull(ll_row) OR ll_row = 0 then RETURN
else
	if dw_1.rowcount() < 1 then RETURN
	
	ls_dono = dw_1.object.a_do_no[dw_1.getrow()]
	if isnull(ls_dono) OR ls_dono = "" then RETURN
	
	ll_row  = dw_1.object.a_oi_no[dw_1.getrow()]
	if isnull(ll_row) OR ll_row = 0 then RETURN
end if

if IsValid(w_o_main) = true then
	OpenSheet(w_oidoupdate_m, w_o_main, 5, original!)
else
	OpenSheet(w_oidoupdate_m, w_all_main, 5, original!)
end if

ls_dono = LeftA(ls_dono,10) + RightA(ls_dono,3)
w_oidoupdate_m.setredraw(false)
w_oidoupdate_m.em_3.text = ls_dono		// 출고번호
w_oidoupdate_m.cb_1.triggerevent(clicked!)
w_oidoupdate_m.setredraw(true)

end event

type cbx_dono from checkbox within w_oidopricechk_r
integer x = 1193
integer y = 296
integer width = 741
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출고번호+순번 SORT"
end type

type st_9 from statictext within w_oidopricechk_r
integer x = 37
integer y = 248
integer width = 1193
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
string text = "높음:▲, 낮음:▼, 같음:〓, 없음:●"
boolean focusrectangle = false
end type

type cbx_item from checkbox within w_oidopricechk_r
integer x = 2542
integer y = 404
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "품목별"
end type

event clicked;// 품목별
if this.checked = true then
	cb_del.enabled   = true
	
	cbx_dono.enabled = false
	cbx_user.enabled = false
	cbx_sum.enabled  = false
	cbx_minprice.enabled = false

	dw_1.visible = false
	
	dw_2.visible = true	
	dw_5.visible = true
	dw_9.visible = true
else
	cb_del.enabled   = false

	cbx_dono.enabled = true
	cbx_user.enabled = true
	cbx_sum.enabled  = true
	cbx_minprice.enabled = true
	
	dw_1.visible = true

	dw_2.visible = false
	dw_5.visible = false
	dw_9.visible = false
end if

dw_5.reset()

end event

type cbx_fix from checkbox within w_oidopricechk_r
integer x = 3337
integer y = 404
integer width = 302
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
string text = "틀고정"
end type

event clicked;//
string ls_colx

if this.checked = true then
	if cbx_minprice.checked = true then
		ls_colx = string( integer(dw_13.object.cust_name.x) + integer(dw_13.object.cust_name.width) )
	else
		ls_colx = string( integer(dw_7.object.do_cost.x) + integer(dw_7.object.do_cost.width) )
	end if
else
	ls_colx = "0"
end if

if cbx_user.checked = true then
	dw_7.object.datawindow.horizontalscrollsplit = ls_colx
end if

if cbx_minprice.checked = true then
	dw_13.object.datawindow.horizontalscrollsplit = ls_colx
end if

end event

type cbx_basic from checkbox within w_oidopricechk_r
integer x = 3337
integer y = 340
integer width = 384
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
string text = "기본정렬"
end type

event clicked;//
string ls_sort

if cbx_user.checked = true then
	dw_7.setsort( "item_name A, do_cost A" )
	dw_7.sort()
end if

this.checked = false

end event

type dw_7 from datawindow within w_oidopricechk_r
integer x = 2080
integer y = 716
integer width = 1815
integer height = 504
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// 담당자별
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
This.SelectRow(0, FALSE)
This.SelectRow( row, NOT This.IsSelected( row ) )

end event

event doubleclicked;// 담당자별
string ls_salesman, ls_itemno, ls_itemnm, ls_title, ls_cost, ls_value, ls_inside
long   ll_row, ll_col, ll_value, ll_price
date   ld_sdate, ld_edate

// 내부업체
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

// 제목보여주기 
ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )

// 출고가 이전컬럼 클릭시 
if ll_col < 3 then RETURN		// @col
ls_value  = string( this.GetItemNumber( ll_row, ll_col), "#,##0.00" )
ls_cost   = string( this.GetItemNumber( ll_row, 2 ), "#,##0" )
if isnull(ls_value) OR ls_value = "" then RETURN

ls_title  = WF_CrossTab_Title( this, ll_row, ll_col )
//MessageBox("확인", ls_title + "~n~n" + "   출고가: " + ls_cost + "~n~n환산수량: " + ls_value )

SELECT user_id INTO :ls_salesman FROM login WHERE user_name = :ls_title AND use_flag = 'Y';

ls_itemnm = this.object.item_name[ll_row]
SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;

ll_price  = long(ls_cost)

ld_sdate  = date(em_1.text)
ld_edate  = date(em_2.text)

dw_8.reset()
dw_8.retrieve( ls_salesman, ls_itemnm, ll_price, ld_sdate, ld_edate, ls_inside )

end event

type cbx_user from checkbox within w_oidopricechk_r
integer x = 2926
integer y = 404
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "담당자별"
end type

event clicked;//
if this.checked = true then
	cbx_dono.enabled = false
	cbx_item.enabled = false
	cbx_sum.enabled  = false
	cbx_minprice.enabled = false

	cbx_basic.enabled = true
	cbx_fix.enabled   = true
	
	dw_1.visible = false

	dw_7.visible = true	
	dw_8.visible = true
	dw_9.visible = true
else
	cbx_dono.enabled  = true
	cbx_item.enabled  = true
	cbx_sum.enabled   = true
	cbx_minprice.enabled = true

	cbx_basic.enabled = false
	cbx_fix.enabled   = false
	cbx_fix.checked   = false
	dw_7.object.datawindow.horizontalscrollsplit = "0"

	dw_1.visible = true

	dw_7.visible = false
	dw_8.visible = false
	dw_9.visible = false
end if

end event

type dw_8 from datawindow within w_oidopricechk_r
integer x = 2080
integer y = 1096
integer width = 1815
integer height = 424
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_list2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

////
//This.SelectRow(0, FALSE)
//This.SelectRow( row, NOT This.IsSelected( row ) )


end event

type cbx_inside from checkbox within w_oidopricechk_r
integer x = 3351
integer y = 112
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "내부업체 제외"
end type

type dw_6 from datawindow within w_oidopricechk_r
integer x = 233
integer y = 1600
integer width = 3904
integer height = 460
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_list3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type dw_10 from datawindow within w_oidopricechk_r
integer x = 210
integer y = 172
integer width = 101
integer height = 76
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_ct1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_sum from checkbox within w_oidopricechk_r
integer x = 2926
integer y = 340
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출평균"
end type

event clicked;// 매출평균
string   ls_fromday, ls_lastday
datetime ld_fromday, ld_lastday

if this.checked = true then
	cbx_dono.enabled = false
	cbx_item.enabled = false
	cbx_user.enabled = false
	cbx_minprice.enabled = false
	
	cbx_basic.enabled = true
	cbx_fix.enabled   = true
	
	dw_1.visible = false
	dw_6.visible = true

	SELECT top 1 DATEAdd(Month, -6, getdate() ), DATEAdd( day, -day(getdate()), getdate() ) 
	  INTO :ld_fromday, :ld_lastday 
	  FROM login;
	ls_fromday   = string(ld_fromday, "yyyy/mm/01")
	ls_lastday   = string(ld_lastday, "yyyy/mm/dd")
	
	em_1.text    = ls_fromday
	em_2.text    = ls_lastday
else
	cbx_dono.enabled = true
	cbx_item.enabled = true
	cbx_user.enabled = true
	cbx_minprice.enabled = true

	cbx_basic.enabled = false
	cbx_fix.enabled   = false
	
	em_1.text = string(today(),"yyyy/mm/01")
	em_2.text = string(today(),"yyyy/mm/dd")

	dw_1.visible = true
	dw_6.visible = false
end if

end event

type dw_11 from datawindow within w_oidopricechk_r
integer x = 329
integer y = 172
integer width = 101
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_r2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_oidopricechk_r
integer x = 2395
integer y = 240
integer width = 233
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "1 개월"
end type

event clicked;//
datetime ldt_sdate, ldt_edate, ldt_date

SELECT top 1 DateAdd(month, -1, getdate()) INTO :ldt_sdate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")

ldt_date  = datetime( date(em_1.text), time("00:00:00.000") )
SELECT top 1 dbo.UF_GetLastDate( DateAdd(Month, 0, :ldt_date) ) 
  INTO :ldt_edate
  FROM login;

em_2.text = string(ldt_edate, "yyyy/mm/dd")


end event

type cb_7 from commandbutton within w_oidopricechk_r
integer x = 2633
integer y = 240
integer width = 233
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "2 개월"
end type

event clicked;//
datetime ldt_sdate, ldt_edate, ldt_date

SELECT top 1 DateAdd(month, -2, getdate()) INTO :ldt_sdate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")

ldt_date  = datetime( date(em_1.text), time("00:00:00.000") )
SELECT top 1 dbo.UF_GetLastDate( DateAdd(Month, 1, :ldt_date) ) 
  INTO :ldt_edate
  FROM login;

em_2.text = string(ldt_edate, "yyyy/mm/dd")


end event

type cb_8 from commandbutton within w_oidopricechk_r
integer x = 2871
integer y = 240
integer width = 233
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "3 개월"
end type

event clicked;//
datetime ldt_sdate, ldt_edate, ldt_date

SELECT top 1 DateAdd(month, -3, getdate()) INTO :ldt_sdate FROM login;

em_1.text = string(ldt_sdate,"yyyy/mm/01")

ldt_date  = datetime( date(em_1.text), time("00:00:00.000") )
SELECT top 1 dbo.UF_GetLastDate( DateAdd(Month, 2, :ldt_date) ) 
  INTO :ldt_edate
  FROM login;

em_2.text = string(ldt_edate, "yyyy/mm/dd")


end event

type cb_9 from commandbutton within w_oidopricechk_r
integer x = 3109
integer y = 240
integer width = 178
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "당월"
end type

event clicked;//
em_1.text = string(today(),"yyyy/mm/01")
em_2.text = string(today(),"yyyy/mm/dd")


end event

type dw_12 from datawindow within w_oidopricechk_r
integer x = 462
integer y = 172
integer width = 101
integer height = 76
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_rr"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_popup from commandbutton within w_oidopricechk_r
integer x = 1792
integer y = 372
integer width = 69
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "*"
end type

event clicked;//		
m_dwgrid_popup NewMenu
string  ls_sort, ls_filter
integer li_int, li_rtn

NewMenu = CREATE m_dwgrid_popup

GS_SortFilter = ""
li_int = NewMenu.m_popup.PopMenu(ParentWindow().PointerX(), ParentWindow().PointerY())

choose case is_dw
	case "dw_1"
		GDW_Client  = dw_1
	case "dw_2"
		GDW_Client  = dw_2
	case "dw_5"
		GDW_Client  = dw_5
	case "dw_6"
		GDW_Client  = dw_6
	case "dw_7"
		GDW_Client  = dw_7
	case ""
		MessageBox("확인","작업할 대상을 먼저 선택하시기 바랍니다.")
end choose

choose case GS_SortFilter
	case "m_originalsort"
		GS_Sort = IS_Original_Sort
		GDW_Client.SetSort(GS_Sort)
		GDW_Client.Sort()

	case "m_originalfilter"
		ls_filter = GS_Filter		// IS_Original_Filter
		GDW_Client.SetFilter(ls_filter)
		GDW_Client.Filter()
		GDW_Client.Sort()

	case "m_specifysort"
		SetNull(ls_sort)
		li_rtn = GDW_Client.SetSort(ls_sort)
		if li_rtn = 1 then
			GS_Sort = GDW_Client.Describe("Datawindow.Table.Sort")
			GDW_Client.Sort()
		end if

	case "m_specifyfilter"
		GDW_Client.SetRedraw(True)
		SetNull(ls_filter)
		li_rtn = GDW_Client.SetFilter(ls_filter)
		if li_rtn = 1 then
			GDW_Client.Filter()
			GDW_Client.Sort()
		end if
				
	case "m_print"
		GDW_Client.Print()
		
	case "m_saveas"
		GDW_Client.SetRedraw(True)
		GDW_Client.SaveAs()
end choose

end event

type cb_del from commandbutton within w_oidopricechk_r
integer x = 3730
integer y = 348
integer width = 261
integer height = 104
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "행삭제"
end type

event clicked;// 행삭제
long  ll_row

ll_row  = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then RETURN

dw_2.DeleteRow( ll_row )

end event

type dw_13 from datawindow within w_oidopricechk_r
integer x = 233
integer y = 724
integer width = 1815
integer height = 504
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidocustprice_ct"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//This.ScrollToRow( row )

//
choose case dwo.name
	case "user_name", "cust_name"
		This.SelectRow(0, FALSE)
		
	case else
		This.SelectRow(0, FALSE)
		This.SelectRow( row, NOT This.IsSelected( row ) )
end choose

end event

event doubleclicked;// 담당자별
string   ls_salesman, ls_itemno, ls_itemnm, ls_custnm, ls_custno, ls_value, ls_inside
long     ll_row, ll_col, ll_value, ll_price
datetime ldt_sdate, ldt_edate

// 담당자
dw_3.accepttext()
ls_salesman    = dw_3.object.user[1]
if isnull(ls_salesman) OR ls_salesman = "" then ls_salesman = "%"
if ls_salesman = "%" then
	if MessageBox("확인", "전체 조회시 많은 시간이 소요됩니다. 계속 하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then
		RETURN
	end if
end if

// 내부업체
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "%"
end if

// 제목보여주기 
ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )

if ll_col > 2 then
	ll_value = Mod(ll_col, 2)
	if ll_value = 0 then
		ll_col = ll_col - 1
	end if
end if

// 거래처 
ls_custnm = this.object.cust_name[ll_row]
SELECT cust_no INTO :ls_custno FROM customer WHERE cust_name = :ls_custnm;

// 출고가 이전컬럼 클릭시 
if ll_col < 3 then RETURN		// @col
ls_value  = string( this.GetItemNumber( ll_row, ll_col), "#,##0.00" )
if isnull(ls_value) OR ls_value = "" then RETURN

ls_itemnm  = WF_CrossTab_Title2( this, ll_row, ll_col )
//MessageBox("확인", ls_itemnm + "~n~n" + "최저가: " + ls_value )

SELECT item_no INTO :ls_itemno FROM groupitem WHERE item_name = :ls_itemnm;

ldt_sdate  = DateTime( Date(em_1.text), Time("00:00:00") )
ldt_edate  = DateTime( Date(em_2.text), Time("00:00:00") )

dw_5.reset()
dw_5.retrieve( ls_custno, "%", ls_itemno, ldt_sdate, ldt_edate )

end event

type cbx_minprice from checkbox within w_oidopricechk_r
integer x = 2542
integer y = 340
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "판매단가"
end type

event clicked;// 판매단가
if this.checked = true then
	cbx_inside.enabled = true
   cb_del.enabled     = true
	cbx_fix.enabled    = true
	
	cbx_dono.enabled = false
	cbx_user.enabled = false
	cbx_sum.enabled  = false
	cbx_item.enabled = false
	
	dw_1.visible = false
	
	dw_2.visible = false	
	dw_9.visible = false
	
	dw_13.visible = true
	dw_5.visible  = true
else
	cbx_inside.enabled = false
	cb_del.enabled     = false
	cbx_fix.enabled    = false

	cbx_dono.enabled = true
	cbx_user.enabled = true
	cbx_sum.enabled  = true
	cbx_item.enabled = true
	
	dw_1.visible = true

	dw_2.visible = false
	dw_9.visible = false

	dw_13.visible = false
	dw_5.visible  = false
end if

dw_5.reset()

end event

type dw_9 from datawindow within w_oidopricechk_r
integer x = 4773
integer y = 36
integer width = 1143
integer height = 268
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_price"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_oidopricechk_r
integer x = 233
integer y = 1096
integer width = 1815
integer height = 412
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidopricechk_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type gb_4 from groupbox within w_oidopricechk_r
integer x = 2080
integer y = 16
integer width = 1216
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type gb_5 from groupbox within w_oidopricechk_r
integer x = 3314
integer y = 16
integer width = 594
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

