$PBExportHeader$w_ocsalereceivable_r.srw
$PBExportComments$거래처 미수채권현황(2004/05/14,이인호)
forward
global type w_ocsalereceivable_r from w_inheritance
end type
type em_1 from editmask within w_ocsalereceivable_r
end type
type ddlb_2 from dropdownlistbox within w_ocsalereceivable_r
end type
type dw_4 from datawindow within w_ocsalereceivable_r
end type
type em_2 from editmask within w_ocsalereceivable_r
end type
type st_1 from statictext within w_ocsalereceivable_r
end type
type st_2 from statictext within w_ocsalereceivable_r
end type
type rb_1 from radiobutton within w_ocsalereceivable_r
end type
type rb_2 from radiobutton within w_ocsalereceivable_r
end type
type rb_3 from radiobutton within w_ocsalereceivable_r
end type
type st_3 from statictext within w_ocsalereceivable_r
end type
type rb_4 from radiobutton within w_ocsalereceivable_r
end type
type rb_5 from radiobutton within w_ocsalereceivable_r
end type
type rb_6 from radiobutton within w_ocsalereceivable_r
end type
type rb_7 from radiobutton within w_ocsalereceivable_r
end type
type rb_8 from radiobutton within w_ocsalereceivable_r
end type
type st_4 from statictext within w_ocsalereceivable_r
end type
type rb_9 from radiobutton within w_ocsalereceivable_r
end type
type rb_10 from radiobutton within w_ocsalereceivable_r
end type
type st_5 from statictext within w_ocsalereceivable_r
end type
type pb_6 from picturebutton within w_ocsalereceivable_r
end type
type dw_11 from datawindow within w_ocsalereceivable_r
end type
type em_limit from editmask within w_ocsalereceivable_r
end type
type st_time from statictext within w_ocsalereceivable_r
end type
type pb_1 from picturebutton within w_ocsalereceivable_r
end type
end forward

global type w_ocsalereceivable_r from w_inheritance
integer width = 4677
integer height = 2240
string title = "거래처 미수채권 현황(w_ocsalereceivable_r)"
em_1 em_1
ddlb_2 ddlb_2
dw_4 dw_4
em_2 em_2
st_1 st_1
st_2 st_2
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_3 st_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
rb_7 rb_7
rb_8 rb_8
st_4 st_4
rb_9 rb_9
rb_10 rb_10
st_5 st_5
pb_6 pb_6
dw_11 dw_11
em_limit em_limit
st_time st_time
pb_1 pb_1
end type
global w_ocsalereceivable_r w_ocsalereceivable_r

type variables
datawindowchild idwc_user
string is_level = '%', is_3mon = 'A'

end variables

on w_ocsalereceivable_r.create
int iCurrent
call super::create
this.em_1=create em_1
this.ddlb_2=create ddlb_2
this.dw_4=create dw_4
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_3=create st_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
this.rb_7=create rb_7
this.rb_8=create rb_8
this.st_4=create st_4
this.rb_9=create rb_9
this.rb_10=create rb_10
this.st_5=create st_5
this.pb_6=create pb_6
this.dw_11=create dw_11
this.em_limit=create em_limit
this.st_time=create st_time
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_1
this.Control[iCurrent+2]=this.ddlb_2
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.rb_4
this.Control[iCurrent+12]=this.rb_5
this.Control[iCurrent+13]=this.rb_6
this.Control[iCurrent+14]=this.rb_7
this.Control[iCurrent+15]=this.rb_8
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.rb_9
this.Control[iCurrent+18]=this.rb_10
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.pb_6
this.Control[iCurrent+21]=this.dw_11
this.Control[iCurrent+22]=this.em_limit
this.Control[iCurrent+23]=this.st_time
this.Control[iCurrent+24]=this.pb_1
end on

on w_ocsalereceivable_r.destroy
call super::destroy
destroy(this.em_1)
destroy(this.ddlb_2)
destroy(this.dw_4)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
destroy(this.rb_7)
destroy(this.rb_8)
destroy(this.st_4)
destroy(this.rb_9)
destroy(this.rb_10)
destroy(this.st_5)
destroy(this.pb_6)
destroy(this.dw_11)
destroy(this.em_limit)
destroy(this.st_time)
destroy(this.pb_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
dw_11.visible = false

dw_1.sharedata(dw_2)
dw_4.settransobject(sqlca)
dw_4.insertrow(1)
dw_4.getchild('user',idwc_user)
idwc_user.insertrow(1)
idwc_user.setitem(1,'user_id','%')
idwc_user.setitem(1,'user_name','전체')
dw_4.object.user[1] = '%'
idwc_user.accepttext()

em_1.text     = string(today(),'yyyy/mm')
rb_10.checked = true
em_limit.text = "0"
em_limit.enabled = false

pb_6.enabled = false
end event

event resize;call super::resize;//
dw_1.width  = this.width  - 132
dw_1.height = this.height - 508
end event

type pb_save from w_inheritance`pb_save within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type dw_1 from w_inheritance`dw_1 within w_ocsalereceivable_r
integer x = 50
integer y = 368
integer width = 4366
integer height = 1732
string dataobject = "d_ocsalereceivable_s"
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_1::doubleclicked;call super::doubleclicked;string ls_custno, ls_custnm

if row > 0 then
	ls_custno = trim(this.object.cust_no[row])
	SELECT cust_name INTO :ls_custnm 
	  FROM CUSTOMER 
	 WHERE cust_no   = :ls_custno;
	 
	gs_print_control = "V" + ls_custno
	if gf_permission('판매거래처관리open', gs_userid) = 'Y' then
		if IsValid(w_cdcustomer_m) = False then			
			OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Layered!) // Layered! , Cascaded!
			Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			
			
			w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
			w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
			w_cdcustomer_m.dw_24.Visible  =  False

			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
			w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
			
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
			w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
			w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
			w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
			w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
			w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
			w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
			w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
			w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
			w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
		
		else
			if MessageBox("확인", "작업중인 판매거래처관리 프로그램을 종료하고 재 실행 합니까?", Exclamation!, OKCancel!, 2) = 2 then
				parent.arrangesheets( Cascade! )
				return
			else
				close(w_cdcustomer_m)
				OpenSheet(w_cdcustomer_m, parent.parentwindow(), 5, Layered!) // Layered! , Cascaded!
				Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

				w_cdcustomer_m.dw_1.object.cust_no[1]   = ls_custno
				w_cdcustomer_m.dw_1.object.cust_name[1] = ls_custnm
				w_cdcustomer_m.dw_24.Visible  =  False
	
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.insertrow(0)
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.reset()
				w_cdcustomer_m.tab_1.tabpage_1.dw_rem_i.reset()
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.reset()
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.reset()
				
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.setfocus()
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_1.dw_20.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
				w_cdcustomer_m.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
				w_cdcustomer_m.tab_1.tabpage_4.st_2.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_4.st_3.text = ls_custnm
				w_cdcustomer_m.tab_1.tabpage_3.st_5.text = ls_custno
				w_cdcustomer_m.tab_1.tabpage_3.st_6.text = ls_custnm
				w_cdcustomer_m.is_salesman = w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.salesman[1]
				w_cdcustomer_m.tab_1.tabpage_3.em_1.text = string(wf_today(),'YYYY')
				w_cdcustomer_m.tab_1.tabpage_1.dw_5.object.cust_no.protect = true
				w_cdcustomer_m.dw_15.retrieve(w_cdcustomer_m.tab_1.tabpage_3.st_5.text, integer(w_cdcustomer_m.tab_1.tabpage_3.em_1.text), w_cdcustomer_m.tab_1.tabpage_3.st_5.text)
				w_cdcustomer_m.tab_1.tabpage_6.cb_5.triggerevent(clicked!)
			end if
		end if
	else
		OpenSheet(w_cdcustomer_r, parent.parentwindow(), 5, Cascaded!)
		Parent.ArrangeSheets(TileHorizontal!)  // Cascade!,Layer!,Tile!,TileHorizontal!,Icons! 			

		w_cdcustomer_r.dw_1.object.cust_no[1]   = ls_custno
		w_cdcustomer_r.dw_1.object.cust_name[1] = ls_custnm

		w_cdcustomer_r.tab_1.tabpage_1.dw_5.reset()
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.reset()
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.reset()
		
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.setfocus()
		w_cdcustomer_r.tab_1.tabpage_1.dw_5.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_2.dw_4.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_4.dw_17.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_7.retrieve(ls_custno)
		w_cdcustomer_r.tab_1.tabpage_3.dw_6.retrieve(ls_custno, integer(string(wf_today(),'YYYY')))
	end if
end if

end event

type dw_2 from w_inheritance`dw_2 within w_ocsalereceivable_r
integer x = 1042
integer y = 140
integer width = 142
integer height = 92
string dataobject = "d_ocsalereceivable_r"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_title from w_inheritance`st_title within w_ocsalereceivable_r
integer x = 69
integer width = 1271
string text = "거래처 미수채권 현황"
end type

type st_tips from w_inheritance`st_tips within w_ocsalereceivable_r
end type

type pb_compute from w_inheritance`pb_compute within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type pb_close from w_inheritance`pb_close within w_ocsalereceivable_r
integer x = 4375
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_ocsalereceivable_r
integer x = 4183
end type

event pb_print::clicked;call super::clicked;w_repsuper w_print
st_print   l_print
string     ls_level_userid

if dw_1.rowcount() < 1 then return

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

ls_level_userid = dw_4.object.user[1]
//===============사용자별 프로그램 사용현황=================================
If gs_level = 'B' Then
	string ls_userid
	string ls_desc
	string ls_title
	string ls_bigyo
	string ls_username
		ls_userid = gs_userid
		ls_title = st_title.text
		If is_3mon = 'A' Then
			ls_bigyo = '전체'
		Else
			ls_bigyo = '3개월'
		End IF
		select user_name into :ls_username from login where user_id = :ls_level_userid;
		ls_desc = '기간 : ' + em_1.text + '/ 회전율 : ' + em_2.text + ' ' + ls_bigyo + '/ 등급 : ' + is_level + ' ' + ls_username +  '/ 출력'
		gf_log(ls_userid,ls_title,ls_desc)
End If	
//=================================================================

l_print.st_datawindow  = dw_2
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 거래처 미수채권 현황을 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)

end event

type pb_cancel from w_inheritance`pb_cancel within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type pb_delete from w_inheritance`pb_delete within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type pb_insert from w_inheritance`pb_insert within w_ocsalereceivable_r
boolean visible = false
boolean enabled = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_ocsalereceivable_r
integer x = 3799
end type

event pb_retrieve::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

st_security lst_security
string ls_level_userid
long   ll_row, ll_limit
integer li_year, li_month
decimal ld_rate

dw_1.reset()
dw_2.reset()
em_limit.text = "0"
//em_limit.enabled = false
pb_6.enabled  = false
ls_level_userid = dw_4.object.user[1]

choose case gs_level
	case 'A', 'B'
		if ls_level_userid = '%' then
			ls_level_userid = '%'
		else
			ls_level_userid = dw_4.object.user[1]
		end if
		
	case 'C'
		ls_level_userid = gs_userid
end choose

DateTime ld_time
string   ls_time
SELECT getdate() INTO :ld_time FROM dual;
st_time.text = string(ld_time,"hh:mm:ss")

dw_1.setredraw(false)
li_year   = integer(LeftA(em_1.text,4))
li_month  = integer(MidA(em_1.text,6,2))
ld_rate   = dec(em_2.text)

ll_row = dw_1.retrieve( li_year, li_month, is_level, ls_level_userid, ld_rate, is_3mon, li_month - 1 )
dw_1.setredraw(true)

SELECT replace(convert(char(3),DATEDIFF(ss, :ld_time, getdate()) / 60) + '분',' ','') + ' ' + 
             replace(convert(char(3),DATEDIFF(ss, :ld_time, getdate()) % 60) + '초',' ','') INTO :ls_time FROM dual;
st_time.text = ls_time

if ll_row > 0 then 
	em_limit.text    = "1000000"
	em_limit.enabled = true
	pb_6.enabled     = true
else
	em_limit.enabled = false
	pb_6.enabled     = false
end if

end event

type gb_3 from w_inheritance`gb_3 within w_ocsalereceivable_r
integer x = 50
integer width = 4366
integer height = 124
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_ocsalereceivable_r
integer x = 1403
integer y = 12
integer width = 2327
integer height = 208
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_ocsalereceivable_r
integer x = 3762
integer width = 841
end type

type em_1 from editmask within w_ocsalereceivable_r
integer x = 1426
integer y = 48
integer width = 320
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm"
boolean autoskip = true
end type

type ddlb_2 from dropdownlistbox within w_ocsalereceivable_r
integer x = 1989
integer y = 44
integer width = 229
integer height = 752
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "전체"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"전체","A","B","C","D","E","F","G","H","S","Z"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//
if index = 1 then
	is_level = '%'
else
	is_level = this.text
end if
end event

type dw_4 from datawindow within w_ocsalereceivable_r
integer x = 2336
integer y = 48
integer width = 663
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_whlogin_c"
boolean border = false
boolean livescroll = true
end type

event losefocus;this.accepttext()
end event

type em_2 from editmask within w_ocsalereceivable_r
integer x = 1650
integer y = 132
integer width = 247
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "3.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#0.00"
end type

type st_1 from statictext within w_ocsalereceivable_r
integer x = 1426
integer y = 144
integer width = 229
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "회전율:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ocsalereceivable_r
integer x = 1902
integer y = 144
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "개월이상"
boolean focusrectangle = false
end type

type rb_1 from radiobutton within w_ocsalereceivable_r
integer x = 2322
integer y = 140
integer width = 206
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "전체"
boolean checked = true
end type

event clicked;is_3mon = 'A'
end event

type rb_2 from radiobutton within w_ocsalereceivable_r
integer x = 2555
integer y = 140
integer width = 626
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "3개월 수금/매출無"
end type

event clicked;is_3mon = '3'

end event

type rb_3 from radiobutton within w_ocsalereceivable_r
integer x = 329
integer y = 276
integer width = 416
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처코드"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('cust_no')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type st_3 from statictext within w_ocsalereceivable_r
integer x = 128
integer y = 276
integer width = 174
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "정렬:"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within w_ocsalereceivable_r
integer x = 763
integer y = 276
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "거래처명"
boolean checked = true
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_5 from radiobutton within w_ocsalereceivable_r
integer x = 1134
integer y = 276
integer width = 233
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "등급"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('credit_level, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_6 from radiobutton within w_ocsalereceivable_r
integer x = 1385
integer y = 276
integer width = 352
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "당월매출"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('inv_amt D, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_7 from radiobutton within w_ocsalereceivable_r
integer x = 1755
integer y = 276
integer width = 416
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "당월말미수"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('inv_rem D, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_8 from radiobutton within w_ocsalereceivable_r
integer x = 2190
integer y = 276
integer width = 311
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "회전율"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('invrate, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type st_4 from statictext within w_ocsalereceivable_r
integer x = 1819
integer y = 60
integer width = 169
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "등급:"
boolean focusrectangle = false
end type

type rb_9 from radiobutton within w_ocsalereceivable_r
integer x = 2519
integer y = 276
integer width = 247
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "담당"
end type

event clicked;dw_1.setredraw(false)
dw_1.setsort('salesman, cust_name')
dw_1.sort()
//invrate, inv_rem, inv_amt, credit_level, cust_name
dw_1.setredraw(true)

end event

type rb_10 from radiobutton within w_ocsalereceivable_r
integer x = 3209
integer y = 140
integer width = 498
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 79741120
string text = "3개월 수금無"
end type

event clicked;is_3mon = 'C'

end event

type st_5 from statictext within w_ocsalereceivable_r
integer x = 2784
integer y = 276
integer width = 1152
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
string text = "더블클릭시 ~"판매거래처관리~" 실행."
boolean focusrectangle = false
end type

type pb_6 from picturebutton within w_ocsalereceivable_r
string tag = "여신자료"
integer x = 3410
integer y = 48
integer width = 293
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "여신현황"
vtextalign vtextalign = vcenter!
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

w_repsuper  w_print
st_print    l_print
string      ls_sql, ls_table, ls_where, ls_custnos, ls_custno
long        ll_year, ll_month, ll_row, ll_len, ll_limit

// 조회 거래처
ll_year  = long(LeftA(em_1.text,4))
ll_month = long(RightA(em_1.text,2))

for ll_row = 1 to dw_1.rowcount()
	ls_custno = dw_1.object.cust_no[ll_row]
	
	SELECT DBO.UF_GETOPEOM_SREM( :ls_custno, :ll_year, :ll_month )
	  INTO :ll_limit
	  FROM CUSTOMER 
	 WHERE CUST_NO  = :ls_custno;
	if ll_limit   < long(em_limit.text) then
	else
		ls_custnos = ls_custnos + '"' + dw_1.object.cust_no[ll_row] + '",'
	end if
next

ll_year  = long(LeftA(em_1.text,4))
ll_len   = LenA(ls_custnos)
ls_custnos = LeftA(ls_custnos, ll_len - 1)

ls_table = dw_11.Describe("DataWindow.Table.Select")
ls_where = "     and datepart(year, opeom.eom_year) = " + string(ll_year) + "~n" + &
           "     and opeom.cust_no in (" + ls_custnos + ")" + "~n"
ls_sql   = "DataWindow.Table.Select='" + ls_table + ls_where + "'"

dw_11.settransobject(sqlca)
dw_11.modify(ls_sql)
dw_11.retrieve()

if dw_11.rowcount() < 1 then
	MessageBox("확인", "출력조건에 만족하는 판매거래처가 없습니다.",information!)	
	return
end if

l_print.st_datawindow = dw_11
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 판매거래처의 여신리스트를 출력합니다." 

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=84'
OpenSheetWithParm(w_print, l_print, parentwindow(), 1, Original!)

end event

type dw_11 from datawindow within w_ocsalereceivable_r
integer x = 882
integer y = 140
integer width = 142
integer height = 92
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_cdaroivc_r"
boolean livescroll = true
end type

type em_limit from editmask within w_ocsalereceivable_r
integer x = 3035
integer y = 52
integer width = 361
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "1000000"
alignment alignment = right!
string mask = "#,###,##0"
end type

type st_time from statictext within w_ocsalereceivable_r
integer x = 3959
integer y = 276
integer width = 434
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ocsalereceivable_r
event mousemove pbm_mousemove
integer x = 3991
integer y = 52
integer width = 187
integer height = 144
integer taborder = 140
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

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value,   li_Pos,   li_value
long    ll_cnt
DataWindow dwxls

//string ls_filter
//ls_filter = ""
//dw_1.setfilter(ls_filter)
//dw_1.filter()


dwxls  = dw_1

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if dwxls.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.XLS), *.XLS, CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			dwxls.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			dwxls.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
	MessageBox("확인","작업완료")
end if	

//ls_filter = " inv_amt <> 0 or inv_rem <> 0 or pinv_avr <> 0 or cinv_avr  <> 0 or pinv_rem  <> 0 "
//dw_1.setfilter(ls_filter)
//dw_1.filter()

end event

