$PBExportHeader$w_cdscene_m.srw
$PBExportComments$현장관리(1998/03/14, 정재수)
forward
global type w_cdscene_m from w_inheritance
end type
type dw_3 from datawindow within w_cdscene_m
end type
type dw_4 from datawindow within w_cdscene_m
end type
type dw_5 from datawindow within w_cdscene_m
end type
type pb_excel from picturebutton within w_cdscene_m
end type
type st_1 from statictext within w_cdscene_m
end type
type st_8 from statictext within w_cdscene_m
end type
type ddlb_fld from dropdownlistbox within w_cdscene_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdscene_m
end type
type st_9 from statictext within w_cdscene_m
end type
type sle_value from singlelineedit within w_cdscene_m
end type
type cb_filteron from commandbutton within w_cdscene_m
end type
type cb_filteroff from commandbutton within w_cdscene_m
end type
type cb_1 from commandbutton within w_cdscene_m
end type
type cb_2 from commandbutton within w_cdscene_m
end type
type em_1 from editmask within w_cdscene_m
end type
type em_2 from editmask within w_cdscene_m
end type
type st_2 from statictext within w_cdscene_m
end type
type st_vertical from u_splitbar_vertical within w_cdscene_m
end type
type gb_4 from groupbox within w_cdscene_m
end type
type dw_6 from datawindow within w_cdscene_m
end type
type ddlb_op from dropdownlistbox within w_cdscene_m
end type
type rb_normal from radiobutton within w_cdscene_m
end type
type rb_approval from radiobutton within w_cdscene_m
end type
type cb_all from commandbutton within w_cdscene_m
end type
type cb_approval from commandbutton within w_cdscene_m
end type
type cb_3 from commandbutton within w_cdscene_m
end type
type st_3 from statictext within w_cdscene_m
end type
type st_4 from statictext within w_cdscene_m
end type
type cb_4 from commandbutton within w_cdscene_m
end type
type dw_7 from datawindow within w_cdscene_m
end type
type gb_approval from groupbox within w_cdscene_m
end type
end forward

global type w_cdscene_m from w_inheritance
integer width = 4279
integer height = 2560
string title = "거래처 현장관리(w_cdscene_m)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
pb_excel pb_excel
st_1 st_1
st_8 st_8
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
em_1 em_1
em_2 em_2
st_2 st_2
st_vertical st_vertical
gb_4 gb_4
dw_6 dw_6
ddlb_op ddlb_op
rb_normal rb_normal
rb_approval rb_approval
cb_all cb_all
cb_approval cb_approval
cb_3 cb_3
st_3 st_3
st_4 st_4
cb_4 cb_4
dw_7 dw_7
gb_approval gb_approval
end type
global w_cdscene_m w_cdscene_m

type variables
public string is_scene_code, is_scene_desc, is_custno, is_custname
st_print i_print
string   is_dw, is_dw4sql
long     i_row

datawindowchild idwc_cust, idwc_cust_name, idwc_codemst

string	is_approval				//'Y', 'N' 승인 권한자 
string	is_selectall			//'Y', 'N' 
string	is_retrieve_clicked	//'R' 조회모드, 'I' 입력모드
end variables

forward prototypes
public function string wf_nextcode (string as_str)
public function string wf_nextcode_num (string as_str)
public subroutine wf_button_control (string as_gubun)
end prototypes

public function string wf_nextcode (string as_str);string ls_str
CHOOSE CASE as_str
	CASE 'A'
		ls_str = 'B'
	CASE 'B'
		ls_str = 'C'
	CASE 'C'
		ls_str = 'D'
	CASE 'D'
		ls_str = 'E'
	CASE 'E'
		ls_str = 'F'
	CASE 'F'
		ls_str = 'G'
	CASE 'G'
		ls_str = 'H'
	CASE 'H'
		ls_str = 'I'
	CASE 'I'
		ls_str = 'J'
	CASE 'J'
		ls_str = 'K'
	CASE 'K'
		ls_str = 'L'
	CASE 'L'
		ls_str = 'M'
	CASE 'M'
		ls_str = 'N'
	CASE 'N'
		ls_str = 'O'
	CASE 'O'
		ls_str = 'P'
	CASE 'P'
		ls_str = 'Q'
	CASE 'Q'
		ls_str = 'R'
	CASE 'R'
		ls_str = 'S'
	CASE 'S'
		ls_str = 'T'
	CASE 'T'
		ls_str = 'U'
	CASE 'U'
		ls_str = 'V'
	CASE 'V'
		ls_str = 'W'
	CASE 'W'
		ls_str = 'X'
	CASE 'X'
		ls_str = 'Y'
	CASE 'Y'
		ls_str = 'Z'
END CHOOSE

return ls_str
end function

public function string wf_nextcode_num (string as_str);string ls_str, ls_str1, ls_str2, ls_han[26]
long i, j, l_check1 =0 , l_check2 =0 

ls_han[1] =  'A'
ls_han[2] =  'B'
ls_han[3] =  'C'
ls_han[4] =  'D'
ls_han[5] =  'E'
ls_han[6] =  'F'
ls_han[7] =  'G'
ls_han[8] =  'H'
ls_han[9] =  'I'
ls_han[10] =  'J'
ls_han[11] =  'K'
ls_han[12] =  'L'
ls_han[13] =  'M'
ls_han[14] =  'N'
ls_han[15] =  'O'
ls_han[16] =  'P'
ls_han[17] =  'Q'
ls_han[18] =  'R'
ls_han[19] =  'S'
ls_han[20] =  'T'
ls_han[21] =  'U'
ls_han[22] =  'V'
ls_han[23] =  'W'
ls_han[24] =  'X'
ls_han[25] =  'Y'
ls_han[26] =  'Z'


if isnull(as_str) or as_str = '' or as_str = 'ZZ' then
		ls_str = '01'
ELSE
	
		if isnumber(as_str) then		// 두자릿수가 숫자일때 숫자를 반영
		
			if  integer(as_str) + 1 <= 99 then // 숫자가 끝날때냐, 아니냐 구분
				ls_str = string(integer(as_str) + 1,'00')
			else	
				ls_str = ls_han[1] + '1'
			end if
		
		else
			
			if isnumber(MidA(as_str,2,1)) then // 마지막이 숫자일때
				
				for i = 1 to 26
					if MidA(as_str,1,1) = ls_han[i] then
						l_check1 = i
						exit
					end if
				next		
				
				if integer(MidA(as_str,2,1))+1 <= 9  then
					
					ls_str = ls_han[l_check1] + string(integer(MidA(as_str,2,1))+1)
					
				else
					
						if as_str = 'Z9' THEN
							ls_str = 'AA'
						else
						
									if l_check1 < 26 then
										ls_str = ls_han[l_check1+1] + '1'									
									else
										//첫번째 문자를 찾아 낸다.
										for i = 1 to 26
											if MidA(as_str,1,1) = ls_han[i] then
												l_check1 = i
												exit
											end if
										next
										
										
										for j = 1 to 26
											if MidA(as_str,2,1) = ls_han[j] then
												l_check2 = j
												exit
											end if
										next
										
										
										if l_check2 = 26 then // 마지막이 z 이므로 넘어가야 한다.
											
											IF l_check1 = 26 then // 여기는 'zz' 이므로 더이상 생성할 수 없음.
												ls_str = ''
											else
												ls_str = ls_han[l_check1+1] + ls_han[1]
											end if
										
										else
											ls_str =  ls_han[l_check1] + ls_han[l_check2+1]
										end if					
										
									end if
									
						END IF
					
				end if
		
				
			else
				
						if as_str = 'Z9' THEN
							ls_str = 'AA'
						else				
					
								//첫번째 문자를 찾아 낸다.
								for i = 1 to 26
									if MidA(as_str,1,1) = ls_han[i] then
										l_check1 = i
										exit
									end if
								next
								
								
								for j = 1 to 26
									if MidA(as_str,2,1) = ls_han[j] then
										l_check2 = j
										exit
									end if
								next
								
								
								if l_check2 = 26 then // 마지막이 z 이므로 넘어가야 한다.
									
									IF l_check1 = 26 then // 여기는 'zz' 이므로 더이상 생성할 수 없음.
										ls_str = ''
									else
										ls_str = ls_han[l_check1+1] + ls_han[1]
									end if
								
								else
									ls_str =  ls_han[l_check1] + ls_han[l_check2+1]
								end if	
	
						END IF
					
			end if	
			
			
		END IF	
end if



return ls_str
end function

public subroutine wf_button_control (string as_gubun);date  ld_sdate, ld_edate

choose case as_gubun
	case 'open'
		if is_approval = "Y" then					
			cb_all.enabled			= true
			cb_approval.enabled	= true	
			rb_normal.checked		= false
			rb_approval.checked	= true
			dw_6.dataobject = 'd_cdscene_approval'
			dw_6.settransobject(sqlca)	
		else
			gb_approval.visible	= false	
			rb_normal.visible		= false	
			rb_approval.visible	= false	
			cb_all.visible			= false
			cb_approval.visible	= false	
		end if
		
	case 'rb_normal'		//일반 라디오 버튼
		cb_all.enabled			= false
		cb_approval.enabled	= false
		dw_6.dataobject = 'd_cdscene_xls'
		dw_6.settransobject(sqlca)	
		ld_sdate   = date(em_1.text)
		ld_edate   = date(em_2.text)
		dw_6.retrieve( ld_sdate, ld_edate )
		
	case 'rb_approval'	//승인 라디오 버튼
		cb_all.enabled			= true
		cb_approval.enabled	= true
		dw_6.dataobject = 'd_cdscene_approval'
		dw_6.settransobject(sqlca)
		ld_sdate   = date(em_1.text)
		ld_edate   = date(em_2.text)
		dw_6.retrieve( ld_sdate, ld_edate )	
	
end choose
end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

st_vertical.of_set_leftobject( dw_5 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_minsize(250, 250)

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_4.visible	= false
dw_6.visible   = false
dw_7.visible	= false	

pb_retrieve.enabled = false
pb_print.enabled = false
pb_excel.enabled = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
is_dw4sql = dw_4.describe("datawindow.table.select")

dw_5.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_7.settransobject(sqlca)

// 거래처
dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

// 현장구분
dw_2.getchild("gubun", idwc_codemst)
idwc_codemst.settransobject(sqlca)
idwc_codemst.retrieve("현장구분")


em_1.text = string(today(),"yyyy/mm/dd")
em_2.text = string(today(),"yyyy/mm/dd")

if GF_PERMISSION("거래처 현장관리(전체)", gs_userid) = "Y" then
	pb_retrieve.enabled = true
	pb_excel.enabled    = true
	//pb_save.enabled     = true
end if

if GF_PERMISSION("거래처 현장관리 승인자", gs_userid) = "Y" then
	dw_2.Modify("approval_yn.TabSequence='200'")
	is_approval				= 'Y'
	is_selectall			= 'Y'	
else
	is_approval				= 'N'
	is_selectall			= 'N'	
end if
is_retrieve_clicked		= 'I'			//입력모드
//버튼 권한
wf_button_control('open')
	
end event

on w_cdscene_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.pb_excel=create pb_excel
this.st_1=create st_1
this.st_8=create st_8
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.em_1=create em_1
this.em_2=create em_2
this.st_2=create st_2
this.st_vertical=create st_vertical
this.gb_4=create gb_4
this.dw_6=create dw_6
this.ddlb_op=create ddlb_op
this.rb_normal=create rb_normal
this.rb_approval=create rb_approval
this.cb_all=create cb_all
this.cb_approval=create cb_approval
this.cb_3=create cb_3
this.st_3=create st_3
this.st_4=create st_4
this.cb_4=create cb_4
this.dw_7=create dw_7
this.gb_approval=create gb_approval
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.pb_excel
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_8
this.Control[iCurrent+7]=this.ddlb_fld
this.Control[iCurrent+8]=this.ddlb_dwtitles
this.Control[iCurrent+9]=this.st_9
this.Control[iCurrent+10]=this.sle_value
this.Control[iCurrent+11]=this.cb_filteron
this.Control[iCurrent+12]=this.cb_filteroff
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.em_1
this.Control[iCurrent+16]=this.em_2
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_vertical
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.dw_6
this.Control[iCurrent+21]=this.ddlb_op
this.Control[iCurrent+22]=this.rb_normal
this.Control[iCurrent+23]=this.rb_approval
this.Control[iCurrent+24]=this.cb_all
this.Control[iCurrent+25]=this.cb_approval
this.Control[iCurrent+26]=this.cb_3
this.Control[iCurrent+27]=this.st_3
this.Control[iCurrent+28]=this.st_4
this.Control[iCurrent+29]=this.cb_4
this.Control[iCurrent+30]=this.dw_7
this.Control[iCurrent+31]=this.gb_approval
end on

on w_cdscene_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.pb_excel)
destroy(this.st_1)
destroy(this.st_8)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_2)
destroy(this.st_vertical)
destroy(this.gb_4)
destroy(this.dw_6)
destroy(this.ddlb_op)
destroy(this.rb_normal)
destroy(this.rb_approval)
destroy(this.cb_all)
destroy(this.cb_approval)
destroy(this.cb_3)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cb_4)
destroy(this.dw_7)
destroy(this.gb_approval)
end on

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)
gb_4.width  = newwidth  - (gb_3.x * 2)

dw_5.height = newheight - dw_5.y - gb_3.x

st_vertical.x      = dw_5.x + dw_5.width
st_vertical.height = dw_5.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.y      = dw_5.y
dw_2.width  = newwidth  - dw_2.x - gb_3.x
dw_2.height = dw_5.height

//
dw_6.x      = dw_5.x
dw_6.y      = dw_5.y
dw_6.width  = newwidth  - (gb_3.x * 2)
dw_6.height = newheight - dw_6.y - gb_3.x

end event

type pb_save from w_inheritance`pb_save within w_cdscene_m
integer x = 2720
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;//
long ll_row
Boolean SW_Exit
string      ls_utong_yn, ls_input_date, ls_scene_code

dw_6.visible = false

dw_2.accepttext()
if dw_2.rowcount() < 1 then RETURN

/* 2019.01.22 jowonsuk
sw_exit = true
*/
	
/*for ll_row = 1 to dw_2.rowcount()*/
	// 기존데이터 SKIP
	
	/*
		2019.01.23 jowonsuk 전체를 돌리는게 아니고 현재 선택한 행만 점검 저장 
		날짜 조회 로직 변경 
	*/
	ll_row = i_row
	
	ls_scene_code = dw_2.object.scene_code[ll_row]
	
	
	select convert(char(10), input_date,111)
	into :ls_input_date
	from scene
	where scene_code =  :ls_scene_code;
	
	
	if ls_input_date > "2010/06/21" then
		
		if dw_2.object.area_nm[ll_row] = "" or IsNull(dw_2.object.area_nm[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 지역이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("area_nm")
			dw_2.setfocus()
			return
/*			2019.01.22 jowonsuk
			sw_exit = false
			continue
*/			
		end if
	
		if trim(dw_2.object.project_nm[ll_row]) = "" or IsNull(dw_2.object.project_nm[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 공사명이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("project_nm")
			dw_2.setfocus()
			return			
/*			2019.01.22 jowonsuk
			sw_exit = false
			continue
*/			
		end if
	
		if trim(dw_2.object.owner[ll_row]) = "" or IsNull(dw_2.object.owner[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 건설사명이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("owner")
			dw_2.setfocus()
			return			
/*			2019.01.22 jowonsuk
			sw_exit = false
			continue
*/			
		end if
		
		/*JOWONSUK 2019.01.22 위치수정, 내용 변경, 필수입력 변경 */
		
		/* 2019.01.22
		신규
		APT-민수	AP1		1
		APT-주공	AP2		2
		학교	SCH			3
		유통	DIS			4
		일반	NOM			5
		철도공항	STA		6
		기타	ETC			7
		
		/기준/
		SUB	지하철			1
		APT	아파트			2
		COM	복합상가		3
		SCH	학교			4
		HOS	병원			5
		HOT	호텔			6
		DIS	유통			7
		OFF	오피스텔		8
		
		*/
		
		if ls_input_date > "2019/01/21" then
			
			if trim(dw_2.object.gubun[ll_row]) = "" or IsNull(dw_2.object.gubun[ll_row]) then
				MessageBox("오류", string(ll_row,"##0") + "번째 현장구분이 입력되지 않았습니다.",exclamation!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("gubun")
				dw_2.setfocus()
				return				
/*			2019.01.22 jowonsuk
			sw_exit = false
			continue
*/					
			end if
			
		end if

		if ls_input_date > "2013/08/23" then
			if trim(dw_2.object.scene_telcap[ll_row]) = "" or IsNull(dw_2.object.scene_telcap[ll_row]) then
				MessageBox("오류", string(ll_row,"##0") + "번째 보조연락처가 입력되지 않았습니다.",exclamation!)
				dw_2.scrolltorow(ll_row)
				dw_2.setcolumn("scene_telcap")
				dw_2.setfocus()
				return				
/*			2019.01.22 jowonsuk
			sw_exit = false
			continue
*/			
			end if
		end if

		// 현장명 조합하기
		IF dw_2.object.owner[ll_row] = "직발주" then
			dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/"
		ELSE
			dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/" + dw_2.object.owner[ll_row]
		END IF
		
		/*
				2018.05.17 jownsuk 유통업체유무 체크 로직 반영 1.유통업체, 2.유통업체외 유통업체는 퀄리티 높은 제품을 출고해야하는 거래처의 현장이다.
			     판매수주등록, 판매수주출력, 생산계획조정, 작업지시출력에 반영, 품목별 재고현황 등에 현장에 따라 색깔을 넣어서 구분
				  
				유통업체유무에 아무것도 선택하지 않을때는 'N' 이다.
		*/
		ls_utong_yn = dw_2.object.utong_yn[ll_row]

		IF ISNULL(ls_utong_yn) OR ls_utong_yn = '' then
			dw_2.object.utong_yn[ll_row] = 'N'
		end if
		
   ELSE  // "2010/06/21" 
		IF dw_2.object.area_nm[ll_row] = "" OR	dw_2.object.project_nm[ll_row] = "" OR dw_2.object.owner[ll_row] = "" THEN
		ELSE
			// 현장명 조합하기
			IF dw_2.object.owner[ll_row] = "직발주" then
				dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/"
			ELSE
				dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/" + dw_2.object.owner[ll_row]
			END IF
		END IF
  END IF

/*next */

/*			2019.01.22 jowonsuk 주석처리 
if sw_exit = false then
	MessageBox("오류", string(ll_row - 1,"##0") + "번째 지역,공사명,건설사명, 현장구분이 입력되지 않았습니다.",exclamation!)
	return
end if
*/

if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 1 then
	setpointer(hourglass!)
	if wf_nullchk(dw_2) = false then
		return
	end if	
	
	//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//=============================================================================================
	wf_update1(dw_2,"Y") 
end if



end event

type dw_1 from w_inheritance`dw_1 within w_cdscene_m
integer x = 46
integer y = 268
integer width = 2775
integer height = 84
integer taborder = 50
string dataobject = "d_custddw_c"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
end type

event dw_1::itemchanged;string ls_cust, ls_cust_nm, ls_salesman

// 거래처별 현장관리(전체)
dw_2.reset()
dw_3.reset()
dw_5.reset()

choose case dwo.name
	case 'cust_no'
		this.setitem(1, 'cust_name', '')
		ls_cust	= data
		select 
			cust_name
		into
			:ls_cust_nm
		from
			customer
		where
			open_close <> 'C'
		and			
			cust_no = :ls_cust
		using sqlca;
		
		choose case sqlca.sqlcode
			case 100
				Messagebox('확인','입력한 거래처코드의 거래처는 존재하지 않습니다.')
				return
			case -1
				Messagebox('확인','다시 시도하세요.')
				return
		end choose
		this.setitem(1, 'cust_name', ls_cust_nm)
		
	case 'cust_name'
		this.setitem(1, 'cust_no', '')
		ls_cust_nm	= data
		select 
			cust_no
		into
			:ls_cust
		from
			customer
		where
			open_close <> 'C'
		and			
			cust_name = :ls_cust_nm
		using sqlca;
		
		choose case sqlca.sqlcode
			case 100
				Messagebox('확인','입력한 거래처코드의 거래처는 존재하지 않습니다.')
				return
			case -1
				Messagebox('확인','다시 시도하세요.')
				return
		end choose
		this.setitem(1, 'cust_no', ls_cust)
end choose

if GF_PERMISSION('거래처 현장관리(전체)', gs_userid) = 'Y' then
	ls_salesman = "%"
else
	SELECT salesman INTO :ls_salesman
	  FROM customer 
	 WHERE cust_no = :ls_cust AND salesman = :gs_userid;	
end if

if isnull(ls_salesman) OR ls_salesman = "" then
else
	dw_2.retrieve( ls_cust )
	dw_3.retrieve( ls_cust )
	dw_5.retrieve( ls_cust )
	this.setfocus()
end if

end event

type st_title from w_inheritance`st_title within w_cdscene_m
integer y = 12
integer width = 1033
string text = "거래처 현장관리"
end type

type st_tips from w_inheritance`st_tips within w_cdscene_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdscene_m
boolean visible = false
integer y = 48
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdscene_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance`pb_close within w_cdscene_m
integer x = 2907
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdscene_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 130
end type

event pb_print::clicked;////
//gs_codere_str lst_code
//w_repsuper    w_print
//st_print      l_print
//st_security   lst_security
//string ls_cust_no, ls_where, ls_orderby, ls_sql
//string ls_desc
//
//dw_6.visible = false
//
//OpenWithParm(w_whsceneprn_w, lst_code)
//lst_code = message.powerobjectparm
//if lst_code.okcancel = "N" then return
//
////==GF_USEPROGRAM(프로그램 사용현황)===========================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////=============================================================================================
//
//string ls_level_userid
//choose case gs_level
//	case "A", "B"			
//		ls_level_userid = "%"
//	case "C"
//		ls_level_userid = gs_userid
//end choose
//
//string ls_userid
//string ls_title
//ls_userid = gs_userid
//ls_title  = st_title.text
//	
//ls_cust_no = dw_1.object.cust_no[dw_1.getrow()]
//if lst_code.flag = "A" then
//	ls_desc    = "업체명 : " + dw_1.object.cust_name[1] + "/ 출력"
//	ls_where   = "   AND scene.cust_no        = ~~'" + ls_cust_no      + "~~'" + & 
//	             "   AND customer.salesman LIKE ~~'" + ls_level_userid + "~~'"	
//	ls_orderby = " ORDER BY input_date DESC "
// 	ls_sql     = "datawindow.table.select = '" + is_dw4sql + ls_where + ls_orderby + "'"
//else
//	ls_desc    = "업체명 : " + lst_code.start_no + " ~ " + lst_code.end_no + "/ 출력"
//	ls_where   = "   AND scene.cust_no          = ~~'" + ls_cust_no + "~~'" + &
//	             "   AND scene.scene_code between ~~'" + lst_code.start_no + "~~' AND ~~'" + lst_code.end_no + "~~'" + & 
//				    "   AND customer.salesman   LIKE ~~'" + ls_level_userid + "~~'"
//	ls_orderby = " ORDER BY input_date DESC"
// 	ls_sql     = "datawindow.table.select = '" + is_dw4sql + ls_where + ls_orderby + "'"
//end if
//dw_4.settransobject(sqlca)
//dw_4.modify(ls_sql)
//dw_4.retrieve()
//
//l_print.st_datawindow  = dw_4
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 현장내역을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdscene_m
boolean visible = false
integer x = 0
integer y = 0
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdscene_m
integer x = 2345
integer taborder = 150
end type

event pb_delete::clicked;string ls_order_no, ls_scene_no, ls_approval_yn, ls_temp, ls_scene_desc
dwitemstatus l_status

dw_6.visible = false
if dw_2.rowcount() < 1 then return	
dw_2.accepttext()


ls_scene_desc	= dw_2.getitemstring(dw_2.getrow(), 'scene_desc')
l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
if l_status = newmodified! then
	dw_2.deleterow(dw_2.getrow())
elseif MessageBox("확인",'현장(' +ls_scene_desc + ')을~r~n삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	ls_approval_yn	= dw_2.getitemstring(dw_2.getrow(), "approval_yn")
	if ls_approval_yn = 'Y' then
		ls_temp	= "승인된 자료는 삭제할수 없습니다.~r~n담당자에게 문의하세요."
		messagebox("주의",ls_temp)
		return
	end if

	ls_scene_no		= dw_2.getitemstring(dw_2.getrow(), "scene_code")
	
	SELECT order_no INTO :ls_order_no
	  FROM sale
	 WHERE scene_code = :ls_scene_no;
	
	if ls_order_no = '' or isnull(ls_order_no) then
		dw_2.deleterow(dw_2.getrow())
		wf_update1(dw_2, "Y")
   else	
		messagebox("삭제오류","이 현장에 대해 이미 수주가 접수되어있습니다." + &
		           "~r~n삭제할 수 없습니다.",exclamation!)
		return
	end if
end if	



end event

type pb_insert from w_inheritance`pb_insert within w_cdscene_m
integer x = 2158
integer taborder = 170
end type

event pb_insert::clicked;//
string ls_cust_no, ls_seq, ls_scene, ls_desc, ls_charge, ls_scene_no
long   ll_row, ll_scene

dw_6.visible = false

dw_1.accepttext()
ll_row = dw_2.getrow()

if ll_row > 0 then
	dw_2.accepttext()
	ls_desc = dw_2.getitemstring(dw_2.rowcount(), "scene_desc")
	ls_charge = dw_2.getitemstring(dw_2.rowcount(), "scene_charge")
	if isnull(ls_desc) or ls_desc = ""  then
		messagebox("확인","현장명을 입력하세요!",information!)
		dw_2.scrolltorow(dw_2.rowcount())
		dw_2.setcolumn("scene_desc")
		return
	elseif isnull(ls_charge) or ls_charge = "" then
		messagebox("확인","현장관리자를 입력하세요!",information!)
		dw_2.scrolltorow(dw_2.rowcount())
		dw_2.setcolumn("scene_charge")
		return
	end if
end if


ll_row = dw_2.insertrow( 0 )
i_row = ll_row

dw_2.scrolltorow(ll_row)
	
dw_2.object.gen_date[ll_row] = GF_Today()		// 등록일자
dw_2.object.user_id[ll_row]  = GS_userid		// 등록일자
dw_2.object.scene_desc[ll_row]  = ''			// 현장명
dw_2.object.scene_charge[ll_row]  = ''			// 현장관리자
dw_2.object.utong_yn[ll_row]  = 'N'				// 유통업체외


// 현장코드 자동 부여
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")

string ls_gubun, l_scene_code1, l_scene_code2, ls_num
int    l_count = 0, l_count1 = 0, ll_count = 0

//// 최초건인지 검증하는 로직//
//
//  SELECT count(*)
//    INTO :ll_count
//    FROM scene  
//   WHERE scene.cust_no = :ls_cust_no   
//		 and  scene.scene_code like '%'+ :ls_cust_no+'%';
		 
// 2017.11.25일 조원석 로직 작업
// 1. 기존 로직에서 년도+'ZZ' 가 존재하면 중가 '-' 값을 새롭게 바꾼다. '_' 로  ①-,  ②_, ③+

//if ll_row > 1 then
//	
//	  ls_gubun = ''
//	
//	  SELECT count(*)
//		 INTO :l_count
//		 FROM scene  
//		WHERE scene.cust_no = :ls_cust_no   
//			 and  scene.scene_code like '%'+ :ls_cust_no +'-'+cast(datepart(yyyy, getdate()) as nvarchar(4))+'ZZ';
//		
//		IF mid(dw_2.object.scene_code[ll_row - 1], 10, 2) = 'ZZ' and	mid(dw_2.object.scene_code[ll_row - 1], 5, 1) = '-' then
//			l_count = 1
//		end if		 
//	
//		if l_count <> 0 then // '-'로 생성된게 다 참.
//			  
//			  l_count1 = 0
//			
//				SELECT count(*)
//				 INTO :l_count1
//				 FROM scene  
//				WHERE scene.cust_no = :ls_cust_no   
//				 and  scene.scene_code = :ls_cust_no +'_'+cast(datepart(yyyy, getdate()) as nvarchar(4))+'ZZ';	
//				 
//				IF mid(dw_2.object.scene_code[ll_row - 1], 10, 2) = 'ZZ' and	mid(dw_2.object.scene_code[ll_row - 1], 5, 1) = '_' then
//					l_count1 = 1
//				end if		 		 
//					 
//				if l_count1 <> 0 then  // '+'로 생성된게 다 참.
//						ls_gubun = '+'			
//				else
//						ls_gubun = '_'
//				end if
//				
//		else
//				ls_gubun = '-'	
//		end if
//		
//else		
//	ls_gubun = '-'	
//end if


// 2018. 4. 9일 조원석 로직 작업
// 2017.11.25일 로직 오류로 신규 로직 작성.
// 1. 기존 로직에서 년도+'ZZ' 가 존재하면 중가 '-' 값을 새롭게 바꾼다. '_' 로  ①-,  ②_, ③+

  ls_gubun = '-'
  l_count = 0
  
  select count(*)
  into :l_count
  FROM scene  
   WHERE scene.cust_no = :ls_cust_no
       AND LTRIM(substring(scene_code,5,1)) = :ls_gubun
       AND substring(scene_code,6,4) =  convert(char(4), getdate(),121);
		 

 if l_count >= 1296 then
	
	  ls_gubun = '_'	
	  l_count = 0
	  
	  select count(*)
	  into :l_count
	  FROM scene  
		WHERE scene.cust_no = :ls_cust_no
			 AND LTRIM(substring(scene_code,5,1)) = :ls_gubun
			 AND substring(scene_code,6,4) =  convert(char(4), getdate(),121);	
		 
	
	if l_count >= 1296 then
		
		ls_gubun = '+'
				
	end if
	
end if


SELECT  TOP 1  :ls_cust_no+:ls_gubun+ convert(char(4), getdate(),121)  +A.CODE
into :ls_scene
FROM 
(
      SELECT  A.A+B.B CODE
      FROM 
      (
        SELECT '0'  A
        UNION ALL
        SELECT '1' 
        UNION ALL
        SELECT '2' 
        UNION ALL
        SELECT '3'  
        UNION ALL
        SELECT '4'  
        UNION ALL
        SELECT '5'  
        UNION ALL
        SELECT '6'  
        UNION ALL
        SELECT '7'  
        UNION ALL
        SELECT '8'  
        UNION ALL
        SELECT '9'  
        UNION ALL
        SELECT 'A' 
        UNION ALL
        SELECT 'B' 
        UNION ALL
        SELECT 'C'  
        UNION ALL
        SELECT 'D'  
        UNION ALL
        SELECT 'E'  
        UNION ALL
        SELECT 'F'  
        UNION ALL
        SELECT 'G'  
        UNION ALL
        SELECT 'H'  
        UNION ALL
        SELECT 'I'  
        UNION ALL
        SELECT 'J'  
        UNION ALL
        SELECT 'K'  
        UNION ALL
        SELECT 'L'  
        UNION ALL
        SELECT 'M'  
        UNION ALL
        SELECT 'N'  
        UNION ALL
        SELECT 'O'  
        UNION ALL
        SELECT 'P'  
        UNION ALL
        SELECT 'Q'  
        UNION ALL
        SELECT 'R'  
        UNION ALL
        SELECT 'S'  
        UNION ALL
        SELECT 'T'  
        UNION ALL
        SELECT 'U'  
        UNION ALL
        SELECT 'V'  
        UNION ALL
        SELECT 'W'  
        UNION ALL
        SELECT 'X'  
        UNION ALL
        SELECT 'Y'  
        UNION ALL
        SELECT 'Z'  
      ) A,
      (
        SELECT '0'  B
        UNION ALL
        SELECT '1' 
        UNION ALL
        SELECT '2' 
        UNION ALL
        SELECT '3'  
        UNION ALL
        SELECT '4'  
        UNION ALL
        SELECT '5'  
        UNION ALL
        SELECT '6'  
        UNION ALL
        SELECT '7'  
        UNION ALL
        SELECT '8'  
        UNION ALL
        SELECT '9'  
        UNION ALL
        SELECT 'A' 
        UNION ALL
        SELECT 'B' 
        UNION ALL
        SELECT 'C'  
        UNION ALL
        SELECT 'D'  
        UNION ALL
        SELECT 'E'  
        UNION ALL
        SELECT 'F'  
        UNION ALL
        SELECT 'G'  
        UNION ALL
        SELECT 'H'  
        UNION ALL
        SELECT 'I'  
        UNION ALL
        SELECT 'J'  
        UNION ALL
        SELECT 'K'  
        UNION ALL
        SELECT 'L'  
        UNION ALL
        SELECT 'M'  
        UNION ALL
        SELECT 'N'  
        UNION ALL
        SELECT 'O'  
        UNION ALL
        SELECT 'P'  
        UNION ALL
        SELECT 'Q'  
        UNION ALL
        SELECT 'R'  
        UNION ALL
        SELECT 'S'  
        UNION ALL
        SELECT 'T'  
        UNION ALL
        SELECT 'U'  
        UNION ALL
        SELECT 'V'  
        UNION ALL
        SELECT 'W'  
        UNION ALL
        SELECT 'X'  
        UNION ALL
        SELECT 'Y'  
        UNION ALL
        SELECT 'Z'  
      ) B
) A LEFT OUTER JOIN 
(
	select substring(scene_code,10,2) SCENE_CODE
	  FROM scene  
		WHERE scene.cust_no = :ls_cust_no
			 AND LTRIM(substring(scene_code,5,1)) = :ls_gubun
			 AND substring(scene_code,6,4) = convert(char(4), getdate(),121)
) B ON A.CODE = B.SCENE_CODE
WHERE SCENE_CODE IS NULL;


/*

if (l_count + l_count1) = 0  then

	if ll_row = 1 then
		ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + '01'
	else
		if mid(dw_2.object.scene_code[ll_row - 1], 6, 4) = string(today(),'yyyy') then
			if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 10, 2)) = true then
				ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 10, 2))
				ll_scene = ll_scene + 1
				if ll_scene >= 100 then
					ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + string(ll_scene, 'A1')
				else
					ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + string(ll_scene, '00')
				end if
			else
				CHOOSE CASE mid(dw_2.object.scene_code[ll_row - 1], 10, 1)
					CASE "A"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "A1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "A" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "BA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "A" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "B"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "C1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "B" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "CA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "B" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "C"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "D1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "C" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "DA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "C" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "D"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "E1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "D" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "EA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "D" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "E"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "F1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "E" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "FA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "E" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "F"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "G1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "F" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "GA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "F" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "G"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "H1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "G" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "HA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "G" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "H"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "I1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "H" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "IA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "H" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "I"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "J1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "I" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "JA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "I" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "J"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "K1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "J" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "KA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "J" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "K"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "L1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "K" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "LA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "K" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "L"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "M1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "L" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "MA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "L" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "M"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "N1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "M" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "NA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "M" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "N"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "O1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "N" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "OA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "N" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "O"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "P1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "O" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "PA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "O" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "P"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Q1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "P" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "QA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "P" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "Q"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "R1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Q" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "RA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Q" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "R"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "S1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "R" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "SA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "R" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "S"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "T1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "S" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "TA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "S" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "T"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "U1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "T" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "UA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "T" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "U"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "V1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "U" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "VA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "U" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "V"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "W1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "V" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "WA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "V" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "W"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "X1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "W" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "XA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "W" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "X"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Y1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "X" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "YA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "X" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "Y"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Z1"
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Y" + string(ll_scene, '0')
							else
								if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "ZA"
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Y" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
					CASE "Z"
						if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//							ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "AA"
//							여기는 소스가 다 찬것임. 로직을 다시 짜야함..
						else
							if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
								ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								ll_scene = ll_scene + 1
								ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Z" + string(ll_scene, '0')
							else
								if mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
									
									MessageBox("확인","현장코드 MAX값 초과 하였습니다.")
									RETURN
								else
									ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Z" &
											+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
								end if
							end if
						end if
						
					END CHOOSE
	
			end if
		ELSE
			ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + '01'
		END IF
	END IF

else
	
//	if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//		ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "AA"
//	else
//		if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//			ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//			ll_scene = ll_scene + 1
//			ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + "Z" + string(ll_scene, '0')
//		else
//			if mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//				
//				MessageBox("확인","현장코드 MAX값 초과 하였습니다.")
//				RETURN
//			else
				ls_num = wf_nextcode_num(mid(dw_2.object.scene_code[ll_row - 1], 10, 2))
				
				if ls_num = '' then
					MessageBox("확인","현장코드 MAX값 초과 하였습니다.")					
				else
					ls_scene = ls_cust_no + ls_gubun + string(today(), 'yyyy') + ls_num	// 신규로직 2017.11.22 조원석				
				end if
	
				

//				RETURN				
//			end if
//		end if
//	end if
						
end if
*/
// 2017.11.25일전 기존 로직 보관
//if ll_row = 1 then
//   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + '01'
//else
//	if mid(dw_2.object.scene_code[ll_row - 1], 6, 4) = string(today(),'yyyy') then
//		if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 10, 2)) = true then
//			ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 10, 2))
//			ll_scene = ll_scene + 1
//			if ll_scene >= 100 then
//		      ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + string(ll_scene, 'A1')
//			else
//	   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + string(ll_scene, '00')
//			end if
//		else
//			CHOOSE CASE mid(dw_2.object.scene_code[ll_row - 1], 10, 1)
//				CASE "A"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "A" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "BA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "A" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "B"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "CA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "C"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "DA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "D"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "EA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "E"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "FA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "F"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "GA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "G"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "HA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "H"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "IA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "I"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "JA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "J"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "KA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "K"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "LA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "L"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "MA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "M"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "NA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "N"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "OA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "O"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "PA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "P"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "QA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "Q"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "RA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "R"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "SA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "S"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "TA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "T"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "UA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "U"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "VA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "V"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "WA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "W"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "XA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "X"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "YA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "Y"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z1"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y" + string(ll_scene, '0')
//						else
//							if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "ZA"
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//				CASE "Z"
//					if  mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
//			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "AA"
//					else
//						if isnumber(mid(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
//							ll_scene = integer(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							ll_scene = ll_scene + 1
//							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z" + string(ll_scene, '0')
//						else
//							if mid(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
//								
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + wf_nextcode_num(mid(dw_2.object.scene_code[ll_row - 1], 10, 2))	// 신규로직 2017.11.22 조원석
//								
//								if right(ls_scene,2) = '' then
//									MessageBox("확인","현장코드 MAX값 초과 하였습니다.")
//									RETURN
//								end if
//								
////								MessageBox("확인","현장코드 MAX값 초과 하였습니다.")
////								RETURN
//							else
//								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z" &
//										+ wf_nextcode(mid(dw_2.object.scene_code[ll_row - 1], 11, 1))
//							end if
//						end if
//					end if
//					
//				CASE "a"	, "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
//
//						ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + wf_nextcode_num(mid(dw_2.object.scene_code[ll_row - 1], 10, 2))	// 신규로직 2017.11.22 조원석
//						
//						if right(ls_scene,2) = '' then
//							MessageBox("확인","현장코드 MAX값 초과 하였습니다.")
//							RETURN
//						end if					
//					
//			END CHOOSE
//
//		end if
//	ELSE
//      ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + '01'
//	END IF
//END IF

dw_2.object.scene_code[ll_row] = ls_scene
dw_2.object.cust_no[ll_row]    = dw_1.getitemstring(dw_1.getrow(), "cust_no")
dw_2.setfocus()
wf_update1(dw_2,"N")
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdscene_m
integer x = 1970
integer taborder = 160
end type

event pb_retrieve::clicked;call super::clicked;date  ld_sdate, ld_edate

parent.setredraw(false)
parent.post setredraw(true)

if dw_6.visible = true then
	dw_6.visible		= false
	pb_save.enabled	= true
	is_retrieve_clicked	= 'I'	//입력모드
else
	dw_6.visible		= true	
	pb_save.enabled	= false
	is_retrieve_clicked	= 'R'	//조회모드
end if

ld_sdate   = date(em_1.text)
ld_edate   = date(em_2.text)

dw_6.retrieve( ld_sdate, ld_edate )

end event

type gb_3 from w_inheritance`gb_3 within w_cdscene_m
integer x = 32
integer y = 236
integer width = 4105
integer height = 544
integer taborder = 90
integer textsize = -8
integer weight = 400
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdscene_m
integer x = 1102
integer y = 0
integer width = 837
integer height = 220
integer taborder = 100
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdscene_m
integer x = 1961
integer y = 0
integer width = 1161
integer height = 220
integer taborder = 40
integer weight = 400
long backcolor = 79416533
end type

type dw_2 from w_inheritance`dw_2 within w_cdscene_m
integer x = 1330
integer y = 964
integer width = 2807
integer height = 1232
integer taborder = 60
string dataobject = "d_cdscene_m"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::itemfocuschanged;call super::itemfocuschanged;//
string ls_projectnm

// 현장명에서 ' ==> ` 변경하기
ls_projectnm = this.object.project_nm[row]
this.object.project_nm[row] = GF_ReplaceAll( ls_projectnm, "'", "`" )

IF this.object.area_nm[row] = ""	OR this.object.project_nm[row] = "" THEN 
//   this.object.area_nm[row] = "" OR this.object.project_nm[row] = "" THEN
ELSE
	IF this.object.owner[row] = "직발주" then
		this.object.scene_desc[row] = this.object.area_nm[row] + " " + this.object.project_nm[row] + "/"
	ELSE
		IF ISNULL(this.object.area_nm[row]) OR ISNULL(this.object.project_nm[row]) OR ISNULL(this.object.owner[row]) THEN
		ELSE
			this.object.scene_desc[row] = this.object.area_nm[row] + " " + this.object.project_nm[row] + "/" + this.object.owner[row]
		END IF
	END IF
END IF

end event

event dw_2::clicked;call super::clicked;i_row = row
end event

type dw_3 from datawindow within w_cdscene_m
integer x = 46
integer y = 352
integer width = 4064
integer height = 420
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cdscene_t"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_cdscene_m
integer x = 686
integer y = 160
integer width = 105
integer height = 72
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdscene_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_cdscene_m
integer x = 23
integer y = 964
integer width = 1257
integer height = 1232
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_cdcustscene_s11"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if currentrow < 1 then return
string ls_scene
long ll_row 

ls_scene = this.getitemstring(this.getrow(), "scene_code")
ll_row = dw_2.find("scene_code = '" + ls_scene + "'", 1, dw_2.rowcount())
dw_2.scrolltorow(ll_row)

//===============사용자별 프로그램 사용현황=================================
string ls_userid
string ls_desc
string ls_title
ls_userid = gs_userid
ls_title = st_title.text
ls_scene = this.getitemstring(this.getrow(), "scene_desc")
ls_desc = '업체명 : ' + dw_1.object.cust_name[1] + ' 현장명 : ' + ls_scene + ' 조회'
gf_log(ls_userid,ls_title,ls_desc)
//==========================================================================

end event

event clicked;string ls_scene
long ll_row 

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

ls_scene = this.getitemstring(this.getrow(), "scene_code")
ll_row = dw_2.find("scene_code = '" + ls_scene + "'", 1, dw_2.rowcount())
dw_2.scrolltorow(ll_row)

end event

type pb_excel from picturebutton within w_cdscene_m
integer x = 2533
integer y = 52
integer width = 187
integer height = 144
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos,   li_value
long    ll_row
DataWindow arg_dw

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),"yyyy/mm/dd"), Parent.Title )
//================================================================================================
choose case gs_userid
	case '1999010s' 
		dw_7.retrieve()
		arg_dw = dw_7
	case else
		if GF_PERMISSION("거래처 현장관리(전체)", gs_userid) = "Y" then
			arg_dw = dw_6
		else
			arg_dw = dw_5
		end if
end choose

ll_row = arg_dw.rowcount()
if ll_row > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		end if
	end if
else
	MessageBox("확인","거래처현장 데이터가 존재하지 않습니다.")
end if	

end event

type st_1 from statictext within w_cdscene_m
integer x = 46
integer y = 172
integer width = 599
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "거래처 현장관리(전체)"
long bordercolor = 67108864
boolean focusrectangle = false
end type

type st_8 from statictext within w_cdscene_m
integer x = 87
integer y = 860
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

type ddlb_fld from dropdownlistbox within w_cdscene_m
integer x = 270
integer y = 840
integer width = 480
integer height = 580
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

type ddlb_dwtitles from dropdownlistbox within w_cdscene_m
integer x = 329
integer y = 848
integer width = 306
integer height = 92
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

type st_9 from statictext within w_cdscene_m
integer x = 786
integer y = 860
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdscene_m
integer x = 1234
integer y = 844
integer width = 581
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdscene_m
integer x = 1829
integer y = 840
integer width = 197
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
end choose		
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdscene_m
integer x = 2030
integer y = 840
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
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
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
end choose		
GF_DW2UnFilter( arg_dw )

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

end event

type cb_1 from commandbutton within w_cdscene_m
integer x = 2231
integer y = 840
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
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
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
end choose		
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_cdscene_m
integer x = 2418
integer y = 840
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
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
	case "dw_5"
		arg_dw  = dw_5
	case "dw_6"
		arg_dw  = dw_6
end choose		
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type em_1 from editmask within w_cdscene_m
integer x = 1134
integer y = 120
integer width = 379
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
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

end event

type em_2 from editmask within w_cdscene_m
integer x = 1518
integer y = 120
integer width = 379
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "none"
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

end event

type st_2 from statictext within w_cdscene_m
integer x = 1134
integer y = 44
integer width = 763
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "등록일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_vertical from u_splitbar_vertical within w_cdscene_m
integer x = 1294
integer y = 964
integer height = 1232
boolean bringtotop = true
end type

type gb_4 from groupbox within w_cdscene_m
integer x = 32
integer y = 784
integer width = 4105
integer height = 168
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

type dw_6 from datawindow within w_cdscene_m
integer x = 681
integer y = 1200
integer width = 2935
integer height = 596
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdscene_xls"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type ddlb_op from dropdownlistbox within w_cdscene_m
integer x = 955
integer y = 836
integer width = 270
integer height = 500
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
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

type rb_normal from radiobutton within w_cdscene_m
integer x = 3195
integer y = 76
integer width = 251
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "일반"
boolean checked = true
end type

event clicked;wf_button_control('rb_normal')
end event

type rb_approval from radiobutton within w_cdscene_m
integer x = 3195
integer y = 136
integer width = 251
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79416533
string text = "승인"
end type

event clicked;wf_button_control('rb_approval')
end event

type cb_all from commandbutton within w_cdscene_m
integer x = 3438
integer y = 72
integer width = 325
integer height = 112
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "일괄선택"
end type

event clicked;string	ls_dataobject
long		i, ll_rcnt

if	is_retrieve_clicked = 'I' then return	//입력모드는 선택할수 없다.
ls_dataobject	= dw_6.dataobject
if ls_dataobject <> 'd_cdscene_approval' then return

ll_rcnt = dw_6.rowcount()
if ll_rcnt = 0 then return

for i = 1 to ll_rcnt
	dw_6.setitem(i, 'approval_yn', is_selectall)
next

if is_selectall = 'Y' then 
	is_selectall = 'N' 
else
	is_selectall = 'Y' 
end if

end event

type cb_approval from commandbutton within w_cdscene_m
integer x = 3785
integer y = 72
integer width = 325
integer height = 112
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
string text = "승인적용"
end type

event clicked;string	ls_sqlerrtext, ls_salesman, ls_message, ls_chk, ls_scene_cust_no, ls_recvhp
long		i, ll_rcnt, ll_rslt
boolean	lb_boolean
string	ls_temp, ls_recvname, ls_customer_cust_name, ls_scene_scene_desc

if	is_retrieve_clicked = 'I' then return	//입력모드는 승인 적용을 할수 없다.
ll_rcnt	= dw_6.rowcount()
if ll_rcnt = 0 then return
if dw_6.accepttext( ) = -1 then return
if MessageBox("승인","승인 적용하시겠습니까?",question!,okcancel!,1) = 1 then
	//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//=============================================================================================	
	//승인 요청자에게 알림 보내기
	for i = 1 to ll_rcnt
		if dw_6.getitemstring(i , 'approval_yn') <> 'Y' then continue
		
		//1. 현장등록 미승인업체 확인 'N'만 메세지 보냄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
		ls_scene_cust_no	= dw_6.getitemstring(i, 'scene_cust_no')
		ll_rslt	= 0
		select
			count(*)
		into
			:ll_rslt
		from
			customer
		where
			scene_approval_yn	= 'Y'
		and			
			cust_no = :ls_scene_cust_no
		using sqlca;			
		if ll_rslt > 0 then continue			
		//1. 현장등록 미승인업체 확인 'N'만 메세지 보냄▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲		
		
		//2. SMS 메세지 보냄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼		
		ls_salesman					= ''
		ls_recvname					= ''
		ls_customer_cust_name	= ''
		ls_scene_scene_desc		= ''
		ls_recvhp					= ''
		ls_salesman					= dw_6.getitemstring(i, 'salesman')					//수신자사번
		ls_recvname					= dw_6.getitemstring(i, 'login_user_name')		//수신자명
		ls_customer_cust_name	= dw_6.getitemstring(i, 'customer_cust_name')	//거래처명
		ls_scene_scene_desc		= dw_6.getitemstring(i, 'scene_scene_desc')		//현장명

		//수신번호 확인
		select 
			replace(hp_no, '-', '')
		into
			:ls_recvhp
		from 	
			salehp  
		where
			user_id NOT LIKE 'chulha%'
		and 
			user_id = :ls_salesman
		using sqlca;
		
		if gf_null_chk(ls_recvhp) = true or LenA(ls_recvhp) < 7 then
			rollback using sqlca;
			ls_temp	= ls_recvname + "의 전화번호를 확인하세요."
			messagebox("확인", ls_temp)
			return
		end if
		
		//수신자명 확인
		if gf_null_chk(ls_recvname) = true then
			rollback using sqlca;
			ls_temp	= "수신자명을 확인하세요."
			messagebox("확인", ls_temp)
			return
		end if		
		
		//거래처명 확인
		if gf_null_chk(ls_customer_cust_name) = true then
			rollback using sqlca;
			ls_temp	= ls_recvname + "의 거래처명을 확인하세요."
			messagebox("확인", ls_temp)
			return
		end if		
		
		//현장명 확인
		if gf_null_chk(ls_scene_scene_desc) = true then
			rollback using sqlca;
			ls_temp	= ls_recvname + "의 현장명을 확인 확인하세요."
			messagebox("확인", ls_temp)
			return
		end if		
		
		ls_message	= '거래처 [' + ls_customer_cust_name + ']의 [' + ls_scene_scene_desc + ']이 신규 현장으로 등록됐습니다.'		
		if gf_mmssend( '', "0226481998", ls_recvhp, ls_recvname, ls_message ) = false then	
			rollback using sqlca;
			return 
		end if
		
		//2. SMS 메세지 보냄▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲	
	next

	wf_update1(dw_6,"Y")
	rb_approval.post event clicked( )
end if

end event

type cb_3 from commandbutton within w_cdscene_m
integer x = 2665
integer y = 816
integer width = 457
integer height = 124
integer taborder = 120
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "승인요청"
end type

type st_3 from statictext within w_cdscene_m
integer x = 2683
integer y = 832
integer width = 430
integer height = 100
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "승인요청"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;datastore	lds_type
string	ls_sqlerrtext, ls_userid, ls_message
long		i, ll_rcnt

if MessageBox("요청","승인 요청하시겠습니까?",question!,okcancel!,1) = 1 then
	lds_type = create datastore
	lds_type.dataobject = 'd_codemst_type'
	lds_type.settransobject(sqlca)
	ll_rcnt = lds_type.retrieve('거래처 현장관리 승인자')
	
	ls_message	= dw_1.describe("evaluate('lookupdisplay(cust_name)', 1)") 
	if gf_null_chk(ls_message) = true then
		messagebox("확인", "거래처를 선택하세요.")
		return
	end if                    

	//현장등록 미승인업체 확인 'N'만 메세지 보냄
	if dw_3.getitemstring(1, 'scene_approval_yn') = 'N' then
		ls_message	= '담당자[' + gs_username + ']가 거래처[' + ls_message + ']에 등록한 현장의 승인요청이 있습니다.'
		for i = 1 to ll_rcnt
			ls_userid	= lds_type.getitemstring(i, 'item_cd')
			
			insert into sysmsg 
				(
				 flogin
				,tlogin
				,msgdate
				,msg
				,del)
			values 
				(
				 :gs_userid
				,:ls_userid
				,getdate()
				,:ls_message
				,'N')
			using sqlca;				
		
			if sqlca.sqlcode <> 0 then
				ls_sqlerrtext = sqlca.sqlerrtext
				rollback using sqlca;
				messagebox('sql error', ls_sqlerrtext)
				return
			end if
		next
		commit using sqlca;	
	end if
	
	messagebox('완료', '요청완료했습니다.')
end if

end event

type st_4 from statictext within w_cdscene_m
integer x = 3136
integer y = 856
integer width = 1170
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "<=저장 후 승인 요청을 누르세요!!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_cdscene_m
boolean visible = false
integer x = 4155
integer y = 72
integer width = 325
integer height = 112
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "맑은 고딕"
boolean enabled = false
string text = "승인적용"
end type

event clicked;string	ls_sqlerrtext, ls_userid, ls_message, ls_chk, ls_scene_cust_no
long		i, ll_rcnt, ll_rslt

if	is_retrieve_clicked = 'I' then return	//입력모드는 승인 적용을 할수 없다.
ll_rcnt	= dw_6.rowcount()
if ll_rcnt = 0 then return
if dw_6.accepttext( ) = -1 then return
if MessageBox("승인","승인 적용하시겠습니까?",question!,okcancel!,1) = 1 then
	//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//=============================================================================================	
	//승인 요청자에게 알림 보내기
	for i = 1 to ll_rcnt
		if dw_6.getitemstring(i , 'approval_yn') <> 'Y' then continue
		
		//현장등록 미승인업체 확인 'N'만 메세지 보냄▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
		ls_scene_cust_no	= dw_6.getitemstring(i, 'scene_cust_no')
		ll_rslt	= 0
		select
			count(*)
		into
			:ll_rslt
		from
			customer
		where
			scene_approval_yn	= 'Y'
		and			
			cust_no = :ls_scene_cust_no
		using sqlca;			
		if ll_rslt > 0 then continue			
		//현장등록 미승인업체 확인 'N'만 메세지 보냄▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲		
		
		ls_userid	= dw_6.getitemstring(i, 'user_id')
		if gf_null_chk(ls_userid) = true then continue
		
		ls_message	= dw_6.getitemstring(i, 'scene_scene_desc')
		if gf_null_chk(ls_message) = true then
			messagebox("확인", "현장명이 없는 자료가 존재합니다.")
			return
		end if
		ls_message	= '승인 요청한 현장[' + ls_message + ']의 승인이 완료됐습니다.'

		insert into sysmsg 
			(
			 flogin
			,tlogin
			,msgdate
			,msg
			,del)
		values 
			(
			 :gs_userid
			,:ls_userid
			,getdate()
			,:ls_message
			,'N')
		using sqlca;				
	
		if sqlca.sqlcode <> 0 then
			ls_sqlerrtext = sqlca.sqlerrtext
			rollback using sqlca;
			messagebox('sql error', ls_sqlerrtext)
			return
		end if
	next

	////////////////////////////////////
	wf_update1(dw_6,"Y")
	rb_approval.post event clicked( )
end if

end event

type dw_7 from datawindow within w_cdscene_m
integer x = 681
integer y = 1580
integer width = 2935
integer height = 596
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdscene_xls_all"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type gb_approval from groupbox within w_cdscene_m
integer x = 3168
integer width = 969
integer height = 220
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "현장승인"
end type

