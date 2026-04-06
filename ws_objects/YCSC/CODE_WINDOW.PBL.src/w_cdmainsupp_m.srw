$PBExportHeader$w_cdmainsupp_m.srw
$PBExportComments$물품별 주거래처관리(1998/02/09,곽용덕)
forward
global type w_cdmainsupp_m from w_inheritance
end type
type dw_3 from datawindow within w_cdmainsupp_m
end type
end forward

global type w_cdmainsupp_m from w_inheritance
integer width = 3502
integer height = 2044
string title = "물품별 주거래처관리(w_cdmainsupp_m)"
dw_3 dw_3
end type
global w_cdmainsupp_m w_cdmainsupp_m

type variables
datawindowchild idwc_supp
st_print i_print
end variables

on w_cdmainsupp_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
end on

on w_cdmainsupp_m.destroy
call super::destroy
destroy(this.dw_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_3.settransobject(sqlca)
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
idwc_supp.insertrow(0)

dw_1.retrieve()
end event

type pb_save from w_inheritance`pb_save within w_cdmainsupp_m
integer x = 3022
end type

event pb_save::clicked;string ls_item,ls_supp,ls_qa
long ll_row,ll_cnt,i
dwItemStatus l_status
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_1.accepttext()
ll_row = dw_1.rowcount()
for i = 1 to ll_row
    l_status = dw_1.GetItemStatus(i, 0, Primary!)
	 if (l_status = datamodified!) then
		 ls_item = trim(dw_1.object.item_no[i])
		 ls_qa = trim(dw_1.object.qa[i])
		 ls_supp = trim(dw_1.object.supplier[i])
		 update supplier set priority_flag = 'Y'
		 where item_no = :ls_item and qa = :ls_qa and supp_no = :ls_supp;
	 end if
next
wf_update1(dw_1,"Y")

end event

type dw_1 from w_inheritance`dw_1 within w_cdmainsupp_m
integer x = 27
integer width = 3392
integer height = 1580
string dataobject = "d_cdmainsupp_m"
boolean hscrollbar = false
boolean border = false
end type

event dw_1::itemfocuschanged;call super::itemfocuschanged;string ls_supp,ls_item,ls_qa

ls_item = trim(dw_1.object.item_no[row])
ls_qa = trim(dw_1.object.qa[row])
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
if idwc_supp.retrieve(ls_item,ls_qa) < 1 then
	idwc_supp.insertrow(0)
end if

//MessageBox("Greeting", "Hello User")
end event

event dw_1::itemchanged;call super::itemchanged;dw_1.object.supp_supp_name[row] = idwc_supp.getitemstring(idwc_supp.getrow(),'supp_supp_name')
end event

event dw_1::rowfocuschanged;string ls_supp,ls_item,ls_qa
this.accepttext()

ls_item = trim(dw_1.object.item_no[currentrow])
ls_qa = trim(dw_1.object.qa[currentrow])
dw_1.getchild('supplier',idwc_supp)
idwc_supp.settransobject(sqlca)
if idwc_supp.retrieve(ls_item,ls_qa) < 1 then
	idwc_supp.insertrow(0)
end if

//MessageBox("Greeting", "Hello User")
end event

type dw_2 from w_inheritance`dw_2 within w_cdmainsupp_m
boolean visible = false
integer x = 1938
integer y = 40
integer width = 261
integer height = 156
end type

type st_title from w_inheritance`st_title within w_cdmainsupp_m
integer x = 32
integer width = 1810
string text = "물품별 주거래처 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdmainsupp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdmainsupp_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdmainsupp_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdmainsupp_m
integer x = 3214
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdmainsupp_m
integer x = 2825
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

dw_3.retrieve()
i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은  물품별 주거래처를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=105'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdmainsupp_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdmainsupp_m
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_cdmainsupp_m
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cdmainsupp_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_cdmainsupp_m
boolean visible = false
end type

type gb_2 from w_inheritance`gb_2 within w_cdmainsupp_m
integer x = 14
integer width = 3419
integer height = 1676
end type

type gb_1 from w_inheritance`gb_1 within w_cdmainsupp_m
integer x = 2793
integer width = 635
end type

type dw_3 from datawindow within w_cdmainsupp_m
boolean visible = false
integer x = 2249
integer y = 40
integer width = 210
integer height = 168
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_cdmainsupp_r"
boolean livescroll = true
end type

