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
type rb_4 from radiobutton within w_cditemgroup_m
end type
type st_1 from statictext within w_cditemgroup_m
end type
type st_3 from statictext within w_cditemgroup_m
end type
type st_4 from statictext within w_cditemgroup_m
end type
type sle_value from singlelineedit within w_cditemgroup_m
end type
type cb_1 from commandbutton within w_cditemgroup_m
end type
type cb_2 from commandbutton within w_cditemgroup_m
end type
type cb_3 from commandbutton within w_cditemgroup_m
end type
type cb_5 from commandbutton within w_cditemgroup_m
end type
type ddlb_fld from dropdownlistbox within w_cditemgroup_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cditemgroup_m
end type
type dw_3 from datawindow within w_cditemgroup_m
end type
type st_vertical from u_splitbar_vertical within w_cditemgroup_m
end type
type ddlb_op from dropdownlistbox within w_cditemgroup_m
end type
type st_2 from statictext within w_cditemgroup_m
end type
type st_5 from statictext within w_cditemgroup_m
end type
type st_6 from statictext within w_cditemgroup_m
end type
type st_7 from statictext within w_cditemgroup_m
end type
type st_8 from statictext within w_cditemgroup_m
end type
type r_1 from rectangle within w_cditemgroup_m
end type
end forward

global type w_cditemgroup_m from w_inheritance
integer x = 5
integer y = 148
integer width = 5211
integer height = 2240
string title = "물품그룹 관리(w_cditemgroup_m)"
boolean center = true
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_1 st_1
st_3 st_3
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
dw_3 dw_3
st_vertical st_vertical
ddlb_op ddlb_op
st_2 st_2
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
r_1 r_1
end type
global w_cditemgroup_m w_cditemgroup_m

type variables
st_print i_print
string   is_sortcolumn, is_sortorder, is_colname, is_coltype, is_op, is_init
datetime id_date
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject(dw_3)
st_vertical.of_set_rightobject(dw_1)
st_vertical.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.SetTransObject(SQLCA)

dw_2.visible = false

//
if GF_Permission('물품그룹관리자', gs_userid) = 'Y' then	
else
	pb_save.enabled   = false
	pb_insert.enabled = false
end if

if GF_Permission('물품그룹사용여부관리', gs_userid) = 'Y' then	
	dw_1.Object.use_flag.TabSequence = 20
end if

pb_retrieve.PostEvent( clicked! )

end event

on w_cditemgroup_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.dw_3=create dw_3
this.st_vertical=create st_vertical
this.ddlb_op=create ddlb_op
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.ddlb_fld
this.Control[iCurrent+14]=this.ddlb_dwtitles
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.st_vertical
this.Control[iCurrent+17]=this.ddlb_op
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_6
this.Control[iCurrent+21]=this.st_7
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.r_1
end on

on w_cditemgroup_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.dw_3)
destroy(this.st_vertical)
destroy(this.ddlb_op)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.r_1)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_3.height = newheight - dw_3.y - gb_2.x

st_vertical.x      = dw_3.x + dw_3.width
st_vertical.height = dw_3.height

dw_1.x      = st_vertical.x + st_vertical.width
dw_1.width  = newwidth  - dw_1.x - gb_2.x
dw_1.height = newheight - dw_1.y - gb_2.x


end event

event closequery;call super::closequery;DELETE create_item

COMMIT;
end event

type pb_save from w_inheritance`pb_save within w_cditemgroup_m
integer x = 2711
integer y = 56
integer taborder = 30
end type

event pb_save::clicked;dwItemStatus l_status
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
//	ls_item = left(dw_1.object.item_no[k],1)
	if trim(dw_1.object.p1[k]) = "P" and dw_1.object.source[k] = "B" then
		if id_date = dw_1.object.sys_date[k] then
			MessageBox("확인",string(k) + "행 제품코드인 경우는 출처를 '구매품'으로 처리할 수 없습니다.")
			return
		else
			// 이전에 만든 품목들은 SKIP함
		end if
	end if
next

//if rb_2.checked = true then
//   ll_rowcount = dw_1.rowcount()
//	for k = 1 to ll_rowcount
//		l_status = dw_1.GetItemStatus(k,0, Primary!)
//		if l_status = newmodified! or l_status = datamodified! then
//			ls_item = trim(dw_1.object.item_no[k])
//			li_pat  = dw_1.object.pat_no[k]
//			
//			UPDATE itempattern SET pat_no = :li_pat WHERE item_no = :ls_item;
//			if sqlca.sqlcode < 0 then
//				MessageBox('오류',sqlca.sqlerrtext,exclamation!)
//				rollback;
//				return
//			end if
//		end if
//	next
//end if



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
			
//				ld_sys_date = datetime(date('1900/01/01'));
			
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
integer x = 1879
integer y = 400
integer width = 2373
integer height = 1684
integer taborder = 60
string dataobject = "d_cditemgroup_m"
boolean hsplitscroll = true
end type

event dw_1::itemchanged;call super::itemchanged;string ls_item, ls_code, ls_str, ls_null

setnull( ls_null )
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
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//			
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)
	CASE 'p2'
        ls_item = trim(this.object.p1[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
	CASE 'p3'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(data) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
	CASE 'p4'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
//	CASE 'p5'
//		  ls_code = trim(data)
//		  if len(ls_code) = 3 then
//			  if mid(ls_code,2,1) = ' ' then
//				  return 1
//			  end if
//		  else
//			  return 1
//		  end if
//        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
//        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
//        ls_item = ls_item + trim(data) + trim(this.object.p6[row])
//        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
//        this.object.item_no[row] = ls_item
	CASE 'p6'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(data)
        ls_item = ls_item + trim(this.object.p7[row]) + trim(this.object.p8[row])
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
	CASE 'p7'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(data) + trim(this.object.p8[row])
	   
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
	CASE 'p8'
        ls_item = trim(this.object.p1[row]) + trim(this.object.p2[row])
        ls_item = ls_item + trim(this.object.p3[row]) + trim(this.object.p4[row])
        ls_item = ls_item + trim(this.object.p5[row]) + trim(this.object.p6[row])
        ls_item = ls_item + trim(this.object.p7[row]) + trim(data)
		  
//	   select dbo.uf_item_create(:ls_item) 
//		 into :ls_item
//	   from dual;
//		
//        this.object.item_no[row] = ls_item
//	   this.object.p5[row] = mid(ls_item, 5,3)		  
		  
	case 'ysp_calctype'
		if trim(data) = "" then
			this.object.ysp_calctype[row] = ls_null
		end if
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
string ls_colname, ls_sortstr
long   ll_strlen

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
//ls_colname = dwo.name
//
//if right(ls_colname, 2) = "_t" then // column header 선택		
//	ll_strlen  = len(ls_colname) - 2
//	ls_sortstr = left(ls_colname, ll_strlen)
//
//	//
//	if	is_sortcolumn = ls_sortstr then
//		if is_sortorder = "A" then
//			is_sortcolumn= ls_sortstr
//			is_sortorder = "D"
//		elseif is_sortorder = "D" then
//			is_sortcolumn= ls_sortstr
//			is_sortorder = "A"
//		else
//			is_sortcolumn= ls_sortstr
//			is_sortorder = "A"
//		end if
//	else
//		is_sortcolumn= ls_sortstr
//		is_sortorder = "A"
//	end if
//
//	// 기본 Sort
//	this.SetSort( is_sortcolumn + " " + is_sortorder )		// dw_1.SetSort( "#1 A, #2 D" )
//	this.Sort()		
//else											// column data 선택
//	// 필터하기
//	string ls_type, ls_op, ls_text
//
//	ls_colname= dwo.name
//	if ls_colname = "compute_1" then ls_colname = "qa"
//	
//	ls_type    = this.Describe(ls_colname + ".coltype")
//	ls_op      = "="
//	
//	choose case left(ls_type,4)
//		case "char"
//			ls_op   = "LIKE"
//			ls_text = string( this.GetItemString( row, ls_colname ) )
//		case "deci"
//			ls_op   = "="
//			ls_text = string( this.GetItemDecimal( row, ls_colname ) )
//		case "numb", "long"
//			ls_op   = "="
//			ls_text = string( this.GetItemNumber( row, ls_colname ) ) 		
//		case "time"
//			ls_op   = "="
//			ls_text = string( this.GetItemTime( row, ls_colname ) )
//		case "date"
//			ls_op   = ">="
//			if ls_type = "datetime" then
//				ls_text = string( this.GetItemDateTime( row, ls_colname ) )		
//			else
//				ls_text = string( this.GetItemDate( row, ls_colname ) )
//			end if
//	end choose
//	
//	//dw_r.object.value[1] = ls_text
//	is_colname = ls_colname
//	is_coltype = ls_type
//	is_op      = ls_op
//	this.setfocus()
//end if

end event

type st_title from w_inheritance`st_title within w_cditemgroup_m
integer x = 41
integer y = 32
integer width = 987
integer height = 132
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
integer x = 2907
integer y = 56
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemgroup_m
integer x = 2514
integer y = 56
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
integer x = 2318
integer y = 56
integer taborder = 150
end type

event pb_delete::clicked;call super::clicked;// 삭제
string ls_itemno
long   ll_row, ll_cnt

ll_row     = dw_1.getrow()
ls_itemno  = dw_1.object.item_no[ll_row]

SELECT count(*) INTO :ll_cnt FROM inspdet WHERE ITEM_NO = :ls_itemno;
if ll_cnt < 1 then
	SELECT count(*) INTO :ll_cnt FROM purdet WHERE ITEM_NO = :ls_itemno;
	if ll_cnt < 1 then
		SELECT count(*) INTO :ll_cnt FROM saledet WHERE ITEM_NO = :ls_itemno;
		if ll_cnt < 1 then
			dw_1.DeleteRow( ll_row )
			WF_Update1( dw_1, "Y" )
		else
			MessageBox("확인","수주상세 항목에서 " + string(ll_cnt) + "건 사용중입니다.")
		end if
	else
		MessageBox("확인","발주상세 항목에서 " + string(ll_cnt) + "건 사용중입니다.")
	end if
else
	MessageBox("확인","입고상세 항목에서 " + string(ll_cnt) + "건 사용중입니다.")
end if

end event

type pb_insert from w_inheritance`pb_insert within w_cditemgroup_m
integer x = 2121
integer taborder = 170
end type

event pb_insert::clicked;//
long   ll_row
string ls_item
datetime ld_sys_date

dw_2.accepttext()

ll_row = dw_1.insertrow(dw_1.getrow())
dw_1.ScrollToRow(ll_row)

id_date = datetime(date(string(today(),'yyyy/mm/dd')))

dw_1.object.sys_date[ll_row] = id_date

dw_1.accepttext()

//ls_item = trim(dw_1.object.item_no[ll_row])
//if rb_1.checked = true then
//	is_init = 'G' + mid(ls_item,2,9)
//	dw_1.object.P1[ll_row] = 'G'
//end if
//if rb_2.checked = true then
//	is_init = 'P' + mid(ls_item,2,9)
//	dw_1.object.P1[ll_row] = 'P'
//end if
//if rb_3.checked = true then
//	is_init = 'M' + mid(ls_item,2,9)
//	dw_1.object.P1[ll_row] = 'M'
//end if
//if rb_4.checked = true then /* 2021.05.11 jowonsuk 전체인데 제품으로 */
//	is_init = 'P' + mid(ls_item,2,9)
//	dw_1.object.P1[ll_row] = 'P'
//end if

/* 2021.05.11 jowonsuk 전체인데 제품으로.시작 */
//ls_item = trim(dw_1.object.p1[ll_row]) + trim(dw_1.object.p2[ll_row])
//ls_item = ls_item + trim(dw_1.object.p3[ll_row]) + trim(dw_1.object.p4[ll_row])
//ls_item = ls_item + trim('000') + trim(dw_1.object.p6[ll_row])
//ls_item = ls_item + trim(dw_1.object.p7[ll_row]) + trim(dw_1.object.p8[ll_row])
/* 2021.05.11 jowonsuk 전체인데 제품으로.끝 */
dw_1.object.use_flag[ll_row] = 'Y'
//dw_1.object.item_no[ll_row]  = is_init
//dw_1.object.item_no[ll_row] = ls_item
//dw_1.object.p5[ll_row] = mid(ls_item, 5,3)	
//dw_1.object.user_id[ll_row]  = gs_userid
//dw_1.setcolumn('item_no')  //  (1)은  데이타윈도우의 첫번째 column을 가르킨다
//dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemgroup_m
integer x = 1925
integer y = 56
integer taborder = 160
end type

event pb_retrieve::clicked;//
string ls_clause

//
if rb_1.checked = true then		// 상품
	ls_clause = "G" 
elseif rb_2.checked = true then	// 제품	
	ls_clause = "P" 
elseif rb_3.checked = true then	// 자재
	ls_clause = "M" 
elseif rb_4.checked = true then	// 전체
	ls_clause = "%" 
end if

dw_1.setredraw( false )
dw_3.setredraw( false )

dw_1.Retrieve( ls_clause )
dw_3.Retrieve( ls_clause )

dw_1.setredraw( true )
dw_3.setredraw( true )

MessageBox("확인","작업완료")

end event

type gb_3 from w_inheritance`gb_3 within w_cditemgroup_m
integer x = 1088
integer y = 16
integer width = 782
integer height = 204
integer taborder = 90
integer textsize = -8
end type

type gb_2 from w_inheritance`gb_2 within w_cditemgroup_m
integer y = 240
integer width = 4219
integer height = 148
integer taborder = 100
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cditemgroup_m
integer x = 1893
integer y = 16
integer width = 1234
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_cditemgroup_m
integer x = 50
integer y = 196
integer width = 87
integer height = 60
integer taborder = 80
string dataobject = "d_cditemgroup_r"
boolean vscrollbar = false
end type

type rb_1 from radiobutton within w_cditemgroup_m
integer x = 1134
integer y = 136
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

event clicked;//
pb_retrieve.TriggerEvent( clicked! )

end event

type rb_2 from radiobutton within w_cditemgroup_m
integer x = 1367
integer y = 136
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

event clicked;//
pb_retrieve.TriggerEvent( clicked! )

end event

type rb_3 from radiobutton within w_cditemgroup_m
integer x = 1600
integer y = 136
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

event clicked;//
pb_retrieve.TriggerEvent( clicked! )

end event

type rb_4 from radiobutton within w_cditemgroup_m
integer x = 1134
integer y = 68
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
pb_retrieve.TriggerEvent( clicked! )

end event

type st_1 from statictext within w_cditemgroup_m
integer x = 2569
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

type st_3 from statictext within w_cditemgroup_m
integer x = 73
integer y = 296
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

type st_4 from statictext within w_cditemgroup_m
integer x = 690
integer y = 296
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

type sle_value from singlelineedit within w_cditemgroup_m
integer x = 1170
integer y = 284
integer width = 704
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

type cb_1 from commandbutton within w_cditemgroup_m
integer x = 1888
integer y = 288
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

debugbreak()

arg_dw  = dw_1
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

if ddlb_fld.text = "물품번호" OR ddlb_fld.text = "품명" then
	arg_dw  = dw_3
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
end if

end event

type cb_2 from commandbutton within w_cditemgroup_m
integer x = 2053
integer y = 288
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

arg_dw  = dw_1
GF_DW2UnFilter( arg_dw )

arg_dw  = dw_3
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

end event

type cb_3 from commandbutton within w_cditemgroup_m
integer x = 2217
integer y = 288
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

if ddlb_fld.text = "물품번호" OR ddlb_fld.text = "품명" then
	arg_dw  = dw_3
	GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )
end if

end event

type cb_5 from commandbutton within w_cditemgroup_m
integer x = 2382
integer y = 288
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

arg_dw  = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

if ddlb_fld.text = "물품번호" OR ddlb_fld.text = "품명" then
	arg_dw  = dw_3
	GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )
end if

end event

type ddlb_fld from dropdownlistbox within w_cditemgroup_m
integer x = 261
integer y = 280
integer width = 416
integer height = 632
integer taborder = 10
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

type ddlb_dwtitles from dropdownlistbox within w_cditemgroup_m
integer x = 279
integer y = 292
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

type dw_3 from datawindow within w_cditemgroup_m
integer x = 32
integer y = 400
integer width = 1787
integer height = 1684
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cditemgroup_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;////
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_itemno
long   ll_find

if isnull(row) OR row < 1 then RETURN

ls_itemno = this.object.item_no[row]

ll_find = dw_1.find( "item_no = '" + ls_itemno + "'", 1, dw_1.rowcount() )
if ll_find > 0 then
	dw_1.scrolltorow( ll_find )
end if

end event

type st_vertical from u_splitbar_vertical within w_cditemgroup_m
integer x = 1833
integer y = 400
integer height = 1684
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cditemgroup_m
integer x = 859
integer y = 280
integer width = 306
integer height = 500
integer taborder = 60
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

type st_2 from statictext within w_cditemgroup_m
integer x = 3173
integer y = 56
integer width = 599
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "M1S1 COIL"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cditemgroup_m
integer x = 3173
integer y = 108
integer width = 599
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
string text = "M3S1 스리팅 COIL"
boolean focusrectangle = false
end type

type st_6 from statictext within w_cditemgroup_m
integer x = 3173
integer y = 160
integer width = 599
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
string text = "M3S2 SHEET"
boolean focusrectangle = false
end type

type st_7 from statictext within w_cditemgroup_m
integer x = 3835
integer y = 80
integer width = 571
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "코일품목 만들때"
boolean focusrectangle = false
end type

type st_8 from statictext within w_cditemgroup_m
integer x = 3835
integer y = 136
integer width = 955
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "앞자리 4개로 반드시 시작함."
boolean focusrectangle = false
end type

type r_1 from rectangle within w_cditemgroup_m
integer linethickness = 6
long fillcolor = 67108864
integer x = 3662
integer y = 68
integer width = 165
integer height = 132
end type

