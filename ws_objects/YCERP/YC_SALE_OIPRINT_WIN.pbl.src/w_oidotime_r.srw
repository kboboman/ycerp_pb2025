$PBExportHeader$w_oidotime_r.srw
$PBExportComments$거래명세서_출고시간
forward
global type w_oidotime_r from w_inheritance
end type
type dw_area from datawindow within w_oidotime_r
end type
type pb_1 from picturebutton within w_oidotime_r
end type
type em_1 from editmask within w_oidotime_r
end type
type em_2 from editmask within w_oidotime_r
end type
type st_1 from statictext within w_oidotime_r
end type
type st_2 from statictext within w_oidotime_r
end type
type st_3 from statictext within w_oidotime_r
end type
type ddlb_fld from dropdownlistbox within w_oidotime_r
end type
type ddlb_dwtitles from dropdownlistbox within w_oidotime_r
end type
type st_4 from statictext within w_oidotime_r
end type
type sle_value from singlelineedit within w_oidotime_r
end type
type cb_1 from commandbutton within w_oidotime_r
end type
type cb_2 from commandbutton within w_oidotime_r
end type
type cb_3 from commandbutton within w_oidotime_r
end type
type cb_5 from commandbutton within w_oidotime_r
end type
type dw_cust from datawindow within w_oidotime_r
end type
type st_5 from statictext within w_oidotime_r
end type
type ddlb_op from dropdownlistbox within w_oidotime_r
end type
type st_horizontal from u_splitbar_horizontal within w_oidotime_r
end type
type rb_1 from radiobutton within w_oidotime_r
end type
type rb_2 from radiobutton within w_oidotime_r
end type
type rb_3 from radiobutton within w_oidotime_r
end type
type rb_4 from radiobutton within w_oidotime_r
end type
type cbx_inout from checkbox within w_oidotime_r
end type
type dw_3 from datawindow within w_oidotime_r
end type
type dw_4 from datawindow within w_oidotime_r
end type
type cb_sum from commandbutton within w_oidotime_r
end type
type em_minute from editmask within w_oidotime_r
end type
type st_6 from statictext within w_oidotime_r
end type
type cbx_hap from checkbox within w_oidotime_r
end type
type st_7 from statictext within w_oidotime_r
end type
type dw_loc from datawindow within w_oidotime_r
end type
type gb_4 from groupbox within w_oidotime_r
end type
type gb_5 from groupbox within w_oidotime_r
end type
end forward

global type w_oidotime_r from w_inheritance
integer y = 112
integer width = 4699
integer height = 2592
string title = "거래명세서 출고시간(w_oidotime_r)"
dw_area dw_area
pb_1 pb_1
em_1 em_1
em_2 em_2
st_1 st_1
st_2 st_2
st_3 st_3
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_4 st_4
sle_value sle_value
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
dw_cust dw_cust
st_5 st_5
ddlb_op ddlb_op
st_horizontal st_horizontal
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
cbx_inout cbx_inout
dw_3 dw_3
dw_4 dw_4
cb_sum cb_sum
em_minute em_minute
st_6 st_6
cbx_hap cbx_hap
st_7 st_7
dw_loc dw_loc
gb_4 gb_4
gb_5 gb_5
end type
global w_oidotime_r w_oidotime_r

type variables
//
datawindowchild idwc_area, idwc_cust, idwc_user, idwc_loc
gs_custdo_str   ist_code

string is_dw, is_sale_flag, is_custdosql, is_custdorsql, is_custdor1sql, is_ret

end variables

forward prototypes
public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col)
public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col, long al_head)
end prototypes

public function string wf_crosstab_title (datawindow arg_dw, long al_row, long al_col);// string = wf_crosstab_title( arg_dw, al_row, al_col )
string ls_col, ls_value, ls_today
long   ll_row, ll_col

ll_row    = al_row
ll_col    = al_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ls_today = string(gf_today(), "mm/dd")

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
else
	ls_title = ""
	RETURN ls_title
end if

//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to UpperBound(ls_bandname)
   if Upper(LeftA(ls_bandname[i], 4)) = "HEAD" then
      li_pos = PosA(ls_bandname[i], "[")
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], "]")
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then li_header2 = li_header1
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = "HEADER"
else
   ls_lastheader = "HEADER[" + string(li_header2) + "]"
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")	 
ll_objects = GF_SPLIT(ls_objects, "~t", ls_object)

for i = 1 to UpperBound(ls_object)
   ls_objname = Trim(ls_object[i])
   ls_type    = Upper(arg_dw.Describe( ls_objname + ".type" ))
	
	choose case ls_type
		case "COLUMN", "COMPUTE"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = "DETAIL" then
				ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
				
				if ls_visible = "1" then
					j++
					
					ls_detail[j]  = ls_objname
					ls_objtype[j] = ls_type
				end if
			end if
		
		case "TEXT"
			ls_band = Upper(arg_dw.Describe( ls_objname + ".band" ))
			
			if ls_band = ls_lastheader then
				li_pos = integer(arg_dw.Describe( ls_objname + ".x" ))
				if li_pos > 0 then ls_header[li_pos] = ls_objname
			end if
	end choose
next

//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_colcount = UpperBound(ls_detail)
for j = 1 to li_colcount
   ls_colname  = arg_dw.Describe(ls_detail[j] + ".name")
   li_pos      = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	
	if li_pos > UpperBound(ls_header) then
		//
	else
		if li_pos > 0 then
			ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )
	
			if al_col = j then
				ls_title = ls_coltext[j]
			end if
			
			if ls_today = ls_coltext[j] then
				arg_dw.Modify(ls_colname + ".Background.Mode='0'")
				arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
			end if
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
RETURN ls_title

end function

public function string wf_crosstab_title2 (datawindow arg_dw, long al_row, long al_col, long al_head);// string = wf_crosstab_title2( arg_dw, al_row, al_col, al_head )
// al_head : Column 배열 시작위치 - 1
string   ls_col, ls_value, ls_today, ls_day
long     ll_row, ll_col

integer  li_pos,  li_nextpos, li_header1, li_header2, li_colx, li_colcount, li_head
long     i, j, ll_bands,   ll_objects
string   ls_objects, ls_object[], ls_detail[], ls_coltext[], ls_objtype[], ls_objx[]
string   ls_objname, ls_band, ls_bands, ls_bandname[]
string   ls_header[], ls_lastheader, ls_title, ls_colname, ls_type, ls_visible

ll_row    = al_row
ll_col    = al_col

ls_day    = string(daynumber(date(gf_today())))
if ls_day = "1" then ls_day = "(일)"
if ls_day = "2" then ls_day = "(월)"
if ls_day = "3" then ls_day = "(화)"
if ls_day = "4" then ls_day = "(수)"
if ls_day = "5" then ls_day = "(목)"
if ls_day = "6" then ls_day = "(금)"
if ls_day = "7" then ls_day = "(토)"
ls_today  = string(gf_today(), "yy/mm/dd") + ls_day

//-----------------------------------------------------------------------------
// 크로스탭 형식일 때에는 StaticMode를 설정해야 필드 접근가능.
//-----------------------------------------------------------------------------
if arg_dw.object.DataWindow.processing = "4" then 
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
else
	ls_title = ""
	RETURN ls_title
end if

//-----------------------------------------------------------------------------
// Crosstab의 Title을 위해 밴드구분 처리
//-----------------------------------------------------------------------------
ls_bands = arg_dw.object.Datawindow.bands
ll_bands = GF_SPLIT(ls_bands, "~t", ls_bandname)

for i = 1 to UpperBound(ls_bandname)
   if Upper(LeftA(ls_bandname[i], 4)) = "HEAD" then
      li_pos = PosA(ls_bandname[i], "[")
      if li_pos > 0 then
         li_nextpos = PosA(ls_bandname[i], "]")
         li_header1 = integer(MidA(ls_bandname[i], li_pos + 1, li_nextpos - li_pos - 1))
         if li_header1 > li_header2 then 
				li_header2 = li_header1
			end if
      end if
   end if
next
if li_header2 = 0 then
   ls_lastheader = "HEADER"
else
   ls_lastheader = "HEADER[" + string(li_header2) + "]"
   ls_lastheader = "HEADER[2]"
end if

//-----------------------------------------------------------------------------
// 데이터윈도의 모든 오브젝트를 읽어온다.
//-----------------------------------------------------------------------------
ls_objects = arg_dw.Describe("DataWindow.objects")	 
ll_objects = GF_SPLIT(ls_objects, "~t", ls_object)

for i = 1 to UpperBound(ls_object)
   ls_objname = Trim(ls_object[i])
	ls_band    = Upper(arg_dw.Describe( ls_objname + ".band" ))
   ls_type    = Upper(arg_dw.Describe( ls_objname + ".type" ))	
	
	choose case ls_type
		case "TEXT"			
			if ls_band = ls_lastheader then
				li_pos = integer(arg_dw.Describe( ls_objname + ".x" ))
				if li_pos > 0 then 
					ls_header[li_pos] = ls_objname

					ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
					if ls_visible = "1" then
						j++
						
						ls_detail[j]  = ls_objname
						ls_objtype[j] = ls_type
					end if
				end if
			end if

		case "COLUMN", "COMPUTE"			
			if ls_band = "DETAIL" then
				ls_visible = Upper(arg_dw.Describe( ls_objname + ".visible" ))
				
				if ls_visible = "1" then
					j++
					
					ls_detail[j]  = ls_objname
					ls_objtype[j] = ls_type
				end if
			end if		
	end choose
next


//-----------------------------------------------------------------------------
//   Header title 삽입
//-----------------------------------------------------------------------------
li_head    = Round( (al_col - al_head) / 2, 1 )
if li_head = 0 then li_head = 1

li_colcount = UpperBound(ls_detail)
for j = 1 to li_colcount
   ls_colname  = arg_dw.Describe(ls_detail[j] + ".name")
   li_pos      = integer(arg_dw.Describe(ls_detail[j] + ".x"))
	
	if li_pos > UpperBound(ls_header) then
		//
	else
		if li_pos > 0 then
			ls_coltext[j] = arg_dw.Describe(ls_header[li_pos] + ".text" )
	
			if li_head = j then
				ls_title = ls_coltext[j]
			end if
			
			//if ls_today = ls_coltext[j] then
			//	arg_dw.Modify(ls_colname + ".Background.Mode='0'")
			//	arg_dw.Modify(ls_colname + ".Background.Color='11665407'")	// 연노랑
			//end if
		end if
	end if
next

arg_dw.object.DataWindow.CrossTab.StaticMode = "No"
RETURN ls_title

end function

on w_oidotime_r.create
int iCurrent
call super::create
this.dw_area=create dw_area
this.pb_1=create pb_1
this.em_1=create em_1
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_4=create st_4
this.sle_value=create sle_value
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.dw_cust=create dw_cust
this.st_5=create st_5
this.ddlb_op=create ddlb_op
this.st_horizontal=create st_horizontal
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cbx_inout=create cbx_inout
this.dw_3=create dw_3
this.dw_4=create dw_4
this.cb_sum=create cb_sum
this.em_minute=create em_minute
this.st_6=create st_6
this.cbx_hap=create cbx_hap
this.st_7=create st_7
this.dw_loc=create dw_loc
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_area
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.em_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.ddlb_fld
this.Control[iCurrent+9]=this.ddlb_dwtitles
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.sle_value
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.dw_cust
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.ddlb_op
this.Control[iCurrent+19]=this.st_horizontal
this.Control[iCurrent+20]=this.rb_1
this.Control[iCurrent+21]=this.rb_2
this.Control[iCurrent+22]=this.rb_3
this.Control[iCurrent+23]=this.rb_4
this.Control[iCurrent+24]=this.cbx_inout
this.Control[iCurrent+25]=this.dw_3
this.Control[iCurrent+26]=this.dw_4
this.Control[iCurrent+27]=this.cb_sum
this.Control[iCurrent+28]=this.em_minute
this.Control[iCurrent+29]=this.st_6
this.Control[iCurrent+30]=this.cbx_hap
this.Control[iCurrent+31]=this.st_7
this.Control[iCurrent+32]=this.dw_loc
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_5
end on

on w_oidotime_r.destroy
call super::destroy
destroy(this.dw_area)
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_4)
destroy(this.sle_value)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.dw_cust)
destroy(this.st_5)
destroy(this.ddlb_op)
destroy(this.st_horizontal)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cbx_inout)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.cb_sum)
destroy(this.em_minute)
destroy(this.st_6)
destroy(this.cbx_hap)
destroy(this.st_7)
destroy(this.dw_loc)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

///////////////////////////////////////////////////////////////////////////////////////////////
st_horizontal.of_set_topobject(dw_1)
st_horizontal.of_set_topobject(dw_3)
st_horizontal.of_set_bottomobject(dw_2)
st_horizontal.of_set_bottomobject(dw_4)
st_horizontal.of_set_minsize(250, 250)
///////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)

// 전체사업장
dw_area.settransobject(sqlca)
dw_area.insertrow(0)  

dw_area.getchild("area", idwc_area)
idwc_area.setredraw(false)
idwc_area.settransobject(sqlca)
idwc_area.insertrow(1)
idwc_area.setitem(1, "area_no", "%")
idwc_area.setitem(1, "area_name", "전체사업장")

idwc_area.accepttext()
idwc_area.setredraw(false)
dw_area.object.area[1] = "%"

// 저장소
dw_loc.settransobject(sqlca)
dw_loc.insertrow(0)

dw_loc.getchild("loc_no", idwc_loc)
idwc_loc.settransobject(SQLCA)
idwc_loc.insertrow(1)
idwc_loc.setitem(1, "loc_no", "%")
idwc_loc.setitem(1, "loc_name", "전체")
dw_loc.object.loc_no[1] = "%"

// 전체거래처
dw_cust.settransobject(sqlca)
dw_cust.insertrow(0)  

idwc_cust.setredraw(false)
dw_cust.getchild("cust_no", idwc_cust)
idwc_cust.settransobject(sqlca)
idwc_cust.insertrow(1)
idwc_cust.setitem(1, "cust_no", "%")
idwc_cust.setitem(1, "cust_name", "전체")

dw_cust.object.cust_no[1] = "%"

// 집계
cb_sum.visible = false

// 전일,당일
rb_1.triggerevent( clicked! )

end event

event resize;call super::resize;//
long  ll_width, ll_height

ll_height   = newheight - dw_1.y - gb_3.x

gb_3.width  = newwidth  - (gb_3.x * 2)

dw_1.width  = newwidth  - (gb_3.x * 2)
dw_1.height = ll_height * 0.5

st_horizontal.y      = dw_1.y + dw_1.height
st_horizontal.width  = newwidth  - (gb_3.x * 2)

dw_2.y      = st_horizontal.y + st_horizontal.height
dw_2.width  = newwidth  - (gb_3.x * 2)
dw_2.height = newheight - dw_2.y - gb_3.x

//
dw_3.x      = dw_1.x
dw_3.y      = dw_1.y
dw_3.width  = dw_1.width
dw_3.height = dw_1.height

dw_4.x      = dw_2.x
dw_4.y      = dw_2.y
dw_4.width  = dw_2.width
dw_4.height = dw_2.height

end event

type pb_save from w_inheritance`pb_save within w_oidotime_r
boolean visible = false
integer taborder = 50
end type

type dw_1 from w_inheritance`dw_1 within w_oidotime_r
integer x = 27
integer y = 440
integer width = 4585
integer height = 964
integer taborder = 0
string title = "d_oidotime_ct"
string dataobject = "d_oidotime_ct"
boolean hsplitscroll = true
end type

event dw_1::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
if isnull(row) OR row < 1 then RETURN

This.SelectRow(0,  false)
This.SelectRow(row, TRUE)


end event

event dw_1::doubleclicked;call super::doubleclicked;//
string  ls_title, ls_value, ls_area, ls_custno, ls_time, ls_inout
long    ll_row,  ll_col
date    ld_date, ld_sdate, ld_edate

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 거래처
dw_cust.accepttext()
ls_custno    = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then ls_custno = "%"

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 클릭한 값
ll_row    = this.getrow()
ll_col    = long( this.GetClickedColumn() )
ls_value  = string( this.GetItemNumber(ll_row, ll_col), "#,##0" )

// 타임
ls_time   = this.GetItemString(ll_row, "prt_time")
if ls_time = "" then SetNull(ls_time)

// 직출제외
if cbx_inout.checked = true then
	ls_inout  = "I"
else
	ls_inout  = "%"
end if

//
ld_date   = date(LeftA(this.GetItemString(ll_row, "do_date"),10))

// 건수 이전컬럼 클릭시 
if ll_col < 4 then RETURN		// @area_no

if isnull(ls_value) OR ls_value = "" then 
	dw_2.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, "%", ls_inout )
else
	ls_title  = WF_CrossTab_Title2( this, ll_row, ll_col, 3 )
	//MessageBox("확인", string(ll_row) + ", " + string(ll_col) + ", " + ls_value + ", " + ls_title )

	SELECT area_no INTO :ls_area FROM area WHERE area_name = :ls_title;
	
	dw_2.retrieve( ls_area, ls_custno, ld_date, ld_date, ls_time, ls_inout )	
end if


end event

type st_title from w_inheritance`st_title within w_oidotime_r
integer x = 0
integer y = 0
integer width = 1193
integer height = 136
string text = "거래명세서 출고시간"
end type

type st_tips from w_inheritance`st_tips within w_oidotime_r
end type

type pb_compute from w_inheritance`pb_compute within w_oidotime_r
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_oidotime_r
boolean visible = false
integer x = 2935
integer y = 116
integer taborder = 40
end type

event pb_print_part::clicked;//gs_custdo_str lst_code
//string ls_sql, ls_where
//date ld_start, ld_end
//
//openwithparm(w_whcustdo_w, lst_code)
//
//lst_code = message.powerobjectparm
//
//if lst_code.okcancel = 'N' then
//	return
//end if
//dw_3.visible = true
//dw_1.visible = false
//ld_start = date(lst_code.start_date)
//ld_end = date(lst_code.end_date)
//
//if lst_code.sel_flag = 'A' then
//   ls_where = " and do.do_date between ~~'" + &
//	           string(ld_start) + "~~' and " + "~~'" + string(ld_end) + "~~'"		
//else
//   ls_where = " and do.do_date between ~~'" + string(ld_start) + "~~' and ~~'" + &
//	           string(ld_end) + "~~' and do.cust_no between ~~'" + &				
//	           lst_code.start_no + "~~' and ~~'" + lst_code.end_no + "~~'"
//end if
////dw_3.settransobject(sqlca)
//ls_sql = "datawindow.table.select = '" + is_custdor1sql + ls_where + "'"
////dw_1.settransobject(sqlca)
//dw_3.modify(ls_sql)
//dw_3.retrieve()
//if dw_3.rowcount() < 1 then
//	messagebox("확인", "조회조건에 만족하는 출고된 내역이 없습니다.",information!)
//   return
//end if
//
//
end event

event pb_print_part::mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"거래명세표순 인쇄",parent, li_x, li_y)

end event

type pb_close from w_inheritance`pb_close within w_oidotime_r
integer x = 4384
integer y = 76
integer taborder = 30
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_oidotime_r
boolean visible = false
integer x = 3515
integer y = 76
integer taborder = 20
end type

type pb_cancel from w_inheritance`pb_cancel within w_oidotime_r
boolean visible = false
integer taborder = 100
end type

type pb_delete from w_inheritance`pb_delete within w_oidotime_r
boolean visible = false
integer taborder = 110
end type

type pb_insert from w_inheritance`pb_insert within w_oidotime_r
boolean visible = false
integer taborder = 120
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_oidotime_r
integer x = 4000
integer y = 76
integer taborder = 10
end type

event pb_retrieve::clicked;//
string ls_area, ls_locno, ls_custno, ls_time, ls_inout
date   ld_sdate, ld_edate

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "R", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

// 사업장
dw_area.accepttext()
ls_area  = dw_area.object.area[1]

// 저장소
dw_loc.accepttext()
ls_locno = dw_loc.object.loc_no[1]

// 거래처
dw_cust.accepttext()
ls_custno    = dw_cust.object.cust_no[1]
if isnull(ls_custno) OR ls_custno = "" then ls_custno = "%"

// 일자
ld_sdate = date(em_1.text)
ld_edate = date(em_2.text)

// 타임
ls_time  = "%"

// 직출제외
if cbx_inout.checked = true then
	ls_inout  = "I"
else
	ls_inout  = "%"
end if

// 시간
if long(em_minute.text) < 1 then
	MessageBox("확인","해당하는 시간을 확인하시기 바랍니다.")
	RETURN
end if

//
//dw_1.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_inout )
//dw_2.retrieve( ls_area, ls_custno, ld_sdate, ld_edate, ls_time, ls_inout )

debugbreak()

dw_3.reset()
dw_4.retrieve( ls_area, ls_locno, ls_custno, ld_sdate, ld_edate, ls_inout )
if dw_4.rowcount() < 1 then
	MessageBox("확인", "해당하는 조건의 데이터가 존재하지 않습니다.",information!)
end if

// 집계
cb_sum.triggerevent( clicked! )

end event

type gb_3 from w_inheritance`gb_3 within w_oidotime_r
integer x = 27
integer y = 248
integer width = 4585
integer height = 180
integer taborder = 0
end type

type gb_2 from w_inheritance`gb_2 within w_oidotime_r
integer x = 1253
integer y = 16
integer width = 901
integer height = 228
integer taborder = 0
integer textsize = -10
integer weight = 400
long textcolor = 0
end type

type gb_1 from w_inheritance`gb_1 within w_oidotime_r
integer x = 3963
integer y = 16
integer width = 645
integer height = 228
integer taborder = 0
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_oidotime_r
integer x = 27
integer y = 1460
integer width = 4585
integer height = 984
integer taborder = 0
string dataobject = "d_oidotime_l"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event dw_2::clicked;call super::clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

event dw_2::doubleclicked;call super::doubleclicked;//
string  ls_value

choose case dwo.name
	case "do_do_no"
		ls_value  = this.object.do_do_no[row]
		
		if IsValid(w_all_main) then
			OpenSheet(w_oigiprint_m, w_all_main, 1, original!)
		end if
		
		w_oigiprint_m.setredraw(false)
		w_oigiprint_m.em_3.text = LeftA(ls_value,10) + RightA(ls_value,3)	// 출고번호 
		w_oigiprint_m.pb_compute.PostEvent(clicked!)					// 조회
		w_oigiprint_m.setredraw(true)
end choose

end event

type dw_area from datawindow within w_oidotime_r
integer x = 1495
integer y = 60
integer width = 526
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_wharea_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//
string ls_area

this.accepttext()
ls_area = data

if ls_area = "H0001" then
	idwc_loc.setfilter( "area_no = 'H0001'" )
	idwc_loc.filter()
	dw_loc.object.loc_no[1] = ""
else
	idwc_loc.setfilter( "loc_no = '%'" )
	idwc_loc.filter()
	dw_loc.object.loc_no[1] = "%"
end if

// 배차(분)
if ls_area = "S0001" then
	em_minute.text  = "60"
else
	em_minute.text  = "15"
end if

end event

type pb_1 from picturebutton within w_oidotime_r
event mousemove pbm_mousemove
integer x = 4192
integer y = 76
integer width = 187
integer height = 144
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "CrossTab!"
alignment htextalign = right!
end type

event mousemove;int li_x,li_y

li_x = this.x 
li_y = this.y + 156

f_usetips(st_tips,"파일저장",parent, li_x, li_y)

end event

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer li_Pos, li_value
long    ll_cnt
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
	case else
		MessageBox("확인","해당하는 DataWindow를 선택 후 작업하시기 바랍니다")
end choose

//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "E", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

if arg_dw.rowcount() > 0 then
	li_value = GetFileSaveName("Select File", ls_Docname, ls_Named, "XLS", &
	                           "엑셀 (*.XLS), *.XLS,CSV(쉽표로 분리), *.CSV,")
	li_Pos   = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named)- li_Pos)
	if li_value = 1 then
		if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
			arg_dw.SaveAsascii(ls_DocName)
		elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
			arg_dw.SaveAs(ls_DocName, CSV!, TRUE)
		end if
	end if
end if	

end event

type em_1 from editmask within w_oidotime_r
integer x = 2501
integer y = 148
integer width = 434
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "~r"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type em_2 from editmask within w_oidotime_r
integer x = 2935
integer y = 148
integer width = 434
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = "himage"
end type

event rbuttondown;//
gs_calendar lstr_calendar

lstr_calendar.sdate = em_1.text
lstr_calendar.edate = em_2.text
OpenWithParm(w_calendar2, lstr_calendar)
lstr_calendar = Message.PowerObjectParm

if lstr_calendar.chk <> 'N' then
	em_1.text = lstr_calendar.sdate
	em_2.text = lstr_calendar.edate
end if

//
//openWithParm(w_calendar, message.stringparm)
//if message.stringparm <> 'N' then
//	this.text = string(date(message.stringparm))
//end if
//
end event

type st_1 from statictext within w_oidotime_r
integer x = 1285
integer y = 64
integer width = 210
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "사업장"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_oidotime_r
integer x = 2203
integer y = 152
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "출고기간"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_oidotime_r
integer x = 78
integer y = 332
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

type ddlb_fld from dropdownlistbox within w_oidotime_r
integer x = 265
integer y = 316
integer width = 443
integer height = 632
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
end type

type ddlb_dwtitles from dropdownlistbox within w_oidotime_r
integer x = 297
integer y = 328
integer width = 311
integer height = 88
integer taborder = 100
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

type st_4 from statictext within w_oidotime_r
integer x = 736
integer y = 332
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

type sle_value from singlelineedit within w_oidotime_r
integer x = 1225
integer y = 320
integer width = 567
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_oidotime_r
integer x = 1797
integer y = 320
integer width = 160
integer height = 76
integer taborder = 80
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)



end event

type cb_2 from commandbutton within w_oidotime_r
integer x = 1961
integer y = 320
integer width = 160
integer height = 76
integer taborder = 90
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2UnFilter( arg_dw )

ddlb_op.text   = ""
ddlb_fld.text  = ""
sle_value.text = ""

end event

type cb_3 from commandbutton within w_oidotime_r
integer x = 2126
integer y = 320
integer width = 160
integer height = 76
integer taborder = 100
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_5 from commandbutton within w_oidotime_r
integer x = 2290
integer y = 320
integer width = 160
integer height = 76
integer taborder = 110
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

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_2"
		arg_dw  = dw_2
	case "dw_3"
		arg_dw  = dw_3
	case "dw_4"
		arg_dw  = dw_4
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type dw_cust from datawindow within w_oidotime_r
integer x = 2501
integer y = 56
integer width = 869
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "d_whcust_s"
boolean border = false
boolean livescroll = true
end type

event losefocus;//
this.accepttext()

end event

type st_5 from statictext within w_oidotime_r
integer x = 2203
integer y = 60
integer width = 288
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 15780518
string text = "거래처"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_op from dropdownlistbox within w_oidotime_r
integer x = 914
integer y = 312
integer width = 302
integer height = 500
integer taborder = 160
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

type st_horizontal from u_splitbar_horizontal within w_oidotime_r
integer x = 27
integer y = 1420
integer width = 4585
boolean bringtotop = true
end type

type rb_1 from radiobutton within w_oidotime_r
integer x = 2478
integer y = 292
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전일,당일"
boolean checked = true
end type

event clicked;// 전일,당일
if this.checked = true then
	em_1.text = string(RelativeDate(today(), -1), "yyyy/mm/dd")
	em_2.text = string(today(), "yyyy/mm/dd")
end if

end event

type rb_2 from radiobutton within w_oidotime_r
integer x = 2478
integer y = 352
integer width = 242
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "당일"
end type

event clicked;// 당일
if this.checked = true then
	em_1.text = string(today(), "yyyy/mm/dd")
	em_2.text = string(today(), "yyyy/mm/dd")
end if	
end event

type rb_3 from radiobutton within w_oidotime_r
integer x = 2903
integer y = 292
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "전일"
end type

event clicked;// 전일
if this.checked = true then
	em_1.text = string(RelativeDate(today(), -1), 'YYYY/MM/DD')
	em_2.text = string(RelativeDate(today(), -1), 'YYYY/MM/DD')
end if	
end event

type rb_4 from radiobutton within w_oidotime_r
integer x = 2903
integer y = 352
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "1일,당일"
end type

event clicked;// 1일,당일
if this.checked = true then
	em_1.text = string(today(), "yyyy/mm/01")
	em_2.text = string(today(), "yyyy/mm/dd")
end if

end event

type cbx_inout from checkbox within w_oidotime_r
integer x = 3461
integer y = 76
integer width = 352
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "직출제외"
boolean checked = true
end type

type dw_3 from datawindow within w_oidotime_r
integer x = 1147
integer y = 576
integer width = 2437
integer height = 632
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidotime_sum"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string   ls_logdate,  ls_area,  ls_carname,  ls_cargo_name,  ls_prttime,  ls_value
datetime ldt_logdate
long     ll_row, ll_find, ll_dototal

if isnull(row) OR row < 1 then RETURN

ls_logdate    = dw_3.object.log_date[row]
ls_area       = dw_3.object.area_no[row]
ls_carname    = dw_3.object.carname[row]
ls_cargo_name = dw_3.object.cargo_name[row]
ls_prttime    = dw_3.object.prt_time[row]
ldt_logdate   = datetime( date(ls_logdate), time("00:00:00") )
ll_dototal    = dw_3.object.do_total[row]

ls_value  = "do_date >= datetime("+string(ldt_logdate)+") AND area_no= '"+ls_area+"' AND carname= '"+ls_carname+"'"
ls_value += " AND cargo_name= '"+ls_cargo_name+"' AND prt_time= '"+ls_prttime+"' AND do_total= "+string(ll_dototal)

ll_find   = dw_4.find( ls_value, 1, dw_4.rowcount() )
if ll_find > 0 then
	dw_4.scrolltorow( ll_find )
else
	ls_value  = "do_date >= datetime("+string(ldt_logdate)+") AND area_no= '"+ls_area+"' AND carname= '"+ls_carname+"'"
	ls_value += " AND cargo_name= '"+ls_cargo_name+"' AND prt_time= '"+ls_prttime+"'"
	
	ll_find   = dw_4.find( ls_value, 1, dw_4.rowcount() )
	if ll_find > 0 then
		dw_4.scrolltorow( ll_find )
	end if	
end if

end event

type dw_4 from datawindow within w_oidotime_r
integer x = 1161
integer y = 1548
integer width = 2459
integer height = 668
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "d_oidotime_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//
is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

end event

type cb_sum from commandbutton within w_oidotime_r
integer x = 987
integer y = 164
integer width = 238
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "집계"
end type

event clicked;//
string   ls_logdate,  ls_area,  ls_carname,  ls_cargo_name,  ls_prttime
string   ls_logdate1, ls_area1, ls_carname1, ls_cargo_name1, ls_prttime1
string   ls_keysave, ls_key

datetime ldt_logdate, ldt_logdate1, ldt_totime
long     ll_row, ll_minute, ll_dono, ll_dototal, ll_dw4cnt

if dw_4.rowcount() < 1 then RETURN

//
dw_3.reset()
ll_minute     = long(em_minute.text)

ls_logdate    = string(dw_4.object.log_date[1],"yyyy/mm/dd")
ls_area       = dw_4.object.area_no[1]
ls_carname    = dw_4.object.carname[1]
ls_cargo_name = dw_4.object.cargo_name[1]
ls_prttime    = dw_4.object.prt_time[1]
ldt_logdate   = dw_4.object.log_date[1]

SELECT top 1 DateADD(minute, :ll_minute, :ldt_logdate) INTO :ldt_totime FROM login;

if isnull(ls_logdate)    then ls_logdate = ""
if isnull(ls_area)       then ls_area    = ""
if isnull(ls_carname)    then ls_carname = ""
if isnull(ls_cargo_name) then ls_cargo_name = ""

ls_keysave    = ls_logdate + ls_area + ls_carname + ls_cargo_name

//
dw_3.setredraw( false )
for ll_row = 1 to dw_4.rowcount()
   ls_logdate    = string(dw_4.object.log_date[ll_row],"yyyy/mm/dd")
	ls_area       = dw_4.object.area_no[ll_row]
	ls_carname    = dw_4.object.carname[ll_row]
	ls_cargo_name = dw_4.object.cargo_name[ll_row]
   ls_prttime    = dw_4.object.prt_time[ll_row]
	ldt_logdate   = dw_4.object.log_date[ll_row]
	
	if isnull(ls_logdate)    then ls_logdate = ""
	if isnull(ls_area)       then ls_area    = ""
	if isnull(ls_carname)    then ls_carname = ""
	if isnull(ls_cargo_name) then ls_cargo_name = ""

   ls_key  = ls_logdate + ls_area + ls_carname + ls_cargo_name

	if ls_keysave = ls_key then
		if ldt_logdate <= ldt_totime then
			ls_logdate1    = ls_logdate
			ls_area1       = ls_area
			ls_carname1    = ls_carname
			ls_cargo_name1 = ls_cargo_name		
			
			ls_prttime1    = ls_prttime
         ldt_logdate1   = ldt_logdate
			
			ll_dono    = ll_dono + 1
			ll_dototal = ll_dototal + dw_4.object.do_total[ll_row]
		else
			ll_dw4cnt  = dw_3.insertrow( 0 )

			dw_3.object.log_date[ll_dw4cnt]   = string(ldt_logdate1,"yyyy/mm/dd")
			dw_3.object.area_no[ll_dw4cnt]    = ls_area1
			dw_3.object.carname[ll_dw4cnt]    = ls_carname1
			dw_3.object.cargo_name[ll_dw4cnt] = ls_cargo_name1
         dw_3.object.prt_time[ll_dw4cnt]   = ls_prttime1
			
			dw_3.object.do_no[ll_dw4cnt]      = ll_dono
			dw_3.object.do_total[ll_dw4cnt]   = ll_dototal
			
			//
			ls_prttime1    = ls_prttime
         ldt_logdate1   = ldt_logdate

			ll_dono    = 1
			ll_dototal = dw_4.object.do_total[ll_row]
			SELECT top 1 DateADD(minute, :ll_minute, :ldt_logdate) INTO :ldt_totime FROM login;
		end if		
	else
		ll_dw4cnt  = dw_3.insertrow( 0 )
		
		dw_3.object.log_date[ll_dw4cnt]   = string(ldt_logdate1,"yyyy/mm/dd")
		dw_3.object.area_no[ll_dw4cnt]    = ls_area1
		dw_3.object.carname[ll_dw4cnt]    = ls_carname1
		dw_3.object.cargo_name[ll_dw4cnt] = ls_cargo_name1
      dw_3.object.prt_time[ll_dw4cnt]   = ls_prttime1
		
		dw_3.object.do_no[ll_dw4cnt]      = ll_dono
		dw_3.object.do_total[ll_dw4cnt]   = ll_dototal
		
		//
		ll_dono       = 1
		ll_dototal    = dw_4.object.do_total[ll_row]
		SELECT top 1 DateADD(minute, :ll_minute,  :ldt_logdate) INTO :ldt_totime FROM login;
		
		if isnull(ls_logdate)    then ls_logdate = ""
		if isnull(ls_area)       then ls_area    = ""
		if isnull(ls_carname)    then ls_carname = ""
		if isnull(ls_cargo_name) then ls_cargo_name = ""
	
		ls_keysave    = ls_logdate + ls_area + ls_carname + ls_cargo_name

		//
		ls_logdate1    = ls_logdate
		ls_area1       = ls_area
		ls_carname1    = ls_carname
		ls_cargo_name1 = ls_cargo_name		
		ls_prttime1    = ls_prttime
      ldt_logdate1   = ldt_logdate
	end if
next

ll_dw4cnt  = dw_3.insertrow( 0 )

dw_3.object.log_date[ll_dw4cnt]   = string(ldt_logdate1,"yyyy/mm/dd")
dw_3.object.area_no[ll_dw4cnt]    = ls_area1
dw_3.object.carname[ll_dw4cnt]    = ls_carname1
dw_3.object.cargo_name[ll_dw4cnt] = ls_cargo_name1
dw_3.object.prt_time[ll_dw4cnt]   = ls_prttime1

dw_3.object.do_no[ll_dw4cnt]      = ll_dono
dw_3.object.do_total[ll_dw4cnt]   = ll_dototal
dw_3.setredraw( true )

//
dw_3.sort()
dw_3.groupcalc()

dw_4.setsort( " log_date A " )
dw_4.sort()

end event

type em_minute from editmask within w_oidotime_r
integer x = 3753
integer y = 148
integer width = 155
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
string text = "60"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type st_6 from statictext within w_oidotime_r
integer x = 3451
integer y = 160
integer width = 302
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
string text = "배차(분):"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_hap from checkbox within w_oidotime_r
integer x = 3351
integer y = 328
integer width = 489
integer height = 52
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "합계만 보기"
end type

event clicked;//
DataWindow arg_dw

arg_dw = dw_3

// CrossTAB
if arg_dw.Object.DataWindow.Processing = "4" then
	arg_dw.object.DataWindow.CrossTab.StaticMode = "Yes"
end if

arg_dw.setredraw( false )
if this.checked = true then
	arg_dw.Modify("DataWindow.Detail.Height=0")			
	arg_dw.Modify("DataWindow.Trailer.3.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.2.Height=0")		
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
else
	arg_dw.Modify("DataWindow.Detail.Height=80")		
	arg_dw.Modify("DataWindow.Trailer.3.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.2.Height=80")	
	arg_dw.Modify("DataWindow.Trailer.1.Height=80")	
end if
arg_dw.setredraw( true )

end event

type st_7 from statictext within w_oidotime_r
integer x = 46
integer y = 196
integer width = 910
integer height = 64
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "출고형태 분석용 자료."
boolean focusrectangle = false
end type

type dw_loc from datawindow within w_oidotime_r
integer x = 1285
integer y = 144
integer width = 841
integer height = 88
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_irlocno_s"
boolean border = false
boolean livescroll = true
end type

type gb_4 from groupbox within w_oidotime_r
integer x = 2171
integer y = 16
integer width = 1234
integer height = 228
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16777215
long backcolor = 79741120
end type

type gb_5 from groupbox within w_oidotime_r
integer x = 3424
integer y = 16
integer width = 526
integer height = 228
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
end type

