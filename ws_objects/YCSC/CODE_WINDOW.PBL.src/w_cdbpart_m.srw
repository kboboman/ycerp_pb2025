$PBExportHeader$w_cdbpart_m.srw
$PBExportComments$조업자재사용부서(1999/06/07,이인호)
forward
global type w_cdbpart_m from w_inheritance
end type
end forward

global type w_cdbpart_m from w_inheritance
integer x = 320
integer y = 552
integer width = 1422
integer height = 1340
string title = "조업자재 사용부서(w_cdbpart_m)"
end type
global w_cdbpart_m w_cdbpart_m

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

on w_cdbpart_m.create
call super::create
end on

on w_cdbpart_m.destroy
call super::destroy
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

end event

type pb_save from w_inheritance`pb_save within w_cdbpart_m
integer x = 1129
integer y = 724
end type

event pb_save::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
wf_update1(dw_1, "Y")



end event

type dw_1 from w_inheritance`dw_1 within w_cdbpart_m
integer x = 46
integer width = 1047
integer height = 884
string dataobject = "d_cdbpart_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdbpart_m
boolean visible = false
integer x = 1243
integer y = 220
integer width = 50
integer height = 44
string dataobject = "d_cdcountry_r"
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdbpart_m
integer width = 1275
string text = "조업자재 사용부서"
end type

type st_tips from w_inheritance`st_tips within w_cdbpart_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdbpart_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdbpart_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdbpart_m
integer x = 1129
integer y = 868
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdbpart_m
boolean visible = false
integer x = 1097
integer y = 580
end type

type pb_cancel from w_inheritance`pb_cancel within w_cdbpart_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdbpart_m
integer x = 1129
integer y = 580
end type

event pb_delete::clicked;long ll_row
string ls_partno

dw_1.accepttext()
if dw_1.getrow() < 1 then return

ls_partno = trim(dw_1.object.part_no[dw_1.getrow()])

select count(*) into :ll_row from binitem where part_code = :ls_partno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 일보에서 이미 사용중입니다. 삭제할 수 없습니다!")
	return
end if
dw_1.deleterow(dw_1.getrow())


end event

type pb_insert from w_inheritance`pb_insert within w_cdbpart_m
integer x = 1129
integer y = 436
end type

event pb_insert::clicked;long ll_row, ll_count

dw_1.accepttext()
dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setcolumn('part_no')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdbpart_m
integer x = 1129
integer y = 292
end type

event pb_retrieve::clicked;//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"R",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdbpart_m
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdbpart_m
integer x = 27
integer y = 236
integer width = 1303
integer height = 968
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdbpart_m
boolean visible = false
integer x = 1134
integer y = 244
integer width = 233
integer height = 636
long textcolor = 0
long backcolor = 79416533
end type

