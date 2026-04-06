$PBExportHeader$w_person_list_bogo_r.srw
$PBExportComments$현장영업조회[조원석/2018/09/21]
forward
global type w_person_list_bogo_r from w_inheritance
end type
type pb_1 from picturebutton within w_person_list_bogo_r
end type
type pb_2 from picturebutton within w_person_list_bogo_r
end type
type st_3 from statictext within w_person_list_bogo_r
end type
type ddlb_fld from dropdownlistbox within w_person_list_bogo_r
end type
type ddlb_dwtitles from dropdownlistbox within w_person_list_bogo_r
end type
type st_4 from statictext within w_person_list_bogo_r
end type
type ddlb_op from dropdownlistbox within w_person_list_bogo_r
end type
type sle_value from singlelineedit within w_person_list_bogo_r
end type
type cb_2 from commandbutton within w_person_list_bogo_r
end type
type cb_3 from commandbutton within w_person_list_bogo_r
end type
type cb_4 from commandbutton within w_person_list_bogo_r
end type
type cb_5 from commandbutton within w_person_list_bogo_r
end type
type rb_1 from radiobutton within w_person_list_bogo_r
end type
type rb_2 from radiobutton within w_person_list_bogo_r
end type
type rb_3 from radiobutton within w_person_list_bogo_r
end type
type gb_4 from groupbox within w_person_list_bogo_r
end type
end forward

global type w_person_list_bogo_r from w_inheritance
integer width = 5504
integer height = 3032
string title = "인맥 리스트(w_person_list_r)"
boolean resizable = false
pb_1 pb_1
pb_2 pb_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
ddlb_op ddlb_op
sle_value sle_value
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_4 gb_4
end type
global w_person_list_bogo_r w_person_list_bogo_r

type variables
st_print i_print
integer il_row
string is_gubun = '03'
end variables

on w_person_list_bogo_r.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.ddlb_op=create ddlb_op
this.sle_value=create sle_value
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_fld
this.Control[iCurrent+5]=this.ddlb_dwtitles
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.ddlb_op
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.rb_1
this.Control[iCurrent+14]=this.rb_2
this.Control[iCurrent+15]=this.rb_3
this.Control[iCurrent+16]=this.gb_4
end on

on w_person_list_bogo_r.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.ddlb_op)
destroy(this.sle_value)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_4)
end on

event open;call super::open;DataWindowChild idwc_concode

//dw_3.visible = false

dw_1.settransobject(sqlca)
//dw_3.settransobject(sqlca)


//dw_2.SetTransObject(sqlca)		
//dw_2.insertrow(0)  
//
//dw_2.getchild("con_code", idwc_concode)
//idwc_concode.setredraw(false)
//idwc_concode.settransobject(sqlca)
//idwc_concode.insertrow(1)
//
//idwc_concode.accepttext()
//idwc_concode.setredraw(false)
//
//idwc_concode.setitem(1, 'con_code', '%')
//idwc_concode.setitem(1, 'con_name', '전  체')
//
//idwc_concode.accepttext()
//dw_2.object.con_code[1] = "%"

//ddlb_sort.text  = '기관(회사)명순'



end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 83
dw_1.height = newheight - 492

gb_4.width = dw_1.width

//dw_3.x      = dw_1.x
//dw_3.y      = dw_1.y
//dw_3.width  = dw_1.width
//dw_3.height = dw_1.height
end event

type pb_save from w_inheritance`pb_save within w_person_list_bogo_r
boolean visible = false
integer x = 1445
integer y = 28
integer taborder = 30
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_person_list_bogo_r
integer x = 37
integer y = 376
integer width = 4123
integer height = 1792
integer taborder = 50
string dataobject = "d_person_list_r1"
boolean hscrollbar = false
end type

event dw_1::clicked;call super::clicked;string ls_orderno, ls_item_no, ls_qa
long   i_personal_id, l_for, l_count

if row < 1 then return

GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//this.scrolltorow(row)

end event

event dw_1::buttonclicked;call super::buttonclicked;string ls_scene_code, ls_request_yn
long	l_count

IF dwo.Name = 'b_1' THEN

		if isnull(this.object.person1[row]) = true then /*담당자가 없을때만 지정할 수 있다. 기 지정되면 못함.*/		
			
			ls_scene_code  = this.object.scene_code[row]
			
			l_count = 0		
			setnull(ls_request_yn)
			
			select isnull(request_yn, 'Y') request_yn
				into :ls_request_yn
			  from sale_scene_request
			where user_id = :gs_userid
				and scene_code = :ls_scene_code;
			
			
			/* 신청을 안했으면  */
			if isnull(ls_request_yn) then
				
				
					integer Net
				
					Net = MessageBox("알림", "신청한 후에는 취소가 불가합니다. 신청하시겠습니까?", Exclamation!, OKCancel!, 2)
					
					IF Net = 1 THEN 
						
							insert into sale_scene_request ( scene_code, user_id, request_yn, write_date) 
																				values ( :ls_scene_code, :gs_userid, 'Y',  convert(char(8), getdate(), 112) );
																				
							commit;
							
							messagebox('알림','신청 했습니다.')										
						
					
					ELSE
					
					END IF
				
			else	

					/* 신청을 안했을때  */				
					IF ls_request_yn = 'N' or ls_request_yn = '' then
						
						Net = MessageBox("알림", "신청한 후에는 취소가 불가합니다. 신청하시겠습니까?", Exclamation!, OKCancel!, 2)
							
						IF Net = 1 THEN 						
			
								update sale_scene_request
									set request_yn = 'Y',
										 write_date = convert(char(8), getdate(), 112)
								where user_id = :gs_userid
									and scene_code = :ls_scene_code;					
							
								commit;
							
								messagebox('알림','신청 했습니다.')
								
						ELSE
						
						END IF
					
					
					else						
						
						messagebox('알림','이미 신청 했습니다.')
						
					end if				
				
			  end if
				
		
		else
			messagebox('알림','이미 담당자가 지정되어 신청할 수 없습니다.')
		end if
	
end if	

pb_retrieve.triggerevent( clicked! )
end event

event dw_1::rbuttondown;call super::rbuttondown;string ls_scene_code
m_manager manager

manager = CREATE m_manager

manager.m_itemstock.PopMenu(parentwindow().PointerX(), parentwindow().PointerY())


choose case gs_print_control
	case 'sale_scene_search'
	
//		ls_scene_code     = dw_1.object.scene_code[row]
//		
//		dw_4.width  = dw_1.width *0.4
//		dw_4.height = dw_1.height * 0.76
//		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
//		dw_4.y      = dw_1.y		
//	
//		dw_4.reset()		
//		
//		dw_4.title = "선행영업현장"
//		
//		dw_4.setredraw( false )
//		dw_4.visible    = true 
//		dw_4.bringtotop = true
//		dw_4.retrieve(ls_scene_code)
//		dw_4.setredraw( true )		
		
//		ls_scene_code     = dw_1.object.scene_code[row]		
//		
//		OpenWithParm(w_salescene_all_w, ls_scene_code)

	case 'person_search'				
		
//		dw_4.x      = dw_1.x + ((dw_1.width - dw_4.width) / 2)
//		dw_4.y      = dw_1.y + 305
//		
//		ls_scene_code     = dw_1.object.scene_code[row]				
//		
//		dw_4.reset()
//	
//		dw_4.setredraw( false )
//		dw_4.visible    = true 
//		dw_4.bringtotop = true
//		dw_4.retrieve(ls_scene_code, 'month')
//		dw_4.setredraw( true )	
//		ls_scene_code     = dw_1.object.scene_code[row]		
//		
//		OpenWithParm(w_imwon_w, ls_scene_code)
		
	case 'sale_scene_end'		

end choose		
end event

type st_title from w_inheritance`st_title within w_person_list_bogo_r
integer x = 55
integer y = 40
integer width = 1198
string text = "인맥 리스트"
end type

type st_tips from w_inheritance`st_tips within w_person_list_bogo_r
end type

type pb_compute from w_inheritance`pb_compute within w_person_list_bogo_r
boolean visible = false
integer x = 2290
integer y = 0
integer width = 165
integer height = 132
integer taborder = 140
integer textsize = -11
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = roman!
string facename = "궁서체"
string picturename = ""
alignment htextalign = center!
end type

type pb_print_part from w_inheritance`pb_print_part within w_person_list_bogo_r
boolean visible = false
integer x = 1335
integer y = 8
integer taborder = 20
end type

type pb_close from w_inheritance`pb_close within w_person_list_bogo_r
integer x = 4585
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)

end event

type pb_print from w_inheritance`pb_print within w_person_list_bogo_r
integer x = 4192
integer taborder = 160
end type

event pb_print::clicked;call super::clicked;//
w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 출고의뢰현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=57'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_person_list_bogo_r
boolean visible = false
integer x = 1426
integer y = 68
integer taborder = 170
boolean bringtotop = true
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_person_list_bogo_r
boolean visible = false
integer x = 1477
integer y = 8
integer taborder = 180
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_person_list_bogo_r
boolean visible = false
integer x = 1330
integer y = 84
integer taborder = 200
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_person_list_bogo_r
integer x = 4000
integer taborder = 190
string disabledname = "c:\bmp\retrieve.bmp"
end type

event pb_retrieve::clicked;string ls_con_code, ls_person_yn,  ls_new_yn, ls_request_yn, ls_yn

//ls_con_code =  trim(dw_2.object.con_code[1])

gs_level = '3'

dw_1.reset()
//dw_1.retrieve(ls_con_code, gs_userid, ls_person_yn, ls_new_yn, ls_request_yn)

if rb_1.checked then
	ls_yn = '%'
elseif rb_2.checked then
	ls_yn = 'Y'	
elseif rb_3.checked then	
	ls_yn = 'N'	
end if	


if gs_level = '3' then
	dw_1.retrieve('%', is_gubun)	
else
	dw_1.retrieve('%'+gs_username+'%', is_gubun)
end if 	


end event

type gb_3 from w_inheritance`gb_3 within w_person_list_bogo_r
boolean visible = false
integer x = 1787
integer y = 8
integer width = 407
integer height = 208
integer taborder = 110
integer textsize = -9
integer weight = 400
long textcolor = 0
long backcolor = 67108864
boolean enabled = false
end type

type gb_2 from w_inheritance`gb_2 within w_person_list_bogo_r
boolean visible = false
integer x = 37
integer y = 216
integer width = 795
integer height = 168
integer taborder = 130
integer textsize = -9
integer weight = 400
long textcolor = 0
long backcolor = 79220952
boolean enabled = false
string text = "클릭하면 출고의뢰내역이 조회됩니다."
end type

type gb_1 from w_inheritance`gb_1 within w_person_list_bogo_r
integer x = 3973
integer y = 8
integer width = 846
integer height = 208
integer taborder = 40
long backcolor = 79220952
end type

type dw_2 from w_inheritance`dw_2 within w_person_list_bogo_r
boolean visible = false
integer x = 3040
integer y = 84
integer width = 841
integer height = 80
integer taborder = 60
boolean bringtotop = false
boolean enabled = false
string title = "출고의뢰 상세내역"
string dataobject = "d_concode_s"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event dw_2::clicked;call super::clicked;//
if isnull(row) OR row < 1 then RETURN

this.scrolltorow(row)

string ls_date, ls_user
int    li_seq

DEBUGBREAK()

//ls_date = em_1.text
//ls_user = dw_2.object.issuereq_salesman[row]
//li_seq  = dw_2.object.issuereq_req_seq[row]

dw_1.setredraw(false)
dw_1.setredraw(true)

this.setfocus()

end event

type pb_1 from picturebutton within w_person_list_bogo_r
event mousemove pbm_mousemove
boolean visible = false
integer x = 1326
integer y = 40
integer width = 187
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type pb_2 from picturebutton within w_person_list_bogo_r
event mousemove pbm_mousemove
integer x = 4384
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
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

event clicked;string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
datawindow ldw_sel

ldw_sel = dw_1


if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					ldw_sel.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type st_3 from statictext within w_person_list_bogo_r
integer x = 325
integer y = 268
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

type ddlb_fld from dropdownlistbox within w_person_list_bogo_r
integer x = 512
integer y = 252
integer width = 480
integer height = 632
integer taborder = 180
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

type ddlb_dwtitles from dropdownlistbox within w_person_list_bogo_r
boolean visible = false
integer x = 553
integer y = 264
integer width = 311
integer height = 88
integer taborder = 90
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

type st_4 from statictext within w_person_list_bogo_r
integer x = 1010
integer y = 268
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

type ddlb_op from dropdownlistbox within w_person_list_bogo_r
integer x = 1179
integer y = 252
integer width = 297
integer height = 512
integer taborder = 180
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

type sle_value from singlelineedit within w_person_list_bogo_r
integer x = 1499
integer y = 260
integer width = 567
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

type cb_2 from commandbutton within w_person_list_bogo_r
integer x = 2071
integer y = 260
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

type cb_3 from commandbutton within w_person_list_bogo_r
integer x = 2235
integer y = 260
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

arg_dw = dw_1
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""


end event

type cb_4 from commandbutton within w_person_list_bogo_r
integer x = 2400
integer y = 260
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_person_list_bogo_r
integer x = 2565
integer y = 260
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

arg_dw = dw_1
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type rb_1 from radiobutton within w_person_list_bogo_r
integer x = 2843
integer y = 96
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "전체"
end type

type rb_2 from radiobutton within w_person_list_bogo_r
integer x = 2318
integer y = 96
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "종결제외"
boolean checked = true
end type

type rb_3 from radiobutton within w_person_list_bogo_r
integer x = 2688
integer y = 96
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
boolean enabled = false
string text = "종결"
end type

type gb_4 from groupbox within w_person_list_bogo_r
integer x = 37
integer y = 204
integer width = 4869
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

