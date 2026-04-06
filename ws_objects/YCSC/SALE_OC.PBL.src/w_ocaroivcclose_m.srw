$PBExportHeader$w_ocaroivcclose_m.srw
$PBExportComments$수금마감(1998/04/21, 정재수)
forward
global type w_ocaroivcclose_m from w_inheritance
end type
type em_1 from editmask within w_ocaroivcclose_m
end type
type st_1 from statictext within w_ocaroivcclose_m
end type
type st_2 from statictext within w_ocaroivcclose_m
end type
type em_2 from editmask within w_ocaroivcclose_m
end type
end forward

global type w_ocaroivcclose_m from w_inheritance
integer width = 1358
integer height = 576
string title = "수금마감(w_ocaroivcclose_m)"
boolean resizable = false
windowstate windowstate = normal!
boolean center = true
em_1 em_1
st_1 st_1
st_2 st_2
em_2 em_2
end type
global w_ocaroivcclose_m w_ocaroivcclose_m

on w_ocaroivcclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.em_2=create em_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_2
end on

on w_ocaroivcclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_name
Window  w_parent

//OpenSheet로 OPEN한 경우
w_parent = this.ParentWindow()

if IsValid(w_parent) then
	ls_name = w_parent.classname()
	if ls_name = "w_all_main" then
		THIS.X  = (w_parent.width  - this.width)  / 2
		THIS.Y  = (w_parent.height - this.height) / 2 - 200
	else
		THIS.X  = (w_parent.width  - this.width)  / 2 + 1250
		THIS.Y  = (w_parent.height - this.height) / 2 + 150
	end if
end if

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')

end event

type pb_save from w_inheritance`pb_save within w_ocaroivcclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocaroivcclose_m
boolean visible = false
integer x = 41
integer y = 656
integer width = 1042
integer height = 556
integer taborder = 50
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_ocaroivcclose_m
boolean visible = false
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_ocaroivcclose_m
integer width = 731
string text = "수금마감"
end type

type st_tips from w_inheritance`st_tips within w_ocaroivcclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ocaroivcclose_m
integer x = 905
integer y = 56
integer taborder = 90
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
vtextalign vtextalign = top!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수금마감",parent, li_x, li_y)

end event

event pb_compute::clicked;datetime ldt_sdate, ldt_edate, ldt_close_date

ldt_sdate = datetime(date(em_1.text))
ldt_edate = datetime(date(em_2.text))

if em_1.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","수금기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ldt_edate < ldt_sdate then
	messagebox("확인","수금기간을 잘못 입력하셨습니다.",information!)
	em_1.setfocus()
	return
elseif messagebox("수금마감","수금마감을 하시겠습니까?",question!,okcancel!,2) = 1 then
	
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================
	
	ldt_close_date = wf_today()
	UPDATE aroivc SET open_close = 'C', close_date = :ldt_close_date
	 WHERE oi_date BETWEEN :ldt_sdate AND :ldt_edate;
		
	if sqlca.sqlcode <> 0 then
		rollback;
	   messagebox("매출마감","매출마감도중 오류가 발생하였습니다.",information!)
	else
		commit;
		messagebox("매출마감","매출마감이 이루어졌습니다.",information!)
	end if
end if


	
end event

type pb_print_part from w_inheritance`pb_print_part within w_ocaroivcclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ocaroivcclose_m
integer x = 1093
integer y = 56
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocaroivcclose_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_ocaroivcclose_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ocaroivcclose_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ocaroivcclose_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocaroivcclose_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_ocaroivcclose_m
boolean visible = false
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_ocaroivcclose_m
integer y = 232
integer width = 1271
integer height = 228
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_ocaroivcclose_m
integer x = 887
integer y = 20
integer width = 411
integer height = 196
integer taborder = 40
end type

type em_1 from editmask within w_ocaroivcclose_m
integer x = 407
integer y = 312
integer width = 375
integer height = 92
integer taborder = 30
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
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_1 from statictext within w_ocaroivcclose_m
integer x = 69
integer y = 324
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "수금기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocaroivcclose_m
integer x = 809
integer y = 328
integer width = 46
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_ocaroivcclose_m
integer x = 878
integer y = 312
integer width = 375
integer height = 92
integer taborder = 61
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
string displaydata = "6"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

