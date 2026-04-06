$PBExportHeader$w_whsheet_m.srw
$PBExportComments$SHEET추가관리(2003/08/06, 이인호)
forward
global type w_whsheet_m from w_inheritance
end type
end forward

global type w_whsheet_m from w_inheritance
integer x = 864
integer y = 864
integer width = 2258
integer height = 848
string title = "SHEET추가관리(w_whsheet_m)"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
end type
global w_whsheet_m w_whsheet_m

type variables
gs_where ist_code
datawindowchild idwc_qa
end variables

forward prototypes
public function string wf_coil (integer arg_row)
end prototypes

public function string wf_coil (integer arg_row);long ll_row, ll_count
int li_col
string ls_coil, ls_date, ls_item, ls_loc, ls_code1, ls_code2

dw_1.accepttext()
ls_date = string(dw_1.object.rcpt_date[1], 'yyyymmdd') + "%"

setnull(ls_coil)

ls_loc =  dw_1.object.loc_no[arg_row]
ls_item =  trim(dw_1.object.item_no[arg_row])
// 2001/05/31변경
		//===================================================
		// 로트 번호 부여 규칙.
		//소재   형태
		//A :알미늄 C :원코일
		//S :스틸   H :sheet
		//			   S :외주스리팅
		//H S : 유창작업장내 스리팅 -- 사내 작업일보시만 적용.
		// 예)SC010531001 :스틸 원코일2001년 5월 31일자 001번째 로트번호
		//===================================================
		// 현 코드규칙
		// mid(item_no, 1,1) = 'M' : 자재
		// 	mid(item_no, 2,1) = '1' : 원코일
		// 	mid(item_no, 2,1) = '3' : 스리팅
		// 		mid(item_no, 3,1) = 'A' : 알미늄
		// 		mid(item_no, 3,1) = 'S' : 스틸
		// 			mid(item_no, 4,1) = '1' : COIL
		// 			mid(item_no, 4,1) = '2' : SHEET
		//===================================================
		// loss 코드규칙(2001/07/16,이대준)
		// 		mid(item_no, 1,1) = 'A' : 알미늄
		// 		mid(item_no, 1,1) = 'S' : 스틸
		//    	mid(item_no, 2,1) = 'L' : loss
		// 	
		// 예)AL01071701, SL01071701
		//===================================================
//CHOOSE CASE mid(ls_item ,3,1)
//	CASE 'A' // 알미늄
//		ls_code1 = 'A'
//	CASE 'S' // 스틸
//		ls_code1 = 'S'
//END CHOOSE
ls_code1 = MidA(ls_item ,3,1)

select  count(item_no) into :ll_count
from lossitem
where loss_item = :ls_item;
if ll_count > 0 then
	ls_code2 = 'L'
	li_col = 11
else
	CHOOSE CASE MidA(ls_item ,2,1)
		CASE '1' // 원코일
			ls_code2 = 'C'
		CASE '3' // 스리팅
			ls_code2 = 'S'
	END CHOOSE

	CHOOSE CASE MidA(ls_item ,4,1)
		CASE '2' //SHEET
			ls_code2 = 'H'
	END CHOOSE
	li_col = 12
end if
	
// 2001/05/31변경 end

ls_date = ls_code1 + ls_code2 + MidA(string(dw_1.object.rcpt_date[1], 'yyyymmdd'), 3) + "%"
if MidA(ls_item ,4,1) = '1' then // 1; coil , 2 : sheet
	select max(coil_no) into :ls_coil from coilmst
	 where coil_no like :ls_date
		and ( substring(coil_no,:li_col,1) is null or  substring(coil_no,:li_col,1) = '') ;
else
	select max(sheet_no) into :ls_coil from sheetmst
	 where sheet_no like :ls_date
		and ( substring(sheet_no,:li_col,1) is null or  substring(sheet_no,:li_col,1) = '');
end if
if isnull(ls_coil) then
	if ll_count > 0 then
		ls_coil = LeftA(ls_date, 8) + "00"
	else
	   ls_coil = LeftA(ls_date, 8) + "000"
   end if  
end if
for ll_row = 1 to dw_1.rowcount()
	if not isnull(dw_1.object.sheet_no[ll_row]) then
		if LeftA(ls_coil,2) = LeftA(dw_1.object.sheet_no[ll_row], 2) &
			and ls_coil < LeftA(dw_1.object.sheet_no[ll_row], li_col - 1) then
			ls_coil = dw_1.object.sheet_no[ll_row] 
		end if
	end if
next
if ll_count > 0 then
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,2)) + 1 ,'00')
else
	ls_coil = LeftA(ls_coil, 8) + string(integer(MidA(ls_coil,9,3)) + 1 ,'000')
end if
return ls_coil

end function

on w_whsheet_m.create
call super::create
end on

on w_whsheet_m.destroy
call super::destroy
end on

event open;ist_code = message.powerobjectparm

dw_1.getchild('qa',idwc_qa)
gs_ds_qaall.ShareData(idwc_qa)

dw_1.settransobject(sqlca)
string ls_loc

select def_loc into :ls_loc from area
 where area_no = :gs_area;

dw_1.insertrow(0)
dw_1.object.flag[1] = 'S'
dw_1.object.rcpt_date[1] = wf_today()
dw_1.object.loc_no[1] = ls_loc
dw_1.object.item_no[1] = ist_code.str1
idwc_qa.setfilter("item_no = '" + ist_code.str1 + "'")
idwc_qa.filter()

dw_1.setfocus()

end event

event mousemove;//
end event

type pb_save from w_inheritance`pb_save within w_whsheet_m
integer x = 1870
integer y = 44
integer width = 343
integer height = 96
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
boolean default = true
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_save::clicked;dw_1.accepttext()
dw_1.object.cnt[1] = dw_1.object.qcnt[1]
dw_1.object.rcpt_qty[1] = dw_1.object.unit_qty[1]

dw_1.object.sheet_no[1] = wf_coil(dw_1.getrow())
dw_1.accepttext()
//qcnt
if wf_update1(dw_1,"N") = false then
	return
else
	ist_code.chk = "Y"
end if
closewithreturn(parent, ist_code)
end event

event pb_save::mousemove;//
end event

type dw_1 from w_inheritance`dw_1 within w_whsheet_m
integer x = 46
integer y = 48
integer width = 1769
integer height = 672
string dataobject = "d_whsheet_m"
boolean hscrollbar = false
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylelowered!
end type

event dw_1::itemchanged;call super::itemchanged;string ls_item,ls_data,ls_itemname
long ll_row, ll_cnt, ll_row1,ll_found

this.accepttext()
ll_row = this.getrow()
ls_item = this.object.item_no[ll_row]
choose case dwo.name
	case 'item_no'
		ls_data = data
		setnull(ls_item)
		
		select item_name into :ls_itemname from groupitem 
		where item_no = :ls_data;
		if sqlca.sqlcode = 100 then 
		  MessageBox("경고", '마스터에 없는 물품번호입니다.', Exclamation!)
		  this.object.item_no[row] = ls_item
		  return 1
		end if
		ls_item = this.object.item_no[ll_row]

		if ls_item <> '' then
			this.getchild("qa", idwc_qa)
			gs_ds_qaall.ShareData(idwc_qa)
			idwc_qa.setfilter("item_no = '" + ls_item + "'")
			idwc_qa.filter()
		end if
		setnull(ls_item)
		this.object.qa[ll_row] = ls_item
		if idwc_qa.rowcount() = 1 then
			ls_data = trim(idwc_qa.getitemstring(1,'qa'))
			this.object.qa[ll_row] = ls_data
		end if
	case 'qa'
		ls_data = data
		select count(*) into :ll_cnt from item
		 where item_no = :ls_item
			and qa = :ls_data
			and use_flag = 'C';
		if ll_cnt > 0 then
			messagebox("확인","위 규격은 사용불가된 규격입니다. ~r~n" &
								+ "정확한 규격을 등록하시거나 물품RELOAD를 하십시요.!",exclamation!)
			return 1
		end if
  	   ll_row1 = idwc_qa.RowCount( )
		ll_found = idwc_qa.Find("qa = '" + ls_data + "'", 1, ll_row1)
		
		if ll_found = 0 then
			IF MessageBox("확인","위와 같은 규격은 존재하지 않습니다!~r~n" &
				+ "신규규격 " + ls_data +"를 코드에 등록하시겠습니까?",Exclamation!, OKCancel!, 2) = 1 THEN
				if gf_iteminsert(ls_item, ls_data) = false then return 1
				idwc_qa.setfilter("item_no = '" + ls_item + "'")
				idwc_qa.filter()
			else
				return 1
			end if
		end if
end choose
return 0

end event

event dw_1::itemerror;call super::itemerror;string ls_null

setnull(ls_null)
choose case dwo.name
	case 'item_no'
		this.object.item_no[row] = ls_null
	case 'qa'
		this.object.qa[row] = ls_null
end choose
return 2
end event

type dw_2 from w_inheritance`dw_2 within w_whsheet_m
boolean visible = false
end type

type st_title from w_inheritance`st_title within w_whsheet_m
boolean visible = false
end type

type st_tips from w_inheritance`st_tips within w_whsheet_m
end type

type pb_compute from w_inheritance`pb_compute within w_whsheet_m
boolean visible = false
end type

type pb_print_part from w_inheritance`pb_print_part within w_whsheet_m
boolean visible = false
end type

type pb_close from w_inheritance`pb_close within w_whsheet_m
integer x = 1870
integer y = 160
integer width = 343
integer height = 96
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
string picturename = ""
alignment htextalign = center!
vtextalign vtextalign = vcenter!
end type

event pb_close::clicked;ist_code.chk = "N"
closewithreturn(parent, ist_code)

end event

event pb_close::mousemove;//
end event

type pb_print from w_inheritance`pb_print within w_whsheet_m
boolean visible = false
end type

type pb_cancel from w_inheritance`pb_cancel within w_whsheet_m
boolean visible = false
end type

type pb_delete from w_inheritance`pb_delete within w_whsheet_m
boolean visible = false
end type

type pb_insert from w_inheritance`pb_insert within w_whsheet_m
boolean visible = false
end type

type pb_retrieve from w_inheritance`pb_retrieve within w_whsheet_m
boolean visible = false
end type

type gb_3 from w_inheritance`gb_3 within w_whsheet_m
integer x = 1851
integer y = 0
integer width = 379
integer height = 272
end type

type gb_2 from w_inheritance`gb_2 within w_whsheet_m
integer x = 23
integer y = 0
integer width = 1815
integer height = 736
end type

type gb_1 from w_inheritance`gb_1 within w_whsheet_m
boolean visible = false
end type

