$PBExportHeader$w_osteamopeom_rman.srw
$PBExportComments$매출실적 채권현황(직원)
forward 
global type w_osteamopeom_rman from w_inheritance
end type
type em_1 from editmask within w_osteamopeom_rman
end type
type st_1 from statictext within w_osteamopeom_rman
end type
type st_2 from statictext within w_osteamopeom_rman
end type
type pb_1 from picturebutton within w_osteamopeom_rman
end type
type cbx_2 from checkbox within w_osteamopeom_rman
end type
type cbx_1 from checkbox within w_osteamopeom_rman
end type
type dw_3 from datawindow within w_osteamopeom_rman
end type
type st_3 from statictext within w_osteamopeom_rman
end type
end forward

global type w_osteamopeom_rman from w_inheritance
integer x = 23
integer y = 112
integer width = 4215
integer height = 2332
string title = "매출실적 채권현황(직원)(w_osteamopeom_rman)"
string icon = "Hand!"
em_1 em_1
st_1 st_1
st_2 st_2
pb_1 pb_1
cbx_2 cbx_2
cbx_1 cbx_1
dw_3 dw_3
st_3 st_3
end type
global w_osteamopeom_rman w_osteamopeom_rman

type variables
integer ii_month
end variables

on w_osteamopeom_rman.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.st_3
end on

on w_osteamopeom_rman.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.st_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================
if GF_Permission("매출실적 채권현황(직원)", gs_userid) = "Y" then
else
	RETURN
end if

dw_3.SetTransObject(SQLCA)

dw_2.visible = false
dw_3.visible = false

em_1.text = string(gf_today(),'yyyy/mm/dd')

//dw_1.sharedata( dw_2 )

dw_1.object.t_incash.background.color      = rgb(147, 205, 221)   // 현금입금
dw_1.object.t_inbill.background.color      = rgb(147, 205, 221)   // 어음입금
dw_1.object.t_incashbill.background.color  = rgb(147, 205, 221)   // 현금어음계
dw_1.object.incash_t.background.color      = rgb(147, 205, 221)   // 현금입금
dw_1.object.inbill_t.background.color      = rgb(147, 205, 221)   // 어음입금
dw_1.object.incashbill_t.background.color  = rgb(147, 205, 221)   // 현금어음계
                                        
dw_1.object.rate_t.background.color        = rgb(147, 205, 221)   // 실적율
dw_1.object.notreceive_t.background.color  = rgb(147, 205, 221)   // 미입금액

dw_1.object.t_w11.background.color      = rgb(184, 204, 228)   // 1주
dw_1.object.t_w12.background.color      = rgb(184, 204, 228)   // 1주
dw_1.object.cash1_t.background.color    = rgb(184, 204, 228)   // 1주
dw_1.object.bill1_t.background.color    = rgb(184, 204, 228)   // 1주
                                        
dw_1.object.t_w21.background.color      = rgb(230, 185, 184)   // 2주
dw_1.object.t_w22.background.color      = rgb(230, 185, 184)   // 2주
dw_1.object.cash2_t.background.color    = rgb(230, 185, 184)   // 2주
dw_1.object.bill2_t.background.color    = rgb(230, 185, 184)   // 2주
                                        
dw_1.object.t_w31.background.color      = rgb(194, 214, 154)   // 3주
dw_1.object.t_w32.background.color      = rgb(194, 214, 154)   // 3주
dw_1.object.cash3_t.background.color    = rgb(194, 214, 154)   // 3주
dw_1.object.bill3_t.background.color    = rgb(194, 214, 154)   // 3주
                                                                              
dw_1.object.t_w41.background.color      = rgb(204, 192, 218)   // 4주         
dw_1.object.t_w42.background.color      = rgb(204, 192, 218)   // 4주         
dw_1.object.cash4_t.background.color    = rgb(204, 192, 218)   // 4주         
dw_1.object.bill4_t.background.color    = rgb(204, 192, 218)   // 4주         

dw_1.object.t_w51.background.color      = rgb(250, 192, 144)   // 5주
dw_1.object.t_w52.background.color      = rgb(250, 192, 144)   // 5주
dw_1.object.cash5_t.background.color    = rgb(250, 192, 144)   // 5주
dw_1.object.bill5_t.background.color    = rgb(250, 192, 144)   // 5주
                                        
dw_1.object.t_wt1.background.color      = rgb(147, 205, 221)   // 현금걔
dw_1.object.t_wt2.background.color      = rgb(147, 205, 221)   // 어음계
dw_1.object.t_wt3.background.color      = rgb(147, 205, 221)   // 현금어음계
dw_1.object.totcash_t.background.color  = rgb(147, 205, 221)   // 현금걔
dw_1.object.totbill_t.background.color  = rgb(147, 205, 221)   // 어음계
dw_1.object.totcashbill_t.background.color  = rgb(147, 205, 221)   // 현금어음계

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - (gb_2.x * 2)

dw_1.width  = newwidth  - (gb_2.x * 2)
dw_1.height = newheight - dw_1.y - gb_2.x

dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height


end event

type pb_save from w_inheritance`pb_save within w_osteamopeom_rman
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osteamopeom_rman
integer x = 32
integer y = 400
integer width = 4105
integer height = 1788
integer taborder = 140
string title = "d_osteamaroi_t2"
string dataobject = "d_osteamopeom_tman"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::resize;call super::resize;gb_2.width = dw_1.width + 35
gb_2.height = dw_1.height + 120

end event

type st_title from w_inheritance`st_title within w_osteamopeom_rman
integer y = 20
integer width = 1522
integer height = 140
string text = "매출실적 채권현황(직원)"
end type

type st_tips from w_inheritance`st_tips within w_osteamopeom_rman
end type

type pb_compute from w_inheritance`pb_compute within w_osteamopeom_rman
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamopeom_rman
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osteamopeom_rman
integer x = 3913
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamopeom_rman
integer x = 3721
integer taborder = 40
end type

event pb_print::clicked;////
//w_repsuper w_print
//st_print   l_print
// 
//if dw_1.rowcount() < 1 then return
//
////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//l_print.st_datawindow  = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 월매출 실적집계 현황(주간)을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
//OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)
//
//
//
end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamopeom_rman
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_osteamopeom_rman
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_osteamopeom_rman
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamopeom_rman
integer x = 3337
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security
string ls_date, ls_sdate, ls_edate, ls_yyyymm
long   ll_year, ll_month

dw_1.reset()
dw_2.reset()

if em_1.text = '' then
	messagebox("확인","해당월을 입력하세요!",information!)
	em_1.setfocus()
	return
end if

ls_sdate = LeftA(em_1.text, 8) + "01"
ls_date  = string(date(em_1.text),"yyyymmdd")

SELECT top 1 dbo.UF_GETLASTDAY( :ls_date ) INTO :ls_edate FROM login;
ls_yyyymm= LeftA(em_1.text, 7)

ll_year  = long(LeftA(ls_date, 4))
ll_month = integer(MidA(ls_date, 5, 2))
ii_month = ll_month

string ls_level_userid
choose case gs_level
	case 'A', 'B'
		ls_level_userid = '%'		
	case 'C'
		ls_level_userid = gs_userid
end choose

dw_1.setredraw(false)
dw_1.retrieve( ll_year, ll_month, ls_yyyymm, ls_sdate, ls_edate )
dw_3.retrieve( ll_year, ll_month, ls_yyyymm, ls_sdate, ls_edate )
dw_1.setredraw(true)
MessageBox("확인","조회완료",information!)

end event

type gb_3 from w_inheritance`gb_3 within w_osteamopeom_rman
integer x = 2478
integer y = 12
integer width = 809
integer height = 204
integer taborder = 0
integer textsize = -10
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamopeom_rman
integer y = 224
integer width = 4105
integer height = 160
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osteamopeom_rman
integer x = 3310
integer width = 827
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_osteamopeom_rman
integer x = 55
integer y = 180
integer width = 78
integer height = 64
integer taborder = 80
string title = "d_osteamaroiweek_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type em_1 from editmask within w_osteamopeom_rman
integer x = 2843
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

type st_1 from statictext within w_osteamopeom_rman
integer x = 2533
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

type st_2 from statictext within w_osteamopeom_rman
integer x = 439
integer y = 296
integer width = 1829
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "(매출: V.A.T포함, 단위: 천원),   6주 -> 5주로 통합"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osteamopeom_rman
integer x = 3529
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
DataWindow dwxls

if cbx_1.checked = true then
	dwxls = dw_3
else
	dwxls = dw_1
end if

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	
	MessageBox("확인", "작업완료")
end if
end event

type cbx_2 from checkbox within w_osteamopeom_rman
integer x = 96
integer y = 292
integer width = 306
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "틀고정"
end type

event clicked;// 틀고정
string ls_colx

if dw_1.visible = true then
	if this.checked = true then
		ls_colx = dw_1.object.bf_amount.x
		dw_1.object.datawindow.horizontalscrollsplit= ls_colx
	else
		ls_colx = '0'
		dw_1.object.datawindow.horizontalscrollsplit= ls_colx
	end if
end if

end event

type cbx_1 from checkbox within w_osteamopeom_rman
integer x = 2505
integer y = 16
integer width = 229
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "원본"
end type

event clicked;//
if this.checked = true then
	dw_3.visible = true
else
	dw_3.visible = false
end if

end event

type dw_3 from datawindow within w_osteamopeom_rman
integer x = 599
integer y = 664
integer width = 3287
integer height = 1292
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_osteamopeom_tman1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_osteamopeom_rman
integer x = 2281
integer y = 296
integer width = 1627
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "총합계 월말잔액은 내부업체 공제(회계자료 일치)"
boolean focusrectangle = false
end type

