$PBExportHeader$w_osaroi_duzon_r.srw
$PBExportComments$회계전표내보내기(더존)
forward
global type w_osaroi_duzon_r from w_inheritance
end type
type em_1 from editmask within w_osaroi_duzon_r
end type
type st_1 from statictext within w_osaroi_duzon_r
end type
type cbx_1 from checkbox within w_osaroi_duzon_r
end type
type st_3 from statictext within w_osaroi_duzon_r
end type
type ddlb_1 from dropdownlistbox within w_osaroi_duzon_r
end type
type cbx_2 from checkbox within w_osaroi_duzon_r
end type
type cb_1 from commandbutton within w_osaroi_duzon_r
end type
type hpb_1 from hprogressbar within w_osaroi_duzon_r
end type
type st_2 from statictext within w_osaroi_duzon_r
end type
type cb_2 from commandbutton within w_osaroi_duzon_r
end type
type st_4 from statictext within w_osaroi_duzon_r
end type
type ddlb_fld from dropdownlistbox within w_osaroi_duzon_r
end type
type ddlb_dwtitles from dropdownlistbox within w_osaroi_duzon_r
end type
type st_6 from statictext within w_osaroi_duzon_r
end type
type ddlb_op from dropdownlistbox within w_osaroi_duzon_r
end type
type sle_value from singlelineedit within w_osaroi_duzon_r
end type
type cb_3 from commandbutton within w_osaroi_duzon_r
end type
type cb_4 from commandbutton within w_osaroi_duzon_r
end type
type cb_5 from commandbutton within w_osaroi_duzon_r
end type
type cb_6 from commandbutton within w_osaroi_duzon_r
end type
type st_horizontal from u_splitbar_horizontal within w_osaroi_duzon_r
end type
type dw_3 from datawindow within w_osaroi_duzon_r
end type
type st_5 from statictext within w_osaroi_duzon_r
end type
type st_8 from statictext within w_osaroi_duzon_r
end type
type em_buseo from editmask within w_osaroi_duzon_r
end type
type st_7 from statictext within w_osaroi_duzon_r
end type
type em_num from editmask within w_osaroi_duzon_r
end type
end forward

global type w_osaroi_duzon_r from w_inheritance
integer width = 4352
integer height = 2404
string title = "매출전표 만들기(더존용)(w_osaroi_duzon_r)"
boolean center = true
em_1 em_1
st_1 st_1
cbx_1 cbx_1
st_3 st_3
ddlb_1 ddlb_1
cbx_2 cbx_2
cb_1 cb_1
hpb_1 hpb_1
st_2 st_2
cb_2 cb_2
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
ddlb_op ddlb_op
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
st_horizontal st_horizontal
dw_3 dw_3
st_5 st_5
st_8 st_8
em_buseo em_buseo
st_7 st_7
em_num em_num
end type
global w_osaroi_duzon_r w_osaroi_duzon_r

type variables
datawindowchild idwc_user
String xlsFile
end variables

forward prototypes
public subroutine wf_multi_select (datawindow a_dw, long al_row)
end prototypes

public subroutine wf_multi_select (datawindow a_dw, long al_row);//**************************************//
// 함수명 : wf_multi_select NONE
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
			a_dw.object.chk[i] = 1			
      next
   else
		a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
elseif keydown(KeyControl!) then
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(al_row, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1
   end if
 else
   if a_dw.isSelected(al_row) then
      a_dw.SelectRow(0, false)
		a_dw.object.chk[al_row] = 0			
   else
      a_dw.SelectRow(0,false)
      a_dw.SelectRow(al_row, true)
		a_dw.object.chk[al_row] = 1			
   end if
 end if  
//**************************************//

end subroutine

on w_osaroi_duzon_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.cbx_1=create cbx_1
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.cbx_2=create cbx_2
this.cb_1=create cb_1
this.hpb_1=create hpb_1
this.st_2=create st_2
this.cb_2=create cb_2
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_horizontal=create st_horizontal
this.dw_3=create dw_3
this.st_5=create st_5
this.st_8=create st_8
this.em_buseo=create em_buseo
this.st_7=create st_7
this.em_num=create em_num
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.cbx_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.hpb_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.ddlb_fld
this.Control[iCurrent+13]=this.ddlb_dwtitles
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.ddlb_op
this.Control[iCurrent+16]=this.sle_value
this.Control[iCurrent+17]=this.cb_3
this.Control[iCurrent+18]=this.cb_4
this.Control[iCurrent+19]=this.cb_5
this.Control[iCurrent+20]=this.cb_6
this.Control[iCurrent+21]=this.st_horizontal
this.Control[iCurrent+22]=this.dw_3
this.Control[iCurrent+23]=this.st_5
this.Control[iCurrent+24]=this.st_8
this.Control[iCurrent+25]=this.em_buseo
this.Control[iCurrent+26]=this.st_7
this.Control[iCurrent+27]=this.em_num
end on

on w_osaroi_duzon_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.cbx_1)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.cbx_2)
destroy(this.cb_1)
destroy(this.hpb_1)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_horizontal)
destroy(this.dw_3)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.em_buseo)
destroy(this.st_7)
destroy(this.em_num)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)
dw_3.visible = false

cb_2.enabled = false		// 매출이관 작업

if GF_Permission('매출전표_만들기(더존용)', gs_userid) = 'Y' then
else
	pb_print.enabled = false
end if

cb_2.enabled = false
if GF_Permission( "매출이관_작업", gs_userid ) = "Y" then	
	cb_2.enabled = true
end if

if day(today()) > 10 then
	em_1.text = string(today(),'yyyy/mm')
else
	em_1.text = string(RelativeDate(today(),  - day(today()) ),'yyyy/mm')
end if

//dw_1.sharedata(dw_2)

ddlb_1.text   = "전체"
hpb_1.position = 0
hpb_1.visible = false

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = dw_1.width

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_2.x * 2)
dw_2.height = newheight - dw_2.y - gb_2.x


end event

type pb_save from w_inheritance`pb_save within w_osaroi_duzon_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_osaroi_duzon_r
integer x = 32
integer y = 440
integer width = 4242
integer height = 996
integer taborder = 60
string dataobject = "d_glartax_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if row < 1 then return

//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event dw_1::doubleclicked;call super::doubleclicked;//
string  ls_username

if isnull(row) OR row < 1 then RETURN

dw_3.visible = true

dw_3.x  = (Parent.width  - dw_3.width)  / 2
dw_3.y  = (Parent.height - dw_3.height) / 2

ls_username  = this.object.user_name1[row]
dw_3.retrieve( ls_username )

end event

type st_title from w_inheritance`st_title within w_osaroi_duzon_r
integer x = 32
integer y = 20
integer width = 1541
integer height = 140
string text = "매출전표 만들기(더존용)"
end type

type st_tips from w_inheritance`st_tips within w_osaroi_duzon_r
end type

type pb_compute from w_inheritance`pb_compute within w_osaroi_duzon_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_osaroi_duzon_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_osaroi_duzon_r
integer x = 4055
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osaroi_duzon_r
integer x = 3863
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
long    ll_row
DataWindow dwxls

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.rowcount() < 1 then RETURN

MessageBox("확인","현재 사용중인 엑셀 프로그램을 모두 종료한 후에 작업하시기 바랍니다.~n~n" + &
						"Windows 작업관리자 메뉴(Ctrl+Alt+del)에서도 EXCEL.EXE가 백그라운드로 실행되는지 확인 바랍니다.~n~n" + &
						"'EXCEL.EXE' 프로그램이 존재한다면 선택 후 '프로세스 끝내기' 로 종료한 후 작업하시기 바랍니다.")
						
if xlsFile = "Y" then
	xlsFile = ""
	dwxls = dw_2
else
	if MessageBox("확인","회계 자동전표(더존)를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
		dwxls = dw_2
	else
		dwxls = dw_1
	end if
end if

if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
   //===============================================================//
	if MessageBox("확인","회계 자동전표(더존)를 표준서식으로 만들겠습니까?~n~n" + &
	              "표준서식은 시간이 많이 소요됩니다.", Exclamation!, YesNo!, 1) = 1 then
		Integer iret
		long    lY, lX
		OLEObject OleExcel
		
		OleExcel = CREATE OLEObject 
		iret = OleExcel.ConnectToNewObject( "Excel.Application" ) 
		if iret <> 0 then DESTROY OleExcel 
	
		// Visible = True의 경우 엑셀 프로그램이 띄워지며 False인 경우 아이콘화된다. 
		OleExcel.Application.Visible = true
	
		// 엑셀을 로드한 후 Empty Sheet를 연다. 
		if OleExcel.WorkBooks.Open( ls_DocName ) <> 0 then
			MessageBox("확인","엑셀파일 열기 오류 입니다.")
			RETURN
		end if
		
		// 셀서식 텍스트로 변경
	// OleExcel.Application.ScreenUpdating = False	
		OleExcel.Worksheets(1).Cells.ClearContents
		OleExcel.Worksheets(1).Range("A1").Select
		
		OleExcel.Worksheets(1).Columns("A:AE").NumberFormatLocal = "@"			
		
		hpb_1.visible = true	
		for ly = 1 to dwxls.rowcount()
			hpb_1.position = (ly / dwxls.rowcount()) * 100
			
			OleExcel.Worksheets(1).Cells(ly,  1).Value = dwxls.object.in_dt[ly]
			OleExcel.Worksheets(1).Cells(ly,  2).Value = dwxls.object.co_cd[ly]
			OleExcel.Worksheets(1).Cells(ly,  3).Value = dwxls.object.div_cd[ly]
			OleExcel.Worksheets(1).Cells(ly,  4).Value = dwxls.object.dept_cd[ly]
			OleExcel.Worksheets(1).Cells(ly,  5).Value = dwxls.object.isu_dt[ly]
			OleExcel.Worksheets(1).Cells(ly,  6).Value = dwxls.object.in_sq[ly]
			OleExcel.Worksheets(1).Cells(ly,  7).Value = dwxls.object.ln_sq[ly]
			OleExcel.Worksheets(1).Cells(ly,  8).Value = dwxls.object.acct_cd[ly]
			OleExcel.Worksheets(1).Cells(ly,  9).Value = dwxls.object.drcr_fg[ly]
			OleExcel.Worksheets(1).Cells(ly, 10).Value = dwxls.object.rmk_dc[ly]
			OleExcel.Worksheets(1).Cells(ly, 11).Value = dwxls.object.acct_am[ly]
			OleExcel.Worksheets(1).Cells(ly, 12).Value = dwxls.object.tr_cd[ly]
			OleExcel.Worksheets(1).Cells(ly, 13).Value = dwxls.object.ct_dept[ly]
			OleExcel.Worksheets(1).Cells(ly, 14).Value = dwxls.object.pjt_cd[ly]
			OleExcel.Worksheets(1).Cells(ly, 15).Value = dwxls.object.ct_nb[ly]
			OleExcel.Worksheets(1).Cells(ly, 16).Value = dwxls.object.fr_dt[ly]
			OleExcel.Worksheets(1).Cells(ly, 17).Value = dwxls.object.to_dt[ly]
			OleExcel.Worksheets(1).Cells(ly, 18).Value = dwxls.object.ct_qt[ly]
			OleExcel.Worksheets(1).Cells(ly, 19).Value = dwxls.object.ct_am[ly]
			OleExcel.Worksheets(1).Cells(ly, 20).Value = dwxls.object.ct_rt[ly]
			OleExcel.Worksheets(1).Cells(ly, 21).Value = dwxls.object.ct_deal[ly]
			OleExcel.Worksheets(1).Cells(ly, 22).Value = dwxls.object.ct_user1[ly]
			OleExcel.Worksheets(1).Cells(ly, 23).Value = dwxls.object.ct_user2[ly]
			OleExcel.Worksheets(1).Cells(ly, 24).Value = dwxls.object.attr_cd[ly]
			OleExcel.Worksheets(1).Cells(ly, 25).Value = dwxls.object.isu_doc[ly]
			OleExcel.Worksheets(1).Cells(ly, 26).Value = dwxls.object.logic_cd[ly]
			OleExcel.Worksheets(1).Cells(ly, 27).Value = dwxls.object.dummy1[ly]
			OleExcel.Worksheets(1).Cells(ly, 28).Value = dwxls.object.dummy2[ly]
			OleExcel.Worksheets(1).Cells(ly, 29).Value = dwxls.object.jeonja_yn[ly]
			OleExcel.Worksheets(1).Cells(ly, 30).Value = dwxls.object.user_name[ly]
			OleExcel.Worksheets(1).Cells(ly, 31).Value = dwxls.object.dept_name[ly]
		next
		hpb_1.visible = false
	
		OleExcel.Worksheets(1).Rows("1:2").Insert
		OleExcel.WorkSheets(1).Cells(1,  1).Value = "IN_DT"
		OleExcel.WorkSheets(1).Cells(1,  2).Value = "CO_CD"
		OleExcel.WorkSheets(1).Cells(1,  3).Value = "DIV_CD"
		OleExcel.WorkSheets(1).Cells(1,  4).Value = "DEPT_CD"
		OleExcel.WorkSheets(1).Cells(1,  5).Value = "ISU_DT"
		OleExcel.WorkSheets(1).Cells(1,  6).Value = "IN_SQ"
		OleExcel.WorkSheets(1).Cells(1,  7).Value = "LN_SQ"
		OleExcel.WorkSheets(1).Cells(1,  8).Value = "ACCT_CD"
		OleExcel.WorkSheets(1).Cells(1,  9).Value = "DRCR_FG"
		OleExcel.WorkSheets(1).Cells(1, 10).Value = "RMK_DC"
		OleExcel.WorkSheets(1).Cells(1, 11).Value = "ACCT_AM"
		OleExcel.WorkSheets(1).Cells(1, 12).Value = "TR_CD"
		OleExcel.WorkSheets(1).Cells(1, 13).Value = "CT_DEPT"
		OleExcel.WorkSheets(1).Cells(1, 14).Value = "PJT_CD"
		OleExcel.WorkSheets(1).Cells(1, 15).Value = "CT_NB"
		OleExcel.WorkSheets(1).Cells(1, 16).Value = "FR_DT"
		OleExcel.WorkSheets(1).Cells(1, 17).Value = "TO_DT"
		OleExcel.WorkSheets(1).Cells(1, 18).Value = "CT_QT"
		OleExcel.WorkSheets(1).Cells(1, 19).Value = "CT_AM"
		OleExcel.WorkSheets(1).Cells(1, 20).Value = "CT_RT"
		OleExcel.WorkSheets(1).Cells(1, 21).Value = "CT_DEAL"
		OleExcel.WorkSheets(1).Cells(1, 22).Value = "CT_USER1"
		OleExcel.WorkSheets(1).Cells(1, 23).Value = "CT_USER2"
		OleExcel.WorkSheets(1).Cells(1, 24).Value = "ATTR_CD"
		OleExcel.WorkSheets(1).Cells(1, 25).Value = "ISU_DOC"
		OleExcel.WorkSheets(1).Cells(1, 26).Value = "LOGIC_CD"
		OleExcel.WorkSheets(1).Cells(1, 27).Value = "DUMMY1"
		OleExcel.WorkSheets(1).Cells(1, 28).Value = "DUMMY2"
		OleExcel.WorkSheets(1).Cells(1, 29).Value = "JEONJA_YN"
		OleExcel.Worksheets(1).Cells(1, 30).Value = "USER_NAME"
		OleExcel.Worksheets(1).Cells(1, 31).Value = "DEPT_NAME"
	
		OleExcel.WorkSheets(1).Cells(2,  1).Value = "처리일자(0)"      
		OleExcel.WorkSheets(1).Cells(2,  2).Value = "회사코드(1)"      
		OleExcel.WorkSheets(1).Cells(2,  3).Value = "사업장코드(2)"    
		OleExcel.WorkSheets(1).Cells(2,  4).Value = "부서코드(3)"      
		OleExcel.WorkSheets(1).Cells(2,  5).Value = "결의일자(4)"      
		OleExcel.WorkSheets(1).Cells(2,  6).Value = "자동전표번호(5)"  
		OleExcel.WorkSheets(1).Cells(2,  7).Value = "라인번호(6)"      
		OleExcel.WorkSheets(1).Cells(2,  8).Value = "계정과목(7)"      
		OleExcel.WorkSheets(1).Cells(2,  9).Value = "차대구분(8)"      
		OleExcel.WorkSheets(1).Cells(2, 10).Value = "적요(9)"          
		OleExcel.WorkSheets(1).Cells(2, 11).Value = "금액(10)"         
		OleExcel.WorkSheets(1).Cells(2, 12).Value = "관리항목(11)"     
		OleExcel.WorkSheets(1).Cells(2, 13).Value = "사용부서등(12)"   
		OleExcel.WorkSheets(1).Cells(2, 14).Value = "사업장코드(13)"   
		OleExcel.WorkSheets(1).Cells(2, 15).Value = "세무구분(14)"     
		OleExcel.WorkSheets(1).Cells(2, 16).Value = "발생일(15)"       
		OleExcel.WorkSheets(1).Cells(2, 17).Value = "만기일(16)"       
		OleExcel.WorkSheets(1).Cells(2, 18).Value = "H관리(17)"        
		OleExcel.WorkSheets(1).Cells(2, 19).Value = "I관리(18)"        
		OleExcel.WorkSheets(1).Cells(2, 20).Value = "J관리(19)"        
		OleExcel.WorkSheets(1).Cells(2, 21).Value = "K관리(20)"        
		OleExcel.WorkSheets(1).Cells(2, 22).Value = "사용자정의1(21)"  
		OleExcel.WorkSheets(1).Cells(2, 23).Value = "사용자정의2(22)"  
		OleExcel.WorkSheets(1).Cells(2, 24).Value = "증빙코드(23)"     
		OleExcel.WorkSheets(1).Cells(2, 25).Value = "품의내역(24)"     
		OleExcel.WorkSheets(1).Cells(2, 26).Value = "전표유형(25)"     
		OleExcel.WorkSheets(1).Cells(2, 27).Value = "환종(24)"         
		OleExcel.WorkSheets(1).Cells(2, 28).Value = "외화금액(25)"     
		OleExcel.WorkSheets(1).Cells(2, 29).Value = "전자세금(26)"     
		OleExcel.WorkSheets(1).Cells(2, 30).Value = "담당자명"     
		OleExcel.WorkSheets(1).Cells(2, 31).Value = "부서명"     
	
		OleExcel.WorkSheets(1).Cells.EntireColumn.AutoFit
		OleExcel.WorkSheets(1).Range("A1").Select
		OleExcel.Application.ScreenUpdating = True
	
	
		//다른이름으로 저장 
	//	OleExcel.Application.Visible = true
		OleExcel.Application.DisplayAlerts = False
		OleExcel.Application.Workbooks(1).SaveAs(ls_Docname, 56, "", "", False, False, 2)
		OleExcel.Application.DisplayAlerts = True
		OleExcel.Application.WorkBooks(1).Close()	

		//연결해제
		OleExcel.DisConnectObject()
		Destroy OleExcel 
	else
		if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
				dwxls.SaveAsAscII(ls_DocName)
			end if
		end if		
	end if
end if   

if GF_Permission( "매출이관_작업", gs_userid ) = "Y" then	
	cb_2.triggerevent( clicked! )
end if
MessageBox("확인","엑셀파일 작업완료.")

///*
//Long ll_row, ll_page, ll_row_rem, ll_ii, ll_page1
//Int  ret, pb_Sum, page_row, page_row1
//String out_data, ls_pos, ls_unit, ls_condition
//OLEObject export_object
//
//page_row = 28
//page_row1 = 26
//
//ll_row  = 0
//ll_page = 0
//ll_row_rem = 0
//ll_page1 = 0
//ll_row   = dw_right.rowcount() 
//if ll_row < 1 then return
//
//export_object = Create OLEObject
//ret = export_object.ConnectToNewObject( "Excel.Application" )
//If ret < 0 Then
//	MessageBox("Connect to Excel Failed !",string(ret))
//	Return
//End If
//
//ll_page    = ll_row / page_row
//ll_row_rem = ll_row - ( ll_page * page_row )
//If ll_row_rem > 0 Then 
//	ll_page = ll_page + 1
//End If
//ll_page1 = ll_page + 1
//
//export_object.Application.Workbooks.Open("C:\emart\emart.xlt") //,false,true
//export_object.Application.Visible = True
//export_object.Worksheets[1].Activate;
//
////엑셀의 Line블럭복사
//for ll_ii = 1 to ll_page - 1
//	export_object.Rows('3:'+string(page_row)).Select; // LINE 단위 SELECT
//	export_object.selection.copy;
//	if ll_ii = 1 then
//		export_object.Rows(string(page_row*ll_ii+1)).select;
//	else
//		export_object.Rows(string(page_row1*ll_ii+3)).select;
//	end if 
//	export_object.activesheet.paste;
//Next
//
//If ll_page > 1 and ll_page <> 2 Then
//	export_object.Rows('3:'+string(page_row)).Select; // LINE 단위 SELECT
//	export_object.selection.copy;
//	export_object.Rows(string(page_row1*ll_ii+3)).select;
//	export_object.activesheet.paste;
//end if
//
////엑셀에 전환할때 서식추가 변수
//ls_unit = "@"
//
////dw내용 엑셀로 전환부분
//For ll_ii = 1 To dw_right.rowcount()
//	export_object.Worksheets(1).cells(ll_ii+2,1).value = dw_right.getitemstring(ll_ii,'detail_code') //상세코드
//	export_object.Worksheets(1).cells(ll_ii+2,2).value = dw_right.getitemstring(ll_ii,'nm_kor') //한글명
//	export_object.Worksheets(1).cells(ll_ii+2,3).value = dw_right.getitemstring(ll_ii,'nm_eng') //영문명
//	
//	export_object.Worksheets(1).cells(ll_ii+2,4).value = string(dw_right.getitemNumber(ll_ii,'ref_value')) //참조수치
//	export_object.Worksheets(1).cells(ll_ii+2,4).NumberFormatLocal = '"'+ls_unit+' "' + "#,##0" //엑셀에 전환시 서식추가 부분
//	
//	export_object.Worksheets(1).cells(ll_ii+2,5).value = dw_right.getitemstring(ll_ii,'sort_order') //정렬순서
//	export_object.Worksheets(1).cells(ll_ii+2,6).value = dw_right.getitemstring(ll_ii,'status') //상태
//next
//
//export_object.Rows('3:'+string(page_row*ll_page+2)).Select;
//export_object.range('A3','F'+string(page_row*ll_page+2)).font.size=9
//If ll_page = 1 Then 
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row*ll_page);
//elseif ll_page = 2 then
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row1*ll_page+2);
//else
//	export_object.activesheet.pagesetup.Printarea = '$A$3:$F$'+string(page_row1*ll_page1+2)
//end if
//
//export_object.DisConnectObject() //연결종료
//Destroy export_object //오브젝트 제거
//
//// excel 저장 후 엑셀파일 open
//string ls_excelpath
//integer li_rtn1
//
//RegistryGet("HKEY_CLASSES_ROOT\Excel.Addin\shell\Open\command", "", RegString!, ls_excelpath)
//li_rtn1 = Run(ls_excelpath + ' "' + ls_pathname + '"', Maximized!)
//
////##############################################################
////추가 사항 
////##############################################################
//Long   ll_ret
//String ls_ret
//String ls_string1
//
//oleobject myoleobject
//
//myoleobject = create oleobject
//
//ll_ret = myoleobject.connecttoobject("c:\a.xls")
//Messagebox("Result!",string(ll_ret))
//
//myoleobject.Application.Visible = TRUE
//
//// 쓰기
//myoleobject.application.workbooks(1).worksheets(1).cells(1,1).value="Test"
//// 읽기
//ls_ret = myoleobject.application.workbooks(1).worksheets(1).cells(1,1).value
//
//
////문자형으로 저장
// myoleobject.application.workbooks(1).worksheets(1).Cells.NumberFormatLocal := '@';  
//
//
///* 추가 사항 */
//http://msdn.microsoft.com/ko-kr/library/microsoft.office.interop.excel.range_properties(office.11).aspx
//
//
////Excel File Open
//myOleObject.WorkBooks.Open("c:\a.xls") 
//
//// Sheet Name 
//ls_string1 = myOleObject.sheets[1].Name 
//
//// Sheet 자동마춤
//myOleObject.Worksheets[1].Columns.AutoFit 
//// Sheet의 갯수 읽기
//ll_PageCnt = myOleObject.application.Workbooks(1).Worksheets.Count
////읽기
//ls_ret = myOleobject.application.workbooks(1).worksheets(1).Range( "A1" ).Value 
////쓰기
//myOleobject.application.workbooks(1).worksheets(1).Range( "A1" ).Value = 'Test'
////Row Delete 행삭제
//myOleobject.application.Workbooks(1).Worksheets(1).rows("1").delete
//// 시트의 이름을 지정
//myoleobject.Sheets[1].Name = "Sheet명"
////저장
//myoleobject.application.workbooks(1).Save()
////다른이름으로 저장 
//myoleobject.application.workbooks(1).SaveAs("c:\b.xls")
////다른이름으로 저장 - Sheet 별로 (tab으로 분리된 text파일)
//myoleobject.application.Workbooks(1).Worksheets(i).SaveAs("c:\c.txt",3) 
//
////인자값 (3) 에 따라 저장형식 다름 - 엑셀 도움말 참조
//
//
//// 마지막sheet 뒤에 새로운 sheet추가
//any la_null
//setnull(null)
//myoleobject.ActiveWorkbook.Sheets.Add (la_null, myoleobject.ActiveWorkbook.Sheets(   myoleobject.ActiveWorkbook.Sheets.Count   ))
//
////새로열기
//myoleobject.connecttonewobject("excel.application")
////파일열기
//myoleobject.WorkBooks.Opentext('c:\tmpgoodef.xls')
////타이틀바 바꾸기
//myoleobject.Application.caption = "My Excel"
//
//// 첫번째 Row 선택후 처리
//myoleobject.rows("1:1").select
////굵은글씨
//myoleobject.selection.font.bold = true
////이탤릭으로
//myoleobject.selection.font.italic = true
////글씨색
//myoleobject.selection.font.Color = RGB (128,128,0)
////보더색, 테두리색
//myoleobject.selection.Borders.Color = RGB (0,0,128)
//
//// 엑셀배경색
//myoleobject.selection.Interior.Color = RGB (153,204,255)
//
////워드랩
//myoleobject.selection.wraptext = true
////가로정렬
//myoleobject.selection.horizontalalignment = true
////세로정렬
//myoleobject.selection.verticalalignment = true
//
////상태바 표시
//myoleobject.statusbar = " My Status"
////첫번째Row를 프린트시 반복으로 (헤더로 표시)
//myoleobject.Activesheet.PageSetup.PrintTitleRows = "$1:$1"
//
////첫번째쉬트를 복사 - 자세한 내용은 엑셀도움말을 참조
//myoleobject.Worksheets(1).copy
////저장없이 닫기
//myoleobject.WorkBooks(1).Close(false)
////연결해제
//myoleobject.DisConnectObject()
//
//destroy myoleobject 
//
// 
//
////#############################################################
//// dw > html > excel
////#############################################################
//
//docname = 'test3.pdf'
//li_ret = dw_1.SaveAs("C:\test2.pdf", PDF!, True)
//
//if dw_insert.SaveAs(docname, pdf!, True) = -1 then
//MessageBox("Warning", "Unable to export data. Error writing to file!", Exclamation!)
//return
//end if
//
//OLEObject excel
//excel = CREATE OLEObject
//if excel.ConnectToObject(docname) = 0 then
//excel.application.DisplayAlerts = FALSE
//excel.application.workbooks(1).Parent.Windows(excel.application.workbooks(1).Name).Visible = True
//excel.application.workbooks(1).saveas(docname, 39)
//excel.application.workbooks(1).close()
//end if
//
//DESTROY excel 
//
//*/
//

end event

event pb_print::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

type pb_cancel from w_inheritance`pb_cancel within w_osaroi_duzon_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_osaroi_duzon_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_osaroi_duzon_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osaroi_duzon_r
integer x = 3671
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_area, ls_openclose
st_security lst_security

dw_1.reset()
dw_2.reset()

if em_1.text = "" then
	MessageBox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

cb_2.enabled  = true		// 매출이관 작업
cbx_2.checked = false	// 전체선택
ls_date = em_1.text

choose case ddlb_1.text
	case "전체"
		ls_area = "%"
	case "(주)유창"
		ls_area = "S01"
	case "(주)유창서울사무소"
		ls_area = "H01"
	case "(주)유창대전영업소"
		ls_area = "Z01"
	case "본.지점"
		ls_area = "D01"
end choose
// 수출은 별도 수기로 함.

if cbx_1.checked = true then	// 회계이관 자료
	ls_openclose = "T"
else
	ls_openclose = "O"
end if

dw_1.retrieve( ls_date, ls_openclose, ls_area )
MessageBox("확인","작업대상을 선택한 후 '자동전표 만들기'를 클릭 하시기 바랍니다.",information!)

end event

type gb_3 from w_inheritance`gb_3 within w_osaroi_duzon_r
integer x = 1618
integer y = 12
integer width = 1989
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osaroi_duzon_r
integer y = 252
integer width = 4242
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osaroi_duzon_r
integer x = 3630
integer width = 645
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osaroi_duzon_r
integer x = 32
integer y = 1484
integer width = 4242
integer height = 784
integer taborder = 0
string dataobject = "d_duzon_excel_r"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type em_1 from editmask within w_osaroi_duzon_r
integer x = 2002
integer y = 92
integer width = 311
integer height = 84
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

type st_1 from statictext within w_osaroi_duzon_r
integer x = 1664
integer y = 108
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "해당 년월:"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_osaroi_duzon_r
integer x = 1650
integer y = 20
integer width = 718
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
string text = "회계이관 자료열람"
end type

type st_3 from statictext within w_osaroi_duzon_r
integer x = 41
integer y = 188
integer width = 814
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출전표_만들기(더존용)"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_osaroi_duzon_r
integer x = 2331
integer y = 92
integer width = 718
integer height = 404
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
string item[] = {"전체","(주)유창서울사무소","(주)유창대전영업소","(주)유창","본.지점"}
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_osaroi_duzon_r
integer x = 87
integer y = 252
integer width = 224
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
end type

event clicked;// 전체선택
long  ll_row, ll_cnt

if dw_1.rowcount() < 1 then return

dw_1.setredraw( false )
for ll_row =  1 to dw_1.rowcount()
	if this.checked = true then
		if dw_1.object.cust_group[ll_row] = "" then 
			dw_1.object.chk[ll_row] = 1
			dw_1.SelectRow(0, false)
			dw_1.SelectRow(ll_row, true)
		else
			dw_1.object.chk[ll_row] = 0
		end if
	else
		dw_1.object.chk[ll_row] = 0
		dw_1.SelectRow(0, false)
	end if
next
dw_1.setredraw( true )

end event

type cb_1 from commandbutton within w_osaroi_duzon_r
integer x = 3008
integer y = 296
integer width = 1175
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "회계(더존) 자동전표 만들기"
end type

event clicked;//
long	 ll_row, lY, lX, ll_dw2row, ll_find, ll_slipno, ll_totcnt1, ll_totcnt2, ll_totcnt3, ll_max_insq
string ls_getdate, ls_esero, ls_partno, ls_teamname, ls_acctdate, ls_custgroup
string ls_weekday, ls_time, ls_usernm, ls_teamnm

ll_row = dw_1.rowcount()
if ll_row = 0 then
	MessageBox("확인","영업 매출세금계산서 데이터가 존재하지 않습니다.")
	RETURN
end if

// 회계부서, 사번 체크
ll_totcnt1  = dw_1.object.totcnt1[1]
ll_totcnt2  = dw_1.object.totcnt2[1]
ll_totcnt3  = dw_1.object.totcnt3[1]
//if ll_totcnt1 <> ll_totcnt2 OR ll_totcnt1 <> ll_totcnt3 then	//20260211	bkkim
//	for ll_row = 1 to dw_1.rowcount()
//		ls_usernm = dw_1.object.user_name[ll_row]
//		ls_teamnm = dw_1.object.team_name[ll_row]
//		
//		if isnumber(ls_usernm) AND isnumber(ls_teamnm) then
//			//
//		else
//			dw_1.ScrollToRow( ll_row )
//			MessageBox("확인","더블클릭 후 회계부서, 사번을 수정하시기 바랍니다.")
//			RETURN
//		end if
//	next
//end if

SELECT top 1 replace(convert(char(10),getdate(),111),'/','') INTO :ls_getdate FROM login;

//////////////////////////////////////////////////////
//// 거래처 그룹코드가 존재하면 
//// 현 거래처의 계산서 데이터를 그룹코드로 집계 함
//////////////////////////////////////////////////////
//ll_find = 0
//for ly = 1 to ll_row
//	ls_custgroup = trim(dw_1.object.cust_group[ly])
//	if isnull(ls_custgroup) or ls_custgroup = "" then
//	else
//		// 거래처 그룹코드 존재시
//		ll_find = dw_1.Find( "cust_no = '" + ls_custgroup + "' ", 1, ll_row )	
//		if ll_find < 1 then
//			MessageBox("확인","거래처 그룹코드가 존재하나, 대표 거래처 데이터가 존재하지 않습니다.")
//			RETURN
//		else
//         dw_1.object.aroiinv_cash[ll_find] = dw_1.object.aroiinv_cash[ll_find] + dw_1.object.aroiinv_cash[ly]  // 공급가액   
//         dw_1.object.aroiinv_rate[ll_find] = dw_1.object.aroiinv_rate[ll_find] + dw_1.object.aroiinv_rate[ly]  // 부가세(공) 
//         dw_1.object.ship_cost[ll_find]    = dw_1.object.ship_cost[ll_find]    + dw_1.object.ship_cost[ly]     // 운반비     
//         dw_1.object.dc_rate[ll_find]      = dw_1.object.dc_rate[ll_find]      + dw_1.object.dc_rate[ly]       // 
//         dw_1.object.aroiinv_discount[ll_find] = dw_1.object.aroiinv_discount[ll_find] + dw_1.object.aroiinv_discount[ly]      // 
//		end if
//	end if
//next
//////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
SQLCA2 = CREATE Transaction 

// Profile iCube DB
SQLCA2.DBMS       = "MSS Microsoft SQL Server 6.x"
SQLCA2.ServerName = "192.168.1.12"
SQLCA2.Database   = "DZICUBE"
SQLCA2.LogId      = "dzicube"
SQLCA2.LogPass    = 'ejwhs123$'
SQLCA2.AutoCommit = False
SQLCA2.DBParm     = "CommitOnDisconnect='No',DateTimeAllowed='Yes',Host=" + gs_userid

CONNECT USING SQLCA2; 		// SQLCA 가 아님에 주의!

SELECT max(in_sq) INTO :ll_max_insq 
  FROM SAUTODOCUD 
 WHERE co_cd = '1000' AND in_dt = :ls_getdate USING SQLCA2;
if isnull(ll_max_insq) then em_num.text = "300"
if em_num.text < "300" then
	ll_max_insq = 300
	em_num.text = string(ll_max_insq)
else
	em_num.text = string(ll_max_insq + 30)
end if

DISCONNECT USING SQLCA2; 
DESTROY SQLCA2 				// 사용이 끝났으면 DESTROY를 해줄 것. 
////////////////////////////////////////////////////////////////////////////////////////////////

ll_slipno     = long(em_num.text)  	// 미결 시작번호 
dw_2.reset()
hpb_1.visible = true

debugbreak()

dw_2.setredraw( false )
for ly = 1 to dw_1.rowcount()
	hpb_1.position = (ly / ll_row) * 100

	////////////////////////////////////////////////////
	// 거래처 그룹코드 존재시 SKIP
	////////////////////////////////////////////////////
	//if dw_1.object.cust_group[ly] = "" then	
	//else
	//	CONTINUE
   //end if
	////////////////////////////////////////////////////
	
	ll_slipno   = ll_slipno + 1
	ls_partno   = dw_1.object.inv_area[ly] 	// 사업장 구분
	ls_teamname = dw_1.object.team_name[ly] 	// 부서명
	ls_acctdate = dw_1.object.oi_date[ly]  	// 계산서일자
	
	if dw_1.object.chk[ly] = 1 and ls_partno <> "DD" then
		choose case ls_partno
			case "S01", "D01"
				ls_partno = "1000"
			case "H01"
				ls_partno = "2000"
			case "Z01"
				ls_partno = "3000"
		end choose

		// 외상 매출금 추가
		ll_dw2row = dw_2.insertrow(0)
		dw_2.object.in_dt[ll_dw2row]     = ls_getdate   		// '처리일자'               
		dw_2.object.co_cd[ll_dw2row]     = "1000"       		// '회사코드'               
		dw_2.object.div_cd[ll_dw2row]    = ls_partno    		// '사업장코드'             
		dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  		// '부서코드'     ==영업사원의 부서명            
		dw_2.object.isu_dt[ll_dw2row]    = ls_acctdate  		// '결의일자'               
		dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  // '자동전표번호'           
		dw_2.object.ln_sq[ll_dw2row]     = "1"  		   		// '라인번호'               
		dw_2.object.acct_cd[ll_dw2row]   = "10801"      		// '계정과목(외상매출금)'               
		dw_2.object.drcr_fg[ll_dw2row]   = "차변"  				// '차대구분'               
		dw_2.object.rmk_dc[ll_dw2row]    = "M/B 外 자재 외상매출"  			// '적요'                   
		dw_2.object.acct_am[ll_dw2row]   = dw_1.object.tot[ly]  				// '금액'                   
		dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.register_no[ly]  	// '관리항목'               
		dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[ly]    	// 'C관리' =영업사원                  
		dw_2.object.pjt_cd[ll_dw2row]    = ""  					// 'D관리'                  
		dw_2.object.ct_nb[ll_dw2row]     = ""  					// 'E관리'                  
		dw_2.object.fr_dt[ll_dw2row]     = ""  					// 'F관리'                  
		dw_2.object.to_dt[ll_dw2row]     = ""  					// '만기일'                 
		dw_2.object.ct_qt[ll_dw2row]     = 0   					// 'H관리'                  
		dw_2.object.ct_am[ll_dw2row]     = 0   					// 'I관리'                  
		dw_2.object.ct_rt[ll_dw2row]     = 0   					// 'J관리'                  
		dw_2.object.ct_deal[ll_dw2row]   = ""  					// 'K관리'                  
		dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[ly]  // '사용자정의1'            
		dw_2.object.ct_user2[ll_dw2row]  = ""  					// '사용자정의2'            
		dw_2.object.attr_cd[ll_dw2row]   = ""  					// '증빙코드'               
		dw_2.object.isu_doc[ll_dw2row]   = ""  					// '품의내역'               
		dw_2.object.logic_cd[ll_dw2row]  = "11"  					// '전표유형'               
		dw_2.object.dummy1[ll_dw2row]    = ""  					// '환종'                   
		dw_2.object.dummy2[ll_dw2row]    = ""  					// '외화금액'               
		dw_2.object.jeonja_yn[ll_dw2row] = ""  					// '전자세금계산서여부'     
		dw_2.object.user_name[ll_dw2row] = dw_1.object.user_name1[ly] // '사원명'     
		dw_2.object.dept_name[ll_dw2row] = dw_1.object.team_name1[ly] // '부서명'     

		// 제 품 매 출 추가
		ll_dw2row = dw_2.insertrow(0)
		dw_2.object.in_dt[ll_dw2row]     = ls_getdate   		// '처리일자'               
		dw_2.object.co_cd[ll_dw2row]     = "1000"       		// '회사코드'               
		dw_2.object.div_cd[ll_dw2row]    = ls_partno    		// '사업장코드'             
		dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  		// '부서코드'        ==영업사원의 부서명            
		dw_2.object.isu_dt[ll_dw2row]    = ls_acctdate  		// '결의일자'               
		dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  // '자동전표번호'           
		dw_2.object.ln_sq[ll_dw2row]     = "2"  					// '라인번호'               
		dw_2.object.acct_cd[ll_dw2row]   = "40401"  	   		// '계정과목(제품매출)'               
		dw_2.object.drcr_fg[ll_dw2row]   = "대변"  				// '차대구분'               
		dw_2.object.rmk_dc[ll_dw2row]    = "M/B 外 자재 매출"  // '적요'                   
		dw_2.object.acct_am[ll_dw2row]   = dw_1.object.aroiinv_rate_tot[ly]  // '금액'                   
		dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.register_no[ly]  // '관리항목'               
		dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[ly]    // 'C관리' =영업사원                  
		dw_2.object.pjt_cd[ll_dw2row]    = ""  					// 'D관리'                  
		dw_2.object.ct_nb[ll_dw2row]     = ""  					// 'E관리'                  
		dw_2.object.fr_dt[ll_dw2row]     = ""  					// 'F관리'
		dw_2.object.to_dt[ll_dw2row]     = ""  					// '만기일'                 
		dw_2.object.ct_qt[ll_dw2row]     = 0   					// 'H관리'                  
		dw_2.object.ct_am[ll_dw2row]     = 0   					// 'I관리'                  
		dw_2.object.ct_rt[ll_dw2row]     = 0   					// 'J관리'                  
		dw_2.object.ct_deal[ll_dw2row]   = ""  					// 'K관리'                  
		dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[ly]  // '사용자정의1'            
		dw_2.object.ct_user2[ll_dw2row]  = ""  					// '사용자정의2'            
		dw_2.object.attr_cd[ll_dw2row]   = ""  					// '증빙코드'               
		dw_2.object.isu_doc[ll_dw2row]   = ""  					// '품의내역'               
		dw_2.object.logic_cd[ll_dw2row]  = "11"  					// '전표유형'               
		dw_2.object.dummy1[ll_dw2row]    = ""  					// '환종'                   
		dw_2.object.dummy2[ll_dw2row]    = ""  					// '외화금액'               
		dw_2.object.jeonja_yn[ll_dw2row] = ""  					// '전자세금계산서여부'     
		dw_2.object.user_name[ll_dw2row] = dw_1.object.user_name1[ly] // '사원명'     
		dw_2.object.dept_name[ll_dw2row] = dw_1.object.team_name1[ly] // '부서명'     
	
						
		// 부가세예수금 추가
		ll_dw2row = dw_2.insertrow(0)
	   if dw_1.object.aroiinv_esero[ly] = "Y" then
			ls_esero = "1"
		else
			ls_esero = ""
		end if
		
		dw_2.object.in_dt[ll_dw2row]     = ls_getdate   			// '처리일자'               
		dw_2.object.co_cd[ll_dw2row]     = "1000"       			// '회사코드'               
		dw_2.object.div_cd[ll_dw2row]    = ls_partno    			// '사업장코드'             
		dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  			// '부서코드'                       ==영업사원의 부서명            
		dw_2.object.isu_dt[ll_dw2row]    = ls_acctdate  			// '결의일자'               
		dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  	// '자동전표번호'           
		dw_2.object.ln_sq[ll_dw2row]     = "3"  						// '라인번호'               
		dw_2.object.acct_cd[ll_dw2row]   = "25500"      			// '계정과목(부가세예수금)'               
		dw_2.object.drcr_fg[ll_dw2row]   = "대변"  					// '차대구분'               
		dw_2.object.rmk_dc[ll_dw2row]    = "VAT(" + dw_1.object.aroiinv_no[ly] + ")"						// '적요'                   
		dw_2.object.acct_am[ll_dw2row]   = dw_1.object.aroiinv_rate[ly] + dw_1.object.ship_vat[ly]  	// '금액'                   
		dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.register_no[ly]  // '관리항목'               
		dw_2.object.ct_dept[ll_dw2row]   = ""  						// 'C관리'                  
		dw_2.object.pjt_cd[ll_dw2row]    = ls_partno  				// 'D관리'  =부가세계정인 경우 사업장코드
		dw_2.object.ct_nb[ll_dw2row]     = ""  						// 'E관리'                  
		dw_2.object.fr_dt[ll_dw2row]     = dw_1.object.oi_date[ly]  // 'F관리'  =계산서발행일                
		dw_2.object.to_dt[ll_dw2row]     = ""  						// '만기일'                 
		dw_2.object.ct_qt[ll_dw2row]     = 0   						// 'H관리'                  
		dw_2.object.ct_am[ll_dw2row]     = dw_1.object.aroiinv_rate_tot[ly]   // 'I관리'                  
		dw_2.object.ct_rt[ll_dw2row]     = 0   						// 'J관리'                  
		dw_2.object.ct_deal[ll_dw2row]   = ""  						// 'K관리'                  
		dw_2.object.ct_user1[ll_dw2row]  = ""  						// '사용자정의1'            
		dw_2.object.ct_user2[ll_dw2row]  = ""  						// '사용자정의2'            
		dw_2.object.attr_cd[ll_dw2row]   = ""  						// '증빙코드'               
		dw_2.object.isu_doc[ll_dw2row]   = ""  						// '품의내역'               
		dw_2.object.logic_cd[ll_dw2row]  = "11"  						// '전표유형'               
		dw_2.object.dummy1[ll_dw2row]    = ""  						// '환종'                   
		dw_2.object.dummy2[ll_dw2row]    = ""  						// '외화금액'               
		dw_2.object.jeonja_yn[ll_dw2row] = ls_esero  				// '전자세금계산서여부'     
		dw_2.object.user_name[ll_dw2row] = dw_1.object.user_name1[ly] // '사원명'     
		dw_2.object.dept_name[ll_dw2row] = dw_1.object.team_name1[ly] // '부서명'     
	
		
		if dw_1.object.ship_cost[ly] <> 0 then
			// 운반비 수입 추가
			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   		// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       		// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    		// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  		// '부서코드'    ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_acctdate  		// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  // '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = "4"  					// '라인번호'               
			dw_2.object.acct_cd[ll_dw2row]   = "90500"	   		// '계정과목(운반비수입)'               
			dw_2.object.drcr_fg[ll_dw2row]   = "대변"  				// '차대구분'               
			dw_2.object.rmk_dc[ll_dw2row]    = "자재운반수익"  	// '적요'                   
			dw_2.object.acct_am[ll_dw2row]   = dw_1.object.ship_cost[ly]  	// '금액'                   
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.register_no[ly] // '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[ly]  	// 'C관리'                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  					// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""  					// 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  					// 'F관리'                  
			dw_2.object.to_dt[ll_dw2row]     = ""  					// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   					// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   					// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   					// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  					// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[ly]  // '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  					// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  					// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = ""  					// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "11"  					// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  					// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  					// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  					// '전자세금계산서여부'     
			dw_2.object.user_name[ll_dw2row] = dw_1.object.user_name1[ly] // '사원명'     
			dw_2.object.dept_name[ll_dw2row] = dw_1.object.team_name1[ly] // '부서명'     
		else
	//		ls_tran_no = "003"
		end if		
	end if
next
hpb_1.visible = false
dw_2.setredraw( true )
dw_2.setfocus()

if GF_Permission("매출전표_만들기(더존용)", gs_userid) = "Y" then
	if MessageBox("확인","자동전표 분개처리 완료~n~n회계 자동전표(더존) 를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 1 then
		xlsFile = "Y"
		pb_print.triggerevent(clicked!)
	end if
end if

end event

type hpb_1 from hprogressbar within w_osaroi_duzon_r
integer x = 3063
integer y = 316
integer width = 1070
integer height = 72
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_2 from statictext within w_osaroi_duzon_r
integer x = 3031
integer y = 232
integer width = 1198
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처 그룹코드는 거래처코드로 집계됨"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_osaroi_duzon_r
integer x = 3067
integer y = 56
integer width = 512
integer height = 144
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "매출이관 작업"
end type

event clicked;//////////////////////////////////////////////////////
// 영업매출 이관작업 표시
//////////////////////////////////////////////////////
string ls_weekday, ls_sdate, ls_edate, ls_time, ls_errtext
date   ld_sdate, ld_edate
long   ll_row

if dw_1.rowcount() < 1 then RETURN

if GF_Permission( "매출이관_작업", gs_userid ) = "Y" then	
	ls_sdate  = GF_ReplaceAll(em_1.text,"/","") + "01"
	SELECT top 1 dbo.UF_GetLastDay( :ls_sdate ) INTO :ls_edate FROM login;
	
	ld_sdate  = date(em_1.text + "/01")
	ld_edate  = date( ls_edate )
	
	UPDATE aroiinv
		SET open_close = 'T'
	 WHERE oi_date between :ld_sdate and :ld_edate;
	if SQLCA.SQLCode = 0 then
		COMMIT;
	else
		ls_errtext = SQLCA.SQLErrText
		ROLLBACK;
		MessageBox("확인","DB ERROR가 발생하였습니다.~n~n" + ls_errtext)						
	end if

	MessageBox("확인","영업매출 이관작업 완료")
end if


//if MessageBox("확인","영업매출 이관작업 중 자동마감 하시겠습니까?~n~n" + &
//				  "마감해지 작업은 '세금계산서 매출해제(재무팀)' 에서 작업할 수 있습니다." , Exclamation!, YesNo!, 1) = 1 then
//
//	if MessageBox("확인","이 전표생성 작업은 시스템 처리속도에 영향을 주기에~r~r" + &
//					  "비업무 시간에 작업하는것을 권장 합니다.~r~r~r계속 진행하시겠습니까?",Exclamation!, YesNo!, 2) = 2 then
//		RETURN
//	end if
//
//	// 현재시간 
//	SELECT top 1 convert(char(1),datepart(DW,getdate())), substring(convert(char(20),getdate(),120),12,5) 
//	  INTO :ls_weekday, :ls_time 
//	  FROM login;
//	
//	// 근무일지
//	if ls_weekday = "1" then		// 일요일
//		//
//	else
//		if ls_time < "20:00" then  // 20:00 이전
//			if dw_1.object.compute_2[1] > 50 then
//				MessageBox("확인","영업 매출세금계산서 생성작업은~r~r50 건 단위로 작업하시기 바랍니다.")
//				RETURN
//			end if
//		end if
//	end if
//
//	for ll_row = 1 to dw_1.rowcount()
//		if dw_1.object.chk[ll_row] = 1 then
//			dw_1.object.gltrana_vat_no[ll_row]     = dw_1.object.aroiinv_no[ll_row]
//			dw_1.object.aroiinv_open_close[ll_row] = "T"   // T: gltrana transe
//		end if
//	next
//	
//	WF_Update1(dw_1, "N")
//end if

end event

type st_4 from statictext within w_osaroi_duzon_r
integer x = 87
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

type ddlb_fld from dropdownlistbox within w_osaroi_duzon_r
integer x = 274
integer y = 308
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_osaroi_duzon_r
integer x = 306
integer y = 320
integer width = 311
integer height = 88
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
end type

type st_6 from statictext within w_osaroi_duzon_r
integer x = 745
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

type ddlb_op from dropdownlistbox within w_osaroi_duzon_r
integer x = 914
integer y = 308
integer width = 297
integer height = 512
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
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type sle_value from singlelineedit within w_osaroi_duzon_r
integer x = 1234
integer y = 312
integer width = 526
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_osaroi_duzon_r
integer x = 1769
integer y = 312
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_osaroi_duzon_r
integer x = 1934
integer y = 312
integer width = 160
integer height = 76
integer taborder = 130
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

arg_dw  = dw_1

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_osaroi_duzon_r
integer x = 2098
integer y = 312
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_osaroi_duzon_r
integer x = 2263
integer y = 312
integer width = 160
integer height = 76
integer taborder = 150
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

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_horizontal from u_splitbar_horizontal within w_osaroi_duzon_r
integer x = 32
integer y = 1452
integer width = 4242
boolean bringtotop = true
end type

type dw_3 from datawindow within w_osaroi_duzon_r
integer x = 1230
integer y = 696
integer width = 2112
integer height = 820
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "회계부서 수정"
string dataobject = "d_duzon_sabun_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//

end event

event buttonclicked;//
string ls_userid, ls_duzon_sabun, ls_duzon_dept

choose case dwo.name
	case "b_1"		
		this.accepttext()
		
		ls_duzon_sabun = this.object.duzon_sabun[row]
		ls_duzon_dept  = this.object.duzon_dept[row]
		
		ls_userid = this.object.user_id[row]
		if isnull(ls_userid) OR ls_userid = "" then RETURN
		
		UPDATE login 
			SET duzon_sabun = :ls_duzon_sabun, duzon_dept  = :ls_duzon_dept 
		 WHERE user_id = :ls_userid;
		
		//
		this.visible = false
		pb_retrieve.TriggerEvent( clicked! )
end choose

end event

type st_5 from statictext within w_osaroi_duzon_r
integer x = 914
integer y = 244
integer width = 1285
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
string text = "더블클릭시에는 회계부서, 사번 수정함"
boolean focusrectangle = false
end type

type st_8 from statictext within w_osaroi_duzon_r
integer x = 2455
integer y = 248
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "회계부서"
boolean focusrectangle = false
end type

type em_buseo from editmask within w_osaroi_duzon_r
integer x = 2798
integer y = 240
integer width = 192
integer height = 68
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "3130"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

type st_7 from statictext within w_osaroi_duzon_r
integer x = 2455
integer y = 324
integer width = 334
integer height = 64
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "자동전표"
boolean focusrectangle = false
end type

type em_num from editmask within w_osaroi_duzon_r
integer x = 2798
integer y = 320
integer width = 192
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "300"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

