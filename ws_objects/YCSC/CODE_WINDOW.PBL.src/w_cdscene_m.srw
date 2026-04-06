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
end forward

global type w_cdscene_m from w_inheritance
integer width = 4210
integer height = 2860
string title = "거래처 현장관리(w_cdscene_m)"
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
pb_excel pb_excel
st_1 st_1
end type
global w_cdscene_m w_cdscene_m

type variables
public string is_scene_code, is_scene_desc, is_custno, is_custname
st_print i_print
string   is_dw4sql

datawindowchild idwc_cust
datawindowchild idwc_cust_name

end variables

forward prototypes
public function string wf_nextcode (string as_str)
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

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_4.visible     = false
pb_excel.enabled = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
is_dw4sql = dw_4.describe("datawindow.table.select")

dw_5.settransobject(sqlca)

dw_1.insertrow(0)
dw_1.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)

dw_1.getchild("cust_name", idwc_cust_name)
idwc_cust_name.settransobject(sqlca)

//dw_2.sharedata(dw_5)

end event

on w_cdscene_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.pb_excel=create pb_excel
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.pb_excel
this.Control[iCurrent+5]=this.st_1
end on

on w_cdscene_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.pb_excel)
destroy(this.st_1)
end on

event resize;call super::resize;dw_5.height = this.height - 944

dw_2.width  = this.width - 1060
dw_2.height = this.height - 944

end event

type pb_save from w_inheritance`pb_save within w_cdscene_m
integer x = 3730
integer y = 48
fontcharset fontcharset = ansi!
boolean italic = true
end type

event pb_save::clicked;long ll_row
Boolean SW_Exit

dw_2.accepttext()
if dw_2.rowcount() < 1 then return

for ll_row = 1 to dw_2.rowcount()
	sw_exit = true
	// 기존데이터 SKIP
	if dw_2.object.input_date[ll_row] > "2010/06/21" then
		if dw_2.object.area_nm[ll_row] = "" or IsNull(dw_2.object.area_nm[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 지역이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("area_nm")
			dw_2.setfocus()
			sw_exit = false
			continue
		end if
	
		if TRIM(dw_2.object.project_nm[ll_row]) = "" or IsNull(dw_2.object.project_nm[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 공사명이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("project_nm")
			dw_2.setfocus()
			sw_exit = false
			continue
		end if
	
		if TRIM(dw_2.object.owner[ll_row]) = "" or IsNull(dw_2.object.owner[ll_row]) then
			MessageBox("오류", string(ll_row,"##0") + "번째 건설사명이 입력되지 않았습니다.",exclamation!)
			dw_2.scrolltorow(ll_row)
			dw_2.setcolumn("owner")
			dw_2.setfocus()
			sw_exit = false
			continue
		end if

		// 현장명 조합하기
		IF dw_2.object.owner[ll_row] = "직발주" then
			dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/"
		ELSE
			dw_2.object.scene_desc[ll_row] = dw_2.object.area_nm[ll_row] + " " + dw_2.object.project_nm[ll_row] + "/" + dw_2.object.owner[ll_row]
		END IF
		
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
next

if sw_exit = false then
	MessageBox("오류", string(ll_row - 1,"##0") + "번째 지역,공사명,건설사명이 입력되지 않았습니다.",exclamation!)
	return
end if

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

event dw_1::itemchanged;//
st_security lst_security
string ls_old_level, ls_cust, ls_salesman

this.accepttext()
choose case dwo.name
	case 'cust_no'
		this.object.cust_name[1] = ''
		this.object.cust_name[1] = idwc_cust.getitemstring(idwc_cust.getrow(), "cust_name")

	case 'cust_name'
		this.object.cust_no[1] = ''
		this.object.cust_no[1] = idwc_cust_name.getitemstring(idwc_cust_name.getrow(), "cust_no")
end choose	

this.accepttext()
ls_cust = this.object.cust_no[1]

// 거래처별 현장관리(전체)
int li_count
if GF_PERMISSION('거래처 현장관리(전체)', gs_userid) = 'Y' then
else
	SELECT salesman INTO :ls_salesman
	  FROM customer 
	 WHERE cust_no = :ls_cust AND salesman = :gs_userid;	
	if isnull(ls_salesman) or ls_salesman = "" then	GOTO next1
end if

//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	ls_userid = gs_userid
	ls_title = st_title.text
	ls_desc = '업체명 : ' + dw_1.object.cust_name[1] + '/ 조회'
	gf_log(ls_userid,ls_title,ls_desc)
End If
//==========================================================================
		
dw_2.reset()
dw_3.reset()
dw_5.reset()

dw_2.retrieve(ls_cust)
dw_3.retrieve(ls_cust)
dw_5.retrieve(ls_cust)
this.setfocus()
return

next1:
dw_2.reset()
dw_3.reset()
dw_5.reset()

end event

type dw_2 from w_inheritance`dw_2 within w_cdscene_m
integer x = 992
integer y = 796
integer width = 3150
integer height = 1916
integer taborder = 60
string dataobject = "d_cdscene_m"
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::itemfocuschanged;call super::itemfocuschanged;//
IF this.object.area_nm[row] = ""	OR this.object.project_nm[row] = "" THEN 
//   this.object.area_nm[row] = ""	OR this.object.project_nm[row] = "" THEN
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

type st_title from w_inheritance`st_title within w_cdscene_m
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
end type

type pb_close from w_inheritance`pb_close within w_cdscene_m
integer x = 3922
integer y = 48
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_cdscene_m
integer x = 3346
integer y = 48
integer taborder = 130
end type

event pb_print::clicked;gs_codere_str lst_code
w_repsuper    w_print
st_print      l_print
st_security   lst_security
string ls_cust_no, ls_where, ls_orderby, ls_sql
string ls_desc

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

OpenWithParm(w_whsceneprn_w, lst_code)
lst_code = message.powerobjectparm

if lst_code.okcancel = "N" then return

string ls_level_userid
choose case gs_level
	case "A", "B"			
		ls_level_userid = "%"
	case "C"
		ls_level_userid = gs_userid
end choose

string ls_userid
string ls_title
ls_userid = gs_userid
ls_title  = st_title.text
	
ls_cust_no = dw_1.object.cust_no[dw_1.getrow()]
if lst_code.flag = "A" then
	ls_desc    = "업체명 : " + dw_1.object.cust_name[1] + "/ 출력"
	ls_where   = "   AND scene.cust_no        = ~~'" + ls_cust_no      + "~~'" + & 
	             "   AND customer.salesman LIKE ~~'" + ls_level_userid + "~~'"	
	ls_orderby = " ORDER BY input_date DESC "
 	ls_sql     = "datawindow.table.select = '" + is_dw4sql + ls_where + ls_orderby + "'"
else
	ls_desc    = "업체명 : " + lst_code.start_no + " ~ " + lst_code.end_no + "/ 출력"
	ls_where   = "   AND scene.cust_no          = ~~'" + ls_cust_no + "~~'" + &
	             "   AND scene.scene_code between ~~'" + lst_code.start_no + "~~' AND ~~'" + lst_code.end_no + "~~'" + & 
				    "   AND customer.salesman   LIKE ~~'" + ls_level_userid + "~~'"
	ls_orderby = " ORDER BY input_date DESC"
 	ls_sql     = "datawindow.table.select = '" + is_dw4sql + ls_where + ls_orderby + "'"
end if
dw_4.settransobject(sqlca)
dw_4.modify(ls_sql)
dw_4.retrieve()

l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 현장내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = "DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100"
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

//===============사용자별 프로그램 사용현황========================
If gs_level = "B" Then
	gf_log(ls_userid,ls_title,ls_desc)
End If
//=================================================================

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdscene_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cdscene_m
integer x = 3154
integer y = 48
integer taborder = 150
end type

event pb_delete::clicked;string ls_order_no, ls_scene_no
dwitemstatus l_status

if dw_2.rowcount() < 1 then return	

dw_2.accepttext()
l_status = dw_2.getitemstatus(dw_2.getrow(), 0, primary!)
if l_status = newmodified! then
	dw_2.deleterow(dw_2.getrow())
elseif MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 1 then
	ls_scene_no = dw_2.getitemstring(dw_2.getrow(), "scene_code")
	
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
integer x = 2962
integer y = 48
integer taborder = 170
end type

event pb_insert::clicked;long ll_row, ll_scene
string ls_cust_no, ls_seq, ls_scene, ls_desc, ls_charge, ls_scene_no

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

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
//현장코드 자동 부여
ls_cust_no = dw_1.getitemstring(dw_1.getrow(), "cust_no")
IF ll_row = 1 THEN
   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + '01'
ELSE
	IF MidA(dw_2.object.scene_code[ll_row - 1], 6, 4) = string(today(),'yyyy') THEN
		if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 10, 2)) = true then
			ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 10, 2))
			ll_scene = ll_scene + 1
			if ll_scene >= 100 then
		      ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + string(ll_scene, 'A1')
			else
	   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + string(ll_scene, '00')
			end if
		else
			CHOOSE CASE MidA(dw_2.object.scene_code[ll_row - 1], 10, 1)
				CASE "A"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "A" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "BA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "A" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "B"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "CA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "B" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "C"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "DA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "C" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "D"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "EA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "D" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "E"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "FA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "E" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "F"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "GA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "F" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "G"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "HA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "G" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "H"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "IA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "H" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "I"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "JA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "I" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "J"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "KA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "J" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "K"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "LA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "K" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "L"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "MA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "L" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "M"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "NA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "M" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "N"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "OA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "N" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "O"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "PA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "O" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "P"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "QA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "P" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "Q"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "RA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Q" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "R"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "SA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "R" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "S"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "TA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "S" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "T"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "UA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "T" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "U"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "VA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "U" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "V"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "WA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "V" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "W"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "XA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "W" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "X"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "YA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "X" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "Y"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z1"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "ZA"
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Y" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
				CASE "Z"
					if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "9" then
			   	   ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "AA"
					else
						if isnumber(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1)) then
							ll_scene = integer(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							ll_scene = ll_scene + 1
							ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z" + string(ll_scene, '0')
						else
							if  MidA(dw_2.object.scene_code[ll_row - 1], 11, 1) = "Z" then
								MESSAGEBOX("확인","전산실로 연락바랍니다.")
								RETURN
							else
								ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + "Z" &
										+ wf_nextcode(MidA(dw_2.object.scene_code[ll_row - 1], 11, 1))
							end if
						end if
					end if
			END CHOOSE

		end if
	ELSE
      ls_scene = ls_cust_no + '-' + string(today(), 'yyyy') + '01'
	END IF
END IF
dw_2.object.scene_code[ll_row] = ls_scene
dw_2.object.cust_no[ll_row] = dw_1.getitemstring(dw_1.getrow(), "cust_no")
dw_2.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdscene_m
boolean visible = false
integer taborder = 160
end type

type gb_3 from w_inheritance`gb_3 within w_cdscene_m
boolean visible = false
integer x = 32
integer y = 460
integer width = 2240
integer height = 448
integer taborder = 90
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdscene_m
integer y = 220
integer width = 4105
integer height = 564
integer taborder = 100
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdscene_m
integer x = 2930
integer y = 8
integer width = 1207
integer taborder = 40
long backcolor = 79416533
end type

type dw_3 from datawindow within w_cdscene_m
integer x = 46
integer y = 352
integer width = 3163
integer height = 420
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cdscene_t"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within w_cdscene_m
integer x = 1225
integer y = 16
integer width = 142
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdscene_r"
boolean livescroll = true
end type

type dw_5 from datawindow within w_cdscene_m
integer x = 23
integer y = 796
integer width = 951
integer height = 1916
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

type pb_excel from picturebutton within w_cdscene_m
integer x = 3538
integer y = 48
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

event clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt

//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//=============================================================================================

ll_cnt = dw_5.rowcount()
if ll_cnt > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_5.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_5.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_1 from statictext within w_cdscene_m
integer x = 2304
integer y = 148
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

