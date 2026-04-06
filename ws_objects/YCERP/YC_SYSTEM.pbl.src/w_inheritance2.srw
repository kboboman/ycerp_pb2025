$PBExportHeader$w_inheritance2.srw
$PBExportComments$상속윈도우(2020/06/09,김보길)
forward
global type w_inheritance2 from window
end type
type pb_saveas from picturebutton within w_inheritance2
end type
type pb_save from picturebutton within w_inheritance2
end type
type dw_1 from u_datawindow within w_inheritance2
end type
type st_title from statictext within w_inheritance2
end type
type st_tips from statictext within w_inheritance2
end type
type pb_compute from picturebutton within w_inheritance2
end type
type pb_print_part from picturebutton within w_inheritance2
end type
type pb_close from picturebutton within w_inheritance2
end type
type pb_print from picturebutton within w_inheritance2
end type
type pb_cancel from picturebutton within w_inheritance2
end type
type pb_delete from picturebutton within w_inheritance2
end type
type pb_insert from picturebutton within w_inheritance2
end type
type pb_retrieve from picturebutton within w_inheritance2
end type
type gb_3 from groupbox within w_inheritance2
end type
type gb_2 from groupbox within w_inheritance2
end type
type gb_1 from groupbox within w_inheritance2
end type
type dw_2 from u_datawindow within w_inheritance2
end type
end forward

global type w_inheritance2 from window
integer x = 9
integer y = 12
integer width = 3547
integer height = 2288
boolean titlebar = true
string title = "상속"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
event we_postopen ( )
event type integer we_retrieve ( )
event type integer we_delete ( )
event type integer we_insert ( )
event type integer we_compute ( )
event type integer we_cancel ( )
event type integer we_print ( )
event type integer we_print_part ( )
event type integer we_save ( )
event type integer we_saveas ( )
pb_saveas pb_saveas
pb_save pb_save
dw_1 dw_1
st_title st_title
st_tips st_tips
pb_compute pb_compute
pb_print_part pb_print_part
pb_close pb_close
pb_print pb_print
pb_cancel pb_cancel
pb_delete pb_delete
pb_insert pb_insert
pb_retrieve pb_retrieve
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_2 dw_2
end type
global w_inheritance2 w_inheritance2

type variables
u_datawindow	idw_focus
end variables

forward prototypes
public function long wf_insertrow (u_datawindow arg_dw)
public function long wf_modifycount (u_datawindow arg_dw)
public subroutine wf_sort (u_datawindow arg_dw, string arg_str)
public subroutine wf_modifyselect (u_datawindow arg_dw, string arg_str)
public subroutine wf_focus (u_datawindow arg_dw, string arg_str)
public subroutine wf_syntaxfromsql (u_datawindow arg_dw, string arg_str)
public function boolean wf_update1 (u_datawindow arg_dw1, string arg_str)
public function boolean wf_update2 (u_datawindow arg_dw1, u_datawindow arg_dw2, string arg_str)
public function boolean wf_update3 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, string arg_str)
public function boolean wf_update4 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, string arg_str)
public function long wf_rowfocuschange (u_datawindow arg_dw, string arg_str)
public subroutine wf_mboxinfo (string arg_str)
public subroutine wf_mboxwarn (string arg_str)
public function boolean wf_update5 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, u_datawindow arg_dw5, string arg_str)
public function boolean wf_update6 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, u_datawindow arg_dw5, u_datawindow arg_dw6, string arg_str)
public function long wf_retrieve (u_datawindow arg_dw, string arg_str)
public function datetime wf_today ()
public subroutine wf_filter (u_datawindow arg_dw, string arg_str)
public subroutine wf_filterdwc (datawindowchild arg_dw, string arg_str)
public function boolean wf_nullchk (u_datawindow arg_dw)
public function long wf_retrievechild (datawindowchild arg_dw, string arg_str)
public subroutine wf_setfocusdw (u_datawindow adw_obj)
public function integer wf_update_array (u_datawindow adw_upt[])
public function integer wf_updateerr (u_datawindow adw_dw, string as_message)
public function integer wf_uptmodifycheckdw (u_datawindow adw_data)
public function integer wf_set_dddw ()
end prototypes

event we_postopen();if GE_Environment.ScreenWidth <= 1152 then 
	this.HScrollBar = true
	this.VScrollBar = true
end if

dw_1.SetTransObject(SQLCA)
dw_2.SetTransObject(SQLCA)

end event

event type integer we_retrieve();return 1
end event

event type integer we_delete();If IsValid(idw_focus) Then
	Long	ll_delrow, ll_rowcnt
	idw_focus.AcceptText()
	ll_delrow	= idw_focus.getrow()
	If idw_focus.DeleteRow(0) < 1 Then Return -1
	ll_rowcnt	= idw_focus.rowcount()
	idw_focus.SetFocus( )
	If idw_focus.rowcount() > 0 Then
		If ll_delrow < ll_rowcnt Then
			idw_focus.Event RowFocusChanged(ll_delrow)
		Else
			idw_focus.Event RowFocusChanged(ll_rowcnt)
		End If
	End If	
End If

Return 1
end event

event type integer we_insert();If IsValid(idw_focus) Then
	Long		ll_row
	ll_row = idw_focus.InsertRow(0)
	idw_focus.ScrollToRow(ll_row)
	idw_focus.Post SetFocus()
End If

return 1

end event

event we_compute;return 1
end event

event type integer we_cancel();return 1
end event

event type integer we_print();return 1
end event

event type integer we_print_part();return 1
end event

event type integer we_save();//사용법
//Long	ll_rtn
//ll_rtn = wf_update_array({dw_1, dw_2})
//If ll_rtn = 1 Then Messagebox('Check', '저장이 정상적으로 진행되었습니다')
Return 1

end event

event type integer we_saveas();return 1
end event

public function long wf_insertrow (u_datawindow arg_dw);long ll_Row

ll_Row = arg_dw.InsertRow(0) 
arg_dw.ScrollToRow(ll_Row)

Return ll_Row


end function

public function long wf_modifycount (u_datawindow arg_dw);//argment : arg_dw  type : datawindow  return_value : long
long ll_cnt

ll_cnt = arg_dw.ModifiedCount( ) + arg_dw.DeletedCount( )

RETURN ll_cnt

end function

public subroutine wf_sort (u_datawindow arg_dw, string arg_str);//------ sort ---------
arg_dw.SetSort(arg_str)
arg_dw.Sort( )
//---------------------
end subroutine

public subroutine wf_modifyselect (u_datawindow arg_dw, string arg_str);string original_select, rc, mod_string

original_select = arg_dw.Describe("DataWindow.Table.Select")

mod_string = "DataWindow.Table.Select='" + original_select + arg_str + "'"

rc = arg_dw.Modify(mod_string)

IF rc = "" THEN
	arg_dw.Retrieve( )
ELSE
	MessageBox("오류", "Modify Failed:" + rc)
END IF


end subroutine

public subroutine wf_focus (u_datawindow arg_dw, string arg_str);//------- focus ---------
arg_dw.SetColumn(arg_str)
arg_dw.setfocus()
//-----------------------
end subroutine

public subroutine wf_syntaxfromsql (u_datawindow arg_dw, string arg_str);string ERRORS, presentation_str, dwsyntax_str

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

public function boolean wf_update1 (u_datawindow arg_dw1, string arg_str);if arg_dw1.update() = 1 then
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

public function boolean wf_update2 (u_datawindow arg_dw1, u_datawindow arg_dw2, string arg_str);if arg_dw1.update(true,false) = 1 then
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

public function boolean wf_update3 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, string arg_str);if arg_dw1.update(true,false) = 1 then
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

public function boolean wf_update4 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, string arg_str);if arg_dw1.update(true,false) = 1 then
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

public function long wf_rowfocuschange (u_datawindow arg_dw, string arg_str);long CurRow

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

public function boolean wf_update5 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, u_datawindow arg_dw5, string arg_str);if arg_dw1.update(true,false) = 1 then
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

public function boolean wf_update6 (u_datawindow arg_dw1, u_datawindow arg_dw2, u_datawindow arg_dw3, u_datawindow arg_dw4, u_datawindow arg_dw5, u_datawindow arg_dw6, string arg_str);if arg_dw1.update(true,false) = 1 then
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

public function long wf_retrieve (u_datawindow arg_dw, string arg_str);string rc
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
select top 1 getdate() into :ldt_date from dual;
return datetime(date(string(ldt_date,'yyyy/mm/dd')))
end function

public subroutine wf_filter (u_datawindow arg_dw, string arg_str);//-----Filtering---------
arg_dw.SetFilter(arg_str)
arg_dw.Filter( )
//-----------------------
end subroutine

public subroutine wf_filterdwc (datawindowchild arg_dw, string arg_str);//-----Filtering---------
arg_dw.SetFilter(arg_str)
arg_dw.Filter( )
//-----------------------
end subroutine

public function boolean wf_nullchk (u_datawindow arg_dw);long ll_cnt,ll_rowcount,ll_subcnt
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

/*
     SELECT syscolumns.name, syscolumns.status, pbcatcol.pbc_cmnt  
	         into :ls_syscol,:lr_status,:ls_comment
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

SELECT syscolumns.name, syscolumns.status, pbcatcol.pbc_cmnt  
	   into :ls_syscol,:lr_status,:ls_comment
    FROM syscolumns inner join systypes on syscolumns.type = systypes.type
                                     inner join sysobjects on systypes.uid = sysobjects.uid and  syscolumns.id = sysobjects.id
                                     left outer join pbcatcol on sysobjects.name = pbcatcol.pbc_tnam and syscolumns.name  = pbcatcol.pbc_cnam
     WHERE ( systypes.usertype <> 18 AND systypes.usertype < 100) AND  
		             sysobjects.name = :ls_table and
				   syscolumns.name = :ls_columnname;
					
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

public subroutine wf_setfocusdw (u_datawindow adw_obj);If IsValid(idw_focus) Then
	String		ls_u_dwnm, ls_a_dwnm
	ls_u_dwnm	= idw_focus.classname()
	ls_a_dwnm	= adw_obj.classname()
	If ls_u_dwnm <> ls_a_dwnm Then
		idw_focus = adw_obj
	End If
Else
	idw_focus = adw_obj
End If
end subroutine

public function integer wf_update_array (u_datawindow adw_upt[]);Long		ll_cnt, ll_ii, ll_sii

ll_cnt = UpperBound(adw_upt)
For ll_ii= 1 To ll_cnt
	adw_upt[ll_ii].AcceptText()
	IF adw_upt[ll_ii].Event we_esscheckbyupdate() < 1 THEN
		Return -1
	End If	
Next
For ll_ii= 1 To ll_cnt
	adw_upt[ll_ii].SetTransObject( sqlca )
	
	IF adw_upt[ll_ii].Update(True, False) < 1 THEN
		wf_updateerr(adw_upt[ll_ii], 'DataWindow' + string(ll_ii) + '번째 Update Error')
		Return -1	
	End If	
Next

Commit Using sqlca;

For ll_ii= 1 To ll_cnt
	adw_upt[ll_ii].ResetUpdate()
Next

Return 1
end function

public function integer wf_updateerr (u_datawindow adw_dw, string as_message);String		ls_SqlErrText

//If adw_dw.TriggerEvent('we_isframecontrol') = 1 Then
//	ls_SqlErrText = adw_dw.dynamic wf_getsqlerrmsg()
//Else
//	ls_SqlErrText = 'Update Error'
//End If

Rollback Using sqlca;
//If adw_dw.dynamic eaf_getupdatestart() = 0 Then MessageBox(as_message, ls_SqlErrText, StopSign!)
//MessageBox(as_message, ls_SqlErrText, StopSign!)
MessageBox("확인", as_message, StopSign!)

Return 1

end function

public function integer wf_uptmodifycheckdw (u_datawindow adw_data);integer	li_ChangedCnt = 0
integer	li_rtn

IF Not IsValid(adw_data) THEN
	MessageBox("Error", "Not Exists DataWindow")
	Return -1
END IF

adw_data.AcceptText()
li_ChangedCnt = li_ChangedCnt + adw_data.ModifiedCount() + adw_data.DeletedCount()

IF li_ChangedCnt > 0 THEN
	li_rtn = MessageBox("확인", "변경사항을 저장하시겠습니까 ?", Exclamation!, OKCancel!, 1)
Else
	Return 0
End If

If li_rtn = 1 Then This.Event we_save()

Return 1
end function

public function integer wf_set_dddw ();return 1
end function

on w_inheritance2.create
this.pb_saveas=create pb_saveas
this.pb_save=create pb_save
this.dw_1=create dw_1
this.st_title=create st_title
this.st_tips=create st_tips
this.pb_compute=create pb_compute
this.pb_print_part=create pb_print_part
this.pb_close=create pb_close
this.pb_print=create pb_print
this.pb_cancel=create pb_cancel
this.pb_delete=create pb_delete
this.pb_insert=create pb_insert
this.pb_retrieve=create pb_retrieve
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_2=create dw_2
this.Control[]={this.pb_saveas,&
this.pb_save,&
this.dw_1,&
this.st_title,&
this.st_tips,&
this.pb_compute,&
this.pb_print_part,&
this.pb_close,&
this.pb_print,&
this.pb_cancel,&
this.pb_delete,&
this.pb_insert,&
this.pb_retrieve,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.dw_2}
end on

on w_inheritance2.destroy
destroy(this.pb_saveas)
destroy(this.pb_save)
destroy(this.dw_1)
destroy(this.st_title)
destroy(this.st_tips)
destroy(this.pb_compute)
destroy(this.pb_print_part)
destroy(this.pb_close)
destroy(this.pb_print)
destroy(this.pb_cancel)
destroy(this.pb_delete)
destroy(this.pb_insert)
destroy(this.pb_retrieve)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_2)
end on

event open;This.PostEvent("we_postopen")
end event

event mousemove;st_tips.visible = false
end event

event closequery;string	ls_update, ls_msg

select 
	isnull(item_cd,'V00.0000')  
into 
	:ls_update
from 
	codemst 
where 
	type = 'ERP_VERSION'
and 
	use_yn  = 'Y'
using sqlca;

if ls_update <> gs_ver then
	ls_msg	= "새로 배포된 소스가 있습니다.~r~n바탕화면의 아이콘으로~r~n재 로그인 후 사용하세요."
	MessageBox("확인", ls_msg)
end if
end event

type pb_saveas from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 2880
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_saveas")
end event

type pb_save from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 3072
integer y = 52
integer width = 187
integer height = 144
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\save.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_save")
end event

type dw_1 from u_datawindow within w_inheritance2
event keydown pbm_dwnkey
integer x = 64
integer y = 288
integer width = 795
integer height = 1736
integer taborder = 40
boolean hscrollbar = true
boolean vscrollbar = true
end type

type st_title from statictext within w_inheritance2
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
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_tips from statictext within w_inheritance2
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

type pb_compute from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 1536
integer y = 52
integer width = 187
integer height = 144
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\computr3.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"계산",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_compute")
end event

type pb_print_part from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 2688
integer y = 52
integer width = 187
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\printer.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"부분인쇄",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_print_part")
end event

type pb_close from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 3264
integer y = 52
integer width = 187
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\exit.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"닫기",parent, li_x, li_y)

end event

event clicked;Close(Parent)
end event

type pb_print from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 2496
integer y = 52
integer width = 187
integer height = 144
integer taborder = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\print.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"인쇄",parent, li_x, li_y)


end event

event clicked;Parent.PostEvent("we_print")
end event

type pb_cancel from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 2304
integer y = 52
integer width = 187
integer height = 144
integer taborder = 110
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\cancel.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"취소",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_cancel")
end event

type pb_delete from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 2112
integer y = 52
integer width = 187
integer height = 144
integer taborder = 120
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"삭제",parent, li_x, li_y)


end event

event clicked;Parent.PostEvent("we_delete")
end event

type pb_insert from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 1920
integer y = 52
integer width = 187
integer height = 144
integer taborder = 140
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\pencil.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"추가",parent, li_x, li_y)
end event

event clicked;Parent.PostEvent("we_insert")
end event

type pb_retrieve from picturebutton within w_inheritance2
event mousemove pbm_mousemove
integer x = 1728
integer y = 52
integer width = 187
integer height = 144
integer taborder = 130
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "c:\bmp\retrieve.bmp"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"조회",parent, li_x, li_y)

end event

event clicked;Parent.PostEvent("we_retrieve")

end event

type gb_3 from groupbox within w_inheritance2
integer x = 901
integer y = 228
integer width = 2578
integer height = 1824
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_2 from groupbox within w_inheritance2
integer x = 32
integer y = 228
integer width = 855
integer height = 1824
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_1 from groupbox within w_inheritance2
integer x = 1513
integer y = 12
integer width = 1966
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

type dw_2 from u_datawindow within w_inheritance2
event keydown pbm_dwnkey
integer x = 937
integer y = 292
integer width = 2514
integer height = 1732
integer taborder = 50
boolean bringtotop = true
boolean vscrollbar = true
end type

