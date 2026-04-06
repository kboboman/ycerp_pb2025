$PBExportHeader$w_do_log.srw
$PBExportComments$로그
forward
global type w_do_log from window
end type
type rb_2 from radiobutton within w_do_log
end type
type rb_1 from radiobutton within w_do_log
end type
type pb_1 from picturebutton within w_do_log
end type
type gb_4 from groupbox within w_do_log
end type
type cb_16 from commandbutton within w_do_log
end type
type cb_15 from commandbutton within w_do_log
end type
type cb_14 from commandbutton within w_do_log
end type
type cb_10 from commandbutton within w_do_log
end type
type sle_value from singlelineedit within w_do_log
end type
type ddlb_op from dropdownlistbox within w_do_log
end type
type st_14 from statictext within w_do_log
end type
type ddlb_fld from dropdownlistbox within w_do_log
end type
type st_13 from statictext within w_do_log
end type
type gb_3 from groupbox within w_do_log
end type
type em_2 from editmask within w_do_log
end type
type st_3 from statictext within w_do_log
end type
type em_1 from editmask within w_do_log
end type
type dw_2 from datawindow within w_do_log
end type
type dw_1 from datawindow within w_do_log
end type
type st_title from statictext within w_do_log
end type
type st_tips from statictext within w_do_log
end type
type pb_close from picturebutton within w_do_log
end type
type pb_print from picturebutton within w_do_log
end type
type pb_retrieve from picturebutton within w_do_log
end type
type gb_1 from groupbox within w_do_log
end type
type gb_2 from groupbox within w_do_log
end type
end forward

global type w_do_log from window
integer x = 9
integer y = 12
integer width = 4695
integer height = 2896
boolean titlebar = true
string title = "출하내역 변경현황(w_do_log)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
gb_4 gb_4
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_10 cb_10
sle_value sle_value
ddlb_op ddlb_op
st_14 st_14
ddlb_fld ddlb_fld
st_13 st_13
gb_3 gb_3
em_2 em_2
st_3 st_3
em_1 em_1
dw_2 dw_2
dw_1 dw_1
st_title st_title
st_tips st_tips
pb_close pb_close
pb_print pb_print
pb_retrieve pb_retrieve
gb_1 gb_1
gb_2 gb_2
end type
global w_do_log w_do_log

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

on w_do_log.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.gb_4=create gb_4
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_10=create cb_10
this.sle_value=create sle_value
this.ddlb_op=create ddlb_op
this.st_14=create st_14
this.ddlb_fld=create ddlb_fld
this.st_13=create st_13
this.gb_3=create gb_3
this.em_2=create em_2
this.st_3=create st_3
this.em_1=create em_1
this.dw_2=create dw_2
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
this.pb_1,&
this.gb_4,&
this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_10,&
this.sle_value,&
this.ddlb_op,&
this.st_14,&
this.ddlb_fld,&
this.st_13,&
this.gb_3,&
this.em_2,&
this.st_3,&
this.em_1,&
this.dw_2,&
this.dw_1,&
this.st_title,&
this.st_tips,&
this.pb_close,&
this.pb_print,&
this.pb_retrieve,&
this.gb_1,&
this.gb_2}
end on

on w_do_log.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.gb_4)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_10)
destroy(this.sle_value)
destroy(this.ddlb_op)
destroy(this.st_14)
destroy(this.ddlb_fld)
destroy(this.st_13)
destroy(this.gb_3)
destroy(this.em_2)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_title)
destroy(this.st_tips)
destroy(this.pb_close)
destroy(this.pb_print)
destroy(this.pb_retrieve)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

dw_2.visible = false
em_1.text = string(today(), "yyyy/mm/dd")
em_2.text = string(today(), "yyyy/mm/dd")

dw_1.SetTransObject(SQLCA)


end event

event resize;//
gb_2.width  = this.width  - 105
gb_2.height = this.height - 472

dw_1.width  = this.width  - 165
dw_1.height = this.height - 540

end event

type rb_2 from radiobutton within w_do_log
integer x = 2533
integer y = 116
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "출고일자"
end type

type rb_1 from radiobutton within w_do_log
integer x = 2533
integer y = 52
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
string text = "작업일자"
boolean checked = true
end type

type pb_1 from picturebutton within w_do_log
integer x = 4210
integer y = 48
integer width = 187
integer height = 144
integer taborder = 120
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event clicked;//w_repsuper w_print
//st_print l_print
//
//l_print.st_datawindow = dw_2
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc = " 이 프로그램은 로그를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//
//gs_print_control = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 ' + &
//                   'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 2, Original!)


string ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value

if dw_1.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File",  & 
		ls_Docname, ls_Named, "XLS",  &
		"엑셀 (*.XLS), *.XLS," + &
		"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dw_1.SaveAsascii(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
						dw_1.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
end if	

end event

type gb_4 from groupbox within w_do_log
integer x = 2482
integer y = 8
integer width = 1298
integer height = 204
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

type cb_16 from commandbutton within w_do_log
integer x = 2299
integer y = 264
integer width = 146
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "내림"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "작업일자"
		ls_col  = "log_date"
	case "NO"
		ls_col  = "log_seq"
	case "작업자ID"
		ls_col  = "gs_userid"
	case "작업자명"
		ls_col  = "gs_username"
	case "작업내역"
		ls_col  = "do_jobdesc"
	case "출하번호"
		ls_col  = "do_no"
	case "거래처명"
		ls_col  = "cust_nm"
	case "현장명"
		ls_col  = "spot_nm"
		
	case "출하자ID"
		ls_col  = "user_id"
	case "출하자명"
		ls_col  = "user_name"
	case "출하지역"
		ls_col  = "do_area_no"
	case "미수구분"
		ls_col  = "do_case"
	case "출고일자"
		ls_col  = "do_date"
	case "실출고일자"
		ls_col  = "issue_date"
	case "운송방법"
		ls_col  = "ship_flag"
	case "운반비"
		ls_col  = "ship_amount"
	case "공급가"
		ls_col  = "do_cash"
	case "부가세"
		ls_col  = "do_rate"
	case "합계"
		ls_col  = "do_total"
end choose

dw_1.SetSort(ls_col + " D")
dw_1.sort()

end event

type cb_15 from commandbutton within w_do_log
integer x = 2153
integer y = 264
integer width = 146
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "오름"
end type

event clicked;//
string ls_col
choose case trim(ddlb_fld.text)
	case "작업일자"
		ls_col  = "log_date"
	case "NO"
		ls_col  = "log_seq"
	case "작업자ID"
		ls_col  = "gs_userid"
	case "작업자명"
		ls_col  = "gs_username"
	case "작업내역"
		ls_col  = "do_jobdesc"
	case "출하번호"
		ls_col  = "do_no"
	case "거래처명"
		ls_col  = "cust_nm"
	case "현장명"
		ls_col  = "spot_nm"
		
	case "출하자ID"
		ls_col  = "user_id"
	case "출하자명"
		ls_col  = "user_name"
	case "출하지역"
		ls_col  = "do_area_no"
	case "미수구분"
		ls_col  = "do_case"
	case "출고일자"
		ls_col  = "do_date"
	case "실출고일자"
		ls_col  = "issue_date"
	case "운송방법"
		ls_col  = "ship_flag"
	case "운반비"
		ls_col  = "ship_amount"
	case "공급가"
		ls_col  = "do_cash"
	case "부가세"
		ls_col  = "do_rate"
	case "합계"
		ls_col  = "do_total"
end choose

dw_1.SetSort(ls_col + " A")
dw_1.sort()

end event

type cb_14 from commandbutton within w_do_log
integer x = 2002
integer y = 264
integer width = 146
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "해지"
end type

event clicked;//
ddlb_fld.text  = "물품명"
ddlb_op.text   = "LIKE"
sle_value.text = ""

dw_1.setfilter("")
dw_1.filter()
pb_retrieve.postevent(clicked!)
dw_1.scrolltorow(1)

end event

type cb_10 from commandbutton within w_do_log
integer x = 1851
integer y = 264
integer width = 146
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;string ls_custnm, ls_column, ls_value, ls_temp

ls_temp = ""
if dw_1.FilteredCount() > 0 THEN
	dw_1.setfilter(ls_temp)
	dw_1.filter()
end if

// 필드
if trim(ddlb_fld.text) = "" then
	ls_column = ""
else
	string ls_col
	choose case trim(ddlb_fld.text)
		case "작업일자"
			ls_col  = "log_date"
		case "NO"
			ls_col  = "log_seq"
		case "작업자ID"
			ls_col  = "gs_userid"
		case "작업자명"
			ls_col  = "gs_username"
		case "작업내역"
			ls_col  = "do_jobdesc"
		case "출하번호"
			ls_col  = "do_no"
		case "거래처명"
			ls_col  = "cust_nm"
		case "현장명"
			ls_col  = "spot_nm"
			
		case "출하자ID"
			ls_col  = "user_id"
		case "출하자명"
			ls_col  = "user_name"
		case "출하지역"
			ls_col  = "do_area_no"
		case "미수구분"
			ls_col  = "do_case"
		case "출고일자"
			ls_col  = "do_date"
		case "실출고일자"
			ls_col  = "issue_date"
		case "운송방법"
			ls_col  = "ship_flag"
		case "운반비"
			ls_col  = "ship_amount"
		case "공급가"
			ls_col  = "do_cash"
		case "부가세"
			ls_col  = "do_rate"
		case "합계"
			ls_col  = "do_total"
	end choose
	
	ls_col = ls_col + " "
	if trim(ddlb_op.text) = "LIKE" then
		ls_column = ls_col + trim(ddlb_op.text) + " '%" + trim(sle_value.text) + "%' "
	else
		choose case ls_col
		//	case "due_date"
		//		ls_column = ls_col + trim(ddlb_op.text) + "datetime('" + trim(sle_value.text) + "') "
			case "log_seq", "ship_amount", "do_cash", "do_rate", "do_total"
				ls_column = ls_col + trim(ddlb_op.text) + " "  + trim(sle_value.text) + " "
			case else
				ls_column = ls_col + trim(ddlb_op.text) + " '" + trim(sle_value.text) + "' "
		end choose 
	end if
end if

if ls_column = "" then
	ls_temp = ls_column
else
	ls_temp = "(" + ls_column + ")"
end if

if ls_value <> "" then
	if ls_temp = "" then
		ls_temp = ls_value
	else
		ls_temp = "(" + ls_temp + ") AND (" + trim(ls_value) + ")"
	end if
end if

dw_1.setfilter(ls_temp)
dw_1.filter()

dw_1.scrolltorow(1)


end event

type sle_value from singlelineedit within w_do_log
integer x = 1138
integer y = 264
integer width = 704
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type ddlb_op from dropdownlistbox within w_do_log
integer x = 846
integer y = 264
integer width = 279
integer height = 512
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"",">",">=","<","<=","<>","=","LIKE"}
end type

type st_14 from statictext within w_do_log
integer x = 677
integer y = 280
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

type ddlb_fld from dropdownlistbox within w_do_log
integer x = 256
integer y = 264
integer width = 402
integer height = 532
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"작업일자","NO","작업자ID","작업자명","작업내역","출하번호","거래처명","현장명","출하자ID","출하자명","출하지역","미수구분","출고일자","실출고일자","운송방법","운반비","공급가","부가세","합계"}
end type

type st_13 from statictext within w_do_log
integer x = 82
integer y = 280
integer width = 160
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
string text = "필드: "
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_do_log
integer x = 32
integer y = 216
integer width = 4590
integer height = 144
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

type em_2 from editmask within w_do_log
integer x = 3374
integer y = 80
integer width = 361
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type st_3 from statictext within w_do_log
integer x = 3323
integer y = 96
integer width = 46
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "~~"
boolean focusrectangle = false
end type

type em_1 from editmask within w_do_log
integer x = 2958
integer y = 80
integer width = 361
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

type dw_2 from datawindow within w_do_log
integer x = 1399
integer y = 68
integer width = 142
integer height = 116
integer taborder = 40
string title = "d_acc_log_p"
boolean livescroll = true
end type

type dw_1 from datawindow within w_do_log
integer x = 59
integer y = 388
integer width = 4530
integer height = 2356
integer taborder = 120
string title = "none"
string dataobject = "d_do_log"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

// 
string ls_col, ls_text

choose case dwo.name
	case "log_date"
		ls_col  = "작업일자"
		ls_text = string(this.object.log_date[row])
	case "log_seq"
		ls_col  = "NO"
		ls_text = string(this.object.log_seq[row])
	case "gs_userid"
		ls_col  = "작업자ID"
		ls_text = string(this.object.gs_userid[row])
	case "gs_username"
		ls_col  = "작업자명"
		ls_text = string(this.object.gs_username[row])
	case "do_jobdesc"
		ls_col  = "작업내역"
		ls_text = string(this.object.do_jobdesc[row])
	case "do_no"
		ls_col  = "출하번호"
		ls_text = string(this.object.do_no[row])
	case "cust_nm"
		ls_col  = "거래처명"
		ls_text = string(this.object.cust_nm[row])
	case "spot_nm"
		ls_col  = "현장명"
		ls_text = string(this.object.spot_nm[row])
		
	case "user_id"
		ls_col  = "출하자ID"
		ls_text = string(this.object.user_id[row])
	case "user_name"
		ls_col  = "출하자명"
		ls_text = string(this.object.user_name[row])
	case "do_area_no"
		ls_col  = "출하지역"
		ls_text = string(this.object.do_area_no[row])
	case "do_case"
		ls_col  = "미수구분"
		ls_text = string(this.object.do_case[row])
	case "do_date"
		ls_col  = "출고일자"
		ls_text = string(this.object.do_date[row])
	case "issue_date"
		ls_col  = "실출고일자"
		ls_text = string(this.object.issue_date[row])
	case "ship_flag"
		ls_col  = "운송방법"
		ls_text = string(this.object.ship_flag[row])
	case "ship_amount"
		ls_col  = "운반비"
		ls_text = string(this.object.ship_amount[row])
	case "do_cash"
		ls_col  = "공급가"
		ls_text = string(this.object.do_cash[row])
	case "do_rate"
		ls_col  = "부가세"
		ls_text = string(this.object.do_rate[row])
	case "do_total"
		ls_col  = "합계"
		ls_text = string(this.object.do_total[row])
end choose

choose case ls_col
	case "납기일자", "발주수량", "입고수량", "미입고수량"
		ddlb_op.text = "="
	case else
		ddlb_op.text = "LIKE"
end choose

ddlb_fld.text  = ls_col
sle_value.text = ls_text

end event

type st_title from statictext within w_do_log
integer x = 27
integer y = 60
integer width = 1289
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
string text = "출하내역 변경현황"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type st_tips from statictext within w_do_log
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

type pb_close from picturebutton within w_do_log
event mousemove pbm_mousemove
integer x = 4402
integer y = 48
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

f_usetips(st_tips,"종료",parent, li_x, li_y)

end event

event clicked;close(parent)
end event

type pb_print from picturebutton within w_do_log
event mousemove pbm_mousemove
integer x = 4023
integer y = 48
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

type pb_retrieve from picturebutton within w_do_log
event mousemove pbm_mousemove
integer x = 3831
integer y = 48
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

event clicked;date ld_stdate, ld_eddate
long ll_cnt
string ls_flag

ld_stdate = date(em_1.text)
ld_eddate = date(em_2.text)
if rb_1.checked = true then
	ls_flag = "A"
else
	ls_flag = "B"
end if

ll_cnt = dw_1.retrieve( ls_flag, ld_stdate, ld_eddate )
if ll_cnt > 0 then 
	ll_cnt /= 2
else 
	ll_cnt = 0
end if


end event

type gb_1 from groupbox within w_do_log
integer x = 3799
integer y = 8
integer width = 823
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

type gb_2 from groupbox within w_do_log
integer x = 32
integer y = 344
integer width = 4590
integer height = 2424
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 67108864
end type

