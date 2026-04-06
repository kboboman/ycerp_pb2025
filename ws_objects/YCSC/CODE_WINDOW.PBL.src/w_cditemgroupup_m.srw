$PBExportHeader$w_cditemgroupup_m.srw
$PBExportComments$공정패턴 및 단위관리(1998/11/5,곽용덕)
forward
global type w_cditemgroupup_m from w_inheritance
end type
type rb_1 from radiobutton within w_cditemgroupup_m
end type
type rb_2 from radiobutton within w_cditemgroupup_m
end type
type rb_3 from radiobutton within w_cditemgroupup_m
end type
type gb_12 from groupbox within w_cditemgroupup_m
end type
type st_1 from statictext within w_cditemgroupup_m
end type
type em_1 from editmask within w_cditemgroupup_m
end type
end forward

global type w_cditemgroupup_m from w_inheritance
integer width = 3378
integer height = 2072
string title = "공정패턴 생산단위(w_cditemgroup_m)"
windowstate windowstate = normal!
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_12 gb_12
st_1 st_1
em_1 em_1
end type
global w_cditemgroupup_m w_cditemgroupup_m

type variables
st_print  i_print
string is_select,is_where,is_clause,is_init
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_filter
datawindowchild ldwc_code

is_select = dw_1.Describe("DataWindow.Table.Select")
is_clause = " where groupitem.P1 = ~~'G~~'"
is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"

wf_retrieve(dw_1,is_where)

ls_filter = "gubun = 'G'"

dw_1.getchild('p2',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

dw_1.getchild('p4',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

ls_filter = "gubun <> 'M'"

dw_1.getchild('p3',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

end event

on w_cditemgroupup_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_12=create gb_12
this.st_1=create st_1
this.em_1=create em_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.gb_12
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_1
end on

on w_cditemgroupup_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_12)
destroy(this.st_1)
destroy(this.em_1)
end on

event resize;call super::resize;//
gb_2.height  = this.height - 360

dw_1.height  = this.height - 472
end event

type pb_save from w_inheritance`pb_save within w_cditemgroupup_m
integer x = 2907
integer y = 48
integer taborder = 30
end type

event pb_save::clicked;long ll_row,ll_rowcount,k
dwItemStatus l_status
string ls_item
integer li_pat
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then
	return
end if

if isnull(dw_1.object.source[ll_row]) or &
	dw_1.object.source[ll_row] = "" or dw_1.object.source[ll_row] = " " then
	messagebox("확인","물품구분필드가 입력되지 않았습니다!")
	return
end if
if rb_2.checked = true then
   ll_rowcount = dw_1.rowcount()
	for k = 1 to ll_rowcount
		l_status = dw_1.GetItemStatus(k,0, Primary!)
		if l_status = newmodified! or l_status = datamodified! then
			ls_item = trim(dw_1.object.item_no[k])
			li_pat = dw_1.object.pat_no[k]
			update itempattern set pat_no = :li_pat where item_no = :ls_item;
			if sqlca.sqlcode < 0 then
				messagebox('오류',sqlca.sqlerrtext,exclamation!)
				rollback;
				return
			end if
		end if
	next
end if

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cditemgroupup_m
integer x = 59
integer y = 308
integer width = 3218
integer height = 1600
integer taborder = 60
string dataobject = "d_cditemgroupup_m"
boolean hscrollbar = false
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

type dw_2 from w_inheritance`dw_2 within w_cditemgroupup_m
boolean visible = false
integer x = 1385
integer y = 40
integer width = 110
integer height = 176
integer taborder = 70
string dataobject = "d_cditemgroup_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_title from w_inheritance`st_title within w_cditemgroupup_m
integer y = 32
integer width = 1303
string text = "공정패턴 생산단위"
end type

type st_tips from w_inheritance`st_tips within w_cditemgroupup_m
end type

type pb_compute from w_inheritance`pb_compute within w_cditemgroupup_m
boolean visible = false
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_cditemgroupup_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cditemgroupup_m
integer x = 3099
integer y = 48
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cditemgroupup_m
boolean visible = false
integer x = 2885
integer taborder = 120
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
string ls_type

if dw_1.rowcount() < 1 then
	return
elseif rb_1.checked = true then
	ls_type = 'G'
elseif rb_2.checked = true then
	ls_type = 'P'
elseif rb_3.checked = true then
	ls_type = 'J'
end if

dw_2.reset()
dw_2.retrieve(ls_type)

i_print.st_datawindow = dw_2
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 물품그룹를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cditemgroupup_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_cditemgroupup_m
boolean visible = false
integer x = 2501
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_cditemgroupup_m
boolean visible = false
integer x = 2693
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cditemgroupup_m
boolean visible = false
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_cditemgroupup_m
integer x = 2043
integer y = 32
integer width = 800
integer height = 176
integer taborder = 80
integer textsize = -8
long textcolor = 0
string text = "물품코드"
end type

type gb_2 from w_inheritance`gb_2 within w_cditemgroupup_m
integer x = 23
integer y = 232
integer width = 3291
integer height = 1712
integer taborder = 90
integer textsize = -10
integer weight = 400
long textcolor = 0
string text = "물품그룹"
end type

type gb_1 from w_inheritance`gb_1 within w_cditemgroupup_m
integer x = 2880
integer y = 8
integer width = 430
integer taborder = 40
end type

type rb_1 from radiobutton within w_cditemgroupup_m
integer x = 1481
integer y = 100
integer width = 160
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "G"
boolean checked = true
end type

event clicked;string ls_filter
datawindowchild ldwc_code

is_clause = " where groupitem.P1 = ~~'G~~'" &
          + " order by groupitem.item_no asc" 
is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"

ls_filter = "gubun = 'G'"

dw_1.getchild('p2',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

dw_1.getchild('p4',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

ls_filter = "gubun <> 'M'"

dw_1.getchild('p3',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

wf_retrieve(dw_1,is_where)
end event

type rb_2 from radiobutton within w_cditemgroupup_m
integer x = 1650
integer y = 100
integer width = 169
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "P"
end type

event clicked;string ls_filter
datawindowchild ldwc_code

is_clause = " where groupitem.P1 = ~~'P~~'" &
          + " order by groupitem.item_no asc"
is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"

ls_filter = "gubun = 'P'"

dw_1.getchild('p2',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

dw_1.getchild('p4',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

ls_filter = "gubun <> 'M'"

dw_1.getchild('p3',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

wf_retrieve(dw_1,is_where)
end event

type rb_3 from radiobutton within w_cditemgroupup_m
integer x = 1819
integer y = 100
integer width = 160
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "M"
end type

event clicked;string ls_filter
datawindowchild ldwc_code

is_clause = " where groupitem.P1 = ~~'M~~'" &
          + " order by groupitem.item_no asc"
is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"

ls_filter = "gubun = 'M'"

dw_1.getchild('p2',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

dw_1.getchild('p4',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

ls_filter = "gubun = 'M'"

dw_1.getchild('p3',ldwc_code)
ldwc_code.SetFilter(ls_filter)
ldwc_code.Filter( )

wf_retrieve(dw_1,is_where)
end event

type gb_12 from groupbox within w_cditemgroupup_m
integer x = 1445
integer y = 32
integer width = 567
integer height = 176
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "물품구분"
end type

type st_1 from statictext within w_cditemgroupup_m
integer x = 2080
integer y = 104
integer width = 155
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "검색"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within w_cditemgroupup_m
integer x = 2254
integer y = 80
integer width = 549
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!"
end type

event modified;string ls_str,ls_filter
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

if trim(em_1.text) = '%' then
   ls_str = '%'	
else
	ls_str = trim(em_1.text) + '%'
end if

ls_filter= "item_no like '" + ls_str + "'"
dw_1.SetFilter(ls_filter)
dw_1.Filter( )

end event

