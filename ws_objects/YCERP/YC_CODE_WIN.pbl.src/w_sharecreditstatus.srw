$PBExportHeader$w_sharecreditstatus.srw
$PBExportComments$거래처 점유율(신규)
forward
global type w_sharecreditstatus from w_inheritance2
end type
type dw_cond from u_datawindow within w_sharecreditstatus
end type
type cb_excel from commandbutton within w_sharecreditstatus
end type
end forward

global type w_sharecreditstatus from w_inheritance2
integer width = 3753
string title = "거래처 점유율(w_sharecreditstatus)"
dw_cond dw_cond
cb_excel cb_excel
end type
global w_sharecreditstatus w_sharecreditstatus

on w_sharecreditstatus.create
int iCurrent
call super::create
this.dw_cond=create dw_cond
this.cb_excel=create cb_excel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cond
this.Control[iCurrent+2]=this.cb_excel
end on

on w_sharecreditstatus.destroy
call super::destroy
destroy(this.dw_cond)
destroy(this.cb_excel)
end on

event resize;call super::resize;gb_2.width  = newwidth - 64
dw_1.width  = newwidth - 64 - 28

gb_3.width  = newwidth - 64
dw_2.width  = newwidth - 64 - 28

gb_3.height = newheight - dw_2.y + 32
dw_2.height = newheight - dw_2.y - gb_2.x
end event

event we_postopen;call super::we_postopen;string ls_year

if gs_userid = '1999010s' then
	cb_excel.visible = true
end if

//초기값
select
	convert(varchar(4), getdate(), 112)
into
	:ls_year
from
	dual
using sqlca;	

dw_cond.setitem(1, 'as_year', ls_year)

//초기화
this.postevent('we_insert')
this.postevent('we_retrieve')


end event

event we_insert;//상속 제거
dw_1.reset()
dw_1.insertrow(0)

return 1
end event

event we_save;call super::we_save;Long	ll_rtn
ll_rtn = wf_update_array({dw_1})
If ll_rtn = 1 Then Messagebox('확인', '저장이 정상적으로 진행되었습니다')

this.postevent('we_retrieve')
Return 1
end event

event we_retrieve;call super::we_retrieve;string	ls_year

if dw_cond.accepttext( ) = -1 then return 1

ls_year	= dw_cond.getitemstring(1, 'as_year')

dw_2.retrieve(ls_year)

return 1

end event

event we_delete;Long		ll_delrow, ll_rowcnt
string	ls_year, ls_cust_no, ls_msg
string		ls_sqlerrtext

ll_delrow	= dw_2.getrow()
ls_year		= dw_2.getitemstring(ll_delrow, 'year')
ls_cust_no	= dw_2.getitemstring(ll_delrow, 'cust_no')

ls_msg	= ls_year + '년도 ' + '거래처코드(' + ls_cust_no + ')를~r~n삭제하시겠습니까?'
if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return -1

delete from shareCreditStatus where year = :ls_year and cust_no = :ls_cust_no using sqlca;

if sqlca.sqlcode = -1 then         
	ls_sqlerrtext	= sqlca.sqlerrtext
	rollback using sqlca;
	messagebox("sql error", ls_sqlerrtext)
	return -1
end if

commit;
messagebox("확인","삭제했습니다.")

this.postevent('we_retrieve')

Return 1
end event

type pb_saveas from w_inheritance2`pb_saveas within w_sharecreditstatus
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_save from w_inheritance2`pb_save within w_sharecreditstatus
integer x = 3301
end type

type dw_1 from w_inheritance2`dw_1 within w_sharecreditstatus
integer x = 41
integer y = 264
integer width = 3639
integer height = 452
string dataobject = "d_sharecreditstatus01"
boolean hscrollbar = false
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
end type

event dw_1::itemchanged;call super::itemchanged;string	ls_salesman, ls_top_level

choose case dwo.name
	case 'cust_no'
		select
			 user_name
			,top_level
		into
			 :ls_salesman
			,:ls_top_level
		from 
			customer a inner join login b on a.salesman = b.user_id 
		where
			cust_no = :data
		using sqlca;			

		this.setitem(1, 'salesman', '')
		this.setitem(1, 'top_level', '')

		this.setitem(1, 'salesman', ls_salesman)
		this.setitem(1, 'top_level', ls_top_level)
		
end choose
end event

event dw_1::updatestart;call super::updatestart;//return 1(Do not perform the update) / 0 (Continue processing)
Long		ll_rcnt, ll_row, ll_cnt
dwitemstatus	 ldwstatus
string	ls_temp, ls_year
long		ll_no

ll_rcnt			= this.rowcount()
Do While ll_row <= ll_rcnt
	ll_row = this.getnextmodified(ll_row, Primary!)
	IF ll_row > 0 THEN
		ldwstatus = this.getitemstatus(ll_row, 0, Primary!)
		Choose Case ldwstatus
			case NewModified!, DataModified!
			choose case ldwstatus
				Case NewModified!
					//템플릿 코드 중복 확인
					if dw_cond.accepttext( ) = -1 then 
						messagebox("주의","적용 년도를 확인하세요.")
						return 1
					end if

					ls_year	= dw_cond.getitemstring(1, 'as_year')
					ls_temp	= this.getitemstring(ll_row, 'cust_no')
					select 
						count(*)
					into
						:ll_cnt
					from
						shareCreditStatus
					where
						year		= :ls_year
					and						
						cust_no	= :ls_temp
					using sqlca;
					
					if ll_cnt <> 0 then
						messagebox("오류","동일한 탬플릿 코드가 존재합니다.")
						return 1
					end if
					
					this.setItem(ll_row, 'year', ls_year)
					
				Case DataModified!
			end choose
		End CHoose
	Else
		ll_row = ll_rcnt + 1        
	End If
Loop
end event

event dw_1::we_esscheckbyupdate;call super::we_esscheckbyupdate;long 		NbrRows, ll_row = 0
DWItemStatus		ldwstate
//입력값
dec	ldc_pr_sales, ldc_pr_aplctRate, ldc_pr_wghtval, ldc_pr_exclsRate, ldc_wghtval, ldc_exclsRate 
//전년 계산
dec	ldc_pr_aplcbAmnt,ldc_pr_wghtAmnt,ldc_pr_exclsAmnt,ldc_pr_trgtAmnt,ldc_pr_prfrmRate,ldc_pr_mnthlAvrg,ldc_pr_ourSales,ldc_pr_share
//당년 계산
dec	ldc_wghtAmnt,ldc_exclsAmnt,ldc_trgtAmnt,ldc_prfrmRate,ldc_mnthlAvrg,ldc_cmltvSales,ldc_crntMonth,ldc_lastMonth,ldc_lastMonthRate,ldc_MonthRate

NbrRows = this.RowCount()
Do While ll_row <= NbrRows        
	ll_row = this.GetNextModified(ll_row, Primary!)        
	
	IF ll_row > 0 Then
		//01.기본값 셋팅
		//전년 공사실적(반올림)		
		ldc_pr_sales	= this.getitemdecimal(ll_row, 'pr_sales')
		if ldc_pr_sales = 0 then
			messagebox("확인", "전년 공사실적을 입력하세요.")
			return -1
		end if
		
		//전년 적용율		
		ldc_pr_aplctRate	= this.getitemdecimal(ll_row, 'pr_aplctRate')
		if ldc_pr_aplctRate = 0 then
			messagebox("확인", "전년 적용율을 입력하세요.")
			return -1
		end if

		//전년 가중치		
		ldc_pr_wghtval	= this.getitemdecimal(ll_row, 'pr_wghtval')
//		if ldc_pr_wghtval = 0 then
//			messagebox("확인", "전년 가중치를 입력하세요.")
//			return -1
//		end if
//
		//전년 제외율
		ldc_pr_exclsRate	= this.getitemdecimal(ll_row, 'pr_exclsRate')
//		if ldc_pr_exclsRate = 0 then
//			messagebox("확인", "전년 제외율를 입력하세요.")
//			return -1
//		end if
//		
		//가중치		
		ldc_wghtval	= this.getitemdecimal(ll_row, 'wghtval')
//		if ldc_wghtval = 0 then
//			messagebox("확인", "가중치를 입력하세요.")
//			return -1
//		end if
//		
		//제외율
		ldc_exclsRate	= this.getitemdecimal(ll_row, 'exclsRate')
//		if ldc_exclsRate = 0 then
//			messagebox("확인", "제외율를 입력하세요.")
//			return -1
//		end if
		
		//02. 전년 자동 값구하기(반올림)
		//전년 적용금액	pr_aplcbAmnt	= pr_sales * pr_aplctRate 
		ldc_pr_aplcbAmnt	= round(ldc_pr_sales * ldc_pr_aplctRate / 100 ,0)
		this.setitem(ll_row, 'pr_aplcbAmnt', ldc_pr_aplcbAmnt)
		//전년 가중금액	pr_wghtAmnt		= pr_aplcbAmnt * pr_wghtval
		ldc_pr_wghtAmnt	= round(ldc_pr_aplcbAmnt * ldc_pr_wghtval  / 100 ,0)
		this.setitem(ll_row, 'pr_wghtAmnt', ldc_pr_wghtAmnt)
		//전년 제외금액	pr_exclsAmnt	= (pr_aplcbAmnt + pr_wghtAmnt) * pr_exclsRate
		ldc_pr_exclsAmnt	= round((ldc_pr_aplcbAmnt + ldc_pr_wghtAmnt) * ldc_pr_exclsRate / 100 ,0)
		this.setitem(ll_row, 'pr_exclsAmnt', ldc_pr_exclsAmnt)		
		//전년 대상금액	pr_trgtAmnt		= pr_aplcbAmnt + pr_wghtAmnt + pr_exclsAmnt
		ldc_pr_trgtAmnt	= ldc_pr_aplcbAmnt + ldc_pr_wghtAmnt + ldc_pr_exclsAmnt
		this.setitem(ll_row, 'pr_trgtAmnt', ldc_pr_trgtAmnt)				
		//전년 실적용율	pr_prfrmRate	= pr_trgtAmnt / pr_sales
		ldc_pr_prfrmRate	= round(ldc_pr_trgtAmnt / ldc_pr_sales * 100 ,1)
		this.setitem(ll_row, 'pr_prfrmRate', ldc_pr_prfrmRate)			
		//전년 월평균		pr_mnthlAvrg	= pr_trgtAmnt / 12
		ldc_pr_mnthlAvrg	= round(ldc_pr_trgtAmnt / 12 ,0)
		this.setitem(ll_row, 'pr_mnthlAvrg', ldc_pr_mnthlAvrg)						
		//전년 당사매출	pr_ourSales		ERP 자료							=> 쿼리 계산
		//전년 점유율		pr_share			pr_ourSales / pr_trgtAmnt	=> 쿼리 계산
		
		//03. 당년 자동 값구하기(반올림)		
		//가중금액			wghtAmnt			= pr_aplcbAmnt * wghtval
		ldc_wghtAmnt		= round(ldc_pr_aplcbAmnt * ldc_wghtval / 100 ,0)
		this.setitem(ll_row, 'wghtAmnt', ldc_wghtAmnt)								
		//제외금액			exclsAmnt		= (pr_aplcbAmnt + wghtAmnt) * exclsRate
		ldc_exclsAmnt		= round((ldc_pr_aplcbAmnt + ldc_wghtAmnt) * ldc_exclsRate / 100, 0)
		this.setitem(ll_row, 'exclsAmnt', ldc_exclsAmnt)								
		//대상금액			trgtAmnt			= pr_aplcbAmnt + wghtAmnt + exclsAmnt
		ldc_trgtAmnt		= ldc_pr_aplcbAmnt + ldc_wghtAmnt + ldc_exclsAmnt
		this.setitem(ll_row, 'trgtAmnt', ldc_trgtAmnt)								
		//실적용율			prfrmRate		= trgtAmnt / pr_sales
		ldc_prfrmRate		= round(ldc_trgtAmnt / ldc_pr_sales * 100, 1)
		this.setitem(ll_row, 'prfrmRate', ldc_prfrmRate)								
		//월평균				mnthlAvrg		= trgtAmnt / 12
		ldc_mnthlAvrg		= round(ldc_trgtAmnt / 12, 0)
		this.setitem(ll_row, 'mnthlAvrg', ldc_mnthlAvrg)								
		
		//매출누계			cmltvSales		ERP 자료
		//당월매출			crntMonth		ERP 자료
		//전월누계			lastMonth		= cmltvSales - crntMonth						=> 쿼리 계산
		//전월기준			lastMonthRate	= (cmltvSales - crntMonth)/(mnthlAvrg*9)	=> 쿼리 계산
		//현재기준			MonthRate		= cmltvSales/(mnthlAvrg*10)					=> 쿼리 계산
		
	ELSE            
		ll_row = NbrRows + 1
	End IF
LOOP

Return 1
end event

type st_title from w_inheritance2`st_title within w_sharecreditstatus
integer width = 859
string text = "거래처 점유율"
end type

type st_tips from w_inheritance2`st_tips within w_sharecreditstatus
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance2`pb_compute within w_sharecreditstatus
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_print_part from w_inheritance2`pb_print_part within w_sharecreditstatus
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance2`pb_close within w_sharecreditstatus
integer x = 3493
end type

type pb_print from w_inheritance2`pb_print within w_sharecreditstatus
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_cancel from w_inheritance2`pb_cancel within w_sharecreditstatus
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_delete from w_inheritance2`pb_delete within w_sharecreditstatus
integer x = 3109
end type

type pb_insert from w_inheritance2`pb_insert within w_sharecreditstatus
integer x = 2917
end type

type pb_retrieve from w_inheritance2`pb_retrieve within w_sharecreditstatus
integer x = 2725
end type

type gb_3 from w_inheritance2`gb_3 within w_sharecreditstatus
integer x = 27
integer y = 736
integer width = 3671
integer height = 1436
end type

type gb_2 from w_inheritance2`gb_2 within w_sharecreditstatus
integer y = 224
integer width = 3666
integer height = 516
end type

type gb_1 from w_inheritance2`gb_1 within w_sharecreditstatus
integer x = 937
integer width = 2761
end type

type dw_2 from w_inheritance2`dw_2 within w_sharecreditstatus
integer x = 41
integer y = 784
integer width = 3639
integer height = 1368
string dataobject = "d_sharecreditstatus02"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event dw_2::rowfocuschanged;call super::rowfocuschanged;if currentrow = 0 then return

String	ls_year, ls_cust_no

//검색조건
ls_year 		= this.GetItemString(currentrow, 'year')
ls_cust_no	= this.GetItemString(currentrow, 'cust_no')

Choose Case currentrow
	Case is > 0
		dw_1.Retrieve(ls_year, ls_cust_no)
		dw_1.Post SetFocus()		
	Case 0
		//MessageBox("Check", "검색된 자료가 없습니다.")
	Case is < 0
		MessageBox("Error", "Error")
End Choose
end event

type dw_cond from u_datawindow within w_sharecreditstatus
integer x = 946
integer y = 44
integer width = 1742
integer height = 152
integer taborder = 30
boolean bringtotop = true
string title = ""
string dataobject = "d_sharecreditstatus00"
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.insertrow(0)
end event

event itemchanged;call super::itemchanged;choose case dwo.name
	case 'as_year'
		parent.postevent( 'we_retrieve')
end choose
end event

type cb_excel from commandbutton within w_sharecreditstatus
boolean visible = false
integer x = 2267
integer y = 64
integer width = 402
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "UpLoad"
end type

event clicked;oleobject ole_excel
datastore lds_temp
string	ls_curdir, ls_open_file, ls_named
integer	li_value, li_connect, i
long		ll_xls, ll_xl_row, ll_cnt
boolean	lb_select

string	ls_msg, ls_sqlerrtext
string	ls_sql, ls_err, ls_sfs 	
string	ls_year, ls_cust_no, ls_remark1 
decimal	ldc_pr_sales, ldc_pr_aplctRate, ldc_pr_wghtval, ldc_pr_exclsRate, ldc_wghtval, ldc_exclsRate 
long 		ll_Row, ll_rtn

//적용 년도
if dw_cond.accepttext( ) = -1 then return
ls_year = dw_cond.getitemstring(1, 'as_year')

ls_msg	= ls_year + '년도의 점유율을~r~n삭제 후 재등록하시겠습니까?'
if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then 
	return
else
	delete from shareCreditStatus where year = :ls_year using sqlca;
	
	if sqlca.sqlcode = -1 then         
		ls_sqlerrtext	= sqlca.sqlerrtext
		rollback using sqlca;
		messagebox("sql error", ls_sqlerrtext)
		return
	end if
end if

lds_temp = create datastore
ls_sql	= "select '' cust_no, 0 pr_sales, 0 pr_aplctRate, 0 pr_wghtval,0 pr_exclsRate,0 wghtval, 0 exclsRate, '' remark1 from dual"
ls_sfs	= SQLCA.SyntaxFromSQL( ls_sql, "style(type=grid)", ls_err )

if LenA( ls_Err ) <> 0 then 
	messagebox("오류", 'SyntaxFromSQL 생성 오류')
	destroy lds_temp
	return
end if

lds_temp.create( ls_sfs, ls_err )
if LenA( ls_err ) <> 0 then
	messagebox("오류", 'Create 생성 오류')
	destroy lds_temp
	return
end if

//엑셀자료 불러오기
ls_curdir = getcurrentdirectory()
li_value = GetFileOpenName("Open Excel File", ls_open_file, ls_named, "Excel", "Excel 통합문서(*.xlsx), *.xlsx, Excel Files Files(*.xls), *.xls, CSV Files (*.csv), *.csv")

IF li_value <> 1 THEN 
	MessageBox("확인","등록할 파일을 선택해주세요")
	destroy lds_temp
	return
END IF

IF LenA(TRIM(ls_open_file)) = 0 THEN
	MessageBox("확인","등록할 파일을 선택해주세요")
	destroy lds_temp	
	return
END IF

ll_xls = PosA(ls_open_file, 'xls')

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'XLS')
end if

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'xlsx')
end if

IF IsNull(ll_xls) or ll_xls = 0 then
	ll_xls = PosA(ls_open_file, 'XLSX')
end if	

IF IsNull(ll_xls) or ll_xls = 0 then //* Excel File이 아니면 Text File인지 체크
	ll_xls = PosA(ls_open_file, 'csv')
	
	if IsNull(ll_xls) or ll_xls = 0 then
		MessageBox("확인", "Excel 파일이 아닙니다.")
		destroy lds_temp
		return
	end if
end if

if messagebox("확인", "선택한 파일을~r~n적용하시겠습니까?", Exclamation!, OKCancel!, 2) <> 1 then
	destroy lds_temp
	return 
end if

ole_excel = CREATE OLEobject

li_connect = ole_excel.ConnectToObject("","excel.application") 

IF li_connect = -5 THEN // -5 Can't connect to the currently active object 
	li_connect = ole_excel.ConnectToNewObject("excel.application") 
END IF 

IF li_connect <> 0 THEN
	SetPointer(Arrow!)
	destroy lds_temp
	DESTROY ole_excel 
	MessageBox("확인", '엑셀 프로그램을 실행할 수 없습니다.')
	return -1
END IF

SetPointer(HourGlass!)

ole_excel.WorkBooks.Open(ls_open_file)
ole_excel.Application.Visible = FALSE

lb_select = ole_excel.WorkSheets(1).Activate

ll_xl_row =2	//엑셀 시작 셀
// 기초 자료 생성
DO UNTIL (	isnull( ole_excel.cells[ll_xl_row, 1].value ) )
	ls_cust_no			= ''
	ldc_pr_sales		= 0
	ldc_pr_aplctRate	= 0
	ldc_pr_wghtval		= 0
	ldc_pr_exclsRate	= 0
	ldc_wghtval			= 0
	ldc_exclsRate		= 0
	ls_remark1			= ''
	
	ls_cust_no			= string(ole_excel.cells[ll_xl_row, 1].VALUE)	// 거래처 코드
	ldc_pr_sales		= dec(ole_excel.cells[ll_xl_row, 2].VALUE)	// 전년매출
	ldc_pr_aplctRate	= dec(ole_excel.cells[ll_xl_row, 3].VALUE)	// 전년적용룰
	ldc_pr_wghtval		= dec(ole_excel.cells[ll_xl_row, 4].VALUE)	// 전년가중치
	ldc_pr_exclsRate	= dec(ole_excel.cells[ll_xl_row, 5].VALUE)	// 전년제외율
	ldc_wghtval			= dec(ole_excel.cells[ll_xl_row, 6].VALUE)	// 가중치
	ldc_exclsRate		= dec(ole_excel.cells[ll_xl_row, 7].VALUE)	// 제외율
	ls_remark1			= string(ole_excel.cells[ll_xl_row, 8].VALUE)	// 비고1
	
	//엑셀 자료
	ll_Row = lds_temp.insertrow(0)
	lds_temp.setitem(ll_row, 'cust_no', ls_cust_no)
	lds_temp.setitem(ll_row, 'pr_sales', ldc_pr_sales)
	lds_temp.setitem(ll_row, 'pr_aplctRate', ldc_pr_aplctRate)
	lds_temp.setitem(ll_row, 'pr_wghtval', ldc_pr_wghtval)
	lds_temp.setitem(ll_row, 'pr_exclsRate', ldc_pr_exclsRate)
	lds_temp.setitem(ll_row, 'wghtval', ldc_wghtval)
	lds_temp.setitem(ll_row, 'exclsRate', ldc_exclsRate)
	lds_temp.setitem(ll_row, 'remark1', ls_remark1)

	ll_xl_row ++
	
LOOP

ole_excel.Application.Quit
ole_excel.DisConnectObject()
DESTROY ole_excel 

//DB적용
for i = 1 to lds_temp.rowcount()
	ls_cust_no			= ''
	ldc_pr_sales		= 0
	ldc_pr_aplctRate	= 0
	ldc_pr_wghtval		= 0
	ldc_pr_exclsRate	= 0
	ldc_wghtval			= 0
	ldc_exclsRate		= 0
	ls_remark1			= ''

	ls_cust_no			= lds_temp.getitemstring(i, 'cust_no')
	ldc_pr_sales		= lds_temp.getitemdecimal(i, 'pr_sales')
	ldc_pr_aplctRate	= lds_temp.getitemdecimal(i, 'pr_aplctRate')
	ldc_pr_wghtval		= lds_temp.getitemdecimal(i, 'pr_wghtval')
	ldc_pr_exclsRate	= lds_temp.getitemdecimal(i, 'pr_exclsRate')
	ldc_wghtval			= lds_temp.getitemdecimal(i, 'wghtval')
	ldc_exclsRate		= lds_temp.getitemdecimal(i, 'exclsRate')
	ls_remark1			= lds_temp.getitemstring(i, 'remark1')
	
	dw_1.reset()
	dw_1.insertrow(0)
	
	dw_1.setitem(1, 'year', ls_year)
	dw_1.setitem(1, 'cust_no', ls_cust_no)
	dw_1.setitem(1, 'pr_sales', ldc_pr_sales)
	dw_1.setitem(1, 'pr_aplctRate', ldc_pr_aplctRate)
	dw_1.setitem(1, 'pr_wghtval', ldc_pr_wghtval)			
	dw_1.setitem(1, 'pr_exclsRate', ldc_pr_exclsRate)
	dw_1.setitem(1, 'wghtval', ldc_wghtval)
	dw_1.setitem(1, 'exclsRate', ldc_exclsRate)
	dw_1.setitem(1, 'remark1', ls_remark1)			
	
	ll_rtn = wf_update_array({dw_1})
	If ll_rtn <> 1 Then 
		rollback using sqlca;
		destroy lds_temp
		Messagebox('확인', string(i) + '번째(' + ls_cust_no + ')저장중 오류 발생')
		return
	end if
next	

destroy lds_temp
messagebox('알림',  + string(i - 1) + '업로드가 완료되었습니다.')		
parent.postevent('we_retrieve')				





end event

