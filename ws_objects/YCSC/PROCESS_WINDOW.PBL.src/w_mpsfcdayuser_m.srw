$PBExportHeader$w_mpsfcdayuser_m.srw
$PBExportComments$작업라인 작업자 추가(2003/07/05, 이인호)
forward
global type w_mpsfcdayuser_m from window
end type
type cb_4 from commandbutton within w_mpsfcdayuser_m
end type
type cb_3 from commandbutton within w_mpsfcdayuser_m
end type
type cb_2 from commandbutton within w_mpsfcdayuser_m
end type
type st_3 from statictext within w_mpsfcdayuser_m
end type
type cb_1 from commandbutton within w_mpsfcdayuser_m
end type
type dw_1 from datawindow within w_mpsfcdayuser_m
end type
end forward

global type w_mpsfcdayuser_m from window
integer width = 1157
integer height = 1544
boolean titlebar = true
string title = "작업자추가(w_mpsfcdayuser_m)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
st_3 st_3
cb_1 cb_1
dw_1 dw_1
end type
global w_mpsfcdayuser_m w_mpsfcdayuser_m

type variables
gs_where istr_where

end variables

forward prototypes
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

on w_mpsfcdayuser_m.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_3=create st_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.st_3,&
this.cb_1,&
this.dw_1}
end on

on w_mpsfcdayuser_m.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)
istr_where = Message.PowerObjectParm
st_3.text = istr_where.name

dw_1.retrieve(gs_area, istr_where.str1, date(istr_where.str2) )

end event

event closequery;IF NOT ISNULL(istr_where.chk) THEN
	RETURN 0
ELSE
	RETURN 1
END IF
end event

type cb_4 from commandbutton within w_mpsfcdayuser_m
integer x = 654
integer y = 340
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업자 삭제"
end type

event clicked;long ll_row 
dwItemStatus l_status

ll_row = dw_1.getrow()
dw_1.deleterow(ll_row)
wf_update1(dw_1,"N")


end event

type cb_3 from commandbutton within w_mpsfcdayuser_m
integer x = 654
integer y = 1344
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
boolean cancel = true
end type

event clicked;istr_where.chk = "N"	
closewithreturn(parent, istr_where)

end event

type cb_2 from commandbutton within w_mpsfcdayuser_m
integer x = 654
integer y = 232
integer width = 457
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "작업자 추가"
end type

event clicked;gs_where lst_code
long ll_row

lst_code.str1 = istr_where.str1
lst_code.str2 = istr_where.str2
openwithparm(w_whuser_w, lst_code)
lst_code = message.powerobjectparm
if lst_code.chk = "N" then return

ll_row = dw_1.insertrow(0)
dw_1.object.sfcdayuser_area_no[ll_row] = gs_area
dw_1.object.sfcdayuser_wc_no[ll_row] = istr_where.str1
dw_1.object.sfcdayuser_sfc_date[ll_row] = date(istr_where.str2)
dw_1.object.sfcdayuser_user_id[ll_row] = lst_code.str1
wf_update1(dw_1, 'N')
dw_1.retrieve(gs_area, istr_where.str1, date(istr_where.str2) )
		


end event

type st_3 from statictext within w_mpsfcdayuser_m
integer x = 18
integer y = 16
integer width = 622
integer height = 128
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 16711935
string text = "작업장"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_mpsfcdayuser_m
integer x = 654
integer y = 1232
integer width = 457
integer height = 92
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
end type

event clicked;istr_where.chk = "N"	
closewithreturn(parent, istr_where)

end event

type dw_1 from datawindow within w_mpsfcdayuser_m
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 18
integer y = 160
integer width = 622
integer height = 1276
integer taborder = 10
string title = "none"
string dataobject = "d_mpsfcdayuser_m"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

