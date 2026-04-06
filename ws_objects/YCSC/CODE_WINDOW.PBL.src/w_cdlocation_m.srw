$PBExportHeader$w_cdlocation_m.srw
$PBExportComments$저장소관리(1998/02/02 - 김구현)
forward
global type w_cdlocation_m from w_inheritance
end type
type rb_1 from radiobutton within w_cdlocation_m
end type
type rb_2 from radiobutton within w_cdlocation_m
end type
type rb_3 from radiobutton within w_cdlocation_m
end type
type rb_4 from radiobutton within w_cdlocation_m
end type
type st_1 from statictext within w_cdlocation_m
end type
type st_2 from statictext within w_cdlocation_m
end type
type dw_3 from datawindow within w_cdlocation_m
end type
type st_3 from statictext within w_cdlocation_m
end type
end forward

global type w_cdlocation_m from w_inheritance
integer width = 4430
integer height = 2352
string title = "저장소관리(w_cdlocation_m)"
long backcolor = 81838264
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_1 st_1
st_2 st_2
dw_3 dw_3
st_3 st_3
end type
global w_cdlocation_m w_cdlocation_m

type variables
string is_s_chk = 'Y'
end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

DataWindowChild ldwc_area
string ls_null

setnull(ls_null)

dw_1.getchild('area_no',ldwc_area)
ldwc_area.settransobject(sqlca)
ldwc_area.retrieve()
ldwc_area.insertrow(1)
ldwc_area.setitem(1, 'area_no', ls_null)
ldwc_area.setitem(1, 'area_name', '   ')

dw_2.visible = false
dw_3.visible = false
dw_3.SetTransObject(SQLCA)

dw_1.retrieve()
dw_3.retrieve()
//dw_1.sharedata(dw_2)

if gf_permission('저장소관리EDIT', gs_userid) = 'Y' then
	if gs_userid = "1999010s" then dw_1.Object.loc_type.Protect = false
else
	pb_delete.enabled = false
	pb_save.enabled   = false
	pb_insert.enabled = false
end if

end event

on w_cdlocation_m.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_1=create st_1
this.st_2=create st_2
this.dw_3=create dw_3
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_3
this.Control[iCurrent+8]=this.st_3
end on

on w_cdlocation_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_3)
destroy(this.st_3)
end on

event resize;call super::resize;gb_2.width  = this.width  - 96
gb_2.height = this.height - 416

dw_1.width  = this.width  - 142
dw_1.height = this.height - 492

end event

type pb_save from w_inheritance`pb_save within w_cdlocation_m
integer x = 3963
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long   ll_cnt
string ls_loc_no, ls_loc_type

dw_1.accepttext()
ls_loc_no   = dw_1.object.loc_no[dw_1.getrow()]
ls_loc_type = dw_1.object.loc_type[dw_1.getrow()]

if ls_loc_type = 'Y' then
	SELECT count(*) INTO :ll_cnt FROM supp WHERE supp_no = :ls_loc_no;
	if ll_cnt < 1 then 
		is_s_chk = 'N'
		messagebox('경고', '외주일 경우 저장소번호는 구매거래처코드와 동일하게 입력 해야 합니다.', stopsign!)
		return -1
	end if
end if

if is_s_chk = 'N' then
	messagebox('경고', '다시 조회후 입력하고 저장하시기 바랍니다.', stopsign!)
else
	wf_update1(dw_1,"Y")
end if


end event

type dw_1 from w_inheritance`dw_1 within w_cdlocation_m
integer x = 59
integer y = 336
integer width = 4288
integer height = 1860
string dataobject = "d_cdlocation_m"
end type

event dw_1::dberror;call super::dberror;return 1
end event

event dw_1::itemchanged;string ls_null
long ll_cnt

setnull(ls_null)
CHOOSE CASE dwo.name 
	CASE 'loc_type'
		if data = 'Y' then
			this.object.area_no[row] = ls_null
		end if
		
	case 'loc_no'
		select count(*)
			into :ll_cnt
		from location
		where loc_no = :data;
		if ll_cnt > 0 then 
			is_s_chk = 'N'
			messagebox('경고', '저장소 번호가 이미 등록되어 있습니다.', stopsign!)
			return -1
		end if
		is_s_chk = 'Y'
END CHOOSE

end event

event dw_1::itemerror;call super::itemerror;choose case dwo.name
	case 'loc_no'
		this.object.loc_no[row] = ''
end choose
return -1
end event

type dw_2 from w_inheritance`dw_2 within w_cdlocation_m
integer x = 1915
integer y = 20
integer width = 151
integer height = 112
string dataobject = "d_cdlocation_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_cdlocation_m
integer width = 978
string text = "저장소 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlocation_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdlocation_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlocation_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_cdlocation_m
integer x = 4155
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlocation_m
integer x = 3771
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================
w_repsuper w_print
st_print l_print

if dw_1.rowcount() < 1 then return

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 저장소내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=93'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdlocation_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_cdlocation_m
integer x = 3579
end type

event pb_delete::clicked;long   ll_row, ll_cnt
string ls_loc

// 삭제불가(2012/07/11)
if gf_permission("저장소관리(삭제)", gs_userid) = 'Y' then
else
	MessageBox("확인", "저장소 삭제는 불가능 합니다.")
	RETURN	
end if

ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_loc = dw_1.object.loc_no[ll_row]
SELECT count(*) INTO :ll_cnt FROM itemloc WHERE loc_no = :ls_loc;
if ll_cnt > 0 then
	messagebox("확인", "이 저장소는 이미 사용중이므로 삭제가 불가능합니다.")
	return
end if

dw_1.deleterow(ll_row)

end event

event pb_delete::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제는 전산실로 요청바람.",parent, li_x, li_y)


end event

type pb_insert from w_inheritance`pb_insert within w_cdlocation_m
integer x = 3387
end type

event pb_insert::clicked;call super::clicked;// 추가
long   ll_row
String ls_temp

is_s_chk = 'N'
dw_1.AcceptText()

ll_row = dw_1.GetRow()
if ll_row > 0 then
	ls_temp = dw_1.GetItemString(ll_row, 'loc_no')
	if isnull(ls_temp) OR ls_temp = '' THEN
		dw_1.SetColumn('loc_no')
		dw_1.SetFocus()
		Return
	ELSE
		ls_temp = dw_1.GetItemString(ll_row, 'loc_name')
		if isnull(ls_temp) OR ls_temp = '' then
			dw_1.SetColumn('loc_name')
			dw_1.SetFocus()
			Return
		else
			ls_temp = dw_1.GetItemString(ll_row, 'loc_type')
			if isnull(ls_temp) OR ls_temp = '' then
				dw_1.SetColumn('loc_type')
				dw_1.SetFocus()
				Return
			end if
		end if
	end if
end if

ll_row = dw_1.insertrow(0)
if rb_2.checked = true then dw_1.object.loc_type[ll_row] = 'N'		// 사내
if rb_3.checked = true then dw_1.object.loc_type[ll_row] = 'Y'		// 사외
if rb_4.checked = true then dw_1.object.loc_type[ll_row] = 'W'		// 작업장

dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('loc_no')  
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlocation_m
integer x = 3195
end type

event pb_retrieve::clicked;call super::clicked;//
is_s_chk = 'Y'
dw_1.retrieve()
dw_3.retrieve()

end event

type gb_3 from w_inheritance`gb_3 within w_cdlocation_m
integer x = 1189
integer y = 8
integer width = 645
integer height = 204
integer textsize = -8
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cdlocation_m
integer x = 37
integer y = 284
integer width = 4334
integer height = 1936
long backcolor = 81838264
end type

type gb_1 from w_inheritance`gb_1 within w_cdlocation_m
integer x = 3113
integer width = 1257
long backcolor = 81838264
end type

type rb_1 from radiobutton within w_cdlocation_m
integer x = 1239
integer y = 56
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "전체"
boolean checked = true
end type

event clicked;if gs_userid = '1999010s' or gs_userid = 'root' then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled = true
	dw_1.object.loc_type.TabSequence = 55
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled = false
	dw_1.object.loc_type.TabSequence = 0
	dw_1.object.loc_type[dw_1.getrow()] = ''
end if
dw_1.setfilter('')
dw_1.filter()

end event

type rb_2 from radiobutton within w_cdlocation_m
integer x = 1518
integer y = 56
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "사내"
end type

event clicked;if gs_userid = '1999010s' or gs_userid = 'root' then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled = true
	dw_1.object.loc_type.TabSequence = 55
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled = false
	dw_1.object.loc_type.TabSequence = 0
	dw_1.object.loc_type[dw_1.getrow()] = ''
end if
dw_1.setfilter('loc_type = "N"')
dw_1.filter()
end event

type rb_3 from radiobutton within w_cdlocation_m
integer x = 1243
integer y = 124
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "외주"
end type

event clicked;if gs_userid = '1999010s' or gs_userid = 'root' then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled = true
	dw_1.object.loc_type.TabSequence = 55
else
	pb_insert.enabled = true
	pb_delete.enabled = false
	pb_save.enabled = true
	dw_1.object.loc_type.TabSequence = 0
end if
dw_1.setfilter('loc_type = "Y"')
dw_1.filter()
end event

type rb_4 from radiobutton within w_cdlocation_m
integer x = 1518
integer y = 128
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "작업장"
end type

event clicked;if gs_userid = '1999010s' or gs_userid = 'root' then
	pb_insert.enabled = true
	pb_delete.enabled = true
	pb_save.enabled = true
	dw_1.object.loc_type.TabSequence = 55
else
	pb_insert.enabled = false
	pb_delete.enabled = false
	pb_save.enabled = false
	dw_1.object.loc_type.TabSequence = 0
	dw_1.object.loc_type[dw_1.getrow()] = ''
end if
dw_1.setfilter('loc_type = "W"')
dw_1.filter()
end event

type st_1 from statictext within w_cdlocation_m
integer x = 37
integer y = 232
integer width = 2034
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 81838264
string text = "(* 외주일경우 저장소번호는 구매거래처코드와 동일하게 부여)"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cdlocation_m
integer x = 3799
integer y = 228
integer width = 571
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 81838264
string text = "저장소관리EDIT"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_cdlocation_m
integer x = 2085
integer y = 20
integer width = 151
integer height = 112
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdlocation_r"
boolean livescroll = true
end type

type st_3 from statictext within w_cdlocation_m
integer x = 2098
integer y = 232
integer width = 818
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 81838264
string text = "저장소는 삭제 불가능!!!"
boolean focusrectangle = false
end type

