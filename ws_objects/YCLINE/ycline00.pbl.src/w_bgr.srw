$PBExportHeader$w_bgr.srw
$PBExportComments$Back Ground Window[Menu]
forward
global type w_bgr from window
end type
type p_cover from picture within w_bgr
end type
type dw_1 from datawindow within w_bgr
end type
end forward

global type w_bgr from window
integer width = 4681
integer height = 3072
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 16777215
event ue_compute ( )
event ue_retrieve ( )
event ue_append ( )
event ue_delete ( )
event ue_cancel ( )
event ue_print ( )
event ue_part_print ( )
event ue_save ( )
event ue_close ( )
p_cover p_cover
dw_1 dw_1
end type
global w_bgr w_bgr

type variables
int ii_main_idx, ii_sub_idx
str_size size_ctrl[]
int ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h
boolean ib_exec

end variables

forward prototypes
public function integer wf_size_it ()
public function integer wf_resize_it (double ldb_factorw, double ldb_factorh)
end prototypes

public function integer wf_size_it ();DragObject do_temp
int li_cnt, li_loop

ii_win_width  = This.width
ii_win_height = This.height
ii_win_frame_w = This.width - This.WorkSpaceWidth()
ii_win_frame_h = This.height - This.WorkSpaceHeight()

li_cnt = upperbound(This.control)
for li_loop = li_cnt to 1 step -1
	do_temp = This.control[li_loop]
	
	size_ctrl[li_loop].x = do_temp.x 
	size_ctrl[li_loop].width = do_temp.width
	size_ctrl[li_loop].y = do_temp.y
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

return 1

end function

public function integer wf_resize_it (double ldb_factorw, double ldb_factorh);DragObject do_temp
int li_cnt, li_loop

ib_exec = False
This.Hide()

li_cnt = UpperBound(This.control)
for li_loop = li_cnt to 1 step -1
	do_temp = This.control[li_loop]
	do_temp.x = size_ctrl[li_loop].x * ldb_factorw
	do_temp.width = size_ctrl[li_loop].width * ldb_factorw
	do_temp.y = size_ctrl[li_loop].y * ldb_factorh
	do_temp.height = size_ctrl[li_loop].height * ldb_factorh

	choose case TypeOf(do_temp)
		case commandbutton!
			commandbutton cb
			cb = do_temp
			cb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case singlelineedit!
			singlelineedit sle
			sle = do_temp
			sle.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case editmask!
			editmask em
			em = do_temp
			em.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case statictext!
			statictext st
			st = do_temp
			st.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case datawindow!
			datawindow dw
			dw = do_temp
			dw.Object.DataWindow.zoom = string(int(ldb_factorw * 100))
		case picturebutton!
			picturebutton pb
			pb = do_temp
			pb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case checkbox!
			checkbox cbx
			cbx = do_temp
			cbx.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = do_temp
			ddlb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case groupbox!
			groupbox gb
			gb = do_temp
			gb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case listbox!
			listbox lb
			lb = do_temp
			lb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case multilineedit!
			multilineedit mle
			mle = do_temp
			mle.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
		case radiobutton!
			radiobutton rb
			rb = do_temp
			rb.textsize = size_ctrl[li_loop].fontsize * ldb_factorw
	end choose
next
	
ib_exec = True

return 1

end function

on w_bgr.create
this.p_cover=create p_cover
this.dw_1=create dw_1
this.Control[]={this.p_cover,&
this.dw_1}
end on

on w_bgr.destroy
destroy(this.p_cover)
destroy(this.dw_1)
end on

event clicked;//if dw_1.Visible = True then
//	dw_1.Visible = False
//	dw_1.x = -500
//end if
//
end event

event mousemove;long ll_x   

if xpos <= 50 and dw_1.Visible = False then
	dw_1.Visible = True
	for ll_x = -500 to 0  step 50
		dw_1.x = ll_x
	next
end if

end event

event resize;//dw_1.Height = This.Height - 3
int li_rc
double ldb_ratiow, ldb_ratioh, ldb_ratio

if ib_exec then
	ldb_ratiow = This.Width / ii_win_width
	ldb_ratioh = This.Height / ii_win_height
	li_rc = wf_resize_it(ldb_ratiow, ldb_ratioh)
end if

end event

event open;String ls_menuid[], ls_menuyn[], ls_permission[]
Long ll_cnt, ll_row

wf_size_it()
ib_exec = True

dw_1.x = 0
This.Title = '바탕화면'


//IF gs_userid  <>  'TOP' THEN
//	FOR ll_row = 1 to 6
//		SELECT  menu_id, menu_yn, permission
//		  INTO  :ls_menuid[ll_row], :ls_menuyn[ll_row], :ls_permission[ll_row]
//		  FROM  EISLOGIN
//		 WHERE  user_id  =  :gs_userid AND  seq = :ll_row;
//
//		IF  ll_row = 1 THEN
//			IF ls_menuid[1] = 'm_produce' AND ls_menuyn[1] = 'N' THEN
//				w_bgr.dw_1.Object.b_1.Visible = FALSE
//				m_h_main.m_produce.Enabled = FALSE
//			END IF
//		END IF
//	
//		IF  ll_row = 2 THEN
//			IF ls_menuid[2] = 'm_sale' AND  ls_menuyn[2] = 'N' THEN
//				w_bgr.dw_1.Object.b_2.Visible = FALSE
//				m_h_main.m_sale.Enabled = FALSE
//			END IF
//		END IF
//	
//		IF  ll_row = 3 THEN
//			IF  ls_menuid[3] = 'm_jaje' AND ls_menuyn[3] = 'N' THEN
//				w_bgr.dw_1.Object.b_3.Visible = FALSE
//				m_h_main.m_jaje.Enabled = FALSE
//			END IF
//		END IF
//	
//		IF  ll_row = 4 THEN
//			IF  ls_menuid[4] = 'm_insa' AND ls_menuyn[4] = 'N' THEN
//				w_bgr.dw_1.Object.b_4.Visible = FALSE
//				m_h_main.m_insa.Enabled = FALSE
//			END IF
//		END IF
//	
//		IF  ll_row = 5 THEN
//			IF  ls_menuid[5] = 'm_acct' AND ls_menuyn[5] = 'N' THEN
//				w_bgr.dw_1.Object.b_5.Visible = FALSE
//				m_h_main.m_acct.Enabled = FALSE
//			END IF
//		END IF
//	
//		IF  ll_row = 6 THEN
//			IF  ls_menuid[6] = 'm_con' AND ls_menuyn[6] = 'N' THEN
//				w_bgr.dw_1.Object.b_6.Visible = FALSE
//				m_h_main.m_con.Enabled = FALSE
//			END IF
//		END IF
//	NEXT	
//END IF


end event

type p_cover from picture within w_bgr
event ue_mousemove pbm_mousemove
integer x = 489
integer width = 4178
integer height = 3072
string picturename = "C:\BMP\유창커버.bmp"
boolean focusrectangle = false
end type

event ue_mousemove;long ll_x   

if xpos <= 50 and dw_1.Visible = False then
	dw_1.Visible = True
	for ll_x = -500 to 0  step 50
		dw_1.x = ll_x
	next
end if

end event

event clicked;//if dw_1.Visible = True then
//	dw_1.Visible = False
//	dw_1.x = -500
//end if
//
end event

type dw_1 from datawindow within w_bgr
integer width = 485
integer height = 3072
string dataobject = "d_menu"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;//
long ll_x, ll_y, ll_cnt

ll_x = dw_1.x + Long(dwo.x) + 400
ll_y = dw_1.y + Long(dwo.y) + 200

choose case dwo.tag
//	case "1"
//		m_h_main.m_produce.PopMenu(ll_x, ll_y)
//	case "2"
//		m_h_main.m_sale.PopMenu(ll_x, ll_y)
	case "3"
		//m_h_main.m_manage.m_line.PopMenu(ll_x, ll_y)
		m_h_main.m_manage.m_line.TriggerEvent('Clicked')
		
//	case "4"
//		m_h_main.m_insa.PopMenu(ll_x, ll_y)
//	case "5"
//		m_h_main.m_acct.PopMenu(ll_x, ll_y)
//	case "6"
//		m_h_main.m_con.PopMenu(ll_x, ll_y)
	case "X"
		Close(w_h_main)
end choose

end event

