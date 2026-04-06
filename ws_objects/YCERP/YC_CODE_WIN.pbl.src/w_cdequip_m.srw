$PBExportHeader$w_cdequip_m.srw
$PBExportComments$설비코드등록(2018/01/08- 조원석)
forward
global type w_cdequip_m from w_inheritance
end type
type dw_3 from datawindow within w_cdequip_m
end type
type tab_1 from tab within w_cdequip_m
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
type dw_6 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_6 dw_6
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
type tab_1 from tab within w_cdequip_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type st_2 from statictext within w_cdequip_m
end type
type st_4 from statictext within w_cdequip_m
end type
type ddlb_fld from dropdownlistbox within w_cdequip_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdequip_m
end type
type st_5 from statictext within w_cdequip_m
end type
type sle_value from singlelineedit within w_cdequip_m
end type
type cb_3 from commandbutton within w_cdequip_m
end type
type cb_4 from commandbutton within w_cdequip_m
end type
type cb_5 from commandbutton within w_cdequip_m
end type
type cb_6 from commandbutton within w_cdequip_m
end type
type pb_1 from picturebutton within w_cdequip_m
end type
type st_vertical from u_splitbar_vertical within w_cdequip_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdequip_m
end type
type ddlb_op from dropdownlistbox within w_cdequip_m
end type
type dw_area from datawindow within w_cdequip_m
end type
type st_1 from statictext within w_cdequip_m
end type
type dw_wc from datawindow within w_cdequip_m
end type
type st_3 from statictext within w_cdequip_m
end type
type pb_photo_insert from picturebutton within w_cdequip_m
end type
type pb_photo_delete from picturebutton within w_cdequip_m
end type
type dw_4 from datawindow within w_cdequip_m
end type
type st_6 from statictext within w_cdequip_m
end type
type cbx_picture_check from checkbox within w_cdequip_m
end type
end forward

global type w_cdequip_m from w_inheritance
integer width = 5728
integer height = 2684
string title = "설비코드 관리(w_cdequip_m)"
long backcolor = 79219928
dw_3 dw_3
tab_1 tab_1
st_2 st_2
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
dw_area dw_area
st_1 st_1
dw_wc dw_wc
st_3 st_3
pb_photo_insert pb_photo_insert
pb_photo_delete pb_photo_delete
dw_4 dw_4
st_6 st_6
cbx_picture_check cbx_picture_check
end type
global w_cdequip_m w_cdequip_m

type variables
gs_item ist_item
string  is_dw, is_dw1sql, is_dw3sql, is_equip_code
string  is_chk = "1", is_chk2 = "1"
integer  i_tabpage

string is_file, is_path, is_files[]
long   il_maxHeight, il_maxWidth
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
		from equip 
		WHERE equip_code = :is_equip_code;
			
		if l_count = 0 then
			Messagebox("확인","설비코드를 먼저 불러오신 후, 사진을 업로드하세요.")
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
		
		UPDATEBlob equip
			SET photo = :blob_totalfile
		 WHERE equip_code = :is_equip_code;
		 
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

on w_cdequip_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.tab_1=create tab_1
this.st_2=create st_2
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
this.dw_area=create dw_area
this.st_1=create st_1
this.dw_wc=create dw_wc
this.st_3=create st_3
this.pb_photo_insert=create pb_photo_insert
this.pb_photo_delete=create pb_photo_delete
this.dw_4=create dw_4
this.st_6=create st_6
this.cbx_picture_check=create cbx_picture_check
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.ddlb_fld
this.Control[iCurrent+6]=this.ddlb_dwtitles
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.sle_value
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.cb_6
this.Control[iCurrent+13]=this.pb_1
this.Control[iCurrent+14]=this.st_vertical
this.Control[iCurrent+15]=this.st_horizontal
this.Control[iCurrent+16]=this.ddlb_op
this.Control[iCurrent+17]=this.dw_area
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.dw_wc
this.Control[iCurrent+20]=this.st_3
this.Control[iCurrent+21]=this.pb_photo_insert
this.Control[iCurrent+22]=this.pb_photo_delete
this.Control[iCurrent+23]=this.dw_4
this.Control[iCurrent+24]=this.st_6
this.Control[iCurrent+25]=this.cbx_picture_check
end on

on w_cdequip_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.tab_1)
destroy(this.st_2)
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
destroy(this.dw_area)
destroy(this.st_1)
destroy(this.dw_wc)
destroy(this.st_3)
destroy(this.pb_photo_insert)
destroy(this.pb_photo_delete)
destroy(this.dw_4)
destroy(this.st_6)
destroy(this.cbx_picture_check)
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

dw_2.visible = false
dw_3.visible = false

if GF_Permission('설비코드관리자', gs_userid) = 'Y' then
//	dw_4.Object.use_flag.TabSequence = 10
//	tab_1.tabpage_1.dw_5.Object.use_flag.TabSequence = 10
end if

dw_3.settransobject(sqlca)	
//dw_4.settransobject(sqlca)
tab_1.tabpage_1.dw_5.settransobject(sqlca)
tab_1.tabpage_2.dw_6.settransobject(sqlca)
tab_1.tabpage_3.dw_10.settransobject(sqlca)
tab_1.tabpage_4.dw_11.settransobject(sqlca)
tab_1.tabpage_5.dw_12.settransobject(sqlca)
//tab_1.tabpage_6.dw_13.settransobject(sqlca)
//dw_1.retrieve()

dw_area.settransobject(sqlca)
dw_area.insertrow(0)  
//dw_area.object.area[1] = gs_area
dw_area.object.area[1] = '%    전체'

dw_wc.settransobject(sqlca)
dw_wc.insertrow(0)
dw_wc.object.wc_no[1] = '%  전체'

//is_dw1sql = dw_1.describe("datawindow.table.select")
//is_dw3sql = dw_3.describe("datawindow.table.select")

string ls_path = 'C:\BMP\'

IF DirectoryExists(ls_path) = FALSE THEN
	CreateDirectory(ls_path)
END IF
		
pb_retrieve.triggerevent( clicked! )

tab_1.tabpage_1.dw_5.ReSet()
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

end event

type pb_save from w_inheritance`pb_save within w_cdequip_m
integer x = 4055
integer taborder = 100
end type

event pb_save::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dwitemstatus l_status
			
string	  ls_REPAIR_COM, ls_REPAIR_NAME, ls_REPAIR_TEL, ls_REPAIR_REASON, ls_REPAIR_TEXT, ls_MANAGE_NAME
string   ls_factory, ls_wc_no, ls_equip_code, ls_write, ls_repair_date, l_equip_data[6] = {'최대속도','설비생산속도','목표생산속도','최대CAPA','현재CAPA','목표CAPA'}
string   ls_make_com, ls_make_date, ls_setting_com, ls_setting_date, ls_equip_name, ls_area, ls_wc, ls_wc_kind, ls_wc_ex, ls_re_wc
decimal  lr_price
datetime ldt_today
long     l_row, ll_row, li_chk, l_count, l_equip_code
integer  li_pat



//[modified,1998/06/07,이인호] qa1 : 길이를 "00000"로 넣은 필드 

dw_1.accepttext()

if tab_1.tabpage_1.dw_5.getrow() < 1 then return

if i_tabpage = 1 then
	
	if MessageBox("저장","저장하시겠습니까?",question!,okcancel!,1) = 2 then return
	
	tab_1.tabpage_1.dw_5.accepttext()
	
	l_status   = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)
	ls_factory = LeftA(trim(tab_1.tabpage_1.dw_5.getitemstring(1, "factory")),1)
	ls_re_wc   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "re_wc"))
	lr_price   = tab_1.tabpage_1.dw_5.getitemdecimal(1, "price")
	
	ls_make_com   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "make_com"))
	ls_make_date   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "make_date"))
	ls_setting_com   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "setting_com"))
	ls_setting_date   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "setting_date"))
	ls_equip_name = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "equip_name"))
	

	ls_equip_code   = trim(tab_1.tabpage_1.dw_5.getitemstring(1, "equip_code"))
	
	if isnull(ls_factory) or ls_factory = "" then
		MessageBox("저장오류","사업장은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('shipto_addr')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if			
	
	if isnull(ls_re_wc) or ls_re_wc = "" then
		MessageBox("저장오류","작업장은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('re_wc')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if					
	
	if isnull(ls_equip_name) or ls_equip_name = "" then
		MessageBox("저장오류","설비명은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('equip_name')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if						
	
	if isnull(lr_price) or lr_price = 0 then
		MessageBox("저장오류","구입가격은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('price')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if					
	
	if isnull(ls_make_com) or ls_make_com = "" then
		MessageBox("저장오류","제조자명은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('make_com')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if						

	if isnull(ls_make_date) or ls_make_date = "" then
		MessageBox("저장오류","제조년월일은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('make_date')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if						
	
	if isnull(ls_setting_com) or ls_setting_com = "" then
		MessageBox("저장오류","설치업체는 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('setting_com')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if						
	
	if isnull(ls_setting_date) or ls_setting_date = "" then
		MessageBox("저장오류","설치년월일은 필수 입력사항입니다!",stopsign!)
		tab_1.tabpage_1.dw_5.setcolumn('setting_date')
		tab_1.tabpage_1.dw_5.setfocus()
		RETURN
	end if							
	
	
	
	if wf_nullchk(tab_1.tabpage_1.dw_5) = false then return
	
	/* 2018.01.10					  			  조원석  */
	/* 신규일때 설비코드 따옴							 */
	/* 설비코드 규칙 : 사업장코드(첫자) + (max+1) */
	
	if l_status = newmodified! or l_status = new! then

	 
//	       SELECT CONVERT(CHAR(5), MAX( CONVERT( decimal(5), SUBSTRING(ltrim(EQUIP_CODE), 2, 5) ) ) + 1 )
	       SELECT MAX( CONVERT( decimal(5), SUBSTRING(ltrim(EQUIP_CODE), 2, 5) ) ) + 1		  
		  INTO :l_equip_code
		  FROM EQUIP
		  WHERE EQUIP_CODE LIKE :ls_factory + '%';
			  
		  if L_EQUIP_CODE = 0 OR ISNULL(L_EQUIP_CODE) THEN
				LS_EQUIP_CODE = '00001'
		   else
				LS_EQUIP_CODE = string(L_EQUIP_CODE,'00000')
		  END IF
		  
		  LS_EQUIP_CODE = LS_FACTORY+LS_EQUIP_CODE
		  is_equip_code = LS_EQUIP_CODE

		  ls_write = string(wf_today(), 'yyyymmdd')
			
			
		  tab_1.tabpage_1.dw_5.object.equip_code[1] = ls_equip_code
		  tab_1.tabpage_1.dw_5.object.write_date[1] = ls_write
		  tab_1.tabpage_1.dw_5.object.write_id[1]   = gs_userid
  		  tab_1.tabpage_1.dw_5.object.use_yn[1]   = 'Y'


        	  ls_wc_kind = LeftA(tab_1.tabpage_1.dw_5.object.wc[1],1)
  		  ls_wc_ex = string(tab_1.tabpage_1.dw_5.object.wc_ex[1],'00')
			 
		  select WORK_NO
    		      into :ls_wc_no
		    from wc
		  where  WORK_NO  like '%'+:ls_wc_kind+'%'
		      and WORK_NAME LIKE '%'+:ls_wc_ex+'%';
			 
			 
		  if ls_wc_no = '' or isnull(ls_wc_no) then
			  tab_1.tabpage_1.dw_5.object.wc[1] =  tab_1.tabpage_1.dw_5.object.re_ex[1]
		  else
			  tab_1.tabpage_1.dw_5.object.wc[1] = ls_wc_no			
		  end if
		  
		  is_equip_code = ls_equip_code
		  
		  tab_1.tabpage_2.dw_6.reset()		  
		 for l_row =  1 to 18
			
		  	ll_row= tab_1.tabpage_2.dw_6.InsertRow(0)
			tab_1.tabpage_2.dw_6.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
			tab_1.tabpage_2.dw_6.object.kind[ll_row] = '1'
			tab_1.tabpage_2.dw_6.object.seq[ll_row] = STRING(l_row, '000')
			
			/*최대속도, 설비생산속도, 목표생산속도, 최대CAPA, 현재 CAPA, 목표CAPA*/
			if ll_row <= 6 then 
				tab_1.tabpage_2.dw_6.object.equip_data[ll_row] = l_equip_data[ll_row]
			end if
			
   		 next	
			
		 tab_1.tabpage_3.dw_10.reset()
		 
		 for l_row =  1 to 10
					
			ll_row= tab_1.tabpage_3.dw_10.InsertRow(0)
			tab_1.tabpage_3.dw_10.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
			tab_1.tabpage_3.dw_10.object.kind[ll_row] = '2'
			tab_1.tabpage_3.dw_10.object.seq[ll_row] = STRING(l_row, '000')
						
		 next
		 		 
		 
		 tab_1.tabpage_4.dw_11.reset()
		 
		 for l_row =  1 to 5
						
				ll_row= tab_1.tabpage_4.dw_11.InsertRow(0)
				tab_1.tabpage_4.dw_11.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
				tab_1.tabpage_4.dw_11.object.kind[ll_row] = '3'
				tab_1.tabpage_4.dw_11.object.seq[ll_row] = STRING(l_row, '000')
							
		 next			
		
		
		if WF_Update4( tab_1.tabpage_1.dw_5,  tab_1.tabpage_2.dw_6, tab_1.tabpage_3.dw_10, tab_1.tabpage_4.dw_11,  'Y' ) = true then
		end if
	else
		
		
        	  ls_wc_kind = LeftA(tab_1.tabpage_1.dw_5.object.wc[1],1)
  		  ls_wc_ex = string(tab_1.tabpage_1.dw_5.object.wc_ex[1],'00')
			 
		  select WORK_NO
    		      into :ls_wc_no
		    from wc
		  where  WORK_NO  like '%'+:ls_wc_kind+'%'
		      and WORK_NAME LIKE '%'+:ls_wc_ex+'%';
			 
			 
		  if ls_wc_no = '' or isnull(ls_wc_no) then
			  tab_1.tabpage_1.dw_5.object.wc[1] =  tab_1.tabpage_1.dw_5.object.re_ex[1]
		  else
			  tab_1.tabpage_1.dw_5.object.wc[1] = ls_wc_no			
		  end if		
		
		WF_Update4( tab_1.tabpage_1.dw_5,  tab_1.tabpage_2.dw_6, tab_1.tabpage_3.dw_10, tab_1.tabpage_4.dw_11,  'Y' )
	end if

elseif i_tabpage = 2 then
	
//	tab_1.tabpage_2.dw_6.accepttext()
//	
//	for ll_row = 1 to tab_1.tabpage_2.dw_6.rowcount() 
//		
//		l_status = tab_1.tabpage_2.dw_6.getitemstatus(ll_row, 0, primary!)
//		
//		if l_status = newmodified! OR l_status = new! then
//			tab_1.tabpage_2.dw_6.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//			tab_1.tabpage_2.dw_6.object.kind[ll_row] = '1'
//			tab_1.tabpage_2.dw_6.object.seq[ll_row] = ll_row
//		end if
//		
//	next

		if WF_Update1( tab_1.tabpage_2.dw_6, 'Y' ) = true then
		end if
	
	
elseif i_tabpage = 3 then	
	
	if WF_Update1( tab_1.tabpage_3.dw_10, 'Y' ) = true then
	end if
	
elseif i_tabpage = 4 then		
	
	if WF_Update1( tab_1.tabpage_4.dw_11, 'Y' ) = true then
	end if	
	
elseif i_tabpage = 5 then	
	
	/*순번 먹이는 로직 2018.01.11 조원석 시작 */
	tab_1.tabpage_5.dw_12.accepttext()
	
	for ll_row = 1 to tab_1.tabpage_5.dw_12.rowcount() 
		
		l_status = tab_1.tabpage_5.dw_12.getitemstatus(ll_row, 0, primary!)
		
		
		if l_status = newmodified! OR l_status = new! then
			
		     ls_repair_date   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "repair_date"))	
			lr_price   =	tab_1.tabpage_5.dw_12.getitemdecimal(ll_row, "repair_price")
			ls_REPAIR_COM   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "REPAIR_COM"))			
			ls_REPAIR_NAME   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "REPAIR_NAME"))
			ls_REPAIR_TEL   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "REPAIR_TEL"))
			ls_REPAIR_REASON   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "REPAIR_REASON"))
			ls_REPAIR_TEXT   = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "REPAIR_TEXT"))
			ls_MANAGE_NAME = trim(tab_1.tabpage_5.dw_12.getitemstring(ll_row, "MANAGE_NAME"))			
			
			l_count = 0
			
			for l_row = 1 to ll_row
		
				if ls_repair_date = tab_1.tabpage_5.dw_12.object.repair_date[l_row]	then
					l_count = l_count + 1;
				end if
				
			next		
			
			tab_1.tabpage_5.dw_12.object.seq[ll_row] = l_count			

			
			if isnull(ls_repair_date) or ls_repair_date = "" then
				MessageBox("저장오류","수리일자는 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('repair_date')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if			
			
			if isnull(ls_REPAIR_COM) or ls_REPAIR_COM = "" then
				MessageBox("저장오류","수리업체명 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_COM')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if		
			
			if isnull(ls_REPAIR_NAME) or ls_REPAIR_NAME = "" then
				MessageBox("저장오류","수리담당자는 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_NAME')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if		
			
			if isnull(ls_REPAIR_TEL) or ls_REPAIR_TEL = "" then
				MessageBox("저장오류","수리업체연락처는 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_TEL')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if		
			
			if isnull(ls_REPAIR_REASON) or ls_REPAIR_REASON = "" then
				MessageBox("저장오류","수리사유는 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_REASON')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if		
			
			if isnull(ls_REPAIR_TEXT) or ls_REPAIR_TEXT = "" then
				MessageBox("저장오류","보완및수리내역은 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_TEXT')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if		
			
			if isnull(lr_price) or lr_price =0 then
				MessageBox("저장오류","소요금액은 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('REPAIR_PRICE')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if					
			
			if isnull(ls_MANAGE_NAME) or ls_MANAGE_NAME = "" then
				MessageBox("저장오류","관리책임자는 필수 입력사항입니다!",stopsign!)
				tab_1.tabpage_5.dw_12.setcolumn('MANAGE_NAME')
				tab_1.tabpage_5.dw_12.setfocus()
				RETURN
			end if								
					
			
		end if
		
	next		
	
	/*순번 먹이는 로직 2018.01.11 조원석 끝 */	
	
	if WF_Update1( tab_1.tabpage_5.dw_12, 'Y' ) = true then
	end if	
	
elseif i_tabpage = 6 then	
	
//	if WF_Update1( tab_1.tabpage_6.dw_13, 'Y' ) = true then
//	end if	
	
end if	


setnull(ls_area)
setnull(ls_wc)

ls_area = TRIM(LeftA(dw_area.object.area[1],5))
ls_wc = TRIM(LeftA(dw_wc.object.wc_no[1],3))

if ls_area = '' or isnull(ls_area) then
	ls_area = '%'
end if

if ls_wc = '' or isnull(ls_wc) then
	ls_wc = '%'
end if

dw_1.retrieve(ls_area, ls_wc)

end event

type dw_1 from w_inheritance`dw_1 within w_cdequip_m
integer x = 27
integer y = 400
integer width = 2194
integer height = 2120
integer taborder = 10
string title = "GROUPITEM"
string dataobject = "d_cdequip_t"
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

event dw_1::clicked;call super::clicked;string ls_equip_code
long l_row = 0, ll_row, ll_FileLength, ll_fp = 32765, li_loops
Blob   lb_picture, lb_pictemp, blob_totalfile, blob_file, blob_null
int      li_FileFP,  i


if row = 0 then return

this.scrolltorow( row )

is_dw = "dw_1"
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()

is_equip_code = this.object.equip_equip_code[row]

l_row = tab_1.tabpage_1.dw_5.retrieve(is_equip_code)

if l_row = 0 then
	tab_1.tabpage_1.dw_5.ReSet()
	ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)	
	tab_1.tabpage_1.dw_5.ScrollToRow(ll_row)
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"	
end if

tab_1.tabpage_2.dw_6.retrieve(is_equip_code)
tab_1.tabpage_3.dw_10.retrieve(is_equip_code)
tab_1.tabpage_4.dw_11.retrieve(is_equip_code)
tab_1.tabpage_5.dw_12.retrieve(is_equip_code)

tab_1.tabpage_1.p_1.setredraw( false )


if cbx_picture_check.checked then
		setnull(lb_picture)
		
		SELECTBLOB photo 
				 INTO :lb_picture 
				FROM equip WHERE equip_code = :is_equip_code;			
		
		if sqlca.sqlcode = 100 then	
			tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
		else	
			if isnull(lb_picture) then
				tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"		
			else	
				
					tab_1.tabpage_1.p_1.SetPicture( lb_picture )
				
			end if
			
		/*	WF_Images_Resize( tab_1.tabpage_1.p_1 )*/
		end if
		
else		
		tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
		
end if				



tab_1.tabpage_1.p_1.setredraw( true )	
end event

type st_title from w_inheritance`st_title within w_cdequip_m
integer x = 37
integer y = 28
integer width = 1029
integer height = 132
string text = "설비코드 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdequip_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdequip_m
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

type pb_print_part from w_inheritance`pb_print_part within w_cdequip_m
boolean visible = false
integer x = 3986
integer y = 256
integer width = 165
integer height = 120
integer taborder = 130
end type

event pb_print_part::clicked;call super::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string ls_sql, ls_where
long   l_dw4_rowcount, l_row, l_page, i

dw_4.settransobject(sqlca)
dw_4.retrieve(is_equip_code)

l_dw4_rowcount = dw_4.rowcount()

if l_dw4_rowcount > 0 then
	
	l_row = mod(l_dw4_rowcount, 16)
	l_page = round( l_dw4_rowcount / 16, 0)
	
	if l_row > 0 then	
		l_page = l_page + 1		
	else
		l_page = l_page
	end if

else	
	
	l_page = 1
	
end if


for i = 1 to (l_page*16 - l_dw4_rowcount)
	dw_4.insertrow(0)
next


l_print.st_datawindow  = dw_4
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 수리이력을 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//gs_print_control = 'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"수리이력인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_cdequip_m
integer x = 4247
integer taborder = 120
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdequip_m
integer x = 3863
integer taborder = 60
end type

event pb_print::clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "P", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

gs_codere_str lst_code
w_repsuper w_print
st_print   l_print
string  ls_sql, ls_where, ls_path, ls_file
blob    lb_picture, blob_temp
LONG    ll_filelen, li_loop, i, l_dw4_rowcount, l_page, l_row
integer i_file
boolean l_ret

//openwithparm(w_whitem_w, lst_code)
//lst_code = message.powerobjectparm
//if lst_code.okcancel = 'N' then return
//
//if lst_code.flag = 'A' then
//	ls_sql = "datawindow.table.select = '" + is_dw3sql + "'"
//else
//	ls_where = " and item.item_no between ~~'" + lst_code.start_no + "~~' and " + &
//				  "~~'" + lst_code.end_no + "~~'"
//	ls_sql = "datawindow.table.select = '" + is_dw3sql + ls_where + "'"
//end if
//
//dw_3.settransobject(sqlca)
//dw_3.modify(ls_sql)

dw_3.retrieve(is_equip_code)

if cbx_picture_check.checked then

	SELECTBLOB photo 
	 INTO :lb_picture 
	 FROM equip 
	WHERE equip_code = :is_equip_code;
	
	if isnull(lb_picture) = false then
		
		ll_filelen = LenA(lb_picture)
		
		if ll_filelen > 32765 then
			
			if mod(ll_filelen,32765) = 0 then
				  li_loop = ll_filelen / 32765
			else
				  li_loop = (ll_filelen/32765) + 1
			end if
			
		else
			li_loop = 1
		end if
		
		ls_path = 'C:\bmp\EQUIP.JPG'
		
		l_ret = Filedelete(ls_path)	
		
		i_file = FileOpen(ls_path, StreamMode!, Write!, lockwrite!, append!)
	
		for i = 1 to li_loop
			 if i = li_loop then
					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1)
			 else
					 blob_temp = BlobMid(lb_picture, (i - 1) * 32765 + 1,32765)
			 end if
			 FileWrite(i_file, blob_temp)
		next
		
		Fileclose(i_file)
		
		//dw_3.Modify("p_equip.filename = '"+ls_path+"'")
		//dw_3.object.p_equip.filename = 'C:\bmp\EQUIP.JPG'
		dw_3.object.p_equip.visible = true
		dw_3.object.p_equip1.visible = false
	
	else	
		
		//ls_path = 'C:\BMP\YC_150X150.JPG'
		
		//dw_3.Modify("p_equip.filename = '"+ls_path+"'")
		
		dw_3.object.p_equip.visible = false
		dw_3.object.p_equip1.visible = true
		
	end if

else
	
	//ls_path = 'C:\BMP\YC_150X150.JPG'
	
	//dw_3.Modify("p_equip.filename = '"+ls_path+"'")	
	dw_3.object.p_equip.visible = false
	dw_3.object.p_equip1.visible = true
		
end if


if dw_3.rowcount() < 1 then return

l_print.st_datawindow  = dw_3
l_print.st_print_sheet = " 프린트용지 : A4"
l_print.st_print_desc  = " 이 프로그램은 설비카드를 출력합니다." 
//
//// LANDSCAPE:1, PORTRAIT:2
//// SIZE 9-A4, 12-B4
//gs_print_control = 'DataWindow.Print.Orientation=2 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=100'
//gs_print_control = 'Datawindow.Zoom=100'
opensheetwithparm(w_print, l_print, parentwindow(), 1, Original!)
end event

type pb_cancel from w_inheritance`pb_cancel within w_cdequip_m
boolean visible = false
integer x = 2702
integer taborder = 230
end type

type pb_delete from w_inheritance`pb_delete within w_cdequip_m
integer x = 3675
integer taborder = 40
end type

event pb_delete::clicked;dwitemstatus l_status
long ll_row

tab_1.tabpage_1.dw_5.accepttext()

l_status = tab_1.tabpage_1.dw_5.getitemstatus(1, 0, primary!)


if l_status = new! or l_status = newmodified! then
	
	tab_1.tabpage_1.dw_5.reset()
	tab_1.tabpage_2.dw_6.reset()
	tab_1.tabpage_3.dw_10.reset()
	tab_1.tabpage_4.dw_11.reset()
	
elseif messagebox("삭제","삭제하시겠습니까?",question!,okcancel!,2) = 1 then
	
	if i_tabpage = 1 then
		
		tab_1.tabpage_1.dw_5.deleterow(1)
		
		if wf_update1(tab_1.tabpage_1.dw_5, 'Y') = true then
			
			DELETE EQUIPDET 
			WHERE equip_code = :is_equip_code;
			
//			tab_1.tabpage_2.dw_6.accepttext()
//			
//			if tab_1.tabpage_2.dw_6.rowcount() <= 0 then return
//			
//			for ll_row = 1 to 18
//				
//				tab_1.tabpage_2.dw_6.deleterow(ll_row)
//				
//			next				
//	
//			
//			tab_1.tabpage_3.dw_10.accepttext()
//			
//			if tab_1.tabpage_3.dw_10.rowcount() <= 0 then return
//			
//			for ll_row = 1 to 10
//				
//				tab_1.tabpage_3.dw_10.deleterow(ll_row)
//				
//			next	
//			
//			tab_1.tabpage_4.dw_11.accepttext()
//			
//			if tab_1.tabpage_4.dw_11.rowcount() <= 0 then return
//			
//			for ll_row = 1 to 5
//				
//				tab_1.tabpage_4.dw_11.deleterow(ll_row)
//				
//			next				
//			
//			
//			
//			wf_update3(tab_1.tabpage_2.dw_6, tab_1.tabpage_3.dw_10, tab_1.tabpage_4.dw_11,  'Y')			
			
		end if
		
//	elseif i_tabpage = 2 then
//	
//			tab_1.tabpage_2.dw_6.deleterow(tab_1.tabpage_2.dw_6.getrow())
//			wf_update1(tab_1.tabpage_2.dw_6, 'Y')
//	
//	elseif i_tabpage = 3 then		
//
//			tab_1.tabpage_3.dw_10.deleterow(tab_1.tabpage_3.dw_10.getrow())
//			wf_update1(tab_1.tabpage_3.dw_10, 'Y')
//			
//	elseif i_tabpage = 4 then		
//
//			tab_1.tabpage_4.dw_11.deleterow(tab_1.tabpage_4.dw_11.getrow())
//			wf_update1(tab_1.tabpage_4.dw_11, 'Y')			
			
	elseif i_tabpage = 5 then

			tab_1.tabpage_5.dw_12.deleterow(tab_1.tabpage_5.dw_12.getrow())
			wf_update1(tab_1.tabpage_5.dw_12, 'Y')						
			
//	elseif i_tabpage = 6 then		

//			tab_1.tabpage_6.dw_13.deleterow(tab_1.tabpage_6.dw_13.getrow())
//			wf_update1(tab_1.tabpage_6.dw_13, 'Y')									
		
	end if		

end if
	

pb_retrieve.PostEvent( clicked! )

//if i_tabpage = 1 then
//	tab_1.tabpage_1.dw_5.ReSet()
//	tab_1.tabpage_2.dw_6.ReSet()
//	tab_1.tabpage_3.dw_10.ReSet()
//	
//	ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)	
//	tab_1.tabpage_1.dw_5.setfocus()
//	tab_1.tabpage_1.dw_5.setrow(ll_row)
//	tab_1.tabpage_1.dw_5.setcolumn('factory')
//	
//elseif i_tabpage = 2 then	
//	ll_row= tab_1.tabpage_2.dw_6.InsertRow(0)
//	tab_1.tabpage_2.dw_6.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_2.dw_6.object.kind[ll_row] = '1'
//	tab_1.tabpage_2.dw_6.object.seq[ll_row] = STRING(ll_row, '000')
////	tab_1.tabpage_2.dw_6.ScrollToRow(ll_row)		
//	
//	tab_1.tabpage_2.dw_6.setfocus()
//	tab_1.tabpage_2.dw_6.setrow(ll_row)
//	tab_1.tabpage_2.dw_6.setcolumn('equip_data')
//	
//elseif i_tabpage = 3 then	
//	ll_row= tab_1.tabpage_3.dw_10.InsertRow(0)
//	tab_1.tabpage_3.dw_10.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_3.dw_10.object.kind[ll_row] = '2'
//	tab_1.tabpage_3.dw_10.object.seq[ll_row] = STRING(ll_row, '000')
////	tab_1.tabpage_3.dw_10.ScrollToRow(ll_row)			
//
//	tab_1.tabpage_3.dw_10.setfocus()
//	tab_1.tabpage_3.dw_10.setrow(ll_row)
//	tab_1.tabpage_3.dw_10.setcolumn('equip_data')
//	
//end if	
end event

type pb_insert from w_inheritance`pb_insert within w_cdequip_m
integer x = 3488
integer taborder = 30
string disabledname = "c:\bmp\pencil.bmp"
end type

event pb_insert::clicked;call super::clicked;long ll_row

//if dw_1.rowcount() < 1 then return

//tab_1.tabpage_1.dw_5.ReSet()
//tab_1.tabpage_2.dw_6.ReSet()
//tab_1.tabpage_3.dw_10.Reset()
//tab_1.tabpage_4.dw_11.Reset()
//tab_1.tabpage_5.dw_12.Reset()

if i_tabpage = 1 then
	
	tab_1.tabpage_1.dw_5.ReSet()	
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
	
	ll_row = tab_1.tabpage_1.dw_5.InsertRow(0)	
	tab_1.tabpage_1.dw_5.setfocus()
	tab_1.tabpage_1.dw_5.setrow(ll_row)
	tab_1.tabpage_1.dw_5.setcolumn('factory')
//	
//elseif i_tabpage = 2 then	
//		
//	ll_row= tab_1.tabpage_2.dw_6.InsertRow(0)
//	tab_1.tabpage_2.dw_6.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_2.dw_6.object.kind[ll_row] = '1'
//	tab_1.tabpage_2.dw_6.object.seq[ll_row] = STRING(ll_row, '000')
////	tab_1.tabpage_2.dw_6.ScrollToRow(ll_row)		
//	
//	tab_1.tabpage_2.dw_6.setfocus()
//	tab_1.tabpage_2.dw_6.setrow(ll_row)
//	tab_1.tabpage_2.dw_6.setcolumn('equip_data')
//	
//elseif i_tabpage = 3 then	
//	ll_row= tab_1.tabpage_3.dw_10.InsertRow(0)
//	tab_1.tabpage_3.dw_10.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_3.dw_10.object.kind[ll_row] = '2'
//	tab_1.tabpage_3.dw_10.object.seq[ll_row] = STRING(ll_row, '000')
////	tab_1.tabpage_3.dw_10.ScrollToRow(ll_row)			
//
//	tab_1.tabpage_3.dw_10.setfocus()
//	tab_1.tabpage_3.dw_10.setrow(ll_row)
//	tab_1.tabpage_3.dw_10.setcolumn('equip_data')
//	
//elseif i_tabpage = 4 then	
//	tab_1.tabpage_4.dw_11.accepttext()
//	
//	ll_row= tab_1.tabpage_4.dw_11.InsertRow(0)
//	tab_1.tabpage_4.dw_11.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_4.dw_11.object.kind[ll_row] = '3'	
//	tab_1.tabpage_4.dw_11.object.seq[ll_row] = STRING(ll_row, '000')
//
//	tab_1.tabpage_4.dw_11.setfocus()
//	tab_1.tabpage_4.dw_11.setrow(ll_row)
//	tab_1.tabpage_4.dw_11.setcolumn('gubun')
//	
//elseif i_tabpage = 5 then	
  elseif i_tabpage = 5 then		
	tab_1.tabpage_5.dw_12.accepttext()
	
	ll_row= tab_1.tabpage_5.dw_12.InsertRow(0)	
	tab_1.tabpage_5.dw_12.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.

	tab_1.tabpage_5.dw_12.setfocus()
	tab_1.tabpage_5.dw_12.setrow(ll_row)
	tab_1.tabpage_5.dw_12.setcolumn('repair_date')
	
//elseif i_tabpage = 6 then	
//	tab_1.tabpage_6.dw_13.accepttext()
	
//	ll_row= 	tab_1.tabpage_6.dw_13.InsertRow(0)
//	tab_1.tabpage_6.dw_13.object.equip_code[ll_row] = is_equip_code // is_equip_code 는 dw_1 click 받는다.
//	tab_1.tabpage_6.dw_13.setfocus()
//	tab_1.tabpage_6.dw_13.setrow(ll_row)
//	tab_1.tabpage_6.dw_13.setcolumn('YEAR')		
	
end if	
	


//tab_1.tabpage_1.dw_5.object.item_no[ll_row]   = trim(dw_1.object.item_no[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.object.uom[ll_row]       = trim(dw_1.object.uom[dw_1.getrow()])
//tab_1.tabpage_1.dw_5.object.source[ll_row]    = dw_1.object.source[dw_1.getrow()]
//if dw_4.rowcount() > 0 then
	////////////////////////////////////////////////////////////////////////////////////////////////
	//          1
	// 1234567890123456789
	// 000X0000X0000X00000
//	tab_1.tabpage_1.dw_5.object.l1[ll_row]            = left(dw_4.object.qa[dw_4.getrow()], 3)
//	tab_1.tabpage_1.dw_5.object.l2[ll_row]            = mid(dw_4.object.qa[dw_4.getrow()],  5, 4)
//	tab_1.tabpage_1.dw_5.object.l3[ll_row]            = mid(dw_4.object.qa[dw_4.getrow()], 10, 4)
	///////////////////////////////////////////////////////////////////////////////////////////////
//	tab_1.tabpage_1.dw_5.object.loc_no[ll_row]        = ist_item.loc_no
//	tab_1.tabpage_1.dw_5.object.count_code[ll_row]    = ist_item.count_code
//	tab_1.tabpage_1.dw_5.object.obsolete_code[ll_row] = ist_item.obsolete_code
//	tab_1.tabpage_1.dw_5.object.lot[ll_row]           = ist_item.lot
//	tab_1.tabpage_1.dw_5.object.leadtime[ll_row]      = ist_item.leadtime
//	tab_1.tabpage_1.dw_5.object.reorder[ll_row]       = ist_item.reorder
//	tab_1.tabpage_1.dw_5.object.safety_stock[ll_row]  = ist_item.safety_stock
//end if

//tab_1.tabpage_2.dw_6.object.item_no[ll_row]   = trim(dw_1.object.item_no[dw_1.getrow()])
//tab_1.tabpage_2.dw_6.object.item_name[ll_row] = trim(dw_1.object.item_name[dw_1.getrow()])

//if dw_1.object.qa_rule[dw_1.getrow()] = "N" then  // 도료 입력시 비표준 코드입력가능(한글)
//	tab_1.tabpage_1.dw_5.object.qa_rule[1] = "N"
//else
//	tab_1.tabpage_1.dw_5.object.qa_rule[1] = "Y"
//end if
//
//tab_1.tabpage_1.dw_5.SetColumn("l4")
//tab_1.tabpage_1.dw_5.SetFocus()

end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdequip_m
integer x = 3296
integer taborder = 250
end type

event pb_retrieve::clicked;string ls_area, ls_wc


//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

dw_1.reset()
//dw_4.reset()

dw_1.setfilter('')
dw_1.filter()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_2.dw_6.reset()
tab_1.tabpage_3.dw_10.reset()
tab_1.tabpage_4.dw_11.reset()
tab_1.tabpage_5.dw_12.reset()
//tab_1.tabpage_6.dw_13.reset()
tab_1.tabpage_1.p_1.PictureName = "c:\bmp\YC_150X150.jpg"

tab_1.tabpage_1.dw_5.InsertRow(0)	
	

setnull(ls_area)
setnull(ls_wc)

ls_area = TRIM(LeftA(dw_area.object.area[1],5))
ls_wc = TRIM(LeftA(dw_wc.object.wc_no[1],3))

if ls_area = '' or isnull(ls_area) then
	ls_area = '%'
end if

if ls_wc = '' or isnull(ls_wc) then
	ls_wc = '%'
end if

dw_1.retrieve(ls_area, ls_wc)

if dw_1.rowcount() < 1 then return

dw_1.scrolltorow(1)
end event

type gb_3 from w_inheritance`gb_3 within w_cdequip_m
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

type gb_2 from w_inheritance`gb_2 within w_cdequip_m
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

type gb_1 from w_inheritance`gb_1 within w_cdequip_m
integer x = 3278
integer width = 1189
integer taborder = 0
integer weight = 400
long backcolor = 81838264
end type

type dw_2 from w_inheritance`dw_2 within w_cdequip_m
integer x = 1125
integer y = 12
integer width = 119
integer height = 88
integer taborder = 160
boolean vscrollbar = false
end type

type dw_3 from datawindow within w_cdequip_m
boolean visible = false
integer x = 1257
integer y = 12
integer width = 119
integer height = 88
integer taborder = 140
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdequip_r"
boolean livescroll = true
end type

type tab_1 from tab within w_cdequip_m
string tag = "설비코드관리"
integer x = 2258
integer y = 440
integer width = 3378
integer height = 2080
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

if i_tabpage = 1 then
	tab_1.tabpage_1.p_1.visible = true
	pb_print_part.visible = false	
	pb_photo_insert.visible = true
	pb_photo_delete.visible = true 
	
	pb_insert.enabled = true
	pb_insert.visible = true	
	pb_delete.visible = true 
	pb_delete.enabled = true	
	st_6.visible = true
	st_6.text = '※사진업로드,삭제는 옆에 버튼을 이용해주세요.'	
elseif i_tabpage = 5 then
	
	pb_photo_insert.visible = false
	pb_photo_delete.visible = false
	
	pb_insert.enabled = true
	pb_insert.visible = true
	pb_print_part.visible = true
	pb_delete.visible = true 
	pb_delete.enabled = true 
	pb_print_part.x = 4297
	st_6.visible = true
	st_6.text = '※수리이력 출력은 옆에 버튼을 이용해주세요.'	
	
else
	tab_1.tabpage_1.p_1.visible = false
	pb_photo_insert.visible = false
	pb_photo_delete.visible = false
	pb_photo_insert.visible = false
	
	pb_insert.enabled = false
	pb_insert.visible = false
	
	pb_delete.visible = false 
	pb_delete.enabled = false
	pb_print_part.visible = false
	st_6.visible = false
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3342
integer height = 1952
long backcolor = 79741120
string text = "설비코드마스터"
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
integer x = 2450
integer y = 28
integer width = 1481
integer height = 1640
string picturename = "C:\BMP\YC_150X150.jpg"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_5 from datawindow within tabpage_1
integer x = 18
integer y = 4
integer width = 2414
integer height = 1928
integer taborder = 61
string title = "ITEM"
string dataobject = "d_cdequip_m"
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
integer width = 3342
integer height = 1952
long backcolor = 79741120
string text = "주요제원"
long tabtextcolor = 16711680
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 553648127
dw_6 dw_6
end type

on tabpage_2.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_2.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_2
integer x = 18
integer y = 4
integer width = 3026
integer height = 1896
integer taborder = 71
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdequip_m1"
boolean border = false
boolean livescroll = true
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

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3342
integer height = 1952
long backcolor = 79741120
string text = "부속설비"
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
integer width = 4713
integer height = 1872
integer taborder = 10
boolean bringtotop = true
string title = "ITEM"
string dataobject = "d_cdequip_m2"
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

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3342
integer height = 1952
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
integer x = 18
integer y = 112
integer width = 3342
integer height = 1952
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
integer y = 4
integer width = 4507
integer height = 1872
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

type st_2 from statictext within w_cdequip_m
integer x = 82
integer y = 228
integer width = 1312
integer height = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 128
long backcolor = 67108864
string text = "표준규격: 도료 입력시 비표준 코드입력가능(한글)"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cdequip_m
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

type ddlb_fld from dropdownlistbox within w_cdequip_m
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

type ddlb_dwtitles from dropdownlistbox within w_cdequip_m
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

type st_5 from statictext within w_cdequip_m
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

type sle_value from singlelineedit within w_cdequip_m
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

type cb_3 from commandbutton within w_cdequip_m
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

type cb_4 from commandbutton within w_cdequip_m
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

type cb_5 from commandbutton within w_cdequip_m
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

type cb_6 from commandbutton within w_cdequip_m
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

type pb_1 from picturebutton within w_cdequip_m
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

type st_vertical from u_splitbar_vertical within w_cdequip_m
integer x = 2231
integer y = 400
integer height = 2120
boolean bringtotop = true
end type

event mouseup;call super::mouseup;//
st_horizontal.x     = this.x + this.width
//st_horizontal.width = dw_4.width

end event

type st_horizontal from u_splitbar_horizontal within w_cdequip_m
integer x = 2258
integer y = 412
integer width = 2213
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cdequip_m
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

type dw_area from datawindow within w_cdequip_m
integer x = 1833
integer y = 52
integer width = 521
integer height = 72
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
end type

event itemchanged;dwitemstatus l_status
string ls_area 

//this.accepttext()
// 사업장 선택시
//if dw_6.object.area[1] = "B0001" then	// YSP사업장	
//	rb_1.checked = true						// Y.S.P 사업장 품목 필터링
//	rb_1.triggerevent(clicked!)
//else												// S0001 //: 시화
//	rb_2.checked = true						// 시화사업장 품목 필터링
//	rb_2.triggerevent(clicked!)
//end if

//dw_2.accepttext()
//if dw_2.rowcount() < 1 then return
//
//l_status = dw_2.getitemstatus(1, 0, primary!)
//if l_status = newmodified! or l_status = new! then 
//	ls_area = this.object.area[1]
//	if dw_2.object.area_no[1] <> ls_area then
//		if MessageBox("확인", "수주지역을 사업장으로 변경하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//			dw_2.object.area_no[1] = this.object.area[1]
//		end if		
//	end if
//end if
//
// 사업장
//if dw_6.object.area[1] = "B0001" then	// YSP사업장	
//	dw_2.object.ysp_qty2.protect = 0
//	dw_2.object.ysp_qty2.background.color = rgb(255, 255, 255)
//	dw_2.object.ysp_qty.protect  = 0
//	dw_2.object.ysp_qty.background.color  = rgb(255, 255, 255)
//	dw_2.object.color.protect    = 0
//	dw_2.object.color.background.color    = rgb(255, 255, 255)
//	dw_2.object.class.protect    = 0
//	dw_2.object.class.background.color    = rgb(255, 255, 255)
//	dw_2.object.type.protect     = 0
//	dw_2.object.type.background.color     = rgb(255, 255, 255)
//else												// S0001 //: 시화
//	dw_2.object.ysp_qty2.protect = 1
//	dw_2.object.ysp_qty2.background.color = rgb(192,192,192)
//	dw_2.object.ysp_qty.protect  = 1
//	dw_2.object.ysp_qty.background.color  = rgb(192,192,192)
//	dw_2.object.color.protect    = 1
//	dw_2.object.color.background.color    = rgb(192,192,192)
//	dw_2.object.class.protect    = 1
//	dw_2.object.class.background.color    = rgb(192,192,192)
//	dw_2.object.type.protect     = 1
//	dw_2.object.type.background.color     = rgb(192,192,192)
//end if

end event

type st_1 from statictext within w_cdequip_m
integer x = 1426
integer y = 52
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_wc from datawindow within w_cdequip_m
integer x = 1833
integer y = 140
integer width = 594
integer height = 72
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_rewc_s"
boolean border = false
end type

event itemchanged;dwitemstatus l_status
string ls_area 

//this.accepttext()
// 사업장 선택시
//if dw_6.object.area[1] = "B0001" then	// YSP사업장	
//	rb_1.checked = true						// Y.S.P 사업장 품목 필터링
//	rb_1.triggerevent(clicked!)
//else												// S0001 //: 시화
//	rb_2.checked = true						// 시화사업장 품목 필터링
//	rb_2.triggerevent(clicked!)
//end if

//dw_2.accepttext()
//if dw_2.rowcount() < 1 then return
//
//l_status = dw_2.getitemstatus(1, 0, primary!)
//if l_status = newmodified! or l_status = new! then 
//	ls_area = this.object.area[1]
//	if dw_2.object.area_no[1] <> ls_area then
//		if MessageBox("확인", "수주지역을 사업장으로 변경하시겠습니까?", Exclamation!, OKCancel!, 2) = 1 then
//			dw_2.object.area_no[1] = this.object.area[1]
//		end if		
//	end if
//end if
//
// 사업장
//if dw_6.object.area[1] = "B0001" then	// YSP사업장	
//	dw_2.object.ysp_qty2.protect = 0
//	dw_2.object.ysp_qty2.background.color = rgb(255, 255, 255)
//	dw_2.object.ysp_qty.protect  = 0
//	dw_2.object.ysp_qty.background.color  = rgb(255, 255, 255)
//	dw_2.object.color.protect    = 0
//	dw_2.object.color.background.color    = rgb(255, 255, 255)
//	dw_2.object.class.protect    = 0
//	dw_2.object.class.background.color    = rgb(255, 255, 255)
//	dw_2.object.type.protect     = 0
//	dw_2.object.type.background.color     = rgb(255, 255, 255)
//else												// S0001 //: 시화
//	dw_2.object.ysp_qty2.protect = 1
//	dw_2.object.ysp_qty2.background.color = rgb(192,192,192)
//	dw_2.object.ysp_qty.protect  = 1
//	dw_2.object.ysp_qty.background.color  = rgb(192,192,192)
//	dw_2.object.color.protect    = 1
//	dw_2.object.color.background.color    = rgb(192,192,192)
//	dw_2.object.class.protect    = 1
//	dw_2.object.class.background.color    = rgb(192,192,192)
//	dw_2.object.type.protect     = 1
//	dw_2.object.type.background.color     = rgb(192,192,192)
//end if

end event

type st_3 from statictext within w_cdequip_m
integer x = 1426
integer y = 140
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 15780518
string text = "작업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_photo_insert from picturebutton within w_cdequip_m
event mousemove pbm_mousemove
string tag = "파일"
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
string picturename = "Custom033!"
alignment htextalign = right!
string powertiptext = "설비사진올리기"
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"설비사진올리기",parent, li_x, li_y)

end event

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

long li_rtn, li_cnt
string ls_ext, ls_null, ls_nullarray[]
blob   lb_picture

	li_rtn = GetFileOpenName("Select File", is_path, is_files[], "jpg", &
								  + "Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.pdf), *.bmp;*.gif;*.jpg;*.jpeg;*.pdf")


WF_Images_SAVE()


tab_1.tabpage_1.p_1.setredraw( false )

SELECTBLOB photo 
       INTO :lb_picture 
      FROM equip WHERE equip_code = :is_equip_code;
		
if sqlca.sqlcode = 100 then
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
else
	tab_1.tabpage_1.p_1.SetPicture( lb_picture )
end if
tab_1.tabpage_1.p_1.setredraw( true )	
end event

type pb_photo_delete from picturebutton within w_cdequip_m
event mousemove pbm_mousemove
string tag = "파일"
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
string picturename = "c:\bmp\delete.bmp"
alignment htextalign = right!
string powertiptext = "설비사진지우기"
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"설비사진 지우기",parent, li_x, li_y)

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
	
	UPDATE equip
			SET photo = :blob_null
		 WHERE equip_code = :is_equip_code;
		 
	commit;
	
	tab_1.tabpage_1.p_1.PictureName = "C:\BMP\YC_150X150.jpg"
		
	tab_1.tabpage_1.p_1.setredraw( true )	

end if	
end event

type dw_4 from datawindow within w_cdequip_m
boolean visible = false
integer x = 1257
integer y = 116
integer width = 119
integer height = 88
integer taborder = 180
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_cdequip_r1"
boolean livescroll = true
end type

type st_6 from statictext within w_cdequip_m
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
string text = "※수리이력 출력은 옆에 프린터 버튼을 클릭해주세요"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_picture_check from checkbox within w_cdequip_m
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
string text = "사진조회,출력"
boolean checked = true
end type

