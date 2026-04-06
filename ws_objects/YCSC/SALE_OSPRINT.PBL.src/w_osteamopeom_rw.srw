$PBExportHeader$w_osteamopeom_rw.srw
$PBExportComments$매출실적 집계현황(주간)
forward
global type w_osteamopeom_rw from w_inheritance
end type
type em_1 from editmask within w_osteamopeom_rw
end type
type st_1 from statictext within w_osteamopeom_rw
end type
type st_2 from statictext within w_osteamopeom_rw
end type
type pb_1 from picturebutton within w_osteamopeom_rw
end type
type cbx_2 from checkbox within w_osteamopeom_rw
end type
end forward

global type w_osteamopeom_rw from w_inheritance
integer x = 23
integer y = 112
integer width = 5595
integer height = 3088
string title = "매출실적 집계현황(주간)(w_osteamopeom_w_r)"
string icon = "Hand!"
em_1 em_1
st_1 st_1
st_2 st_2
pb_1 pb_1
cbx_2 cbx_2
end type
global w_osteamopeom_rw w_osteamopeom_rw

type variables
integer ii_month
end variables

on w_osteamopeom_rw.create
int iCurrent
call super::create
this.em_1=create em_1
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.cbx_2=create cbx_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.cbx_2
end on

on w_osteamopeom_rw.destroy
call super::destroy
destroy(this.em_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.cbx_2)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false

em_1.text = string(today(),'yyyy/mm/dd')
dw_1.sharedata( dw_2 )

dw_1.object.t_w01.background.color      = rgb(147, 205, 221)   // 목표
dw_1.object.t_w02.background.color      = rgb(147, 205, 221)   // 및
dw_1.object.t_w03.background.color      = rgb(147, 205, 221)   // 실적
dw_1.object.coll0_t.background.color    = rgb(147, 205, 221)   // 0주 목표
dw_1.object.week0_t.background.color    = rgb(147, 205, 221)   // 0주 실적
dw_1.object.per0_t.background.color     = rgb(147, 205, 221)   // 0주 진행율
                                        
dw_1.object.t_w11.background.color      = rgb(184, 204, 228)   // 1주
dw_1.object.t_w12.background.color      = rgb(184, 204, 228)   // 1주
dw_1.object.t_w13.background.color      = rgb(184, 204, 228)   // 1주
dw_1.object.coll1_t.background.color    = rgb(184, 204, 228)   // 1주 목표
dw_1.object.week1_t.background.color    = rgb(184, 204, 228)   // 1주 실적
dw_1.object.per1_t.background.color     = rgb(184, 204, 228)   // 1주 진행율
                                        
dw_1.object.t_w21.background.color      = rgb(230, 185, 184)   // 2주
dw_1.object.t_w22.background.color      = rgb(230, 185, 184)   // 2주
dw_1.object.t_w23.background.color      = rgb(230, 185, 184)   // 2주
dw_1.object.coll2_t.background.color    = rgb(230, 185, 184)   // 2주 목표
dw_1.object.week2_t.background.color    = rgb(230, 185, 184)   // 2주 실적
dw_1.object.per2_t.background.color     = rgb(230, 185, 184)   // 2주 진행율
                                        
dw_1.object.t_w31.background.color      = rgb(194, 214, 154)   // 3주
dw_1.object.t_w32.background.color      = rgb(194, 214, 154)   // 3주
dw_1.object.t_w33.background.color      = rgb(194, 214, 154)   // 3주
dw_1.object.coll3_t.background.color    = rgb(194, 214, 154)   // 3주 목표    
dw_1.object.week3_t.background.color    = rgb(194, 214, 154)   // 3주 실적    
dw_1.object.per3_t.background.color     = rgb(194, 214, 154)   // 3주 진행율  
                                                                              
dw_1.object.t_w41.background.color      = rgb(204, 192, 218)   // 4주         
dw_1.object.t_w42.background.color      = rgb(204, 192, 218)   // 4주         
dw_1.object.t_w43.background.color      = rgb(204, 192, 218)   // 4주         
dw_1.object.coll4_t.background.color    = rgb(204, 192, 218)   // 4주 목표    
dw_1.object.week4_t.background.color    = rgb(204, 192, 218)   // 4주 실적    
dw_1.object.per4_t.background.color     = rgb(204, 192, 218)   // 4주 진행율  

dw_1.object.cf_coll4_g3.background.color= rgb(204, 192, 218)   // 4주 목표계
dw_1.object.cf_week4_g3.background.color= rgb(204, 192, 218)   // 4주 실적계
dw_1.object.per4_g3.background.color    = rgb(204, 192, 218)   // 4주 진행계

dw_1.object.t_w51.background.color      = rgb(250, 192, 144)   // 5주
dw_1.object.t_w52.background.color      = rgb(250, 192, 144)   // 5주
dw_1.object.t_w53.background.color      = rgb(250, 192, 144)   // 5주
dw_1.object.coll5_t.background.color    = rgb(250, 192, 144)   // 5주 목표    
dw_1.object.week5_t.background.color    = rgb(250, 192, 144)   // 5주 실적    
dw_1.object.per5_t.background.color     = rgb(250, 192, 144)   // 5주 진행율  
                                        
dw_1.object.t_wt1.background.color      = rgb(147, 205, 221)   // 누계
dw_1.object.t_wt2.background.color      = rgb(147, 205, 221)   // 목표 및
dw_1.object.t_wt3.background.color      = rgb(147, 205, 221)   // 실적
dw_1.object.collt_t.background.color    = rgb(147, 205, 221)   // 누계 목표    
dw_1.object.weekt_t.background.color    = rgb(147, 205, 221)   // 누계 실적    
dw_1.object.pertot_t.background.color   = rgb(147, 205, 221)   // 누계 진행율  

dw_1.object.cf_coll1_g3.background.color= rgb(184, 204, 228)   // 1주 목표계
dw_1.object.cf_week1_g3.background.color= rgb(184, 204, 228)   // 1주 실적계
dw_1.object.per1_g3.background.color    = rgb(184, 204, 228)   // 1주 진행계

dw_1.object.cf_coll2_g3.background.color= rgb(230, 185, 184)   // 2주 목표계
dw_1.object.cf_week2_g3.background.color= rgb(230, 185, 184)   // 2주 실적계
dw_1.object.per2_g3.background.color    = rgb(230, 185, 184)   // 2주 진행계

dw_1.object.cf_coll3_g3.background.color= rgb(194, 214, 154)   // 3주 목표계
dw_1.object.cf_week3_g3.background.color= rgb(194, 214, 154)   // 3주 실적계
dw_1.object.per3_g3.background.color    = rgb(194, 214, 154)   // 3주 진행계

dw_1.object.cf_coll5_g3.background.color= rgb(250, 192, 144)   // 5주 목표계
dw_1.object.cf_week5_g3.background.color= rgb(250, 192, 144)   // 5주 실적계
dw_1.object.per5_g3.background.color    = rgb(250, 192, 144)   // 5주 진행계

dw_1.object.cf_collt_g3.background.color= rgb(147, 205, 221)   // 누계 목표계
dw_1.object.cf_weekt_g3.background.color= rgb(147, 205, 221)   // 누계 실적계
dw_1.object.pert_g3.background.color    = rgb(147, 205, 221)   // 누계 진행계

dw_1.object.cf_mod_g3.background.color=	rgb(147, 205, 221)   // 목표 및 실적계
dw_1.object.cf_modweekt_g3.background.color= rgb(147, 205, 221)// 목표 및 실적계
dw_1.object.cf_pert_g3.background.color    = rgb(147, 205, 221)// 목표 및 실적계

end event

event resize;call super::resize;//
gb_2.width  = newwidth  - 46
gb_2.height = newheight - 280

dw_1.width  = newwidth  - 87
dw_1.height = newheight - 420

end event

type pb_save from w_inheritance`pb_save within w_osteamopeom_rw
boolean visible = false
integer taborder = 70
end type

type dw_1 from w_inheritance`dw_1 within w_osteamopeom_rw
integer x = 41
integer y = 340
integer width = 5399
integer height = 2356
integer taborder = 140
string dataobject = "d_osteamopeom_tw"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from w_inheritance`dw_2 within w_osteamopeom_rw
integer x = 1632
integer y = 16
integer width = 169
integer height = 120
integer taborder = 80
string dataobject = "d_osteamopeom_rw"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_osteamopeom_rw
integer width = 1522
string text = "매출실적 집계현황(주간)"
end type

type st_tips from w_inheritance`st_tips within w_osteamopeom_rw
end type

type pb_compute from w_inheritance`pb_compute within w_osteamopeom_rw
boolean visible = false
integer x = 2679
integer y = 48
integer taborder = 100
end type

type pb_print_part from w_inheritance`pb_print_part within w_osteamopeom_rw
boolean visible = false
integer taborder = 60
end type

type pb_close from w_inheritance`pb_close within w_osteamopeom_rw
integer x = 4174
integer taborder = 50
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_osteamopeom_rw
integer x = 3982
integer taborder = 40
end type

event pb_print::clicked;//
w_repsuper w_print
st_print   l_print
 
if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 월매출 실적집계 현황(주간)을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=80'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_osteamopeom_rw
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_osteamopeom_rw
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_osteamopeom_rw
boolean visible = false
integer taborder = 130
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_osteamopeom_rw
integer x = 3598
integer taborder = 20
boolean default = true
end type

event pb_retrieve::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security
string ls_date, ls_sdate, ls_edate, ls_yyyymm
long   ll_year, ll_month, ll_year2

dw_1.reset()
dw_2.reset()

debugbreak()
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
ll_year2 = ll_year - 1 //(전년도 월매출 실적 집계 사항을 가져오기 위함)

string ls_level_userid
choose case gs_level
	case 'A', 'B'
		ls_level_userid = '%'		
	case 'C'
		ls_level_userid = gs_userid
end choose

dw_1.setredraw(false)
dw_1.retrieve( ll_year, ll_month, ls_yyyymm, ls_sdate, ls_edate )
//dw_2.retrieve( ls_sdate, ls_edate, ls_yyyymm, ll_year, ll_month )
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_osteamopeom_rw
integer x = 2738
integer y = 12
integer width = 809
integer height = 204
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_osteamopeom_rw
integer x = 23
integer y = 224
integer width = 5440
integer height = 2496
integer taborder = 0
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_osteamopeom_rw
integer x = 3570
integer width = 827
integer taborder = 0
integer weight = 400
end type

type em_1 from editmask within w_osteamopeom_rw
integer x = 3095
integer y = 84
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

type st_1 from statictext within w_osteamopeom_rw
integer x = 2784
integer y = 100
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

type st_2 from statictext within w_osteamopeom_rw
integer x = 416
integer y = 276
integer width = 1614
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "(매출: V.A.T별도, 단위: 천원),   6주 -> 5주로 통합"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_osteamopeom_rw
integer x = 3790
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

type cbx_2 from checkbox within w_osteamopeom_rw
integer x = 73
integer y = 272
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

if this.checked = true then
	ls_colx = dw_1.object.mod_mm.x
	dw_1.object.datawindow.horizontalscrollsplit= ls_colx
else
	ls_colx = '0'
	dw_1.object.datawindow.horizontalscrollsplit= ls_colx
end if
end event

