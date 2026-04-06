$PBExportHeader$w_cdopeom_org_m_20180719.srw
$PBExportComments$매출집계 조직도
forward
global type w_cdopeom_org_m_20180719 from w_inheritance
end type
type cb_3 from commandbutton within w_cdopeom_org_m_20180719
end type
type st_4 from statictext within w_cdopeom_org_m_20180719
end type
type st_1 from statictext within w_cdopeom_org_m_20180719
end type
end forward

global type w_cdopeom_org_m_20180719 from w_inheritance
integer x = 320
integer y = 552
integer width = 3456
integer height = 1736
string title = "매출집계 조직도(w_cdopeom_org_m)"
cb_3 cb_3
st_4 st_4
st_1 st_1
end type
global w_cdopeom_org_m_20180719 w_cdopeom_org_m_20180719

type variables
public string is_bank_code,is_bank_name,is_bank_id
st_print i_print
string is_sql
boolean ib_check = true
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_1.SetTransObject(SQLCA)

if gf_permission('매출집계_조직도', gs_userid) = 'Y' then
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled   = false
end if
	
end event

on w_cdopeom_org_m_20180719.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_4=create st_4
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_1
end on

on w_cdopeom_org_m_20180719.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_4)
destroy(this.st_1)
end on

event resize;call super::resize;//
gb_2.width  = newwidth  - 68
gb_2.height = newheight - 260

dw_1.width  = newwidth  - 137
dw_1.height = newheight - 352
end event

type pb_save from w_inheritance`pb_save within w_cdopeom_org_m_20180719
integer x = 2971
integer y = 60
end type

event pb_save::clicked;//
int li_cnt1, li_cnt2, ll_count

dw_1.accepttext()

if dw_1.rowcount() < 1 then return

//FOR ll_count = 1 TO dw_1.rowcount()
//	IF isnull(dw_1.object.user_id[ll_count]) OR dw_1.object.user_id[ll_count] <= "" THEN
//		messagebox("입력오류", string(ll_count) + " 번째 영업사원을 입력하십시오")
//		dw_1.setcolumn("user_id")
//		dw_1.setfocus()
//		dw_1.scrolltorow(ll_count)
//		return
//	END IF
//NEXT
//FOR li_cnt1 = 1 TO dw_1.rowcount()
//	FOR li_cnt2 = li_cnt1 + 1 TO dw_1.rowcount()
//	    IF dw_1.object.user_id[li_cnt1] = dw_1.object.user_id[li_cnt2] THEN
//		    messagebox("중복오류", string(li_cnt1) + " 번째와" + string(li_cnt2) + &
//		            " 번째 영업사원이 중복되었습니다.")
//			 return
//		END IF
//   NEXT
//NEXT		            

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
wf_update1(dw_1, "Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdopeom_org_m_20180719
integer x = 59
integer width = 3282
integer height = 1280
string dataobject = "d_cdopeom_org_m"
boolean hscrollbar = false
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_cdopeom_org_m_20180719
boolean visible = false
integer x = 1851
integer y = 4
integer width = 187
integer height = 80
integer taborder = 60
boolean vscrollbar = false
boolean border = false
end type

event dw_2::dberror;call super::dberror;//return 1
end event

type st_title from w_inheritance`st_title within w_cdopeom_org_m_20180719
integer width = 1138
string text = "매출집계 조직도"
end type

type st_tips from w_inheritance`st_tips within w_cdopeom_org_m_20180719
end type

type pb_compute from w_inheritance`pb_compute within w_cdopeom_org_m_20180719
boolean visible = false
integer taborder = 90
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdopeom_org_m_20180719
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdopeom_org_m_20180719
integer x = 3163
integer y = 60
integer taborder = 100
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdopeom_org_m_20180719
integer x = 2779
integer y = 60
integer taborder = 110
boolean enabled = false
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

l_print.st_datawindow  = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 매출집계 조직도를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdopeom_org_m_20180719
boolean visible = false
integer taborder = 120
end type

type pb_delete from w_inheritance`pb_delete within w_cdopeom_org_m_20180719
integer x = 2587
integer y = 60
integer taborder = 130
end type

event pb_delete::clicked;//
string ls_userid
int    li_count

if dw_1.rowcount() < 1 then return	

ls_userid = dw_1.object.user_id[dw_1.getrow()]
if ls_userid = "insite" then
	MessageBox("확인","내부업체는 삭제할 수 없습니다.")
	return
end if

if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then	return

dw_1.deleterow(0)
wf_update1(dw_1,"Y")


end event

type pb_insert from w_inheritance`pb_insert within w_cdopeom_org_m_20180719
integer x = 2395
integer y = 60
integer taborder = 150
end type

event pb_insert::clicked;long ll_row //, ll_count

dw_1.accepttext()

ll_row = dw_1.insertrow(0)

dw_1.object.rank[ll_row] = ""		// 직책

dw_1.scrolltorow(ll_row)
dw_1.setcolumn('seq')
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdopeom_org_m_20180719
integer x = 2203
integer y = 60
integer taborder = 140
end type

event pb_retrieve::clicked;call super::clicked;//
dw_1.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdopeom_org_m_20180719
boolean visible = false
integer x = 32
integer y = 272
integer width = 2386
integer height = 1008
integer taborder = 70
long textcolor = 0
long backcolor = 79416533
end type

type gb_2 from w_inheritance`gb_2 within w_cdopeom_org_m_20180719
integer x = 27
integer width = 3351
integer height = 1372
integer taborder = 80
long textcolor = 0
long backcolor = 79416533
end type

type gb_1 from w_inheritance`gb_1 within w_cdopeom_org_m_20180719
integer x = 2167
integer y = 20
integer width = 1211
long textcolor = 0
long backcolor = 79416533
end type

type cb_3 from commandbutton within w_cdopeom_org_m_20180719
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

event clicked;string ls_bankid

IF  ib_check = TRUE THEN
    ls_bankid = "bank_id A"
	 ib_check = FALSE
ELSE
    ls_bankid = "bank_id D"
	 ib_check = TRUE
END IF
wf_sort(dw_1,ls_bankid)

end event

type st_4 from statictext within w_cdopeom_org_m_20180719
integer x = 37
integer y = 204
integer width = 425
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 79416533
string text = "매출집계_조직도"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cdopeom_org_m_20180719
integer x = 1234
integer y = 72
integer width = 846
integer height = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79416533
string text = "~"영업사원 HP관리~" 에서 영업필드 체크요망."
boolean focusrectangle = false
end type

