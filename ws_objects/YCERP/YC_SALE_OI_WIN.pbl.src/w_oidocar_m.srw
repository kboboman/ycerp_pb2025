$PBExportHeader$w_oidocar_m.srw
$PBExportComments$거래명세서작성(2003/09/08,이인호)
forward
global type w_oidocar_m from w_inheritance
end type
type st_4 from statictext within w_oidocar_m
end type
type ddlb_fld from dropdownlistbox within w_oidocar_m
end type
type ddlb_dwtitles from dropdownlistbox within w_oidocar_m
end type
type st_5 from statictext within w_oidocar_m
end type
type sle_value from singlelineedit within w_oidocar_m
end type
type cb_1 from commandbutton within w_oidocar_m
end type
type cb_2 from commandbutton within w_oidocar_m
end type
type cb_3 from commandbutton within w_oidocar_m
end type
type cb_5 from commandbutton within w_oidocar_m
end type
type st_1 from statictext within w_oidocar_m
end type
type dw_area from datawindow within w_oidocar_m
end type
type em_1 from editmask within w_oidocar_m
end type
type em_2 from editmask within w_oidocar_m
end type
type st_2 from statictext within w_oidocar_m
end type
type dw_3 from datawindow within w_oidocar_m
end type
type dw_4 from datawindow within w_oidocar_m
end type
type st_vertical from u_splitbar_vertical within w_oidocar_m
end type
type ddlb_op from dropdownlistbox within w_oidocar_m
end type
type dw_5 from datawindow within w_oidocar_m
end type
type st_horizontal2 from u_splitbar_horizontal within w_oidocar_m
end type
type st_horizontal from u_splitbar_horizontal within w_oidocar_m
end type
type dw_6 from datawindow within w_oidocar_m
end type
type st_vertical2 from u_splitbar_vertical within w_oidocar_m
end type
type st_3 from statictext within w_oidocar_m
end type
type st_6 from statictext within w_oidocar_m
end type
type st_7 from statictext within w_oidocar_m
end type
type gb_4 from groupbox within w_oidocar_m
end type
end forward

global type w_oidocar_m from w_inheritance
integer x = 5
integer y = 84
integer width = 6670
integer height = 2436
string title = "배차계획 관리(w_oidocar_m)"
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
st_1 st_1
dw_area dw_area
em_1 em_1
em_2 em_2
st_2 st_2
dw_3 dw_3
dw_4 dw_4
st_vertical st_vertical
ddlb_op ddlb_op
dw_5 dw_5
st_horizontal2 st_horizontal2
st_horizontal st_horizontal
dw_6 dw_6
st_vertical2 st_vertical2
st_3 st_3
st_6 st_6
st_7 st_7
gb_4 gb_4
end type
global w_oidocar_m w_oidocar_m

type variables
string is_dw, is_reqdate, is_car_no, is_sceneno
DataWindowChild idwc_area, idwc_car
long i_row

end variables

forward prototypes
public subroutine wf_weight (string as_itemno, string as_qa, string as_uom, long al_row)
public subroutine wf_multi_select (datawindow a_dw, long al_row)
end prototypes

public subroutine wf_weight (string as_itemno, string as_qa, string as_uom, long al_row);// 구분, 폭, 비중, 중량, 단중
string  ls_gbn, ls_item_no,ls_qa, ls_uom
decimal ldc_width, ldc_rate, ldc_heft, ldc_weight, ldc_qty
real    ll_dan,    ll_jung
long    ll_row

//debugbreak()

ls_item_no   = as_itemno	// this.object.item_no[row]
ls_qa        = as_qa			// this.object.qa[row]
ls_uom       = as_uom		// this.object.uom[row]
ll_row       = al_row
ldc_qty      = dw_4.object.issue_qty[ll_row] /*qty->issue_qty 2018.09.04 jowonsuk */

if ls_uom = "M" then
	// 생산관리 - 품목별 코일규격관리에서 등록함
	SELECT top 1 gbn = substring(itemcoil.coil_item,3,1), itemcoil.width, itemcoil.weight
	  INTO :ls_gbn, :ldc_width, :ldc_weight
	  FROM itemcoil
	 WHERE item_no = :ls_item_no AND qa = left(:ls_qa, 13);

	SELECT top 1 (case when :ls_gbn = 'A' then al_rate
							 when :ls_gbn = 'S' then st_rate
							 else ''
					  end)
	  INTO :ldc_rate
	  FROM globals;
	
	if ldc_weight > 0 then
		ll_dan  = ldc_weight * ldc_rate
		ll_jung = ldc_weight * ldc_rate * long(ldc_qty)
	else
		ll_dan  = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate
		ll_jung = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate * long(ldc_qty)
	end if
	//dw_4.object.danjung[ll_row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
	dw_4.object.jungrang[ll_row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
	
//	if ldc_width = 0 then // ITEMCOIL에 없으면
//		// 물품코드관리-단위당 중량 설정한 item
//		SELECT TOP 1 heft INTO :ldc_heft
//		  FROM ITEM
//		 WHERE ITEM_NO = :ls_item_no AND QA = :ls_qa AND UOM = :ls_uom;
//
//		ll_dan  = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate
//		ll_jung = long(left(ls_qa,3)) * 0.01 * ldc_width * long(right(trim(ls_qa),5)) * ldc_rate * long(data)
//		this.object.danjung[row]  = truncate(ll_dan  * 0.000001 + 0.0000001, 2)
//		this.object.jungrang[row] = truncate(ll_jung * 0.000001 + 0.0000001, 2)
//	end if			 
end if      

end subroutine

public subroutine wf_multi_select (datawindow a_dw, long al_row);//**************************************//
// 함수명 : wf_multi_select
// 전달값 : a_dw(datawindow),al_row(현재row)
// 
// 이 함수를 해당 Datawindow의 Clicked Event에서 부르면 됩니다.
// Clicked Event Script
// 
// if row < 1 then return
// wf_multi_select(this,row)
// 
//**************************************//

long  w_selrow, i

if al_row <= 0 then return

if keydown(keyshift!)then
   w_selrow = a_dw.GetSelectedRow(0)
   if w_selrow > 0 then
      for i = min(w_selrow,al_row) to max(w_selrow, al_row)
         a_dw.SelectRow(i, true)
			a_dw.object.chk[i] = "Y"			
      next
   else
		a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = "Y"			
   end if
elseif keydown(KeyControl!) then
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(al_row, false)
		a_dw.object.chk[al_row] = "N"			
   else
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = "Y"
   end if
 else
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(0, false)
		a_dw.object.chk[al_row] = "N"			
   else
      a_dw.SelectRow(0,false)
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = "Y"			
   end if
 end if  
//**************************************//

end subroutine

on w_oidocar_m.create
int iCurrent
call super::create
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.st_1=create st_1
this.dw_area=create dw_area
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.dw_5=create dw_5
this.st_horizontal2=create st_horizontal2
this.st_horizontal=create st_horizontal
this.dw_6=create dw_6
this.st_vertical2=create st_vertical2
this.st_3=create st_3
this.st_6=create st_6
this.st_7=create st_7
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.dw_area
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.em_2
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.st_vertical
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.dw_5
this.Control[iCurrent+20]=this.st_horizontal2
this.Control[iCurrent+21]=this.st_horizontal
this.Control[iCurrent+22]=this.dw_6
this.Control[iCurrent+23]=this.st_vertical2
this.Control[iCurrent+24]=this.st_3
this.Control[iCurrent+25]=this.st_6
this.Control[iCurrent+26]=this.st_7
this.Control[iCurrent+27]=this.gb_4
end on

on w_oidocar_m.destroy
call super::destroy
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.dw_5)
destroy(this.st_horizontal2)
destroy(this.st_horizontal)
destroy(this.dw_6)
destroy(this.st_vertical2)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.gb_4)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
is_car_no = ''
i_row      = 0
	
///////////////////////////////////////////////////////////////////////////////////////////////////
// register objects with vertical splitbar
st_vertical.of_set_leftobject(dw_1)
st_vertical.of_set_rightobject(dw_4)
st_vertical.of_set_rightobject(dw_5)
st_vertical.of_set_rightobject(dw_2)
st_vertical.of_set_minsize(250, 250)


st_vertical2.of_set_leftobject(dw_4)
st_vertical2.of_set_leftobject(dw_5)
st_vertical2.of_set_rightobject(dw_3)
st_vertical2.of_set_minsize(250, 250)

st_horizontal.of_set_topobject(dw_4)
st_horizontal.of_set_bottomobject(dw_5)
st_horizontal.of_set_minsize(250, 250)

st_horizontal2.of_set_topobject(dw_5)
st_horizontal2.of_set_topobject(dw_3)
st_horizontal2.of_set_bottomobject(dw_2)
st_horizontal2.of_set_minsize(250, 250)

//st_horizontal1.of_set_bottomobject(dw_3)
//st_horizontal1.of_set_minsize(250, 250)

// register objects with horizontal splitbar
///////////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_6.visible  = false 			

dw_3.settransobject( SQLCA )
dw_4.settransobject( SQLCA )
dw_5.settransobject( SQLCA )
dw_6.settransobject( SQLCA )

// 사업장 
string ls_area
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")
idwc_area.accepttext()

ls_area = gs_area
dw_area.object.area[1] = ls_area

long  ll_row

dw_5.insertrow(0)


// 배차일자
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

dw_1.Object.DataWindow.Color = gl_dw_backcolorInit
dw_2.Object.DataWindow.Color = gl_dw_backcolorInit
dw_3.Object.DataWindow.Color = gl_dw_backcolorInit
dw_4.Object.DataWindow.Color = gl_dw_backcolorInit
dw_5.Object.DataWindow.Color = gl_dw_backcolorInit

//if GF_Permission("배차계획 관리(배차)", gs_userid) = "Y" then
//	dw_5.object.car_text.protect = 1	
//	dw_5.object.car_text.background.color = GL_DW_BackColorInit
//	
//elseif GF_Permission("배차계획 관리(전달사항)", gs_userid) = "Y" then
//	dw_2.object.car_no.protect = 1
//	dw_2.object.driver_name.protect = 1	
//	dw_2.object.driver_tel.protect = 1		
//	dw_2.object.car_gbn.protect = 1			
//	dw_2.object.st_car_amt.protect = 1	
//	dw_2.object.ship_amount.protect = 1		
//	dw_2.object.car_no.background.color = GL_DW_BackColorInit
//	dw_2.object.driver_name.background.color = GL_DW_BackColorInit
//	dw_2.object.driver_tel.background.color = GL_DW_BackColorInit
//	dw_2.object.car_gbn.background.color = GL_DW_BackColorInit
//	dw_2.object.st_car_amt.background.color = GL_DW_BackColorInit
//	dw_2.object.ship_amount.background.color = GL_DW_BackColorInit	
//end if










end event

event resize;call super::resize;//
long  ll_height

gb_3.width  = newwidth  - (gb_3.x * 2)

ll_height   = newheight - dw_1.y - gb_3.x
dw_1.height = ll_height


st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = ll_height

dw_4.x      = st_vertical.x + st_vertical.width
dw_4.width  = (newwidth  - dw_4.x - 32)/5*3 - 230
dw_4.height = ll_height / 3

st_horizontal.y     = dw_4.y + dw_4.height
st_horizontal.width = dw_4.width                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

dw_5.x      = st_vertical.x + st_vertical.width
dw_5.width  = (newwidth  - dw_5.x - 32)/5*3 - 230
dw_5.y = st_horizontal.y + st_horizontal.height

st_horizontal2.x     = st_vertical.x + st_vertical.width
st_horizontal2.y     = dw_5.y + dw_5.height
st_horizontal2.width = dw_5.width 

st_vertical2.x      = dw_4.x + dw_4.width
st_vertical.height = dw_5.height + dw_4.height + st_horizontal.height

dw_3.x    = st_vertical2.x + st_vertical2.width
dw_3.height = dw_5.height + dw_4.height + st_horizontal.height


dw_2.x      = st_vertical.x + st_vertical.width
dw_2.y        = st_horizontal2.y + st_horizontal2.height
dw_2.width  = newwidth  - dw_2.x - 32
dw_2.height = ll_height - dw_5.height - dw_4.height - st_horizontal.height - st_horizontal2.height
dw_3.width = dw_2.width - dw_5.width - st_vertical.width

end event

type pb_save from w_inheritance`pb_save within w_oidocar_m
integer x = 4133
integer y = 64
integer taborder = 40
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string   ls_custno, ls_sceneno, ls_custscene, ls_destination, ls_contents, ls_cargubun, ls_car_text
string   ls_area, ls_userid, ls_msg, ls_cardate, ls_car_no, ls_car_kind, ls_driver_name, ls_driver_tel
long     ll_row, ll_cnt,  ll_id, ll_pid,  l_count
time     lt_cartime
datetime ldt_cardate, ldt_now
integer  li_ret
dwItemStatus l_status

dw_2.accepttext()
dw_5.accepttext()

debugbreak()


if GF_Permission("배차계획 관리", gs_userid) = "Y" then

	for ll_row = 1 to dw_2.rowcount()
			
		l_status = dw_2.GetItemStatus(ll_row, 0, Primary!)
		
		IF l_status = newModified! OR l_status = new! THEN
			
			if dw_2.object.car_no[ll_row]   = '' or 	isnull(dw_2.object.car_no[ll_row]) then
				messagebox('오류', '차량번호는 필수 입력사항입니다.')
				dw_2.scrolltorow( ll_row )
				dw_2.setcolumn( "car_no" )
				dw_2.setfocus()
				return 0
			end if
			
			if dw_2.object.driver_tel[ll_row]   = '' or 	isnull(dw_2.object.driver_tel[ll_row]) then
				messagebox('오류', '운전자 연락처는  필수 입력사항입니다.')
				dw_2.scrolltorow( ll_row )
				dw_2.setcolumn( "driver_tel" )
				dw_2.setfocus()
				return	0		
			end if
			
			if dw_2.object.car_gbn[ll_row]   = '' or 	isnull(dw_2.object.car_gbn[ll_row]) then
				messagebox('오류', '구분은  필수 입력사항입니다.')
				dw_2.scrolltorow( ll_row )
				dw_2.setcolumn( "car_gbn" )
				dw_2.setfocus()
				return	0		
			end if		
			
			if dw_2.object.driver_name[ll_row]   = '' or 	isnull(dw_2.object.driver_name[ll_row]) then
				messagebox('오류', '운전자 이름은  필수 입력사항입니다.')
				dw_2.scrolltorow( ll_row )
				dw_2.setcolumn( "driver_name" )
				dw_2.setfocus()
				return	0		
			end if		
			
//			if dw_2.object.st_car_amt[ll_row]   = 0 or 	isnull(dw_2.object.st_car_amt[ll_row]) then
//				messagebox('오류', '표준운송비는  필수 입력사항입니다.')
//				dw_2.scrolltorow( ll_row )
//				dw_2.setcolumn( "st_car_amt" )
//				dw_2.setfocus()
//				return	0	
//			end if				
			
//			if dw_2.object.ship_amount[ll_row]   = 0 or 	isnull(dw_2.object.ship_amount[ll_row]) then
//				messagebox('오류', '실운송비는  필수 입력사항입니다.')
//				dw_2.scrolltorow( ll_row )
//				dw_2.setcolumn( "ship_amount" )
//				dw_2.setfocus()
//				return	0		
//			end if				
			
		end if
	
		ls_car_no = dw_2.object.car_no[ll_row]
		ls_driver_tel = dw_2.object.driver_tel[ll_row]		
		ls_driver_name = dw_2.object.driver_name[ll_row]				
		ls_car_kind = dw_2.object.car_gbn[ll_row]
		dw_2.object.car_status[ll_row] = '01'  /* 01: 배차전송가능, 02: pda배차확정, 03: 송장발행, 04:엑셀작성(재무) 2019.03.29 jowonsuk  현재는 무조건 확정 */
		
		l_count = 0
		
		SELECT count(*)
		into :l_count
		FROM car_info
		WHERE DRIVER = :ls_car_no;	
		
		
		if l_count > 0 then
		/* 업데이트 로직 제외, jowonsuk  2019.03.28 배차리스트 수정시에 수정하는걸로 변경하며, 차량정보 업데이트 선별 예정	
			update docar
				set HP = :ls_driver_tel,
					 CAR_KIND = :ls_car_kind,
					 NAME  = :ls_driver_name,
					 sys_date = getdate()
			where driver = :ls_car_no;
		*/				
		else
			
			insert into car_info  (DRIVER,                     NAME,    CARGO_NAME,      INOUT,      REM,                       HP,     OPEN_CLOSE,  ICUBE_NO,     SYS_DATE, CAR_COMPANY,        CAR_KIND,           owner_name,       owner_tel)
			    values ( :ls_car_no,  :ls_driver_name,                      '시화',                 'I',         null,        :ls_driver_tel,                          'O',                null,          getdate(),                        null,    :ls_car_kind,       :ls_driver_name,   :ls_driver_tel );  
			
		end if			
	
	next
	
	wf_update1( dw_2, "N" )	
	
	if dw_2.rowcount() = 0 then
		dw_1.object.car_count[i_row] = ''
	else
		dw_1.object.car_count[i_row] = string(dw_2.rowcount())
	end if
	
	l_status = dw_5.GetItemStatus(1, 0, Primary!)
	
	IF l_status = newModified! OR l_status = new! THEN
		ls_car_text = dw_5.object.car_text[1]
		if trim(ls_car_text) = '' or isnull(ls_car_text) then
		else
			dw_5.object.cardate[1] = is_reqdate
			dw_5.object.car_seq[1] = 1
			dw_5.object.scene_code[1] =  is_sceneno	
			
			wf_update1( dw_5,  "N" )
			
			  dw_1.object.car_message[i_row] = '작성'			
					
		end if
		
	elseif l_status = DataModified! then
		wf_update1( dw_5,  "N" )
		
		dw_1.object.car_message[i_row] = '작성'
		
	END IF
	
		

	datawindowchild idwc_car_no	
	
	dw_2.getchild("car_no", idwc_car_no)
//	ls_clause = " and item.item_no = ~~'" + ls_str + "~~'" 
//	ls_where  = "DataWindow.Table.Select='"  + is_select + ls_clause + "'"
//	idwc_car_no.Modify(ls_where)
	idwc_car_no.settransobject(sqlca)
	idwc_car_no.retrieve()
	
	Messagebox('알림', '저장되었습니다.')
		
  end if	



return 1




end event

type dw_1 from w_inheritance`dw_1 within w_oidocar_m
integer x = 32
integer y = 440
integer width = 3131
integer height = 1760
integer taborder = 60
string dataobject = "d_oicarintervals"
boolean hsplitscroll = true
end type

event dw_1::clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if this.rowcount() <= 0 then return


This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)


string ls_custno, ls_sceneno, ls_area, ls_itemno, ls_qa, ls_uom
string ls_salesman, ls_reqdate, ls_shipto_addr
long   ll_row, l_req_seq
datetime l_req_date

dw_area.accepttext()
ls_area    = dw_area.object.area[1]

ls_custno  = this.object.cust_no[row]
is_sceneno = this.object.scene_code[row]

l_req_date = this.object.req_date[row]
is_reqdate = this.object.reqdate[row]
ls_shipto_addr = this.object.scene_addr[row]
st_3.text = ls_shipto_addr
//ls_salesman = this.object.salesman[row]
//l_req_seq = this.object.req_seq[row]
i_row      = row



if isnull(ls_custno) OR ls_custno = "" then RETURN

//dw_2.retrieve( ls_custno, ls_sceneno, date(em_1.text) )
//
//if dw_2.rowcount() < 1 then
//	dw_2.insertrow( 0 )
//	dw_2.object.car_custno[1]  = ls_custno
//	dw_2.object.car_scene[1]   = ls_sceneno
//	dw_2.object.cardate[1]     = ld_cardate
//	dw_2.object.area_no[1]     = ls_area
//end if

//dw_3.retrieve( ls_custno, ls_sceneno, date(em_1.text) )
dw_2.reset()
dw_3.reset()
dw_4.reset()
dw_5.reset()


dw_4.retrieve( ls_area, l_req_date, is_sceneno )
dw_2.retrieve( is_reqdate, is_sceneno )

ll_row = 0

ll_row = dw_5.retrieve( is_reqdate, is_sceneno )

if ll_row = 0 then
	dw_5.insertrow(0)
end if
 
 



end event

event dw_1::getfocus;call super::getfocus;//
//this.Object.DataWindow.Color = gl_dw_backcolor

end event

event dw_1::losefocus;call super::losefocus;//
//this.Object.DataWindow.Color = gl_dw_backcolorInit

end event

type st_title from w_inheritance`st_title within w_oidocar_m
integer x = 41
integer width = 1143
integer height = 136
string text = "배차계획 관리"
end type

type st_tips from w_inheritance`st_tips within w_oidocar_m
end type

type pb_compute from w_inheritance`pb_compute within w_oidocar_m
boolean visible = false
integer x = 2240
integer y = 40
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidocar_m
boolean visible = false
integer taborder = 30
end type

type pb_close from w_inheritance`pb_close within w_oidocar_m
integer x = 4320
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;Close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oidocar_m
boolean visible = false
integer x = 3227
integer y = 720
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_oidocar_m
integer x = 3936
integer y = 64
integer taborder = 120
end type

event pb_cancel::clicked;//
dw_3.reset()
dw_5.reset()


end event

type pb_delete from w_inheritance`pb_delete within w_oidocar_m
integer x = 3744
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;
long  ll_row  
string ls_sdate, ls_edate

ls_sdate = MidA(em_1.text,1,4) + MidA(em_1.text,6,2) +  MidA(em_1.text,9,2)
ls_edate = MidA(em_2.text,1,4) + MidA(em_2.text,6,2) +  MidA(em_2.text,9,2)

if is_dw = 'dw_5'  then
	
	ll_row  = dw_5.getrow()
	
	dw_5.deleterow( ll_row )			
	
     wf_update1( dw_5, "Y" )	
	  
	dw_5.insertrow(0)	  
	
	dw_1.object.car_message[i_row] = ''
	
else
	
	ll_row  = dw_2.getrow()
	
	dw_2.deleterow( ll_row )		
	
     wf_update1( dw_2, "Y" )		
	  
	if dw_2.rowcount() = 0 then
		dw_1.object.car_count[i_row] = ''
	else
		dw_1.object.car_count[i_row] = string(dw_2.rowcount())
	end if
	  
//	dw_2.retrieve( is_reqdate, is_sceneno )		  

end if









end event

type pb_insert from w_inheritance`pb_insert within w_oidocar_m
integer x = 3552
integer y = 64
end type

event pb_insert::clicked;call super::clicked;long  ll_row

ll_row = 0

//if is_dw = 'dw_5'  then
//
//	ll_row = dw_5.insertrow( 0 )
//
//	dw_5.reset()
//	
//	dw_5.object.cardate[ll_row] = is_reqdate
//	dw_5.object.car_seq[ll_row] = ll_row
//	dw_5.object.scene_code[ll_row] =  is_sceneno
//	
//	dw_5.scrolltorow( ll_row )
//	dw_5.setcolumn( "car_text" )
//	dw_5.setfocus()	
//	
//else
	
	ll_row = dw_2.insertrow( 0 )
	
	dw_2.object.cardate[ll_row] = is_reqdate
	dw_2.object.car_seq[ll_row] = ll_row
	dw_2.object.scene_code[ll_row] =  is_sceneno
	
	//dw_2.object.cartime[ll_row] = datetime( date(now()), time(now()) )
	
	dw_2.scrolltorow( ll_row )
	dw_2.setcolumn( "car_no" )
	dw_2.setfocus()	
//end if




end event

type pb_retrieve from w_inheritance`pb_retrieve within w_oidocar_m
event ue_1 pbm_custom01
integer x = 3360
integer y = 64
integer taborder = 10
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
string ls_area, ls_sdate, ls_edate
date   ld_sdate, ld_edate
long   ll_row

dw_2.reset() ; dw_3.reset() ; dw_4.reset();

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)


ls_sdate = MidA(em_1.text,1,4) + MidA(em_1.text,6,2) +  MidA(em_1.text,9,2)
ls_edate = MidA(em_2.text,1,4) + MidA(em_2.text,6,2) +  MidA(em_2.text,9,2)


dw_1.retrieve( ls_area, ls_sdate, ls_edate )


//
//if dw_5.rowcount()  = 0  then
//	ll_row = dw_5.insertrow(0)
//	dw_5.object.cardate[ll_row] = string(now(), 'yyyymmdd' )
//end if
end event

type gb_3 from w_inheritance`gb_3 within w_oidocar_m
integer x = 32
integer y = 252
integer width = 4503
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
long textcolor = 8388608
end type

type gb_2 from w_inheritance`gb_2 within w_oidocar_m
integer x = 1929
integer y = 16
integer width = 599
integer height = 216
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_oidocar_m
integer x = 3319
integer y = 16
integer width = 1216
integer height = 216
integer taborder = 50
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidocar_m
integer x = 3186
integer y = 1680
integer width = 2459
integer height = 512
integer taborder = 70
string dataobject = "d_carriage_m2"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;string  ls_cardate, ls_car_no

is_dw   = this.classname()
st_7.text     = '차량배차'

if this.rowcount() <= 0 then return

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//ls_cardate = this.object.cardate[row]
//ls_car_no = this.object.car_no[row]

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)



end event

event dw_2::getfocus;call super::getfocus;//
//this.Object.DataWindow.Color = gl_dw_backcolor

end event

event dw_2::losefocus;call super::losefocus;//
//this.Object.DataWindow.Color = gl_dw_backcolorInit

end event

event dw_2::itemchanged;call super::itemchanged;string ls_car_master_name, ls_car_master_hp, ls_car_kind
long   l_count = 0


if dwo.name = 'car_no' then
	
	select count(car_no)
	into :l_count
	from car_carriage
	where cardate = :is_reqdate
	and scene_code = :is_sceneno
	and car_no = rtrim(ltrim(:data))
	and car_status in ( '01', '02' );	
	
	if l_count > 0 then
		messagebox('알림', '중복된 차량번호입니다. 등록이 불가합니다.')
		this.object.car_no[row] = ''
	else
		select  name car_master_name,  hp car_master_hp, car_kind
			into :ls_car_master_name, :ls_car_master_hp, :ls_car_kind
		from car_info
		where  driver = rtrim(ltrim(:data));
		
		this.object.driver_tel[row]	 =  ls_car_master_hp 
		this.object.car_gbn[row]    =  ls_car_kind
		this.object.driver_name[row]  = ls_car_master_name
		
	end if 

end if
end event

type st_4 from statictext within w_oidocar_m
integer x = 96
integer y = 324
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

type ddlb_fld from dropdownlistbox within w_oidocar_m
integer x = 283
integer y = 308
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

type ddlb_dwtitles from dropdownlistbox within w_oidocar_m
integer x = 325
integer y = 320
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

type st_5 from statictext within w_oidocar_m
integer x = 768
integer y = 324
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

type sle_value from singlelineedit within w_oidocar_m
integer x = 1257
integer y = 316
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

type cb_1 from commandbutton within w_oidocar_m
integer x = 1829
integer y = 316
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oidocar_m
integer x = 1993
integer y = 316
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oidocar_m
integer x = 2158
integer y = 316
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidocar_m
integer x = 2322
integer y = 316
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_1 from statictext within w_oidocar_m
integer x = 1966
integer y = 52
integer width = 526
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

type dw_area from datawindow within w_oidocar_m
integer x = 1966
integer y = 136
integer width = 526
integer height = 84
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.AcceptText()
 
end event

type em_1 from editmask within w_oidocar_m
integer x = 2555
integer y = 140
integer width = 366
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

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

////
//OpenWithParm(w_calendar, message.stringparm)
//if Message.StringParm <> "N" then
//	this.text = string(date(Message.StringParm))
//end if
//
end event

type em_2 from editmask within w_oidocar_m
integer x = 2921
integer y = 140
integer width = 366
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

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

////
//OpenWithParm(w_calendar, message.stringparm)
//if Message.StringParm <> "N" then
//	this.text = string(date(Message.StringParm))
//end if
//
end event

type st_2 from statictext within w_oidocar_m
integer x = 2555
integer y = 56
integer width = 731
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
string text = "의뢰일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_oidocar_m
integer x = 4421
integer y = 440
integer width = 1216
integer height = 1220
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "d_carriage_sale_r2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if this.rowcount() <= 0 then return

//This.SelectRow(0, FALSE)
//This.SelectRow(row, TRUE)

// 다중선택
//WF_MULTI_SELECT(this, row)


//This.Drag(Begin!)

//This.DragIcon = "hand.ico"



end event

event itemchanged;//
string   ls_getdate, ls_data, ls_item_no, ls_qa, ls_uom
datetime ldt_date
// 구분, 폭, 비중, 중량, 단중
string  lsr_gbn
decimal ldc_width, ldc_rate, ldc_heft, ldc_weight
real    lr_dan,    lr_jung

ls_getdate  = string(GF_Today(),"yyyy/mm/dd")

this.accepttext()

choose case dwo.name
	case "cartime"
		ls_data   = MidA(string(data),12,5)
		ldt_date  = datetime(date(ls_getdate), time(ls_data))		
		this.object.cartime[row] = ldt_date
	case "issue_qty"		
		
		ls_item_no = this.object.item_no[row]
		ls_qa      = this.object.qa[row]
		ls_uom     = this.object.uom[row]
			
		if ls_uom = "M" then
			SELECT top 1 gbn = substring(itemcoil.coil_item,3,1), itemcoil.width, itemcoil.weight
			  INTO :lsr_gbn, :ldc_width, :ldc_weight
			  FROM itemcoil with(nolock)
			 WHERE item_no = :ls_item_no AND qa = left(:ls_qa, 13);

			SELECT top 1 (case when :lsr_gbn = 'A' then al_rate
									 when :lsr_gbn = 'S' then st_rate
									 else ''
							  end)
			  INTO :ldc_rate
			  FROM globals with(nolock);

			if ldc_weight > 0 then
					lr_jung = ldc_weight * ldc_rate * long(data)
			else
				lr_jung = long(LeftA(ls_qa,3)) * 0.01 * ldc_width * long(RightA(trim(ls_qa),5)) * ldc_rate * long(data)
			end if
/*			this.object.danjung[row]  = truncate(lr_dan  * 0.000001 + 0.0000001, 2)*/
			this.object.jungrang[row] = truncate(lr_jung * 0.000001 + 0.0000001, 2)			

		elseif ls_uom = "EA" then
			SELECT top 1 heft INTO :ldc_heft
			  FROM item with(nolock)
			 WHERE item_no = :ls_item_no AND qa = :ls_qa AND uom = :ls_uom;

			lr_dan  = ldc_heft
			lr_jung = ldc_heft * long(data)
/*			this.object.danjung[row]  = lr_dan*/
			this.object.jungrang[row] = lr_jung
		end if      		
		
end choose

end event

event getfocus;//
//this.Object.DataWindow.Color = gl_dw_backcolor

end event

event losefocus;//
//this.Object.DataWindow.Color = gl_dw_backcolorInit

end event

event dragdrop;//If source=This Then  Return
//
//IF source.TypeOf() = DataWindow! THEN
//
//	DataWindow  Ldw
//	Integer Li_Row, l_row, l_rowcount, ll_chk
//	Ldw=source
//	
//	If row=0 Then
//		Li_Row=This.RowCount() + 1
//	Else
//		Li_Row=row
//	End If
//	
//	l_rowcount = Ldw.rowcount() 
//	
//	for l_row = 1 to l_rowcount
//
//		if Ldw.object.chk[l_row] = 'Y' then
//			Ldw.RowsCopy(l_row, l_row, Primary!, This, Li_Row, Primary!)
//			this.object.chk[Li_Row] = 'N'						
//			Li_Row = Li_Row + 1
//		end if			
//		
//	next
//	
//	ll_chk = 1
//	
//	for l_row = 1 to l_rowcount	
//		
//		if Ldw.object.chk[ll_chk] = 'Y' then
//			Ldw.RowsDiscard(ll_chk, ll_chk,  Primary!)
//		else
//			ll_chk  = ll_chk + 1
//		end if			
//		
//	next	
//	
//end if	
//
//Ldw.Drag(End!)
//
end event

event doubleclicked;//WF_MULTI_SELECT(this, row)
end event

type dw_4 from datawindow within w_oidocar_m
integer x = 3182
integer y = 440
integer width = 1216
integer height = 588
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oicarintervals_m3"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_salesman, ls_sale_no
long   l_req_seq
datetime l_req_date
is_dw   = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

if this.rowcount() <= 0 then return

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

// 다중선택
//WF_MULTI_SELECT(this, row)

//This.Drag(Begin!)

//This.DragIcon = "hand.ico"


l_req_date = this.object.req_date[row] 
ls_salesman = this.object.salesman[row] 
l_req_seq = this.object.req_seq[row]
ls_sale_no = this.object.sale_no[row]
st_3.text = this.object.sale_shipto_addr[row]

dw_3.reset()

dw_3.setredraw( false )
dw_3.visible    = true 
dw_3.bringtotop = true
dw_3.retrieve(l_req_date, ls_salesman, l_req_seq, ls_sale_no)
//dw_3.title = "출고의뢰량[ " + ls_sale_no + " ] "
dw_3.setredraw( true )



end event

event getfocus;//
//this.Object.DataWindow.Color = gl_dw_backcolor

end event

event losefocus;//
//this.Object.DataWindow.Color = gl_dw_backcolorInit

end event

event dragdrop;/*
string ls_item_no, ls_qa
DataWindow  Ldw
Integer Li_Row, l_row, l_rowcount, ll_chk, l_chk, ll_row

If source=This Then  Return

IF source.TypeOf() = DataWindow! THEN

	Ldw=source
	
	If row=0 Then
		Li_Row=This.RowCount() + 1
	Else
		Li_Row=row
	End If
	
	l_rowcount = Ldw.rowcount() 
	
	for l_row = 1 to l_rowcount

		if Ldw.object.chk[l_row] = 'Y' then
			
			ls_item_no = Ldw.object.item_no[l_row]
			ls_qa          =  Ldw.object.qa[l_row]
			
			l_chk = 0
			
			for ll_row = 1 to this.rowcount()
				
				if ls_item_no = this.object.item_no[ll_row] and  ls_qa = this.object.qa[ll_row] then
					l_chk= 1		
					exit
				else
					l_chk= 0					
				end if				
				
			next 
			
			if l_chk = 1 then
				this.object.issue_qty[l_row] = 0
			else /*컬럼이 없을때는 복사 */
				Ldw.RowsCopy(l_row, l_row, Primary!, This, Li_Row, Primary!)
				this.object.chk[Li_Row] = 'N'						
				Li_Row = Li_Row + 1				
			end if
						
		end if						
	next
	
	ll_chk = 1
	
	for l_row = 1 to l_rowcount	
		
		if Ldw.object.chk[ll_chk] = 'Y' then
//			Ldw.RowsDiscard(ll_chk, Ldw.DeletedCount(), Delete!)
//			Ldw.RowsDiscard(ll_chk, ll_chk,  Primary!)		
			Ldw.deleterow(ll_chk)		
		else
			ll_chk  = ll_chk + 1
		end if			
		
	next	

	
end if	

Ldw.Drag(End!)
*/
end event

event doubleclicked;WF_MULTI_SELECT(this, row)
end event

event rbuttondown;string ls_salesman, ls_sale_no
long   l_req_seq
datetime l_req_date

		dw_6.width  = dw_1.width *0.92
		dw_6.height = dw_1.height * 0.6
		dw_6.x      = dw_2.x + dw_2.x / 10
		dw_6.y      = dw_2.y	
		
//		dw_6.dataobject = 'd_iitemstock_m1_new' /*신규 장표 2018.08.29 jowonsuk */
//		dw_6.SetTransObject(sqlca)	
		
		dw_6.reset()
//		dw_6.title = "품목 일일수불 확인: [" + ls_locname+ "] " + ls_itemnm + " | " + ls_qa

	   l_req_date = this.object.req_date[row] 
	   ls_salesman = this.object.salesman[row] 
	   l_req_seq = this.object.req_seq[row]
	   ls_sale_no = this.object.sale_no[row]
		
		dw_6.setredraw( false )
		dw_6.visible    = true 
		dw_6.bringtotop = true
		dw_6.retrieve(l_req_date, ls_salesman, l_req_seq, ls_sale_no)
		dw_6.title = "출고의뢰량[ " + ls_sale_no + " ] "
		dw_6.setredraw( true )
end event

type st_vertical from u_splitbar_vertical within w_oidocar_m
integer x = 3163
integer y = 440
integer height = 1756
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
//st_horizontal1.x     = this.x + this.width
//st_horizontal1.width = dw_2.width

end event

type ddlb_op from dropdownlistbox within w_oidocar_m
integer x = 946
integer y = 308
integer width = 302
integer height = 500
integer taborder = 140
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

type dw_5 from datawindow within w_oidocar_m
integer x = 3182
integer y = 1044
integer width = 1216
integer height = 608
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "d_carriage_m3"
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw   = this.classname()
st_7.text     = '전달사항'

end event

event doubleclicked;//WF_MULTI_SELECT(this, row)
end event

event getfocus;//
this.Object.DataWindow.Color = gl_dw_backcolor

end event

event itemchanged;string ls_driver_name, ls_driver_tel, ls_car_company, ls_car_kind
  
choose case dwo.name
	case "car_no"			// 차량NO		

		SELECT docar.name, docar.hp, docar.car_company, car_kind
		     INTO :ls_driver_name, :ls_driver_tel, :ls_car_company, :ls_car_kind
		FROM docar WHERE docar.open_close = 'O' AND docar.driver = :data;
		
		if isnull(ls_driver_tel) or ls_driver_tel = "" then
			this.object.driver_tel[row] = "00"
		else
			this.object.driver_tel[row] = ls_driver_tel
		end if
		
		if isnull(ls_driver_name) or ls_driver_name = "" then
			this.object.driver_name[row] = ""
		else
			this.object.driver_name[row] = ls_driver_name
		end if		
		
		if isnull(ls_car_kind) or ls_car_kind = "" then
			this.object.car_gbn[row] = ""
		else
			this.object.car_gbn[row] = ls_car_kind
		end if				
	
end choose

end event

event losefocus;//
this.Object.DataWindow.Color = gl_dw_backcolorInit

end event

type st_horizontal2 from u_splitbar_horizontal within w_oidocar_m
integer x = 3177
integer y = 1656
integer width = 2473
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_oidocar_m
integer x = 3177
integer y = 1024
integer width = 1225
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_vertical.height = dw_1.height

end event

type dw_6 from datawindow within w_oidocar_m
integer x = 1339
integer y = 2192
integer width = 3150
integer height = 1048
integer taborder = 190
boolean bringtotop = true
boolean titlebar = true
string title = "출고의뢰량"
string dataobject = "d_carriage_sale_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

is_dw = "dw_4"

end event

type st_vertical2 from u_splitbar_vertical within w_oidocar_m
integer x = 4402
integer y = 440
integer height = 1236
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
//st_horizontal1.x     = this.x + this.width
//st_horizontal1.width = dw_2.width

end event

type st_3 from statictext within w_oidocar_m
integer x = 3191
integer y = 296
integer width = 3109
integer height = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oidocar_m
integer x = 2779
integer y = 292
integer width = 407
integer height = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
string text = "운송처주소"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within w_oidocar_m
integer x = 6295
integer y = 292
integer width = 425
integer height = 100
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_oidocar_m
integer x = 2542
integer y = 16
integer width = 763
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 79741120
end type

