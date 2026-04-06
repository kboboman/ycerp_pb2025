$PBExportHeader$w_ocp_aban_r.srw
$PBExportComments$제품폐기List(2003/05/30이규배)
forward 
global type w_ocp_aban_r from window
end type
type cb_print from commandbutton within w_ocp_aban_r
end type
type cb_retrieve from commandbutton within w_ocp_aban_r
end type
type dw_1 from datawindow within w_ocp_aban_r
end type
type dw_r from datawindow within w_ocp_aban_r
end type
end forward

global type w_ocp_aban_r from window
integer width = 3355
integer height = 2184
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 79741120
cb_print cb_print
cb_retrieve cb_retrieve
dw_1 dw_1
dw_r dw_r
end type
global w_ocp_aban_r w_ocp_aban_r

forward prototypes
public function integer of_dwtoexcel ()
end prototypes

public function integer of_dwtoexcel ();
//iris_n_cst_excel		lnv_excel
String					ls_path


//lnv_excel = CREATE iris_n_cst_excel

// 엑셀파일로 저장합니다.
//ls_path = lnv_excel.of_DWToExcel(dw_1)


//DESTROY lnv_excel


RETURN 1


end function

on w_ocp_aban_r.create
this.cb_print=create cb_print
this.cb_retrieve=create cb_retrieve
this.dw_1=create dw_1
this.dw_r=create dw_r
this.Control[]={this.cb_print,&
this.cb_retrieve,&
this.dw_1,&
this.dw_r}
end on

on w_ocp_aban_r.destroy
destroy(this.cb_print)
destroy(this.cb_retrieve)
destroy(this.dw_1)
destroy(this.dw_r)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

string ls_today
long ll_row

Title = '제품폐기list[w_ocp_aban_r]'

dw_1.SetTransObject(SQLCA)

ll_row = dw_r.InsertRow(0)

ls_today = string(today(), 'YYYYMMDD') //오늘날짜 구하기

dw_r.Setitem(ll_row,'from_dt', ls_today)
dw_r.Setitem(ll_row,'to_dt', ls_today)

end event

type cb_print from commandbutton within w_ocp_aban_r
integer x = 2962
integer y = 76
integer width = 320
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "프린트"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

//if dw_2.rowcount() < 1 then
//	return
//end if

//l_print.name = 'd_oisaledorep_r'
l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : B4"
l_print.st_print_desc = " 이 프로그램은 폐기물품LIST을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=12 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type cb_retrieve from commandbutton within w_ocp_aban_r
integer x = 2624
integer y = 76
integer width = 320
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "조회"
boolean default = true
end type

event clicked;long ll_row, ll_cnt
string ls_from, ls_to, ls_gubun

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_r.AcceptText()
ll_row = dw_r.GetRow()

ls_from  = dw_r.GetItemString(ll_row, 'from_dt')
ls_to    = dw_r.GetItemString(ll_row, 'to_dt')
ls_gubun = dw_r.GetItemString(ll_row, 'gubun')

ll_cnt = dw_1.Retrieve(ls_from, ls_to, ls_gubun)

if ll_cnt > 0 then
	dw_1.Object.t_from_to.Text = String(ls_from, '@@@@/@@/@@') + ' ~ ' + String(ls_to, '@@@@/@@/@@') + &
	                             '[' + dw_r.Describe("Evaluate('LookUpDisplay(gubun)', 1)") + ']'
else
	messageBox('알림', '검색된 행이 없습니다.')
	Return
end if

end event

type dw_1 from datawindow within w_ocp_aban_r
integer y = 240
integer width = 3319
integer height = 1868
string title = "none"
string dataobject = "d_ocp_aban_r1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_r from datawindow within w_ocp_aban_r
integer y = 20
integer width = 3319
integer height = 216
string title = "none"
string dataobject = "d_ocp_aban_w1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;Choose case dwo.name
	case 'from_dt'
		Openwithparm(w_calendar, Message.stringparm)
		this.object.from_dt[1] = string(date(message.stringparm), 'yyyymmdd')
	case 'to_dt'
		Openwithparm(w_calendar, Message.stringparm)
		this.object.to_dt[1] = string(date(message.stringparm), 'yyyymmdd')
end choose

end event

