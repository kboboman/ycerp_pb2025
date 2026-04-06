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
type dw_prt from datawindow within w_cdlocation_m
end type
type st_3 from statictext within w_cdlocation_m
end type
type st_4 from statictext within w_cdlocation_m
end type
type ddlb_fld from dropdownlistbox within w_cdlocation_m
end type
type st_5 from statictext within w_cdlocation_m
end type
type sle_value from singlelineedit within w_cdlocation_m
end type
type cbx_op from checkbox within w_cdlocation_m
end type
type cb_1 from commandbutton within w_cdlocation_m
end type
type cb_2 from commandbutton within w_cdlocation_m
end type
type cb_3 from commandbutton within w_cdlocation_m
end type
type cb_5 from commandbutton within w_cdlocation_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdlocation_m
end type
type ddlb_op from dropdownlistbox within w_cdlocation_m
end type
end forward

global type w_cdlocation_m from w_inheritance
integer width = 4626
integer height = 2872
string title = "저장소관리(w_cdlocation_m)"
long backcolor = 81838264
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_1 st_1
st_2 st_2
dw_prt dw_prt
st_3 st_3
st_4 st_4
ddlb_fld ddlb_fld
st_5 st_5
sle_value sle_value
cbx_op cbx_op
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
ddlb_dwtitles ddlb_dwtitles
ddlb_op ddlb_op
end type
global w_cdlocation_m w_cdlocation_m

type variables

end variables

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//필터 관련
GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

datawindowchild ldwc_area
string ls_null

dw_prt.visible = false		
dw_prt.SetTransObject(SQLCA)
dw_1.SetTransObject(SQLCA)

setnull(ls_null)
dw_1.getchild('area_no',ldwc_area)
ldwc_area.settransobject(sqlca)
ldwc_area.retrieve()
ldwc_area.insertrow(1)
ldwc_area.setitem(1, 'area_no', ls_null)
ldwc_area.setitem(1, 'area_name', '   ')

if gf_permission('저장소관리EDIT', gs_userid) = 'Y' then
	if gs_userid = "1999010s" then dw_1.Object.loc_type.Protect = false
else
	pb_delete.enabled = false
	pb_save.enabled   = false
	pb_insert.enabled = false
end if

//조회
pb_retrieve.post event clicked( )
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
this.dw_prt=create dw_prt
this.st_3=create st_3
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.st_5=create st_5
this.sle_value=create sle_value
this.cbx_op=create cbx_op
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.ddlb_dwtitles=create ddlb_dwtitles
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_prt
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.ddlb_fld
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.sle_value
this.Control[iCurrent+13]=this.cbx_op
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.cb_2
this.Control[iCurrent+16]=this.cb_3
this.Control[iCurrent+17]=this.cb_5
this.Control[iCurrent+18]=this.ddlb_dwtitles
this.Control[iCurrent+19]=this.ddlb_op
end on

on w_cdlocation_m.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_prt)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cbx_op)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.ddlb_dwtitles)
destroy(this.ddlb_op)
end on

event resize;call super::resize;//
dw_1.width  = newwidth  - 73
dw_1.height = newheight - 484

end event

type pb_save from w_inheritance`pb_save within w_cdlocation_m
integer x = 3963
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long  	ll_cnt
string	ls_loc_no, ls_loc_type, ls_msg
string	ls_loc_name, ls_area_no, ls_area_name
string	ls_sqlerrtext, ls_temp
integer	l_net = 0

if dw_1.accepttext() = -1 then return

ls_loc_no   = dw_1.object.loc_no[dw_1.getrow()]
ls_loc_name = dw_1.object.loc_name[dw_1.getrow()]
ls_loc_type = dw_1.object.loc_type[dw_1.getrow()]
ls_area_no 	= dw_1.object.area_no[dw_1.getrow()]

if gf_null_chk(ls_loc_no) = true then
	messagebox('경고', '저장소번호를 입력하세요,')
	return
end if

ls_msg	= '저장소 번호 : ' + ls_loc_no + ' 를 저장하시겠습니까?'
if messagebox("확인", ls_msg, Exclamation!, OKCancel!, 2) <> 1 then return

if gf_null_chk(ls_loc_name) = true then
	messagebox('경고', '저장소명을 입력하세요,')
	return
end if

if gf_null_chk(ls_loc_type) = true then
	messagebox('경고', '유형을 선택하세요,')
	return
end if

if  messagebox('경고', '실사 관리 저장소의 사업장은 필수 입력입니다.~r~n실사 관리 저장소입니까? ', Exclamation!, OKCancel!, 2) = 1 then
	if gf_null_chk(ls_area_no) = true then
		messagebox('경고', '실사 관리 저장소의 사업장은 필수 입력사항입니다.')
		return
	else
		SELECT 
			DISTINCT area_name
		into 
			:ls_area_name
		FROM 
			financial_location
		WHERE 
			AREA = :ls_area_no
		using sqlca;		
		
	end if
	l_net	= 1
else				
	l_net	= 0
end if

if ls_loc_type = 'Y' then
	SELECT count(*) INTO :ll_cnt FROM supp WHERE supp_no = :ls_loc_no;
	if ll_cnt < 1 then 
		messagebox('경고', '외주일 경우 저장소번호는 구매거래처코드와 동일하게 입력 해야 합니다.', stopsign!)
		return -1
	end if
end if

/*2021-12-31 jowonsuk 실사마감에 반영 위해 재무저장소에 저장*/
if l_net =  1 then
	ll_cnt = 0;
	
	select  
		count(*)
	into 
		:ll_cnt
	from 
		financial_location
	where 
		loc_no = :ls_loc_no
	using sqlca;
	
	if ll_cnt = 0 then	
		INSERT INTO financial_location
		values (:ls_loc_no, :ls_loc_name, :ls_area_name, :ls_area_no)
		using sqlca;

		if sqlca.sqlcode = -1 then         
			ls_sqlerrtext	= sqlca.sqlerrtext
			rollback using sqlca;
			messagebox("Insert error", ls_sqlerrtext)
			return
		end if
	else						
		update
			financial_location
		set
			 loc_name	= :ls_loc_name
			,area 		= :ls_area_no
			,area_name	= :ls_area_name
		where
			loc_no = :ls_loc_no
		using sqlca;
		
		if sqlca.sqlcode = -1 then         
			ls_sqlerrtext	= sqlca.sqlerrtext
			rollback using sqlca;
			messagebox("Update error", ls_sqlerrtext)
			return
		end if
		
	end if
end if

wf_update1(dw_1,"Y")
end event

type dw_1 from w_inheritance`dw_1 within w_cdlocation_m
integer x = 37
integer y = 456
integer width = 4334
integer height = 1764
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
		select count(*) into :ll_cnt from location where loc_no = :data;
		if ll_cnt > 0 then 
			messagebox('경고', '저장소 번호가 이미 등록되어 있습니다.', stopsign!)
			return 2
		end if
END CHOOSE

end event

event dw_1::clicked;call super::clicked;GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type st_title from w_inheritance`st_title within w_cdlocation_m
integer width = 978
string text = "저장소 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdlocation_m
integer x = 0
integer y = 0
end type

type pb_compute from w_inheritance`pb_compute within w_cdlocation_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdlocation_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_close from w_inheritance`pb_close within w_cdlocation_m
integer x = 4155
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdlocation_m
integer x = 3771
end type

event pb_print::clicked;w_repsuper w_print
st_print l_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

//조회
pb_retrieve.event clicked( )

if dw_prt.rowcount() < 1 then return

l_print.st_datawindow = dw_prt
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 저장소내역을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4
gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 ' + & 
                   'Datawindow.Zoom=93'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_cdlocation_m
boolean visible = false
integer x = 0
integer y = 0
end type

type pb_delete from w_inheritance`pb_delete within w_cdlocation_m
integer x = 3579
end type

event pb_delete::clicked;long   ll_row, ll_cnt
string ls_loc

MessageBox("확인", "저장소 삭제는 불가능 합니다.")
RETURN	

end event

event pb_delete::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제는 전산실로 요청바람.",parent, li_x, li_y)


end event

type pb_insert from w_inheritance`pb_insert within w_cdlocation_m
integer x = 3387
end type

event pb_insert::clicked;call super::clicked;long   ll_row
String ls_temp

ll_row = dw_1.insertrow(1)
if rb_2.checked = true then dw_1.object.loc_type[ll_row] = 'N'		// 사내
if rb_3.checked = true then dw_1.object.loc_type[ll_row] = 'Y'		// 외주
if rb_4.checked = true then dw_1.object.loc_type[ll_row] = 'W'		// 작업장
dw_1.setitem(ll_row, 'use_yn', 'Y')

dw_1.ScrollToRow(ll_row)
dw_1.setcolumn('loc_no')  
dw_1.setfocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdlocation_m
integer x = 3195
end type

event pb_retrieve::clicked;call super::clicked;dw_1.retrieve()
dw_prt.retrieve()

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
integer height = 160
integer textsize = -8
integer weight = 400
long backcolor = 81838264
end type

type gb_1 from w_inheritance`gb_1 within w_cdlocation_m
integer x = 3168
integer width = 1202
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cdlocation_m
boolean visible = false
integer x = 0
integer y = 0
integer width = 160
integer height = 96
boolean vscrollbar = false
boolean livescroll = false
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

type dw_prt from datawindow within w_cdlocation_m
integer x = 1870
integer y = 32
integer width = 238
integer height = 172
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

type st_4 from statictext within w_cdlocation_m
integer x = 82
integer y = 348
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "필드:"
boolean focusrectangle = false
end type

type ddlb_fld from dropdownlistbox within w_cdlocation_m
integer x = 261
integer y = 328
integer width = 443
integer height = 632
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type st_5 from statictext within w_cdlocation_m
integer x = 731
integer y = 344
integer width = 165
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
boolean enabled = false
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdlocation_m
integer x = 1193
integer y = 336
integer width = 535
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cbx_op from checkbox within w_cdlocation_m
integer x = 1742
integer y = 348
integer width = 201
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "AND"
end type

event clicked;// 연산자
if this.checked = true then
	this.text = "OR"
	sle_value.text = GF_ReplaceALL(sle_value.text, "AND", "OR")
else
	this.text = "AND"
	sle_value.text = GF_ReplaceALL(sle_value.text, "OR", "AND")
end if

end event

type cb_1 from commandbutton within w_cdlocation_m
integer x = 1943
integer y = 336
integer width = 146
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;// 필터(다중필터 추가)
// OPEN Event : GS_ColName = "" ; GS_ColType = "" ; GS_Filter = "" ; cbx_op.enabled = false
// 해지 Click : GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
// cbx_op Control 추가 
// 필터 Click Script 아래 Script로 변경

datawindow arg_dw
string     ls_column, ls_value, ls_col, ls_type, ls_op
integer    li_ret

arg_dw  = dw_1

ls_column = ""
ls_col   = GS_ColName
ls_type  = GS_ColType
ls_value = sle_value.text
ls_op    = cbx_op.text
 
if trim(ddlb_op.text) = "LIKE" then
	ls_column = ls_col + " " + trim(ddlb_op.text) + " '%" + trim(ls_value) + "%' "
else
	choose case LeftA(ls_type,4)
		case "char"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " '" + trim(ls_value) + "' "
		case "deci", "numb", "long"
			ls_column = ls_col + " " + trim(ddlb_op.text) + " "  + trim(ls_value) + " "
		case "date", "time"
			if ls_type = "date" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " date('" + trim(ls_value) + "') "
			elseif ls_type = "datetime" then
				ls_column = ls_col + " " + trim(ddlb_op.text) + " datetime('" + trim(ls_value) + "') "
			else
				ls_column = ls_col + " " + trim(ddlb_op.text) + " #" + trim(ls_value) + "# "
			end if
	end choose
end if

if GS_Filter = "" then
	cbx_op.enabled = true
	GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
else
	if trim(ddlb_fld.text) = "" then
	else
		li_ret = MessageBox("다중필터 확인", "이전 필터조건을 포함한 필터링은 Yes를 선택하시기 바랍니다",Exclamation!, YesNo!, 2)
		choose case li_ret
			case 1
				sle_value.text = "( " + GS_Filter + " ) " + ls_op + " ( " + ls_column + " )"
				arg_dw.setfilter( sle_value.text )
				arg_dw.filter()
				
			case 2
				cbx_op.enabled = true
				GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)
		end choose		
	end if	
end if

end event

type cb_2 from commandbutton within w_cdlocation_m
integer x = 2094
integer y = 336
integer width = 146
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GS_Filter  = "" ; GS_ColName = "" ; GS_ColType = "" ; cbx_op.enabled = false
ddlb_op.text = "" ; ddlb_fld.text = "" ; sle_value.text = ""

GF_DW2UnFilter( arg_dw )

end event

type cb_3 from commandbutton within w_cdlocation_m
integer x = 2245
integer y = 336
integer width = 146
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_cdlocation_m
integer x = 2395
integer y = 336
integer width = 146
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
DataWindow arg_dw

arg_dw  = dw_1

GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type ddlb_dwtitles from dropdownlistbox within w_cdlocation_m
integer x = 293
integer y = 340
integer width = 311
integer height = 88
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

type ddlb_op from dropdownlistbox within w_cdlocation_m
integer x = 901
integer y = 332
integer width = 279
integer height = 500
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ",">",">=","<","<=","<>","=","LIKE","시작문자","끝문자","포함","포함안함"}
end type

