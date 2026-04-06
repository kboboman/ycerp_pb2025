$PBExportHeader$w_apoiclose_m.srw
$PBExportComments$매입마감(1999/05/31, 이인호)
forward
global type w_apoiclose_m from w_inheritance
end type
type em_1 from editmask within w_apoiclose_m
end type
type st_1 from statictext within w_apoiclose_m
end type
type st_2 from statictext within w_apoiclose_m
end type
type em_2 from editmask within w_apoiclose_m
end type
type dw_area from datawindow within w_apoiclose_m
end type
type st_22 from statictext within w_apoiclose_m
end type
end forward

global type w_apoiclose_m from w_inheritance
integer width = 1399
integer height = 672
string title = "매입마감(w_apoiclose_m)"
boolean resizable = false
windowstate windowstate = normal!
boolean center = true
em_1 em_1
st_1 st_1
st_2 st_2
em_2 em_2
dw_area dw_area
st_22 st_22
end type
global w_apoiclose_m w_apoiclose_m

on w_apoiclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.em_2=create em_2
this.dw_area=create dw_area
this.st_22=create st_22
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.dw_area
this.Control[iCurrent+6]=this.st_22
end on

on w_apoiclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.dw_area)
destroy(this.st_22)
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

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
dw_area.object.area[1] = gs_area

em_1.text = string(today(), 'YYYY/MM/01')
em_2.text = string(today(), 'YYYY/MM/DD')

if GF_PERMISSION("매입_마감관리", gs_userid) = "Y" then
else
	MessageBox("확인","매입_마감관리 권한이 존재하지 않습니다.")
	close(this)
end if

end event

type pb_save from w_inheritance`pb_save within w_apoiclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_apoiclose_m
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

type st_title from w_inheritance`st_title within w_apoiclose_m
integer width = 795
string text = "매입마감"
end type

type st_tips from w_inheritance`st_tips within w_apoiclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_apoiclose_m
integer x = 937
integer y = 56
integer taborder = 100
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
vtextalign vtextalign = top!
end type

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"매출마감",parent, li_x, li_y)

end event

event pb_compute::clicked;datetime ldt_sdate, ldt_edate, ldt_close_date
string ls_area
string 	ls_yyyymm, ls_magamyn // 2017.10.23 조원석

ldt_sdate = datetime(date(em_1.text))
ldt_edate = datetime(date(em_2.text))


/* 마감관리 로직 반영 2017.10.23 조원석 */
/* sys_gb = '10' (10)구매 마감 로직 	 시작 */
ls_yyyymm = string(ldt_sdate, 'yyyymm')

SELECT magam_yn INTO :ls_magamyn FROM MMAGAM WHERE YYYYMM = :ls_yyyymm AND sys_gb = '10';

//if ls_magamyn <> "N" then
//	MessageBox('확인','해당년월은 마감되었습니다.~n~n',Stopsign!)
//	return
//end if

/* 마감관리 로직 반영 2017.10.23 조원석  끝 */


if em_1.text = '' then
	messagebox("확인","매입기간을 입력하세요!",information!)
	em_1.setfocus()
	return
elseif em_2.text = '' then
	messagebox("확인","매입기간을 입력하세요!",information!)
	em_2.setfocus()
	return
elseif ldt_edate > ldt_sdate then
	messagebox("확인","매입기간을 잘못 입력하셨습니다.",information!)
	em_1.setfocus()
	return
elseif messagebox("매입마감","매입마감을 하시겠습니까?",question!,okcancel!,2) = 1 then
	
	//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
	GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
	//================================================================================================

	ldt_close_date = wf_today()
	ls_area = dw_area.object.area[1]
	UPDATE apoiinv SET open_close = 'C', close_date = :ldt_close_date
	 WHERE inv_area = :ls_area
	   AND inv_type = 'Y'
	   AND oi_date BETWEEN :ldt_sdate AND :ldt_edate;
		
	if sqlca.sqlcode <> 0 then
		rollback;
	   messagebox("매입마감","매입마감도중 오류가 발생하였습니다.",information!)
	else
		commit;
		messagebox("매입마감","매입마감이 이루어졌습니다.",information!)
	end if
end if


	
end event

type pb_print_part from w_inheritance`pb_print_part within w_apoiclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apoiclose_m
integer x = 1125
integer y = 56
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apoiclose_m
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_apoiclose_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_apoiclose_m
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_apoiclose_m
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apoiclose_m
boolean visible = false
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_apoiclose_m
boolean visible = false
integer taborder = 80
end type

type gb_2 from w_inheritance`gb_2 within w_apoiclose_m
integer y = 232
integer width = 1303
integer height = 308
integer taborder = 90
end type

type gb_1 from w_inheritance`gb_1 within w_apoiclose_m
integer x = 914
integer y = 20
integer width = 421
integer height = 196
integer taborder = 40
end type

type dw_2 from w_inheritance`dw_2 within w_apoiclose_m
boolean visible = false
integer taborder = 60
end type

type em_1 from editmask within w_apoiclose_m
integer x = 411
integer y = 312
integer width = 370
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

type st_1 from statictext within w_apoiclose_m
integer x = 73
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
string text = "매입기간"
boolean focusrectangle = false
end type

type st_2 from statictext within w_apoiclose_m
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

type em_2 from editmask within w_apoiclose_m
integer x = 882
integer y = 312
integer width = 370
integer height = 92
integer taborder = 70
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
string displaydata = "T"
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_area from datawindow within w_apoiclose_m
integer x = 297
integer y = 432
integer width = 517
integer height = 80
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_22 from statictext within w_apoiclose_m
integer x = 82
integer y = 432
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "사업장"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

