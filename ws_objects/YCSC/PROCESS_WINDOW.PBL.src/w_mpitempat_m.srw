$PBExportHeader$w_mpitempat_m.srw
$PBExportComments$물품별 공정패턴관리(1998/08/26,곽용덕)
forward
global type w_mpitempat_m from w_inheritance
end type
type gb_5 from groupbox within w_mpitempat_m
end type
type st_1 from statictext within w_mpitempat_m
end type
type em_1 from editmask within w_mpitempat_m
end type
type dw_3 from datawindow within w_mpitempat_m
end type
end forward

global type w_mpitempat_m from w_inheritance
integer width = 2775
integer height = 2512
string title = "공정패턴 관리(w_mpitempat_m)"
windowstate windowstate = normal!
gb_5 gb_5
st_1 st_1
em_1 em_1
dw_3 dw_3
end type
global w_mpitempat_m w_mpitempat_m

on w_mpitempat_m.create
int iCurrent
call super::create
this.gb_5=create gb_5
this.st_1=create st_1
this.em_1=create em_1
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_5
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.dw_3
end on

on w_mpitempat_m.destroy
call super::destroy
destroy(this.gb_5)
destroy(this.st_1)
destroy(this.em_1)
destroy(this.dw_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.SetTransObject(SQLCA)
dw_1.retrieve()
end event

type pb_save from w_inheritance`pb_save within w_mpitempat_m
integer x = 2281
integer taborder = 30
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dw_1.update() = 1 then
	commit;
	messagebox('확인','저장 되었습니다.')
else
	rollback;
	messagebox('오류','수행중 오류가 발생하였습니다.',exclamation!)
end if
end event

type dw_1 from w_inheritance`dw_1 within w_mpitempat_m
integer x = 82
integer y = 276
integer width = 2560
integer height = 1384
integer taborder = 50
string dataobject = "d_mpitempat_m"
end type

event dw_1::itemchanged;call super::itemchanged;string ls_patno

ls_patno = this.object.pat_no[row]
dw_3.retrieve( ls_patno )
end event

event dw_1::clicked;call super::clicked;long li_patno

if row < 1 then return
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
this.scrolltorow(row)

li_patno = this.object.pat_no[row]
dw_3.retrieve( li_patno )
end event

type dw_2 from w_inheritance`dw_2 within w_mpitempat_m
boolean visible = false
integer x = 1947
integer y = 80
integer width = 174
integer height = 80
integer taborder = 60
end type

type st_title from w_inheritance`st_title within w_mpitempat_m
integer x = 37
integer width = 1385
string text = "공정패턴 관리"
end type

type st_tips from w_inheritance`st_tips within w_mpitempat_m
end type

type pb_compute from w_inheritance`pb_compute within w_mpitempat_m
boolean visible = false
integer x = 2071
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_mpitempat_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_mpitempat_m
integer x = 2473
integer taborder = 100
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_mpitempat_m
boolean visible = false
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_mpitempat_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_mpitempat_m
boolean visible = false
integer taborder = 130
end type

type pb_insert from w_inheritance`pb_insert within w_mpitempat_m
boolean visible = false
integer taborder = 150
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_mpitempat_m
boolean visible = false
integer taborder = 140
end type

type gb_3 from w_inheritance`gb_3 within w_mpitempat_m
boolean visible = false
integer x = 1902
integer y = 28
integer width = 261
integer height = 156
integer taborder = 70
end type

type gb_2 from w_inheritance`gb_2 within w_mpitempat_m
integer y = 216
integer width = 2661
integer height = 2144
integer taborder = 80
end type

type gb_1 from w_inheritance`gb_1 within w_mpitempat_m
integer x = 1490
integer width = 745
integer taborder = 40
end type

type gb_5 from groupbox within w_mpitempat_m
integer x = 2249
integer y = 12
integer width = 439
integer height = 204
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type st_1 from statictext within w_mpitempat_m
integer x = 1545
integer y = 96
integer width = 155
integer height = 76
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
boolean focusrectangle = false
end type

type em_1 from editmask within w_mpitempat_m
integer x = 1733
integer y = 76
integer width = 443
integer height = 88
integer taborder = 60
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
string mask = "!!!!!!!!!!!!!"
end type

event modified;string ls_str,ls_filter

if trim(em_1.text) = '%' then
   ls_str = '%'	
else
	ls_str = trim(em_1.text) + '%'
end if

ls_filter= "item_no like '" + ls_str + "'"
dw_1.SetFilter(ls_filter)
dw_1.Filter( )

end event

type dw_3 from datawindow within w_mpitempat_m
integer x = 82
integer y = 1676
integer width = 2560
integer height = 652
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdpattern_r"
boolean livescroll = true
end type

