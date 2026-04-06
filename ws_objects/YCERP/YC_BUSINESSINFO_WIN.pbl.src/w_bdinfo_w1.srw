$PBExportHeader$w_bdinfo_w1.srw
$PBExportComments$공사정보조회조건[2000/12/08,서재복]
forward
global type w_bdinfo_w1 from window
end type
type st_b from statictext within w_bdinfo_w1
end type
type st_c from statictext within w_bdinfo_w1
end type
type st_d from statictext within w_bdinfo_w1
end type
type dw_10 from datawindow within w_bdinfo_w1
end type
type st_organ from statictext within w_bdinfo_w1
end type
type dw_9 from datawindow within w_bdinfo_w1
end type
type st_17 from statictext within w_bdinfo_w1
end type
type em_4 from editmask within w_bdinfo_w1
end type
type st_41 from statictext within w_bdinfo_w1
end type
type em_3 from editmask within w_bdinfo_w1
end type
type ddlb_expdate from dropdownlistbox within w_bdinfo_w1
end type
type st_16 from statictext within w_bdinfo_w1
end type
type st_15 from statictext within w_bdinfo_w1
end type
type st_14 from statictext within w_bdinfo_w1
end type
type st_13 from statictext within w_bdinfo_w1
end type
type st_12 from statictext within w_bdinfo_w1
end type
type st_11 from statictext within w_bdinfo_w1
end type
type ddlb_person from dropdownlistbox within w_bdinfo_w1
end type
type ddlb_div from dropdownlistbox within w_bdinfo_w1
end type
type st_10 from statictext within w_bdinfo_w1
end type
type dw_8 from datawindow within w_bdinfo_w1
end type
type st_9 from statictext within w_bdinfo_w1
end type
type dw_5 from datawindow within w_bdinfo_w1
end type
type st_8 from statictext within w_bdinfo_w1
end type
type dw_7 from datawindow within w_bdinfo_w1
end type
type dw_6 from datawindow within w_bdinfo_w1
end type
type st_7 from statictext within w_bdinfo_w1
end type
type st_6 from statictext within w_bdinfo_w1
end type
type sle_project from singlelineedit within w_bdinfo_w1
end type
type st_5 from statictext within w_bdinfo_w1
end type
type st_4 from statictext within w_bdinfo_w1
end type
type st_1 from statictext within w_bdinfo_w1
end type
type dw_3 from datawindow within w_bdinfo_w1
end type
type dw_2 from datawindow within w_bdinfo_w1
end type
type dw_1 from datawindow within w_bdinfo_w1
end type
type st_3 from statictext within w_bdinfo_w1
end type
type st_2 from statictext within w_bdinfo_w1
end type
type em_2 from editmask within w_bdinfo_w1
end type
type em_1 from editmask within w_bdinfo_w1
end type
type pb_2 from picturebutton within w_bdinfo_w1
end type
type pb_1 from picturebutton within w_bdinfo_w1
end type
type gb_1 from groupbox within w_bdinfo_w1
end type
end forward

global type w_bdinfo_w1 from window
integer x = 832
integer y = 360
integer width = 1522
integer height = 1184
boolean titlebar = true
string title = "조회조건(w_bdinfo_w1)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
st_b st_b
st_c st_c
st_d st_d
dw_10 dw_10
st_organ st_organ
dw_9 dw_9
st_17 st_17
em_4 em_4
st_41 st_41
em_3 em_3
ddlb_expdate ddlb_expdate
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
ddlb_person ddlb_person
ddlb_div ddlb_div
st_10 st_10
dw_8 dw_8
st_9 st_9
dw_5 dw_5
st_8 st_8
dw_7 dw_7
dw_6 dw_6
st_7 st_7
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
global w_bdinfo_w1 w_bdinfo_w1

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
end variables

on w_bdinfo_w1.create
this.st_b=create st_b
this.st_c=create st_c
this.st_d=create st_d
this.dw_10=create dw_10
this.st_organ=create st_organ
this.dw_9=create dw_9
this.st_17=create st_17
this.em_4=create em_4
this.st_41=create st_41
this.em_3=create em_3
this.ddlb_expdate=create ddlb_expdate
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.ddlb_person=create ddlb_person
this.ddlb_div=create ddlb_div
this.st_10=create st_10
this.dw_8=create dw_8
this.st_9=create st_9
this.dw_5=create dw_5
this.st_8=create st_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.st_7=create st_7
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
this.Control[]={this.st_b,&
this.st_c,&
this.st_d,&
this.dw_10,&
this.st_organ,&
this.dw_9,&
this.st_17,&
this.em_4,&
this.st_41,&
this.em_3,&
this.ddlb_expdate,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.ddlb_person,&
this.ddlb_div,&
this.st_10,&
this.dw_8,&
this.st_9,&
this.dw_5,&
this.st_8,&
this.dw_7,&
this.dw_6,&
this.st_7,&
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

on w_bdinfo_w1.destroy
destroy(this.st_b)
destroy(this.st_c)
destroy(this.st_d)
destroy(this.dw_10)
destroy(this.st_organ)
destroy(this.dw_9)
destroy(this.st_17)
destroy(this.em_4)
destroy(this.st_41)
destroy(this.em_3)
destroy(this.ddlb_expdate)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.ddlb_person)
destroy(this.ddlb_div)
destroy(this.st_10)
destroy(this.dw_8)
destroy(this.st_9)
destroy(this.dw_5)
destroy(this.st_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.st_7)
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

event open;// 1509 , 1244
datetime ld_minfixeddate, ld_maxfixeddate

datawindowchild ldwc_person, ldwc_div, ldwc_spec, ldwc_sprog2
datawindowchild ldwc_sprog, ldwc_dprog, ldwc_cprog, ldwc_city, ldwc_organcd
datawindowchild ldwc_dcd, ldwc_ccd, ldwc_bcd

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

dw_9.settransobject(sqlca)
dw_9.insertrow(0)
dw_9.getchild('organ_code', ldwc_organcd)
ldwc_organcd.insertrow(1)
ldwc_organcd.setitem(1,'organ_code','%')
ldwc_organcd.setitem(1,'organ_name','전체')
ldwc_organcd.accepttext()

dw_10.settransobject(sqlca)
dw_10.insertrow(0)
dw_10.getchild('d_code', ldwc_dcd)
ldwc_dcd.insertrow(1)
ldwc_dcd.setitem(1,'comcode','%')
ldwc_dcd.setitem(1,'comname','전체')
ldwc_dcd.accepttext()

//dw_11.settransobject(sqlca)
//dw_11.insertrow(0)
//dw_11.getchild('c_code', ldwc_ccd)
//ldwc_ccd.insertrow(1)
//ldwc_ccd.setitem(1,'c_code','%')
//ldwc_ccd.setitem(1,'c_name','전체')
//ldwc_ccd.accepttext()

//dw_12.settransobject(sqlca)
//dw_12.insertrow(0)
//dw_12.getchild('b_code', ldwc_bcd)
//ldwc_bcd.insertrow(1)
//ldwc_bcd.setitem(1,'b_code','%')
//ldwc_bcd.setitem(1,'b_name','전체')
//ldwc_bcd.accepttext()

ist_where = Message.PowerObjectParm
if trim(ist_where.str1) = '' then
	dw_1.object.person_no[1] = '%'
ELSE
	dw_1.object.person_no[1] = ist_where.str1
end if
if trim(ist_where.str2) = '' then
	dw_2.object.div_code[1] = '%'
ELSE
	dw_2.object.div_code[1] = ist_where.str2
end if
if trim(ist_where.str3) = '' then
	dw_3.object.spec_code[1] = '%'
ELSE
	dw_3.object.spec_code[1] = ist_where.str3
end if
if trim(ist_where.str5) = ''  then
	dw_5.object.sprog_code[1] = '%'
ELSE
	dw_5.object.sprog_code[1] = ist_where.str5
end if
if trim(ist_where.str6) = '' then
	dw_6.object.dprog_code[1] = '%'
ELSE
	dw_6.object.dprog_code[1] = ist_where.str6
end if
if trim(ist_where.str7) = '' then
	dw_7.object.cprog_code[1] = '%'
ELSE
	dw_7.object.cprog_code[1] = ist_where.str7
end if
if trim(ist_where.str8) = '' then
	dw_8.object.city_code[1] = '%'
ELSE
	dw_8.object.city_code[1] = ist_where.str8
end if
if trim(ist_where.str9) = '' then
	dw_9.object.organ_code[1] = '%'
ELSE
	dw_9.object.organ_code[1] = ist_where.str9
end if
if trim(ist_where.str10) = '' then
	dw_10.object.d_code[1] = '%'
ELSE
	dw_10.object.d_code[1] = ist_where.str10
end if
sle_project.text = ist_where.str4

ddlb_div.text = ist_where.str16   //담당본부
ddlb_person.text = ist_where.str17   //담당자
ddlb_expdate.text = ist_where.str18   //예정일자

if trim(ist_where.sdate1) = '' or isnull(ist_where.sdate1) then
	select min(fixeddate) into :ld_minfixeddate from bdinfodet ;
	select max(fixeddate) into :ld_maxfixeddate from bdinfodet ;	
	em_1.text = string(ld_minfixeddate, "yyyy/mm/dd")  //string(today(), "yyyy/mm/dd")
	em_2.text = string(today(), "yyyy/mm/dd")
else
	em_1.text = ist_where.sdate1
	em_2.text = ist_where.sdate2 
end if

if trim(ist_where.sdate3) = '' or trim(ist_where.sdate3) = '0000/00/00' or isnull(ist_where.sdate3) or &
	trim(ist_where.sdate4) = '' or trim(ist_where.sdate4) = '0000/00/00' or isnull(ist_where.sdate4) then
	em_3.text = string('00000000', "yyyy/mm/dd") 
	em_4.text = string('00000000', "yyyy/mm/dd") 
else
	em_3.text = ist_where.sdate3
	em_4.text = ist_where.sdate4
end if

end event

type st_b from statictext within w_bdinfo_w1
integer x = 2341
integer y = 1216
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "시공사:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_c from statictext within w_bdinfo_w1
integer x = 2341
integer y = 1116
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "건설사:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_d from statictext within w_bdinfo_w1
integer x = 187
integer y = 632
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "설계사:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_10 from datawindow within w_bdinfo_w1
integer x = 507
integer y = 620
integer width = 631
integer height = 100
integer taborder = 140
string dataobject = "d_design_s"
boolean border = false
end type

type st_organ from statictext within w_bdinfo_w1
integer x = 174
integer y = 248
integer width = 329
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 67108864
boolean enabled = false
string text = "발주처:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_9 from datawindow within w_bdinfo_w1
integer x = 507
integer y = 232
integer width = 645
integer height = 92
integer taborder = 30
string dataobject = "d_organcd_s"
boolean border = false
boolean livescroll = true
end type

type st_17 from statictext within w_bdinfo_w1
integer x = 2953
integer y = 972
integer width = 137
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "중에"
boolean focusrectangle = false
end type

type em_4 from editmask within w_bdinfo_w1
integer x = 997
integer y = 724
integer width = 411
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
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
	em_4.text = string(date(ls_date))
end if

end event

type st_41 from statictext within w_bdinfo_w1
integer x = 942
integer y = 732
integer width = 46
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_3 from editmask within w_bdinfo_w1
integer x = 507
integer y = 724
integer width = 411
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
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
	em_3.text = string(date(ls_date))
end if

end event

type ddlb_expdate from dropdownlistbox within w_bdinfo_w1
integer x = 2295
integer y = 960
integer width = 617
integer height = 508
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체[날짜무시]","정보입수발생일자","설계확정예정일자","건설사선정예정일자","시공사선정예정일자","판매확정예정일자"}
borderstyle borderstyle = stylelowered!
end type

type st_16 from statictext within w_bdinfo_w1
integer x = 187
integer y = 732
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "예정일자:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_bdinfo_w1
integer x = 3707
integer y = 680
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "포함인것"
boolean focusrectangle = false
end type

type st_14 from statictext within w_bdinfo_w1
integer x = 2944
integer y = 676
integer width = 137
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "중에"
boolean focusrectangle = false
end type

type st_13 from statictext within w_bdinfo_w1
integer x = 1975
integer y = 660
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "영업담당:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_bdinfo_w1
integer x = 2944
integer y = 576
integer width = 137
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "중에"
boolean focusrectangle = false
end type

type st_11 from statictext within w_bdinfo_w1
integer x = 3707
integer y = 576
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "포함인것"
boolean focusrectangle = false
end type

type ddlb_person from dropdownlistbox within w_bdinfo_w1
integer x = 2295
integer y = 660
integer width = 617
integer height = 508
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","정보입수담당자","설계영업담당자","건설사영업담당자","시공사영업담당자","판매영업담당자"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_div from dropdownlistbox within w_bdinfo_w1
integer x = 2295
integer y = 564
integer width = 622
integer height = 508
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","정보입수담당본부","설계영업담당본부","건설사영업담당본부","시공사영업담당본부","판매영업담당본부"}
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_bdinfo_w1
integer x = 187
integer y = 528
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "지역:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_8 from datawindow within w_bdinfo_w1
integer x = 507
integer y = 524
integer width = 631
integer height = 100
integer taborder = 130
string dataobject = "d_city_s"
boolean border = false
end type

type st_9 from statictext within w_bdinfo_w1
integer x = 59
integer y = 144
integer width = 443
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "확정구분:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_bdinfo_w1
integer x = 507
integer y = 132
integer width = 631
integer height = 100
integer taborder = 10
string dataobject = "d_saleprog_s"
boolean border = false
end type

type st_8 from statictext within w_bdinfo_w1
integer x = 1847
integer y = 280
integer width = 443
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "현장진행사항:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_7 from datawindow within w_bdinfo_w1
integer x = 2290
integer y = 268
integer width = 631
integer height = 100
integer taborder = 40
string dataobject = "d_comprog_s"
boolean border = false
end type

type dw_6 from datawindow within w_bdinfo_w1
integer x = 2290
integer y = 172
integer width = 631
integer height = 100
integer taborder = 20
string dataobject = "d_designprog_s"
boolean border = false
end type

type st_7 from statictext within w_bdinfo_w1
integer x = 1847
integer y = 184
integer width = 443
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 79741120
boolean enabled = false
string text = "설계진행사항:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_bdinfo_w1
integer x = 187
integer y = 352
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "현장명:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_project from singlelineedit within w_bdinfo_w1
integer x = 507
integer y = 336
integer width = 617
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_bdinfo_w1
integer x = 1975
integer y = 772
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "제품:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_bdinfo_w1
integer x = 187
integer y = 440
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "담당본부:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_bdinfo_w1
boolean visible = false
integer x = 256
integer y = 720
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
string text = "영업담당:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_bdinfo_w1
integer x = 2290
integer y = 756
integer width = 631
integer height = 100
integer taborder = 120
string dataobject = "d_spec_s"
boolean border = false
end type

type dw_2 from datawindow within w_bdinfo_w1
integer x = 507
integer y = 428
integer width = 631
integer height = 100
integer taborder = 80
string dataobject = "d_div_s"
boolean border = false
end type

type dw_1 from datawindow within w_bdinfo_w1
integer x = 3086
integer y = 660
integer width = 631
integer height = 100
string dataobject = "d_person_s"
boolean border = false
end type

type st_3 from statictext within w_bdinfo_w1
integer x = 1728
integer y = 388
integer width = 421
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 8388736
long backcolor = 79219928
boolean enabled = false
string text = "진행(확정)일자:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_bdinfo_w1
integer x = 2583
integer y = 384
integer width = 46
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long backcolor = 79219928
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_2 from editmask within w_bdinfo_w1
integer x = 2642
integer y = 376
integer width = 411
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
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

type em_1 from editmask within w_bdinfo_w1
integer x = 2153
integer y = 376
integer width = 411
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
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

type pb_2 from picturebutton within w_bdinfo_w1
integer x = 1189
integer y = 928
integer width = 279
integer height = 144
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "취소"
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;ist_where.okflag = false
closewithreturn(parent, ist_where)
end event

type pb_1 from picturebutton within w_bdinfo_w1
integer x = 923
integer y = 928
integer width = 265
integer height = 144
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "확인"
boolean default = true
string picturename = "c:\bmp\확인0.bmp"
alignment htextalign = right!
end type

event clicked;
ist_where.str1 = dw_1.object.person_no[dw_1.getrow()]
ist_where.str2 = dw_2.object.div_code[dw_2.getrow()]
ist_where.str3 = dw_3.object.spec_code[dw_3.getrow()]
ist_where.str4 = sle_project.text
ist_where.str5 = dw_5.object.sprog_code[dw_5.getrow()]
ist_where.str6 = dw_6.object.dprog_code[dw_6.getrow()]
ist_where.str7 = dw_7.object.cprog_code[dw_7.getrow()]
ist_where.str8 = dw_8.object.city_code[dw_8.getrow()]
ist_where.str9 = dw_9.object.organ_code[dw_9.getrow()]
ist_where.str10 = dw_10.object.d_code[dw_10.getrow()]
//ist_where.str11 = dw_11.object.c_code[dw_11.getrow()]
//ist_where.str12 = dw_12.object.b_code[dw_12.getrow()]

if ist_where.str1 = '' then ist_where.str1 = '%'
if ist_where.str2 = '' then ist_where.str2 = '%'
if ist_where.str3 = '' then ist_where.str3 = '%'
if ist_where.str5 = '' then ist_where.str5 = '%'
if ist_where.str6 = '' then ist_where.str6 = '%'
if ist_where.str7 = '' then ist_where.str7 = '%'
if ist_where.str8 = '' then ist_where.str8 = '%'
if ist_where.str9 = '' then ist_where.str9 = '%'
if ist_where.str10 = '' then ist_where.str10 = '%'
//if ist_where.str11 = '' then ist_where.str11 = '%'
//if ist_where.str12 = '' then ist_where.str12 = '%'

ist_where.str16 = ddlb_div.text  //담당본부
if ist_where.str16 = '' then ist_where.str16 = '전체'
ist_where.str17 = ddlb_person.text  //담당자
if ist_where.str17 = '' then ist_where.str17 = '전체'
ist_where.str18 = ddlb_expdate.text  //예정일자
if ist_where.str18 = '' then ist_where.str18 = '전체'

if trim(em_3.text) <> '0000/00/00' then
	ist_where.str18 = '설계확정예정일자'
else
	ist_where.str18 = '전체'
end if

ist_where.sdate1 = em_1.text //영업진행일자
ist_where.sdate2 = em_2.text
ist_where.sdate3 = em_3.text  //예정일자
ist_where.sdate4 = em_4.text

ist_where.okflag = true
////--
//messagebox('1', ist_where.str1)
//messagebox('2', ist_where.str2)
//messagebox('3', ist_where.str3)
//messagebox('4', ist_where.str4)
//messagebox('5', ist_where.str5)
//messagebox('6', ist_where.str6)
//messagebox('7', ist_where.str7)
//messagebox('8', ist_where.str8)
//messagebox('9', ist_where.str9)
//messagebox('10', ist_where.str10)
//messagebox('16', ist_where.str16)
//messagebox('17', ist_where.str17)
//messagebox('18', ist_where.str18)
//messagebox('2-1', ist_where.sdate1)
//messagebox('2-2', ist_where.sdate2)
//messagebox('2-3', ist_where.sdate3)
//messagebox('2-4', ist_where.sdate4)
////--

closewithreturn(parent, ist_where)

end event

type gb_1 from groupbox within w_bdinfo_w1
integer x = 32
integer y = 28
integer width = 1435
integer height = 864
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79219928
string text = "조회범위"
end type

