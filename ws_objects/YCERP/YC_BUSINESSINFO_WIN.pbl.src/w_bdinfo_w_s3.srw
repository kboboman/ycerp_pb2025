$PBExportHeader$w_bdinfo_w_s3.srw
forward
global type w_bdinfo_w_s3 from window
end type
type cb_3 from commandbutton within w_bdinfo_w_s3
end type
type cb_2 from commandbutton within w_bdinfo_w_s3
end type
type dw_1 from datawindow within w_bdinfo_w_s3
end type
type cb_1 from commandbutton within w_bdinfo_w_s3
end type
type sle_1 from singlelineedit within w_bdinfo_w_s3
end type
type pb_2 from picturebutton within w_bdinfo_w_s3
end type
type pb_1 from picturebutton within w_bdinfo_w_s3
end type
type gb_1 from groupbox within w_bdinfo_w_s3
end type
end forward

global type w_bdinfo_w_s3 from window
integer x = 832
integer y = 360
integer width = 2482
integer height = 1208
boolean titlebar = true
string title = "설계사 검색/등록(w_bdinfo_w_s4)"
windowtype windowtype = response!
long backcolor = 79741120
boolean center = true
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
sle_1 sle_1
pb_2 pb_2
pb_1 pb_1
gb_1 gb_1
end type
global w_bdinfo_w_s3 w_bdinfo_w_s3

type variables
gs_custdo_str  ist_code
gst_bdwhere ist_where, ls_project
gs_boolean is_ble

end variables

on w_bdinfo_w_s3.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_1,&
this.cb_1,&
this.sle_1,&
this.pb_2,&
this.pb_1,&
this.gb_1}
end on

on w_bdinfo_w_s3.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;ist_where = Message.PowerObjectParm
dw_1.settransobject(sqlca)
cb_1.triggerevent(clicked!)


end event

type cb_3 from commandbutton within w_bdinfo_w_s3
integer x = 1897
integer y = 104
integer width = 475
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "추가,수정,삭제"
end type

event clicked;if dw_1.getrow() > 0 then
	ist_where.str2 = dw_1.object.comname[dw_1.getrow()]
	openwithparm(w_cdcon_m2, ist_where)
	ist_where = Message.PowerObjectParm
	if	ist_where.okflag = true then
		sle_1.text = ist_where.str2
		cb_1.triggerevent(clicked!)
		cb_2.triggerevent(clicked!)
	end if
else
	ist_where.str2 = trim(sle_1.text)
	openwithparm(w_cdcon_m2, ist_where)
	ist_where = Message.PowerObjectParm
	if	ist_where.okflag = true then
		sle_1.text = ist_where.str2
		cb_1.triggerevent(clicked!)
		cb_2.triggerevent(clicked!)
	end if
end if

//추가
//long ll_seq
//decimal ld_seq_no
//string ls_build_no, ls_newproj
//
//if messagebox('확인', trim(sle_1.text) + ' 을 신규 등록하시겠습니까?', question!, YesNo!, 1) = 1 then
//	ls_newproj = trim(sle_1.text) 
//	if ls_newproj = '' or isnull(ls_newproj) then 
//		messagebox('오류', '현장명을 입력하고 추가를 하세요.', stopsign!)
//		return
//	end if
//	
//	select top 1 isnull(build_no,'') into :ls_build_no 
//	from bdinfo;
//
//		select max(seq) into :ld_seq_no from bdinfodet
//		 where build_no = :ls_build_no;
//		if ld_seq_no = 0 or isnull(ld_seq_no) then
//			 ld_seq_no = 1
//		elseif ld_seq_no >= 1 then
//			 ld_seq_no = ld_seq_no + 1
//		end if
//		
//	insert into bdinfodet (build_no, seq, project, std_chk, bid_chk, etmt_chk, makedate)
//			values (:ls_build_no, :ld_seq_no, :ls_newproj, '1', 0, 0, getdate());
//	if sqlca.sqlcode = 0 then
//		commit using sqlca;
//	end if
//end if
//
//sle_1.text = ''
//cb_1.postevent(clicked!)
//
//수정
//long ll_dw1row, ll_seq
//string ls_build_no, ls_newproj
//
//ll_dw1row = dw_1.getrow()
//if messagebox('확인', trim(dw_1.object.bdinfodet_project[ll_dw1row]) + ' 를' + trim(sle_1.text) + ' 로 변경하시겠습니까?', question!, YesNo!, 1) = 1 then
//	ls_build_no = dw_1.object.bdinfodet_build_no[ll_dw1row]
//	ll_seq =	dw_1.object.bdinfodet_seq[ll_dw1row]
//	ls_newproj = trim(sle_1.text) 
//	
//	update bdinfodet set project = :ls_newproj
//	where build_no = :ls_build_no
//	and	seq = :ll_seq;
//	if sqlca.sqlcode = 0 then
//		commit using sqlca;
//	end if
//end if
//
//cb_1.postevent(clicked!)


//삭제
//long ll_dw1row, ll_seq
//string ls_build_no
//
//ll_dw1row = dw_1.getrow()
//if messagebox('확인', trim(dw_1.object.bdinfodet_project[ll_dw1row]) + ' 을' + ' 삭제 하시겠습니까? ~n~n삭제시 현장정보 및 설계/공사/판매 입력자료가 같이 삭제되어 집니다.', question!, YesNo!, 1) = 1 then
//	ls_build_no = dw_1.object.bdinfodet_build_no[ll_dw1row]
//	ll_seq =	dw_1.object.bdinfodet_seq[ll_dw1row]
//	
//   delete from bdinfodet 
//	where build_no = :ls_build_no
//	and	seq = :ll_seq;
//	if sqlca.sqlcode = 0 then
//		commit using sqlca;
//	end if
//end if
//
//cb_1.postevent(clicked!)
end event

type cb_2 from commandbutton within w_bdinfo_w_s3
integer x = 1495
integer y = 104
integer width = 238
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "선택"
end type

event clicked;if dw_1.getrow() > 0 then
	ist_where.str1 = dw_1.object.comcode[dw_1.getrow()]
	ist_where.str2 = dw_1.object.comname[dw_1.getrow()]
	
	ist_where.okflag = true
	closewithreturn(parent, ist_where)
end if

end event

type dw_1 from datawindow within w_bdinfo_w_s3
integer x = 73
integer y = 216
integer width = 2313
integer height = 756
integer taborder = 30
string title = "none"
string dataobject = "d_bdsearch_design_s3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dw_1.getrow() > 0 then
	cb_2.triggerevent(clicked!)
end if
end event

type cb_1 from commandbutton within w_bdinfo_w_s3
integer x = 1230
integer y = 104
integer width = 238
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "검색"
boolean default = true
end type

event clicked;string ls_sle_1
long ll_dw_1cnt
ls_sle_1 = trim(sle_1.text)
if ls_sle_1 = '' or isnull(ls_sle_1) then
	ls_sle_1 = '%'
else
	ls_sle_1 = '%' + ls_sle_1 + '%'
end if

ll_dw_1cnt = dw_1.retrieve(ls_sle_1)
if ll_dw_1cnt > 0 then 
	dw_1.setrow(1)
	dw_1.setfocus()
end if
end event

type sle_1 from singlelineedit within w_bdinfo_w_s3
integer x = 73
integer y = 108
integer width = 1079
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type pb_2 from picturebutton within w_bdinfo_w_s3
integer x = 2176
integer y = 1004
integer width = 279
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
string text = "종료"
boolean cancel = true
string picturename = "c:\bmp\취소.bmp"
alignment htextalign = right!
end type

event clicked;is_ble.okflag = false
closewithreturn(parent, is_ble)
//close(parent)
end event

type pb_1 from picturebutton within w_bdinfo_w_s3
boolean visible = false
integer x = 1865
integer y = 1004
integer width = 265
integer height = 112
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

event clicked;//is_ble.okflag = false
//closewithreturn(parent, is_ble)
close(parent)

end event

type gb_1 from groupbox within w_bdinfo_w_s3
integer y = 28
integer width = 2455
integer height = 964
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "굴림"
long textcolor = 16711680
long backcolor = 79219928
string text = "건설사 검색/등록"
end type

