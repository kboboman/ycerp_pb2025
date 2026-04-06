$PBExportHeader$w_cditemgroup_m.srw
$PBExportComments$물품그룹(1998/03/02,곽용덕)
forward
global type w_cditemgroup_m from w_inheritance
end type
type rb_1 from radiobutton within w_cditemgroup_m
end type
type rb_2 from radiobutton within w_cditemgroup_m
end type
type rb_3 from radiobutton within w_cditemgroup_m
end type
type gb_4 from groupbox within w_cditemgroup_m
end type
type gb_12 from groupbox within w_cditemgroup_m
end type
type em_1 from editmask within w_cditemgroup_m
end type
type rb_4 from radiobutton within w_cditemgroup_m
end type
type rb_5 from radiobutton within w_cditemgroup_m
end type
type rb_6 from radiobutton within w_cditemgroup_m
end type
type rb_7 from radiobutton within w_cditemgroup_m
end type
type rb_8 from radiobutton within w_cditemgroup_m
end type
type rb_9 from radiobutton within w_cditemgroup_m
end type
type rb_10 from radiobutton within w_cditemgroup_m
end type
type st_8 from statictext within w_cditemgroup_m
end type
type ddlb_col from dropdownlistbox within w_cditemgroup_m
end type
type st_9 from statictext within w_cditemgroup_m
end type
type ddlb_op from dropdownlistbox within w_cditemgroup_m
end type
type sle_value from singlelineedit within w_cditemgroup_m
end type
type cb_filteron from commandbutton within w_cditemgroup_m
end type
type cb_filteroff from commandbutton within w_cditemgroup_m
end type
type cb_11 from commandbutton within w_cditemgroup_m
end type
type cb_12 from commandbutton within w_cditemgroup_m
end type
type st_1 from statictext within w_cditemgroup_m
end type
end forward

global type w_cditemgroup_m from w_inheritance
integer x = 5
integer y = 148
integer width = 8736
integer height = 3956
string title = "물품그룹 관리(w_cditemgroup_m)"
windowstate windowstate = normal!
boolean center = true
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_4 gb_4
gb_12 gb_12
em_1 em_1
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
rb_9 rb_9
rb_10 rb_10
st_8 st_8
ddlb_col ddlb_col
st_9 st_9
ddlb_op ddlb_op
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_11 cb_11
cb_12 cb_12
st_1 st_1
end type
global w_cditemgroup_m w_cditemgroup_m

type variables
st_print i_print
string   is_select, is_where, is_init
datetime id_date
end variables

forward prototypes
public subroutine wf_filter ()
end prototypes

public subroutine wf_filter ();datawindowchild ldwc_code
string ls_filter, ls_clause1, ls_clause2, ls_where 

ls_where = " order by groupitem.item_no asc" 
if rb_1.checked = true then		// 상품
	ls_clause1 = " where groupitem.P1 = ~~'G~~'" 
	ls_filter  = "gubun = 'G'"
elseif rb_2.checked = true then	// 제품	
	ls_clause1 = " where groupitem.P1 = ~~'P~~'" 
	ls_filter  = "gubun = 'P'"
elseif rb_3.checked = true then	// 자재
	ls_clause1 = " where groupitem.P1 = ~~'M~~'" 
	ls_filter  = "gubun = 'M'"
end if

//
if rb_6.checked = true then		// 전체
	ls_clause2 = ""
elseif rb_7.checked = true then	// 시화
	ls_clause2 = "AND item_no NOT LIKE ~~'%CY%~~'"
elseif rb_8.checked = true then	// YSP
	ls_clause2 = "AND item_no LIKE ~~'%CY%~~'"
end if
is_where = "DataWindow.Table.Select='" + is_select + ls_clause1 + ls_clause2 + ls_where + "'"


dw_1.getchild('p2',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter()

dw_1.getchild('p4',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter()

//ls_filter = "gubun <> 'M'"
//dw_1.getchild('p3',ldwc_code)
//ldwc_code.SetFilter(ls_filter)
//ldwc_code.Filter()
wf_retrieve( dw_1, is_where )

RETURN

end subroutine

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//-- 2012-12-12(이재형) : 권한명칭 조정--//
//if gf_permission('판매거래처관리open', gs_userid) = 'Y' then	
if gf_permission('물품그룹관리자', gs_userid) = 'Y' then	
else
	pb_save.enabled = false
	pb_insert.enabled = false
end if
dw_2.visible = false

if gf_permission('물품그룹사용여부관리', gs_userid) = 'Y' then	
	dw_1.Object.use_flag.TabSequence = 20
end if


//is_where = message.powerobjectparm
//if isnull(is_where.str1) or is_where.str1 = "" then
//else
//	em_1.text = is_where.str1
//end if
//
//if isnull(is_where.name) or is_where.name = "" then
//else
//	em_1.text = is_where.name
//end if
//

is_select = dw_1.Describe("DataWindow.Table.Select")
wf_filter()

end event

on w_cditemgroup_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_4=create gb_4
this.gb_12=create gb_12
this.em_1=create em_1
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.rb_9=create rb_9
this.rb_10=create rb_10
this.st_8=create st_8
this.ddlb_col=create ddlb_col
this.st_9=create st_9
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_11=create cb_11
this.cb_12=create cb_12
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.gb_12
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.rb_4
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.rb_6
this.Control[iCurrent+10]=this.rb_7
this.Control[iCurrent+11]=this.rb_8
this.Control[iCurrent+12]=this.rb_9
this.Control[iCurrent+13]=this.rb_10
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.ddlb_col
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.sle_value
this.Control[iCurrent+19]=this.cb_filteron
this.Control[iCurrent+20]=this.cb_filteroff
this.Control[iCurrent+21]=this.cb_11
this.Control[iCurrent+22]=this.cb_12
this.Control[iCurrent+23]=this.st_1
end on

on w_cditemgroup_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_4)
destroy(this.gb_12)
destroy(this.em_1)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.rb_9)
destroy(this.rb_10)
destroy(this.st_8)
destroy(this.ddlb_col)
destroy(this.st_9)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.st_1)
end on

event resize;call super::resize;//This.width  = PixelsToUnits(ge_Environment.screenwidth,  xpixelstounits!)
//This.height = PixelsToUnits(ge_Environment.screenheight, ypixelstounits!)

gb_2.width  = this.width  - 132
gb_2.height = this.height - 372

dw_1.width  = this.width  - 178
dw_1.height = this.height - 524
end event

event close;call super::close;DELETE create_item

COMMIT;
end event

type pb_save from w_inheritance`pb_save within w_cditemgroup_m
integer x = 3845
integer y = 60
integer taborder = 30
end type

event pb_save::clicked;//dwItemStatus l_status
//long    ll_row, ll_rowcount, k
//string  ls_item
//integer li_pat
////===============사용자별 프로그램 사용현황=================================
//gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
////==========================================================================
//
//dw_1.accepttext()
//ll_row = dw_1.getrow()
//if ll_row < 1 then return
//
//if isnull(dw_1.object.source[ll_row]) or &
//	dw_1.object.source[ll_row] = "" or dw_1.object.source[ll_row] = " " then
//	MessageBox("확인","물품구분필드가 입력되지 않았습니다!")
//	return
//end if
//
//for k = 1 to dw_1.rowcount()
//	ls_item = left(dw_1.object.item_no[k],1)
//	if ls_item = "P" and dw_1.object.source[k] = "B" then
//		if id_date = dw_1.object.sys_date[k] then
//			MessageBox("확인",string(k) + "행 제품코드인 경우는 출처를 '구매품'으로 처리할 수 없습니다.")
//			return
//		else
//			// 이전에 만든 품목들은 SKIP함
//		end if
//	end if
//next
//
//if rb_2.checked = true then
//   ll_rowcount = dw_1.rowcount()
//	for k = 1 to ll_rowcount
//		l_status = dw_1.GetItemStatus(k,0, Primary!)
//		if l_status = newmodified! or l_status = datamodified! then
//			ls_item = trim(dw_1.object.item_no[k])
//			li_pat  = dw_1.object.pat_no[k]
//			UPDATE itempattern SET pat_no = :li_pat WHERE item_no = :ls_item;
//			if sqlca.sqlcode < 0 then
//				MessageBox('오류',sqlca.sqlerrtext,exclamation!)
//				rollback;
//				return
//			end if
//		end if
//	next
//end if
//
//if wf_update1(dw_1,"Y") then
//	gf_item()
//end if


dwItemStatus l_status
long    ll_row, ll_rowcount, k
string  ls_item, ls_item_name, ls_uom, ls_source
integer li_pat
datetime ld_sys_date
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return

if isnull(dw_1.object.source[ll_row]) or &
	dw_1.object.source[ll_row] = "" or dw_1.object.source[ll_row] = " " then
	MessageBox("확인","물품구분필드가 입력되지 않았습니다!")
	return
end if

for k = 1 to dw_1.rowcount()
	if trim(dw_1.object.p1[k]) = "P" and dw_1.object.source[k] = "B" then
		if id_date = dw_1.object.sys_date[k] then
			MessageBox("확인",string(k) + "행 제품코드인 경우는 출처를 '구매품'으로 처리할 수 없습니다.")
			return
		else
			// 이전에 만든 품목들은 SKIP함
		end if
	end if
next



ll_rowcount = dw_1.rowcount()
  
for k = 1 to ll_rowcount
	ls_item_name = dw_1.object.item_name[k]
	ls_uom = dw_1.object.uom[k]
	ls_source = dw_1.object.source[k]
	
	l_status = dw_1.GetItemStatus(k,0, Primary!)
	if l_status = newmodified! or l_status = datamodified! then
		
		if l_status = newmodified! then
			/* 2021.05.11 jowonsuk 전체인데 제품으로.시작 */
			ls_item = trim(dw_1.object.p1[k]) + trim(dw_1.object.p2[k])
			ls_item = ls_item + trim(dw_1.object.p3[k]) + trim(dw_1.object.p4[k])
			ls_item = ls_item + trim('000') + trim(dw_1.object.p6[k])
			ls_item = ls_item + trim(dw_1.object.p7[k]) + trim(dw_1.object.p8[k])
					
			select dbo.uf_item_create(:ls_item) 
			into :ls_item
			from dual;
			
			insert into create_item (item_no, status)
											values  (:ls_item, 1);				/*채번시 채번한것을 다음 채번시 빼내기 위해서 테이블 저장*/
										 
			commit;											 
			
			dw_1.object.item_no[k] = ls_item
			
		else
			ls_item = dw_1.object.item_no[k]
		
		end if

		li_pat  = dw_1.object.pat_no[k]
		
		dw_1.object.item_name[k] = ls_item_name
		dw_1.object.p5[k] = MidA(ls_item,5,3)
		dw_1.object.uom[k] = ls_uom
		dw_1.object.source[k] = ls_source
		dw_1.object.user_id[k] = gs_userid			
		
		
		if rb_2.checked = true then
			UPDATE itempattern SET pat_no = :li_pat WHERE item_no = :ls_item;
			if sqlca.sqlcode < 0 then
				MessageBox('오류',sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
		end if
	end if
next


if wf_update1(dw_1,"Y") then
	gf_item()
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cditemgroup_m
integer y = 372
integer width = 4160
integer height = 2016
integer taborder = 60
string dataobject = "d_cditemgroup_m"
boolean hsplitscroll = true
end type

event dw_1::itemchanged;call super::itemchanged;string ls_item,ls_code,ls_str

THIS.ACCEPTTEXT()
CHOOSE CASE DWO.NAME
	CASE 'item_no'
		  ls_item = trim(this.object.item_no[row]) 
		  if LenA(ls_item) <> 10 then return 1
		  ls_code = MidA(ls_item,1,1)
		  select code into :ls_str from code1 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p1[row] = ls_code
		  end if
		  
		  ls_code = MidA(ls_item,2,1)
		  select code into :ls_str from code2 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p2[row] = ls_code
		  end if
		  
		  ls_code = MidA(ls_item,3,1)
		  select code into :ls_str from code3 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p3[row] = ls_code
		  end if
		  
		  ls_code = MidA(ls_item,4,1)
		  select code into :ls_str from code4 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p4[row] = ls_code
		  end if
		  
		  ls_code = trim(MidA(ls_item,5,3))
		  if LenA(ls_code) = 3 then
			  if MidA(ls_code,2,1) = ' ' then
				  return 1
			  end if
		  else
			  return 1
		  end if
		  
		  ls_code = MidA(ls_item,8,1)
		  select code into :ls_str from code6 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p6[row] = ls_code
		  end if

		  ls_code = MidA(ls_item,9,1)
		  select code into :ls_str from code7 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p7[row] = ls_code
		  end if

		  ls_code = MidA(ls_item,10,1)
		  select code into :ls_str from code8 where code = :ls_code;
		  if sqlca.sqldbcode <> 0 then 
			  return 1
		  else
			  this.object.p8[row] = ls_code
		  end if
	CASE 'p1'
        ls_item = trim(data) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p2'
        ls_item = trim(this.object.p1[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p3'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(data) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p4'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p5'
		  ls_code = trim(data)
		  if LenA(ls_code) = 3 then
			  if MidA(ls_code,2,1) = ' ' then
				  return 1
			  end if
		  else
			  return 1
		  end if
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(data) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p6'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p7'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(data) + trim(this.object.p8[row])
        this.object.item_no[row] = ls_item
	CASE 'p8'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(data)
        this.object.item_no[row] = ls_item
END CHOOSE
		
end event

event dw_1::itemerror;call super::itemerror;string ls_item

THIS.ACCEPTTEXT()
choose case dwo.name
	case 'item_no'
		ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
      ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
      ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
      ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
      this.object.item_no[row] = ls_item
	case 'p5'
		ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
      ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
      ls_item = ls_item + '000' + trim(this.object.p6[row])
      ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
      this.object.item_no[row] = ls_item	
		this.object.p5[row] = '000'
end choose
return 1

end event

event dw_1::clicked;call super::clicked;//
string ls_value
string ls_col, ls_text

if row < 1 or row > this.rowcount() then return
choose case dwo.name                                    
	case "item_no"                                        
		ls_col   = "물품그룹"                               
		ls_text  = this.object.item_no[row]                 
	case "p1"                                             
		ls_col   = "유형"                                   
		ls_text  = this.object.p1[row]               
	case "p2"                                             
		ls_col   = "대분류"                                 
		ls_text  = string(this.object.p2[row])             
	case "p3"                                             
		ls_col   = "중분류"                                 
		ls_text  = this.object.p3[row]                  
	case "p4"
		ls_col   = "소재"
		ls_text  = this.object.p4[row]                  
	case "p5"
		ls_col   = "품명"
		ls_text  = this.object.p5[row]                  
	case "p6"
		ls_col   = "KS/BS"
		ls_text  = this.object.p6[row]                  
	case "p7"
		ls_col   = "유,무공"
		ls_text  = this.object.p7[row]                  
	case "p8"
		ls_col   = "색상"
		ls_text  = this.object.p8[row]                  
	case "source"
		ls_col   = "출처"
		ls_text  = this.object.source[row]                  
	case "qa_rule"
		ls_col   = "표준규격"
		ls_text  = this.object.qa_rule[row]                  
	case "item_name"
		ls_col   = "물품명"
		ls_text  = this.object.item_name[row]                  
	case "pat_no"
		ls_col   = "공정패턴"
		ls_text  = string(this.object.pat_no[row])
	case "uom"
		ls_col   = "단위"
		ls_text  = this.object.uom[row]                  
	case "user_id"
		ls_col   = "등록자"
		ls_text  = this.object.user_id[row]                  
	case "sys_date"
		ls_col   = "등록일자"
		ls_text  = string(this.object.sys_date[row])
	case "use_flag"
		ls_col   = "사용"
		ls_text  = this.object.use_flag[row]                  
	case "item_group"
		ls_col   = "그룹명(위치)"
		ls_text  = this.object.item_group[row]                  
	case "cost_yn"
		ls_col   = "비용"
		ls_text  = this.object.cost_yn[row]                  
	case "acct_no"
		ls_col   = "회계계정"
		ls_text  = this.object.acct_no[row]                  
end choose                                              

choose case ls_col
	case "비용"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose
ddlb_col.text  = ls_col
sle_value.text = ls_text

end event

type dw_2 from w_inheritance`dw_2 within w_cditemgroup_m
integer y = 4
integer width = 105
integer height = 80
integer taborder = 80
string dataobject = "d_cditemgroup_r"
boolean vscrollbar = false
end type

type st_title from w_inheritance`st_title within w_cditemgroup_m
integer x = 59
integer width = 987
string text = "물품그룹 관리"
end type

type st_tips from w_inheritance`st_tips within w_cditemgroup_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemgroup_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemgroup_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemgroup_m
integer x = 4037
integer y = 60
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemgroup_m
integer x = 3653
integer y = 60
integer taborder = 130
end type

event pb_print::clicked;w_repsuper w_print
string ls_type
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

if dw_1.rowcount() < 1 then
	return
elseif rb_1.checked = true then
	ls_type = 'G'
elseif rb_2.checked = true then
	ls_type = 'P'
elseif rb_3.checked = true then
	ls_type = 'M'
end if

dw_2.reset()
dw_2.retrieve(ls_type)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품그룹를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemgroup_m
boolean visible = false
integer taborder = 140
end type

type pb_delete from w_inheritance`pb_delete within w_cditemgroup_m
boolean visible = false
integer x = 2501
integer taborder = 150
end type

type pb_insert from w_inheritance`pb_insert within w_cditemgroup_m
integer x = 3461
integer y = 60
integer taborder = 170
end type

event pb_insert::clicked;//
long   ll_row
string ls_item

dw_2.accepttext()

ll_row = dw_1.insertrow(dw_1.getrow())
dw_1.ScrollToRow(ll_row)

id_date = datetime(date(string(today(),'yyyy/mm/dd')))
dw_1.object.sys_date[ll_row] = id_date

dw_1.accepttext()
ls_item = trim(dw_1.object.item_no[ll_row])
if rb_1.checked = true then
	is_init = 'G' + MidA(ls_item,2,9)
	dw_1.object.P1[ll_row] = 'G'
end if
if rb_2.checked = true then
	is_init = 'P' + MidA(ls_item,2,9)
	dw_1.object.P1[ll_row] = 'P'
end if
if rb_3.checked = true then
	is_init = 'M' + MidA(ls_item,2,9)
	dw_1.object.P1[ll_row] = 'M'
end if
dw_1.object.use_flag[ll_row] = 'Y'
dw_1.object.item_no[ll_row]  = is_init
dw_1.object.user_id[ll_row]  = gs_userid
dw_1.setcolumn('item_no')  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
dw_1.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemgroup_m
integer x = 3264
integer y = 60
integer taborder = 160
end type

event pb_retrieve::clicked;string ls_str, ls_filter

if trim(em_1.text) = '%' or trim(em_1.text) = '' then
	ls_str = '%'	
else
	ls_str = trim(em_1.text) + '%'
end if

if rb_4.checked = true then		// 코드
	ls_filter = "item_no    like '" + ls_str + "'"
	dw_1.SetFilter(ls_filter)
	dw_1.Filter()
elseif rb_5.checked = true then	// 품명
	ls_filter = "item_name  like '" + ls_str + "'"
	dw_1.SetFilter(ls_filter)
	dw_1.Filter()
elseif rb_9.checked = true then	// 그룹
	ls_filter = "item_group like '" + ls_str + "'"
	dw_1.SetFilter(ls_filter)
	dw_1.Filter()
end if

pb_retrieve.default = false

end event

type gb_3 from w_inheritance`gb_3 within w_cditemgroup_m
integer x = 2432
integer y = 20
integer width = 782
integer height = 204
integer taborder = 90
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_cditemgroup_m
integer x = 41
integer y = 240
integer width = 4206
integer height = 2168
integer taborder = 100
end type

type gb_1 from w_inheritance`gb_1 within w_cditemgroup_m
integer x = 3237
integer y = 20
integer width = 1010
integer taborder = 40
end type

type rb_1 from radiobutton within w_cditemgroup_m
integer x = 1499
integer y = 144
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "상품"
end type

event clicked;wf_filter()

end event

type rb_2 from radiobutton within w_cditemgroup_m
integer x = 1733
integer y = 144
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "제품"
end type

event clicked;wf_filter()

end event

type rb_3 from radiobutton within w_cditemgroup_m
integer x = 1966
integer y = 144
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "자재"
end type

event clicked;wf_filter()

end event

type gb_4 from groupbox within w_cditemgroup_m
integer x = 1230
integer y = 8
integer width = 763
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_12 from groupbox within w_cditemgroup_m
integer x = 1230
integer y = 104
integer width = 1065
integer height = 120
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type em_1 from editmask within w_cditemgroup_m
integer x = 2459
integer y = 128
integer width = 718
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
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

event modified;pb_retrieve.default = true
end event

type rb_4 from radiobutton within w_cditemgroup_m
integer x = 2469
integer y = 60
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "코드"
boolean checked = true
end type

type rb_5 from radiobutton within w_cditemgroup_m
integer x = 2725
integer y = 60
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "품명"
end type

type rb_6 from radiobutton within w_cditemgroup_m
integer x = 1266
integer y = 44
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;wf_filter()
end event

type rb_7 from radiobutton within w_cditemgroup_m
integer x = 1499
integer y = 44
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "시화"
end type

event clicked;wf_filter()

end event

type rb_8 from radiobutton within w_cditemgroup_m
integer x = 1733
integer y = 44
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "YSP"
end type

event clicked;wf_filter()

end event

type rb_9 from radiobutton within w_cditemgroup_m
integer x = 2953
integer y = 60
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "그룹"
end type

type rb_10 from radiobutton within w_cditemgroup_m
integer x = 1266
integer y = 144
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;//
wf_filter()

end event

type st_8 from statictext within w_cditemgroup_m
integer x = 64
integer y = 304
integer width = 160
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

type ddlb_col from dropdownlistbox within w_cditemgroup_m
integer x = 224
integer y = 288
integer width = 439
integer height = 532
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"물품그룹","유형","대분류","중분류","소재","품명","KS/BS","유,무공","색상","출처","표준규격","물품명","공정패턴","단위","등록자","작성일자","사용","그룹명(위치)","비용","회계계정"}
end type

type st_9 from statictext within w_cditemgroup_m
integer x = 667
integer y = 304
integer width = 160
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

type ddlb_op from dropdownlistbox within w_cditemgroup_m
integer x = 827
integer y = 288
integer width = 279
integer height = 512
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
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

type sle_value from singlelineedit within w_cditemgroup_m
integer x = 1120
integer y = 288
integer width = 553
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
end type

type cb_filteron from commandbutton within w_cditemgroup_m
integer x = 1682
integer y = 288
integer width = 146
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;String ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_col.text) = "" then
	ls_column = ""
else
	String ls_col
	choose case trim(ddlb_col.text)
		case "물품그룹"
			ls_col = "item_no "
		case "유형"
			ls_col = "p1 "
		case "대분류"
			ls_col = "p2 "
		case "중분류"
			ls_col = "p3 "
		case "소재"
			ls_col = "p4 "
		case "품명"
			ls_col = "p5 "
		case "KS/BS"
			ls_col = "p6 "
		case "유,무공"
			ls_col = "p7 "
		case "색상"
			ls_col = "p8 "
		case "출처"
			ls_col = "source "
		case "표준규격"
			ls_col = "qa_rule "
		case "물품명"
			ls_col = "item_name "
		case "공정패턴"
			ls_col = "pat_no "
		case "단위"
			ls_col = "uom "
		case "등록자"
			ls_col = "user_id "
		case "등록일자"
			ls_col = "sys_date "
		case "사용"
			ls_col = "use_flag "
		case "그룹명(위치)"
			ls_col = "item_group "
		case "비용"
			ls_col = "cost_yn "
		case "회계계정"
			ls_col = "acct_no "
	end choose		

	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
			case "sys_date "
				ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "cnt "
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)

end event

type cb_filteroff from commandbutton within w_cditemgroup_m
integer x = 1833
integer y = 288
integer width = 146
integer height = 76
integer taborder = 140
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
string ls_value

ddlb_op.text    = "LIKE"
ddlb_col.text   = "물품명"
sle_value.text  = ""

dw_1.setfilter("")
dw_1.filter()

dw_1.scrolltorow(1)


end event

type cb_11 from commandbutton within w_cditemgroup_m
integer x = 1984
integer y = 288
integer width = 146
integer height = 76
integer taborder = 150
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
String ls_col
choose case trim(ddlb_col.text)
	case "물품그룹"
		ls_col = "item_no "
	case "유형"
		ls_col = "p1 "
	case "대분류"
		ls_col = "p2 "
	case "중분류"
		ls_col = "p3 "
	case "소재"
		ls_col = "p4 "
	case "품명"
		ls_col = "p5 "
	case "KS/BS"
		ls_col = "p6 "
	case "유,무공"
		ls_col = "p7 "
	case "색상"
		ls_col = "p8 "
	case "출처"
		ls_col = "source "
	case "표준규격"
		ls_col = "qa_rule "
	case "물품명"
		ls_col = "item_name "
	case "공정패턴"
		ls_col = "pat_no "
	case "단위"
		ls_col = "uom "
	case "등록자"
		ls_col = "user_id "
	case "등록일자"
		ls_col = "sys_date "
	case "사용"
		ls_col = "use_flag "
	case "그룹명(위치)"
		ls_col = "item_group "
	case "비용"
		ls_col = "cost_yn "
	case "회계계정"
		ls_col = "acct_no "
end choose		

dw_1.SetSort(ls_col + "A")
dw_1.sort()

end event

type cb_12 from commandbutton within w_cditemgroup_m
integer x = 2130
integer y = 288
integer width = 146
integer height = 76
integer taborder = 160
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
String ls_col
choose case trim(ddlb_col.text)
	case "물품그룹"
		ls_col = "item_no "
	case "유형"
		ls_col = "p1 "
	case "대분류"
		ls_col = "p2 "
	case "중분류"
		ls_col = "p3 "
	case "소재"
		ls_col = "p4 "
	case "품명"
		ls_col = "p5 "
	case "KS/BS"
		ls_col = "p6 "
	case "유,무공"
		ls_col = "p7 "
	case "색상"
		ls_col = "p8 "
	case "출처"
		ls_col = "source "
	case "표준규격"
		ls_col = "qa_rule "
	case "물품명"
		ls_col = "item_name "
	case "공정패턴"
		ls_col = "pat_no "
	case "단위"
		ls_col = "uom "
	case "등록자"
		ls_col = "user_id "
	case "등록일자"
		ls_col = "sys_date "
	case "사용"
		ls_col = "use_flag "
	case "그룹명(위치)"
		ls_col = "item_group "
	case "비용"
		ls_col = "cost_yn "
	case "회계계정"
		ls_col = "acct_no "
end choose		

dw_1.SetSort(ls_col + "D")
dw_1.sort()

end event

type st_1 from statictext within w_cditemgroup_m
integer x = 2322
integer y = 300
integer width = 1902
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "출처가 ~'스리팅~'인 품목은 스리팅 작업지시 관리용으로 사용함."
alignment alignment = right!
boolean focusrectangle = false
end type

