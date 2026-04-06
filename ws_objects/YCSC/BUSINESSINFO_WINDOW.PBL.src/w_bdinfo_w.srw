$PBExportHeader$w_bdinfo_w.srw
$PBExportComments$XXXX공사정보조회조건[2000/11/29,서재복]
forward
global type w_bdinfo_w from window
end type
type ddlb_2 from dropdownlistbox within w_bdinfo_w
end type
type st_10 from statictext within w_bdinfo_w
end type
type dw_8 from datawindow within w_bdinfo_w
end type
type st_9 from statictext within w_bdinfo_w
end type
type dw_5 from datawindow within w_bdinfo_w
end type
type st_8 from statictext within w_bdinfo_w
end type
type dw_7 from datawindow within w_bdinfo_w
end type
type dw_6 from datawindow within w_bdinfo_w
end type
type st_7 from statictext within w_bdinfo_w
end type
type ddlb_flag from dropdownlistbox within w_bdinfo_w
end type
type st_6 from statictext within w_bdinfo_w
end type
type sle_project from singlelineedit within w_bdinfo_w
end type
type st_5 from statictext within w_bdinfo_w
end type
type st_4 from statictext within w_bdinfo_w
end type
type st_1 from statictext within w_bdinfo_w
end type
type dw_3 from datawindow within w_bdinfo_w
end type
type dw_2 from datawindow within w_bdinfo_w
end type
type dw_1 from datawindow within w_bdinfo_w
end type
type st_3 from statictext within w_bdinfo_w
end type
type st_2 from statictext within w_bdinfo_w
end type
type em_2 from editmask within w_bdinfo_w
end type
type em_1 from editmask within w_bdinfo_w
end type
type pb_2 from picturebutton within w_bdinfo_w
end type
type pb_1 from picturebutton within w_bdinfo_w
end type
type gb_1 from groupbox within w_bdinfo_w
end type
end forward

global type w_bdinfo_w from window
integer x = 832
integer y = 360
integer width = 1765
integer height = 1200
boolean titlebar = true
string title = "공사정보조회조건(w_bdinfo_w)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
ddlb_2 ddlb_2
st_10 st_10
dw_8 dw_8
st_9 st_9
dw_5 dw_5
st_8 st_8
dw_7 dw_7
dw_6 dw_6
st_7 st_7
ddlb_flag ddlb_flag
st_6 st_6
sle_project sle_project
st_5 st_5
st_4 st_4
st_1 st_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
st_3 st_3
st_2 st_2
em_2 em_2
em_1 em_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_bdinfo_w w_bdinfo_w

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
end variables

forward prototypes
public subroutine wf_test ()
end prototypes

public subroutine wf_test ();string ls_code, ls_name
DECLARE cursor1 CURSOR FOR
  SELECT part_no, part_name FROM glpart
   where company_code = '00'
   order by part_no;
  OPEN cursor1;  
  messagebox("gg",string(sqlca.sqlcode))
   DO WHILE sqlca.sqlcode = 0
    FETCH cursor1 INTO :ls_code, :ls_name;
    IF sqlca.sqlcode <> 0 THEN
     EXIT
      END IF
  
    ddlb_2.AddItem(TRIM(ls_code)+" "+TRIM(ls_name))
   LOOP   
  CLOSE cursor1;


end subroutine

on w_bdinfo_w.create
this.ddlb_2=create ddlb_2
this.st_10=create st_10
this.dw_8=create dw_8
this.st_9=create st_9
this.dw_5=create dw_5
this.st_8=create st_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.st_7=create st_7
this.ddlb_flag=create ddlb_flag
this.st_6=create st_6
this.sle_project=create sle_project
this.st_5=create st_5
this.st_4=create st_4
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_3=create st_3
this.st_2=create st_2
this.em_2=create em_2
this.em_1=create em_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.ddlb_2,&
this.st_10,&
this.dw_8,&
this.st_9,&
this.dw_5,&
this.st_8,&
this.dw_7,&
this.dw_6,&
this.st_7,&
this.ddlb_flag,&
this.st_6,&
this.sle_project,&
this.st_5,&
this.st_4,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.dw_1,&
this.st_3,&
this.st_2,&
this.em_2,&
this.em_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_bdinfo_w.destroy
destroy(this.ddlb_2)
destroy(this.st_10)
destroy(this.dw_8)
destroy(this.st_9)
destroy(this.dw_5)
destroy(this.st_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.st_7)
destroy(this.ddlb_flag)
destroy(this.st_6)
destroy(this.sle_project)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;wf_test()
return
datetime ld_minfixeddate, ld_maxfixeddate

datawindowchild ldwc_person, ldwc_div, ldwc_spec
datawindowchild ldwc_sprog, ldwc_dprog, ldwc_cprog, ldwc_city

dw_1.settransobject(sqlca)
dw_1.insertrow(0)
dw_1.getchild('person_no',ldwc_person)
ldwc_person.insertrow(1)
ldwc_person.setitem(1,'person_no','%')
ldwc_person.setitem(1,'kor_name','전체')
ldwc_person.accepttext()

dw_2.settransobject(sqlca)
dw_2.insertrow(0)
dw_2.getchild('div_code',ldwc_div)
ldwc_div.insertrow(1)
ldwc_div.setitem(1,'div_code','%')
ldwc_div.setitem(1,'div_name','전체')
ldwc_div.accepttext()

dw_3.settransobject(sqlca)
dw_3.insertrow(0)
dw_3.getchild('spec_code',ldwc_spec)
ldwc_spec.insertrow(1)
ldwc_spec.setitem(1,'spec_code','%')
ldwc_spec.setitem(1,'spec_name','전체')
ldwc_spec.accepttext()

dw_5.settransobject(sqlca)
dw_5.insertrow(0)
dw_5.getchild('sprog_code', ldwc_sprog)
ldwc_sprog.insertrow(1)
ldwc_sprog.setitem(1,'prog_code','%')
ldwc_sprog.setitem(1,'prog_name','전체')
ldwc_sprog.accepttext()

dw_6.settransobject(sqlca)
dw_6.insertrow(0)
dw_6.getchild('dprog_code', ldwc_dprog)
ldwc_dprog.insertrow(1)
ldwc_dprog.setitem(1,'prog_code','%')
ldwc_dprog.setitem(1,'prog_name','전체')
ldwc_dprog.accepttext()

dw_7.settransobject(sqlca)
dw_7.insertrow(0)
dw_7.getchild('cprog_code', ldwc_cprog)
ldwc_cprog.insertrow(1)
ldwc_cprog.setitem(1,'prog_code','%')
ldwc_cprog.setitem(1,'prog_name','전체')
ldwc_cprog.accepttext()

dw_8.settransobject(sqlca)
dw_8.insertrow(0)
dw_8.getchild('city_code', ldwc_city)
ldwc_city.insertrow(1)
ldwc_city.setitem(1,'city_code','%')
ldwc_city.setitem(1,'city_name','전체')
ldwc_city.accepttext()

ist_where = Message.PowerObjectParm
dw_1.object.person_no[1] = ist_where.str1
dw_2.object.div_code[1] = ist_where.str2 
dw_3.object.spec_code[1] = ist_where.str3 
dw_5.object.sprog_code[1] = ist_where.str5 
dw_6.object.dprog_code[1] = ist_where.str6 
dw_7.object.cprog_code[1] = ist_where.str7 
dw_8.object.city_code[1] = ist_where.str8
sle_project.text = ist_where.str4
//ddlb_flag.text = ist_where.str5

if trim(ist_where.sdate1) = '' or isnull(ist_where.sdate1) then
	select min(fixeddate) into :ld_minfixeddate from bdinfodet ;
	select max(fixeddate) into :ld_maxfixeddate from bdinfodet ;	
	em_1.text = string(ld_minfixeddate, "yyyy/mm/dd")
	em_2.text = string(ld_maxfixeddate, "yyyy/mm/dd")
	
//	em_1.text = string(today(), "yyyy/mm/dd")
//	em_2.text = string(today(), "yyyy/mm/dd")
else
	em_1.text = ist_where.sdate1
	em_2.text = string(RelativeDate(date(ist_where.sdate2), -1)) 
end if


end event

type ddlb_2 from dropdownlistbox within w_bdinfo_w
integer x = 151
integer y = 972
integer width = 791
integer height = 228
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_bdinfo_w
integer x = 261
integer y = 816
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "지역:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_bdinfo_w
integer x = 608
integer y = 800
integer width = 631
integer height = 100
integer taborder = 90
string dataobject = "d_city_s"
boolean border = false
end type

type st_9 from statictext within w_bdinfo_w
integer x = 41
integer y = 144
integer width = 562
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "영업진행사항:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_bdinfo_w
integer x = 608
integer y = 132
integer width = 631
integer height = 100
integer taborder = 10
string dataobject = "d_saleprog_s"
boolean border = false
end type

type st_8 from statictext within w_bdinfo_w
integer x = 41
integer y = 336
integer width = 562
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "현장진행사항:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_7 from datawindow within w_bdinfo_w
integer x = 608
integer y = 324
integer width = 631
integer height = 100
integer taborder = 30
string dataobject = "d_comprog_s"
boolean border = false
end type

type dw_6 from datawindow within w_bdinfo_w
integer x = 608
integer y = 228
integer width = 631
integer height = 100
integer taborder = 20
string dataobject = "d_designprog_s"
boolean border = false
end type

type st_7 from statictext within w_bdinfo_w
integer x = 41
integer y = 240
integer width = 562
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "설계진행사항:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_flag from dropdownlistbox within w_bdinfo_w
boolean visible = false
integer x = 128
integer y = 960
integer width = 631
integer height = 452
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","설계","설계변경","현장"}
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_bdinfo_w
integer x = 187
integer y = 528
integer width = 416
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "프로젝트:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_project from singlelineedit within w_bdinfo_w
integer x = 608
integer y = 516
integer width = 617
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_bdinfo_w
integer x = 261
integer y = 720
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "제품:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_bdinfo_w
integer x = 261
integer y = 624
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "담당본부:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_bdinfo_w
boolean visible = false
integer x = 110
integer y = 952
integer width = 343
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "담당:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_bdinfo_w
integer x = 608
integer y = 704
integer width = 631
integer height = 100
integer taborder = 80
string dataobject = "d_spec_s"
boolean border = false
end type

type dw_2 from datawindow within w_bdinfo_w
integer x = 608
integer y = 608
integer width = 631
integer height = 100
integer taborder = 70
string dataobject = "d_div_s"
boolean border = false
end type

type dw_1 from datawindow within w_bdinfo_w
boolean visible = false
integer x = 466
integer y = 948
integer width = 631
integer height = 100
string dataobject = "d_person_s"
boolean border = false
end type

type st_3 from statictext within w_bdinfo_w
integer x = 41
integer y = 432
integer width = 562
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388736
long backcolor = 79219928
boolean enabled = false
string text = "영업진행기간:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_bdinfo_w
integer x = 1033
integer y = 428
integer width = 46
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_bdinfo_w
integer x = 1093
integer y = 420
integer width = 411
integer height = 80
integer taborder = 50
integer textsize = -10
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
string displaydata = "~b"
end type

event rbuttondown;string ls_date

openWithParm(w_calendar, ls_date)
ls_date = message.stringparm
if ls_date <> 'N' then
	em_2.text = string(date(ls_date))
end if

end event

type em_1 from editmask within w_bdinfo_w
integer x = 608
integer y = 420
integer width = 411
integer height = 80
integer taborder = 40
integer textsize = -10
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
string displaydata = ""
end type

event rbuttondown;string ls_date

openWithParm(w_calendar, ls_date)
ls_date = message.stringparm
if ls_date <> 'N' then
	em_1.text = string(date(ls_date))
end if

end event

type pb_2 from picturebutton within w_bdinfo_w
integer x = 1403
integer y = 956
integer width = 279
integer height = 144
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_where.okflag = false
closewithreturn(parent, ist_where)
end event

type pb_1 from picturebutton within w_bdinfo_w
integer x = 1120
integer y = 956
integer width = 279
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인0.bmp"
alignment htextalign = right!
end type

event clicked;
ist_where.str1 = dw_1.object.person_no[dw_1.getrow()]
ist_where.str2 = dw_2.object.div_code[dw_2.getrow()]
ist_where.str3 = dw_3.object.spec_code[dw_3.getrow()]
ist_where.str5 = dw_5.object.sprog_code[dw_5.getrow()]
ist_where.str6 = dw_6.object.dprog_code[dw_6.getrow()]
ist_where.str7 = dw_7.object.cprog_code[dw_7.getrow()]
ist_where.str8 = dw_8.object.city_code[dw_8.getrow()]
if ist_where.str1 = '' then ist_where.str1 = '%'
if ist_where.str2 = '' then ist_where.str2 = '%'
if ist_where.str3 = '' then ist_where.str3 = '%'
if ist_where.str5 = '' then ist_where.str5 = '%'
if ist_where.str6 = '' then ist_where.str6 = '%'
if ist_where.str7 = '' then ist_where.str7 = '%'
if ist_where.str8 = '' then ist_where.str8 = '%'

ist_where.str4 = sle_project.text
//ist_where.str5 = ddlb_flag.text 
ist_where.sdate1 = trim(em_1.text)
ist_where.sdate2 = string(RelativeDate(date(trim(em_2.text)), 1))

ist_where.okflag = true

closewithreturn(parent, ist_where)
end event

type gb_1 from groupbox within w_bdinfo_w
integer x = 32
integer y = 32
integer width = 1646
integer height = 908
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79219928
string text = "조회범위"
end type

