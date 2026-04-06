$PBExportHeader$w_bdinfo_det_m1.srw
$PBExportComments$설계영업진행사황[2000/11/29,서재복]
forward
global type w_bdinfo_det_m1 from w_inheritance
end type
end forward

global type w_bdinfo_det_m1 from w_inheritance
int X=169
int Y=212
int Width=3136
int Height=2192
boolean TitleBar=true
string Title="설계영업진행사항(w_bdinfo_det_m1)"
boolean Resizable=false
WindowState WindowState=normal!
end type
global w_bdinfo_det_m1 w_bdinfo_det_m1

type variables
string is_build_no,  is_prog_cls
decimal id_seq
gst_bdwhere ist_where

end variables

forward prototypes
public function boolean wf_delete1 (datawindow arg_dw1, string arg_str)
end prototypes

public function boolean wf_delete1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "삭제되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "삭제 실패!")
	return false
end if

end function

on w_bdinfo_det_m1.create
call super::create
end on

on w_bdinfo_det_m1.destroy
call super::destroy
end on

event open;call super::open;this.x = 30
this.y = 180

ist_where = Message.PowerObjectParm
is_prog_cls = ist_where.str11
is_build_no = ist_where.str12
id_seq = ist_where.dec4

pb_retrieve.PostEvent(Clicked!)


end event

type pb_save from w_inheritance`pb_save within w_bdinfo_det_m1
int X=2665
end type

event pb_save::clicked;string ls_nullvalue
long ll_row1, ll_row2, ll_cnt1, ll_cnt2
datetime ld_nullvalue

dw_2.accepttext()

ll_row2 = dw_2.GetRow()
if ll_row2 < 1 then return

if ll_row2 >= 1 then
	ld_nullvalue = dw_2.object.prog_date[ll_row2]
	if isnull(ld_nullvalue) then
		messagebox('확인','진행일자를 입력하세요.')
		dw_2.setcolumn('prog_date')
		dw_2.setfocus()
		return
	end if
	ls_nullvalue = dw_2.object.emp_no[ll_row2]
	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
		messagebox('확인','담당자를 입력하세요.')
		dw_2.setcolumn('emp_no')
		dw_2.setfocus()
		return
	end if
	ls_nullvalue = dw_2.object.rem[ll_row2]
	if isnull(ls_nullvalue) or trim(ls_nullvalue) = '' then
		messagebox('확인','진행내용을 입력하세요.')
		dw_2.setcolumn('rem')
		dw_2.setfocus()
		return
	end if

end if

ll_cnt2 = wf_modifycount(dw_2) 
if ll_cnt1 > 0  or ll_cnt2 > 0 then	
	wf_update1(dw_2,"Y") 
//	pb_insert.enabled = true
//	pb_delete.enabled = true
//	pb_cancel.enabled = false
end if

end event

type dw_1 from w_inheritance`dw_1 within w_bdinfo_det_m1
int X=3323
int Y=60
int Width=448
int Height=392
boolean Visible=false
string DataObject="dw_info"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=false
end type

type dw_2 from w_inheritance`dw_2 within w_bdinfo_det_m1
int X=78
int Y=288
int Width=2985
int Height=1744
string DataObject="d_bdinfo_detprog_m"
BorderStyle BorderStyle=StyleLowered!
end type

event dw_2::editchanged;This.accepttext()
end event

event dw_2::rbuttondown;string ls_date

CHOOSE CASE dwo.Name
	case 'prog_date'
		openWithParm(w_calendar, ls_date)
		ls_date = message.stringparm
		if ls_date <> 'N' then
			this.object.prog_date[row] = datetime(date(ls_date))
		end if
end choose

end event

type st_title from w_inheritance`st_title within w_bdinfo_det_m1
string Text="설계영업진행사항"
int TextSize=-20
end type

type pb_compute from w_inheritance`pb_compute within w_bdinfo_det_m1
int X=1783
int Y=48
boolean Visible=false
end type

event pb_compute::clicked;int li_build_no
string ls_build_no
long ll_row

if dw_1.RowCount() < 1 then
	li_build_no =  1
	ls_build_no = string(li_build_no,'0000000000')
else
	ls_build_no = dw_1.object.build_no[dw_1.RowCount()]
	li_build_no = integer(ls_build_no) + 1
	ls_build_no = string(li_build_no,'0000000000')
end if

ll_row = dw_1.insertrow(0)
dw_1.object.create_date[ll_row] = today()
dw_1.object.build_no[ll_row] = ls_build_no
dw_1.scrolltorow(ll_row)
dw_2.reset()
//dw_1.setcolumn('build_no')
//dw_1.setfocus()
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

type pb_print_part from w_inheritance`pb_print_part within w_bdinfo_det_m1
int X=1961
int Y=40
boolean Visible=false
boolean Enabled=false
end type

type pb_close from w_inheritance`pb_close within w_bdinfo_det_m1
int X=2857
end type

event pb_close::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_bdinfo_det_m1
int X=1403
int Y=44
boolean Visible=false
end type

type pb_cancel from w_inheritance`pb_cancel within w_bdinfo_det_m1
int X=1600
int Y=48
boolean Visible=false
boolean Enabled=false
end type

event pb_cancel::clicked;dw_2.deleterow(dw_2.rowcount())
pb_insert.enabled = true
pb_delete.enabled = true
pb_cancel.enabled = false
end event

type pb_delete from w_inheritance`pb_delete within w_bdinfo_det_m1
int X=2473
end type

event pb_delete::clicked;
dw_2.accepttext()

if dw_2.rowcount() < 1 then
	return
else
	if MessageBox("확인",'삭제하시겠습니까?',information!, OKCancel!, 2) = 2 then
		return
	end if	
	long ll_row
	dw_2.deleterow(0)
	for ll_row = 1 to dw_2.rowcount()
		dw_2.object.prog_seq[ll_row] = ll_row
	next
	dw_2.accepttext()
	wf_delete1(dw_2,"Y")
	return
end if



end event

type pb_insert from w_inheritance`pb_insert within w_bdinfo_det_m1
int X=2281
end type

event pb_insert::clicked;decimal ld_seq_no
long ll_row

select max(prog_seq) into :ld_seq_no from bdinfodetprog
where build_no = :is_build_no and seq = :id_seq and prog_cls = :is_prog_cls ;
 
if ld_seq_no = 0 or isnull(ld_seq_no) then
  	 ld_seq_no = 1
elseif ld_seq_no >= 1 then
	 ld_seq_no = ld_seq_no + 1
end if

ll_row = dw_2.insertrow(0)

dw_2.object.prog_cls[ll_row] = is_prog_cls
dw_2.object.build_no[ll_row] = is_build_no 
dw_2.object.seq[ll_row] = id_seq 
dw_2.object.prog_seq[ll_row] = ll_row //ld_seq_no 
dw_2.object.emp_no[ll_row] = gs_personno
dw_2.setcolumn('prog_date')
dw_2.scrolltorow(ll_row)
dw_2.setfocus()
//pb_insert.enabled = false
//pb_delete.enabled = false
//pb_cancel.enabled = true

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_bdinfo_det_m1
int X=2089
end type

event pb_retrieve::clicked;dw_2.reset()
dw_2.retrieve(is_prog_cls,is_build_no,id_seq)


end event

type gb_3 from w_inheritance`gb_3 within w_bdinfo_det_m1
int X=46
int Y=232
int Width=3031
int Height=1832
end type

type gb_2 from w_inheritance`gb_2 within w_bdinfo_det_m1
int X=3323
int Y=8
int Width=512
int Height=624
boolean Visible=false
end type

type gb_1 from w_inheritance`gb_1 within w_bdinfo_det_m1
int X=2057
int Width=1015
end type

