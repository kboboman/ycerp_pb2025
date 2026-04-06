$PBExportHeader$w_ocsaleageing_r.srw
$PBExportComments$매출채권 연령표
forward
global type w_ocsaleageing_r from w_inheritance
end type
type em_1 from editmask within w_ocsaleageing_r
end type
type dw_4 from datawindow within w_ocsaleageing_r
end type
type dw_3 from datawindow within w_ocsaleageing_r
end type
type st_1 from statictext within w_ocsaleageing_r
end type
type st_2 from statictext within w_ocsaleageing_r
end type
type cbx_1 from checkbox within w_ocsaleageing_r
end type
type pb_1 from picturebutton within w_ocsaleageing_r
end type
type cbx_2 from checkbox within w_ocsaleageing_r
end type
type cbx_team from checkbox within w_ocsaleageing_r
end type
end forward

global type w_ocsaleageing_r from w_inheritance
integer width = 4498
integer height = 2240
string title = "매출채권 연령표(w_ocsaleageing_r)"
em_1 em_1
dw_4 dw_4
dw_3 dw_3
st_1 st_1
st_2 st_2
cbx_1 cbx_1
pb_1 pb_1
cbx_2 cbx_2
cbx_team cbx_team
end type
global w_ocsaleageing_r w_ocsaleageing_r

type variables
datawindowchild idwc_user
string is_level = '%', is_3mon = 'A'

end variables

on w_ocsaleageing_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.st_1=create st_1
this.st_2=create st_2
this.cbx_1=create cbx_1
this.pb_1=create pb_1
this.cbx_2=create cbx_2
this.cbx_team=create cbx_team
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.dw_4
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.cbx_2
this.Control[iCurrent+9]=this.cbx_team
end on

on w_ocsaleageing_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.pb_1)
destroy(this.cbx_2)
destroy(this.cbx_team)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

int li_day

dw_2.visible = false
dw_3.visible = false

li_day    = Day(today())
em_1.text = string(RelativeDate(today(), - li_day),'yyyy/mm')

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

dw_4.insertrow(1)
dw_4.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
dw_4.object.user[1]  = '%'
idwc_user.accepttext()

end event

event resize;call super::resize;//
dw_1.width  = this.width  - 132
dw_1.height = this.height - 508
end event

type pb_save from w_inheritance`pb_save within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocsaleageing_r
integer x = 50
integer y = 360
integer width = 4366
integer height = 1732
string dataobject = "d_ocsaleageing_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;string ls_custno, ls_custnm

if row > 0 then
	ls_custno = trim(this.object.cust_no[row])
	SELECT cust_name INTO :ls_custnm 
	  FROM CUSTOMER 
	 WHERE cust_no   = :ls_custno;
	 
	gs_print_control = "V" + ls_custno
	if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
		if IsValid(w_cdcustomer_m) = False then			
			OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Layered!) // Layered! , Cascaded!
			Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
			
			w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
			w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
			w_cdcustomer_m.dw_24.Visible  =  False

			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
			
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
			w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
			w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
			w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
			w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
			w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
			w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
		
		else
			if MessageBox("확인", "작업중인 판매거래처관리 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
				parent.arrangesheets( Cascade! )
				return
			else
				close(w_cdcustomer_m)
				OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Layered!) // Layered! , Cascaded!
				Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

				w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
				w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
				w_cdcustomer_m.dw_24.Visible  =  False
	
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
				
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
				w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
				w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
				w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
				w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
				w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
				w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
			end if
		end if
	else
		OpenSheet(w_cdcustomer_r, parent.parentwindow(), 5, Cascaded!)
		Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

		w_cdcustomer_r.dw_1.object.cust_no[1]   = ls_custno
		w_cdcustomer_r.dw_1.object.cust_name[1] = ls_custnm

		w_cdcustomer_r.tab_1.tabpage_1.dw_5.reset()
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.reset()
		
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.setfocus()
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
	end if
end if

end event

event dw_1::clicked;call super::clicked;//
this.scrolltorow(row)

end event

type dw_2 from w_inheritance`dw_2 within w_ocsaleageing_r
integer x = 1422
integer y = 80
integer width = 142
integer height = 92
string dataobject = "d_ocsalereceivable_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocsaleageing_r
integer x = 69
integer width = 1271
string text = "매출채권 연령표"
end type

type st_tips from w_inheritance`st_tips within w_ocsaleageing_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_ocsaleageing_r
integer x = 4210
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocsaleageing_r
integer x = 4018
end type

event pb_print::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print   l_print

if dw_1.rowcount() < 1 then return

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출채권 연령표를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_ocsaleageing_r
boolean visible = false
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocsaleageing_r
integer x = 3634
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security
string ls_usernm, ls_userid, ls_team, strVAlue1, strVAlue2, strVAlue3, strVAlue4, strVAlue5, strRows, strField
string strTitle[8] = {"1) 당월", "2) 1-30", "3) 31-60", "4) 61-90", "5) 91-120", "6) 121-150", "7) 151-180", "8) 180이상"}

long    ll_row, ll_cnt
int     li_dyyyy, li_jyyyy, li_month, iMonth, iRow, iCol, ii, iCnt, iCredit
Decimal ld_AMT, JanAMT, AddAMT, OutAMT, AgeAMT, AgeingAMT, CreditAMT
boolean SWLoop

cbx_1.checked = false
dw_1.setfilter("")
dw_1.filter()

SWLoop    = false
dw_1.reset()
dw_2.reset()

li_month  = integer(RightA(em_1.text,2))
li_dyyyy  = integer(LeftA(em_1.text,4))
li_jyyyy  = li_dyyyy - 1

choose case RightA(em_1.text,2)
   case "12"
      iMonth = 8
   case "11"
      iMonth = 9
   case "10"
      iMonth = 10
   case "09"
      iMonth = 11
   case "08"
      iMonth = 12
   case "07"
      iMonth = 13
   case "06"
      iMonth = 14
   case "05"
      iMonth = 15
   case "04"
      iMonth = 16
   case "03"
      iMonth = 17
   case "02"
      iMonth = 18
   case "01"
      iMonth = 19
end choose

ls_userid = dw_4.object.user[1]
if isnull(ls_userid) or ls_userid = "%" then
	MessageBox("확인","전체 사용불가")
	return
end if

// 팀 조회
if cbx_team.checked = true then 
	ls_team = ""
	ll_cnt = 0	
	SELECT count(*) INTO :ll_cnt FROM team
	 WHERE parent_code = '70000'  AND team_manager = :ls_userid;
	if ll_cnt > 0  then
		ls_team = 'T'
	else
		cbx_team.checked = false
	end if
end if

ll_row    = dw_1.retrieve( ls_userid, li_dyyyy, li_jyyyy, ls_team)

dw_1.setredraw(false)
iRow = 1
Do While SWLoop = false
   if iRow > dw_1.rowcount() then
      SWLoop = true
   else
      ls_usernm = dw_1.object.user_name[iRow]
   
      if dw_1.object.gubun[iRow] = "수금" then
         strVAlue1 = dw_1.object.user_name[iRow]   // user_name
         strVAlue2 = dw_1.object.cust_no[iRow]     // cust_no
         strVAlue3 = dw_1.object.cust_name[iRow]   // cust_name
         strVAlue4 = dw_1.object.credit_day[iRow]  // credit_day
         strVAlue5 = dw_1.object.yyyy[iRow]        // yyyy
   
         dw_1.InsertRow(iRow + 1)         // 잔액행 추가   
         dw_1.object.user_name[iRow + 1]  = strVAlue1
         dw_1.object.cust_no[iRow + 1]    = strVAlue2
         dw_1.object.cust_name[iRow + 1]  = strVAlue3
         dw_1.object.credit_day[iRow + 1] = strVAlue4
         dw_1.object.yyyy[iRow + 1]       = strVAlue5
         dw_1.object.gubun[iRow + 1]      = "잔액"

         dw_1.InsertRow(iRow + 2)         // 연령행 추가   
         dw_1.object.user_name[iRow + 2]  = strVAlue1
         dw_1.object.cust_no[iRow + 2]    = strVAlue2
         dw_1.object.cust_name[iRow + 2]  = strVAlue3
         dw_1.object.credit_day[iRow + 2] = strVAlue4
         dw_1.object.yyyy[iRow + 2]       = strVAlue5
         dw_1.object.gubun[iRow + 2]      = "연령"
		end if
   end if
   
   iRow = iRow + 1
Loop


dw_1.Modify("ewol1.Width=430")  // 전년이월
for iRow = 1 to dw_1.rowcount()
	if dw_1.object.gubun[iRow] = "수금" then
		// 잔액만들기
		ld_AMT = dw_1.object.ewol2[iRow - 1] - dw_1.object.ewol2[iRow] // 매출 - 수금
		dw_1.object.ewol2[iRow + 1] = ld_AMT	// 잔액
		dw_1.Modify("ewol2.Width=430")
		
		for ii = 31 To 8 step -1
			// 잔액= 잔액 + 매출 - 수금
			ld_AMT = ld_AMT + dw_1.GetItemDecimal(iRow - 1, ii) - dw_1.GetItemDecimal(iRow, ii)
			dw_1.SetItem(iRow + 1, ii, ld_AMT)
			
			iCol     = iCol + 1
			strField = "M" + string(iCol, "00") + ".Width=430"
			dw_1.Modify(strField)
		next

		// 연령계산식
		// if 누계매출 >= 채권잔액 then
		//    연령 = 누계매출 + (누계매출 - 채권잔액)
		// else
		//    연령 = 당월매출
		// end if
		
      // 검산 : 채권잔액 = 연령잔액
		JanAMT = dw_1.GetItemDecimal(iRow + 1, iMonth)   // 채권잔액
		AddAMT = 0  // 누계매출
		OutAMT = 0  // 당월매출
		AgeAMT = 0  // 연령금액
		for iCol = iMonth + 1 to iMonth + 8             		// 연령기간(8개월)
			 OutAMT = dw_1.GetItemDecimal(iRow - 1, iCol - 1)  // 당월매출
			 AddAMT = AddAMT + OutAMT                    		// 누계매출                      
			 
			 AgeingAMT = AddAMT - JanAMT                 		// 누계매출 - 채권잔액
			 if AddAMT >= JanAMT then									// 누계매출 >= 채권잔액
				 if (OutAMT - AgeingAMT) < 0 then					// 연령잔액이 마이너스인 경우 
						dw_1.SetItem(iRow + 2, iCol - 1, 0)
				 else
						dw_1.SetItem(iRow + 2, iCol - 1, OutAMT - AgeingAMT)  // 연령 = 당월매출 - (누계매출 - 채권잔액)
				 end if
			 else
				 dw_1.SetItem(iRow + 2, iCol - 1, OutAMT) 		// 연령 = 당월매출
			 end if
		next

      ///////////////////////////////////////////////////////////////////////         
      // 당월잔액과 연령잔액 검산하기
      ///////////////////////////////////////////////////////////////////////         
      AgeAMT = 0                                      		// 연령금액
      JanAMT = dw_1.GetItemDecimal(iRow + 1, iMonth)    		// 채권잔액
      OutAMT = dw_1.GetItemDecimal(iRow + 2, iMonth + 7) 	// 180이상 잔액
		if isnull(OutAMT) then OutAMT = 0                 		// 180이상 잔액
		
      For iCol = iMonth To iMonth + 8                 		// 연령기간(8개월)
			if isnull(dw_1.GetItemDecimal(iRow + 2, iCol)) then
				AgeAMT = AgeAMT + 0
			else
				AgeAMT = AgeAMT + dw_1.GetItemDecimal(iRow + 2, iCol)
			end if
      Next
		
      If JanAMT <> AgeAMT Then
			dw_1.SetItem(iRow + 2, iMonth + 7, JanAMT - AgeAMT + OutAMT)
      End If
      ///////////////////////////////////////////////////////////////////////         


//		// 여신금액 구하기
//		CreditAMT = 0
//    iCredit   = 0
//		if dw_1.GetItemDecimal(iRow + 2, 4) = 0 then dw_1.SetItem(iRow + 2, 4) = 0		// 여신일자
//		
//		choose case dw_1.GetItemNumber(iRow + 2, 4)
//			case 0 To 30
//				iCredit = 1
//			case 31 To 60
//				iCredit = 2
//			case 61 To 90
//				iCredit = 3
//			case 91 To 120
//				iCredit = 4
//			case 121 To 150
//				iCredit = 5
//			case else
//				iCredit = 0
//		end choose
//
//		for ii = iMonth + iCredit To 32
//			CreditAMT = CreditAMT + dw_1.GetItemDecimal(iRow + 2, ii)
//		next
//		dw_1.SetItem(iRow + 2, 7) = CreditAMT   ' 여신금액
   end if
next

// 열이름 정의(strTitle)
string strColumn[32] = {"담당", "CODE", "거래처", "여신", "년도", "구분", "ewol1", "24", "23", "22", "21", "20", "19", "18", "17", "16", "15", "14", "13", "12", "11", "10", "09", "08", "07", "06", "05", "04", "03", "02", "01", "ewol2"}
iCnt = 0
iCol = 24
for ii = 7 To 32
	if (ii < iMonth) Or (ii > iMonth + 7) then	// 연령기간 아니면 숨기기
		choose case ii
			case 7, 32
				strField = strColumn[ii] + ".Width=0"
			case else
				strField = "M" + strColumn[ii] + ".Width=0"
		end choose
	else	// 해당월 부터 8개월(연령기간)
      iCnt = iCnt + 1
		strField = "M" + strColumn[ii] + "_t.Text='" + strTitle[iCnt] + "'"      // m24_t		
	end if
	dw_1.Modify(strField)

	iCol = iCol - 1
next

dw_1.setredraw(true)

MessageBox("확인", "조회완료.")

end event

type gb_3 from w_inheritance`gb_3 within w_ocsaleageing_r
integer x = 50
integer y = 220
integer width = 4366
integer height = 124
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocsaleageing_r
integer x = 2519
integer y = 12
integer width = 1070
integer height = 208
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocsaleageing_r
integer x = 3607
integer width = 818
end type

type em_1 from editmask within w_ocsaleageing_r
integer x = 2555
integer y = 128
integer width = 320
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type dw_4 from datawindow within w_ocsaleageing_r
integer x = 2885
integer y = 128
integer width = 663
integer height = 76
integer taborder = 110
boolean bringtotop = true
string title = "d_whlogin_c3"
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

event editchanged;this.accepttext()

end event

type dw_3 from datawindow within w_ocsaleageing_r
integer x = 1586
integer y = 80
integer width = 142
integer height = 92
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_cdaroivc_r"
boolean livescroll = true
end type

type st_1 from statictext within w_ocsaleageing_r
integer x = 2889
integer y = 48
integer width = 654
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "담당자"
alignment alignment = center!
boolean border = true
long bordercolor = 15780518
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocsaleageing_r
integer x = 2555
integer y = 48
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회년월"
alignment alignment = center!
boolean border = true
long bordercolor = 15780518
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_ocsaleageing_r
integer x = 119
integer y = 264
integer width = 558
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "연령만 보기"
end type

event clicked;//
string ls_temp

setnull(ls_temp)
if this.checked = true then
	dw_1.setfilter("gubun = '연령'")
	dw_1.filter()
else
	pb_retrieve.triggerevent( Clicked! )
end if

end event

type pb_1 from picturebutton within w_ocsaleageing_r
event mousemove pbm_mousemove
integer x = 3826
integer y = 52
integer width = 187
integer height = 144
integer taborder = 130
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

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		end if
	end if
end if	

end event

type cbx_2 from checkbox within w_ocsaleageing_r
integer x = 686
integer y = 264
integer width = 357
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "틀 고정"
end type

event clicked;//
string ls_colx

if this.checked = true then
	ls_colx = dw_1.object.ewol1.x
	dw_1.object.datawindow.horizontalscrollsplit = ls_colx
else
	dw_1.object.datawindow.horizontalscrollsplit = 0
end if

end event

type cbx_team from checkbox within w_ocsaleageing_r
integer x = 4046
integer y = 264
integer width = 347
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "팀 조회"
end type

