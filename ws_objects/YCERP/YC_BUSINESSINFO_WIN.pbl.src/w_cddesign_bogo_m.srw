$PBExportHeader$w_cddesign_bogo_m.srw
$PBExportComments$설계사현황보고등록(2020/04/15- 조원석)
forward
global type w_cddesign_bogo_m from w_inheritance
end type
type tab_1 from tab within w_cddesign_bogo_m
end type
type tabpage_1 from userobject within tab_1
end type
type p_1 from picture within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
p_1 p_1
dw_5 dw_5
end type
type tabpage_2 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type dw_7 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_8 dw_8
dw_6 dw_6
dw_7 dw_7
end type
type tabpage_3 from userobject within tab_1
end type
type dw_10 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_10 dw_10
end type
type tabpage_4 from userobject within tab_1
end type
type dw_11 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_11 dw_11
end type
type tabpage_5 from userobject within tab_1
end type
type dw_12 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_12 dw_12
end type
type tab_1 from tab within w_cddesign_bogo_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type st_4 from statictext within w_cddesign_bogo_m
end type
type ddlb_fld from dropdownlistbox within w_cddesign_bogo_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cddesign_bogo_m
end type
type st_5 from statictext within w_cddesign_bogo_m
end type
type sle_value from singlelineedit within w_cddesign_bogo_m
end type
type cb_3 from commandbutton within w_cddesign_bogo_m
end type
type cb_4 from commandbutton within w_cddesign_bogo_m
end type
type cb_5 from commandbutton within w_cddesign_bogo_m
end type
type cb_6 from commandbutton within w_cddesign_bogo_m
end type
type pb_1 from picturebutton within w_cddesign_bogo_m
end type
type st_vertical from u_splitbar_vertical within w_cddesign_bogo_m
end type
type st_horizontal from u_splitbar_horizontal within w_cddesign_bogo_m
end type
type ddlb_op from dropdownlistbox within w_cddesign_bogo_m
end type
type pb_photo_insert from picturebutton within w_cddesign_bogo_m
end type
type pb_photo_delete from picturebutton within w_cddesign_bogo_m
end type
type st_6 from statictext within w_cddesign_bogo_m
end type
type cbx_picture_check from checkbox within w_cddesign_bogo_m
end type
type rb_1 from radiobutton within w_cddesign_bogo_m
end type
type rb_2 from radiobutton within w_cddesign_bogo_m
end type
type rb_3 from radiobutton within w_cddesign_bogo_m
end type
end forward

global type w_cddesign_bogo_m from w_inheritance
integer width = 9390
integer height = 5632
string title = "설계사관리(w_cddesign_bogo_m)"
long backcolor = 79219928
tab_1 tab_1
st_4 st_4
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_5 st_5
sle_value sle_value
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
pb_1 pb_1
st_vertical st_vertical
st_horizontal st_horizontal
ddlb_op ddlb_op
pb_photo_insert pb_photo_insert
pb_photo_delete pb_photo_delete
st_6 st_6
cbx_picture_check cbx_picture_check
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
end type
global w_cddesign_bogo_m w_cddesign_bogo_m

type variables
gs_item ist_item
string  is_dw, is_dw1sql, is_dw3sql, is_project_code, is_code
string  is_chk = "1", is_chk2 = "1", is_gubun = '03'
integer  i_tabpage

string is_file, is_path, is_files[]
long   il_maxHeight, il_maxWidth, i_personal_id
end variables

forward prototypes
public subroutine wf_images_save ()
public subroutine wf_images_resize (picture arg_pic1)
public subroutine gf_qrcode_create (string ls_data, string ls_qrcode_name)
end prototypes

public subroutine wf_images_save ();//
Blob     blob_file,   blob_totalfile,  blob_null
int      li_FileNum,  li_FileFP,  li_loops, i, l_count = 0
long     ll_row, ll_find, ll_FileLength, ll_fp = 32765
String   ls_orderno, ls_filename, ls_filenames[]

SetPointer(HourGlass!)


if UpperBound(is_files) > 0 then
	// 1. Delete a old data.
	
	for ll_row =  1 to UpperBound(is_files)
		
		ls_filename = is_files[ll_row]
		
		// 1. Delete a old data.
	   select count(*) 
		  into :l_count
		from msale_project
		WHERE project_code = :is_project_code;
			
		if l_count = 0 then
			Messagebox("확인","프로젝트코드를 먼저 불러오신 후, 사진을 업로드하세요.")
			RETURN
		end if
					
		
		// 3. Check file size; if ll_fp > 32765 then looping.          *** 핵심 Key 인 듯
		ll_FileLength = FileLength(ls_filename)	
		li_FileNum    = FileOpen(ls_filename, StreamMode!)
		if li_FileNum = -1 then
			FileClose( li_FileNum )
			RETURN
		end if  
		
		if ll_FileLength > ll_fp then
			if Mod(ll_FileLength, ll_fp) = 0 then
				li_loops = ll_FileLength / ll_fp
			else
				li_loops = (ll_FileLength / ll_fp) + 1
			end if
		else
			li_loops = 1
		end if
		
		// 4. Read target file
//		setnull(blob_null)
		
		blob_totalfile = blob_null ; 
		blob_file = blob_null;
	
		for i = 1 to li_loops
			li_FileFP      = FileRead(li_FileNum, blob_file)
			blob_totalfile = blob_totalfile + blob_file
		next	
		FileClose(li_FileNum)
		
		// 5.Update for blob data. //
		SQLCA.AutoCommit = True
		
		UPDATEBlob msale_project
			SET photo = :blob_totalfile
		 WHERE project_code = :is_project_code;
		 
		if SQLCA.SQLNRows > 0 then
		  COMMIT;
		end if
		SQLCA.AutoCommit = False
		
	next	
	
end if

end subroutine

public subroutine wf_images_resize (picture arg_pic1);// WF_Images_Resize( 원본:arg_pic2, 리사이징:arg_pic1 )
// 원본 리사이징 하기 
long    ll_orgWidth, ll_orgHeight,  ll_resizeWidth, ll_resizeHeight
decimal ld_basisRatio, ld_imgRatio

ll_orgWidth   = UnitsToPixels(arg_pic1.width,  XUnitsToPixels!)
ll_orgHeight  = UnitsToPixels(arg_pic1.height, YUnitsToPixels!)

ld_imgRatio   = ll_orgHeight / ll_orgWidth
ld_basisRatio = il_maxHeight / il_maxWidth

if ld_imgRatio < ld_basisRatio then
	// Width가 기준 비율보다 길다.  
	if ll_orgWidth > il_maxWidth then
		ll_resizeWidth  = il_maxWidth
		ll_resizeHeight = (ll_orgHeight * ll_resizeWidth) / ll_orgWidth
  	else
		ll_resizeWidth  = ll_orgWidth
		ll_resizeHeight = ll_orgHeight
   end if	
elseif ld_imgRatio > ld_basisRatio then
	// Height가 기준 비율보다 길다.
	if ll_orgHeight > il_maxHeight then
		ll_resizeWidth  = (ll_orgWidth * ll_resizeHeight) / ll_orgHeight
		ll_resizeHeight = il_maxHeight
   else
		ll_resizeWidth  = ll_orgWidth
		ll_resizeHeight = ll_orgHeight
   end if  
else
  // 기준 비율과 동일한 경우
  ll_resizeWidth  = ll_orgWidth
  ll_resizeHeight = ll_orgHeight
end if

// 리사이즈한 크기로 이미지 크기 다시 지정
arg_pic1.width  = ll_resizeWidth
arg_pic1.height = ll_resizeHeight

end subroutine

public subroutine gf_qrcode_create (string ls_data, string ls_qrcode_name);
 
FILEDELETE("C:\BMP\"+ls_qrcode_name+".JPG")
	
run( "qrencode -o C:\BMP\"+ls_qrcode_name+".jpg '"+ ls_data + "' ")

end subroutine

on w_cddesign_bogo_m.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.st_4=create st_4
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_5=create st_5
this.sle_value=create sle_value
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.pb_1=create pb_1
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
this.pb_photo_insert=create pb_photo_insert
this.pb_photo_delete=create pb_photo_delete
this.st_6=create st_6
this.cbx_picture_check=create cbx_picture_check
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.ddlb_fld
this.Control[iCurrent+4]=this.ddlb_dwtitles
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_value
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_4
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.cb_6
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_vertical
this.Control[iCurrent+13]=this.st_horizontal
this.Control[iCurrent+14]=this.ddlb_op
this.Control[iCurrent+15]=this.pb_photo_insert
this.Control[iCurrent+16]=this.pb_photo_delete
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.cbx_picture_check
this.Control[iCurrent+19]=this.rb_1
this.Control[iCurrent+20]=this.rb_2
this.Control[iCurrent+21]=this.rb_3
end on

on w_cddesign_bogo_m.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.st_4)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_5)
destroy(this.sle_value)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.pb_1)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
destroy(this.pb_photo_insert)
destroy(this.pb_photo_delete)
destroy(this.st_6)
destroy(this.cbx_picture_check)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )

//st_vertical.of_set_rightobject( dw_4 )
//st_vertical.of_set_rightobject( tab_1 )
//st_vertical.of_set_minsize(250, 250)

//st_horizontal.of_set_topobject( dw_4 )
//st_horizontal.of_set_bottomobject( tab_1 )
//st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false
GF_DWTitle2ddlb( dw_1, ddlb_fld, ddlb_dwtitles )

tab_1.tabpage_1.dw_5.settransobject(sqlca)
tab_1.tabpage_2.dw_6.settransobject(sqlca)
tab_1.tabpage_2.dw_7.settransobject(sqlca)
tab_1.tabpage_2.dw_8.settransobject(sqlca)
tab_1.tabpage_3.dw_10.settransobject(sqlca)
tab_1.tabpage_4.dw_11.settransobject(sqlca)
tab_1.tabpage_5.dw_12.settransobject(sqlca)

//dw_area.settransobject(sqlca)
//dw_area.insertrow(0)  
//
//dw_area.object.area[1] = '%    전체'
//
//dw_wc.settransobject(sqlca)
//dw_wc.insertrow(0)
//dw_wc.object.wc_no[1] = '%  전체'

string ls_path = 'C:\BMP\'

if gs_userid = '1999010s' then
	gs_level = '3'
end if	

IF DirectoryExists(ls_path) = FALSE THEN
	CreateDirectory(ls_path)
END IF
		
//DataWindowChild idwc_concode
//
//dw_concode.SetTransObject(sqlca)		
//dw_concode.insertrow(0)  
//
//dw_concode.getchild("con_code", idwc_concode)
//idwc_concode.setredraw(false)
//idwc_concode.settransobject(sqlca)
//idwc_concode.insertrow(1)
//
//idwc_concode.accepttext()
//idwc_concode.setredraw(false)
//
//idwc_concode.setitem(1, 'con_code', '%')
//idwc_concode.setitem(1, 'con_name', '전  체')
//
//idwc_concode.accepttext()
//dw_concode.object.con_code[1] = "%"

pb_retrieve.triggerevent( clicked! )		
		
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_1.dw_5.InsertRow(0)
end event

event resize;call super::resize;//
long  iHeight

iHeight     = newheight - dw_1.y - gb_3.x

gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.height = newheight - dw_1.y - gb_3.x

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

//dw_4.width  = newwidth  - dw_4.x - gb_3.x
//dw_4.height = iHeight * 0.4

//st_horizontal.y      = dw_4.y + dw_4.height
//st_horizontal.width  = dw_4.width

tab_1.y      = st_horizontal.y + st_horizontal.height
tab_1.width  = newwidth  - tab_1.x - gb_3.x
tab_1.height = newheight - tab_1.y - gb_3.x

tab_1.tabpage_1.p_1.width = 3771 /*2679*/
tab_1.tabpage_1.p_1.height = 2111 /*1500*/

tab_1.tabpage_2.dw_6.height = 3400
tab_1.tabpage_2.dw_7.height = 3400
tab_1.tabpage_2.dw_7.width =  3000
tab_1.tabpage_3.dw_10.height =  3400

end event

type pb_save from w_inheritance`pb_save within w_cddesign_bogo_m
integer x = 4055
integer taborder = 100
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
			
string ls_code, ls_scene_code, ls_select_name, ls_select_tel
string   ls_chk_now, ls_chk_origin, ls_work
string ls_company_code, ls_company_name
string ls_name, ls_tel, ls_kind
long	l_code_seq, l_count, ll_count, l_personal_id, l_check



dw_1.accepttext()

if tab_1.tabpage_1.dw_5.getrow() < 1 then return


if i_tabpage = 1 then
	
	if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return
	
		tab_1.tabpage_1.dw_5.accepttext()
		
		l_status   = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)
		
		ls_code = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "code"))
		
		
		if l_status = newmodified! or l_status = new! then			
			
			setnull(l_code_seq)
			
			/*2018.10.15 jowonsuk 5자리로 순번 생성 로직 변경 */			
			SELECT top 1 ISNULL(CONVERT(smallint, code),0) + 1
			into :l_code_seq	
			from sale_bogo_code with(nolock)
			where gubun = '03'
			order by code desc;
			
			
			if isnull(l_code_seq) then
				ls_code = '00001'
			else
				ls_code = trim(string(l_code_seq, '00000'))
			end if
			
			tab_1.tabpage_1.dw_5.setitem(1, "code", ls_code)	
			
		
			tab_1.tabpage_1.dw_5.setitem(1, "write_user_id", gs_userid)
			tab_1.tabpage_1.dw_5.setitem(1, "write_date", trim(gf_today2s()) )
			tab_1.tabpage_1.dw_5.setitem(1, "end_yn", 'Y' )						
			tab_1.tabpage_1.dw_5.setitem(1, "gubun", '03' )
			
		end if

		tab_1.tabpage_1.dw_5.setitem(1, "write_user_id", gs_userid)
		tab_1.tabpage_1.dw_5.setitem(1, "write_date", trim(gf_today2s()) )			
	
		if WF_Update1( tab_1.tabpage_1.dw_5, 'Y' ) = true then
		end if		
		
elseif i_tabpage = 2 then
	
	datawindow dw5, dw6, dw7, dw8
	
	dw5 = tab_1.tabpage_1.dw_5
	dw6 = tab_1.tabpage_2.dw_6
	dw7 = tab_1.tabpage_2.dw_7	
	dw8 = tab_1.tabpage_2.dw_8
	
	setpointer(hourglass!)
	
	dw6.AcceptText()
		
	for l_count = 1 to  dw6.rowcount()
	
		IF isnull(dw6.object.name[l_count]) or dw6.object.name[l_count] = "" THEN
			messagebox("입력오류", "이름은 필수 입력사항입니다.")
			return
		END IF		
		
		l_status = dw6.GetItemStatus(l_count, 0, Primary!)
		
		if l_status = NewModified! OR  l_status = New! then
			
			l_check = 0			
			ls_name = dw6.object.name[l_count]
			ls_tel 	    = dw6.object.tel[l_count]			
			
			select  count(*)
				 into :l_check
			from bogo_personal_connection
			where name = rtrim(ltrim(:ls_name))
				and replace(rtrim(ltrim(tel)),'-', '') = replace(rtrIm(ltrim(:ls_tel)),'-', '');
			
			if l_check >0 then
				messagebox('알림' , '기존 동일한 이름, 전화번호 사용자가 존재합니다.',exclamation!)
				return 0
			end if	
			
			if isnull(dw6.object.write_date[l_count]) then
					dw6.object.write_date[l_count] = trim(gf_today2s())
			end if
			
			if isnull(dw6.object.write_user_id[l_count]) then
					dw6.object.write_user_id[l_count] = gs_userid
			end if	
		
			dw6.object.modify_date[l_count] = trim(gf_today2s())
			dw6.object.modify_user_id[l_count] = gs_userid
			
			ls_kind = dw6.object.kind[l_count]			
			isnull(ls_company_code)
			ls_company_code = dw6.object.company_code[l_count]			
			
			
			/*설계사*/
			if ls_kind = '01' then
			
				select code_name
				into :ls_company_name
				from sale_bogo_code
				where code = :ls_company_code;
				
				dw6.object.company[l_count] = ls_company_name				
				
			else							
				isnull(ls_company_code)						
				dw6.object.company_code[l_count] = ls_company_code			
			end if
			
		elseif l_status = DataModified! then			
							
			ls_kind = dw6.object.kind[l_count]			
			ls_company_code = dw6.object.company_code[l_count]		
			
			if ls_kind = '01' then			
			
				select code_name
				into :ls_company_name
				from sale_bogo_code
				where code = :ls_company_code;
			
				dw6.object.company[l_count] = ls_company_name							
			else								
				isnull(ls_company_code)		
				dw6.object.company_code[l_count] = ls_company_code				
			end if
			
			dw6.object.modify_date[l_count] = trim(gf_today2s())
			dw6.object.modify_user_id[l_count] = gs_userid			
			
		end if
		
	next
	
	
	ls_select_name = trim(dw6.object.name[DW6.GETROW()])
	ls_select_tel 	= trim(dw6.object.tel[DW6.GETROW()])
	is_code = dw5.object.code[1]
	
	if WF_Update1(dw6,  'N' ) = true then
		
		select personal_id
		  into :l_personal_id
		from bogo_personal_connection
		where name  = :ls_select_name
			 and tel       = :ls_select_tel;
			 
//		l_count = 0
//		
//		 select count(*) 
//		 into :l_count
//		 from bogo_personal_connection_code			 
//		 where personal_id = :l_personal_id
//		     and gubun = :is_gubun
//		     and code = :is_code;
//			  
//				
//		if l_count = 0 then
//			
//			insert into bogo_personal_connection_code (personal_id, gubun, code, write_date, write_user_id) 
//			      values (:l_personal_id, :is_gubun, :is_code, convert(char(8), getdate(),112), :gs_userid);		
//			
//		end if
		
		
		if isnull(l_personal_id)  = false then
			
				FOR ll_count = 1 TO dw7.rowcount()
					
					l_status = dw7.GetItemStatus(ll_count, 0, Primary!)
					
					if l_status = NewModified! OR  l_status = New! then
						dw7.object.personal_id[ll_count] = l_personal_id					
					end if	
					
					if l_status = DataModified! then	
						dw7.object.personal_id[ll_count] = l_personal_id						
						dw7.object.write_date[ll_count] = trim(gf_today2s())
						dw7.object.write_user_id[ll_count] = gs_userid
					end if
					
				NEXT			
				
		else
				
		end if
			
		if WF_Update1(dw7,  'Y' ) = true then
			
		else
			MessageBox("저장오류","내용을 확인해보세요.",stopsign!)
		end if
		
	end if		
elseif i_tabpage = 3 then

	datawindow dw10
	
	dw10 = tab_1.tabpage_3.dw_10
	
	setpointer(hourglass!)
	
	dw10.AcceptText()
		
	for l_count = 1 to  dw10.rowcount()
		
		l_status = dw10.GetItemStatus(l_count, 0, Primary!)
			
		ls_chk_origin = dw10.object.chk_orgin[l_count]	
		
		ls_work = ''
		
		ls_work = trim(dw10.object.work[l_count])
		
		select replace(:ls_work, char(13)+char(10), '' )
		   into :ls_work		
		from dual;
		
		if ls_work = '' or LenA(ls_work) = 0  then
				MessageBox("저장오류",STRING(l_count)+ " 행은의 내용이 없습니다. 내용을 확인해보세요.",stopsign!)				
				RETURN			
		end if
			
		
		if l_status = NewModified! OR  l_status = New! then
			
			if isnull(dw10.object.write_date[l_count]) then
					dw10.object.write_date[l_count] = trim(gf_today2s())
			end if
			
			if isnull(dw10.object.write_user_id[l_count]) then
					dw10.object.write_user_id[l_count] = gs_userid
			end if	
			
			dw10.object.chk[l_count] = ls_chk_now
			
		elseif  l_status = DataModified! then
						
			if ls_chk_origin = 'Y'  then
				MessageBox("저장오류",STRING(l_count)+ " 행은 이미 확정되어 있습니다. 내용을 확인해보세요.",stopsign!)				
				RETURN
			end if						
			
		end if
		
	next
		
	
	if WF_Update1(dw10,  'Y' ) = true then
		
	else
		MessageBox("저장오류","내용을 확인해보세요.",stopsign!)
	end if
		
	
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cddesign_bogo_m
integer x = 27
integer y = 400
integer width = 2194
integer height = 2120
integer taborder = 10
string title = "d_design_r"
string dataobject = "d_design_r"
end type

event dw_1::rowfocuschanged;call super::rowfocuschanged;//long   ll_row
//string ls_value
//
////dw_4.setredraw(false)
////dw_4.reset()
//tab_1.tabpage_1.dw_5.reset()
//tab_1.tabpage_2.dw_6.reset()
//
//ll_row   = this.getrow()
//if ll_row > 0 then
////	dw_4.retrieve(this.object.item_no[ll_row])
//end if
//
////dw_4.setredraw(true)
//
end event

event dw_1::clicked;call super::clicked;string  ls_scene_code, ls_retrieve
long 	 l_row = 0, ll_row, ll_FileLength, ll_fp = 32765, li_loops
Blob    lb_picture, lb_pictemp, blob_totalfile, blob_file, blob_null
int        li_FileFP,  i


if row = 0 then return

this.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()
tab_1.tabpage_2.dw_7.reset()
tab_1.tabpage_3.dw_10.reset()

is_code = this.object.code[row]

if isnull(is_code) or is_code = "" then
else	
	
	/* 권한 gs_level 3은 풀권한 */
	if gs_level = '3' then	
			ls_retrieve = 'Y'
	else
		
		if (this.object.salesman1[row] = gs_userid or this.object.salesman2[row] = gs_userid)  then
			ls_retrieve = 'Y'
		ELSE
			ls_retrieve = 'N'
		end if
		
	end if
end if

tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"	

IF ls_retrieve = 'Y' THEN

	l_row = tab_1.tabpage_1.dw_5.retrieve(is_code, is_gubun)
	
	if l_row = 0 then
		tab_1.tabpage_1.dw_5.ReSet()
		ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)	
		tab_1.tabpage_1.dw_5.ScrollToRow(ll_row)
//		tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"	
	end if

	tab_1.tabpage_2.dw_6.retrieve(is_code, is_gubun)
	tab_1.tabpage_3.dw_10.retrieve(is_code, is_gubun)
	
	tab_1.tabpage_1.p_1.setredraw( false )
	
	
//	if cbx_picture_check.checked then
//			setnull(lb_picture)
//			
//			SELECTBLOB photo 
//					 INTO :lb_picture 
//					FROM msale_project WHERE project_code = :is_code;			
//			
//			if sqlca.sqlcode = 100 then	
//				tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
//			else	
//				if isnull(lb_picture) then
//					tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"		
//				else	
//					
//						tab_1.tabpage_1.p_1.SetPicture( lb_picture )
//					
//				end if
//				
//			/*	WF_Images_Resize( tab_1.tabpage_1.p_1 )*/
//			end if
//			
//	else		
//			tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
//			
//	end if				
	
tab_1.tabpage_1.p_1.setredraw( true )		
	
END IF	



end event

type st_title from w_inheritance`st_title within w_cddesign_bogo_m
integer x = 37
integer y = 28
integer width = 1120
integer height = 132
string text = "설계사관리"
end type

type st_tips from w_inheritance`st_tips within w_cddesign_bogo_m
end type

type pb_compute from w_inheritance`pb_compute within w_cddesign_bogo_m
boolean visible = false
integer x = 3104
integer y = 76
integer width = 160
integer height = 116
integer taborder = 190
boolean enabled = false
string picturename = "Custom008!"
vtextalign vtextalign = vcenter!
end type

event pb_compute::clicked;
//wf_update1(dw_4, 'Y')
end event

event pb_compute::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"저장",parent, li_x, li_y)

end event

type pb_print_part from w_inheritance`pb_print_part within w_cddesign_bogo_m
boolean visible = false
integer x = 3986
integer y = 256
integer width = 165
integer height = 120
integer taborder = 130
boolean enabled = false
end type

event pb_print_part::clicked;call super::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//gs_codere_str lst_code
//w_repsuper w_print
//st_print   l_print
//string ls_sql, ls_where
//long   l_dw4_rowcount, l_row, l_page, i
//
//dw_4.settransobject(sqlca)
//dw_4.retrieve(is_project_code)
//
//l_dw4_rowcount = dw_4.rowcount()
//
//if l_dw4_rowcount > 0 then
//	
//	l_row = mod(l_dw4_rowcount, 16)
//	l_page = round( l_dw4_rowcount / 16, 0)
//	
//	if l_row > 0 then	
//		l_page = l_page + 1		
//	else
//		l_page = l_page
//	end if
//
//else	
//	
//	l_page = 1
//	
//end if
//
//
//for i = 1 to (l_page*16 - l_dw4_rowcount)
//	dw_4.insertrow(0)
//next
//
//
//l_print.st_datawindow  = dw_4
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 수리이력을 출력합니다." 
////
////// LANDSCAPE:1, PORTRAIT:2
////// SIZE 9-A4, 12-B4
////gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
////gs_print_control = 'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수리이력인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cddesign_bogo_m
integer x = 4247
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cddesign_bogo_m
boolean visible = false
integer x = 4549
integer y = 40
integer taborder = 60
boolean enabled = false
end type

event pb_print::clicked;////==GF_USEPROGRAM(프로그램 사용현황)==============================================================
//GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
////================================================================================================
//
//gs_codere_str lst_code
//w_repsuper w_print
//st_print   l_print
//string  ls_sql, ls_where, ls_path, ls_file
//blob    lb_picture, blob_temp
//LONG    ll_filelen, li_loop, i, l_dw4_rowcount, l_page, l_row
//integer i_file
//boolean l_ret
//
////openwithparm(w_whitem_w, lst_code)
////lst_code = message.powerobjectparm
////if lst_code.okcancel = 'N' then return
////
////if lst_code.flag = 'A' then
////	ls_sql = "datawindow.table.select = '" + is_dw3sql + "'"
////else
////	ls_where = " and item.item_no between ~~'" + lst_code.start_no + "~~' and " + &
////				  "~~'" + lst_code.end_no + "~~'"
////	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
////end if
////
//dw_3.settransobject(sqlca)
////dw_3.modify(ls_sql)
//
//
//if cbx_picture_check.checked then
//
//	SELECTBLOB photo 
//	 INTO :lb_picture 
//	 FROM equip 
//	WHERE equip_code = :is_project_code;
//	
//	if isnull(lb_picture) = false then
//		
//		ll_filelen = len(lb_picture)
//		
//		if ll_filelen > 32765 then
//			
//			if mod(ll_filelen,32765) = 0 then
//				  li_loop = ll_filelen / 32765
//			else
//				  li_loop = (ll_filelen/32765) + 1
//			end if
//			
//		else
//			li_loop = 1
//		end if
//		
//		ls_path = 'C:\BMP\EQUIP.JPG'
//		
//		l_ret = Filedelete(ls_path)	
//		
//		i_file = FileOpen(ls_path, StreamMode!, Write!, lockwrite!, append!)
//	
//		for i = 1 to li_loop
//			 if i = li_loop then
//					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1)
//			 else
//					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1,32765)
//			 end if
//			 FileWrite(i_file, blob_temp)
//		next
//		
//		Fileclose(i_file)
//		
//		dw_3.Modify("p_equip.filename = '"+ls_path+"'")
//	
//	else	
//		
//		ls_path = 'C:\BMP\YC_150X150.JPG'
//		
//		dw_3.Modify("p_equip.filename = '"+ls_path+"'")
//	end if
//
//else
//	
//	ls_path = 'C:\BMP\YC_150X150.JPG'
//	
//	dw_3.Modify("p_equip.filename = '"+ls_path+"'")	
//		
//end if
//
///*qrcodetst 작업 커스를 돌리고 */
//
////string ls_data
////
////
////ls_data = 'HD20180406-135' + &
////			'001PAWSST7K00080X0120X0045X0258001000' + &
////			'002PAWSST7K00080X0120X0045X0258001000' + &
////			'003PAWSST7K00080X0120X0045X0258001000' + &
////			'004PAWSST7K00080X0120X0045X0258001000' + &
////			'005PAWSST7K00080X0120X0045X0258001000' + &
////			'006PAWSST7K00080X0120X0045X0258001000' + &
////			'007PAWSST7K00080X0120X0045X0258001000' + &
////			'008PAWSST7K00080X0120X0045X0258001000' + &			
////			'009PAWSST7K00080X0120X0045X0258001000' + &
////			'010PAWSST7K00080X0120X0045X0258001000' 
////
////select replace(:ls_data,' ', '')  
////into :ls_data  
////from login where user_id = '1999010s';			
//
//
//// 왠만하면 이걸 쓰는게 좋음. 제한 조건 6개 제품, 읽을때, 빈공간 없어야함.
////gf_qrcode_create('labelqrcode',ls_data)
//
//
//
////	사전에 qrtext.txt 처리 로직을 만들어야한다. 
////	1. qrtext.txt파일 없으면 생성. 위치는 qrtext.txt
////	2. qrcode.bmp 생성.
////	3. sdpIkhyeon.DLL 없으면 포함.
//	
////	sdp_QRCodeCreate2()	
//	
//
//
//
//dw_3.retrieve(is_project_code)
//
//if dw_3.rowcount() < 1 then return
//
////dw_4.retrieve(is_equip_code)
////
////
////l_dw4_rowcount = dw_4.rowcount()
////
////if l_dw4_rowcount > 0 then
////	l_row = mod(l_dw4_rowcount, 17)
////	l_page = round( l_dw4_rowcount / 17, 0)
////	
////end if
//
//l_print.st_datawindow  = dw_3
//l_print.st_print_sheet = " 프린트용지 : A4"
//l_print.st_print_desc  = " 이 프로그램은 설비카드를 출력합니다." 
////
////// LANDSCAPE:1, PORTRAIT:2
////// SIZE 9-A4, 12-B4
////gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
////gs_print_control = 'Datawindow.Zoom=100'
//opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cddesign_bogo_m
integer x = 3867
integer taborder = 230
end type

event pb_cancel::clicked;call super::clicked;//// 
//dw_2.reset()
//dw_3.reset()
//dw_4.reset()
//dw_9.reset()
//
//dw_2.insertrow(0)


tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_3.dw_10.reset()

tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"

tab_1.tabpage_1.dw_5.insertrow(0)
end event

type pb_delete from w_inheritance`pb_delete within w_cddesign_bogo_m
integer x = 3675
integer taborder = 40
end type

event pb_delete::clicked;dwItemStatus l_status
DataWindow dw5, dw6, dw7, dw8, dw10
string ls_select_name, ls_select_tel, ls_code, ls_personal_id
long   l_personal_id, ll_count, ll_row, l_rowcount
string  ls_chk_origin, ls_chk_now

dw5 = tab_1.tabpage_1.dw_5
dw6 = tab_1.tabpage_2.dw_6
dw7 = tab_1.tabpage_2.dw_7		
dw8 = tab_1.tabpage_2.dw_8
dw10 = tab_1.tabpage_3.dw_10

tab_1.tabpage_1.dw_5.accepttext()

l_status = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)


if l_status = new! or l_status = newmodified! then
	
elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	
	if i_tabpage = 1 then
		
		ls_code = dw5.object.code[1]
				
		dw5.deleterow(0)		
		
		l_rowcount = dw6.rowcount()
		
		l_rowcount = dw8.retrieve( ls_code, '%', is_gubun)

		FOR ll_count = 1 TO  l_rowcount
			dw8.deleterow(0)
		NEXT		
	

		for ll_count = 1 to  dw10.rowcount()			
			
			ls_chk_origin = dw10.GetItemstring(ll_count, "chk", Primary!, TRUE) 									
			
			if ls_chk_origin = 'Y' then		
				MessageBox("오류", "이력등록" + string(ll_count) + "행은 이미확정되어 삭제 할 수 없습니다.",stopsign!)
				return 0
			end if
		next			
		
		l_rowcount = dw10.rowcount()		
		FOR ll_count = 1 TO  l_rowcount
			dw10.deleterow(0)
		NEXT		
		
		if WF_Update3(dw5, dw8, dw10,  'Y' ) = true then			
		end if
		
		dw5.reset()
		dw6.reset()
		dw7.reset()
		dw10.reset()		
				
	elseif i_tabpage = 2 then
				
		
		ls_code = dw5.object.code[1]		
		
		ls_personal_id =	string(dw6.object.personal_id[dw6.getrow()])
		
		
		if is_dw = 'dw_6' then
		
		
			dw6.deleterow(dw6.getrow())
	
			l_rowcount = dw8.retrieve( ls_code, ls_personal_id, is_gubun)
	
			FOR ll_count = 1 TO l_rowcount
				dw8.deleterow(0)
			NEXT
			
			if WF_Update1( dw8,  'Y' ) = true then
				
			end if
			
		elseif is_dw = 'dw_7' then
			
			dw7.deleterow(dw7.getrow())		
			
			if WF_Update1( dw7,  'Y' ) = true then
				
			end if				
			
		end if
		
		dw7.reset()
		
		
	elseif i_tabpage = 3 then

		l_status = dw10.GetItemStatus(ll_count, 0, Primary!)					
		
		setpointer(hourglass!)
		
		dw10.AcceptText()
		
		ls_chk_origin = dw10.GetItemstring(dw10.getrow(), "chk", Primary!, TRUE) 									
		
		if isnull(ls_chk_origin) then
			ls_chk_origin = 'N'
		end if
		
		if ls_chk_origin <> 'Y' then		
			dw10.deleterow(dw10.getrow())
		else
			MessageBox("오류", "이력등록" + string(dw10.getrow()) + "행은 이미확정되어 삭제 할 수 없습니다.",stopsign!)
		end if
		
		if WF_Update1( dw10,  'Y' ) = true then
			
		end if						
				
	end if
	
end if		
	

return 1

end event

type pb_insert from w_inheritance`pb_insert within w_cddesign_bogo_m
integer x = 3488
integer taborder = 30
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row, l_seq

//if dw_1.rowcount() < 1 then return

//tab_1.tabpage_1.dw_5.ReSet()
//tab_1.tabpage_2.dw_6.ReSet()
//tab_1.tabpage_2.dw_7.ReSet()
//tab_1.tabpage_3.dw_10.Reset()

if i_tabpage = 1 then
	
	tab_1.tabpage_1.dw_5.ReSet()	
	
//	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
	
	ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)	
	tab_1.tabpage_1.dw_5.setfocus()
	tab_1.tabpage_1.dw_5.setrow(ll_row)
	tab_1.tabpage_1.dw_5.setcolumn('code_name')
	tab_1.tabpage_1.dw_5.object.end_yn[ll_row] = 'Y'
	
elseif i_tabpage = 2 then	
	
	
	if is_dw = 'dw_6' then
		
		ll_row= tab_1.tabpage_2.dw_6.InsertRow(0)
		tab_1.tabpage_2.dw_6.ScrollToRow(ll_row)		
		tab_1.tabpage_2.dw_6.object.gubun[ll_row] = is_gubun		
		tab_1.tabpage_2.dw_6.object.kind[ll_row] = '01'
		tab_1.tabpage_2.dw_6.object.company_code[ll_row] = tab_1.tabpage_1.dw_5.object.code[1]		
		tab_1.tabpage_2.dw_6.object.company[ll_row] = tab_1.tabpage_1.dw_5.object.code_name[1]
		tab_1.tabpage_2.dw_6.setfocus()
		tab_1.tabpage_2.dw_6.setrow(ll_row)
		tab_1.tabpage_2.dw_6.setcolumn('name')
		
	elseif is_dw =  'dw_7' then
		ll_row= tab_1.tabpage_2.dw_7.InsertRow(0)
		tab_1.tabpage_2.dw_7.ScrollToRow(ll_row)		
		tab_1.tabpage_2.dw_7.object.gubun[ll_row] = is_gubun
		tab_1.tabpage_2.dw_7.setfocus()
		tab_1.tabpage_2.dw_7.setrow(ll_row)
		tab_1.tabpage_2.dw_7.setcolumn('yc_user_id')		
	end if	
	
elseif i_tabpage = 3 then	
	
	l_seq = 0
	
	ll_row= tab_1.tabpage_3.dw_10.InsertRow(1)
	
	if tab_1.tabpage_3.dw_10.rowcount() = 1 then	
		l_seq = 1		
	else		
		l_seq = tab_1.tabpage_3.dw_10.object.seq[2] + 1				
	end if
	
	tab_1.tabpage_3.dw_10.object.code[ll_row] = is_code // is_equip_code 는 dw_1 click 받는다.
	tab_1.tabpage_3.dw_10.object.write_user_id[ll_row] = gs_userid // is_equip_code 는 dw_1 click 받는다.
	tab_1.tabpage_3.dw_10.object.write_date[ll_row] = gf_today2s()
	tab_1.tabpage_3.dw_10.object.seq[ll_row] = l_seq
	tab_1.tabpage_3.dw_10.object.gubun[ll_row] = is_gubun
	
//	tab_1.tabpage_3.dw_10.ScrollToRow(ll_row)			

	tab_1.tabpage_3.dw_10.setrow(ll_row)
	tab_1.tabpage_3.dw_10.setcolumn('work')
	tab_1.tabpage_3.dw_10.setfocus()	
		
end if	
	


end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cddesign_bogo_m
integer x = 3296
integer taborder = 250
end type

event pb_retrieve::clicked;string ls_con_code, ls_yn


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()

dw_1.setfilter('')
dw_1.filter()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()
tab_1.tabpage_2.dw_7.reset()
tab_1.tabpage_3.dw_10.reset()
tab_1.tabpage_4.dw_11.reset()
tab_1.tabpage_5.dw_12.reset()

//tab_1.tabpage_1.p_1.PictureName = "c:\bmp\YC_150X150.jpg"

tab_1.tabpage_1.dw_5.InsertRow(0)	

IF RB_1.CHECKED THEN
	ls_yn = '%'
ELSEIF RB_2.CHECKED THEN
	ls_yn = 'Y'	
ELSEIF RB_3.CHECKED THEN	
	ls_yn = 'N'		
END IF	


dw_1.retrieve(ls_yn, is_gubun)

if dw_1.rowcount() < 1 then return

dw_1.scrolltorow(1)
end event

type gb_3 from w_inheritance`gb_3 within w_cddesign_bogo_m
integer x = 32
integer y = 224
integer width = 4434
integer height = 160
integer taborder = 170
integer textsize = -8
integer weight = 400
long textcolor = 16711680
long backcolor = 81838264
end type

type gb_2 from w_inheritance`gb_2 within w_cddesign_bogo_m
boolean visible = false
integer x = 1422
integer y = 216
integer width = 2130
integer height = 192
integer taborder = 0
integer textsize = -10
long textcolor = 16711680
long backcolor = 81838264
string text = "출처"
end type

type gb_1 from w_inheritance`gb_1 within w_cddesign_bogo_m
integer x = 3278
integer width = 1189
integer taborder = 0
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cddesign_bogo_m
boolean visible = false
integer x = 1125
integer y = 12
integer width = 119
integer height = 88
integer taborder = 160
boolean enabled = false
boolean vscrollbar = false
end type

type tab_1 from tab within w_cddesign_bogo_m
string tag = "프로젝트관리"
integer x = 2254
integer y = 440
integer width = 5742
integer height = 2676
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;i_tabpage = newindex

//if i_tabpage = 1 then
//	tab_1.tabpage_1.p_1.visible = true
//	pb_print_part.visible = false	
//	pb_photo_insert.visible = true
//	pb_photo_delete.visible = true 
	
	pb_insert.enabled = true
	pb_insert.visible = true	
	pb_delete.visible = true 
	pb_delete.enabled = true	
//	st_6.visible = true
//	st_6.text = '※사진업로드,삭제는 옆에 버튼을 이용해주세요.'	
if i_tabpage = 2 then
	is_dw = 'dw_6'
end if
//	
//	pb_photo_insert.visible = false
//	pb_photo_delete.visible = false
//	
//	pb_insert.enabled = true
//	pb_insert.visible = true
//	pb_print_part.visible = true
//	pb_delete.visible = true 
//	pb_delete.enabled = true 
//	pb_print_part.x = 4297
//	st_6.visible = true
//	st_6.text = '※수리이력 출력은 옆에 버튼을 이용해주세요.'	
//	
//else
//	tab_1.tabpage_1.p_1.visible = false
//	pb_photo_insert.visible = false
//	pb_photo_delete.visible = false
//	pb_photo_insert.visible = false
//	
//	pb_insert.enabled = false
//	pb_insert.visible = false
//	
//	pb_delete.visible = false 
//	pb_delete.enabled = false
//	pb_print_part.visible = false
//	st_6.visible = false
//end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5705
integer height = 2548
long backcolor = 79741120
string text = "설계사등록"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
p_1 p_1
dw_5 dw_5
end type

on tabpage_1.create
this.p_1=create p_1
this.dw_5=create dw_5
this.Control[]={this.p_1,&
this.dw_5}
end on

on tabpage_1.destroy
destroy(this.p_1)
destroy(this.dw_5)
end on

type p_1 from picture within tabpage_1
string tag = "설비사진"
boolean visible = false
integer x = 23
integer y = 1140
integer width = 805
integer height = 688
boolean enabled = false
string picturename = "C:\BMP\YC_150X150.jpg"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_5 from datawindow within tabpage_1
integer x = 18
integer y = 4
integer width = 3781
integer height = 1096
integer taborder = 61
string dataobject = "d_design_m"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string ls_l1,ls_l2,ls_l3,ls_l4,ls_qa,ls_data, ls_qa1
//
//this.accepttext()
//if row < 1 then return
//
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//ls_qa = this.object.qa[1]
//
//if isnull(ls_qa) then ls_qa = ""
//
//ls_l1 = trim(this.object.l1[1])
//ls_l2 = trim(this.object.l2[1])
//ls_l3 = trim(this.object.l3[1])
//ls_l4 = trim(this.object.l4[1])
//
//choose case dwo.name
//	case 'l1'
//		  if isnumber(ls_l1) then
//			  ls_l1 = '00000' + ls_l1
//			  ls_l1 = right(ls_l1,3)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l1[1] = ls_l1
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return 1
//		  end if
//	case 'l2'
//		  if isnumber(ls_l2) then
//			  ls_l2 = '00000' + ls_l2
//			  ls_l2 = right(ls_l2,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l2[1] = ls_l2
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l3'
//		  if isnumber(ls_l3) then
//			  ls_l3 = '00000' + ls_l3
//			  ls_l3 = right(ls_l3,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l3[1] = ls_l3
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l4'
//		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
//			   if isnumber(ls_l4) then
//				   ls_l4 = '00000' + ls_l4
//				   ls_l4 = right(ls_l4,5)
//				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//				   this.object.l4[1] = ls_l4
//			   else
//			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			 	  return	1		
//			   end if
//			   ls_qa1 = this.object.qa[1]
//			else
//				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
//			   this.object.l4[1] = trim(ls_l4)
//		  end if
//end choose
//
end event

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5705
integer height = 2548
long backcolor = 79741120
string text = "인맥보기"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
dw_8 dw_8
dw_6 dw_6
dw_7 dw_7
end type

on tabpage_2.create
this.dw_8=create dw_8
this.dw_6=create dw_6
this.dw_7=create dw_7
this.Control[]={this.dw_8,&
this.dw_6,&
this.dw_7}
end on

on tabpage_2.destroy
destroy(this.dw_8)
destroy(this.dw_6)
destroy(this.dw_7)
end on

type dw_8 from datawindow within tabpage_2
boolean visible = false
integer x = 5289
integer y = 252
integer width = 242
integer height = 400
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "d_bogo_personal_connection_m3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within tabpage_2
integer x = 5
integer y = 16
integer width = 3703
integer height = 2192
integer taborder = 71
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_bogo_personal_connection_m1"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//this.accepttext()
//
//tab_1.tabpage_1.dw_5.object.std_setup[1] = this.object.std_setup[1]
//tab_1.tabpage_1.dw_5.object.std_burden[1] = this.object.std_burden[1]
//tab_1.tabpage_1.dw_5.object.std_material[1] = this.object.std_material[1]
//tab_1.tabpage_1.dw_5.object.std_subcontract[1] = this.object.std_subcontract[1]
//tab_1.tabpage_1.dw_5.object.std_labor[1] = this.object.std_labor[1]
//tab_1.tabpage_1.dw_5.object.std_machine[1] = this.object.std_machine[1]
//tab_1.tabpage_1.dw_5.object.heft[1] = this.object.heft[1]
//tab_1.tabpage_1.dw_5.object.volume[1] = this.object.volume[1]
end event

event losefocus;//this.accepttext()
//
//tab_1.tabpage_1.dw_5.object.std_setup[1] = this.object.std_setup[1]
//tab_1.tabpage_1.dw_5.object.std_burden[1] = this.object.std_burden[1]
//tab_1.tabpage_1.dw_5.object.std_material[1] = this.object.std_material[1]
//tab_1.tabpage_1.dw_5.object.std_subcontract[1] = this.object.std_subcontract[1]
//tab_1.tabpage_1.dw_5.object.std_labor[1] = this.object.std_labor[1]
//tab_1.tabpage_1.dw_5.object.std_machine[1] = this.object.std_machine[1]
//tab_1.tabpage_1.dw_5.object.heft[1] = this.object.heft[1]
//tab_1.tabpage_1.dw_5.object.volume[1] = this.object.volume[1]
end event

event clicked;long l_personal_id
string ls_code

tab_1.tabpage_2.dw_7.reset()

is_dw = 'dw_6'

if row = 0 then return

i_personal_id= this.object.personal_id[row]
ls_code = tab_1.tabpage_1.dw_5.object.code[1]

dw_7.retrieve(i_personal_id, is_gubun)
dw_8.retrieve(ls_code, string(i_personal_id), is_gubun)
end event

event rbuttondown;long l_personal_id, ll_row
string ls_name, ls_tel, ls_kind, ls_company, ls_company_code, ls_level, ls_job, ls_personal_story, ls_write_date, ls_write_user_id, ls_write_user_name, ls_modify_date, ls_modify_user_id, ls_modify_user_name
string ls_yc_user_id, ls_connect_level, ls_important_level

OpenWithParm(w_personal_w, '03')

l_personal_id = message.doubleparm

if isnull(l_personal_id) = false then
	
     if l_personal_id <> 0 then
	
			ll_row = this.insertrow(0)
			
			select   BOGO_PERSONAL_CONNECTION.name,
					  BOGO_PERSONAL_CONNECTION.tel,
					  BOGO_PERSONAL_CONNECTION.kind,
					  BOGO_PERSONAL_CONNECTION.company,
					  BOGO_PERSONAL_CONNECTION.company_code,
					  BOGO_PERSONAL_CONNECTION.level,
					  BOGO_PERSONAL_CONNECTION.job,
					  BOGO_PERSONAL_CONNECTION.personal_story,
					  BOGO_PERSONAL_CONNECTION.write_date,
					  BOGO_PERSONAL_CONNECTION.write_user_id,
					  b.user_name write_user_name,
					  BOGO_PERSONAL_CONNECTION.modify_date,
					  BOGO_PERSONAL_CONNECTION.modify_user_id,
					  c.user_name modify_user_name,
  					  BOGO_PERSONAL_CONNECTION.important_level
			  into  :ls_name, 
					:ls_tel, 
					:ls_kind, 
					:ls_company, 
					:ls_company_code, 
					:ls_level, 
					:ls_job, 
					:ls_personal_story, 
					:ls_write_date, 
					:ls_write_user_id, 
					:ls_write_user_name, 
					:ls_modify_date, 
					:ls_modify_user_id, 
					:ls_modify_user_name,
					:ls_important_level
			from BOGO_PERSONAL_CONNECTION left outer join V_PRESALE_ALL_USER b on BOGO_PERSONAL_CONNECTION.write_user_id = b.user_id
											  left outer join V_PRESALE_ALL_USER c on BOGO_PERSONAL_CONNECTION.write_user_id = c.user_id
				WHERE personal_id = :l_personal_id
				      AND BOGO_PERSONAL_CONNECTION.GUBUN = :is_gubun;
					
			this.object.personal_id[ll_row] 								= l_personal_id
			this.object.name[ll_row] 										= ls_name
			this.object.tel[ll_row]       										= ls_tel
			this.object.kind[ll_row]   										= ls_kind
			this.object.company[ll_row] 									= ls_company
			this.object.company_code[ll_row] 							= ls_company_code
			this.object.level[ll_row] 										= ls_level
			this.object.job[ll_row] 											= ls_job
			this.object.personal_story[ll_row]							= ls_personal_story
			this.object.write_date[ll_row] 								= ls_write_date	
			this.object.write_user_id[ll_row] 								= ls_write_user_id		
			this.object.write_user_name[ll_row] 						= ls_write_user_name
			this.object.modify_date[ll_row] 								= ls_modify_date
			this.object.modify_user_id[ll_row] 							= ls_modify_user_id
			this.object.modify_user_name[ll_row] 						= ls_modify_user_name
			this.object.gubun[ll_row] 										= is_gubun
			this.object.important_level[ll_row]							= ls_important_level
			
			this.SetItemStatus( ll_row, 0, PRIMARY!, DataModified! )
			
			DECLARE personal_cursor CURSOR FOR  
			select yc_user_id,
					connect_level,
					write_date,
					write_user_id
			from BOGO_PERSONAL_CONNECTION_DET
			where personal_id = :l_personal_id
			   and gubun = :is_gubun;
			
			
			tab_1.tabpage_2.dw_7.reset()
			
			
			OPEN personal_cursor;
		
				FETCH personal_cursor INTO :ls_yc_user_id, :ls_connect_level, :ls_write_date, :ls_write_user_id;
				
				Do While sqlca.sqlcode = 0
					
					
					ll_row = tab_1.tabpage_2.dw_7.insertrow(0)
					
					tab_1.tabpage_2.dw_7.object.yc_user_id[ll_row] 								= ls_yc_user_id
					tab_1.tabpage_2.dw_7.object.connect_level[ll_row] 							= ls_connect_level								
					tab_1.tabpage_2.dw_7.object.write_user_id[ll_row] 								= ls_write_user_id		
					tab_1.tabpage_2.dw_7.object.write_user_name[ll_row] 						= ls_write_user_name
					tab_1.tabpage_2.dw_7.object.gubun[ll_row] 										= is_gubun
					
					tab_1.tabpage_2.dw_7.SetItemStatus( ll_row, 0, PRIMARY!, DataModified! )					
			
				FETCH personal_cursor INTO :ls_yc_user_id, :ls_connect_level, :ls_write_date, :ls_write_user_id;		
				
				
			Loop
			CLOSE personal_cursor;	

	end if			

end if




end event

type dw_7 from datawindow within tabpage_2
integer x = 3717
integer y = 16
integer width = 1984
integer height = 2184
integer taborder = 80
string title = "none"
string dataobject = "d_bogo_personal_connection_m2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;is_dw = 'dw_7'

if row = 0 then return
end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5705
integer height = 2548
long backcolor = 79741120
string text = "활동내역"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 536870912
dw_10 dw_10
end type

on tabpage_3.create
this.dw_10=create dw_10
this.Control[]={this.dw_10}
end on

on tabpage_3.destroy
destroy(this.dw_10)
end on

type dw_10 from datawindow within tabpage_3
integer x = 18
integer y = 4
integer width = 4247
integer height = 2536
integer taborder = 10
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_sale_design_history_m"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

event clicked;is_dw = 'dw_10'

if row = 0 then return
end event

type tabpage_4 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 5705
integer height = 2548
boolean enabled = false
long backcolor = 79741120
string text = "주요부품"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 536870912
dw_11 dw_11
end type

on tabpage_4.create
this.dw_11=create dw_11
this.Control[]={this.dw_11}
end on

on tabpage_4.destroy
destroy(this.dw_11)
end on

type dw_11 from datawindow within tabpage_4
integer x = 18
integer y = 4
integer width = 5842
integer height = 1872
integer taborder = 10
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdequip_m5"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string ls_l1,ls_l2,ls_l3,ls_l4,ls_qa,ls_data, ls_qa1
//
//this.accepttext()
//if row < 1 then return
//
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//ls_qa = this.object.qa[1]
//
//if isnull(ls_qa) then ls_qa = ""
//
//ls_l1 = trim(this.object.l1[1])
//ls_l2 = trim(this.object.l2[1])
//ls_l3 = trim(this.object.l3[1])
//ls_l4 = trim(this.object.l4[1])
//
//choose case dwo.name
//	case 'l1'
//		  if isnumber(ls_l1) then
//			  ls_l1 = '00000' + ls_l1
//			  ls_l1 = right(ls_l1,3)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l1[1] = ls_l1
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return 1
//		  end if
//	case 'l2'
//		  if isnumber(ls_l2) then
//			  ls_l2 = '00000' + ls_l2
//			  ls_l2 = right(ls_l2,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l2[1] = ls_l2
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l3'
//		  if isnumber(ls_l3) then
//			  ls_l3 = '00000' + ls_l3
//			  ls_l3 = right(ls_l3,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l3[1] = ls_l3
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l4'
//		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
//			   if isnumber(ls_l4) then
//				   ls_l4 = '00000' + ls_l4
//				   ls_l4 = right(ls_l4,5)
//				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//				   this.object.l4[1] = ls_l4
//			   else
//			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			 	  return	1		
//			   end if
//			   ls_qa1 = this.object.qa[1]
//			else
//				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
//			   this.object.l4[1] = trim(ls_l4)
//		  end if
//end choose
//
end event

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

type tabpage_5 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 5705
integer height = 2548
boolean enabled = false
long backcolor = 79741120
string text = "수리이력"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 536870912
dw_12 dw_12
end type

on tabpage_5.create
this.dw_12=create dw_12
this.Control[]={this.dw_12}
end on

on tabpage_5.destroy
destroy(this.dw_12)
end on

type dw_12 from datawindow within tabpage_5
integer x = 18
integer y = 16
integer width = 4265
integer height = 1860
integer taborder = 10
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdequip_m3"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//string ls_l1,ls_l2,ls_l3,ls_l4,ls_qa,ls_data, ls_qa1
//
//this.accepttext()
//if row < 1 then return
//
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//ls_qa = this.object.qa[1]
//
//if isnull(ls_qa) then ls_qa = ""
//
//ls_l1 = trim(this.object.l1[1])
//ls_l2 = trim(this.object.l2[1])
//ls_l3 = trim(this.object.l3[1])
//ls_l4 = trim(this.object.l4[1])
//
//choose case dwo.name
//	case 'l1'
//		  if isnumber(ls_l1) then
//			  ls_l1 = '00000' + ls_l1
//			  ls_l1 = right(ls_l1,3)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l1[1] = ls_l1
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return 1
//		  end if
//	case 'l2'
//		  if isnumber(ls_l2) then
//			  ls_l2 = '00000' + ls_l2
//			  ls_l2 = right(ls_l2,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l2[1] = ls_l2
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l3'
//		  if isnumber(ls_l3) then
//			  ls_l3 = '00000' + ls_l3
//			  ls_l3 = right(ls_l3,4)
//			  this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//			  this.object.l3[1] = ls_l3
//		  else
//			  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			  return	1		
//		  end if
// 	case 'l4'
//		  	if dw_1.object.qa_rule[dw_1.getrow()] = 'Y' then // 표준규격
//			   if isnumber(ls_l4) then
//				   ls_l4 = '00000' + ls_l4
//				   ls_l4 = right(ls_l4,5)
//				   this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + ls_l4
//				   this.object.l4[1] = ls_l4
//			   else
//			 	  messagebox('오류' , '잘못입력하셨습니다.',exclamation!)
//			 	  return	1		
//			   end if
//			   ls_qa1 = this.object.qa[1]
//			else
//				this.object.qa[1] = ls_l1 + "X" + ls_l2 + "X" + ls_l3 + "X" + trim(ls_l4)
//			   this.object.l4[1] = trim(ls_l4)
//		  end if
//end choose
//
end event

event itemerror;//string ls_data,ls_item
//
//setnull(ls_data)
//choose case dwo.name
//	case 'target_item'
//        this.object.target_item[row] = ls_data
//	case 'target_qa'
//		  this.object.target_qa[row] = ls_data
//end choose
//
//return 2
end event

event losefocus;//IF THIS.ROWCOUNT() < 1 THEN RETURN
//this.accepttext()
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_no', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_no'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'item_name', tab_1.tabpage_1.dw_5.getitemstring(1, 'item_name'))
//tab_1.tabpage_2.dw_6.SetItem(1, 'qa', tab_1.tabpage_1.dw_5.getitemstring(1, 'qa'))
//
end event

event retrieveend;//this.accepttext()
//
//if this.getrow() > 0 then
//	ist_item.loc_no = this.object.loc_no[1]
//	ist_item.count_code = this.object.count_code[1]
//	ist_item.obsolete_code = this.object.obsolete_code[1]
//	ist_item.lot = this.object.lot[1]
//	ist_item.leadtime = this.object.leadtime[1]
//	ist_item.reorder = this.object.reorder[1]
//	ist_item.safety_stock = this.object.safety_stock[1]
//end if
end event

type st_4 from statictext within w_cddesign_bogo_m
integer x = 73
integer y = 292
integer width = 174
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

type ddlb_fld from dropdownlistbox within w_cddesign_bogo_m
integer x = 261
integer y = 276
integer width = 480
integer height = 632
integer taborder = 260
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

type ddlb_dwtitles from dropdownlistbox within w_cddesign_bogo_m
integer x = 265
integer y = 284
integer width = 311
integer height = 88
integer taborder = 280
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

type st_5 from statictext within w_cddesign_bogo_m
integer x = 777
integer y = 292
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

type sle_value from singlelineedit within w_cddesign_bogo_m
integer x = 1266
integer y = 284
integer width = 567
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_3 from commandbutton within w_cddesign_bogo_m
integer x = 1847
integer y = 284
integer width = 160
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "필터"
end type

event clicked;//
datawindow arg_dw

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
//	arg_dw  = dw_4
end if
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

type cb_4 from commandbutton within w_cddesign_bogo_m
integer x = 2011
integer y = 284
integer width = 160
integer height = 76
integer taborder = 220
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	//arg_dw  = dw_4
end if
GF_DW2UnFilter( arg_dw )

end event

type cb_5 from commandbutton within w_cddesign_bogo_m
integer x = 2176
integer y = 284
integer width = 160
integer height = 76
integer taborder = 240
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
//	arg_dw  = dw_4
end if
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_6 from commandbutton within w_cddesign_bogo_m
integer x = 2341
integer y = 284
integer width = 160
integer height = 76
integer taborder = 270
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

if is_dw = "dw_1" then
	arg_dw  = dw_1
else
	//arg_dw  = dw_4
end if
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type pb_1 from picturebutton within w_cddesign_bogo_m
event mousemove pbm_mousemove
string tag = "파일"
boolean visible = false
integer x = 2487
integer y = 52
integer width = 187
integer height = 144
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "CrossTab!"
alignment htextalign = right!
string powertiptext = "파일로저장시킵니다."
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

String  ls_Docname, ls_Named, ls_ExpandName
Integer ls_Value,   li_Pos,   li_value
DataWindow ldw_sel

if GF_Permission('물품코드관리자', gs_userid) = 'Y' then
else
	MessageBox("확인","물품코드 관리자만 내보내기 작업을 할 수 잇습니다.")
	RETURN
end if

if is_dw = "dw_1" then
	ldw_sel = dw_1
else
	//ldw_sel = dw_4
end if

if ldw_sel.rowcount() > 0 then
	ls_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", "엑셀 (*.xls), *.xls," + "CSV(쉽표로 분리), *.csv,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if ls_Value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			ldw_sel.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			ldw_sel.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type st_vertical from u_splitbar_vertical within w_cddesign_bogo_m
integer x = 2231
integer y = 400
integer height = 2120
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
//st_horizontal.width = dw_4.width

end event

type st_horizontal from u_splitbar_horizontal within w_cddesign_bogo_m
integer x = 2258
integer y = 412
integer width = 2213
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cddesign_bogo_m
integer x = 951
integer y = 280
integer width = 306
integer height = 500
integer taborder = 90
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

type pb_photo_insert from picturebutton within w_cddesign_bogo_m
event mousemove pbm_mousemove
string tag = "파일"
boolean visible = false
integer x = 4151
integer y = 256
integer width = 146
integer height = 116
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "Custom033!"
alignment htextalign = right!
string powertiptext = "프로젝트 사진올리기"
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"프로젝트사진 올리기",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long li_rtn, li_cnt
string ls_ext, ls_null, ls_nullarray[]
string ls_project_code
blob   lb_picture

	li_rtn = GetFileOpenName("Select File", is_path, is_files[], "jpg", &
								  + "Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.pdf), *.bmp;*.gif;*.jpg;*.jpeg;*.pdf")


is_project_code = tab_1.tabpage_1.dw_5.object.project_code[1]

WF_Images_SAVE()


tab_1.tabpage_1.p_1.setredraw( false )

SELECTBLOB photo 
       INTO :lb_picture 
      FROM msale_project WHERE project_code = :is_project_code;
		
if sqlca.sqlcode = 100 then
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
else
	tab_1.tabpage_1.p_1.SetPicture( lb_picture )
end if
tab_1.tabpage_1.p_1.setredraw( true )	
end event

type pb_photo_delete from picturebutton within w_cddesign_bogo_m
event mousemove pbm_mousemove
string tag = "파일"
boolean visible = false
integer x = 4297
integer y = 256
integer width = 146
integer height = 116
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
string powertiptext = "프로젝트 사진지우기"
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"프로젝트사진 지우기",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long li_rtn
string ls_ext, ls_null, ls_nullarray[]
blob   blob_null

li_rtn = messagebox("확인", "삭제할까요?", Question!, YesNo!,2)

if li_rtn = 1 then

	setnull(blob_null)
	
	tab_1.tabpage_1.p_1.setredraw( false )
	
	UPDATE msale_project
			SET photo = :blob_null
		 WHERE project_code = :is_project_code;
		 
	commit;
	
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
		
	tab_1.tabpage_1.p_1.setredraw( true )	

end if	
end event

type st_6 from statictext within w_cddesign_bogo_m
boolean visible = false
integer x = 2505
integer y = 292
integer width = 1554
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "※수리이력 출력은 옆에 프린터 버튼을 클릭해주세요"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_picture_check from checkbox within w_cddesign_bogo_m
boolean visible = false
integer x = 2853
integer y = 124
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "사진조회,출력"
boolean checked = true
end type

type rb_1 from radiobutton within w_cddesign_bogo_m
integer x = 1408
integer y = 72
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체"
end type

type rb_2 from radiobutton within w_cddesign_bogo_m
integer x = 1819
integer y = 72
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "종결제외"
boolean checked = true
end type

type rb_3 from radiobutton within w_cddesign_bogo_m
integer x = 2277
integer y = 72
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "종결"
end type

