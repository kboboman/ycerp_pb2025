$PBExportHeader$w_ancestor.srw
$PBExportComments$조상윈도우
forward
global type w_ancestor from window
end type
type dw_1 from datawindow within w_ancestor
end type
type dw_r from datawindow within w_ancestor
end type
end forward

global type w_ancestor from window
integer width = 4663
integer height = 2544
boolean titlebar = true
boolean controlmenu = true
windowstate windowstate = maximized!
long backcolor = 67108864
event ue_close ( )
event ue_append ( )
event ue_save ( )
event ue_clear ( )
event ue_retrieve ( )
event ue_choice ( )
event ue_delete ( )
event ue_print ( )
dw_1 dw_1
dw_r dw_r
end type
global w_ancestor w_ancestor

type variables
//
str_size size_ctrl[]
int     ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h
boolean ib_exec

end variables

forward prototypes
public function integer wf_resize_it (double ldb_factorw, double ldb_factorh)
public function integer wf_size_it ()
end prototypes

public function integer wf_resize_it (double ldb_factorw, double ldb_factorh);//	li_rc = wf_resize_it(ldb_ratiow, ldb_ratioh)
//
DragObject do_temp
int li_cnt, li_loop

ii_win_width   = This.width
ii_win_height  = This.height
ii_win_frame_w = This.width  - This.WorkSpaceWidth()
ii_win_frame_h = This.height - This.WorkSpaceHeight()

li_cnt = upperbound(This.control)
for li_loop = li_cnt to 1 step -1
	do_temp = This.control[li_loop]
	
	size_ctrl[li_loop].x      = do_temp.x 
	size_ctrl[li_loop].width  = do_temp.width
	size_ctrl[li_loop].y      = do_temp.y
	size_ctrl[li_loop].height = do_temp.height

	choose case typeof(do_temp)
		case commandbutton!
			commandbutton cb
			cb = do_temp
			size_ctrl[li_loop].fontsize = cb.textsize
		case singlelineedit!
			singlelineedit sle
			sle = do_temp
			size_ctrl[li_loop].fontsize = sle.textsize
		case editmask!
			editmask em
			em = do_temp
			size_ctrl[li_loop].fontsize =	em.textsize
		case statictext!
			statictext st
			st = do_temp
			size_ctrl[li_loop].fontsize =	st.textsize
		case picturebutton!
			picturebutton pb
			pb = do_temp
			size_ctrl[li_loop].fontsize = pb.textsize
		case checkbox!
			checkbox cbx
			cbx = do_temp
			size_ctrl[li_loop].fontsize =	cbx.textsize
		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = do_temp
			size_ctrl[li_loop].fontsize =	ddlb.textsize
		case groupbox!
			groupbox gb
			gb = do_temp
			size_ctrl[li_loop].fontsize =	gb.textsize
		case listbox!
			listbox lb
			lb = do_temp
			size_ctrl[li_loop].fontsize =	lb.textsize
		case multilineedit!
			multilineedit mle
			mle = do_temp
			size_ctrl[li_loop].fontsize =	mle.textsize
		case radiobutton!
			radiobutton rb
			rb = do_temp
			size_ctrl[li_loop].fontsize =	rb.textsize
	end choose
next

RETURN 1

end function

public function integer wf_size_it ();////////////////////////////////////////
// wf_size_it ( integer )
////////////////////////////////////////
//
DragObject do_temp
int li_cnt, li_loop

ii_win_width   = This.width
ii_win_height  = This.height
ii_win_frame_w = This.width  - This.WorkSpaceWidth()
ii_win_frame_h = This.height - This.WorkSpaceHeight()

li_cnt = upperbound(This.control)
for li_loop = li_cnt to 1 step -1
	do_temp = This.control[li_loop]
	
	size_ctrl[li_loop].x      = do_temp.x 
	size_ctrl[li_loop].width  = do_temp.width
	size_ctrl[li_loop].y      = do_temp.y
	size_ctrl[li_loop].height = do_temp.height

	choose case typeof(do_temp)
		case commandbutton!
			commandbutton cb
			cb = do_temp
			size_ctrl[li_loop].fontsize = cb.textsize
			
		case singlelineedit!
			singlelineedit sle
			sle = do_temp
			size_ctrl[li_loop].fontsize = sle.textsize
			
		case editmask!
			editmask em
			em = do_temp
			size_ctrl[li_loop].fontsize =	em.textsize
			
		case statictext!
			statictext st
			st = do_temp
			size_ctrl[li_loop].fontsize =	st.textsize
			
		case picturebutton!
			picturebutton pb
			pb = do_temp
			size_ctrl[li_loop].fontsize = pb.textsize
			
		case checkbox!
			checkbox cbx
			cbx = do_temp
			size_ctrl[li_loop].fontsize =	cbx.textsize
			
		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = do_temp
			size_ctrl[li_loop].fontsize =	ddlb.textsize
			
		case groupbox!
			groupbox gb
			gb = do_temp
			size_ctrl[li_loop].fontsize =	gb.textsize
			
		case listbox!
			listbox lb
			lb = do_temp
			size_ctrl[li_loop].fontsize =	lb.textsize
			
		case multilineedit!
			multilineedit mle
			mle = do_temp
			size_ctrl[li_loop].fontsize =	mle.textsize
			
		case radiobutton!
			radiobutton rb
			rb = do_temp
			size_ctrl[li_loop].fontsize =	rb.textsize
	end choose
next

RETURN 1

end function

on w_ancestor.create
this.dw_1=create dw_1
this.dw_r=create dw_r
this.Control[]={this.dw_1,&
this.dw_r}
end on

on w_ancestor.destroy
destroy(this.dw_1)
destroy(this.dw_r)
end on

event resize;//
int    li_rc
double ldb_ratiow, ldb_ratioh, ldb_ratio

if ib_exec then
	ldb_ratiow = This.Width  / ii_win_width
	ldb_ratioh = This.Height / ii_win_height
	li_rc      = wf_resize_it(ldb_ratiow, ldb_ratioh)
end if

end event

event open;//
dw_r.SetTransObject(SQLCA)
dw_1.SetTransObject(SQLCA)

wf_size_it()
ib_exec = True

end event

type dw_1 from datawindow within w_ancestor
event ue_key pbm_dwnkey
event ue_enter pbm_dwnprocessenter
integer x = 9
integer y = 268
integer width = 4622
integer height = 2164
integer taborder = 20
string dataobject = "d_ancestor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;//
string ls_error_text, ls_row_text, ls_errtext
long   ll_error_cd
int    li_rtn = 1

if SQLCA.SqlCode = 0 and sqldbcode = 0 then
	Return 0
elseif SQLCA.SqlCode = 100 then
	ll_error_cd = SQLCA.SqlCode
else
	ls_errtext  = SQLCA.SQLErrText
	ll_error_cd = sqldbcode
end if

If row > 0 Then
	ls_row_text = string(row) + '행에 '
End If

CHOOSE CASE ll_error_cd
	CASE -3
		ls_error_text = '처리중 시스템 오류가 발생했습니다.(ERROR CODE:' + String(ll_error_cd) + ')' + '~r~n' + &
							 '현재 수정한 자료가 수정중 다른사람에 의해 시스템에서 삭제되었거나 ~r~n'+ &
							 '현재 조회된 자료와 시스템에 저장되어 있는 자료가 서로 다를수 있으니 ~r~n' + &
							 '새로 조회를 하여 자료를 확인하십시요.'
		li_rtn = -1
	CASE 0
		ls_error_text = ''
		li_rtn = -1
	CASE 1, -193, 2627, 1400
		ls_error_text = ls_row_text + '중복되는 자료를 입력하셨습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 100
		ls_error_text = '해당하는 자료가 존재하지 않습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 903
		ls_error_text = 'SQL문에서 TABLE의 이름이 잘못 기술되었습니다. ~r~n' + &
							 'TABLE의 이름을 확인하여 주시기 바랍니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 904
		ls_error_text = 'TABLE에 있는 COLUMN의 이름이 존재하지 않거나 ~r~n' + &
							 'HOST 변수의 사용방법이 틀렸습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 942
		ls_error_text = 'TABLE(VIEW)가 존재하지 않습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '전산담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
	CASE 1017
		ls_error_text = '사용자명 또는 암호가 부적절하여 시스템에 연결되지 않았습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '전산담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
	CASE 1407, -195, 515, 233
		ls_error_text = ls_row_text + '필수입력항목(NOT NULL)이 입력되지 않았습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 1401, 1438
		ls_error_text = 'Column에 저장할수 있는 값보다 더큰 값이 입력되었습니다 .(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 1476
		ls_error_text = '숫자를 0으로 나누어서 이상이 발생하였습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 2112
		ls_error_text = '예상되는 자료값이 1건이여야 하나 ~r~n' + &
							 '여러건이 발생하여 ERROR가 발생하였습니다.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 2291
		ls_error_text = 'PARENT DATA가 없어서 CHILD DATA를 입력(변경)할 수 없습니다. ~r~n' + &
							 '자료의 구조를 확인하여 주십시오.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 2292
		ls_error_text = 'CHILD DATA가 있어서 PARENT DATA를 삭제할 수 없습니다. ~r~n' + &
							 '자료의 구조를 확인하여 주십시오.(' + String(ll_error_cd) + ')'
		li_rtn = -1
	CASE 6564
		ls_error_text = '작업할 서버용 함수를 찾을수 없습니다.' + '~r~n' + &
							 '전산담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
	CASE 12154
		ls_error_text = '서버를 찾을 수 없습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '전산담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
	CASE 20003
		ls_error_text = 'STORED PROCEDURE나 서버의 함수가 정의되지 않았습니다.(' + String(ll_error_cd) + ')' + '~r~n' + &
							 '전산담당자에게 연락하여 주시기 바랍니다.'
		li_rtn = -1
	CASE ELSE
		ls_error_text = '처리중 시스템 오류가 발생했습니다.(ERROR CODE:' + String(ll_error_cd) + ')' + '~r~n' + ls_errtext
		li_rtn = -1
END CHOOSE

If li_rtn < 0 Then MessageBox("알림", ls_error_text, StopSign!)

Return li_rtn

end event

type dw_r from datawindow within w_ancestor
event ue_enter pbm_dwnprocessenter
event ue_key pbm_dwnkey
integer x = 9
integer y = 12
integer width = 4622
integer height = 252
integer taborder = 10
string title = "none"
string dataobject = "d_ancestor_r"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

