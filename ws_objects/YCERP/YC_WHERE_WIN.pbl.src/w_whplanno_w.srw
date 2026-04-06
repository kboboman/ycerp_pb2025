$PBExportHeader$w_whplanno_w.srw
$PBExportComments$생산계획번호검색(1998/03/27, 곽용덕)
forward 
global type w_whplanno_w from window
end type
type dw_1 from datawindow within w_whplanno_w
end type
type pb_2 from picturebutton within w_whplanno_w
end type
type pb_1 from picturebutton within w_whplanno_w
end type
type gb_1 from groupbox within w_whplanno_w
end type
end forward

global type w_whplanno_w from window
integer x = 1111
integer y = 904
integer width = 1371
integer height = 544
boolean titlebar = true
string title = "생산계획번호검색(w_whplanno_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_whplanno_w w_whplanno_w

type variables
string is_select,is_where,is_clause
string is_select1,is_where1,is_clause1
datawindowchild idwc_plan,idwc_wc
gs_where istr_name
end variables

on w_whplanno_w.create
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_whplanno_w.destroy
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;string ls_str

dw_1.settransobject(sqlca)
dw_1.insertrow(0)
istr_name = Message.PowerObjectParm
dw_1.getchild('plan_no',idwc_plan)
idwc_plan.settransobject(sqlca)
is_select = idwc_plan.Describe("DataWindow.Table.Select")

//if gs_area = 'B0001' then
//	gs_area = gs_area
//elseif gs_area = 'T0001' then
//	gs_area = 'T0001'
//else
//	gs_area = 'S0001'
//end if
choose case istr_name.name
    case 'w_mpsale_m'
         is_clause = " and mps.open_close = ~~'A~~'" &
			          + " and mps.area_no = ~~'" + trim(gs_area) + "~~'" &
			          + " order by mps.order_no desc"
         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"	
    case 'w_mpsign1_m'
         is_clause = " and mps.open_close = ~~'A~~'" &
			          + " and mps.area_no = ~~'" + trim(gs_area) + "~~'" &
		         	 + " order by mps.order_no desc"
         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"		
    case 'w_mpcancel1_m'
         is_clause = " and mps.open_close = ~~'P~~'" &
			          + " and mps.area_no = ~~'" + trim(gs_area) + "~~'" &
			          + " order by mps.order_no desc"
         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"	
    case 'w_mpclose_m'
         is_clause = " and mps.open_close = ~~'P~~'" &
			          + " and mps.area_no = ~~'" + trim(gs_area) + "~~'" &
		         	 + " order by mps.order_no desc"
         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"			
    case 'w_mpmodify1_m'
		
         is_clause = " and mps.open_close = ~~'A~~'" &
			          + " and mps.area_no = ~~'" + trim(gs_area) + "~~'" &
			          + " order by mps.order_no desc"
         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"		
end choose

ls_str = idwc_plan.Modify(is_where)
idwc_plan.settransobject(sqlca)
idwc_plan.retrieve()
dw_1.getchild('wc_no',idwc_wc)
idwc_wc.insertrow(1)
idwc_wc.setitem(1,'work_no',' ')
idwc_wc.setitem(1,'work_name','전체')
//

end event

type dw_1 from datawindow within w_whplanno_w
integer x = 37
integer y = 64
integer width = 1266
integer height = 180
integer taborder = 10
string dataobject = "d_whplanno_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_str,ls_loc

this.accepttext()

choose case dwo.name
	case 'wc_no'
		 this.object.plan_no[1] = ""
		 ls_loc = trim(data) + '%'
       choose case istr_name.name
	        case 'w_mpsale_m'
		         is_clause = " and mps.wc_no like ~~'" + ls_loc + "~~'" & 
					          + " and mps.open_close = ~~'A~~'" &
					          + " order by mps.order_no desc"
		         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"	
	        case 'w_mpsign1_m'
		         is_clause = " and mps.wc_no like ~~'" + ls_loc + "~~'" & 
					          + " and mps.open_close = ~~'A~~'" &
				         	 + " order by mps.order_no desc"
		         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"		
	        case 'w_mpcancel1_m'
		         is_clause = " and mps.wc_no like ~~'" + ls_loc + "~~'" & 
					          + " and mps.open_close = ~~'P~~'" &
					          + " order by mps.order_no desc"
		         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"	
	        case 'w_mpclose_m'
		         is_clause = " and mps.wc_no like ~~'" + ls_loc + "~~'" &  
					          + " and mps.open_close = ~~'P~~'" &
				         	 + " order by mps.order_no desc"
		         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"			
	        case 'w_mpmodify1_m'
		         is_clause = " and mps.wc_no like ~~'" + ls_loc + "~~'" & 
					          + " and mps.open_close = ~~'A~~'" &
				         	 + " order by mps.order_no desc"
		         is_where = "DataWindow.Table.Select='" + is_select + is_clause + "'"		
        end choose
        ls_str = idwc_plan.Modify(is_where)
//		  messagebox("",is_where)
idwc_plan.settransobject(sqlca)
//        IF ls_str = "" THEN
        	  idwc_plan.Retrieve( )
//        ELSE
//	        MessageBox("Status", "Modify Failed" + ls_str)
//        END IF
	case else

end choose
end event

type pb_2 from picturebutton within w_whplanno_w
integer x = 663
integer y = 288
integer width = 247
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;istr_name.chk = 'N'
CloseWithReturn(parent, istr_name)
end event

type pb_1 from picturebutton within w_whplanno_w
integer x = 411
integer y = 288
integer width = 247
integer height = 144
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
string picturename = "c:\bmp\확인1.bmp"
alignment htextalign = right!
end type

event clicked;string ls_plan,ls_wc

ls_plan = trim(dw_1.object.plan_no[1])
ls_wc = trim(dw_1.object.wc_no[1])

if ls_plan = "" or isnull(ls_plan) then return
//if ls_wc = "" or isnull(ls_wc) then return

istr_name.str1 = ls_plan
//istr_name.str2 = ls_wc
istr_name.chk = 'Y'
CloseWithReturn(Parent, istr_name)
end event

type gb_1 from groupbox within w_whplanno_w
integer x = 27
integer y = 16
integer width = 1294
integer height = 248
integer taborder = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

