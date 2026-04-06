$PBExportHeader$w_ippurchase_unit_m.srw
$PBExportComments$구매입고시계열관리(2020/02/24, 조원석)
forward
global type w_ippurchase_unit_m from w_inheritance
end type
type st_3 from statictext within w_ippurchase_unit_m
end type
type ddlb_fld from dropdownlistbox within w_ippurchase_unit_m
end type
type ddlb_dwtitles from dropdownlistbox within w_ippurchase_unit_m
end type
type st_4 from statictext within w_ippurchase_unit_m
end type
type sle_value from singlelineedit within w_ippurchase_unit_m
end type
type cb_1 from commandbutton within w_ippurchase_unit_m
end type
type cb_2 from commandbutton within w_ippurchase_unit_m
end type
type cb_3 from commandbutton within w_ippurchase_unit_m
end type
type cb_5 from commandbutton within w_ippurchase_unit_m
end type
type ddlb_op from dropdownlistbox within w_ippurchase_unit_m
end type
type tab_1 from tab within w_ippurchase_unit_m
end type
type tabpage_1 from userobject within tab_1
end type
type p_photo from picture within tabpage_1
end type
type tabpage_1 from userobject within tab_1
p_photo p_photo
end type
type tabpage_2 from userobject within tab_1
end type
type em_1 from editmask within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type pb_delete_row from picturebutton within tabpage_2
end type
type pb_insert_row from picturebutton within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type dw_5 from datawindow within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
em_1 em_1
st_1 st_1
pb_delete_row pb_delete_row
pb_insert_row pb_insert_row
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
end type
type tab_1 from tab within w_ippurchase_unit_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_2 from statictext within w_ippurchase_unit_m
end type
type st_5 from statictext within w_ippurchase_unit_m
end type
type em_3 from editmask within w_ippurchase_unit_m
end type
type em_2 from editmask within w_ippurchase_unit_m
end type
type rb_1 from radiobutton within w_ippurchase_unit_m
end type
type rb_2 from radiobutton within w_ippurchase_unit_m
end type
type rb_3 from radiobutton within w_ippurchase_unit_m
end type
type dw_7 from datawindow within w_ippurchase_unit_m
end type
end forward

global type w_ippurchase_unit_m from w_inheritance
integer width = 5833
integer height = 2772
string title = "구매자재 단가 현황(w_ippurchase_unit_m)"
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_op ddlb_op
tab_1 tab_1
st_2 st_2
st_5 st_5
em_3 em_3
em_2 em_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
dw_7 dw_7
end type
global w_ippurchase_unit_m w_ippurchase_unit_m

type variables
st_print  i_print
integer  i_tabpage
string    is_dw, is_purchase_code, is_purchase_name, is_yyyy
end variables

forward prototypes
public function integer wf_graph_create2 ()
public function integer wf_graph_create1 ()
public function integer wf_graph_create3 ()
end prototypes

public function integer wf_graph_create2 ();	string ls_purchase_name, ls_purchase_name1, ls_purchase_name2,  ls_yyyymm_name, ls_fr_date, ls_to_date, ls_yyyymm, ls_data
	decimal l_unit_amt1, l_unit_amt2,  l_unit_amt3, l_null
	
//	DECLARE purchase_cursor CURSOR FOR 
//	  select  a.yyyymm,
//					  sum(a.unit_00004_amt) unit_00001_amt,
//					  sum(a.unit_00006_amt) unit_00002_amt,
//					  sum(a.unit_00008_amt) unit_00003_amt					  
//	  from 
//	  (
//		  select purchase_name, 
//								substring(yyyymm,1,4)+'-'+substring(yyyymm,5,2) yyyymm,
//							  (case when purchase_code = '00004' then unit_amt else 0 end ) unit_00004_amt,
//						(case when purchase_code = '00006' then unit_amt else 0 end ) unit_00006_amt,
//						(case when purchase_code = '00008' then unit_amt else 0 end ) unit_00008_amt						
//			from dbo.purchase_unit
//			where use_yn = 'Y'	
//			and yyyymm between :ls_fr_date and :ls_to_date
//			and unit_amt is not null
//			and purchase_code in ('00004', '00006', '00008')
//	  ) a
//	  group by a.yyyymm;
  
	long ll_width, ll_height, li_rtn, l_row, ll_row1
	OLEObject myoleobject
	String  ls_classname = 'XLMAIN', ls_winname = 'Microsoft Excel'
	String  ls_path
	
//	open(w_icprocess)
	
	Destroy myoleobject	
	
	myoleobject = CREATE OLEObject
	li_rtn = myoleobject.ConnectToNewObject("excel.application")
	if li_rtn <> 0 THEN
	    MessageBox('엑셀오류','엑셀을 실행할 수 없습니다...')
	    Destroy myoleobject
	    Return 1
	end if
	
	ls_path= GetCurrentDirectory()
	
	myOleObject.Application.WorkBooks.Open( ls_path+"\excel.xlsx") // Sheet OPEN
	myOleObject.Application.Visible = false
	
	ls_fr_date = LeftA(em_2.text,4)+RightA(em_2.text,2)	
	ls_to_date = LeftA(em_3.text,4)+RightA(em_3.text,2)		
	
	l_row = dw_7.retrieve(ls_fr_date, ls_to_date)	
	l_row = l_row+1

	ls_data = dw_7.object.datawindow.data
	::clipboard(ls_data)	

	myoleobject.application.workbooks(1).Worksheets(1).Activate
	myoleobject.application.workbooks(1).Worksheets(1).range("A2:D" + string(l_row)).select
	myoleobject.application.workbooks(1).Worksheets(1).paste	
	
//	l_row = 1
//	setnull(l_null)
//
//	  select  count(*)
//	  into :ll_row1
//	  from
//	  (
//	  select distinct yyyymm
//		from dbo.purchase_unit
//		where use_yn = 'Y'	
//		and yyyymm between :ls_fr_date and :ls_to_date
//		and unit_amt is not null
//		and purchase_code in ('00004', '00006', '00008')
//	  ) a;		
//	
//	 OPEN purchase_cursor;
//	
//	 		FETCH purchase_cursor INTO :ls_yyyymm_name, :l_unit_amt1, :l_unit_amt2, :l_unit_amt3;
//			 
//				
//			Do While sqlca.sqlcode = 0	
//				
//				l_row = l_row + 1
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("A"+string(l_row)).VALUE = ls_yyyymm_name				
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("B"+string(l_row)).VALUE = l_unit_amt1					
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("C"+string(l_row)).VALUE = l_unit_amt2									
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("D"+string(l_row)).VALUE = l_unit_amt3				
//				
//				FETCH purchase_cursor INTO :ls_yyyymm_name, :l_unit_amt1, :l_unit_amt2, :l_unit_amt3;
//				
//				w_icprocess.hpb_1.position = (l_row / ll_row1) * 95				
//								
//			Loop
//	
//	
//	 CLOSE purchase_cursor;	
	 
	myoleobject.application.workbooks(1).Worksheets("Sheet3").ChartObjects(1).Chart.setSourcedata(myoleobject.application.workbooks(1).WorkSheets(1).Range("A2:D" + string(l_row) ))
	myoleobject.application.workbooks(1).Worksheets("Sheet3").ChartObjects(1).Chart.SeriesCollection(1).name = 'GI 0.45'	
	myoleobject.application.workbooks(1).Worksheets("Sheet3").ChartObjects(1).Chart.SeriesCollection(2).name = 'GI 0.75'
	myoleobject.application.workbooks(1).Worksheets("Sheet3").ChartObjects(1).Chart.SeriesCollection(3).name = 'GI 1.15'	
	
	myOleObject.Application.WorkBooks(1).Save()
	myoleobject.application.workbooks(1).Worksheets(3).ChartObjects(1).Chart.Export(ls_path+"\graph.jpg","jpg")
	myOleObject.Application.workbooks(1).close(false,false)
	myOleObject.Application.Quit
	myoleobject.DisConnectObject()
	Destroy myoleobject	
	
//	tab_1.tabpage_1.p_photo.PictureName = "C:\BMP\YC_150X150.jpg"
	tab_1.tabpage_1.p_photo.PictureName = ""
	tab_1.tabpage_1.p_photo.PictureName = ls_path+"\graph.jpg"	
	
//	close(w_icprocess)		
	
	return 1
	
end function

public function integer wf_graph_create1 ();	string ls_purchase_name, ls_purchase_name1, ls_purchase_name2,  ls_yyyymm_name, ls_fr_date, ls_to_date, ls_yyyymm, ls_data
	decimal l_unit_amt1, l_unit_amt2, l_null
	
	DECLARE purchase_cursor CURSOR FOR 
	  select  a.yyyymm,
					  sum(a.unit_00001_amt) unit_00001_amt,
					  sum(a.unit_00002_amt) unit_00002_amt
	  from 
	  (
		  select purchase_name, 
								substring(yyyymm,1,4)+'-'+substring(yyyymm,5,2) yyyymm,
							  (case when purchase_code = '00001' then unit_amt else 0 end ) unit_00001_amt,
						(case when purchase_code = '00002' then unit_amt else 0 end ) unit_00002_amt
			from dbo.purchase_unit
			where use_yn = 'Y'	
			and yyyymm between :ls_fr_date and :ls_to_date
			and unit_amt is not null
			and purchase_code in ('00001', '00002')			
	  ) a
	  group by a.yyyymm;
  
	
	long ll_width, ll_height, li_rtn, l_row, ll_row1
	OLEObject myoleobject
	String  ls_classname = 'XLMAIN', ls_winname = 'Microsoft Excel'
	String  ls_path

//	open(w_icprocess)
	
	Destroy myoleobject	
	
	myoleobject = CREATE OLEObject
	li_rtn = myoleobject.ConnectToNewObject("excel.application")
	if li_rtn <> 0 THEN
	    MessageBox('엑셀오류','엑셀을 실행할 수 없습니다...')
	    Destroy myoleobject
	    Return 1
	end if
	
	ls_path= GetCurrentDirectory()
	
	myOleObject.Application.WorkBooks.Open( ls_path+"\excel.xlsx") // Sheet OPEN
	myOleObject.Application.Visible = false
	
	ls_fr_date = LeftA(em_2.text,4)+RightA(em_2.text,2)	
	ls_to_date = LeftA(em_3.text,4)+RightA(em_3.text,2)			
	
	l_row = dw_7.retrieve(ls_fr_date, ls_to_date)	
	l_row = l_row+1

	ls_data = dw_7.object.datawindow.data
	::clipboard(ls_data)	

	myoleobject.application.workbooks(1).Worksheets(1).Activate
	myoleobject.application.workbooks(1).Worksheets(1).range("A2:C" + string(l_row)).select
	myoleobject.application.workbooks(1).Worksheets(1).paste	
	
//	is_purchase_code = '00001'
//	ls_fr_date = left(em_2.text,4)+right(em_2.text,2)	
//	ls_to_date = left(em_3.text,4)+right(em_3.text,2)		
//	l_row = 1
//	setnull(l_null)
//
//	  select  count(*)
//	  into :ll_row1
//	  from
//	  (
//	  select distinct yyyymm
//		from dbo.purchase_unit
//		where use_yn = 'Y'	
//		and yyyymm between :ls_fr_date and :ls_to_date
//		and unit_amt is not null
//		and purchase_code in ('00001', '00002')
//	  ) a;	
//	
//	 OPEN purchase_cursor;
//	
//	 		FETCH purchase_cursor INTO :ls_yyyymm_name, :l_unit_amt1, :l_unit_amt2;
//			 
//				
//			Do While sqlca.sqlcode = 0	
//				
//				l_row = l_row + 1
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("A"+string(l_row)).VALUE = ls_yyyymm_name				
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("B"+string(l_row)).VALUE = l_unit_amt1					
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("C"+string(l_row)).VALUE = l_unit_amt2									
//				
//				FETCH purchase_cursor INTO :ls_yyyymm_name, :l_unit_amt1, :l_unit_amt2;
//				
//				w_icprocess.hpb_1.position = (l_row / ll_row1) * 95						
//								
//			Loop
//	
//	
//	 CLOSE purchase_cursor;	
	 
	myoleobject.application.workbooks(1).Worksheets("Sheet2").ChartObjects(1).Chart.setSourcedata(myoleobject.application.workbooks(1).WorkSheets(1).Range("A2:C" + string(l_row) ))
	myoleobject.application.workbooks(1).Worksheets("Sheet2").ChartObjects(1).Chart.SeriesCollection(1).name = '철광석'	
	myoleobject.application.workbooks(1).Worksheets("Sheet2").ChartObjects(1).Chart.SeriesCollection(2).name = '열연'
	
	myOleObject.Application.WorkBooks(1).Save()
	myoleobject.application.workbooks(1).Worksheets(2).ChartObjects(1).Chart.Export(ls_path+"\graph.jpg","jpg")
	myOleObject.Application.workbooks(1).close(false,false)
	myOleObject.Application.Quit
	myoleobject.DisConnectObject()
	Destroy myoleobject	
	
//	tab_1.tabpage_1.p_photo.PictureName = "C:\BMP\YC_150X150.jpg"
	tab_1.tabpage_1.p_photo.PictureName = ""
	tab_1.tabpage_1.p_photo.PictureName = ls_path+"\graph.jpg"	
	
//	close(w_icprocess)	
	
	return 1
end function

public function integer wf_graph_create3 ();	string ls_purchase_name, ls_purchase_name1, ls_purchase_name2,  ls_yyyymm_name, ls_fr_date, ls_to_date, ls_yyyymm, ls_data
	decimal l_unit_amt1, l_unit_amt2,  l_unit_amt3, l_null
	
//	DECLARE purchase_cursor CURSOR FOR 
//	  select  a.yyyymm,
//	  		   a.purchase_name,
//			   sum(a.unit_00009_amt) unit_00001_amt
//	  from 
//	  (
//		  select purchase_name, 
//				  substring(yyyymm,1,4)+'-'+substring(yyyymm,5,2) yyyymm,
//			       (case when purchase_code = '00009' then unit_amt else 0 end ) unit_00009_amt				
//			from dbo.purchase_unit
//			where use_yn = 'Y'	
//			and yyyymm between :ls_fr_date and :ls_to_date
//			and unit_amt is not null
//			and purchase_code in ('00009')
//	  ) a
//	  group by a.purchase_name, a.yyyymm;
//  
	long ll_width, ll_height, li_rtn, l_row, ll_row1
	OLEObject myoleobject
	String  ls_classname = 'XLMAIN', ls_winname = 'Microsoft Excel'
	String  ls_path
//	
//	open(w_icprocess)
		
	Destroy myoleobject	
	
	myoleobject = CREATE OLEObject
	li_rtn = myoleobject.ConnectToNewObject("excel.application")
	if li_rtn <> 0 THEN
	    MessageBox('엑셀오류','엑셀을 실행할 수 없습니다...')
	    Destroy myoleobject
	    Return 1
	end if
	
	ls_path= GetCurrentDirectory()
	
	myOleObject.Application.WorkBooks.Open( ls_path+"\excel.xlsx") // Sheet OPEN
	myOleObject.Application.Visible = false
	
	ls_fr_date = LeftA(em_2.text,4)+RightA(em_2.text,2)	
	ls_to_date = LeftA(em_3.text,4)+RightA(em_3.text,2)		
	
	l_row = dw_7.retrieve(ls_fr_date, ls_to_date)	
	l_row = l_row+1

	ls_data = dw_7.object.datawindow.data
	::clipboard(ls_data)	

	myoleobject.application.workbooks(1).Worksheets(1).Activate
	myoleobject.application.workbooks(1).Worksheets(1).range("A2:B" + string(l_row)).select
	myoleobject.application.workbooks(1).Worksheets(1).paste		
//	l_row = 1
//	setnull(l_null)
//
//	  select  count(*)
//	  into :ll_row1
//	  from
//	  (
//	  select distinct yyyymm
//		from dbo.purchase_unit
//		where use_yn = 'Y'	
//		and yyyymm between :ls_fr_date and :ls_to_date
//		and unit_amt is not null
//		and purchase_code in ('00009')
//	  ) a;			
//	
//	 OPEN purchase_cursor;
//	
//	 		FETCH purchase_cursor INTO :ls_yyyymm_name, :ls_purchase_name, :l_unit_amt1;
//			 
//				
//			Do While sqlca.sqlcode = 0	
//				
//				l_row = l_row + 1
//				
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("A"+string(l_row)).VALUE = ls_yyyymm_name				
//				myoleobject.application.workbooks(1).Worksheets(1).RANGE("B"+string(l_row)).VALUE = l_unit_amt1							
//				
//				FETCH purchase_cursor INTO :ls_yyyymm_name, :ls_purchase_name, :l_unit_amt1;
//				
//				w_icprocess.hpb_1.position = (l_row / ll_row1) * 95								
//								
//			Loop
//	
//	
//	 CLOSE purchase_cursor;	
	 
	myoleobject.application.workbooks(1).Worksheets("Sheet4").ChartObjects(1).Chart.setSourcedata(myoleobject.application.workbooks(1).WorkSheets(1).Range("A2:B" + string(l_row) ))
	myoleobject.application.workbooks(1).Worksheets("Sheet4").ChartObjects(1).Chart.SeriesCollection(1).name = '포두강철'
	
	myOleObject.Application.WorkBooks(1).Save()
	myoleobject.application.workbooks(1).Worksheets(4).ChartObjects(1).Chart.Export(ls_path+"\graph.jpg","jpg")
	myOleObject.Application.workbooks(1).close(false,false)
	myOleObject.Application.Quit
	myoleobject.DisConnectObject()
	Destroy myoleobject	
	
//	tab_1.tabpage_1.p_photo.PictureName = "C:\BMP\YC_150X150.jpg"
	tab_1.tabpage_1.p_photo.PictureName = ""
	tab_1.tabpage_1.p_photo.PictureName = ls_path+"\graph.jpg"	
	
//	close(w_icprocess)		
		
	return 1
	
end function

on w_ippurchase_unit_m.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_op=create ddlb_op
this.tab_1=create tab_1
this.st_2=create st_2
this.st_5=create st_5
this.em_3=create em_3
this.em_2=create em_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.dw_7=create dw_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_fld
this.Control[iCurrent+3]=this.ddlb_dwtitles
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.sle_value
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.ddlb_op
this.Control[iCurrent+11]=this.tab_1
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.em_3
this.Control[iCurrent+15]=this.em_2
this.Control[iCurrent+16]=this.rb_1
this.Control[iCurrent+17]=this.rb_2
this.Control[iCurrent+18]=this.rb_3
this.Control[iCurrent+19]=this.dw_7
end on

on w_ippurchase_unit_m.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_op)
destroy(this.tab_1)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.dw_7)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//==========================================================================================

tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_6.SetTransObject(SQLCA)
dw_7.SetTransObject(SQLCA)


ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

i_tabpage = 1
is_dw = 'dw3'

tab_1.tabpage_2.dw_4.insertrow(0)

tab_1.tabpage_2.em_1.text = string(today(),'yyyy/mm/dd')
//em_2.text = string(today(),'yyyy/mm/dd')
//em_3.text = string(today(),'yyyy/mm/dd')

//tab_1.tabpage_1.p_photo.PictureName = "C:\BMP\YC_150X150.jpg"
string  ls_fr_yyyymm, ls_to_yyyymm

select min(yyyymm), max(yyyymm)
into :ls_fr_yyyymm, :ls_to_yyyymm
from dbo.purchase_unit
where use_yn = 'Y'		
and unit_amt is not null
and purchase_code in ('00001', '00002');

em_2.text = LeftA(ls_fr_yyyymm,4) + '/'	 + RightA(ls_fr_yyyymm,2)
em_3.text = LeftA(ls_to_yyyymm,4) + '/'	 + RightA(ls_to_yyyymm,2)

tab_1.tabpage_1.p_photo.PictureName = ""
end event

event resize;call super::resize;//

gb_2.width = newwidth - 78

tab_1.width  = newwidth  - 78
tab_1.height = newheight - 468

tab_1.tabpage_1.p_photo.width  = newwidth  - 78
tab_1.tabpage_1.p_photo.height = newheight - 598

tab_1.tabpage_2.dw_4.width = newwidth - 78

tab_1.tabpage_2.dw_6.height = newheight - 598

tab_1.tabpage_2.dw_5.width = newwidth - 78
tab_1.tabpage_2.dw_5.height = newheight - tab_1.tabpage_2.dw_4.height - 598

//st_1.x = st_1.x + 1850
end event

type pb_save from w_inheritance`pb_save within w_ippurchase_unit_m
integer x = 4233
integer y = 60
end type

event pb_save::clicked;
string ls_purchase_code, ls_purchase_name, ls_use_yn
long    l_rowcount, ll_row

dwItemStatus l_status

tab_1.tabpage_2.dw_4.accepttext()
tab_1.tabpage_2.dw_5.accepttext()
//===============사용자별 프로그램 사용현황==================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//===================================================================


is_yyyy = tab_1.tabpage_2.em_1.text

l_rowcount = 0
l_rowcount = tab_1.tabpage_2.dw_5.rowcount()


if i_tabpage = 1 then
	
	
else	
		
		is_purchase_name = tab_1.tabpage_2.dw_4.object.purchase_name[1] 
		is_purchase_code = tab_1.tabpage_2.dw_4.object.purchase_code[1] 
		
		l_status =tab_1.tabpage_2.dw_4.GetItemStatus(1, 0, Primary!)
		

		if isnull(is_purchase_code) then		
		
			insert into purchase_unit
			select       a.yyyymm, 
						 a.purchase_code,
						 a.purchase_name, 
						 a.unit_amt,
						 'Y'  use_yn
			from (
										 select :is_yyyy+'01' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'02' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'03' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'04' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'05' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'06' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'07' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'08' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'09' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'10' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'11' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
										 UNION ALL
										 select :is_yyyy+'12' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
					  ) a
			where a.yyyymm like :is_yyyy + '__'
				 and a.purchase_code  = :is_purchase_code
				 and not exists
					  (
							  select  *
								from purchase_unit b
								where b.yyyymm like :is_yyyy + '__'
									 and b.purchase_code  = :is_purchase_code
									 and b.purchase_code = a.purchase_code
									 and b.yyyymm = a.yyyymm           
					  );		
			
			commit;
			
		else
			
			if l_rowcount = 0 then
				
				insert into purchase_unit
				select       a.yyyymm, 
							 a.purchase_code,
							 a.purchase_name, 
							 a.unit_amt,
							 'Y'  use_yn
				from (
											 select :is_yyyy+'01' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'02' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'03' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'04' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'05' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'06' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'07' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'08' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'09' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'10' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'11' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
											 UNION ALL
											 select :is_yyyy+'12' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
						  ) a
				where a.yyyymm like :is_yyyy + '__'
					 and a.purchase_code  = :is_purchase_code
					 and not exists
						  (
								  select  *
									from purchase_unit b
									where b.yyyymm like :is_yyyy + '__'
										 and b.purchase_code  = :is_purchase_code
										 and b.purchase_code = a.purchase_code
										 and b.yyyymm = a.yyyymm           
						  );		
				
				commit;				
				
			end if
		
		end if
		
		if l_status = NewModified! then
						
		else
		
			 is_purchase_name = tab_1.tabpage_2.dw_4.object.purchase_name[1]
			 ls_use_yn = tab_1.tabpage_2.dw_4.object.use_yn[1]			 
			
			  update purchase_unit
			        set purchase_name = :is_purchase_name,
					    use_yn = :ls_use_yn
			   where purchase_code  = :is_purchase_code;
			
		end if
		
	
		wf_update1(tab_1.tabpage_2.dw_5,"Y")
	
end if

tab_1.tabpage_2.dw_6.retrieve()	
end event

type dw_1 from w_inheritance`dw_1 within w_ippurchase_unit_m
boolean visible = false
integer x = 4027
integer y = 272
integer width = 247
integer height = 112
boolean enabled = false
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;//
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

event dw_1::itemchanged;call super::itemchanged;string ls_cust_no, ls_cust_name, ls_top_level, ls_salesman_name 
long   l_now_amt, l_pre_amt

	if  dwo.name = 'cust_no' then
		
		     ls_cust_no =trim(data)
		
			select  a.cust_name,
					 a.top_level,
					 c.user_name salesman_name,
					 b.now_amt,
					 b.pre_amt
			 into   :ls_cust_name, :ls_top_level, :ls_salesman_name, :l_now_amt, :l_pre_amt
			from customer a with(nolock) left outer join (
																				select  cust_no,  
																						sum( case when datepart(year, opeom.eom_year) = datepart(year, getdate()) then ( inv_01 +
																																																inv_02 +
																																																inv_03 +
																																																inv_04 +
																																																inv_05 +
																																																inv_06 +
																																																inv_07 +
																																																inv_08 +
																																																inv_09 +
																																																inv_10 +
																																																inv_11 +
																																																inv_12   ) else 0 end )/1000 now_amt,
																													  
																						sum( case when datepart(year, opeom.eom_year) = datepart(year, DATEADD(year, -1,  getdate())) then (   inv_01 +
																																																							 inv_02 +
																																																							 inv_03 +
																																																							 inv_04 +
																																																							 inv_05 +
																																																							 inv_06 +
																																																							 inv_07 +
																																																							 inv_08 +
																																																							 inv_09 +
																																																							 inv_10 +
																																																							 inv_11 +
																																																							 inv_12   ) else 0 end )/1000 pre_amt
																			from opeom with(nolock)
																			where datepart(year, opeom.eom_year) in ( datepart(year, getdate()) ,  datepart(year, DATEADD(year, -1,  getdate())) )
																			group by cust_no
																	) b on a.cust_no = b.cust_no
												  left outer join login c with(nolock) on a.salesman  = c.user_id
			where a.cust_no = :ls_cust_no;

			this.object.top_level[row] = ls_top_level
			this.object.salesman_name[row] = ls_salesman_name
			this.object.now_amt[row] = l_now_amt
			this.object.pre_amt[row] = l_pre_amt			

	end if
end event

type st_title from w_inheritance`st_title within w_ippurchase_unit_m
integer x = 91
integer y = 40
integer width = 1349
string text = "구매자재 단가 현황"
end type

type st_tips from w_inheritance`st_tips within w_ippurchase_unit_m
end type

type pb_compute from w_inheritance`pb_compute within w_ippurchase_unit_m
boolean visible = false
integer x = 4709
integer y = 212
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_ippurchase_unit_m
boolean visible = false
integer x = 3406
end type

type pb_close from w_inheritance`pb_close within w_ippurchase_unit_m
integer x = 4425
integer y = 60
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ippurchase_unit_m
integer x = 4041
integer y = 60
integer taborder = 160
end type

event pb_print::clicked;w_repsuper w_print
string ls_path
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

ls_path= GetCurrentDirectory()

if i_tabpage = 1 then
	
	setpointer(hourglass!)
			
//	if rb_1.checked then
//		wf_graph_create1()
//	elseif rb_2.checked then
//		wf_graph_create2()		
//	elseif rb_3.checked then
//		wf_graph_create3()		
//	end if
	
	setpointer(arrow!)		
		
	dw_2.retrieve()
	
	dw_2.object.p_photo.filename = ""
     dw_2.object.p_photo.filename = ls_path+"\graph.jpg"		
	  
	i_print.st_datawindow = dw_2
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc = " 이 프로그램은 조업자재 코드내역을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=77'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

else
	
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_ippurchase_unit_m
boolean visible = false
integer x = 4471
integer y = 240
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_ippurchase_unit_m
integer x = 3849
integer y = 60
integer taborder = 210
end type

event pb_delete::clicked;long ll_no, ll_row, l_rowcount


if i_tabpage = 2 then
	
	 if tab_1.tabpage_2.dw_4.getrow() < 1 then return		
		
	delete purchase_unit
	where purchase_code = :is_purchase_code;
	
	commit;
		
	tab_1.tabpage_2.dw_4.reset()
	tab_1.tabpage_2.dw_5.reset()				
	
end if

tab_1.tabpage_2.dw_6.retrieve()	

messagebox('알림', '삭제완료했습니다.')

end event

type pb_insert from w_inheritance`pb_insert within w_ippurchase_unit_m
integer x = 3657
integer y = 60
integer taborder = 230
end type

event pb_insert::clicked;long ll_row
string ls_currcode, ls_purchase_code


if i_tabpage = 2 then
	
	tab_1.tabpage_2.dw_4.reset()
	tab_1.tabpage_2.dw_5.reset()		
	
	ll_row = tab_1.tabpage_2.dw_4.insertrow(0)
	tab_1.tabpage_2.dw_4.ScrollToRow(ll_row)
	
	
	 select (
				case   when len(isnull( max(substring(purchase_code,2,4)) , 0) + 1) = 1 then '0000' + convert(char(1), isnull( max(substring(purchase_code,2,4)) , 0) + 1)
						when  len(isnull( max(substring(purchase_code,2,4)) , 0) + 1) = 2 then '000'  + convert(char(2), isnull( max(substring(purchase_code,2,4)) , 0) + 1)
						when  len(isnull( max(substring(purchase_code,2,4)) , 0) + 1) = 3 then '00'    + convert(char(3), isnull( max(substring(purchase_code,2,4)) , 0) + 1)
 					     when  len(isnull( max(substring(purchase_code,2,4)) , 0) + 1) = 4 then '0'      + convert(char(4), isnull( max(substring(purchase_code,2,4)) , 0) + 1)end 
			 ) purchase_code
			into :ls_purchase_code
	from purchase_unit with(nolock);

	tab_1.tabpage_2.dw_4.object.purchase_code[1] = ls_purchase_code
	tab_1.tabpage_2.dw_4.object.use_yn[1] = 'Y'
	
	tab_1.tabpage_2.dw_4.setcolumn('purchase_name')
	tab_1.tabpage_2.dw_4.setfocus()
	
end if
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_ippurchase_unit_m
integer x = 3465
integer y = 60
integer taborder = 220
end type

event pb_retrieve::clicked;////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
////==========================================================================
string ls_purchase_name, ls_purchase_name1, ls_purchase_name2,  ls_yyyymm_name, ls_fr_date, ls_to_date, ls_yyyymm
decimal l_unit_amt1, l_unit_amt2, l_null
long il_width_orig, il_height_orig, llw, llh

if i_tabpage = 1 then
	
	setpointer(hourglass!)
	
	if rb_1.checked then
		wf_graph_create1()
	elseif rb_2.checked then
		wf_graph_create2()		
	elseif rb_3.checked then
		wf_graph_create3()		
	end if
	
	
//	tab_1.tabpage_1.p_photo.width  = 6254
//	tab_1.tabpage_1.p_photo.height = 2904

	tab_1.tabpage_1.p_photo.originalsize = true
	
	il_width_orig = tab_1.tabpage_1.p_photo.width
	il_height_orig = tab_1.tabpage_1.p_photo.height
	
	if tab_1.tabpage_1.p_photo.originalsize then tab_1.tabpage_1.p_photo.originalsize = false
	
	setredraw(false)
	tab_1.tabpage_1.p_photo.setredraw(false)
	llw = il_width_orig
	llh = il_height_orig
	tab_1.tabpage_1.p_photo.width = llw
	tab_1.tabpage_1.p_photo.height = llh
	tab_1.tabpage_1.p_photo.setredraw(true)
	setredraw(TRUE)
	
	setpointer(arrow!)
	
	
else	
	tab_1.tabpage_2.dw_6.retrieve()	
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ippurchase_unit_m
boolean visible = false
integer x = 2565
integer y = 8
integer width = 823
integer height = 244
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_ippurchase_unit_m
integer y = 244
integer width = 3913
integer height = 168
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ippurchase_unit_m
integer x = 3415
integer y = 16
integer width = 1248
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_ippurchase_unit_m
boolean visible = false
integer x = 1353
integer y = 72
integer width = 119
integer height = 148
integer taborder = 60
string dataobject = "d_purchaseunit_list"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_3 from statictext within w_ippurchase_unit_m
integer x = 96
integer y = 312
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

type ddlb_fld from dropdownlistbox within w_ippurchase_unit_m
integer x = 283
integer y = 296
integer width = 443
integer height = 632
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

type ddlb_dwtitles from dropdownlistbox within w_ippurchase_unit_m
integer x = 315
integer y = 308
integer width = 311
integer height = 88
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
end type

type st_4 from statictext within w_ippurchase_unit_m
integer x = 754
integer y = 312
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

type sle_value from singlelineedit within w_ippurchase_unit_m
integer x = 1243
integer y = 304
integer width = 567
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

type cb_1 from commandbutton within w_ippurchase_unit_m
integer x = 1815
integer y = 304
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

type cb_2 from commandbutton within w_ippurchase_unit_m
integer x = 1979
integer y = 304
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

type cb_3 from commandbutton within w_ippurchase_unit_m
integer x = 2144
integer y = 304
integer width = 160
integer height = 76
integer taborder = 180
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

type cb_5 from commandbutton within w_ippurchase_unit_m
integer x = 2309
integer y = 304
integer width = 160
integer height = 76
integer taborder = 200
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

type ddlb_op from dropdownlistbox within w_ippurchase_unit_m
integer x = 919
integer y = 300
integer width = 315
integer height = 500
integer taborder = 50
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

type tab_1 from tab within w_ippurchase_unit_m
integer x = 32
integer y = 424
integer width = 4969
integer height = 1996
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;i_tabpage = newindex

if i_tabpage = 1 then
	
	st_2.visible = true
	st_5.visible = true
	em_2.visible = true
	em_3.visible	 = true
	
	 gb_3.visible = true
	 rb_1.visible = true
	 rb_2.visible = true
	 rb_3.visible = true
else
		
	st_2.visible = false
	st_5.visible = false
	em_2.visible = false
	em_3.visible	 = false
	
	 gb_3.visible = false
	 rb_1.visible = false
	 rb_2.visible = false
	 rb_3.visible = false
			
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4933
integer height = 1868
long backcolor = 79741120
string text = "원자재단가 그래프 현황"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom067!"
long picturemaskcolor = 536870912
p_photo p_photo
end type

on tabpage_1.create
this.p_photo=create p_photo
this.Control[]={this.p_photo}
end on

on tabpage_1.destroy
destroy(this.p_photo)
end on

type p_photo from picture within tabpage_1
integer x = 18
integer y = 4
integer width = 5925
integer height = 2332
boolean originalsize = true
string picturename = ".\graph.jpg"
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4933
integer height = 1868
long backcolor = 79741120
string text = "원자재단가 등록"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ArrangeTables5!"
long picturemaskcolor = 536870912
em_1 em_1
st_1 st_1
pb_delete_row pb_delete_row
pb_insert_row pb_insert_row
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
end type

on tabpage_2.create
this.em_1=create em_1
this.st_1=create st_1
this.pb_delete_row=create pb_delete_row
this.pb_insert_row=create pb_insert_row
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.Control[]={this.em_1,&
this.st_1,&
this.pb_delete_row,&
this.pb_insert_row,&
this.dw_6,&
this.dw_5,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.pb_delete_row)
destroy(this.pb_insert_row)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
end on

type em_1 from editmask within tabpage_2
event ue_modify pbm_enchange
integer x = 2098
integer y = 384
integer width = 338
integer height = 92
integer taborder = 100
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
string mask = "YYYY"
boolean spin = true
end type

event ue_modify;if isnull(is_purchase_code) = false then
	
	is_yyyy = this.text

	insert into purchase_unit
	select       a.yyyymm, 
				 a.purchase_code,
				 a.purchase_name, 
				 a.unit_amt,
				 'Y'  use_yn
	from (
								 select :is_yyyy+'01' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'02' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'03' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'04' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'05' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'06' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'07' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'08' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'09' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'10' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'11' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'12' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
			  ) a
	where a.yyyymm like :is_yyyy + '__'
		 and a.purchase_code  = :is_purchase_code
		 and not exists
			  (
					  select  *
						from purchase_unit b
						where b.yyyymm like :is_yyyy + '__'
							 and b.purchase_code  = :is_purchase_code
							 and b.purchase_code = a.purchase_code
							 and b.yyyymm = a.yyyymm           
			  );			

end if	
	
tab_1.tabpage_2.dw_5.retrieve(is_yyyy, is_purchase_code)

end event

type st_1 from statictext within tabpage_2
integer x = 1774
integer y = 384
integer width = 311
integer height = 88
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "해당년도"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_delete_row from picturebutton within tabpage_2
boolean visible = false
integer x = 4133
integer y = 360
integer width = 183
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;if tab_1.tabpage_2.dw_5.getrow() < 1 then return				
tab_1.tabpage_2.dw_5.deleterow(tab_1.tabpage_2.dw_5.getrow())
end event

type pb_insert_row from picturebutton within tabpage_2
boolean visible = false
integer x = 4128
integer y = 484
integer width = 183
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row

ll_row = tab_1.tabpage_2.dw_5.insertrow(0)
tab_1.tabpage_2.dw_5.ScrollToRow(ll_row)
tab_1.tabpage_2.dw_5.setcolumn('yyyymm')
tab_1.tabpage_2.dw_5.setfocus()
end event

type dw_6 from datawindow within tabpage_2
integer y = 12
integer width = 1659
integer height = 1824
integer taborder = 110
string title = "none"
string dataobject = "d_purchaseunit_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long l_rowcount


if isnull(row) OR row < 1 then RETURN

SelectRow( 0, FALSE )
SelectRow( row, TRUE )

is_dw = 'dw6'

is_purchase_code = tab_1.tabpage_2.dw_6.object.purchase_code[row]
is_purchase_name = tab_1.tabpage_2.dw_6.object.purchase_name[row]

is_yyyy = em_1.text

l_rowcount = 0
l_rowcount = tab_1.tabpage_2.dw_5.retrieve(is_yyyy, is_purchase_code)			  

if isnull(is_purchase_code) then

	insert into purchase_unit
	select       a.yyyymm, 
				 a.purchase_code,
				 a.purchase_name, 
				 a.unit_amt,
				 'Y'  use_yn
	from (
								 select :is_yyyy+'01' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'02' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'03' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'04' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'05' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'06' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'07' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'08' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'09' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'10' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'11' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
								 UNION ALL
								 select :is_yyyy+'12' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
			  ) a
	where a.yyyymm like :is_yyyy + '__'
		 and a.purchase_code  = :is_purchase_code
		 and not exists
			  (
					  select  *
						from purchase_unit b
						where b.yyyymm like :is_yyyy + '__'
							 and b.purchase_code  = :is_purchase_code
							 and b.purchase_code = a.purchase_code
							 and b.yyyymm = a.yyyymm           
			  );			
			  
     commit;		
	  
else 
	
	if l_rowcount = 0 then
		
		insert into purchase_unit
		select       a.yyyymm, 
					 a.purchase_code,
					 a.purchase_name, 
					 a.unit_amt,
					 'Y'  use_yn
		from (
									 select :is_yyyy+'01' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'02' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'03' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'04' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'05' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'06' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'07' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'08' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'09' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'10' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'11' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
									 UNION ALL
									 select :is_yyyy+'12' yyyymm, :is_purchase_code purchase_code, :is_purchase_name purchase_name, null unit_amt from dual
				  ) a
		where a.yyyymm like :is_yyyy + '__'
			 and a.purchase_code  = :is_purchase_code
			 and not exists
				  (
						  select  *
							from purchase_unit b
							where b.yyyymm like :is_yyyy + '__'
								 and b.purchase_code  = :is_purchase_code
								 and b.purchase_code = a.purchase_code
								 and b.yyyymm = a.yyyymm           
				  );			
				  
		  commit;				
		
	end if
	

end if			  

tab_1.tabpage_2.dw_4.retrieve(is_purchase_code)			  
tab_1.tabpage_2.dw_5.retrieve(is_yyyy, is_purchase_code)			  

end event

type dw_5 from datawindow within tabpage_2
integer x = 1669
integer y = 488
integer width = 2245
integer height = 1352
integer taborder = 60
string title = "none"
string dataobject = "d_purchaseunit_m1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw5'
end event

type dw_4 from datawindow within tabpage_2
integer x = 1669
integer y = 12
integer width = 2249
integer height = 356
integer taborder = 10
string title = "none"
string dataobject = "d_purchaseunit_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw4'
end event

type st_2 from statictext within w_ippurchase_unit_m
integer x = 1467
integer y = 92
integer width = 311
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "조회기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_ippurchase_unit_m
integer x = 2089
integer y = 108
integer width = 87
integer height = 52
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "~~"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_3 from editmask within w_ippurchase_unit_m
integer x = 2158
integer y = 92
integer width = 338
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
string minmax = "1990~~2050"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_2.text + '/01'
lstr_calendar.edate = em_3.text + '/01'
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_2.text = lstr_calendar.sdate
	em_3.text = lstr_calendar.edate
end if
end event

type em_2 from editmask within w_ippurchase_unit_m
integer x = 1778
integer y = 92
integer width = 338
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
string minmax = "1990~~2050"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_2.text + '/01'
lstr_calendar.edate = em_3.text + '/01'
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_2.text = lstr_calendar.sdate
	em_3.text = lstr_calendar.edate
end if
end event

type rb_1 from radiobutton within w_ippurchase_unit_m
integer x = 2592
integer y = 44
integer width = 571
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "철광석,열연"
boolean checked = true
end type

event clicked;string  ls_fr_yyyymm, ls_to_yyyymm

select min(yyyymm), max(yyyymm)
into :ls_fr_yyyymm, :ls_to_yyyymm
from dbo.purchase_unit
where use_yn = 'Y'		
and unit_amt is not null
and purchase_code in ('00001', '00002');

em_2.text = LeftA(ls_fr_yyyymm,4) + '/'	 + RightA(ls_fr_yyyymm,2)
em_3.text = LeftA(ls_to_yyyymm,4) + '/'	 + RightA(ls_to_yyyymm,2)

dw_7.dataobject = 'd_purhase_unit_r1'
dw_7.settrans(sqlca)
end event

type rb_2 from radiobutton within w_ippurchase_unit_m
integer x = 2592
integer y = 104
integer width = 768
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "GI(0.45,0.75,1.15)"
end type

event clicked;string  ls_fr_yyyymm, ls_to_yyyymm

	select min(yyyymm), max(yyyymm)
	into :ls_fr_yyyymm, :ls_to_yyyymm
	from dbo.purchase_unit
	where use_yn = 'Y'		
	and unit_amt is not null
	and purchase_code in ('00004', '00006', '00008');

em_2.text = LeftA(ls_fr_yyyymm,4) + '/'	 + RightA(ls_fr_yyyymm,2)
em_3.text = LeftA(ls_to_yyyymm,4) + '/'	 + RightA(ls_to_yyyymm,2)

dw_7.dataobject = 'd_purhase_unit_r2'
dw_7.settrans(sqlca)
end event

type rb_3 from radiobutton within w_ippurchase_unit_m
integer x = 2592
integer y = 176
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "포두강철"
end type

event clicked;string ls_fr_yyyymm, ls_to_yyyymm
	
	select min(yyyymm), max(yyyymm)
	into :ls_fr_yyyymm, :ls_to_yyyymm
	from dbo.purchase_unit
	where use_yn = 'Y'		
	and unit_amt is not null
	and purchase_code in ('00009');
	
em_2.text = LeftA(ls_fr_yyyymm,4) + '/'	 + RightA(ls_fr_yyyymm,2)
em_3.text = LeftA(ls_to_yyyymm,4) + '/'	 + RightA(ls_to_yyyymm,2)	


dw_7.dataobject = 'd_purhase_unit_r3'
dw_7.settrans(sqlca)
end event

type dw_7 from datawindow within w_ippurchase_unit_m
boolean visible = false
integer x = 4965
integer y = 28
integer width = 686
integer height = 400
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "d_purhase_unit_r1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

