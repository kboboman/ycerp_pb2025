$PBExportHeader$w_osteamopeom_rm.srw
$PBExportComments$매출실적 집계현황(월간)
forward
global type w_osteamopeom_rm from w_inheritance
end type
type em_1 from editmask within w_osteamopeom_rm
end type
type st_1 from statictext within w_osteamopeom_rm
end type
type st_2 from statictext within w_osteamopeom_rm
end type
type pb_1 from picturebutton within w_osteamopeom_rm
end type
type st_3 from statictext within w_osteamopeom_rm
end type
type rb_1 from radiobutton within w_osteamopeom_rm
end type
type rb_2 from radiobutton within w_osteamopeom_rm
end type
type rb_3 from radiobutton within w_osteamopeom_rm
end type
end forward

global type w_osteamopeom_rm from w_inheritance
integer x = 23
integer y = 112
integer width = 5134
integer height = 2224
string title = "매출실적 집계현황(월간)(w_osteamopeom_rm)"
string icon = "Hand!"
em_1 em_1
st_1 st_1
st_2 st_2
pb_1 pb_1
st_3 st_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
end type
global w_osteamopeom_rm w_osteamopeom_rm

type variables
integer ii_month
end variables

on w_osteamopeom_rm.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.st_3=create st_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_3
end on

on w_osteamopeom_rm.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
dw_2.visible = false

em_1.text = string(today(),'yyyy/mm/dd')


end event

event resize;call super::resize;//
dw_1.width  = newwidth  - 64
dw_1.height = newheight - 440

end event

type pb_save from w_inheritance`pb_save within w_osteamopeom_rm
boolean visible = false
integer x = 3058
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osteamopeom_rm
integer x = 27
integer y = 404
integer width = 4379
integer height = 1680
integer taborder = 140
string dataobject = "d_osteamopeom_tm"
boolean hsplitscroll = true
end type

type st_title from w_inheritance`st_title within w_osteamopeom_rm
integer width = 1618
string text = "매출실적 집계현황(월간)"
end type

type st_tips from w_inheritance`st_tips within w_osteamopeom_rm
end type

type pb_compute from w_inheritance`pb_compute within w_osteamopeom_rm
boolean visible = false
integer x = 2871
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamopeom_rm
boolean visible = false
integer x = 2875
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osteamopeom_rm
integer x = 4512
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamopeom_rm
integer x = 4320
integer taborder = 40
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.sharedata( dw_2 )

l_print.edate = Date(em_1.text)
l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 월매출 실적집계 현황(월간)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

/*2018.10.01 jowonsuk 임원담당용 출력물 추가 */
if rb_1.checked then		
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=76'
elseif rb_2.checked then
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=76'	
elseif rb_3.checked then	
	gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=73'		
end if

OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamopeom_rm
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_osteamopeom_rm
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_osteamopeom_rm
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamopeom_rm
event ue_1 pbm_custom01
integer x = 3931
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_date, ls_sdate, ls_edate
long   ll_year, ll_month, ll_year2
st_security lst_security

dw_1.reset() ; dw_2.reset()

if em_1.text = '' then
	messagebox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_date  = em_1.text
ls_sdate = LeftA(em_1.text, 8) + "01"
ls_edate = em_1.text

ll_year  = long(LeftA(ls_date, 4))
ll_month = integer(MidA(ls_date, 6, 2))
ii_month = ll_month


/*2018.10.01 jowonsuk 임원담당자 추가  */
if rb_1.checked then	
	dw_1.dataobject = "d_osteamopeom_tm"
	dw_2.dataobject = "d_osteamopeom_r"	
	dw_1.SetTransObject(SQLCA)	
	dw_2.SetTransObject(SQLCA)		
elseif rb_2.checked then	
	dw_1.dataobject = "d_osteamopeom_imwon_tm"
	dw_2.dataobject = "d_osteamopeom_imwon_r"		
	dw_1.SetTransObject(SQLCA)
	dw_2.SetTransObject(SQLCA)		
else
	dw_1.dataobject = "d_osteamopeom_saleimwon_tm"
	dw_2.dataobject = "d_osteamopeom_saleimwon_r"		
	dw_1.SetTransObject(SQLCA)
	dw_2.SetTransObject(SQLCA)			
end if
/*2018.10.01 jowonsuk 임원 조회용 */

// d_osteamopeom_tm_old
if GF_Permission("매출실적 집계현황(월간)", gs_userid) = "Y" then
	if dw_1.dataobject = "d_osteamopeom_tm_old" then
		dw_1.retrieve( ll_year, ll_month, ls_sdate, ls_edate )	
	else
		dw_1.retrieve( "%", ll_year, ll_month, ls_sdate, ls_edate )	
	end if
else
	dw_1.retrieve( gs_userid, ll_year, ll_month, ls_sdate, ls_edate )	
end if	



MessageBox("확인","조회완료",information!)

end event

type gb_3 from w_inheritance`gb_3 within w_osteamopeom_rm
integer x = 3077
integer y = 12
integer width = 809
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamopeom_rm
integer x = 27
integer width = 4379
integer height = 148
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osteamopeom_rm
integer x = 3899
integer width = 837
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osteamopeom_rm
integer x = 1481
integer y = 4
integer width = 142
integer height = 104
integer taborder = 80
string dataobject = "d_osteamopeom_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osteamopeom_rm
integer x = 3442
integer y = 88
integer width = 411
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
string displaydata = "T"
end type

event rbuttondown;
OpenWithParm(w_calendar, message.stringparm)
if Message.StringParm <> 'N' then
	this.text = string(date(Message.StringParm))
end if

end event

type st_1 from statictext within w_osteamopeom_rm
integer x = 3118
integer y = 104
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
boolean enabled = false
string text = "조회일자:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_osteamopeom_rm
integer x = 50
integer y = 288
integer width = 4334
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "[매출실적 누계금액은 매출대장의 총매출금액 / 1.1 로  일괄계산함(영세율포함) 차액 발생함]"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osteamopeom_rm
integer x = 4123
integer y = 52
integer width = 187
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dw_1.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dw_1.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인", "작업완료")
end if
end event

type st_3 from statictext within w_osteamopeom_rm
integer x = 1710
integer y = 36
integer width = 622
integer height = 168
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "매출: V.A.T별도, 수금: V.A.T포함, 단위: 천원"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_osteamopeom_rm
integer x = 2359
integer y = 24
integer width = 384
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "영업담당"
boolean checked = true
end type

type rb_2 from radiobutton within w_osteamopeom_rm
integer x = 2359
integer y = 96
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "(부)영업담당"
end type

type rb_3 from radiobutton within w_osteamopeom_rm
integer x = 2359
integer y = 168
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "(정),(부)영업담당"
end type

