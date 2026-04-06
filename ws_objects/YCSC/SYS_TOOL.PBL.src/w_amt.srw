$PBExportHeader$w_amt.srw
forward
global type w_amt from w_inheritance
end type
type dw_3 from datawindow within w_amt
end type
type cbx_1 from checkbox within w_amt
end type
type cb_1 from commandbutton within w_amt
end type
type sle_1 from singlelineedit within w_amt
end type
type st_1 from statictext within w_amt
end type
type cb_2 from commandbutton within w_amt
end type
type cbx_2 from checkbox within w_amt
end type
type pb_1 from picturebutton within w_amt
end type
type em_1 from editmask within w_amt
end type
type st_2 from statictext within w_amt
end type
type st_3 from statictext within w_amt
end type
type ole_1 from olecontrol within w_amt
end type
type rte_1 from richtextedit within w_amt
end type
end forward

global type w_amt from w_inheritance
integer width = 3657
integer height = 2196
dw_3 dw_3
cbx_1 cbx_1
cb_1 cb_1
sle_1 sle_1
st_1 st_1
cb_2 cb_2
cbx_2 cbx_2
pb_1 pb_1
em_1 em_1
st_2 st_2
st_3 st_3
ole_1 ole_1
rte_1 rte_1
end type
global w_amt w_amt

type variables
string is_chk = 'N'
int ii_row = 0
end variables

on w_amt.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cbx_2=create cbx_2
this.pb_1=create pb_1
this.em_1=create em_1
this.st_2=create st_2
this.st_3=create st_3
this.ole_1=create ole_1
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cbx_2
this.Control[iCurrent+8]=this.pb_1
this.Control[iCurrent+9]=this.em_1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.ole_1
this.Control[iCurrent+13]=this.rte_1
end on

on w_amt.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cbx_2)
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ole_1)
destroy(this.rte_1)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//rte_1.document.name = "D:\이인호D\mypbl\사전\test.hwp"
//rte_1.InsertDocument("D:\이인호D\mypbl\사전\TEST.txt",  TRUE, FileTypeText!)

//st_status.Text = String(rtn)
//ole_1.InsertFile("D:\이인호D\mypbl\사전\test.hwp")
//ole_1.Activate(InPlace!)
//ole_1.open("D:\이인호D\mypbl\사전\test.hwp")
//ole_1.select("d:\개인\금전출납부.xls")
//사용 데이터베이스:sQL
//파워빌더 Version:7.0
//Ole를 이용해 특정 디렉토리내에 엑셀 자료들을 읽어오고 있습니다.아래 예처럼.
////엑셀파일 선택하기
//ls_path = is_proc_dir + ls_filename
//
////선택한 엑셀파일을 OLE 개체에 Insert 하기
//Result = 
//ole_2.InsertFile("d:\개인\금전출납부.xls")
//
//
////OLE 개체에 있는 데이터를 특정 스트링(ls_oledata)에 담기
//li_rtn = ole_1.GetData(ClipFormatText!, ls_oledata)
//
//ls_file = left(ls_filename,14) + '.txt'
//
////임의의 파일을 열기
//li_FileNum = FileOpen(ls_file, StreamMode!, Write!, LockWrite!, Append!)
//
////임의의 파일에 위의 스트링(ls_oledata)을 쓰기
//FileWrite(li_FileNum, ls_oledata)
//
////임의의 파일 닫기
//FileClose(li_FileNum)
//
////임의의 파일을 데이터윈도우에 Import 하기
//dw_trace.ImportFile(ls_file)
//
//문제는 가져 오는 엑셀의 컬럼이 작으면 문제없이 가져오는데
//제가 컬럼수가 83개정도 되는 컬럼에서 대략 20개정도를 선택해서 가져와야하는데
//import시키면 ole의 데이터가 다 import 가 아니되는군요.
//tap으로 구분되는 txt파일을 row길이 제한에 걸리는것 같은데 이걸 해결할 방법은 없나요.
//혹 다른 방법으로 엑셀 데이터를 가져올수는 없는지요..(83컬럼중에 특정컬럼 20여개정도를 가져와야함.)
//부탁드립니다...
end event

type pb_save from w_inheritance`pb_save within w_amt
integer x = 503
integer y = 148
integer width = 146
integer height = 116
end type

event pb_save::clicked;dw_1.accepttext()
wf_update1(dw_1, 'Y')
end event

type dw_1 from w_inheritance`dw_1 within w_amt
event mousemove pbm_dwnmousemove
event lbuttonclk pbm_dwnlbuttonclk
event lbuttonup pbm_dwnlbuttonup
integer x = 5
integer y = 268
integer width = 667
integer height = 1792
integer taborder = 70
string dataobject = "d_amt"
borderstyle borderstyle = stylelowered!
end type

event dw_1::mousemove;//st_2.text = string (row)
//st_3.text = string (ii_row)
////if row = 0 then is_chk = 'N'
//if row = 0 or ii_row = row then return
//if is_chk = 'Y' and ii_row < row then this.selectrow(row, not this.isselected(row))
//if is_chk = 'Y' and ii_row > row then this.selectrow(row, not this.isselected(ii_row))
//ii_row = row
//
end event

event dw_1::lbuttonclk;//is_chk = 'Y'
end event

event dw_1::lbuttonup;//is_chk = 'N'
end event

type dw_2 from w_inheritance`dw_2 within w_amt
integer x = 1714
integer y = 268
integer width = 1902
integer height = 1792
integer taborder = 100
boolean titlebar = true
string dataobject = "d_amt1"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event dw_2::doubleclicked;if row < 1 then return
if this.object.sel[row] = 'Y' then
	this.object.sel[row] = 'N'
else
	this.object.sel[row] = 'Y'
end if


end event

event dw_2::clicked;if row < 1 then return
this.scrolltorow(row)
end event

type st_title from w_inheritance`st_title within w_amt
integer x = 5
integer y = 4
integer width = 1221
integer height = 92
integer textsize = -14
string text = "통신입찰 Simulation"
end type

type st_tips from w_inheritance`st_tips within w_amt
end type

type pb_compute from w_inheritance`pb_compute within w_amt
integer x = 2405
integer y = 56
integer taborder = 130
end type

event pb_compute::clicked;long ll_row, ll_amt, ll_amt1, ll_amt2, ll_amt3, ll_amt4
dec {6} ld_amt

dw_1.accepttext()
dw_2.reset()
dw_3.reset()

ld_amt = dec(em_1.text)

ll_amt = dw_1.rowcount()

ll_row = 0
dw_2.setredraw(false)
for ll_amt1 = 1 to ll_amt - 3
	for ll_amt2 = ll_amt1 + 1 to ll_amt - 2
		for ll_amt3 = ll_amt2 + 1 to ll_amt - 1
			for ll_amt4 = ll_amt3 + 1 to ll_amt 
				ll_row = ll_row + 1
				dw_2.object.per[ll_row] = ld_amt
				dw_2.object.amt1[ll_row] = dw_1.object.amt[ll_amt1]
				dw_2.object.amt2[ll_row] = dw_1.object.amt[ll_amt2]
				dw_2.object.amt3[ll_row] = dw_1.object.amt[ll_amt3]
				dw_2.object.amt4[ll_row] = dw_1.object.amt[ll_amt4]
				dw_2.object.arr[ll_row] = string(ll_amt1) + '/' &
												+ string(ll_amt2) + '/' &
												+ string(ll_amt3) + '/' &
												+ string(ll_amt4)
			next
		next
	next
next
dw_2.accepttext()
dw_2.setsort('s80')
dw_2.sort()
dw_2.accepttext()
dw_2.groupcalc()

boolean lb_found
long ll_breakrow

ll_breakrow = 0
DO WHILE NOT (lb_found)

	ll_breakrow = dw_2.FindGroupChange( ll_breakrow, 1)
	IF ll_breakrow <= 0 THEN EXIT
	ll_row = dw_3.insertrow(0)
	dw_3.object.seq[ll_row] = dw_2.object.seq[ll_breakrow]
	dw_3.object.amt[ll_row] = dw_2.object.s80[ll_breakrow]
	dw_3.object.cnt[ll_row] = dw_2.object.cnt[ll_breakrow]
	dw_3.object.pec[ll_row] = dw_2.object.pec[ll_breakrow]
	ll_breakrow = ll_breakrow + 1
LOOP
dw_2.setredraw(true)

				
				
end event

type pb_print_part from w_inheritance`pb_print_part within w_amt
integer x = 3191
integer y = 56
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "선택취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_print_part::clicked;   dw_3.SelectRow(0, false)

end event

event pb_print_part::mousemove;//
end event

type pb_close from w_inheritance`pb_close within w_amt
integer x = 3383
integer y = 56
integer taborder = 140
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_amt
integer x = 2999
integer y = 56
integer taborder = 150
end type

event pb_print::clicked;dw_2.print()
//w_repsuper w_print
//st_print l_print
//
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은  출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
//


end event

type pb_cancel from w_inheritance`pb_cancel within w_amt
integer x = 2597
integer y = 56
integer taborder = 160
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "80 정렬"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_cancel::clicked;dw_2.setredraw(false)
dw_2.accepttext()
dw_2.setsort('s80')
dw_2.sort()
dw_2.groupcalc()
dw_2.setredraw(true)


end event

event pb_cancel::mousemove;//
end event

type pb_delete from w_inheritance`pb_delete within w_amt
integer x = 2789
integer y = 56
integer width = 206
integer taborder = 170
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "합계정렬"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = multiline!
end type

event pb_delete::clicked;dw_2.setredraw(false)
dw_2.accepttext()
dw_2.setsort('sum')
dw_2.sort()
dw_2.setredraw(true)


end event

event pb_delete::mousemove;//
end event

type pb_insert from w_inheritance`pb_insert within w_amt
integer x = 201
integer y = 148
integer width = 146
integer height = 116
integer taborder = 190
end type

event pb_insert::clicked;dw_1.insertrow(0)
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_amt
integer x = 50
integer y = 148
integer width = 146
integer height = 116
integer taborder = 180
end type

event pb_retrieve::clicked;dw_1.retrieve()
end event

type gb_3 from w_inheritance`gb_3 within w_amt
boolean visible = false
integer x = 763
integer width = 2725
integer taborder = 110
end type

type gb_2 from w_inheritance`gb_2 within w_amt
boolean visible = false
integer width = 722
integer taborder = 120
end type

type gb_1 from w_inheritance`gb_1 within w_amt
integer x = 1705
integer width = 1893
end type

type dw_3 from datawindow within w_amt
integer x = 672
integer y = 268
integer width = 1038
integer height = 1792
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_amt2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row < 1 then return
this.SelectRow(row, NOT this.IsSelected(row))

end event

event clicked;if row < 1 then return
this.scrolltorow(row)
dw_2.scrolltorow( this.object.seq[row])
end event

type cbx_1 from checkbox within w_amt
integer x = 1733
integer y = 48
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택"
end type

event clicked;if this.checked = true then
	dw_2.setfilter('sel = "Y"')
	dw_2.filter()
else
	dw_2.setfilter('')
	dw_2.filter()
end if
end event

type cb_1 from commandbutton within w_amt
integer x = 1175
integer y = 156
integer width = 247
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "검색"
end type

event clicked;string ls_str

ls_str = string(integer(sle_1.text), '000')
dw_3.setfilter('string(cnt,"000") >= "' + ls_str + '"')
dw_3.filter()

end event

type sle_1 from singlelineedit within w_amt
integer x = 773
integer y = 172
integer width = 123
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "60"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_amt
integer x = 901
integer y = 180
integer width = 265
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "개 이상"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_amt
integer x = 1435
integer y = 156
integer width = 247
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;dw_3.setfilter('')
dw_3.filter()

end event

type cbx_2 from checkbox within w_amt
integer x = 1733
integer y = 136
integer width = 352
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "미리보기"
end type

event clicked;dw_2.setredraw(false)
if this.checked = true then
	dw_2.object.datawindow.print.preview = true
else
	dw_2.object.datawindow.print.preview = false
end if
dw_2.setredraw(true)

end event

type pb_1 from picturebutton within w_amt
integer x = 352
integer y = 148
integer width = 146
integer height = 116
integer taborder = 90
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event clicked;if dw_1.getrow() < 1 then return
dw_1.deleterow(0)
end event

type em_1 from editmask within w_amt
integer x = 1998
integer y = 48
integer width = 357
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
string text = "0.8095"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "0.000000"
end type

type st_2 from statictext within w_amt
integer x = 1504
integer y = 44
integer width = 160
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_3 from statictext within w_amt
integer x = 1275
integer y = 40
integer width = 160
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type ole_1 from olecontrol within w_amt
integer x = 2862
integer width = 530
integer height = 1208
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_amt.win"
boolean resizable = true
omdisplaytype displaytype = displayasactivexdocument!
omcontentsallowed contentsallowed = containsany!
end type

type rte_1 from richtextedit within w_amt
integer x = 2597
integer y = 16
integer width = 293
integer height = 436
integer taborder = 140
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_displayonly = true
borderstyle borderstyle = stylelowered!
boolean resizable = true
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_amt.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_amt.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
