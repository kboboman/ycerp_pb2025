$PBExportHeader$w_cdpart_m.srw
$PBExportComments$사업장관리
forward
global type w_cdpart_m from w_inheritance
end type
type cb_3 from commandbutton within w_cdpart_m
end type
end forward

global type w_cdpart_m from w_inheritance
integer x = 320
integer y = 552
integer width = 4407
integer height = 2420
string title = "지점관리(w_cdpart_m)"
boolean maxbox = false
windowstate windowstate = normal!
long backcolor = 79416533
boolean center = true
cb_3 cb_3
end type
global w_cdpart_m w_cdpart_m

type variables
long il_row
end variables

on w_cdpart_m.create
int iCurrent
call super::create
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
end on

on w_cdpart_m.destroy
call super::destroy
destroy(this.cb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_1.Retrieve( gs_company )

end event

type pb_save from w_inheritance`pb_save within w_cdpart_m
integer x = 3867
integer y = 64
end type

event pb_save::clicked;int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()
if wf_update1(dw_1, "Y") then
end if



end event

type dw_1 from w_inheritance`dw_1 within w_cdpart_m
integer x = 105
integer y = 328
integer width = 4128
integer height = 1860
string dataobject = "d_glpart_m"
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;long ll_row, ll_cnt

ll_row = this.getrow()
il_row = ll_row

choose case dwo.name
	case "def"
		for ll_cnt = 1 to this.rowcount()
			if ll_cnt = ll_row then
				continue
			end if
			this.SetItem(ll_cnt, "def", "N")
			
		end for
	  
end choose

end event

type dw_2 from w_inheritance`dw_2 within w_cdpart_m
integer x = 978
integer y = 28
integer width = 119
integer height = 88
integer taborder = 60
boolean vscrollbar = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdpart_m
integer x = 69
integer width = 1051
string text = "지점관리"
end type

type st_tips from w_inheritance`st_tips within w_cdpart_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdpart_m
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdpart_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdpart_m
integer x = 4059
integer y = 64
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdpart_m
integer x = 3675
integer y = 64
integer taborder = 110
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdpart_m
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdpart_m
integer x = 3483
integer y = 64
integer taborder = 130
end type

event pb_delete::clicked;call super::clicked;//
string ls_company_code, ls_company
int li_count

if dw_1.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

dw_1.deleterow(0)
wf_update1(dw_1,"Y")

end event

type pb_insert from w_inheritance`pb_insert within w_cdpart_m
integer x = 3291
integer y = 64
integer taborder = 150
end type

event pb_insert::clicked;call super::clicked;//
long ll_row, ll_count

ll_row = wf_insertrow(dw_1)
dw_1.object.company_code[ll_row] = gs_company

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdpart_m
integer x = 3099
integer y = 64
integer taborder = 140
end type

event pb_retrieve::clicked;//
dw_1.retrieve( gs_company )

end event

type gb_3 from w_inheritance`gb_3 within w_cdpart_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdpart_m
integer x = 59
integer y = 264
integer width = 4215
integer height = 1956
integer taborder = 80
integer textsize = -10
integer weight = 400
long textcolor = 16711680
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdpart_m
integer x = 3077
integer y = 24
integer width = 1198
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdpart_m
boolean visible = false
integer x = 745
integer y = 316
integer width = 658
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "계 좌 번 호"
end type

