$PBExportHeader$w_apclose_m.srw
$PBExportComments$년마감 (1999/05/25, 이인호)
forward 
global type w_apclose_m from w_inheritance
end type
type em_1 from editmask within w_apclose_m
end type
type st_1 from statictext within w_apclose_m
end type
type dw_area from datawindow within w_apclose_m
end type
type st_22 from statictext within w_apclose_m
end type
type hpb_1 from hprogressbar within w_apclose_m
end type
end forward

global type w_apclose_m from w_inheritance
integer width = 3063
integer height = 1872
string title = "매입 년마감(w_apclose_m)"
boolean resizable = false
windowstate windowstate = normal!
boolean center = true
em_1 em_1
st_1 st_1
dw_area dw_area
st_22 st_22
hpb_1 hpb_1
end type
global w_apclose_m w_apclose_m

on w_apclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.dw_area=create dw_area
this.st_22=create st_22
this.hpb_1=create hpb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_area
this.Control[iCurrent+4]=this.st_22
this.Control[iCurrent+5]=this.hpb_1
end on

on w_apclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.dw_area)
destroy(this.st_22)
destroy(this.hpb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string  ls_name
Window  w_parent

// OpenSheet로 OPEN한 경우
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

if GF_PERMISSION("매입_년마감", gs_userid) = "Y" then
else
	MessageBox("확인","매입_년마감 권한이 존재하지 않습니다.")
	close(this)	
end if

em_1.text    = string(today(), 'YYYY')
dw_1.visible = false

end event

type pb_save from w_inheritance`pb_save within w_apclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_apclose_m
integer x = 32
integer y = 428
integer width = 2985
integer height = 1308
integer taborder = 50
string dataobject = "d_apclose_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = StyleLowered!
end type

type st_title from w_inheritance`st_title within w_apclose_m
integer y = 20
integer width = 992
integer height = 140
string text = "매입 년마감"
end type

type st_tips from w_inheritance`st_tips within w_apclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_apclose_m
integer x = 2597
integer y = 64
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

f_usetips(st_tips,"년마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//
datetime ldt_close, ldt_make_date
string  ls_close_date, ls_supp_no, ls_area
long    ll_next_year, ll_row, ll_current_year, ll_cnt
decimal lr_balance_amt
real lr_ole_cnt, lr_ole_add

if em_1.text = '' then
	messagebox("확인","년도를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif messagebox("마감","년마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

ll_next_year  = long(em_1.text) + 1
ls_close_date = string(ll_next_year) + '/01/01'
ldt_close     = datetime(date(ls_close_date))

hpb_1.position = 0

dw_area.accepttext()
ls_area = dw_area.object.area[1]

ll_current_year = long(em_1.text)

dw_1.retrieve(ll_current_year, LeftA(dw_area.object.area[1],1))
if dw_1.rowcount() <= 0 then
	messagebox("확인","등록된 구매거래처가 없습니다.",information!)
	return
end if

lr_ole_cnt = 100 / dw_1.rowcount()
	
for ll_row = 1 to dw_1.rowcount()
	ls_supp_no     = dw_1.getitemstring(ll_row, "supp_no")
	lr_balance_amt = dw_1.getitemdecimal(ll_row, "balance_amt")
	
	SELECT count(*) INTO :ll_cnt FROM apeom
	 WHERE supp_no = :ls_supp_no
	  AND datepart(year, eom_year) = :ll_next_year;
		
	if ll_cnt <= 0 then
		INSERT INTO apeom
			  VALUES(:ldt_close, :ls_area, :ls_supp_no, :lr_balance_amt,0,0,0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0,0,0, :ldt_make_date, :gs_userid);
	else
		UPDATE apeom 
			SET balbf_amount = :lr_balance_amt, make_date = :ldt_make_date,
				 make_user = :gs_userid
		 WHERE datepart(year, eom_year) = :ll_next_year
			AND area_no = :ls_area
			AND supp_no = :ls_supp_no;
	end if
	
	if sqlca.sqlcode <> 0 then
		rollback;
		messagebox("마감","년마감도중 오류가 발생하였습니다.",exclamation!)
		return
	end if
	
	lr_ole_add = lr_ole_add + lr_ole_cnt
	if lr_ole_add > 99 then
		hpb_1.position = 99
	else
		hpb_1.position = lr_ole_add
	end if
next
		  
hpb_1.position = 100
commit;
messagebox("마감","년마감이 이루어졌습니다.",information!)

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

end event

type pb_print_part from w_inheritance`pb_print_part within w_apclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_apclose_m
integer x = 2789
integer y = 64
integer taborder = 110
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_apclose_m
boolean visible = false
integer taborder = 120
end type

type pb_cancel from w_inheritance`pb_cancel within w_apclose_m
boolean visible = false
integer taborder = 130
end type

type pb_delete from w_inheritance`pb_delete within w_apclose_m
boolean visible = false
integer taborder = 140
end type

type pb_insert from w_inheritance`pb_insert within w_apclose_m
boolean visible = false
integer taborder = 160
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_apclose_m
integer x = 2405
integer y = 64
integer taborder = 150
end type

type gb_3 from w_inheritance`gb_3 within w_apclose_m
integer x = 32
integer y = 252
integer width = 2985
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_apclose_m
integer x = 1065
integer y = 16
integer width = 1243
integer height = 216
integer taborder = 90
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_apclose_m
integer x = 2363
integer y = 16
integer width = 654
integer height = 216
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_apclose_m
boolean visible = false
integer x = 439
integer y = 260
integer taborder = 70
end type

type em_1 from editmask within w_apclose_m
integer x = 1623
integer y = 152
integer width = 219
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "yyyy"
string displaydata = ""
end type

type st_1 from statictext within w_apclose_m
integer x = 1207
integer y = 164
integer width = 411
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
string text = "년마감년도"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_area from datawindow within w_apclose_m
integer x = 1367
integer y = 64
integer width = 517
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
end event

type st_22 from statictext within w_apclose_m
integer x = 1157
integer y = 64
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

type hpb_1 from hprogressbar within w_apclose_m
integer x = 1184
integer y = 304
integer width = 1312
integer height = 92
boolean bringtotop = true
unsignedinteger maxposition = 100
integer setstep = 1
end type

