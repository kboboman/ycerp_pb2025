$PBExportHeader$w_ocaroi_duzon_r.srw
$PBExportComments$회계전표내보내기(더존)
forward
global type w_ocaroi_duzon_r from w_inheritance
end type
type em_1 from editmask within w_ocaroi_duzon_r
end type
type st_1 from statictext within w_ocaroi_duzon_r
end type
type st_3 from statictext within w_ocaroi_duzon_r
end type
type ddlb_1 from dropdownlistbox within w_ocaroi_duzon_r
end type
type cbx_2 from checkbox within w_ocaroi_duzon_r
end type
type cb_export from commandbutton within w_ocaroi_duzon_r
end type
type hpb_1 from hprogressbar within w_ocaroi_duzon_r
end type
type cb_trans from commandbutton within w_ocaroi_duzon_r
end type
type st_4 from statictext within w_ocaroi_duzon_r
end type
type ddlb_fld from dropdownlistbox within w_ocaroi_duzon_r
end type
type ddlb_dwtitles from dropdownlistbox within w_ocaroi_duzon_r
end type
type st_6 from statictext within w_ocaroi_duzon_r
end type
type sle_value from singlelineedit within w_ocaroi_duzon_r
end type
type cb_3 from commandbutton within w_ocaroi_duzon_r
end type
type cb_4 from commandbutton within w_ocaroi_duzon_r
end type
type cb_5 from commandbutton within w_ocaroi_duzon_r
end type
type cb_6 from commandbutton within w_ocaroi_duzon_r
end type
type st_horizontal from u_splitbar_horizontal within w_ocaroi_duzon_r
end type
type st_2 from statictext within w_ocaroi_duzon_r
end type
type dw_3 from datawindow within w_ocaroi_duzon_r
end type
type dw_4 from datawindow within w_ocaroi_duzon_r
end type
type cbx_1 from checkbox within w_ocaroi_duzon_r
end type
type st_7 from statictext within w_ocaroi_duzon_r
end type
type em_num from editmask within w_ocaroi_duzon_r
end type
type st_8 from statictext within w_ocaroi_duzon_r
end type
type em_buseo from editmask within w_ocaroi_duzon_r
end type
type ddlb_op from dropdownlistbox within w_ocaroi_duzon_r
end type
end forward

global type w_ocaroi_duzon_r from w_inheritance
integer width = 4361
integer height = 2396
string title = "수금전표 만들기(더존용)(w_ocaroi_duzon_r)"
boolean center = true
em_1 em_1
st_1 st_1
st_3 st_3
ddlb_1 ddlb_1
cbx_2 cbx_2
cb_export cb_export
hpb_1 hpb_1
cb_trans cb_trans
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_6 st_6
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
st_horizontal st_horizontal
st_2 st_2
dw_3 dw_3
dw_4 dw_4
cbx_1 cbx_1
st_7 st_7
em_num em_num
st_8 st_8
em_buseo em_buseo
ddlb_op ddlb_op
end type
global w_ocaroi_duzon_r w_ocaroi_duzon_r

type variables
DataWindowChild idwc_user
string is_dw, xlsFile

end variables

forward prototypes
public subroutine wf_multi_select (datawindow a_dw, long al_row)
public subroutine wf_insert_dw1 ()
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

public subroutine wf_insert_dw1 ();//
end subroutine

on w_ocaroi_duzon_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.cbx_2=create cbx_2
this.cb_export=create cb_export
this.hpb_1=create hpb_1
this.cb_trans=create cb_trans
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_6=create st_6
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.st_horizontal=create st_horizontal
this.st_2=create st_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cbx_1=create cbx_1
this.st_7=create st_7
this.em_num=create em_num
this.st_8=create st_8
this.em_buseo=create em_buseo
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.cb_export
this.Control[iCurrent+7]=this.hpb_1
this.Control[iCurrent+8]=this.cb_trans
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.ddlb_dwtitles
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.sle_value
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_4
this.Control[iCurrent+16]=this.cb_5
this.Control[iCurrent+17]=this.cb_6
this.Control[iCurrent+18]=this.st_horizontal
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.dw_3
this.Control[iCurrent+21]=this.dw_4
this.Control[iCurrent+22]=this.cbx_1
this.Control[iCurrent+23]=this.st_7
this.Control[iCurrent+24]=this.em_num
this.Control[iCurrent+25]=this.st_8
this.Control[iCurrent+26]=this.em_buseo
this.Control[iCurrent+27]=this.ddlb_op
end on

on w_ocaroi_duzon_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.cbx_2)
destroy(this.cb_export)
destroy(this.hpb_1)
destroy(this.cb_trans)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_6)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.st_horizontal)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cbx_1)
destroy(this.st_7)
destroy(this.em_num)
destroy(this.st_8)
destroy(this.em_buseo)
destroy(this.ddlb_op)
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
dw_4.SetTransObject(SQLCA)

dw_3.visible = false ; dw_3.width = 2112
dw_4.visible = false ; dw_4.width = 2700

cb_trans.enabled  = false	// 수금전표_이관작업
cb_export.enabled = false	// 회계(더존) 자동전표 만들기

if GF_Permission('수금전표_만들기(더존용)', gs_userid) = 'Y' then
else
	pb_print.enabled = false
end if

//
em_1.text = string(today(),'yyyy/mm/dd')

ddlb_1.text   = "전체"
hpb_1.position = 0
hpb_1.visible = false

////////////////////////////////////////////////////////////////////////////////////////////////
string ls_getdate
long   ll_max_insq

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
if isnull(ll_max_insq) then em_num.text = "1000"

if em_num.text < "1000" then
	ll_max_insq = 1000
	em_num.text = string(ll_max_insq)
end if

DISCONNECT USING SQLCA2; 
DESTROY SQLCA2 				// 사용이 끝났으면 DESTROY를 해줄 것. 
////////////////////////////////////////////////////////////////////////////////////////////////



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

type pb_save from w_inheritance`pb_save within w_ocaroi_duzon_r
boolean visible = false
integer taborder = 80
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroi_duzon_r
integer x = 32
integer y = 440
integer width = 4247
integer height = 952
integer taborder = 60
string dataobject = "d_glaroivc_s"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string  ls_icubeno
long    ll_find, ll_amount

if dw_2.rowcount() > 0 then
	ls_icubeno = dw_1.object.icube_no[row]
	ll_amount  = dw_1.object.amount[row]
	ll_find    = dw_2.find( "tr_cd = '"+ls_icubeno+"' AND acct_am = "+string(ll_amount)+"", 1, dw_2.rowcount() )
	if ll_find > 0 then
		dw_2.ScrollToRow( ll_find )
	end if
end if

string  ls_chk, ls_rcpt_type
choose case dwo.name
	case "chk"
		dw_1.accepttext()
		ls_chk = dw_1.object.chk[row]
		
		if ls_chk = "N" then
			if row <> dw_1.rowcount() then
				ls_rcpt_type = dw_1.object.rcpt_type[row + 1]
				choose case ls_rcpt_type
					case "04.잡손실", "05.잡이익"
						dw_1.object.chk[row + 1] = "Y"
				end choose
			end if
		end if
end choose		
end event

event dw_1::doubleclicked;call super::doubleclicked;//
string  ls_custno, ls_username

if isnull(row) OR row < 1 then RETURN

choose case dwo.name
	case "icube_no", "cust_no", "cust_name"
		dw_4.visible = true
		
		dw_4.x  = (Parent.width  - dw_4.width)  / 2
		dw_4.y  = (Parent.height - dw_4.height) / 2
		
		ls_custno  = this.object.cust_no[row]
		dw_4.retrieve( ls_custno )
		
	case else
		dw_3.visible = true
		
		dw_3.x  = (Parent.width  - dw_3.width)  / 2
		dw_3.y  = (Parent.height - dw_3.height) / 2

		ls_username  = this.object.user_name1[row]
		dw_3.retrieve( ls_username )
end choose

end event

type st_title from w_inheritance`st_title within w_ocaroi_duzon_r
integer y = 20
integer width = 1541
integer height = 132
string text = "수금전표 만들기(더존용)"
end type

type st_tips from w_inheritance`st_tips within w_ocaroi_duzon_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroi_duzon_r
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocaroi_duzon_r
boolean visible = false
integer taborder = 70
end type

type pb_close from w_inheritance`pb_close within w_ocaroi_duzon_r
integer x = 3712
integer y = 64
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroi_duzon_r
integer x = 3520
integer y = 64
integer taborder = 40
string picturename = "CrossTab!"
end type

event pb_print::clicked;//
string  ls_Docname, ls_Named, ls_ExpandName
integer li_value, li_Pos
long    ll_row

if dw_1.rowcount() < 1 then RETURN

if MessageBox("확인","자동전표(더존)를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 2 then RETURN

if dw_2.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	RETURN
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//===============================================================//
li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS")
li_Pos   = PosA(ls_Named, ".")
ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
//===============================================================//
if li_Value <> 1 then RETURN

dw_2.Modify("compute_1.width=0")
dw_2.Modify("DataWindow.Footer.Height=0")

if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
	dw_2.SaveAsAscII(ls_DocName)

	dw_2.Modify("compute_1.width=160")
	dw_2.Modify("DataWindow.Footer.Height=144")
	MessageBox("확인","엑셀파일 작업완료.")
end if
RETURN

//
if MessageBox("확인","회계 자동전표(더존)를 표준서식으로 만들겠습니까?~n~n" + &
				  "표준서식은 시간이 많이 소요됩니다.", Exclamation!, YesNo!, 2) = 2 then
	if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
		dw_2.SaveAsAscII(ls_DocName)
		dw_2.Modify("DataWindow.Footer.Height=144")
		MessageBox("확인","엑셀파일 작업완료.")
		RETURN
	end if
end if				  

//				  
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
for ly = 1 to dw_2.rowcount()
	hpb_1.position = (ly / dw_2.rowcount()) * 100
	
	OleExcel.Worksheets(1).Cells(ly,  1).Value = dw_2.object.in_dt[ly]
	OleExcel.Worksheets(1).Cells(ly,  2).Value = dw_2.object.co_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  3).Value = dw_2.object.div_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  4).Value = dw_2.object.dept_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  5).Value = dw_2.object.isu_dt[ly]
	OleExcel.Worksheets(1).Cells(ly,  6).Value = dw_2.object.in_sq[ly]
	OleExcel.Worksheets(1).Cells(ly,  7).Value = dw_2.object.ln_sq[ly]
	OleExcel.Worksheets(1).Cells(ly,  8).Value = dw_2.object.acct_cd[ly]
	OleExcel.Worksheets(1).Cells(ly,  9).Value = dw_2.object.drcr_fg[ly]
	OleExcel.Worksheets(1).Cells(ly, 10).Value = dw_2.object.rmk_dc[ly]
	OleExcel.Worksheets(1).Cells(ly, 11).Value = dw_2.object.acct_am[ly]
	OleExcel.Worksheets(1).Cells(ly, 12).Value = dw_2.object.tr_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 13).Value = dw_2.object.ct_dept[ly]
	OleExcel.Worksheets(1).Cells(ly, 14).Value = dw_2.object.pjt_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 15).Value = dw_2.object.ct_nb[ly]
	OleExcel.Worksheets(1).Cells(ly, 16).Value = dw_2.object.fr_dt[ly]
	OleExcel.Worksheets(1).Cells(ly, 17).Value = dw_2.object.to_dt[ly]
	OleExcel.Worksheets(1).Cells(ly, 18).Value = dw_2.object.ct_qt[ly]
	OleExcel.Worksheets(1).Cells(ly, 19).Value = dw_2.object.ct_am[ly]
	OleExcel.Worksheets(1).Cells(ly, 20).Value = dw_2.object.ct_rt[ly]
	OleExcel.Worksheets(1).Cells(ly, 21).Value = dw_2.object.ct_deal[ly]
	OleExcel.Worksheets(1).Cells(ly, 22).Value = dw_2.object.ct_user1[ly]
	OleExcel.Worksheets(1).Cells(ly, 23).Value = dw_2.object.ct_user2[ly]
	OleExcel.Worksheets(1).Cells(ly, 24).Value = dw_2.object.attr_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 25).Value = dw_2.object.isu_doc[ly]
	OleExcel.Worksheets(1).Cells(ly, 26).Value = dw_2.object.logic_cd[ly]
	OleExcel.Worksheets(1).Cells(ly, 27).Value = dw_2.object.dummy1[ly]
	OleExcel.Worksheets(1).Cells(ly, 28).Value = dw_2.object.dummy2[ly]
	OleExcel.Worksheets(1).Cells(ly, 29).Value = dw_2.object.jeonja_yn[ly]
	OleExcel.Worksheets(1).Cells(ly, 30).Value = dw_2.object.user_name[ly]
	OleExcel.Worksheets(1).Cells(ly, 31).Value = dw_2.object.dept_name[ly]
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

dw_2.Modify("DataWindow.Footer.Height=144")

if GF_Permission( "수금전표_이관작업", gs_userid ) = "Y" then	
	cb_trans.triggerevent( clicked! )
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

type pb_cancel from w_inheritance`pb_cancel within w_ocaroi_duzon_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroi_duzon_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroi_duzon_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroi_duzon_r
integer x = 3328
integer y = 64
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
end type

event pb_retrieve::clicked;//
string ls_date, ls_area, ls_openclose, ls_rcpt_type, ls_icubeno
date   ld_sdate, ld_edate
long   ll_row, ll_find

dw_1.reset()
dw_2.reset()

cbx_2.checked = false	// 전체선택

if em_1.text = "" then
	MessageBox("확인","해당 년월을 입력하세요!",information!)
	em_1.setfocus()
	RETURN
end if

ld_sdate = date(em_1.text)
ld_edate = date(em_1.text)

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

if cbx_1.checked = true then	// 회계이관 자료
	ls_openclose = "T"
else
	ls_openclose = "O"
end if

////////////////////////////////////////////////////////////////////////////////////
// KeySort 만들기
////////////////////////////////////////////////////////////////////////////////////
dw_1.retrieve( "%", ld_sdate, ld_edate, "%" )

//for ll_row = 1 to dw_1.rowcount()
//	dw_1.object.keysort[ll_row]  = dw_1.object.compute_1[ll_row] * 10
//next
////
//for ll_row = 2 to dw_1.rowcount()
//	ls_rcpt_type = dw_1.object.rcpt_type[ll_row]
//	
//	choose case ls_rcpt_type
//		case "04.잡손실", "05.잡이익"
//			ls_icubeno = dw_1.object.icube_no[ll_row]
//			
//			ll_find = dw_1.find( "icube_no = '"+ ls_icubeno +"'", 1, ll_row - 1 )
//			if ll_find > 0 then
//				dw_1.object.keysort[ll_row]  = (ll_find * 10) + 1
//			end if
//	end choose
//next

//dw_1.SetSort( "keysort A" )
//dw_1.Sort()

//dw_1.SetSort( "oi_date D, vc_no A, cust_name A" )
//dw_1.Sort()

cb_5.enabled = false
cb_6.enabled = false
////////////////////////////////////////////////////////////////////////////////////

if dw_1.rowcount() > 0 then
	cb_export.enabled = true
	MessageBox("확인","작업대상을 선택한 후 '자동전표 만들기'를 클릭 하시기 바랍니다.",information!)
else
	MessageBox("확인","해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================


end event

type gb_3 from w_inheritance`gb_3 within w_ocaroi_duzon_r
integer x = 1637
integer y = 16
integer width = 1627
integer height = 216
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroi_duzon_r
integer y = 256
integer width = 4247
integer height = 168
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroi_duzon_r
integer x = 3287
integer y = 16
integer width = 645
integer height = 216
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroi_duzon_r
integer x = 32
integer y = 1444
integer width = 4247
integer height = 812
integer taborder = 0
string dataobject = "d_duzon_excel_r1"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string  ls_icubeno
long    ll_find, ll_amount

ls_icubeno = dw_2.object.tr_cd[row]
ll_amount  = dw_2.object.acct_am[row]
ll_find    = dw_1.find( "icube_no = '"+ls_icubeno+"' AND amount = "+string(ll_amount)+"", 1, dw_1.rowcount() )
if ll_find > 0 then
	dw_1.ScrollToRow( ll_find )
end if

end event

type em_1 from editmask within w_ocaroi_duzon_r
integer x = 1966
integer y = 56
integer width = 384
integer height = 76
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
string displaydata = "T"
end type

event rbuttondown;//
OpenWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ocaroi_duzon_r
integer x = 1664
integer y = 56
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "수금일자"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ocaroi_duzon_r
integer x = 37
integer y = 180
integer width = 763
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
string text = "수금전표_만들기(더존용)"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_ocaroi_duzon_r
integer x = 1966
integer y = 132
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

type cbx_2 from checkbox within w_ocaroi_duzon_r
integer x = 82
integer y = 256
integer width = 215
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
string ls_rcpt_type
long   ll_row, ll_cnt

if dw_1.rowcount() < 1 then RETURN

for ll_row =  1 to dw_1.rowcount()
	if this.checked = true then
		dw_1.object.chk[ll_row] = "Y"
	else
		dw_1.object.chk[ll_row] = "N"
	end if
next

end event

type cb_export from commandbutton within w_ocaroi_duzon_r
integer x = 3008
integer y = 296
integer width = 1175
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "회계(더존) 자동전표 만들기"
end type

event clicked;//
string  ls_getdate, ls_esero, ls_partno, ls_teamname, ls_acctdate, ls_rcpt_type, ls_vc_type2
string  ls_desc, ls_cheque_no, ls_icubeno, ls_bankname, ls_banknm_save, ls_branch, ls_branch_save
string  ls_cheque_end, ls_branch_code
long	  ll_row, ll_row_save, ll_tchk, lY, lX, ll_dw2row, ll_find, ll_slipno, ll_slipseq, ll_max_insq
long    ll_amount, ll_amt, ll_pos1, ll_pos2
boolean lb_10301

if dw_1.rowcount() < 1 then
	MessageBox("확인","수금 데이터가 존재하지 않습니다.")
	RETURN
end if

ll_tchk  = dw_1.object.tchk[1]
if ll_tchk < 1 then
	MessageBox("확인","작업할 대상을 선택하시기 바랍니다.")
	RETURN
end if

//
SELECT top 1 replace(convert(char(10),getdate(),111),'/','') INTO :ls_getdate FROM login;

ls_banknm_save = "" ; ls_branch_save = ""
ll_amount     = 0    					// 금액
ll_slipno     = long(em_num.text)  	// 미결 시작번호 
ll_slipseq    = 0							// 라인번호
hpb_1.visible = true

//
dw_2.reset()
dw_2.setredraw( false )

//////////////////////////////////////////////////////////////////////////////////////////////
// 예금 차변계정 만들기
//////////////////////////////////////////////////////////////////////////////////////////////
//  when 'A' then '01.예금'     when 'C' then '02.현금'     when 'B' then '03.어음'     
//  when 'D' then '04.잡손실'   when 'E' then '05.잡이익'
//  when 'F' then '06.하자보수' when 'S' then '07.상계'     
//  when 'G' then '08.대손상각' when 'P' then '09.처리어음' when 'Z' then '10.기타'                             
//  when 'R' then '11.대손이익' when 'M' then '12.대손예금' when 'N' then '13.대손어음'
//////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////
for lY = 1 to dw_1.rowcount()
	hpb_1.position = (lY / dw_1.rowcount()) * 100
	if dw_1.object.chk[lY] = "N" then CONTINUE
	
	// 물품대입금
	ls_rcpt_type   = dw_1.object.rcpt_type[lY]				// 수금유형
	ls_bankname    = dw_1.object.bank_name[lY]				// 은행명
	ls_branch      = dw_1.object.branch[lY]					// 지점

	choose case ls_rcpt_type
		case "01.예금"
			if ls_banknm_save <> ls_bankname OR ls_branch_save <> ls_branch then
				ll_amount    = 0
				
				ll_slipno    = ll_slipno + 1
				ll_slipseq   = 0
				ls_banknm_save = ls_bankname
				ls_branch_save = ls_branch

				ll_slipseq   = ll_slipseq + 1			// 라인번호
				ls_partno    = "1000"	                             					// 사업장 구분
				ls_teamname  = string(em_buseo.text)                              // 부서명(영업지원팀)
				ls_acctdate  = string(dw_1.object.oi_date[1],"yyyymmdd")  			// 계산서일자
			
				ll_dw2row    = dw_2.insertrow(0)
				ll_row_save  = ll_dw2row
				
				dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
				dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
				dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
				dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'     ==영업사원의 부서명            
				dw_2.object.isu_dt[ll_dw2row]    = ls_getdate  						   // '결의일자'               
				dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
				dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
				dw_2.object.acct_cd[ll_dw2row]   = "10301"      						// '계정과목(외상매입금)'               
				dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
				dw_2.object.rmk_dc[ll_dw2row]    = "물품대 입금"  						// '적요'                   
				
				dw_2.object.acct_am[ll_dw2row]   = 0                      // '금액'                   
				
				// "반월(2000002)" -> "2000002"
				ls_branch_code   = dw_1.object.branch[1]
				ll_pos1  = PosA(ls_branch_code,"(")
				if ll_pos1 > 0 then
					ll_pos1 = ll_pos1 + 1
					ll_pos2  = PosA(ls_branch_code,")")					
					if ll_pos2 > 0 then
						ls_branch_code = MidA(ls_branch_code, ll_pos1, ll_pos2 - ll_pos1)
					end if
				end if
				
				dw_2.object.tr_cd[ll_dw2row]     = ls_branch_code                 // '관리항목'               
				dw_2.object.ct_dept[ll_dw2row]   = ""                             // 'C관리'
				dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
				dw_2.object.ct_nb[ll_dw2row]     = ""										// 'E관리'
				dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
				dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
				dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
				dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
				dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
				dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
				dw_2.object.ct_user1[ll_dw2row]  = ""                             // '사용자정의1'            
				dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
				dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
				dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
				dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형(11:일반,21:매입,31:매출,41:수금,51:반제)'               
				dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
				dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
				dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
				dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
				dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
				dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
				dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
				dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
				dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
				dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
				
				dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
				dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'
			end if			
			ll_amount       = ll_amount + dw_1.object.amount[lY]  
			dw_2.object.acct_am[ll_row_save] = ll_amount         	// '금액'                   
			
			// 외상매출금 추가
			ll_slipseq   = ll_slipseq + 1			// 라인번호
			
			ls_partno    = "1000"															// 사업장 구분
			ls_teamname  = string(em_buseo.text)   									// 부서명(영업지원팀)
			ls_acctdate  = string(dw_1.object.oi_date[lY],"yyyymmdd")  			// 계산서일자

			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'        ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
			dw_2.object.acct_cd[ll_dw2row]   = "10801"  	   						// '계정과목(외상매출금)'               
			dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
			dw_2.object.rmk_dc[ll_dw2row]    = "물품대 입금"  						// '적요'                   
			
			if lY = dw_1.rowcount() then
				dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY]  		// '금액'
			else
				choose case dw_1.object.rcpt_type[lY+1]
					case "04.잡손실", "05.잡이익"
						dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY] + dw_1.object.amount[lY+1]
					case else
						dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY]  // '금액'
				end choose
			end if	
		
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]  		// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""                             // 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
			dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
			dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
			dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
			dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row] = ""										// '사원명'     
			dw_2.object.dept_name[ll_dw2row] = ""										// '부서명'     							

		case "03.어음"	// 물품대입금(전자어음)
			if ls_banknm_save <> ls_bankname OR ls_branch_save <> ls_branch then
				ll_slipno    = ll_slipno + 1
				ll_slipseq   = 0
				ls_banknm_save = ls_bankname
				ls_branch_save = ls_branch
			end if

			ll_slipseq   = ll_slipseq + 1			// 라인번호
			ls_partno    = "1000"	                                          // 사업장 구분
			ls_teamname  = string(em_buseo.text)                              // 부서명(영업지원팀)
			ls_acctdate  = string(dw_1.object.oi_date[lY],"yyyymmdd")  			// 계산서일자

			ls_bankname   = dw_1.object.bank_name[lY]
			ls_branch     = dw_1.object.branch[lY]
			ls_cheque_end = string(dw_1.object.cheque_end[lY],"yyyymmdd")
			ls_cheque_no  = dw_1.object.cheque_no[lY]				// 어음번호

			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'     ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'
			
			if LeftA(ls_cheque_no,1) = "A" then
				dw_2.object.acct_cd[ll_dw2row]   = "11002"      					// '계정과목[받을어음(전자)]'               
				ls_desc   = "물품대 입금("+ls_bankname+","+ls_branch+" 전자어음 "+ls_cheque_end+" #"+ls_cheque_no+")"
			elseif LeftA(ls_cheque_no,1) = "B" then
				dw_2.object.acct_cd[ll_dw2row]   = "11003"      					// '계정과목[받을어음(BtoB)]'               
				ls_desc   = "물품대 입금("+ls_bankname+","+ls_branch+" 전자어음 "+ls_cheque_end+" #"+ls_cheque_no+")"
			else
				dw_2.object.acct_cd[ll_dw2row]   = "11001"      					// '계정과목[받을어음(종이)]'               
				ls_desc   = "물품대 입금("+ls_bankname+","+ls_branch+" 어음 "+ls_cheque_end+" #"+ls_cheque_no+")"
			end if
		
			dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'   			
			dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
			
			dw_2.object.acct_am[ll_dw2row]   = dw_1.object.amount[lY]  			// '금액'                   
			
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]  		// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  

			choose case dw_2.object.acct_cd[ll_dw2row]
				case "11002", "11003"
					dw_2.object.ct_nb[ll_dw2row]     = "#"+RightA(ls_cheque_no,LenA(ls_cheque_no) - 1)    // 'E관리'                  
				case else
					dw_2.object.ct_nb[ll_dw2row]     = "#"+ls_cheque_no                                 // 'E관리'                  
			end choose
			dw_2.object.fr_dt[ll_dw2row]     = string(dw_1.object.cheque_start[lY],"yyyymmdd")  // 'F관리'                  
			dw_2.object.to_dt[ll_dw2row]     = string(dw_1.object.cheque_end[lY],"yyyymmdd")    // '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = "1"  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ls_bankname + " " + ls_branch // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = dw_1.object.large[lY]         // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = dw_1.object.icube_no[lY]      // 배서인

			choose case dw_2.object.acct_cd[ll_dw2row]
				case "11002", "11003"
					dw_2.object.bill_fg1[ll_dw2row] = "4"                       // 어음종류
				case else
					dw_2.object.bill_fg1[ll_dw2row] = "3"                       // 어음종류
			end choose
			if dw_1.object.vc_type2[lY] = "02" then ls_vc_type2 = "1"	// 타수->1	
			if dw_1.object.vc_type2[lY] = "01" then ls_vc_type2 = "2"	// 자수->2
			dw_2.object.bill_fg2[ll_dw2row]   = ls_vc_type2                   // 수취구분
			
			dw_2.object.deal_fg[ll_dw2row]    = "1"                           // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row]  = ""                            // '사원명'     
			dw_2.object.dept_name[ll_dw2row]  = ""                            // '부서명'     
	
			// 외상매출금 추가
			ll_slipseq   = ll_slipseq + 1			// 라인번호

			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'        ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
			dw_2.object.acct_cd[ll_dw2row]   = "10801"  	   						// '계정과목(외상매출금)'               
			dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
			ls_desc = "물품대 입금("+ls_bankname+","+ls_branch+" 전자어음 "+ls_cheque_end+" #"
			choose case dw_2.object.acct_cd[ll_dw2row]
				case "11002", "11003"
					ls_desc = ls_desc + RightA(ls_cheque_no,LenA(ls_cheque_no) - 1)+")"
				case else
					ls_desc = ls_desc + ls_cheque_no + ")"
			end choose
			dw_2.object.rmk_dc[ll_dw2row]    = ls_desc                        // '적요'                   
			
			if lY = dw_1.rowcount() then
				dw_2.object.acct_am[ll_dw2row]   = dw_1.object.amount[lY]  		// '금액'                   
			else
				if dw_1.object.rcpt_type[lY + 1] = "04.잡손실" then
					dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY] + dw_1.object.amount[lY + 1]
				else
					dw_2.object.acct_am[ll_dw2row]   = dw_1.object.amount[lY]  	// '금액'                   
				end if
			end if
			
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]  		// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
			dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
			dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
			dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
			dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
			dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							

		case "04.잡손실", "05.잡이익"
			ll_slipseq   = ll_slipseq + 1			// 라인번호
			ls_partno    = "1000"	                                          // 사업장 구분
			ls_teamname  = string(em_buseo.text)                              // 부서명(영업지원팀)
			ls_acctdate  = string(dw_1.object.oi_date[lY],"yyyymmdd")  			// 계산서일자

			ls_cheque_no = dw_1.object.cheque_no[lY]				// 어음번호

			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'     ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'
			
			if ls_rcpt_type = "04.잡손실" then
				dw_2.object.acct_cd[ll_dw2row] = "96000"      						// '계정과목[잡손실]'               
				dw_2.object.drcr_fg[ll_dw2row] = "차변"  								// '차대구분'               
				dw_2.object.rmk_dc[ll_dw2row]  = "물품대 DC"  						// '적요'                   
				dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY]  		// '금액'                   
			else
				dw_2.object.acct_cd[ll_dw2row] = "93000"      						// '계정과목[잡이익]'               
				dw_2.object.drcr_fg[ll_dw2row] = "대변"  								// '차대구분'               
				dw_2.object.rmk_dc[ll_dw2row]  = "물품대 잡이익"					// '적요'                   
				dw_2.object.acct_am[ll_dw2row] = dw_1.object.amount[lY] * -1	// '금액'                   
			end if
					
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]  		// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
			dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
			dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
			dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
			dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
			dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	

		case "07.상계"
			if ls_banknm_save <> ls_bankname OR ls_branch_save <> ls_branch then
				ll_slipno    = ll_slipno + 1
				ll_slipseq   = 0
				ls_banknm_save = ls_bankname
				ls_branch_save   = ls_branch
			end if

			ls_partno    = "1000"	                                          // 사업장 구분
			ls_teamname  = string(em_buseo.text)                              // 부서명(영업지원팀)
			ls_acctdate  = string(dw_1.object.oi_date[lY],"yyyymmdd")  			// 계산서일자

			// 외상매출금 추가
			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'        ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
			dw_2.object.acct_cd[ll_dw2row]   = "10801"  	   						// '계정과목(외상매출금)'               
			dw_2.object.drcr_fg[ll_dw2row]   = "대변"  								// '차대구분'               
			dw_2.object.rmk_dc[ll_dw2row]    = "외상매출금과 상계"  				// '적요'                   
			dw_2.object.acct_am[ll_dw2row]   = dw_1.object.amount[lY]  			// '금액'                   
			
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]  		// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'
			dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
			dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
			dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
			dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
			dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     							

			// 외상매입금
			ll_slipseq   = ll_slipseq + 1			// 라인번호

			ll_dw2row = dw_2.insertrow(0)
			dw_2.object.in_dt[ll_dw2row]     = ls_getdate   						// '처리일자'               
			dw_2.object.co_cd[ll_dw2row]     = "1000"       						// '회사코드'               
			dw_2.object.div_cd[ll_dw2row]    = ls_partno    						// '사업장코드'             
			dw_2.object.dept_cd[ll_dw2row]   = ls_teamname  						// '부서코드'     ==영업사원의 부서명            
			dw_2.object.isu_dt[ll_dw2row]    = ls_getdate   						// '결의일자'               
			dw_2.object.in_sq[ll_dw2row]     = string(ll_slipno)  				// '자동전표번호'           
			dw_2.object.ln_sq[ll_dw2row]     = string(ll_slipseq)					// '라인번호'               
			dw_2.object.acct_cd[ll_dw2row]   = "25100"      						// '계정과목(외상매입금)'               
			dw_2.object.drcr_fg[ll_dw2row]   = "차변"  								// '차대구분'               
			dw_2.object.rmk_dc[ll_dw2row]    = "외상매출금과 상계"  				// '적요'                   
			dw_2.object.acct_am[ll_dw2row]   = dw_1.object.amount[lY]  			// '금액'                   
			
			dw_2.object.tr_cd[ll_dw2row]     = dw_1.object.icube_no[lY]    	// '관리항목'               
			dw_2.object.ct_dept[ll_dw2row]   = dw_1.object.team_name[lY]    	// 'C관리' =영업사원                  
			dw_2.object.pjt_cd[ll_dw2row]    = ""  									// 'D관리'                  
			dw_2.object.ct_nb[ll_dw2row]     = ""  									// 'E관리'                  
			dw_2.object.fr_dt[ll_dw2row]     = ""  									// 'F관리'                  
			dw_2.object.to_dt[ll_dw2row]     = ""  									// '만기일'                 
			dw_2.object.ct_qt[ll_dw2row]     = 0   									// 'H관리'                  
			dw_2.object.ct_am[ll_dw2row]     = 0   									// 'I관리'                  
			dw_2.object.ct_rt[ll_dw2row]     = 0   									// 'J관리'                  
			dw_2.object.ct_deal[ll_dw2row]   = ""  									// 'K관리'                  
			dw_2.object.ct_user1[ll_dw2row]  = dw_1.object.user_name[lY]  		// '사용자정의1'            
			dw_2.object.ct_user2[ll_dw2row]  = ""  									// '사용자정의2'            
			dw_2.object.attr_cd[ll_dw2row]   = ""  									// '증빙코드'               
			dw_2.object.isu_doc[ll_dw2row]   = "물품대 입금"						// '품의내역'               
			dw_2.object.logic_cd[ll_dw2row]  = "41"  									// '전표유형'               
			dw_2.object.dummy1[ll_dw2row]    = ""  									// '환종'                   
			dw_2.object.dummy2[ll_dw2row]    = ""  									// '외화금액'               
			dw_2.object.jeonja_yn[ll_dw2row] = ""  									// '전자세금계산서여부'     
				
			dw_2.object.payment_pt[ll_dw2row] = ""                            // 지급장소
			dw_2.object.isu_nm[ll_dw2row]     = ""                            // 발행인
			dw_2.object.endors_nm[ll_dw2row]  = ""                            // 배서인
			dw_2.object.bill_fg1[ll_dw2row]   = ""                            // 어음종류
			dw_2.object.bill_fg2[ll_dw2row]   = ""                            // 수취구분
			dw_2.object.deal_fg[ll_dw2row]    = ""                            // 보관구분
			dw_2.object.rmk_nb[ll_dw2row]     = ""                            // 적요번호
			
			dw_2.object.user_name[ll_dw2row] = ""                             // '사원명'     
			dw_2.object.dept_name[ll_dw2row] = ""                             // '부서명'     	
	end choose
next

hpb_1.visible = false
dw_2.setredraw( true )

if GF_Permission( "수금전표_이관작업", gs_userid ) = "Y" then	
	cb_trans.enabled = true
end if

end event

type hpb_1 from hprogressbar within w_ocaroi_duzon_r
integer x = 3090
integer y = 316
integer width = 1006
integer height = 72
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_trans from commandbutton within w_ocaroi_duzon_r
integer x = 2711
integer y = 64
integer width = 521
integer height = 144
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "수금이관 작업"
end type

event clicked;//////////////////////////////////////////////////////
// 수금 이관작업 표시
//////////////////////////////////////////////////////
string ls_weekday, ls_sdate, ls_edate, ls_time, ls_errtext
date   ld_sdate, ld_edate
long   ll_row

if dw_1.rowcount() < 1 then RETURN

if GF_Permission( "수금전표_이관작업", gs_userid ) = "Y" then	
	ls_sdate  = GF_ReplaceAll(em_1.text,"/","") + "01"
	SELECT top 1 dbo.UF_GetLastDay( :ls_sdate ) INTO :ls_edate FROM login;
	
	ld_sdate  = date(em_1.text + "/01")
	ld_edate  = date( ls_edate )
	
//	UPDATE aroivc
//		SET open_close = 'T'
//	 WHERE oi_date between :ld_sdate and :ld_edate;
//	if SQLCA.SQLCode = 0 then
//		COMMIT;
//	else
//		ls_errtext = SQLCA.SQLErrText
//		ROLLBACK;
//		MessageBox("확인","DB ERROR가 발생하였습니다.~n~n" + ls_errtext)						
//	end if

	MessageBox("확인","수금전표_이관작업 완료")
end if

end event

type st_4 from statictext within w_ocaroi_duzon_r
integer x = 87
integer y = 328
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

type ddlb_fld from dropdownlistbox within w_ocaroi_duzon_r
integer x = 274
integer y = 312
integer width = 443
integer height = 632
integer taborder = 120
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

type ddlb_dwtitles from dropdownlistbox within w_ocaroi_duzon_r
integer x = 306
integer y = 324
integer width = 311
integer height = 88
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

type st_6 from statictext within w_ocaroi_duzon_r
integer x = 745
integer y = 328
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

type sle_value from singlelineedit within w_ocaroi_duzon_r
integer x = 1234
integer y = 316
integer width = 526
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_ocaroi_duzon_r
integer x = 1769
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
string text = "필터"
end type

event clicked;//
datawindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_ocaroi_duzon_r
integer x = 1934
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
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_ocaroi_duzon_r
integer x = 2098
integer y = 316
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
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_ocaroi_duzon_r
integer x = 2263
integer y = 316
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
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
		RETURN
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_horizontal from u_splitbar_horizontal within w_ocaroi_duzon_r
integer x = 32
integer y = 1408
integer width = 4247
boolean bringtotop = true
end type

type st_2 from statictext within w_ocaroi_duzon_r
integer x = 1664
integer y = 132
integer width = 297
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_ocaroi_duzon_r
integer x = 2281
integer y = 804
integer width = 1467
integer height = 820
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "회계부서 수정"
string dataobject = "d_duzon_sabun_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

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

event doubleclicked;//

end event

type dw_4 from datawindow within w_ocaroi_duzon_r
integer x = 814
integer y = 804
integer width = 1367
integer height = 820
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "회계 거래처 수정"
string dataobject = "d_duzon_custno_r"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//
string ls_custno, ls_icubeno, ls_duzon_dept

choose case dwo.name
	case "b_1"		
		this.accepttext()
		
		ls_icubeno = this.object.icube_no[row]
		
		ls_custno = this.object.cust_no[row]
		if isnull(ls_custno) OR ls_custno = "" then RETURN
		
		UPDATE customer SET icube_no = :ls_icubeno WHERE cust_no = :ls_custno;
		
		//
		this.visible = false
		pb_retrieve.TriggerEvent( clicked! )
end choose

end event

type cbx_1 from checkbox within w_ocaroi_duzon_r
integer x = 969
integer y = 180
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "회계이관 자료열람"
end type

type st_7 from statictext within w_ocaroi_duzon_r
integer x = 2427
integer y = 320
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

type em_num from editmask within w_ocaroi_duzon_r
integer x = 2743
integer y = 316
integer width = 219
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "1000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_8 from statictext within w_ocaroi_duzon_r
integer x = 2427
integer y = 244
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

type em_buseo from editmask within w_ocaroi_duzon_r
integer x = 2743
integer y = 236
integer width = 219
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 28310782
string text = "3113"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type ddlb_op from dropdownlistbox within w_ocaroi_duzon_r
integer x = 919
integer y = 308
integer width = 302
integer height = 500
integer taborder = 120
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

