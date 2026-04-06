$PBExportHeader$w_cdlocation_telno.srw
$PBExportComments$저장소담당자tel_no관리(2020/07/07 - bkkim)
forward
global type w_cdlocation_telno from w_inheritance
end type
type st_1 from statictext within w_cdlocation_telno
end type
end forward

global type w_cdlocation_telno from w_inheritance
integer width = 4439
integer height = 2196
string title = "저장소 담당 전화번호 관리(w_cdlocation_telno)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
long backcolor = 81838264
boolean center = true
st_1 st_1
end type
global w_cdlocation_telno w_cdlocation_telno

type variables

end variables

on w_cdlocation_telno.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_cdlocation_telno.destroy
call super::destroy
destroy(this.st_1)
end on

event open;call super::open;dw_1.settransobject(sqlca)

pb_retrieve.postevent('Clicked')
end event

type pb_save from w_inheritance`pb_save within w_cdlocation_telno
integer x = 3963
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

wf_update1(dw_1,"Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdlocation_telno
integer x = 37
integer y = 320
integer width = 4334
integer height = 1764
string dataobject = "d_cdlocation_telno"
end type

type st_title from w_inheritance`st_title within w_cdlocation_telno
integer width = 1463
string text = "저장소 담당 전화번호 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlocation_telno
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_compute from w_inheritance`pb_compute within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_close from w_inheritance`pb_close within w_cdlocation_telno
integer x = 4155
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_delete from w_inheritance`pb_delete within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

event pb_delete::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제는 전산실로 요청바람.",parent, li_x, li_y)


end event

type pb_insert from w_inheritance`pb_insert within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlocation_telno
integer x = 3771
end type

event pb_retrieve::clicked;call super::clicked;dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
integer textsize = -8
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cdlocation_telno
integer x = 23
integer y = 284
integer width = 4370
integer height = 1816
integer textsize = -8
integer weight = 400
long backcolor = 81838264
end type

type gb_1 from w_inheritance`gb_1 within w_cdlocation_telno
integer x = 3758
integer width = 613
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cdlocation_telno
boolean visible = false
integer x = 0
integer y = 0
integer width = 50
integer height = 52
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_cdlocation_telno
integer x = 37
integer y = 232
integer width = 2514
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 81838264
string text = "(* 저장소관리에 등록된 내용만 확인 가능하며 전화번호/비고만 수정됩니다.)"
boolean focusrectangle = false
end type

