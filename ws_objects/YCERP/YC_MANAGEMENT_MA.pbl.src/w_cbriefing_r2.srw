$PBExportHeader$w_cbriefing_r2.srw
$PBExportComments$현장/입찰 내역서(2004/07/09,이인호)
forward 
global type w_cbriefing_r2 from w_inheritance
end type
type ddlb_1 from dropdownlistbox within w_cbriefing_r2
end type
type st_1 from statictext within w_cbriefing_r2
end type
type ddlb_2 from dropdownlistbox within w_cbriefing_r2
end type
type st_2 from statictext within w_cbriefing_r2
end type
type ddlb_3 from dropdownlistbox within w_cbriefing_r2
end type
type st_3 from statictext within w_cbriefing_r2
end type
type cbx_1 from checkbox within w_cbriefing_r2
end type
type em_1 from editmask within w_cbriefing_r2
end type
type st_4 from statictext within w_cbriefing_r2
end type
type em_2 from editmask within w_cbriefing_r2
end type
type pb_1 from picturebutton within w_cbriefing_r2
end type
end forward

global type w_cbriefing_r2 from w_inheritance
integer y = 112
integer width = 4055
integer height = 2180
string title = "현설및 입찰내역서(w_cbriefing_r2)"
ddlb_1 ddlb_1
st_1 st_1
ddlb_2 ddlb_2
st_2 st_2
ddlb_3 ddlb_3
st_3 st_3
cbx_1 cbx_1
em_1 em_1
st_4 st_4
em_2 em_2
pb_1 pb_1
end type
global w_cbriefing_r2 w_cbriefing_r2

type variables
st_print i_print

end variables

forward prototypes
public subroutine wf_weekcntmake ()
end prototypes

public subroutine wf_weekcntmake ();int    li_cnt,  li_end,   li_daynum, li_tot, li_weekcnt
string ls_week, ls_ndate
date   ld_date, ld_ndate, ld_edate

ld_date = date(string(ddlb_1.text) + "/" + string(ddlb_2.text) + "/01" )
li_daynum = DayNumber(ld_date) - 1
ld_ndate = RelativeDate(ld_date, 32)
ls_ndate = string(ld_ndate, 'yyyy/mm/01')
ld_edate = RelativeDate(date(ls_ndate), -1)
li_end = day(ld_edate)
li_tot = li_end + li_daynum

li_weekcnt = truncate(li_tot / 7, 0)

ddlb_3.enabled = true
ddlb_3.reset()

li_cnt = 0
for li_cnt = 1 to li_weekcnt
	ddlb_3.InsertItem(string(li_cnt), li_cnt)
next


end subroutine

on w_cbriefing_r2.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.ddlb_3=create ddlb_3
this.st_3=create st_3
this.cbx_1=create cbx_1
this.em_1=create em_1
this.st_4=create st_4
this.em_2=create em_2
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ddlb_2
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.ddlb_3
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.em_2
this.Control[iCurrent+11]=this.pb_1
end on

on w_cbriefing_r2.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.ddlb_3)
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.em_1)
destroy(this.st_4)
destroy(this.em_2)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

int li_year, li_cnt

dw_1.SetTransObject(SQLCA)
dw_2.settransobject(SQLCA)

li_cnt = 0
for li_year = 2004 to year(today()) + 5
	li_cnt += li_cnt
	ddlb_1.InsertItem(string(li_year), li_cnt)
next
ddlb_1.text = string(year(today()))
ddlb_2.text = string(month(today()), "00")

wf_weekcntmake()
ddlb_3.text = "1"

em_1.text = string(today(), 'YYYY/MM/DD')
em_2.text = string(today(), 'YYYY/MM/DD')
em_1.enabled = false
em_2.enabled = false

dw_2.visible = false

dw_1.sharedata(dw_2)
This.TriggerEvent('ue_retrieve')

end event

event resize;call super::resize;//
dw_1.width  = this.width  - 114
dw_1.height = this.height - 428

end event

type pb_save from w_inheritance`pb_save within w_cbriefing_r2
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_cbriefing_r2
integer x = 37
integer y = 292
integer width = 3941
integer height = 1752
integer taborder = 0
string dataobject = "d_cbriefing_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_title from w_inheritance`st_title within w_cbriefing_r2
integer x = 55
integer y = 40
integer width = 1339
string text = "현설및 입찰내역서"
end type

type st_tips from w_inheritance`st_tips within w_cbriefing_r2
end type

type pb_compute from w_inheritance`pb_compute within w_cbriefing_r2
boolean visible = false
integer taborder = 60
end type

type pb_print_part from w_inheritance`pb_print_part within w_cbriefing_r2
boolean visible = false
integer x = 3205
integer taborder = 40
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

type pb_close from w_inheritance`pb_close within w_cbriefing_r2
integer x = 3753
integer y = 68
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cbriefing_r2
integer x = 3365
integer y = 68
integer taborder = 20
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper w_print
st_print l_print

if dw_2.rowcount() < 1 then
	messagebox("확인", "출력할 데이터가 없습니다")
	return
end if

l_print.st_datawindow = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 현설및 입찰내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cbriefing_r2
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_cbriefing_r2
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_cbriefing_r2
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_cbriefing_r2
integer x = 3173
integer y = 68
integer taborder = 10
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

int  li_year, li_mon,   li_cnt, li_tot, ll_row
date ld_date, ld_start, ld_end

dw_1.reset()
li_year = integer(ddlb_1.text)
li_mon  = integer(ddlb_2.text)
li_cnt  = integer(ddlb_3.text)

ld_date = date(string(ddlb_1.text) + "/" + string(ddlb_2.text) + "/01" )

li_tot  = li_cnt * 7 - ( DayNumber(ld_date) -1 )
ld_end  = date(string(ddlb_1.text) + "/" + string(ddlb_2.text) + "/" + string(li_tot) )

ld_start = RelativeDate(ld_end, -6)
if cbx_1.checked = true then
	ld_start = date(em_1.text)
	ld_end   = date(em_2.text)
	dw_1.retrieve(ld_start, ld_end, li_cnt, "Y")
else
	dw_1.retrieve(ld_start, ld_end, li_cnt, "Y")
end if

if gf_permission("판매현장설명참가내역서조회조건", gs_userid) = "Y" then
else
	for ll_row = 1 to dw_1.getrow()
		dw_1.object.top_opinion[ll_row] = " "
//		dw_2.object.top_opinion[ll_row] = " "
	next
end if

end event

type gb_3 from w_inheritance`gb_3 within w_cbriefing_r2
boolean visible = false
integer x = 1595
integer y = 16
integer width = 1134
integer height = 224
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_cbriefing_r2
integer x = 1582
integer y = 8
integer width = 1335
integer height = 240
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_cbriefing_r2
integer x = 3122
integer y = 24
integer width = 850
integer height = 216
integer taborder = 0
end type

type dw_2 from w_inheritance`dw_2 within w_cbriefing_r2
integer x = 1431
integer y = 72
integer width = 114
integer height = 92
integer taborder = 0
boolean enabled = false
string dataobject = "d_cbriefing_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type ddlb_1 from dropdownlistbox within w_cbriefing_r2
integer x = 1691
integer y = 64
integer width = 302
integer height = 736
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type st_1 from statictext within w_cbriefing_r2
integer x = 1998
integer y = 84
integer width = 119
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "년"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within w_cbriefing_r2
integer x = 2121
integer y = 64
integer width = 233
integer height = 736
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string item[] = {"01","02","03","04","05","06","07","08","09","10","11","12"}
end type

event selectionchanged;wf_weekcntmake()
ddlb_3.text = '1'

end event

type st_2 from statictext within w_cbriefing_r2
integer x = 2359
integer y = 84
integer width = 119
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "월"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_3 from dropdownlistbox within w_cbriefing_r2
integer x = 2482
integer y = 64
integer width = 233
integer height = 348
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

event selectionchanged;pb_retrieve.postevent(clicked!)
end event

type st_3 from statictext within w_cbriefing_r2
integer x = 2720
integer y = 84
integer width = 160
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "주차"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_cbriefing_r2
integer x = 1605
integer y = 8
integer width = 238
integer height = 52
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "일자"
end type

event clicked;if this.checked = true then
	em_1.enabled = true
	em_2.enabled = true
	ddlb_1.enabled = false
	ddlb_2.enabled = false
	ddlb_3.enabled = false
else
	ddlb_1.enabled = true
	ddlb_2.enabled = true
	ddlb_3.enabled = true
	em_1.enabled = false
	em_2.enabled = false
end if

end event

type em_1 from editmask within w_cbriefing_r2
integer x = 1687
integer y = 156
integer width = 357
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_4 from statictext within w_cbriefing_r2
integer x = 2048
integer y = 164
integer width = 41
integer height = 72
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_cbriefing_r2
integer x = 2094
integer y = 156
integer width = 357
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event modified;if dw_1.rowcount() > 0 then
	dw_1.reset()
end if
end event

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type pb_1 from picturebutton within w_cbriefing_r2
event mousemove pbm_mousemove
integer x = 3552
integer y = 68
integer width = 187
integer height = 144
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

