$PBExportHeader$w_cdareacar_m.srw
$PBExportComments$권역관리(2020/03/11, 조원석)
forward
global type w_cdareacar_m from w_inheritance
end type
type st_3 from statictext within w_cdareacar_m
end type
type ddlb_fld from dropdownlistbox within w_cdareacar_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdareacar_m
end type
type st_4 from statictext within w_cdareacar_m
end type
type sle_value from singlelineedit within w_cdareacar_m
end type
type cb_1 from commandbutton within w_cdareacar_m
end type
type cb_2 from commandbutton within w_cdareacar_m
end type
type cb_3 from commandbutton within w_cdareacar_m
end type
type cb_5 from commandbutton within w_cdareacar_m
end type
type ddlb_op from dropdownlistbox within w_cdareacar_m
end type
type tab_1 from tab within w_cdareacar_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_2 from userobject within tab_1
end type
type st_1 from statictext within tabpage_2
end type
type dw_7 from datawindow within tabpage_2
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
st_1 st_1
dw_7 dw_7
pb_delete_row pb_delete_row
pb_insert_row pb_insert_row
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
end type
type tab_1 from tab within w_cdareacar_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_cdareacar_m from w_inheritance
integer width = 5074
integer height = 2564
string title = "권역관리(w_cdareacar_m)"
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
end type
global w_cdareacar_m w_cdareacar_m

type variables
st_print  i_print
integer  i_tabpage
string    is_dw, is_area_no
end variables

on w_cdareacar_m.create
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
end on

on w_cdareacar_m.destroy
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
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

tab_1.tabpage_1.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_6.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_7.SetTransObject(SQLCA)


ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

i_tabpage = 2
is_dw = 'dw6'

GF_DWTitle2ddlb( tab_1.tabpage_1.dw_3, ddlb_fld, ddlb_dwtitles )


if i_tabpage = 1 then

	tab_1.tabpage_1.dw_3.retrieve()
	dw_2.retrieve()
	
else
	
	tab_1.tabpage_2.dw_6.retrieve()

end if

end event

event resize;call super::resize;//
tab_1.width  = newwidth  - 78
tab_1.height = newheight - 468

tab_1.tabpage_1.dw_3.width  = newwidth  - 78
tab_1.tabpage_1.dw_3.height = newheight - 598

tab_1.tabpage_2.dw_4.width = newwidth - 78

tab_1.tabpage_2.dw_6.height = newheight - 598

tab_1.tabpage_2.dw_7.width = newwidth - tab_1.tabpage_2.dw_5.width - 78
tab_1.tabpage_2.dw_7.height = newheight - tab_1.tabpage_2.dw_4.height - 798

tab_1.tabpage_2.dw_5.height = tab_1.tabpage_2.dw_7.height



end event

type pb_save from w_inheritance`pb_save within w_cdareacar_m
integer x = 3515
integer y = 60
end type

event pb_save::clicked;
string ls_area_code, ls_area_name
long    l_rowcount, ll_row

dwItemStatus l_status

tab_1.tabpage_2.dw_4.accepttext()
tab_1.tabpage_2.dw_5.accepttext()

tab_1.tabpage_1.dw_3.accepttext()
tab_1.tabpage_2.dw_4.accepttext()
tab_1.tabpage_2.dw_5.accepttext()
//===============사용자별 프로그램 사용현황==================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//===================================================================

if i_tabpage = 1 then
	
	wf_update1(tab_1.tabpage_1.dw_3,"Y")
	
else	
		
	ls_area_name = tab_1.tabpage_2.dw_4.object.area_name[1] 
	ls_area_code = tab_1.tabpage_2.dw_4.object.area_code[1] 
	
	l_rowcount = tab_1.tabpage_2.dw_5.rowcount()
	
	for ll_row = 1 to l_rowcount
		
		l_status =tab_1.tabpage_2.dw_5.GetItemStatus(ll_row, 0, Primary!)
		
		if l_status = NewModified! then
			
			tab_1.tabpage_2.dw_5.object.area_code[ll_row] = ls_area_code
			tab_1.tabpage_2.dw_5.object.area_name[ll_row] = ls_area_name
			
		else
			tab_1.tabpage_2.dw_5.object.area_name[ll_row] = ls_area_name
		end if
		
	next			
	
	wf_update3(tab_1.tabpage_2.dw_4, tab_1.tabpage_2.dw_5, tab_1.tabpage_2.dw_7, "Y")
	
end if
end event

type dw_1 from w_inheritance`dw_1 within w_cdareacar_m
boolean visible = false
integer x = 4064
integer y = 88
integer width = 503
integer height = 188
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

type st_title from w_inheritance`st_title within w_cdareacar_m
integer x = 91
integer y = 40
integer width = 1175
string text = "권역관리"
end type

type st_tips from w_inheritance`st_tips within w_cdareacar_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdareacar_m
boolean visible = false
integer taborder = 110
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdareacar_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdareacar_m
integer x = 3707
integer y = 60
integer taborder = 130
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdareacar_m
integer x = 3323
integer y = 60
integer taborder = 160
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

if i_tabpage = 1 then

	dw_2.retrieve()
	i_print.st_datawindow = dw_2
	i_print.st_print_sheet = " 프린트용지 : A4"
	i_print.st_print_desc = " 이 프로그램은 조업자재 코드내역을 출력합니다." 
	
	gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=58'
	opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)

else
	
end if
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdareacar_m
boolean visible = false
integer taborder = 190
end type

type pb_delete from w_inheritance`pb_delete within w_cdareacar_m
integer x = 3131
integer y = 60
integer taborder = 210
end type

event pb_delete::clicked;long ll_no, ll_row, l_rowcount
integer  l_net
string ls_area_name


if i_tabpage = 1 then
	
	tab_1.tabpage_1.dw_3.accepttext()
	if tab_1.tabpage_1.dw_3.getrow() < 1 then return
	
	tab_1.tabpage_1.dw_3.deleterow(tab_1.tabpage_1.dw_3.getrow())
	
	wf_update1(tab_1.tabpage_1.dw_3,"N")

else
	
		ls_area_name = tab_1.tabpage_2.dw_4.object.area_name[1] 	

		l_net = MessageBox("경고", ls_area_name + ' 권역을 삭제하시겠습니까?', Exclamation!, OKCancel!, 2)
		
		IF l_net = 1 THEN 
		
			 if tab_1.tabpage_2.dw_4.getrow() < 1 then return		
			 
			tab_1.tabpage_2.dw_4.deleterow(tab_1.tabpage_2.dw_4.getrow())
			
			l_rowcount = tab_1.tabpage_2.dw_5.rowcount()			
			
			for ll_row = 1 to l_rowcount
				tab_1.tabpage_2.dw_5.deleterow(1)			
			next			
			
			wf_update2(tab_1.tabpage_2.dw_4, tab_1.tabpage_2.dw_5,"N")		
			
			messagebox('알림', '삭제완료했습니다.')
		
		END IF
		
	
end if
end event

type pb_insert from w_inheritance`pb_insert within w_cdareacar_m
integer x = 2939
integer y = 60
integer taborder = 230
end type

event pb_insert::clicked;long ll_row
string ls_currcode, ls_area_code


if i_tabpage = 1 then
	
	tab_1.tabpage_1.dw_3.accepttext()
	ll_row = tab_1.tabpage_1.dw_3.insertrow(0)
	tab_1.tabpage_1.dw_3.ScrollToRow(ll_row)
	tab_1.tabpage_1.dw_3.setcolumn('area_name')
	tab_1.tabpage_1.dw_3.setfocus()

else
	
	
	
	tab_1.tabpage_2.dw_4.reset()
	tab_1.tabpage_2.dw_5.reset()		
	tab_1.tabpage_2.dw_7.reset()
	
	ll_row = tab_1.tabpage_2.dw_4.insertrow(0)
	tab_1.tabpage_2.dw_4.ScrollToRow(ll_row)
	
	
	 select (
				case  when   len(isnull( max(substring(area_code,1,4)) , 0) + 1) = 1 then '000' + convert(char(1), isnull( max(substring(area_code,1,4)) , 0) + 1)
						when  len(isnull( max(substring(area_code,1,4)) , 0) + 1) = 2 then '00' + convert(char(2), isnull( max(substring(area_code,1,4)) , 0) + 1)
						when  len(isnull( max(substring(area_code,1,4)) , 0) + 1) = 3 then '0' + convert(char(3), isnull( max(substring(area_code,1,4)) , 0) + 1) 
						when  len(isnull( max(substring(area_code,1,4)) , 0) + 1) = 4 then convert(char(4), isnull( max(substring(area_code,1,4)) , 0) + 1)	
				  end 
			 ) area_code
			into :ls_area_code
	from car_area
    where country_code = '0000';

	tab_1.tabpage_2.dw_4.object.area_code[1] = ls_area_code
	tab_1.tabpage_2.dw_4.object.country_code[1] = '0000'
	
	tab_1.tabpage_2.dw_4.setcolumn('area_name')
	tab_1.tabpage_2.dw_4.setfocus()		
	
end if
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdareacar_m
integer x = 2747
integer y = 60
integer taborder = 220
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

if i_tabpage = 1 then

	tab_1.tabpage_1.dw_3.retrieve()
	dw_2.retrieve()
	
else
	
	tab_1.tabpage_2.dw_6.retrieve()

end if
end event

type gb_3 from w_inheritance`gb_3 within w_cdareacar_m
boolean visible = false
integer x = 1632
integer y = 12
integer width = 594
integer height = 204
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_cdareacar_m
integer y = 244
integer width = 3913
integer height = 168
integer taborder = 90
integer textsize = -10
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdareacar_m
integer x = 2697
integer y = 16
integer width = 1248
integer height = 212
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdareacar_m
boolean visible = false
integer x = 1353
integer y = 72
integer width = 119
integer height = 148
integer taborder = 60
string dataobject = "d_cbcustbidding_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::itemchanged;call super::itemchanged;string ls_currcode

this.accepttext()
ls_currcode = this.object.curr_type[1]
dw_1.retrieve(ls_currcode)
end event

type st_3 from statictext within w_cdareacar_m
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

type ddlb_fld from dropdownlistbox within w_cdareacar_m
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

type ddlb_dwtitles from dropdownlistbox within w_cdareacar_m
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

type st_4 from statictext within w_cdareacar_m
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

type sle_value from singlelineedit within w_cdareacar_m
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

type cb_1 from commandbutton within w_cdareacar_m
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

type cb_2 from commandbutton within w_cdareacar_m
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

type cb_3 from commandbutton within w_cdareacar_m
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

type cb_5 from commandbutton within w_cdareacar_m
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

type ddlb_op from dropdownlistbox within w_cdareacar_m
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

type tab_1 from tab within w_cdareacar_m
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
integer selectedtab = 2
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
	is_dw = 'dw3'
else
	is_dw = 'dw4'
end if
end event

type tabpage_1 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 4933
integer height = 1868
boolean enabled = false
long backcolor = 79741120
string text = "운반비등록"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ExecuteSQL5!"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_1.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_1.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_1
integer x = 5
integer y = 8
integer width = 4928
integer height = 1860
integer taborder = 110
string title = "none"
string dataobject = "d_cbcustbidding_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string ls_cust_no, ls_cust_name, ls_top_level, ls_salesman_name, ls_kind
long   l_now_amt, l_pre_amt

	if  dwo.name = 'cust_no' then
		
		     ls_cust_no =trim(data)
		
//			select  a.cust_name,
//					 a.top_level,
//					 c.user_name salesman_name,
//					 b.now_amt,
//					 b.pre_amt
//			 into   :ls_cust_name, :ls_top_level, :ls_salesman_name, :l_now_amt, :l_pre_amt
//			from customer a with(nolock) left outer join (
//																				select  cust_no,  
//																						sum( case when datepart(year, opeom.eom_year) = datepart(year, getdate()) then ( inv_01 +
//																																																inv_02 +
//																																																inv_03 +
//																																																inv_04 +
//																																																inv_05 +
//																																																inv_06 +
//																																																inv_07 +
//																																																inv_08 +
//																																																inv_09 +
//																																																inv_10 +
//																																																inv_11 +
//																																																inv_12   ) else 0 end )/1000 now_amt,
//																													  
//																						sum( case when datepart(year, opeom.eom_year) = datepart(year, DATEADD(year, -1,  getdate())) then (   inv_01 +
//																																																							 inv_02 +
//																																																							 inv_03 +
//																																																							 inv_04 +
//																																																							 inv_05 +
//																																																							 inv_06 +
//																																																							 inv_07 +
//																																																							 inv_08 +
//																																																							 inv_09 +
//																																																							 inv_10 +
//																																																							 inv_11 +
//																																																							 inv_12   ) else 0 end )/1000 pre_amt
//																			from opeom with(nolock)
//																			where datepart(year, opeom.eom_year) in ( datepart(year, getdate()) ,  datepart(year, DATEADD(year, -1,  getdate())) )
//																			group by cust_no
//																	) b on a.cust_no = b.cust_no
//												  left outer join login c with(nolock) on a.salesman  = c.user_id
//			where a.cust_no = :ls_cust_no;

			select      	a.kind,     
							a.cust_name,
							a.top_level,
							a.salesman_name,
							a.now_amt,
							a.pre_amt
						  into :ls_kind,  :ls_cust_name, :ls_top_level, :ls_salesman_name, :l_now_amt, :l_pre_amt
			from 
			  (                                
													  select      	  '거래처' kind,
													  				  opeom.cust_no,  
																	  customer.cust_name,
																			 customer.top_level,
																			 login.user_name salesman_name,
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
																			from opeom with(nolock) inner join customer with(nolock) on opeom.cust_no = customer.cust_no
																												inner join login with(nolock) on customer.salesman = login.user_id
																			where datepart(year, opeom.eom_year) in ( datepart(year, getdate()) ,  datepart(year, DATEADD(year, -1,  getdate())) )
															and  customer.open_close <> 'C'
/*														  and  not  exists (      
																									  select * from head_customer e with(nolock)
																									  where e.cust_no = opeom.cust_no      
																								)      
*/																								
																			group by opeom.cust_no,  customer.cust_name,	customer.top_level,	login.user_name
													  union all
													  select   			 '본점' kind,
													  					a.head_cust_no cust_no,
																		a.head_cust_name cust_name,
																			 max(c.top_level) top_level,
																			 max(d.user_name) salesman_name,
																						sum( case when datepart(year, b.eom_year) = datepart(year, getdate()) then ( inv_01 +
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
																														  
																							sum( case when datepart(year, b.eom_year) = datepart(year, DATEADD(year, -1,  getdate())) then (   inv_01 +
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
																from head_customer a with(nolock) inner join opeom b with(nolock) on a.cust_no = b.cust_no 
																																				inner join customer c with(nolock) on a.cust_no = c.cust_no
																																				inner join login d with(nolock) on c.salesman = d.user_id
																where datepart(year, b.eom_year) in ( datepart(year, getdate()) ,  datepart(year, DATEADD(year, -1,  getdate())) )          
																	and c.open_close <> 'C'
													  group by a.head_cust_no, a.head_cust_name
			  ) a  
  			where a.cust_no = :ls_cust_no;
			  
		     this.object.kind[row] = ls_kind
			this.object.top_level[row] = ls_top_level
			this.object.salesman_name[row] = ls_salesman_name
			this.object.now_amt[row] = l_now_amt
			this.object.pre_amt[row] = l_pre_amt			

	end if
end event

event clicked;is_dw = 'dw3'
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4933
integer height = 1868
long backcolor = 79741120
string text = "권역,지역관리"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ArrangeTables5!"
long picturemaskcolor = 536870912
st_1 st_1
dw_7 dw_7
pb_delete_row pb_delete_row
pb_insert_row pb_insert_row
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
end type

on tabpage_2.create
this.st_1=create st_1
this.dw_7=create dw_7
this.pb_delete_row=create pb_delete_row
this.pb_insert_row=create pb_insert_row
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.Control[]={this.st_1,&
this.dw_7,&
this.pb_delete_row,&
this.pb_insert_row,&
this.dw_6,&
this.dw_5,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.st_1)
destroy(this.dw_7)
destroy(this.pb_delete_row)
destroy(this.pb_insert_row)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
end on

type st_1 from statictext within tabpage_2
integer x = 3525
integer y = 388
integer width = 1413
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "※차량종류 추가 필요시 전산팀 요청"
boolean focusrectangle = false
end type

type dw_7 from datawindow within tabpage_2
integer x = 3506
integer y = 480
integer width = 1413
integer height = 1352
integer taborder = 70
string title = "none"
string dataobject = "d_cdareacar_m3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;is_dw = 'dw7'
end event

type pb_delete_row from picturebutton within tabpage_2
integer x = 1957
integer y = 368
integer width = 183
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;long l_rowcount, ll_row

if tab_1.tabpage_2.dw_5.getrow() < 1 then return				
tab_1.tabpage_2.dw_5.deleterow(tab_1.tabpage_2.dw_5.getrow())

l_rowcount = tab_1.tabpage_2.dw_7.rowcount()			

for ll_row = 1 to l_rowcount
	tab_1.tabpage_2.dw_7.deleterow(1)			
next


wf_update2(tab_1.tabpage_2.dw_5, tab_1.tabpage_2.dw_7,"N")

messagebox('알림', '삭제완료했습니다.')
end event

type pb_insert_row from picturebutton within tabpage_2
integer x = 1755
integer y = 368
integer width = 183
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event clicked;long ll_row, l_row
string ls_country_code, ls_area_code, ls_area_name

tab_1.tabpage_2.dw_4.accepttext()

tab_1.tabpage_2.dw_7.reset()

l_row = tab_1.tabpage_2.dw_5.rowcount()
ll_row = tab_1.tabpage_2.dw_5.insertrow(0)

if l_row = 0 then
	l_row = 1
else
	l_row = long(tab_1.tabpage_2.dw_5.object.country_code[l_row])+1
end if


ls_area_code = tab_1.tabpage_2.dw_4.object.area_code[1] 
ls_area_name = tab_1.tabpage_2.dw_4.object.area_name[1] 

tab_1.tabpage_2.dw_5.ScrollToRow(ll_row)

 select (
			case  when   len(:l_row) = 1 then '000' + convert(char(1), :l_row)
					when  len(:l_row) = 2 then '00' + convert(char(2), :l_row)
					when  len(:l_row) = 3 then '0' + convert(char(3), :l_row) 
					when  len(:l_row) = 4 then convert(char(4), :l_row)	
			  end 
		 ) area_code
		into :ls_country_code
from dual;

tab_1.tabpage_2.dw_5.object.area_code[ll_row]  = ls_area_code
tab_1.tabpage_2.dw_5.object.area_name[ll_row]  = ls_area_name
tab_1.tabpage_2.dw_5.object.country_code[ll_row]  = ls_country_code
tab_1.tabpage_2.dw_5.setcolumn('country_name')
tab_1.tabpage_2.dw_5.setfocus()
end event

type dw_6 from datawindow within tabpage_2
integer y = 12
integer width = 1659
integer height = 1824
integer taborder = 110
string title = "none"
string dataobject = "d_cdareacar_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_head_cust_no

is_dw = 'dw6'

is_area_no = tab_1.tabpage_2.dw_6.object.area_code[row]

This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)

tab_1.tabpage_2.dw_4.retrieve(is_area_no)
tab_1.tabpage_2.dw_5.retrieve(is_area_no)
end event

type dw_5 from datawindow within tabpage_2
integer x = 1664
integer y = 484
integer width = 1833
integer height = 1352
integer taborder = 60
string title = "none"
string dataobject = "d_cdareacar_m2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_area_code, ls_country_code

is_dw = 'dw5'

tab_1.tabpage_2.dw_5.accepttext()

ls_area_code 	  = tab_1.tabpage_2.dw_5.object.area_code[row]
ls_country_code = tab_1.tabpage_2.dw_5.object.country_code[row]

insert into car_country
SELECT :ls_area_code area_code,
			:ls_country_code country_code,
			a.item_cd,
			null amt,
			null bigo
 FROM codemst a
where a.type = 'car_gbn'
and a.use_yn = 'Y'
and not exists (
									  select b.area_code, b.country_code, b.car_kind
									  from car_country b
									  where b.area_code = :ls_area_code
										  and  b.country_code = :ls_country_code
										  and  b.car_kind = a.item_cd
				   );
					
					
tab_1.tabpage_2.dw_7.retrieve(ls_area_code, ls_country_code)
end event

type dw_4 from datawindow within tabpage_2
integer x = 1664
integer y = 12
integer width = 3264
integer height = 356
integer taborder = 10
string title = "none"
string dataobject = "d_cdareacar_m"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw4'
end event

