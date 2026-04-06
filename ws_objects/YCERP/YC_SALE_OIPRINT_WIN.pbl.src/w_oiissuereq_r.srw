$PBExportHeader$w_oiissuereq_r.srw
$PBExportComments$출고의뢰서 조회
forward
global type w_oiissuereq_r from w_inheritance
end type
type em_1 from editmask within w_oiissuereq_r
end type
type pb_1 from picturebutton within w_oiissuereq_r
end type
type cbx_all from checkbox within w_oiissuereq_r
end type
type st_time from statictext within w_oiissuereq_r
end type
type st_2 from statictext within w_oiissuereq_r
end type
type dw_area from datawindow within w_oiissuereq_r
end type
type st_3 from statictext within w_oiissuereq_r
end type
type ddlb_fld from dropdownlistbox within w_oiissuereq_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oiissuereq_r
end type
type st_4 from statictext within w_oiissuereq_r
end type
type sle_value from singlelineedit within w_oiissuereq_r
end type
type cb_1 from commandbutton within w_oiissuereq_r
end type
type cb_2 from commandbutton within w_oiissuereq_r
end type
type cb_3 from commandbutton within w_oiissuereq_r
end type
type cb_5 from commandbutton within w_oiissuereq_r
end type
type dw_4 from datawindow within w_oiissuereq_r
end type
type dw_5 from datawindow within w_oiissuereq_r
end type
type st_1 from statictext within w_oiissuereq_r
end type
type st_5 from statictext within w_oiissuereq_r
end type
type st_6 from statictext within w_oiissuereq_r
end type
type cbx_fix from checkbox within w_oiissuereq_r
end type
type dw_6 from datawindow within w_oiissuereq_r
end type
type pb_btprint from picturebutton within w_oiissuereq_r
end type
type pb_doprint from picturebutton within w_oiissuereq_r
end type
type pb_2 from picturebutton within w_oiissuereq_r
end type
type cbx_allview from checkbox within w_oiissuereq_r
end type
type dw_9 from datawindow within w_oiissuereq_r
end type
type st_info from statictext within w_oiissuereq_r
end type
type cbx_sum from checkbox within w_oiissuereq_r
end type
type cbx_sub from checkbox within w_oiissuereq_r
end type
type cbx_inside from checkbox within w_oiissuereq_r
end type
type dw_10 from datawindow within w_oiissuereq_r
end type
type cbx_qty from checkbox within w_oiissuereq_r
end type
type cbx_old from checkbox within w_oiissuereq_r
end type
type st_vertical from u_splitbar_vertical within w_oiissuereq_r
end type
type dw_11 from datawindow within w_oiissuereq_r
end type
type gb_4 from groupbox within w_oiissuereq_r
end type
type dw_3 from datawindow within w_oiissuereq_r
end type
type dw_7 from datawindow within w_oiissuereq_r
end type
type dw_8 from datawindow within w_oiissuereq_r
end type
type st_horizontal from u_splitbar_horizontal within w_oiissuereq_r
end type
type ddlb_op from dropdownlistbox within w_oiissuereq_r
end type
type cbx_item_sum from checkbox within w_oiissuereq_r
end type
type dw_12 from datawindow within w_oiissuereq_r
end type
type cbx_item_sum_group from checkbox within w_oiissuereq_r
end type
type cb_del from commandbutton within w_oiissuereq_r
end type
type cb_ins from commandbutton within w_oiissuereq_r
end type
type cb_save from commandbutton within w_oiissuereq_r
end type
type cbx_insert from checkbox within w_oiissuereq_r
end type
type st_8 from statictext within w_oiissuereq_r
end type
type st_9 from statictext within w_oiissuereq_r
end type
type st_7 from statictext within w_oiissuereq_r
end type
type st_10 from statictext within w_oiissuereq_r
end type
type pb_tel from picturebutton within w_oiissuereq_r
end type
type gb_dw_12 from groupbox within w_oiissuereq_r
end type
end forward

global type w_oiissuereq_r from w_inheritance
integer width = 8837
integer height = 2736
string title = "출고의뢰서조회(w_oiissuereq_r)"
em_1 em_1
pb_1 pb_1
cbx_all cbx_all
st_time st_time
st_2 st_2
dw_area dw_area
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_4 dw_4
dw_5 dw_5
st_1 st_1
st_5 st_5
st_6 st_6
cbx_fix cbx_fix
dw_6 dw_6
pb_btprint pb_btprint
pb_doprint pb_doprint
pb_2 pb_2
cbx_allview cbx_allview
dw_9 dw_9
st_info st_info
cbx_sum cbx_sum
cbx_sub cbx_sub
cbx_inside cbx_inside
dw_10 dw_10
cbx_qty cbx_qty
cbx_old cbx_old
st_vertical st_vertical
dw_11 dw_11
gb_4 gb_4
dw_3 dw_3
dw_7 dw_7
dw_8 dw_8
st_horizontal st_horizontal
ddlb_op ddlb_op
cbx_item_sum cbx_item_sum
dw_12 dw_12
cbx_item_sum_group cbx_item_sum_group
cb_del cb_del
cb_ins cb_ins
cb_save cb_save
cbx_insert cbx_insert
st_8 st_8
st_9 st_9
st_7 st_7
st_10 st_10
pb_tel pb_tel
gb_dw_12 gb_dw_12
end type
global w_oiissuereq_r w_oiissuereq_r

type variables
DataWindowChild idwc_user, idwc_area, idwc_locno
DataWindowChild idwc_item, idwc_qa
st_print i_print

String   is_dw, is_ret,   is_old_cust, is_dw6sql
long     il_width, il_height
Integer  il_row
Date     id_start, id_end

end variables

forward prototypes
public function string wf_header ()
public subroutine wf_issuereq_mark (long al_dw2row)
end prototypes

public function string wf_header ();// wf_header retrun : string
//
//issuereqdet.req_flag = 'A' : 출고의뢰 .
//issuereqdet.req_flag = 'B' : "생산확인" text
//issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
//issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))
gs_where lstr_where
string ls_reqdate, ls_salesman, ls_reqseq, ls_confirm, ls_acceptuser, ls_manager, ls_locno
long   ll_row

dw_1.accepttext()

ll_row        = dw_2.getrow()
if isnull(ll_row) OR ll_row < 1 then
else
	ls_reqdate    = string(dw_2.object.req_date[dw_2.getrow()])
	ls_salesman   = dw_2.object.req_salesman[dw_2.getrow()]
	ls_reqseq     = string(dw_2.object.req_seq[dw_2.getrow()])
	ls_confirm    = dw_2.object.confirm_flag[dw_2.getrow()]
	ls_acceptuser = dw_2.object.accept_user[dw_2.getrow()]
end if

if ls_confirm = "Y" then	// 확정
	SELECT item_cd, rtrim(bigo) INTO :ls_manager, :ls_locno
	  FROM codemst 
    WHERE type =  '출고의뢰서_관리자' AND use_yn = 'Y' AND item_cd = :gs_userid;
	if gs_userid = ls_manager then
		lstr_where.str1 = ls_reqdate
		lstr_where.str2 = ls_salesman
		lstr_where.str3 = ls_reqseq
		lstr_where.chk  = "N"

		OpenWithParm( w_whissuereq_m, lstr_where )
		lstr_where = Message.PowerObjectParm
	else
		if gs_userid = ls_acceptuser then
			lstr_where.str1 = ls_reqdate
			lstr_where.str2 = ls_salesman
			lstr_where.str3 = ls_reqseq
			lstr_where.chk  = "N"
	
			OpenWithParm( w_whissuereq_m, lstr_where )
			lstr_where = Message.PowerObjectParm
		end if
	end if
else
	MessageBox("확인","미확정분은 출고담당자가 확정할 수 없습니다.")
end if
	
RETURN lstr_where.chk

end function

public subroutine wf_issuereq_mark (long al_dw2row);///////////////////////////////////////////////////////////////////
// ReturnType None : wf_issuereq_mark( al_dw2row long )
// 출고의뢰서 출력시 담당자 출력표시하기 
///////////////////////////////////////////////////////////////////
datetime   ldt_reqdate
string     ls_salesman, ls_accept, ls_chk, ls_chk0, ls_chk1, ls_chk2, ls_chk3, ls_chk4, ls_chk5
string     ls_confirm,  ls_sqlerrtext
long       ll_seq,  ll_row, ll_col, ll_dw2row

if isnull(al_dw2row) OR al_dw2row < 1 OR al_dw2row > dw_2.rowcount() then RETURN

ll_dw2row   = al_dw2row
ldt_reqdate = dw_2.object.req_date[ll_dw2row]
ls_salesman = dw_2.object.req_salesman[ll_dw2row]
ll_seq      = dw_2.object.req_seq[ll_dw2row]

// 담당자별 구분 없도록 변경
//for ll_col = 0 to 5 
//	ls_chk    = dw_2.GetItemString( ll_dw2row, "chk"+string(ll_col) )
//	
//	if ll_col = 0 then
//		ls_accept = dw_2.GetItemString( ll_dw2row, "accept_user" )
//	else
//		ls_accept = dw_2.GetItemString( ll_dw2row, "accept"+string(ll_col) )
//	end if
//	
//	if ls_accept = gs_userid then		
//		choose case ll_col
//			case 0
				dw_2.object.chk0[ll_dw2row] = "Y"

				UPDATE issuereq 
					SET chk0 = 'Y' 
				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
				 
//			case 1
//				dw_2.object.chk1[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk1 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 2
//				dw_2.object.chk2[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk2 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 3
//				dw_2.object.chk3[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk3 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 4
//				dw_2.object.chk4[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk4 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//				 
//			case 5
//				dw_2.object.chk5[ll_dw2row] = "Y"
//
//				UPDATE issuereq 
//					SET chk5 = 'Y' 
//				 WHERE req_date = :ldt_reqdate AND salesman = :ls_salesman AND req_seq = :ll_seq;
//		end choose
//		dw_2.object.chkfont[ll_dw2row] = "Y"	// 표시하기
//
		if SQLCA.SQLCode <> 0 then
			ls_sqlerrtext = SQLCA.SQLErrText
			ROLLBACK;
			MessageBox("SQL error", ls_sqlerrtext)
		else
			COMMIT;			
		end if		
		
//		EXIT		// Loop Exit
//	end if
//next
//
end subroutine

on w_oiissuereq_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.pb_1=create pb_1
this.cbx_all=create cbx_all
this.st_time=create st_time
this.st_2=create st_2
this.dw_area=create dw_area
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_4=create dw_4
this.dw_5=create dw_5
this.st_1=create st_1
this.st_5=create st_5
this.st_6=create st_6
this.cbx_fix=create cbx_fix
this.dw_6=create dw_6
this.pb_btprint=create pb_btprint
this.pb_doprint=create pb_doprint
this.pb_2=create pb_2
this.cbx_allview=create cbx_allview
this.dw_9=create dw_9
this.st_info=create st_info
this.cbx_sum=create cbx_sum
this.cbx_sub=create cbx_sub
this.cbx_inside=create cbx_inside
this.dw_10=create dw_10
this.cbx_qty=create cbx_qty
this.cbx_old=create cbx_old
this.st_vertical=create st_vertical
this.dw_11=create dw_11
this.gb_4=create gb_4
this.dw_3=create dw_3
this.dw_7=create dw_7
this.dw_8=create dw_8
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
this.cbx_item_sum=create cbx_item_sum
this.dw_12=create dw_12
this.cbx_item_sum_group=create cbx_item_sum_group
this.cb_del=create cb_del
this.cb_ins=create cb_ins
this.cb_save=create cb_save
this.cbx_insert=create cbx_insert
this.st_8=create st_8
this.st_9=create st_9
this.st_7=create st_7
this.st_10=create st_10
this.pb_tel=create pb_tel
this.gb_dw_12=create gb_dw_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.cbx_all
this.Control[iCurrent+4]=this.st_time
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_area
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_4
this.Control[iCurrent+17]=this.dw_5
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.cbx_fix
this.Control[iCurrent+22]=this.dw_6
this.Control[iCurrent+23]=this.pb_btprint
this.Control[iCurrent+24]=this.pb_doprint
this.Control[iCurrent+25]=this.pb_2
this.Control[iCurrent+26]=this.cbx_allview
this.Control[iCurrent+27]=this.dw_9
this.Control[iCurrent+28]=this.st_info
this.Control[iCurrent+29]=this.cbx_sum
this.Control[iCurrent+30]=this.cbx_sub
this.Control[iCurrent+31]=this.cbx_inside
this.Control[iCurrent+32]=this.dw_10
this.Control[iCurrent+33]=this.cbx_qty
this.Control[iCurrent+34]=this.cbx_old
this.Control[iCurrent+35]=this.st_vertical
this.Control[iCurrent+36]=this.dw_11
this.Control[iCurrent+37]=this.gb_4
this.Control[iCurrent+38]=this.dw_3
this.Control[iCurrent+39]=this.dw_7
this.Control[iCurrent+40]=this.dw_8
this.Control[iCurrent+41]=this.st_horizontal
this.Control[iCurrent+42]=this.ddlb_op
this.Control[iCurrent+43]=this.cbx_item_sum
this.Control[iCurrent+44]=this.dw_12
this.Control[iCurrent+45]=this.cbx_item_sum_group
this.Control[iCurrent+46]=this.cb_del
this.Control[iCurrent+47]=this.cb_ins
this.Control[iCurrent+48]=this.cb_save
this.Control[iCurrent+49]=this.cbx_insert
this.Control[iCurrent+50]=this.st_8
this.Control[iCurrent+51]=this.st_9
this.Control[iCurrent+52]=this.st_7
this.Control[iCurrent+53]=this.st_10
this.Control[iCurrent+54]=this.pb_tel
this.Control[iCurrent+55]=this.gb_dw_12
end on

on w_oiissuereq_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.pb_1)
destroy(this.cbx_all)
destroy(this.st_time)
destroy(this.st_2)
destroy(this.dw_area)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.cbx_fix)
destroy(this.dw_6)
destroy(this.pb_btprint)
destroy(this.pb_doprint)
destroy(this.pb_2)
destroy(this.cbx_allview)
destroy(this.dw_9)
destroy(this.st_info)
destroy(this.cbx_sum)
destroy(this.cbx_sub)
destroy(this.cbx_inside)
destroy(this.dw_10)
destroy(this.cbx_qty)
destroy(this.cbx_old)
destroy(this.st_vertical)
destroy(this.dw_11)
destroy(this.gb_4)
destroy(this.dw_3)
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
destroy(this.cbx_item_sum)
destroy(this.dw_12)
destroy(this.cbx_item_sum_group)
destroy(this.cb_del)
destroy(this.cb_ins)
destroy(this.cb_save)
destroy(this.cbx_insert)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_7)
destroy(this.st_10)
destroy(this.pb_tel)
destroy(this.gb_dw_12)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_2)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_leftobject(dw_12)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

string ls_locno
long   ll_cnt

cbx_allview.enabled = false   // 집계보기
cbx_item_sum_group.enabled = false // 2017.11.20 조원석
cb_ins.enabled = false // 2017.11.20 조원석
cb_del.enabled = false // 2017.11.20 조원석
cb_save.enabled = false // 2017.11.20 조원석		
gb_dw_12.enabled = false // 2017.11.20 조원석
cbx_insert.enabled = false

pb_2.visible = false
pb_doprint.enabled = false		// 거래명세서 작성
pb_btprint.enabled = false		// 일괄출력
dw_6.visible = false				// 수주상황접수부
dw_7.visible = false				// 집계금액
dw_8.visible = false				// 집계건수
dw_9.visible = false				// 집계리스트
dw_10.visible = false			// 선정수량

st_info.visible = false       // 

dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_6.settransobject(sqlca)
is_dw6sql = dw_6.describe("datawindow.table.select")
dw_7.settransobject(sqlca)
dw_8.settransobject(sqlca)
dw_9.settransobject(sqlca)
dw_10.settransobject(sqlca)
dw_11.settransobject(sqlca)
dw_12.settransobject(sqlca) // 2017.11.20 추가

dw_12.visible  = false            // 2017.11.20 추가
dw_11.visible = false

/////////////////////////////////
// 의뢰자
/////////////////////////////////
dw_5.settransobject(sqlca)
dw_5.insertrow(1)
dw_5.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
idwc_user.accepttext()
dw_5.object.user[1] = '%'

/////////////////////////////////
// 사업장
/////////////////////////////////
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area		// 시화사업장(기본값)

dw_area.getchild("area", idwc_area)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, 'area_no',   ' ')
idwc_area.setitem(1, 'area_name', '전체사업장')
idwc_area.accepttext()

/////////////////////////////////
// 저장소
/////////////////////////////////
dw_4.SetTransObject(sqlca)		
dw_4.insertrow(0)  
dw_4.object.loc_no[1] = " "

dw_4.getchild("loc_no", idwc_locno)
idwc_locno.settransobject(sqlca)
idwc_locno.insertrow(1)
idwc_locno.setitem(1, 'loc_no', ' ')
idwc_locno.setitem(1, 'loc_name', '전체저장소')
idwc_locno.accepttext()


SELECT rtrim(bigo) INTO :ls_locno FROM codemst 
 WHERE type = '사업장기본저장소' AND item_cd = :gs_userid AND use_yn = 'Y';
if isnull(ls_locno) OR ls_locno = "" then
	SELECT def_loc INTO :ls_locno FROM area WHERE area_no = :gs_area;
	if isnull(ls_locno) or ls_locno = "" then ls_locno = "WS00000000"		// 시화저장소
end if

idwc_locno.setfilter( "area_no = '" + gs_area + "'" )
idwc_locno.filter()

dw_4.object.loc_no[1] = ls_locno		// 기본값 설정	
dw_4.accepttext()

cbx_sub.enabled = false		// 부속품보기
cbx_sum.enabled = false		// 품목소계
cbx_fix.enabled = false    // 틀고정

dw_3.visible  = false
dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계

em_1.text = string(today(), 'YYYY/MM/DD')

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

is_dw = "dw_2"
GF_DWTitle2ddlb( dw_2, ddlb_fld, ddlb_dwtitles )

end event

event resize;call super::resize;//
//long  ll_width, ll_height

il_width    = newwidth  - (gb_3.x * 2)
il_height   = newheight - dw_2.y - gb_3.x

//gb_3.width  = il_width

dw_2.height = il_height                      // 헤더

st_vertical.x      = dw_2.x + dw_2.width
st_vertical.height = dw_2.height

dw_1.width  = newwidth  - dw_1.x - gb_3.x 	// 상세
dw_1.height = il_height 

st_horizontal.y     = dw_2.y + dw_2.height
st_horizontal.width = dw_2.width

// 시간별집계
dw_11.x      = dw_2.x
dw_11.y      = dw_2.y + (dw_2.height * 0.5)
dw_11.width  = dw_2.width
dw_11.height = dw_2.height * 0.5

dw_3.x      = dw_2.x
dw_3.y      = dw_2.y
dw_3.width  = newwidth  - 73
dw_3.height = dw_2.height

/*2017.11.20일 추가 */
dw_12.x      = dw_2.x
dw_12.y      = dw_2.y
dw_12.width  = newwidth  - 73
dw_12.height = dw_2.height

// 집계금액
dw_7.x      = dw_1.x
dw_7.y      = dw_1.y
dw_7.width  = dw_1.width
dw_7.height = dw_1.height / 2
// 집계건수
dw_8.x      = dw_1.x
dw_8.y      = dw_7.y + dw_7.height
dw_8.width  = dw_1.width
dw_8.height = dw_1.height / 2

// 선정수량
dw_10.x      = dw_1.x
dw_10.y      = dw_1.y + (dw_1.height / 2)
dw_10.width  = dw_1.width
dw_10.height = dw_1.height / 2

end event

type pb_save from w_inheritance`pb_save within w_oiissuereq_r
boolean visible = false
integer x = 3200
integer taborder = 30
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_oiissuereq_r
integer x = 1810
integer y = 456
integer width = 2720
integer height = 2024
integer taborder = 50
string dataobject = "d_oiissuereq_s"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)
ldt_dodate  = dw_1.object.do_date[row]						// 출하시간

ldt_reqdate = dw_1.object.req_date[row]
ls_salesman = dw_1.object.salesman[row]
ll_reqseq   = dw_1.object.req_seq[row]
ll_seq      = dw_1.object.issuereqdet_seq[row]
ls_orderno  = dw_1.object.issuereqdet_sale_no[row]

if cbx_qty.checked = true then
	dw_10.retrieve( ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
end if

if isnull(ldt_dodate) then
	pb_doprint.enabled = true
else
	pb_doprint.enabled = false
end if


end event

event dw_1::doubleclicked;call super::doubleclicked;////issuereqdet.req_flag = 'A' : 출고의뢰 .
////issuereqdet.req_flag = 'B' : "생산확인" text
////issuereqdet.req_flag = 'P' : 출고의뢰 생산확인.
////issuereqdet.req_flag = 'Z' : req_text ( varchar(4099))

ws_process st_process
string ls_sale

debugbreak()

if isnull(row) then RETURN

choose case row
	case 0		// header 선택
		if wf_header() <> "Y" then 
		else
			pb_retrieve.postevent(clicked!)
		end if
		
	case else	// detail 선택
		string ls_flag, ls_area
 
//		ls_area = this.object.issuereq_accept_area[row]
		ls_flag = this.object.issuereqdet_req_flag[row]
//		choose case ls_flag
//			case 'A'
////				if wf_detail('A') <> "Y" then return
//			case 'B', 'P'
////				if wf_detail('P') <> "Y" then return
//			case 'Z'
//				if wf_header()    <> "Y" then return
//			case else
////				if wf_detail('A') <> "Y" then return
//		end choose
//
//		//출고의뢰 상세 조회.
//		pb_retrieve.postevent(clicked!)

		st_process.sale_no = this.object.issuereqdet_sale_no[row]
		OpenWithParm( w_whsaledodet_w, st_process )
end choose

end event

event dw_1::rowfocuschanged;call super::rowfocuschanged;//
datetime ldt_dodate, ldt_reqdate
string   ls_salesman, ls_orderno
long     ll_reqseq,  ll_seq

if isnull(currentrow) OR currentrow < 1 then RETURN

this.scrolltorow(currentrow)
ldt_dodate  = dw_1.object.do_date[currentrow]						// 출하시간

ldt_reqdate = dw_1.object.req_date[currentrow]
ls_salesman = dw_1.object.salesman[currentrow]
ll_reqseq   = dw_1.object.req_seq[currentrow]
ll_seq      = dw_1.object.issuereqdet_seq[currentrow]
ls_orderno  = dw_1.object.issuereqdet_sale_no[currentrow]

if cbx_qty.checked = true then
	dw_10.retrieve( ldt_reqdate, ls_salesman, ll_reqseq, ll_seq, ls_orderno )
end if

if isnull(ldt_dodate) then
	pb_doprint.enabled = true
else
	pb_doprint.enabled = false
end if


end event

event dw_1::buttonclicked;call super::buttonclicked;//
gs_where lstr_where
string   ls_area
long     ll_row

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

choose case dwo.name
	case "b_car"
		dw_1.accepttext()
		
		lstr_where.str1 = this.object.issuereqdet_cust_no[row]
		lstr_where.str2 = this.object.issuereqdet_scene_code[row]
		lstr_where.str3 = string(this.object.req_date[row],"yyyy/mm/dd")		// 
		lstr_where.str4 = ls_area
		lstr_where.str5 = this.object.compute_3[row]
		lstr_where.chk  = ""
		
		OpenWithParm( w_whdocar_m, lstr_where )
		lstr_where = Message.PowerObjectParm
		
//		if lstr_where.chk = "Y" then
//			em_2.text = lstr_where.str3		// 차수
//		end if
end choose
end event

type st_title from w_inheritance`st_title within w_oiissuereq_r
integer x = 0
integer y = 0
integer width = 1097
integer height = 140
string text = "출고의뢰서 조회"
end type

type st_tips from w_inheritance`st_tips within w_oiissuereq_r
end type

type pb_compute from w_inheritance`pb_compute within w_oiissuereq_r
boolean visible = false
integer x = 2290
integer y = 0
integer width = 165
integer height = 132
integer taborder = 140
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = ""
alignment htextalign = center!
end type

type pb_print_part from w_inheritance`pb_print_part within w_oiissuereq_r
boolean visible = false
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_oiissuereq_r
integer x = 4320
integer y = 76
integer height = 152
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_oiissuereq_r
integer x = 3927
integer y = 76
integer height = 152
integer taborder = 160
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print   l_print

string     ls_confirm
long       ll_dw2row

if cbx_all.checked = true then		// 의뢰전체
	if dw_3.rowcount() < 1 then RETURN
	
	l_print.st_datawindow  = dw_3
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 출고의뢰현황을 출력합니다." 
	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
							 'Datawindow.Zoom=61'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
	
	
// 2017.11.20 조원석 추가 시작 	
elseif cbx_item_sum.checked = true   then 
	
	if dw_12.rowcount() < 1 then RETURN
	
	l_print.st_datawindow  = dw_12
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 출고의뢰현황을 출력합니다." 
	
	if cbx_item_sum_group.checked = true  then

		gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
								 'Datawindow.Zoom=79 DataWindow.Detail.Height=0'
	else							 

	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
							 'Datawindow.Zoom=79 DataWindow.Detail.Height=60'
	end if							 
	
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)	
	// 2017.11.20 조원석 추가 
else	
	if dw_1.rowcount() < 1 then RETURN

	ll_dw2row = dw_2.getrow()
	if isnull(ll_dw2row) OR ll_dw2row < 1 then RETURN
	
	ls_confirm  = dw_1.object.confirm_flag[1]
	
	if ls_confirm = "Y" then
		wf_issuereq_mark( ll_dw2row )		
	end if
	
	//l_print.name = 'd_orsalesalemanrep_r1'
	l_print.st_datawindow  = dw_1
	l_print.st_print_sheet = " 프린트용지 : A4"
	l_print.st_print_desc  = " 이 프로그램은 출고의뢰현황을 출력합니다." 
	
	// LANDSCAPE:1, PORTRAIT:2
	// SIZE 9-A4, 12-B4
	
	gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + &
							 'Datawindow.Zoom=86'
	OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================




end event

type pb_cancel from w_inheritance`pb_cancel within w_oiissuereq_r
boolean visible = false
integer x = 2821
integer y = 48
integer taborder = 170
boolean bringtotop = true
end type

type pb_delete from w_inheritance`pb_delete within w_oiissuereq_r
boolean visible = false
integer x = 2807
integer taborder = 180
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_oiissuereq_r
boolean visible = false
integer x = 2610
integer taborder = 200
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oiissuereq_r
integer x = 3735
integer y = 76
integer height = 152
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

DateTime ldt_time
date     ld_reqdate
string   ls_area, ls_locno, ls_defno, ls_salesman, ls_accept, ls_acceptuser, ls_chk, ls_chkvalue
string   ls_reqdate, ls_inside

SELECT top 1 getdate() INTO :ldt_time FROM login;
st_time.text = string(ldt_time,"yyyy/mm/dd hh:mm:ss")

dw_1.reset() ; dw_10.reset() ; dw_11.reset()

dw_4.accepttext()			// 저장소
dw_5.accepttext()			// 의뢰자
dw_area.accepttext()		// 사업장

cbx_sum.checked = false
cbx_fix.checked = false   	// 틀고정
cbx_sub.checked = false		// 부속품보기

// 사업장
ls_area = trim(dw_area.object.area[1])
if isnull(ls_area) or ls_area = "" then ls_area = "%"

// 저장소
if dw_4.rowcount() > 0 then
	ls_locno = trim(dw_4.object.loc_no[1])
end if
if ls_locno = "" then ls_locno = "%"

if ls_area = "%" AND ls_locno = "%" then
else
	
	if cbx_insert.checked = false then	
		
		SELECT loc_no  INTO :ls_defno FROM location WHERE area_no = :ls_area AND loc_no = :ls_locno;
		
		if ls_defno <> ls_locno then
			MessageBox("확인", "사업장과 저장소가 일치하지 않습니다.")
			RETURN
		end if
		
	end if
end if

// 출고일
ld_reqdate = date(em_1.text)
ls_reqdate = em_1.text

// 의뢰자
ls_salesman = trim(dw_5.object.user[1])
if ls_salesman = "" then ls_salesman = "%"

// 접수자
SELECT loc_manager INTO :ls_acceptuser FROM location WHERE loc_no = :ls_locno;

if isnull(ls_acceptuser) OR ls_acceptuser = "" then ls_acceptuser = "%"

// 시화저장소 담당자 변경시에 이전담당자 출고의뢰 포함해서 보기(2015/06/15)
if ls_area = "S0001" AND ls_reqdate >= "2015/07/01" then
	ls_acceptuser = "%"
end if

// 출고리스트
if cbx_all.checked = true then
else
	dw_2.reset()
	dw_2.retrieve( ls_area, ld_reqdate, "%", ls_salesman, ls_acceptuser )
	if dw_2.rowcount() > 0 then 
		pb_btprint.enabled = true		// 일괄출력
	else
		pb_btprint.enabled = false		// 일괄출력
	end if
end if

// 읽음표시(출력됨)
long  ll_row, ll_col

for ll_row = 1 to dw_2.rowcount()
	for ll_col = 0 to 5
		ls_chkvalue = "chk"+string(ll_col)
		ls_chk    = dw_2.GetItemString( ll_row, "chk"+string(ll_col) )

      if ls_chk = "Y" then		// 읽음표시(출력됨)
//			if ll_col = 0 then
//				ls_accept = trim(dw_2.GetItemString( ll_row, "accept_user" ))
//			else
//				ls_accept = trim(dw_2.GetItemString( ll_row, "accept"+string(ll_col) ))
//			end if
//
//			if ls_accept = gs_userid then		
				dw_2.object.chkfont[ll_row] = "Y"
				exit
//			end if
		end if		
	next
next

// 계열사 제외
if cbx_inside.checked = true then
	ls_inside = "Y"
else
	ls_inside = "N"
end if

// 출고리스트
if cbx_all.checked = true then
	dw_3.setredraw( false )
	dw_3.reset()
	dw_3.retrieve( ls_area, ls_acceptuser, ls_salesman, ls_reqdate, ls_inside )
	dw_3.setredraw( true )
end if

// 전체집계(출고)
if cbx_allview.checked = true then	
	dw_7.retrieve( ls_reqdate, ls_inside )
	dw_8.retrieve( ls_reqdate, ls_inside )
	dw_9.retrieve( ls_reqdate, ls_inside )
	dw_11.retrieve( ls_reqdate, ls_inside )
end if

if cbx_item_sum.checked = true then
	
	if isnull(ls_area) or ls_area ='' or ls_area ='%' then
		ls_area = '%'
	else
		ls_area = '%' + ls_area + '%'
	end if
	
	if isnull(ls_acceptuser) or ls_acceptuser ='' or ls_acceptuser ='%' then
		ls_acceptuser = '%'
	else
		ls_acceptuser = '%' + ls_acceptuser + '%'
	end if
	
	if isnull(ls_salesman) or ls_salesman ='' or ls_salesman ='%' then
		ls_salesman = '%'
	else
		ls_salesman = '%' + ls_salesman + '%'
	end if	
	
	dw_12.retrieve( ls_area, ls_acceptuser, ls_salesman, ls_reqdate )	
	
end if

if  cbx_insert.checked = true then
	dw_12.retrieve( '출고의뢰' )		
end if

MessageBox("확인","조회완료")

end event

type gb_3 from w_inheritance`gb_3 within w_oiissuereq_r
integer x = 0
integer y = 256
integer width = 4937
integer height = 192
integer taborder = 110
integer textsize = -8
integer weight = 400
long textcolor = 0
long backcolor = 67108864
end type

type gb_2 from w_inheritance`gb_2 within w_oiissuereq_r
integer x = 1381
integer y = 16
integer width = 891
integer height = 248
integer taborder = 130
integer textsize = -9
long textcolor = 0
long backcolor = 79220952
end type

type gb_1 from w_inheritance`gb_1 within w_oiissuereq_r
integer x = 3241
integer y = 16
integer width = 1289
integer height = 248
integer taborder = 40
integer weight = 400
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_oiissuereq_r
integer x = 32
integer y = 456
integer width = 1719
integer height = 2024
integer taborder = 60
string title = "출고의뢰 상세내역"
string dataobject = "d_whissuereq_ss"
boolean hscrollbar = true
end type

event dw_2::clicked;call super::clicked;//
datetime ldt_dodate
date   ld_date
string ls_user, ls_time, ls_confirm
int    li_seq

if isnull(row) OR row < 1 then RETURN

//
is_dw = "dw_2"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

this.scrolltorow(row)

ld_date    = date(em_1.text)
ls_user    = dw_2.object.req_salesman[row]
li_seq     = dw_2.object.req_seq[row]
ls_confirm = dw_2.object.confirm_flag[row]
ls_time    = trim(st_time.text)

dw_10.reset()
dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)

//if ls_confirm = "Y" then
//	pb_btprint.enabled = true
//else
//	pb_btprint.enabled = false
//end if

if dw_1.rowcount() > 0 then
	dw_1.scrolltorow(1)
	
	ldt_dodate  = dw_1.object.do_date[1]						// 출하시간
	
	if isnull(ldt_dodate) then
		pb_doprint.enabled = true
	else
		pb_doprint.enabled = false
	end if
end if

this.setfocus()

end event

event dw_2::rowfocuschanged;call super::rowfocuschanged;//
datetime ldt_dodate
date   ld_date
string ls_user, ls_time, ls_confirm
int    li_seq

if isnull(currentrow) OR currentrow < 1 or currentrow > this.rowcount() then RETURN

this.scrolltorow(currentrow)

ld_date    = date(em_1.text)
ls_user    = dw_2.object.req_salesman[currentrow]
li_seq     = dw_2.object.req_seq[currentrow]
ls_confirm = dw_2.object.confirm_flag[currentrow]
ls_time    = trim(st_time.text)

dw_10.reset()
dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
dw_1.setfocus()
dw_1.groupcalc()
dw_1.setredraw(true)

//if ls_confirm = "Y" then
//	pb_btprint.enabled = true
//else
//	pb_btprint.enabled = false
//end if

if dw_1.rowcount() > 0 then
	dw_1.scrolltorow(1)
	
	ldt_dodate  = dw_1.object.do_date[1]						// 출하시간
	
	if isnull(ldt_dodate) then
		pb_doprint.enabled = true
	else
		pb_doprint.enabled = false
	end if
end if

this.setfocus()

end event

type em_1 from editmask within w_oiissuereq_r
integer x = 2533
integer y = 160
integer width = 658
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 255
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;pb_retrieve.postevent(clicked!)
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if
pb_retrieve.postevent(clicked!)
end event

type pb_1 from picturebutton within w_oiissuereq_r
event mousemove pbm_mousemove
integer x = 4123
integer y = 76
integer width = 187
integer height = 152
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

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value, iRet
DataWindow ldw_sel

choose case is_dw
	case "dw_2"
		ldw_sel = dw_2
	case "dw_3"
		ldw_sel = dw_3
	case "dw_7"
		ldw_sel = dw_9
	case "dw_8"
		ldw_sel = dw_8
	case else
		ldw_sel = dw_1
end choose
if ldw_sel.rowcount() < 1 then RETURN


//iRet = MessageBox("확인", "출고의뢰서 집계작업을 실행하시겠습니까?~n~n~n" + &
//						"집계작업은 파일서버 접근권한이 있어야 합니다.(\\192.168.1.6)", Exclamation!, OKCancel!, 1)
//if iRet = 2 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)

	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsAscII(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
//else
//	if dw_3.RowCount() < 1 then RETURN
//	if RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "CUST_NO", RegString!, is_old_cust) = 1 then
//		RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "SDATE", RegString!, string(id_start, "yyyy-mm-dd"))
//		RegistrySet( "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YOOCHANG\OLAP", "EDATE", RegString!, string(id_end, "yyyy-mm-dd"))
//	else
//		MessageBox('','엑셀파일 기초세팅 실패!~N~N관리자에게 문의 바랍니다.')
//	end if
//
//	OLEObject OleExcel
//
//	OleExcel = CREATE OLEObject 
//	iRet = OleExcel.ConnectToNewObject("excel.application") 
//	if iRet <> 0 then DESTROY OleExcel 
//
//	// Visible = True의 경우 엑셀 프로그램이 띄워지며 
//	// False인 경우 아이콘화된다. 
//	OleExcel.Application.Visible = true
//
//	// 엑셀을 로드한 후 Empty Sheet를 연다. 
//	OleExcel.WorkBooks.Open('\\192.168.1.6\pb80\EXCEL\출고의뢰서.xls') 
//	
//	Destroy OleExcel
//end if

end event

type cbx_all from checkbox within w_oiissuereq_r
integer x = 2423
integer y = 312
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체보기"
end type

event clicked;// 의뢰전체
if this.checked = true then
	dw_1.visible = false
	dw_3.visible = true
	cbx_sum.enabled = true
	cbx_fix.enabled = true    	// 틀고정
	cbx_sub.enabled = true		// 부속품보기
	cbx_item_sum.checked = false
else
	dw_1.visible = true
	dw_3.visible = false	
	cbx_sum.enabled = false
	cbx_fix.enabled = false    // 틀고정
	cbx_sub.enabled = false		// 부속품보기
end if

cbx_allview.checked = false
cbx_allview.triggerevent( clicked! )

//pb_retrieve.postevent( clicked! )


end event

type st_time from statictext within w_oiissuereq_r
integer x = 251
integer y = 196
integer width = 905
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_2 from statictext within w_oiissuereq_r
integer x = 50
integer y = 196
integer width = 183
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "조회:"
boolean focusrectangle = false
end type

type dw_area from datawindow within w_oiissuereq_r
integer x = 1618
integer y = 68
integer width = 530
integer height = 84
integer taborder = 180
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;////////////////////////////////////////////////////////////
//// 기본사업장에 다수의 저장소 존재시(기본저장소)			
////////////////////////////////////////////////////////////
string ls_area, ls_areachk, ls_locno, ls_defno
long   ll_cnt

dw_area.accepttext()
ls_area = trim(data)
if ls_area = "" then
	cbx_allview.enabled = true    // 집계보기
//	cbx_item_sum.enabled = true    //2017.11.20 조원석 
//	cbx_item_sum_group.enabled = true
else
	cbx_allview.enabled = false   // 집계보기
//	cbx_item_sum.enabled = false    //  2017.11.20 조원석
//	cbx_item_sum_group.enabled = false
end if

// 사업장의 기본저장소
//SELECT loc_no  INTO :ls_defno FROM location WHERE area_no = :ls_area AND loc_no = :ls_locno;

SELECT count(loc_no) INTO :ll_cnt
  FROM location
 WHERE loc_manager is not null
   AND tel_no      is not null
   AND use_yn       = 'Y'
   AND area_no      = :ls_area;
if ll_cnt = 1 then
	SELECT def_loc  INTO :ls_locno FROM area WHERE area_no = :ls_area;
else
	ls_locno = " "
end if

if ls_area = "" then
	idwc_locno.setfilter( "area_no <> ''" )
else
	idwc_locno.setfilter( "area_no = '" + ls_area + "'" )
end if
idwc_locno.filter()
	
dw_4.object.loc_no[1] = ls_locno		// 기본값을 변경	
dw_4.accepttext()

end event

type st_3 from statictext within w_oiissuereq_r
integer x = 82
integer y = 340
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

type ddlb_fld from dropdownlistbox within w_oiissuereq_r
integer x = 270
integer y = 324
integer width = 443
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

type ddlb_dwtitles from dropdownlistbox within w_oiissuereq_r
integer x = 302
integer y = 336
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

type st_4 from statictext within w_oiissuereq_r
integer x = 741
integer y = 340
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

type sle_value from singlelineedit within w_oiissuereq_r
integer x = 1230
integer y = 332
integer width = 512
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

type cb_1 from commandbutton within w_oiissuereq_r
integer x = 1751
integer y = 332
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

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_12"
		arg_dw  = dw_12
end choose

GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_2 from commandbutton within w_oiissuereq_r
integer x = 1915
integer y = 332
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

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_12"
		arg_dw  = dw_12		
end choose

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_oiissuereq_r
integer x = 2080
integer y = 332
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

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_12"
		arg_dw  = dw_12		
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oiissuereq_r
integer x = 2245
integer y = 332
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

choose case is_dw
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_12"
		arg_dw  = dw_12		
end choose

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_4 from datawindow within w_oiissuereq_r
integer x = 1408
integer y = 156
integer width = 841
integer height = 84
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type dw_5 from datawindow within w_oiissuereq_r
integer x = 2528
integer y = 68
integer width = 672
integer height = 84
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_whlogin_c3"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_oiissuereq_r
integer x = 1408
integer y = 68
integer width = 210
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

type st_5 from statictext within w_oiissuereq_r
integer x = 2318
integer y = 72
integer width = 210
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
string text = "의뢰자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_oiissuereq_r
integer x = 2318
integer y = 160
integer width = 210
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
string text = "출고일"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_fix from checkbox within w_oiissuereq_r
integer x = 2784
integer y = 372
integer width = 311
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx
long   ll_colx

if dw_3.visible = true then
	if this.checked = true then
		ll_colx = long(dw_3.object.issue_schedule.x)
		ls_colx = string(ll_colx)
		dw_3.object.datawindow.horizontalscrollsplit = ls_colx
	else
		ls_colx = "0"
		dw_3.object.datawindow.horizontalscrollsplit = ls_colx
	end if
end if

end event

type dw_6 from datawindow within w_oiissuereq_r
integer x = 782
integer y = 8
integer width = 146
integer height = 92
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_orsale_print2"
boolean livescroll = true
end type

type pb_btprint from picturebutton within w_oiissuereq_r
integer x = 3273
integer y = 76
integer width = 453
integer height = 152
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수주상황부 일괄출력"
boolean originalsize = true
vtextalign vtextalign = multiline!
end type

event clicked;w_repsuper w_print
st_print   l_print

date   	ld_date
datetime	ld_reqdate
string 	ls_user, ls_time
int    	li_seq,  li_reqseq

string 	ls_area,  ls_locno, ls_orderno, ls_scenehp, ls_confirm, ls_salesman, ls_reqflag, ls_all, ls_schedule
string 	ls_where, ls_sql
long   	ll_row,   ll_col

// 의뢰자 없으면
if dw_2.rowcount() < 1 then RETURN

dw_area.accepttext()
ls_area  = dw_area.object.area[1]

dw_4.accepttext()
ls_locno = dw_4.object.loc_no[1]

if MessageBox("확인", "수주상황접수부의 연락처 번호를~n~n" + &
                      "해당 거래처 현장관리 번호로 출력 합니까?", Exclamation!, YesNo!, 1) = 1 then
	ls_scenehp = "Y"
else
	ls_scenehp = ""
end if

if MessageBox("확인", string(dw_2.rowcount()) + " 명의 출고확정 전체를 출력 합니까?", Exclamation!, YesNo!, 2) = 1 then
	ls_all = "Y"
	if MessageBox("확인", "출고확정 전체를 출력작업 합니다. 맞습니까?", Exclamation!, YesNo!, 2) = 2 then
		RETURN
	end if
else
	ls_all = ""
	ls_salesman = dw_2.object.req_salesman[dw_2.getrow()]
	li_reqseq   = dw_2.object.req_seq[dw_2.getrow()]
end if


PrintSetup()

for ll_col = 1 to dw_2.rowcount()
	//변수 초기화
	ls_user	= ''	
	li_seq	= 0
	
	ld_date    = date(em_1.text)
	ls_user    = dw_2.object.req_salesman[ll_col]
	li_seq     = dw_2.object.req_seq[ll_col]
	ls_confirm = dw_2.object.confirm_flag[ll_col]
	ls_time    = trim(st_time.text)
	ld_reqdate = dw_2.object.req_date[ll_col]

	if ls_all = "Y" then
	else
		if ls_salesman <> ls_user then CONTINUE		// 의뢰자 SKIP
		if li_reqseq   <> li_seq  then CONTINUE		// 차수   SKIP
	end if

	dw_2.scrolltorow(ll_col)
		
	if ls_confirm = "Y" then		// 확정
		dw_1.setredraw(false)
		dw_1.reset()
		dw_1.retrieve( ld_date, ls_user, li_seq, ls_time )
		dw_1.setfocus()
		dw_1.groupcalc()
		dw_1.setredraw(true)
		
		dw_6.settransobject(sqlca)
		for ll_row = 1 to dw_1.rowcount()
			ls_where   = "" ; ls_sql = "" ; ls_orderno = ""
		
			ls_orderno  = dw_1.object.issuereqdet_sale_no[ll_row]				// 수주번호
			ls_reqflag  = dw_1.object.issuereqdet_req_flag[ll_row]			// A:출고의뢰, B:생산확인, P:출고/생산확인
			
			// A:직출,     B:생산후직출, C:자동작성, D:방문,     E:외주(시화),  F:외주(본사)
			// G:유창강건, H:지점이송,   I:야간도착, J:저녁상차, K:택배/정기			
			ls_schedule = dw_1.object.issuereqdet_issue_schedule[ll_row]
		
			if ls_area = "S0001" then			// 시화
				choose case ls_schedule
					case "E", "F", "G"			// 외주(시화), 외주(본사), 유창강건
						CONTINUE					
				end choose
			end if
			
			if isnull(ls_orderno) OR ls_reqflag <> "A" then
			else
				wf_issuereq_mark( ll_row )

				dw_6.retrieve( ls_scenehp, ls_orderno,  ls_orderno, '%')
				
				dw_6.Modify( 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100' )
				dw_6.Print()
				
				//출력 적용
				UPDATE 
					issuereq 
				SET 
					print_yn = 'Y'
				WHERE 
					req_date = :ld_reqdate AND salesman = :ls_user AND req_seq = :li_seq
				using sqlca;
				
				if sqlca.sqlcode = 0 then         
					commit;
					dw_2.setitem(ll_col, 'print_yn', 'Y')
				else
					rollback using sqlca;
				end if
				
			end if
		next
	end if
next

MessageBox("확인","출력완료")

end event

type pb_doprint from picturebutton within w_oiissuereq_r
integer x = 4530
integer y = 316
integer width = 379
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래명세서"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// 거래명세서 작성
string   ls_orderno, ls_confirm, ls_reqflag, ls_schedule
datetime ldt_dodate
long     ll_row

if dw_1.rowcount() < 1 then return

ll_row = dw_1.getrow()

ls_confirm  = dw_1.object.confirm_flag[ll_row]				// 확정,미확정
ls_reqflag  = dw_1.object.issuereqdet_req_flag[ll_row]	// A:출고의뢰, B:생산확인, P:출고/생산확인

// A:직출,     B:생산후직출, C:자동작성, D:방문,     E:외주(시화),  F:외주(본사)
// G:유창강건, H:지점이송,   I:야간도착, J:저녁상차, K:택배/정기			
ls_schedule = dw_1.object.issuereqdet_issue_schedule[ll_row]
ls_orderno  = dw_1.object.issuereqdet_sale_no[ll_row]		// 수주번호
ldt_dodate  = dw_1.object.do_date[ll_row]						// 출하시간

if ls_confirm <> "Y" OR ls_reqflag <> "A" then
	MessageBox("확인","출고의뢰 확정분만 송장발행이 가능합니다.")
	RETURN
end if

if isnull(ldt_dodate) then
else
	RETURN
end if

if IsValid(w_o_main) = true then
	OpenSheet(w_oido_m, w_o_main, 5, original!)
else
	OpenSheet(w_oido_m, w_all_main, 5, original!)
end if

w_oido_m.setredraw(false)

w_oido_m.pb_compute.setfocus()
w_oido_m.em_3.text = LeftA(ls_orderno,10) + RightA(ls_orderno,3)
w_oido_m.pb_compute.postevent(clicked!)
w_oido_m.pb_insert.enabled  = true		// 출고의뢰작성

w_oido_m.setredraw(true)

end event

type pb_2 from picturebutton within w_oiissuereq_r
integer x = 3808
integer y = 324
integer width = 311
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "상세내역"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;// if (  issuereqdet_req_flag = "Z" OR   issuereqdet_req_flag = "B" , 0 , 1)
end event

type cbx_allview from checkbox within w_oiissuereq_r
integer x = 3945
integer y = 312
integer width = 581
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전체집계(출고)"
end type

event clicked;// 전체집계(출고)
string ls_reqdate

ls_reqdate = em_1.text

if this.checked = true then
	st_info.visible = true

	cbx_all.checked = false
	dw_3.visible  = false
	
	dw_7.visible  = true
	dw_8.visible  = true
	dw_11.visible = true
	cbx_item_sum.checked = false
	dw_12.visible = false	
else
	st_info.visible = false

	dw_7.visible  = false
	dw_8.visible  = false
	dw_11.visible = false
	
	if cbx_all.checked = true then
		dw_3.visible = true
	else
		dw_1.visible = true
	end if
end if

end event

type dw_9 from datawindow within w_oiissuereq_r
integer x = 1202
integer y = 8
integer width = 146
integer height = 92
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiissuereq_s_list1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_info from statictext within w_oiissuereq_r
integer x = 59
integer y = 272
integer width = 1001
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "확정자료 중 ~'지점이송~' 데이터는 제외"
boolean focusrectangle = false
end type

type cbx_sum from checkbox within w_oiissuereq_r
integer x = 2423
integer y = 372
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "품목소계"
end type

event clicked;// 소계보기
dw_3.setredraw( false )
if this.checked = true then
	dw_3.setsort( "item_name A, qa A" )
	dw_3.sort()
	dw_3.groupcalc()
	dw_3.Modify("DataWindow.Detail.Height=0")			// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=72")	// 소계
else
	dw_3.setsort( "req_flag D, wan_nm A, salesman A, req_seq A" )
	dw_3.sort()
	dw_3.groupcalc()
	dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
	dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계
end if
dw_3.setredraw( true )

end event

type cbx_sub from checkbox within w_oiissuereq_r
integer x = 2784
integer y = 312
integer width = 416
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "부속품보기"
end type

event clicked;// 부속품보기
if this.checked = true then
	if dw_3.rowcount() < 1 then RETURN

	dw_3.setfilter( "fit_no <> ''" )
	dw_3.filter()
	
	dw_3.setsort( "item_name A, qa A" )
	dw_3.sort()
	dw_3.groupcalc()
else
	dw_3.setfilter( "" )
	dw_3.filter()

	dw_3.setsort( "req_flag D, wan_nm A, salesman A, req_seq A" )
	dw_3.sort()
	dw_3.groupcalc()
end if

end event

type cbx_inside from checkbox within w_oiissuereq_r
integer x = 3945
integer y = 372
integer width = 462
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "계열사 제외"
end type

type dw_10 from datawindow within w_oiissuereq_r
integer x = 1202
integer y = 112
integer width = 146
integer height = 92
integer taborder = 200
boolean bringtotop = true
string title = "none"
string dataobject = "d_issuereqdet_sale_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_qty from checkbox within w_oiissuereq_r
integer x = 3813
integer y = 260
integer width = 311
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "선정수량"
end type

event clicked;// 선정수량
if this.checked = true then
	dw_1.height   = dw_1.height / 2
	dw_10.visible = true
else
	dw_1.height   = dw_1.height * 2
	dw_10.visible = false
end if

end event

type cbx_old from checkbox within w_oiissuereq_r
integer x = 4320
integer y = 260
integer width = 187
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "OLD"
end type

event clicked;// OLD 방식(분할데이터 중복)
if this.checked = true then
	dw_3.dataobject = "d_oiissuereq_s_list_old"
	dw_7.dataobject = "d_oiissuereq_ct_amt_old"
else
	dw_3.dataobject = "d_oiissuereq_s_list"
	dw_7.dataobject = "d_oiissuereq_ct_amt"
end if
dw_3.settransobject(sqlca)
dw_7.settransobject(sqlca)

dw_3.Modify("DataWindow.Detail.Height=88")		// Detail
dw_3.Modify("DataWindow.Trailer.1.Height=0")		// 소계

//
pb_retrieve.triggerevent( clicked! )

end event

type st_vertical from u_splitbar_vertical within w_oiissuereq_r
integer x = 1769
integer y = 456
integer height = 2024
boolean bringtotop = true
end type

type dw_11 from datawindow within w_oiissuereq_r
integer x = 73
integer y = 1604
integer width = 1614
integer height = 660
integer taborder = 180
boolean bringtotop = true
string title = "none"
string dataobject = "d_oiissuereq_timeamt"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_oiissuereq_r
integer x = 2286
integer y = 16
integer width = 942
integer height = 248
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79220952
end type

type dw_3 from datawindow within w_oiissuereq_r
integer x = 585
integer y = 748
integer width = 3643
integer height = 768
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_oiissuereq_s_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_3"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event retrieveend;//
if this.rowcount() > 0 then
	cbx_sub.enabled = true
	cbx_sum.enabled = true
	cbx_fix.enabled = true
else
	cbx_sub.enabled = false
	cbx_sum.enabled = false
	cbx_fix.enabled = false
end if

end event

type dw_7 from datawindow within w_oiissuereq_r
integer x = 1902
integer y = 952
integer width = 1280
integer height = 988
integer taborder = 160
boolean bringtotop = true
string title = "출고예정 금액"
string dataobject = "d_oiissuereq_ct_amt"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw = "dw_7"

end event

type dw_8 from datawindow within w_oiissuereq_r
integer x = 3237
integer y = 952
integer width = 1083
integer height = 992
integer taborder = 190
boolean bringtotop = true
string title = "출고예정 건수"
string dataobject = "d_oiissuereq_ct_cnt"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//
is_dw = "dw_8"

end event

type st_horizontal from u_splitbar_horizontal within w_oiissuereq_r
integer x = 37
integer y = 1556
integer width = 1719
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_oiissuereq_r
integer x = 919
integer y = 324
integer width = 302
integer height = 500
integer taborder = 170
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

type cbx_item_sum from checkbox within w_oiissuereq_r
integer x = 3209
integer y = 312
integer width = 544
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "품목별수주번호"
end type

event clicked;
if this.checked = true then
	dw_12.visible = true
	cbx_insert.enabled = true
	cbx_allview.checked = false
	cbx_item_sum_group.enabled	= true
else
	dw_12.visible = false
	cbx_insert.enabled = false		
	cbx_item_sum_group.enabled	= false	
end if

cbx_all.checked = false
cbx_sub.checked = false
cbx_fix.checked = false
cbx_sum.checked = false

dw_12.Modify("DataWindow.Trailer.1.Height=72")	// 소계


end event

type dw_12 from datawindow within w_oiissuereq_r
integer x = 585
integer y = 928
integer width = 3657
integer height = 576
integer taborder = 190
boolean bringtotop = true
string dataobject = "d_oiissuereq_s_sum_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_item_no, ls_item_name
 long  ll_cnt = 0

if dwo.name = 'item_no' then
	
	ls_item_no = data
	 	 
	 SELECT item_name INTO :ls_item_name FROM groupitem WHERE item_no = :ls_item_no  AND use_flag = 'Y';
      if sqlca.sqlcode = 100 then 
			return 0
      end if
      this.object.item_name[row] = ls_item_name
      
      if ls_item_no <> "" then
         SELECT count(*) INTO :ll_cnt FROM item WHERE item_no = :ls_item_no  AND use_flag = 'Y';
         if ll_cnt > 0 then
            idwc_qa.setfilter("item_no = '" + ls_item_no + "'")
            idwc_qa.filter()
         end if
//         if ll_cnt > 0 and idwc_qa.rowcount() > 0 then
//            this.setcolumn("qa")
//            this.setfocus()
//         else
//            this.setcolumn("item_no")
//            this.setfocus()
//         end if
      end if
		
end if
end event

event clicked;//
is_dw = "dw_12"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)
end event

type cbx_item_sum_group from checkbox within w_oiissuereq_r
integer x = 3209
integer y = 372
integer width = 736
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "품목별수주번호(소계)"
end type

event clicked;// 소계보기
dw_12.setredraw( false )
if this.checked = true then
	dw_12.setsort( "item_name A, qa A, cust_name A, scene_desc A" )	
	dw_12.sort()
	dw_12.groupcalc()
	dw_12.Modify("DataWindow.Detail.Height=0")			// Detail
//	dw_12.Modify("DataWindow.Trailer.1.Height=72")	// 소계
else
	dw_12.setsort( "item_name A, qa A, cust_name A, scene_desc A" )	
	dw_12.sort()
	dw_12.groupcalc()
	dw_12.Modify("DataWindow.Detail.Height=60")		// Detail
//	dw_12.Modify("DataWindow.Trailer.1.Height=72")		// 소계
end if
dw_12.setredraw( true )

end event

type cb_del from commandbutton within w_oiissuereq_r
integer x = 5257
integer y = 320
integer width = 270
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "del"
end type

event clicked;dw_12.deleterow(dw_12.getrow())
end event

type cb_ins from commandbutton within w_oiissuereq_r
integer x = 4992
integer y = 320
integer width = 270
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "ins"
end type

event clicked;gs_where2 lstr_where
long dw_12_row = 0, ll_row = 0, l_count = 0
string ls_item_no, ls_qa, ls_uom, ls_item_name, ls_loc, ls_area

lstr_where.chk     = "M"   // M:multi S:single
lstr_where.chk1    = ""
lstr_where.str8[1] = string(em_1.text,"yyyy/mm/dd")

OpenWithParm( w_whitemlocqohmulti_w2, lstr_where )

lstr_where = Message.PowerObjectParm

for ll_row = 1 to UpperBound(lstr_where.str1)         
	
   ls_item_no = trim(lstr_where.str1[ll_row])
   ls_qa     = trim(lstr_where.str2[ll_row])
   ls_uom    = trim(lstr_where.str3[ll_row])
   ls_item_name    = trim(lstr_where.name[ll_row])	
	

   select count(*) 
	into :l_count
	from itemfav 
   where item_no = :ls_item_no
	   and qa         = :ls_qa
	   and user_id = '출고의뢰';
		
   if l_count > 0 then 
		MessageBox("확인",  "물품코드["+ ls_item_no + "] 규격["+ ls_qa + "] 는 중복된 물품코드, 규격입니다.")
//		return 0
   else
	  dw_12_row = dw_12.insertrow(0)
	  dw_12.object.itemfav_user_id[dw_12_row] = '출고의뢰'
	  dw_12.object.itemfav_item_no[dw_12_row] = ls_item_no
	  dw_12.object.item_no[dw_12_row] = ls_item_no  
	  dw_12.object.itemfav_qa[dw_12_row] = ls_qa  
	  dw_12.object.qa[dw_12_row] = ls_qa    
	  dw_12.object.uom[dw_12_row] = ls_uom
	  dw_12.object.item_name[dw_12_row] = ls_item_name				
   end if

  
next  
  





end event

type cb_save from commandbutton within w_oiissuereq_r
integer x = 5527
integer y = 320
integer width = 270
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "save"
end type

event clicked;if dw_12.update() = 1 then
	commit;
   MessageBox("확인", "저장되었습니다.")
	return 1
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return 0
end if

end event

type cbx_insert from checkbox within w_oiissuereq_r
integer x = 5143
integer y = 256
integer width = 453
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "품목코드관리"
end type

event clicked;if this.checked = true then
	dw_12.reset()

	cb_ins.enabled = true
	cb_del.enabled = true	
	cb_save.enabled = true	
	gb_dw_12.enabled = true
	dw_12.dataobject = 'd_itemfav_s'
else
	cb_ins.enabled = false
	cb_del.enabled = false
	cb_save.enabled = false		
	gb_dw_12.enabled = false	
	dw_12.dataobject = 'd_oiissuereq_s_sum_list'
	
end if


dw_12.settransobject(sqlca)


end event

type st_8 from statictext within w_oiissuereq_r
integer x = 4535
integer y = 44
integer width = 2405
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "품목별수주번호,(소계)조회는 품목코드관리에 등록된 품목과 출고확정 조회"
boolean focusrectangle = false
end type

type st_9 from statictext within w_oiissuereq_r
integer x = 4535
integer y = 108
integer width = 1646
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
string text = "품목코드관리를 통해 코드 추가, 삭제 관리"
boolean focusrectangle = false
end type

type st_7 from statictext within w_oiissuereq_r
boolean visible = false
integer x = 4558
integer y = 576
integer width = 3323
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
boolean enabled = false
string text = "품목별수주번호,소계: 사업장 전체선택시 품목별수주번호,소계체크가능하게 되고 체크하면 조회  작업"
boolean focusrectangle = false
end type

type st_10 from statictext within w_oiissuereq_r
boolean visible = false
integer x = 4558
integer y = 640
integer width = 3433
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
boolean enabled = false
string text = "품목코드관리:품목별수주번호 체크하면,품목코드관리체크가능 체크해서 코드 등록,삭제 작업"
boolean focusrectangle = false
end type

type pb_tel from picturebutton within w_oiissuereq_r
integer x = 5861
integer y = 320
integer width = 937
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "저장소 담당 전화번호 관리"
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;open(w_cdlocation_telno)
end event

type gb_dw_12 from groupbox within w_oiissuereq_r
integer x = 4937
integer y = 256
integer width = 914
integer height = 192
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711935
long backcolor = 67108864
end type

