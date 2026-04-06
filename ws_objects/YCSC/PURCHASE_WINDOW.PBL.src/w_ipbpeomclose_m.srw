$PBExportHeader$w_ipbpeomclose_m.srw
$PBExportComments$조업자재년마감 (1999/06/10, 이인호)
forward
global type w_ipbpeomclose_m from w_inheritance
end type
type em_1 from editmask within w_ipbpeomclose_m
end type
type st_1 from statictext within w_ipbpeomclose_m
end type
type hpb_1 from hprogressbar within w_ipbpeomclose_m
end type
end forward

global type w_ipbpeomclose_m from w_inheritance
integer width = 1829
integer height = 700
string title = "조업자재 년마감(w_ipbpeomclose_m)"
boolean resizable = false
windowstate windowstate = normal!
boolean center = true
em_1 em_1
st_1 st_1
hpb_1 hpb_1
end type
global w_ipbpeomclose_m w_ipbpeomclose_m

on w_ipbpeomclose_m.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.hpb_1=create hpb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.hpb_1
end on

on w_ipbpeomclose_m.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.hpb_1)
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

em_1.text      = string(today(), 'YYYY')
dw_1.visible   = false
hpb_1.position = 0

end event

type pb_save from w_inheritance`pb_save within w_ipbpeomclose_m
boolean visible = false
end type

type dw_1 from w_inheritance`dw_1 within w_ipbpeomclose_m
integer x = 1847
integer y = 48
integer width = 933
integer height = 224
integer taborder = 50
string dataobject = "d_ipbpeomclose_h"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_2 from w_inheritance`dw_2 within w_ipbpeomclose_m
boolean visible = false
integer x = 439
integer y = 260
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_ipbpeomclose_m
integer width = 1157
string text = "조업자재 년마감"
end type

type st_tips from w_inheritance`st_tips within w_ipbpeomclose_m
end type

type pb_compute from w_inheritance`pb_compute within w_ipbpeomclose_m
integer x = 1362
integer y = 64
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

f_usetips(st_tips,"년마감",parent, li_x, li_y)

end event

event pb_compute::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

datetime ldt_close, ldt_make_date
string ls_close_date, ls_supp_no
long ll_year, ll_row, ll_current_year, ll_cnt
decimal lr_balance_amt
real lr_ole_cnt, lr_ole_add

if em_1.text = '' then
	messagebox("확인","년도를 입력하세요!",information!)
	em_1.setfocus()
	return
elseif messagebox("마감","년마감을 수행하시겠습니까?",question!,okcancel!,1) = 2 then
	return
end if

ll_year = long(em_1.text) + 1
hpb_1.position = 0

ll_current_year = long(em_1.text)
dw_1.retrieve(gs_area, ll_current_year)
if dw_1.rowcount() <= 0 then
	messagebox("확인","등록된 조업자재거래처가 없습니다.",information!)
	return
end if

lr_ole_cnt = 100 / dw_1.rowcount()
	
for ll_row = 1 to dw_1.rowcount()
	ls_supp_no = dw_1.getitemstring(ll_row, "supp_no")
	lr_balance_amt = dw_1.getitemdecimal(ll_row, "balance_amt")
	SELECT count(*) INTO :ll_cnt FROM bpeom
	 WHERE area_no = :gs_area 
	  and supp_no = :ls_supp_no
	  AND eom_year = :ll_year;
		
	if ll_cnt <= 0 then
		INSERT INTO bpeom
			  VALUES(:gs_area, :ls_supp_no, :ll_year, :lr_balance_amt,0,0,0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0,0,0, :ldt_make_date, :gs_userid);
	else
		UPDATE bpeom 
			SET balbf_amount = :lr_balance_amt, make_date = :ldt_make_date,
				 make_user = :gs_userid
		 WHERE area_no = :gs_area 
	  		and supp_no = :ls_supp_no
			AND eom_year = :ll_year;
	end if
	
	if sqlca.sqlcode <> 0 then
		messagebox("마감","년마감도중 오류가 발생하였습니다. ~r~n" &
								+ sqlca.sqlerrtext,exclamation!)
		rollback;
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


end event

type pb_print_part from w_inheritance`pb_print_part within w_ipbpeomclose_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_ipbpeomclose_m
integer x = 1550
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ipbpeomclose_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_ipbpeomclose_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_ipbpeomclose_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_ipbpeomclose_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ipbpeomclose_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_ipbpeomclose_m
boolean visible = false
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_ipbpeomclose_m
integer y = 224
integer width = 1737
integer height = 332
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_ipbpeomclose_m
integer x = 1335
integer y = 28
integer width = 434
integer height = 196
integer taborder = 40
end type

type em_1 from editmask within w_ipbpeomclose_m
integer x = 512
integer y = 280
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

type st_1 from statictext within w_ipbpeomclose_m
integer x = 96
integer y = 292
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

type hpb_1 from hprogressbar within w_ipbpeomclose_m
integer x = 64
integer y = 428
integer width = 1678
integer height = 88
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

