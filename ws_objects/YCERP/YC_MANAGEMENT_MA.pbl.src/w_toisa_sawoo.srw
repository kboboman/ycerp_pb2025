$PBExportHeader$w_toisa_sawoo.srw
$PBExportComments$퇴직사우근황(2006.09.29,이기영)
forward
global type w_toisa_sawoo from window
end type
type rb_2 from radiobutton within w_toisa_sawoo
end type
type rb_1 from radiobutton within w_toisa_sawoo
end type
type pb_save from picturebutton within w_toisa_sawoo
end type
type dw_1 from datawindow within w_toisa_sawoo
end type
type st_title from statictext within w_toisa_sawoo
end type
type st_tips from statictext within w_toisa_sawoo
end type
type pb_close from picturebutton within w_toisa_sawoo
end type
type pb_print from picturebutton within w_toisa_sawoo
end type
type pb_retrieve from picturebutton within w_toisa_sawoo
end type
type gb_1 from groupbox within w_toisa_sawoo
end type
type gb_2 from groupbox within w_toisa_sawoo
end type
end forward

global type w_toisa_sawoo from window
integer x = 9
integer y = 12
integer width = 4411
integer height = 2376
boolean titlebar = true
string title = "퇴직사우근황(w_toisa_sawoo]"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
rb_2 rb_2
rb_1 rb_1
pb_save pb_save
dw_1 dw_1
st_title st_title
st_tips st_tips
pb_close pb_close
pb_print pb_print
pb_retrieve pb_retrieve
gb_1 gb_1
gb_2 gb_2
end type
global w_toisa_sawoo w_toisa_sawoo

forward prototypes
public function long wf_insertrow (datawindow arg_dw)
public function long wf_modifycount (datawindow arg_dw)
public subroutine wf_sort (datawindow arg_dw, string arg_str)
public subroutine wf_modifyselect (datawindow arg_dw, string arg_str)
public subroutine wf_focus (datawindow arg_dw, string arg_str)
public subroutine wf_syntaxfromsql (datawindow arg_dw, string arg_str)
public function boolean wf_update1 (datawindow arg_dw1, string arg_str)
public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str)
public function boolean wf_update3 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, string arg_str)
public function boolean wf_update4 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, string arg_str)
public function long wf_rowfocuschange (datawindow arg_dw, string arg_str)
public subroutine wf_mboxinfo (string arg_str)
public subroutine wf_mboxwarn (string arg_str)
public function boolean wf_update5 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, string arg_str)
public function boolean wf_update6 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, datawindow arg_dw6, string arg_str)
public function long wf_retrieve (datawindow arg_dw, string arg_str)
public function datetime wf_today ()
public subroutine wf_filter (datawindow arg_dw, string arg_str)
public subroutine wf_filterdwc (datawindowchild arg_dw, string arg_str)
public function boolean wf_nullchk (datawindow arg_dw)
public function long wf_retrievechild (datawindowchild arg_dw, string arg_str)
end prototypes

public function long wf_insertrow (datawindow arg_dw);long ll_Row

ll_Row = arg_dw.InsertRow(0) 
arg_dw.ScrollToRow(ll_Row)

Return ll_Row


end function

public function long wf_modifycount (datawindow arg_dw);//argment : arg_dw  type : datawindow  return_value : long
long ll_cnt

ll_cnt = arg_dw.ModifiedCount( ) + arg_dw.DeletedCount( )

RETURN ll_cnt

end function

public subroutine wf_sort (datawindow arg_dw, string arg_str);//------ sort ---------
arg_dw.SetSort(arg_str)
arg_dw.Sort( )
//---------------------
end subroutine

public subroutine wf_modifyselect (datawindow arg_dw, string arg_str);string original_select, rc, mod_string

original_select = arg_dw.Describe("DataWindow.Table.Select")

mod_string = "DataWindow.Table.Select='" + original_select + arg_str + "'"

rc = arg_dw.Modify(mod_string)

IF rc = "" THEN
	arg_dw.Retrieve( )
ELSE
	MessageBox("오류", "Modify Failed:" + rc)
END IF


end subroutine

public subroutine wf_focus (datawindow arg_dw, string arg_str);//------- focus ---------
arg_dw.SetColumn(arg_str)
arg_dw.setfocus()
//-----------------------
end subroutine

public subroutine wf_syntaxfromsql (datawindow arg_dw, string arg_str);string ERRORS, presentation_str, dwsyntax_str

presentation_str = "style(type=grid)"

dwsyntax_str = SQLCA.SyntaxFromSQL(arg_str,presentation_str, ERRORS)

IF LenA(ERRORS) > 0 THEN
	MessageBox("오류","SyntaxFromSQL errors: " + ERRORS)
	RETURN
END IF

arg_dw.Create( dwsyntax_str, ERRORS)

IF LenA(ERRORS) > 0 THEN
   MessageBox("오류","Create errors: " + ERRORS)
	RETURN
END IF

arg_dw.SetTransObject(SQLCA)
arg_dw.retrieve()

end subroutine

public function boolean wf_update1 (datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
	commit;
	if (arg_str = "Y") or (arg_str = "y") then
	   MessageBox("확인", "저장되었습니다.")
	end if
	return true
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if

end function

public function boolean wf_update2 (datawindow arg_dw1, datawindow arg_dw2, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,true) = 1 then
	   commit;
		arg_dw1.resetupdate()
		if (arg_str = "Y") or (arg_str = "y") then
	      MessageBox("확인", "저장되었습니다.")
		end if	
		return true
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

public function boolean wf_update3 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,false) = 1 then
		if arg_dw3.update(true,true) = 1 then
	      commit;
			arg_dw1.resetupdate()
			arg_dw2.resetupdate()
			if (arg_str = "Y") or (arg_str = "y") then
	         MessageBox("확인", "저장되었습니다.")
			end if
			return true
		else
   	   rollback;
	      MessageBox("오류", "저장 실패!")
			return false
		end if
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

public function boolean wf_update4 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,false) = 1 then
		if arg_dw3.update(true,false) = 1 then
			if arg_dw4.update(true,true) = 1 then
	         commit;
			   arg_dw1.resetupdate()
			   arg_dw2.resetupdate()
				arg_dw3.resetupdate()
				if (arg_str = "Y") or (arg_str = "y") then
	            MessageBox("확인", "저장되었습니다.")
				end if
				return true
		   else
   	      rollback;
	         MessageBox("오류", "저장 실패!")
				return false
			end if	
		else
   	   rollback;
	      MessageBox("오류", "저장 실패!")
			return false
		end if
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")		
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

public function long wf_rowfocuschange (datawindow arg_dw, string arg_str);long CurRow

arg_dw.SelectRow(0, FALSE) // 모든 반전된것을 해제 
CurRow = arg_dw.GetRow()

if arg_str = 'Y' or  arg_str = 'y' then
   arg_dw.SelectRow(CurRow,NOT arg_dw.IsSelected(CurRow))
end if	

return CurRow
end function

public subroutine wf_mboxinfo (string arg_str);MessageBox("확인", arg_str,information!)



end subroutine

public subroutine wf_mboxwarn (string arg_str);MessageBox("오류", arg_str,Exclamation!)
end subroutine

public function boolean wf_update5 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,false) = 1 then
		if arg_dw3.update(true,false) = 1 then
			if arg_dw4.update(true,false) = 1 then
				if arg_dw5.update(true,true) = 1 then
	            commit;
			      arg_dw1.resetupdate()
			      arg_dw2.resetupdate()
				   arg_dw3.resetupdate()
					arg_dw4.resetupdate()
				   if (arg_str = "Y") or (arg_str = "y") then
	               MessageBox("확인", "저장되었습니다.")
				   end if
					return true
				else
   	         rollback;
	            MessageBox("오류", "저장 실패!")
					return false
			   end if					
		   else
   	      rollback;
	         MessageBox("오류", "저장 실패!")
				return false
			end if	
		else
   	   rollback;
	      MessageBox("오류", "저장 실패!")
			return false
		end if
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")		
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

public function boolean wf_update6 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, datawindow arg_dw6, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,false) = 1 then
		if arg_dw3.update(true,false) = 1 then
			if arg_dw4.update(true,false) = 1 then
				if arg_dw5.update(true,false) = 1 then
					if arg_dw6.update(true,true) = 1 then
	               commit;
			         arg_dw1.resetupdate()
			         arg_dw2.resetupdate()
				      arg_dw3.resetupdate()
					   arg_dw4.resetupdate()
						arg_dw5.resetupdate()
				      if (arg_str = "Y") or (arg_str = "y") then
	                  MessageBox("확인", "저장되었습니다.")
				      end if
					   return true
				   else
   	            rollback;
	               MessageBox("오류", "저장 실패!")
					   return false
			      end if						
				else
   	         rollback;
	            MessageBox("오류", "저장 실패!")
					return false
			   end if					
		   else
   	      rollback;
	         MessageBox("오류", "저장 실패!")
				return false
			end if	
		else
   	   rollback;
	      MessageBox("오류", "저장 실패!")
			return false
		end if
	else
	   rollback;
	   MessageBox("오류", "저장 실패!")		
		return false
	end if	
else
	rollback;
	MessageBox("오류", "저장 실패!")
	return false
end if


end function

public function long wf_retrieve (datawindow arg_dw, string arg_str);string rc
long ll_row

rc = arg_dw.Modify(arg_str)

IF rc = "" THEN
	arg_dw.reset()
	ll_row = arg_dw.Retrieve()
ELSE
	ll_row = -1
END IF

return ll_row
end function

public function datetime wf_today ();datetime ldt_date
select top 1 getdate() into :ldt_date from login;
return datetime(date(string(ldt_date,'yyyy/mm/dd')))
end function

public subroutine wf_filter (datawindow arg_dw, string arg_str);//-----Filtering---------
arg_dw.SetFilter(arg_str)
arg_dw.Filter( )
//-----------------------
end subroutine

public subroutine wf_filterdwc (datawindowchild arg_dw, string arg_str);//-----Filtering---------
arg_dw.SetFilter(arg_str)
arg_dw.Filter( )
//-----------------------
end subroutine

public function boolean wf_nullchk (datawindow arg_dw);long ll_cnt,ll_rowcount,ll_subcnt
string ls_table,ls_dbname,ls_columnname,ls_colcount,ls_name,ls_type,ls_coltype,ls_update
string ls_syscol,ls_comment,ls_str
datetime ldt_date,ldt_date1
real lr_status,lr_num
integer li_colcount,li_len,li_collen,li_len1

arg_dw.AcceptText()
//널체크
ll_rowcount = arg_dw.rowcount()
ls_colcount = arg_dw.Describe("DataWindow.Column.Count")
li_colcount = integer(ls_colcount)
ls_table = arg_dw.describe("DataWindow.Table.UpdateTable")
li_len = LenA(ls_table)
li_len = li_len + 2

for ll_cnt = 1 to li_colcount
	  ls_name = "#" + string(ll_cnt) + ".update"
     ls_update = arg_dw.Describe(ls_name)
     if upper(ls_update) = 'NO' then continue
	  
	  ls_name = "#" + string(ll_cnt) + ".Initial"
     ls_update = arg_dw.Describe(ls_name)
     if ls_update <> "null" then continue
     
     ls_name = "#" + string(ll_cnt) + ".TabSequence"
     ls_update = arg_dw.Describe(ls_name)
     if ls_update = '0' then continue

	  ls_name = "#" + string(ll_cnt) + ".visible"
     ls_update = arg_dw.Describe(ls_name)
     if ls_update = '0' then continue		  

	  ls_dbname = "#" + string(ll_cnt) + ".dbname"
	  ls_type = "#" + string(ll_cnt) + ".ColType"
	  ls_coltype    = arg_dw.Describe(ls_type)
	  ls_columnname = arg_dw.Describe(ls_dbname) 
	  li_collen = LenA(trim(ls_columnname))
	  ls_columnname = MidA(trim(ls_columnname),li_len,li_collen - li_len + 1)
	  
     SELECT syscolumns.name, syscolumns.status, pbcatcol.pbc_cmnt  
	         into :ls_syscol,:lr_status,:ls_comment
FROM syscolumns INNER JOIN systypes ON syscolumns.type = systypes.type
                                  INNER JOIN sysobjects ON systypes.uid = sysobjects.uid and syscolumns.id = sysobjects.id
                                  left outer join pbcatcol  on  sysobjects.name  = pbcatcol.pbc_tnam and syscolumns.name  = pbcatcol.pbc_cnam
     WHERE ( systypes.usertype <> 18 AND systypes.usertype < 100) AND  
                      sysobjects.name = :ls_table and
				              syscolumns.name = :ls_columnname;				
/*				
            FROM syscolumns, systypes, sysobjects, pbcatcol  
     WHERE ( sysobjects.name  *= pbcatcol.pbc_tnam) and  
           ( syscolumns.name  *= pbcatcol.pbc_cnam) and  
           ( syscolumns.type = systypes.type ) and  
           ( systypes.uid = sysobjects.uid ) and  
           ( syscolumns.id = sysobjects.id ) and  
           ( systypes.usertype <> 18 AND systypes.usertype < 100) AND  
             sysobjects.name = :ls_table and
				 syscolumns.name = :ls_columnname;
*/				 
	   			 
	  if sqlca.sqldbcode <> 0 then
		  continue
	  else
		  if trim(ls_comment) = "" or isnull(trim(ls_comment)) then
			  ls_comment = ls_syscol
		  else
			  li_len1 = LenA(trim(ls_comment)) 
			  ls_comment = LeftA(ls_comment,li_len1 + 3)
		  end if	  
        if lr_status = 0 or lr_status = 16 then
			  ls_name = "#" + string(ll_cnt) + ".name" 
			  ls_name = arg_dw.Describe(ls_name)
			  // --------------- 문자냐? -------------------
		     if LeftA(upper(ls_coltype),1) = 'C' or LeftA(upper(ls_coltype),1) = 'V' then
				  for ll_subcnt = 1 to ll_rowcount
					   ls_str = trim(arg_dw.getitemstring(ll_subcnt,ls_name))
						if ls_str = "" or isnull(ls_str) then
							messagebox('오류', string(ll_subcnt,'##0') + "번째 " + ls_comment + "이(가) 입력되지 않았읍니다.",exclamation!)
						   arg_dw.scrolltorow(ll_subcnt)
							arg_dw.setcolumn(ls_name)
							arg_dw.setfocus()
							return false
						end if
					next
				else
					ldt_date1 = datetime(date('1980/01/01'))
					//--------------- 날짜냐? ------------
               if trim(upper(ls_coltype)) = 'DATETIME' or trim(upper(ls_coltype)) = 'SMALLDATETIME' then
		            for ll_subcnt = 1 to ll_rowcount
			             ldt_date = arg_dw.getitemdatetime(ll_subcnt,ls_name)
							 if isnull(ldt_date) or ldt_date < ldt_date1 then
					          messagebox('오류', string(ll_subcnt,'##0') + "번째 " + ls_comment + "이(가) 입력되지 않았읍니다.",exclamation!)
				             arg_dw.scrolltorow(ll_subcnt)
					          arg_dw.setcolumn(ls_name)
					          arg_dw.setfocus()
					          return false
				          end if
			         next
					else  //--------- 숫자냐? -------------
		            for ll_subcnt = 1 to ll_rowcount
			             lr_num = arg_dw.getitemnumber(ll_subcnt,ls_name)
				          if isnull(lr_num) then
					          messagebox('오류', string(ll_subcnt,'##0') + "번째 " + ls_comment + "이(가) 입력되지 않았읍니다.",exclamation!)
				             arg_dw.scrolltorow(ll_subcnt)
					          arg_dw.setcolumn(ls_name)
					          arg_dw.setfocus()
					          return false
				          end if
			         next                     							
	            end if //------------------------------								
			  end if 
	     else
		     continue
	     end if
	  end if
next

return true
end function

public function long wf_retrievechild (datawindowchild arg_dw, string arg_str);string rc
long ll_row

rc = arg_dw.Modify(arg_str)

IF rc = "" THEN
	if arg_dw.Retrieve() < 1 then
		arg_dw.insertrow(0)
		ll_row = 0
	else
		ll_row = arg_dw.rowcount()
	end if
ELSE
	ll_row = -1
END IF

return ll_row

end function

on w_toisa_sawoo.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_save=create pb_save
this.dw_1=create dw_1
this.st_title=create st_title
this.st_tips=create st_tips
this.pb_close=create pb_close
this.pb_print=create pb_print
this.pb_retrieve=create pb_retrieve
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_2,&
this.rb_1,&
this.pb_save,&
this.dw_1,&
this.st_title,&
this.st_tips,&
this.pb_close,&
this.pb_print,&
this.pb_retrieve,&
this.gb_1,&
this.gb_2}
end on

on w_toisa_sawoo.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_save)
destroy(this.dw_1)
destroy(this.st_title)
destroy(this.st_tips)
destroy(this.pb_close)
destroy(this.pb_print)
destroy(this.pb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;this.x = 1
this.y = 1
dw_1.SetTransObject(SQLCA)

pb_save.enabled = false
end event

event mousemove;st_tips.visible = false


end event

type rb_2 from radiobutton within w_toisa_sawoo
integer x = 2592
integer y = 120
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "부서정렬"
boolean lefttext = true
end type

event clicked;dw_1.SetRedraw(false)	
dw_1.SetSort("dept_nm") 
dw_1.Sort()
dw_1.SetRedraw(true)	
end event

type rb_1 from radiobutton within w_toisa_sawoo
integer x = 3031
integer y = 120
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "이름정렬"
boolean lefttext = true
end type

event clicked;dw_1.SetRedraw(false)	
dw_1.SetSort("name_kor") 
dw_1.Sort()
dw_1.SetRedraw(true)	
end event

type pb_save from picturebutton within w_toisa_sawoo
event mousemove pbm_mousemove
integer x = 3726
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)
end event

event clicked;dw_1.accepttext( )

if wf_update1(dw_1, 'Y') = true then
	pb_retrieve.postevent(clicked!)
end if
end event

type dw_1 from datawindow within w_toisa_sawoo
event keydown pbm_dwnkey
integer x = 41
integer y = 240
integer width = 4302
integer height = 2016
integer taborder = 40
string dataobject = "d_toisa_sawoo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type st_title from statictext within w_toisa_sawoo
integer x = 27
integer y = 60
integer width = 1426
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "퇴직사우 근황"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_tips from statictext within w_toisa_sawoo
boolean visible = false
integer x = 192
integer y = 152
integer width = 242
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_close from picturebutton within w_toisa_sawoo
event mousemove pbm_mousemove
integer x = 4101
integer y = 52
integer width = 187
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"닫기",parent, li_x, li_y)
end event

event clicked;close(parent)
end event

type pb_print from picturebutton within w_toisa_sawoo
event mousemove pbm_mousemove
integer x = 3913
integer y = 52
integer width = 187
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"인쇄",parent, li_x, li_y)
end event

event clicked;w_repsuper w_print
st_print l_print

l_print.st_datawindow = dw_1
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc = " 이 프로그램은 로그를 출력합니다." 

// LANDSCAPE:1, PORTRAIT:2
// SIZE 9-A4, 12-B4

gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
                   'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 6, Original!)



end event

type pb_retrieve from picturebutton within w_toisa_sawoo
event mousemove pbm_mousemove
integer x = 3538
integer y = 52
integer width = 187
integer height = 144
integer taborder = 130
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)
end event

event clicked;dw_1.Retrieve()
end event

type gb_1 from groupbox within w_toisa_sawoo
integer x = 3502
integer y = 12
integer width = 814
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_2 from groupbox within w_toisa_sawoo
integer x = 2542
integer y = 28
integer width = 919
integer height = 180
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "정렬방식"
end type

