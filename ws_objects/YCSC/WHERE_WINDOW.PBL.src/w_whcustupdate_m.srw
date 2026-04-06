$PBExportHeader$w_whcustupdate_m.srw
$PBExportComments$거래처변경(2003/09/15,이인호)
forward
global type w_whcustupdate_m from window
end type
type cbx_2 from checkbox within w_whcustupdate_m
end type
type st_4 from statictext within w_whcustupdate_m
end type
type cbx_1 from checkbox within w_whcustupdate_m
end type
type cb_2 from commandbutton within w_whcustupdate_m
end type
type dw_12 from datawindow within w_whcustupdate_m
end type
type cb_1 from commandbutton within w_whcustupdate_m
end type
type st_3 from statictext within w_whcustupdate_m
end type
type st_2 from statictext within w_whcustupdate_m
end type
type st_1 from statictext within w_whcustupdate_m
end type
type dw_3 from datawindow within w_whcustupdate_m
end type
type dw_2 from datawindow within w_whcustupdate_m
end type
type cb_reset from commandbutton within w_whcustupdate_m
end type
type cb_cancel from commandbutton within w_whcustupdate_m
end type
type gb_1 from groupbox within w_whcustupdate_m
end type
type tab_1 from tab within w_whcustupdate_m
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_13 from datawindow within tabpage_2
end type
type dw_4 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_13 dw_13
dw_4 dw_4
end type
type tabpage_3 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_4 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_5 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_7 dw_7
end type
type tabpage_6 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_8 dw_8
end type
type tabpage_7 from userobject within tab_1
end type
type dw_9 from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_9 dw_9
end type
type tabpage_8 from userobject within tab_1
end type
type dw_10 from datawindow within tabpage_8
end type
type tabpage_8 from userobject within tab_1
dw_10 dw_10
end type
type tabpage_9 from userobject within tab_1
end type
type dw_11 from datawindow within tabpage_9
end type
type tabpage_9 from userobject within tab_1
dw_11 dw_11
end type
type tab_1 from tab within w_whcustupdate_m
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
tabpage_8 tabpage_8
tabpage_9 tabpage_9
end type
end forward

global type w_whcustupdate_m from window
integer x = 320
integer y = 160
integer width = 4626
integer height = 2808
boolean titlebar = true
string title = "거래처변경(w_whcustupdate_m)"
windowtype windowtype = response!
long backcolor = 79741120
cbx_2 cbx_2
st_4 st_4
cbx_1 cbx_1
cb_2 cb_2
dw_12 dw_12
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_3 dw_3
dw_2 dw_2
cb_reset cb_reset
cb_cancel cb_cancel
gb_1 gb_1
tab_1 tab_1
end type
global w_whcustupdate_m w_whcustupdate_m

type variables
gs_where istr_select
string is_where,  is_scenesql
datawindowchild idwc_scene, idwc_cust, idwc_cust2
datawindow dw1, dw4, dw5, dw6, dw7, dw8, dw9, dw10 , dw11  , dw13 

end variables

forward prototypes
public function boolean wf_update8 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, datawindow arg_dw6, datawindow arg_dw7, datawindow arg_dw8, string arg_str)
end prototypes

public function boolean wf_update8 (datawindow arg_dw1, datawindow arg_dw2, datawindow arg_dw3, datawindow arg_dw4, datawindow arg_dw5, datawindow arg_dw6, datawindow arg_dw7, datawindow arg_dw8, string arg_str);if arg_dw1.update(true,false) = 1 then
	if arg_dw2.update(true,false) = 1 then
		if arg_dw3.update(true,false) = 1 then
			if arg_dw4.update(true,false) = 1 then
				if arg_dw5.update(true,false) = 1 then
					if arg_dw6.update(true,false) = 1 then
						if arg_dw7.update(true,false) = 1 then
							if arg_dw8.update(true,true) = 1 then
								commit;
								arg_dw1.resetupdate()
								arg_dw2.resetupdate()
								arg_dw3.resetupdate()
								arg_dw4.resetupdate()
								arg_dw5.resetupdate()
								arg_dw6.resetupdate()
								arg_dw7.resetupdate()
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

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

istr_select = Message.PowerObjectParm

dw1 = tab_1.tabpage_1.dw_1
dw4 = tab_1.tabpage_2.dw_4
dw5 = tab_1.tabpage_3.dw_5
dw6 = tab_1.tabpage_4.dw_6
dw7 = tab_1.tabpage_5.dw_7
dw8 = tab_1.tabpage_6.dw_8
dw9 = tab_1.tabpage_7.dw_9
dw10 = tab_1.tabpage_8.dw_10
dw11 = tab_1.tabpage_9.dw_11
//dw13 = tab_1.tabpage_1.dw_13
dw1.SetTransObject(SQLCA)
dw4.SetTransObject(SQLCA)
dw5.SetTransObject(SQLCA)
dw6.SetTransObject(SQLCA)
dw7.SetTransObject(SQLCA)
dw8.SetTransObject(SQLCA)
dw9.SetTransObject(SQLCA)
dw10.SetTransObject(SQLCA)
//dw13.SetTransObject(SQLCA)

dw_2.object.cust_no.protect = 1 
dw_2.object.cust_no.background.color = 78682240
dw_2.object.scene_code.protect = 1 
dw_2.object.scene_code.background.color = 78682240

dw_2.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
dw_2.insertrow(0)

dw_3.getchild("cust_no", idwc_cust)
gs_ds_whcustret.sharedata(idwc_cust)
dw_3.insertrow(0)
dw_3.getchild("scene_code", idwc_scene)
idwc_scene.insertrow(1)
idwc_scene.settransobject(sqlca)
is_scenesql = idwc_scene.describe("datawindow.table.select")

dw_12.SetTransObject(SQLCA)
dw_12.insertrow(1)
dw_12.object.do_no[1] = istr_select.str1
string ls_where, ls_sql

dw_2.getchild("scene_code", idwc_scene)
idwc_scene.settransobject(sqlca)

ls_where = " WHERE cust_no = ~~'" + istr_select.str2 + "~~'" 
ls_sql = "datawindow.table.select = '" + is_scenesql + ls_where + "'"

idwc_scene.modify(ls_sql)
idwc_scene.settransobject(sqlca)
idwc_scene.retrieve()

dw_2.object.cust_no[1] = istr_select.str2
if trim(istr_select.str3) = '' then setnull(istr_select.str3)
dw_2.object.scene_code[1] = istr_select.str3

istr_select.chk = 'N'
dw1.retrieve(istr_select.str1)

end event

on w_whcustupdate_m.create
this.cbx_2=create cbx_2
this.st_4=create st_4
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.dw_12=create dw_12
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_reset=create cb_reset
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.tab_1=create tab_1
this.Control[]={this.cbx_2,&
this.st_4,&
this.cbx_1,&
this.cb_2,&
this.dw_12,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_3,&
this.dw_2,&
this.cb_reset,&
this.cb_cancel,&
this.gb_1,&
this.tab_1}
end on

on w_whcustupdate_m.destroy
destroy(this.cbx_2)
destroy(this.st_4)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.dw_12)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_reset)
destroy(this.cb_cancel)
destroy(this.gb_1)
destroy(this.tab_1)
end on

type cbx_2 from checkbox within w_whcustupdate_m
integer x = 283
integer y = 544
integer width = 352
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "전체선택"
end type

event clicked;dw_12.SelectRow(0, this.checked)
end event

type st_4 from statictext within w_whcustupdate_m
integer x = 41
integer y = 60
integer width = 1070
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택된 출고번호만 변경처리됩니다."
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_whcustupdate_m
integer x = 18
integer y = 540
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "선택"
end type

event clicked;if this.checked = false then dw_12.SelectRow(0, this.checked)
end event

type cb_2 from commandbutton within w_whcustupdate_m
integer x = 14
integer y = 432
integer width = 626
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처,현장별"
end type

event clicked;dw_12.retrieve('S', istr_select.str2,  istr_select.str3)
end event

type dw_12 from datawindow within w_whcustupdate_m
integer x = 14
integer y = 612
integer width = 626
integer height = 2112
integer taborder = 90
string title = "none"
string dataobject = "d_whcustupdate_s"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

this.scrolltorow(row)
tab_1.selecttab(2)
dw4.retrieve(this.object.do_no[row])
if cbx_1.checked = true then
	this.SelectRow(row,  NOT this.IsSelected(row))
end if

end event

type cb_1 from commandbutton within w_whcustupdate_m
integer x = 14
integer y = 336
integer width = 626
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처,전체현장"
end type

event clicked;
dw_12.retrieve('C', istr_select.str2, '')

end event

type st_3 from statictext within w_whcustupdate_m
integer x = 1838
integer y = 44
integer width = 891
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "거래처 변경후 각 업무담당자에게 필히 연락하시기 바랍니다."
boolean focusrectangle = false
end type

type st_2 from statictext within w_whcustupdate_m
integer x = 18
integer y = 256
integer width = 224
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 255
long backcolor = 67108864
string text = "변경후:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_whcustupdate_m
integer x = 18
integer y = 172
integer width = 224
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "변경전:"
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_whcustupdate_m
integer x = 238
integer y = 248
integer width = 2843
integer height = 80
integer taborder = 50
string title = "none"
string dataobject = "d_oicustgiving_s"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_cust_no, ls_where, ls_sql, ls_null
long   ll_cnt

this.accepttext()
CHOOSE CASE dwo.name
	CASE 'cust_no'
		ls_cust_no  =  data
		
		SELECT count(*) INTO :ll_cnt
		  FROM customer
		 WHERE cust_no  =  :ls_cust_no
		   AND (customer.sale_control  = 'Y' or customer.sale_control = 'A') ;
		
		IF  ll_cnt  > 0  THEN
			Messagebox('확인','선택하신 거래처는 매출통제가 되어있는 거래처입니다.~r~r~n거래처변경하려면 통제관리를 하십시오.')
			dw_3.Reset()
			dw_3.getchild("cust_no", idwc_cust)
			gs_ds_whcustret.sharedata(idwc_cust)
			
			dw_3.insertrow(0)
			dw_3.getchild("scene_code", idwc_scene)
			
			idwc_scene.insertrow(1)
			idwc_scene.SetTransObject(sqlca)
			is_scenesql = idwc_scene.describe("datawindow.table.select")
			Return
		END IF
		
		setnull(ls_null)
		this.object.scene_code[1] = ls_null
		
		select count(*) into :ll_cnt from scene
		 where cust_no = :ls_cust_no;
		if ll_cnt > 0 then
			dw_3.getchild("scene_code", idwc_scene)
						  
		   ls_where = " WHERE cust_no = ~~'" + ls_cust_no + "~~'" 
			ls_sql   = "datawindow.table.select = '" + is_scenesql + ls_where + "'"
			
			idwc_scene.modify(ls_sql)
			idwc_scene.SetTransObject(sqlca)
			ll_cnt = idwc_scene.retrieve()
		end if
			
		if ll_cnt > 0 then
			this.object.scene_code.protect = 0
			this.object.scene_code.background.color = RGB(255,255,255)
		else
			this.object.scene_code.protect = 1 
			this.object.scene_code.background.color = 78682240
		end if
		
	CASE ELSE
END CHOOSE

this.setfocus()

end event

type dw_2 from datawindow within w_whcustupdate_m
integer x = 238
integer y = 160
integer width = 2843
integer height = 80
integer taborder = 40
string title = "none"
string dataobject = "d_oicustgiving_s"
boolean border = false
boolean livescroll = true
end type

type cb_reset from commandbutton within w_whcustupdate_m
integer x = 1125
integer y = 44
integer width = 626
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처 변경 처리"
end type

event clicked;//==GF_USEPROGRAM(프로그램 사용현황)==============================================================
GF_USEPROGRAM( gs_userid, Parent.ClassName(), "S", string(gf_today(),'yyyy/mm/dd'), Parent.Title )
//================================================================================================

//====================================================
// 거래처 변경시 변경되어야 할 테이블의 cust_no
//====================================================
// 1 sale   : 트리거있슴
// 2 do     : 트리거있슴
// 3 purdet : 트리거없음 => 거래처명만 있어서 취소
// 4 routtempnew : 트리거없음
// 5 mpsdet : 트리거없음
// 6 sfcday : 트리거없음
// 7 ret    : 트리거없음
// 8 doshipetc : 트리거없음
//====================================================
//w_whcustupdate_m
//====================================================
string ls_cust, ls_scene, ls_after_cust, ls_after_scene, ls_dono
long   ll_row,  li_cnt

ls_dono  = istr_select.str1
ls_cust  = istr_select.str2
ls_scene = istr_select.str3
dw_3.accepttext()

if trim(ls_scene) = '' then setnull(ls_scene)
if trim(ls_cust)  = '' or isnull(ls_cust) then
	MessageBox("확인","변경전 거래처를 등록 하십시요")
	dw_2.setfocus()
	return
end if

ls_after_cust = dw_3.object.cust_no[1]
if trim(ls_after_cust) = '' or isnull(ls_after_cust) then
	MessageBox("확인","변경후 거래처를 등록 하십시요")
	dw_3.setfocus()
	return
end if

ls_after_scene = dw_3.object.scene_code[1]
if trim(ls_after_scene) = '' or isnull(ls_after_scene) then
	MessageBox("확인","변경후 거래처 현장명을 등록 하십시요")
	dw_3.setfocus()
	return
end if

if MessageBox("확인", "수주/구매발주/생산계획/작업일보 내역의 거래처가~r~n" + &
              "변경후의 거래처로 모두 변경됩니다.~r~n~r~n" + &
			     "내역전체의 거래처를 변경하시겠습니까?", Exclamation!, OKCancel!, 2) = 2 then return

dw_12.accepttext()
for ll_row = 1 to dw_12.rowcount()
	if dw_12.IsSelected(ll_row) = true then
		dw_12.scrolltorow(ll_row)
		ls_dono = dw_12.object.do_no[ll_row]

		SELECT count(*) INTO :li_cnt FROM do WHERE invoice_print = 'N' AND do_no = :ls_dono;
		if li_cnt = 1 then
		else
			rollback;
			messagebox("오류[DO]", "선택된 출고번호[" + ls_dono + "]는 이미 매출이 작성된 송장입니다.~r~n" &
									+ "재 조회하신 후에 변경처리를 하십시요")
			continue
		end if
		
		//1 sale : 트리거있슴
		UPDATE sale 
		   SET cust_no = :ls_after_cust, scene_code = :ls_after_scene, login_id = :gs_userid
		 WHERE order_no IN (SELECT distinct sale_no FROM dodet WHERE do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox("오류[SALE]",sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		//2 do : 트리거
		UPDATE do 
		   SET cust_no = :ls_after_cust, spot_code = :ls_after_scene
		  FROM dodet
		 WHERE do.do_no = :ls_dono;
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류[DO]',sqlca.sqlerrtext,exclamation!)
			continue
		end if	 
		
		//3 purdet : 트리거없음
		// purdet는 cust_name 과 sale_no와 seq_no를 보관하고 있는데 cust_name이 임의로도 들어 갈수 있음으로
		// purdet.cust_name은 변경하지 않는다.
		//	UPDATE purdet SET cust_name
		//	 where cust_name = :ls_cust;
		//	 if sqlca.sqlcode < 0 then
		//		 messagebox('오류',sqlca.sqlerrtext,exclamation!)
		//		 rollback;
		//		 continue
		//	 end if	 
		
		//4 routtempnew : 트리거없음
		UPDATE routtempnew 
		   SET cust_no = :ls_after_cust, scene_code = :ls_after_scene
		 WHERE sale_no  IN (select distinct sale_no from dodet where do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류routtempnew',sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		//5 mpsdet : 트리거없음
		UPDATE mpsdet 
		   SET cust_no = :ls_after_cust, scene_code = :ls_after_scene
		 where sale_no in (select distinct sale_no from dodet where do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류mpsdet',sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		//6 sfcday : 트리거없음
		UPDATE sfcday 
		   SET cust_no = :ls_after_cust, scene_code = :ls_after_scene
		 WHERE sale_no in (select distinct sale_no from dodet where do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류sfcday',sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		//7 ret : 트리거없음
		UPDATE ret 
		   SET cust_no = :ls_after_cust, spot_code = :ls_after_scene
		 WHERE sale_no  in (select distinct sale_no from dodet where do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류ret',sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		//8 doshipetc : 트리거없음
		UPDATE doshipetc 
		   SET cust_no = :ls_after_cust, scene_code = :ls_after_scene
		 WHERE sale_no  in (select distinct sale_no from dodet where do_no = :ls_dono);
		if sqlca.sqlcode < 0 then
			rollback;
			messagebox('오류doshipetc',sqlca.sqlerrtext,exclamation!)
			continue
		end if
		
		COMMIT;
		dw_12.SelectRow(ll_row,false)

		//////////////////////////////////////////////////
		// 2009년 5월 15일 변경이력 기록 하기
		//////////////////////////////////////////////////
		STRING   ls_merge, ls_bcustnm, ls_fcustnm
		INTEGER  li_seqno, li_seqno2
		DATE	   ld_today
				
		SELECT cust_name INTO :ls_bcustnm  FROM CUSTOMER WHERE CUST_NO  = :ls_cust;		 
		SELECT cust_name INTO :ls_fcustnm  FROM CUSTOMER WHERE CUST_NO  = :ls_after_cust;

		ls_merge = '거래처:' + ls_bcustnm + ' 의 자료가 ' + gs_username + ' (' + gs_userid + ')에 의해 변경되었습니다.'
		ls_merge = ls_merge + ' 변경내역:' + ls_fcustnm + '거래처로 변경되었습니다.'
	
		INSERT INTO sysmsg ( flogin,	tlogin, msgdate, msg, del ) VALUES ( :gs_userid, 'hanmr', getdate(), :ls_merge,'N');
		COMMIT;
	
		SELECT  isnull(max(log_seq),0) + 1 INTO :li_seqno FROM do_log WHERE log_date = :ld_today ;

		INSERT INTO customer_control_his (gbn, cust_cd, log_date, sale_control, cust_cd2, user_id)
		VALUES ('2', :ls_cust, getdate(), 'N',:ls_after_cust, :gs_userid);
		COMMIT;

		INSERT INTO  customer_control_his (gbn, cust_cd, log_date, sale_control, cust_cd2, user_id)
		VALUES ('3', :ls_after_cust, getdate(), 'N', :ls_cust, :gs_userid);
		COMMIT;

		
		INSERT INTO  do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date, ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code)
		VALUES (convert(datetime, convert(varchar(10), getdate(), 112)), :li_seqno, :gs_userid, :ls_dono, null, null, null, null, null, null, null, null, null, '변경전 거래처 : '+:ls_bcustnm, :ls_cust, :ls_scene);
		COMMIT;
		
		li_seqno++
		INSERT INTO  do_log (log_date, log_seq, gs_userid, do_no, user_id, do_area_no, do_case, do_date, issue_date, ship_amount, do_cash, do_rate, do_total, do_jobdesc, cust_no, spot_code)
		VALUES (convert(datetime, convert(varchar(10), getdate(), 112)), :li_seqno, :gs_userid, :ls_dono, null, null, null, null, null, null, null, null, null, '변경후 거래처 : '+:ls_fcustnm, :ls_after_cust, :ls_after_scene);
		COMMIT;
//////////////////////////////////////////////////

	end if
next

istr_select.chk = 'Y'
istr_select.str2 = ls_after_cust
istr_select.str3 = ls_after_scene
MessageBox("확인", "처리가 완료되었습니다.")


end event

type cb_cancel from commandbutton within w_whcustupdate_m
event clicked pbm_bnclicked
integer x = 2789
integer y = 44
integer width = 251
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
boolean cancel = true
end type

event clicked;ClosewithReturn( parent,istr_select )
end event

type gb_1 from groupbox within w_whcustupdate_m
integer x = 18
integer width = 3054
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
end type

type tab_1 from tab within w_whcustupdate_m
integer x = 654
integer y = 336
integer width = 3959
integer height = 2388
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
tabpage_8 tabpage_8
tabpage_9 tabpage_9
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.tabpage_8=create tabpage_8
this.tabpage_9=create tabpage_9
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7,&
this.tabpage_8,&
this.tabpage_9}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
destroy(this.tabpage_8)
destroy(this.tabpage_9)
end on

event selectionchanged;string ls_do
long ll_row

ll_row = dw_12.getrow()
if ll_row < 1 then return

ls_do = dw_12.object.do_no[ll_row]

choose case newindex
	case 1
		dw1.retrieve(ls_do)
//		dw13.retrieve(ls_do)
	case 2
		dw4.retrieve(ls_do)
	case 3
		dw5.retrieve(ls_do)
	case 4
		dw6.retrieve(ls_do)
	case 5
		dw7.retrieve(ls_do)
	case 6
		dw8.retrieve(ls_do)
	case 7
		dw9.retrieve(ls_do)
	case 8
		dw10.retrieve(ls_do)
	case 9
		dw11.retrieve(ls_do)
	case else
		/*statementblock*/
end choose

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "수주"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer width = 3918
integer height = 2268
integer taborder = 70
string title = "none"
string dataobject = "d_whcustupdate_m1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "출고"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_13 dw_13
dw_4 dw_4
end type

on tabpage_2.create
this.dw_13=create dw_13
this.dw_4=create dw_4
this.Control[]={this.dw_13,&
this.dw_4}
end on

on tabpage_2.destroy
destroy(this.dw_13)
destroy(this.dw_4)
end on

type dw_13 from datawindow within tabpage_2
integer y = 8
integer width = 2382
integer height = 88
integer taborder = 80
string title = "none"
string dataobject = "d_oicustgiving_s"
boolean border = false
boolean livescroll = true
end type

type dw_4 from datawindow within tabpage_2
integer y = 120
integer width = 3918
integer height = 2144
integer taborder = 80
string title = "none"
string dataobject = "d_whcustupdate_m2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "발주"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_3.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_3.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_3
integer width = 3026
integer height = 1180
integer taborder = 90
string title = "none"
string dataobject = "d_whcustupdate_m3"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_4 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "가생산계획"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_4.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_4.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_4
integer width = 3026
integer height = 1180
integer taborder = 90
string title = "none"
string dataobject = "d_whcustupdate_m4"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_5 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "생산계획"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tabpage_5.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tabpage_5.destroy
destroy(this.dw_7)
end on

type dw_7 from datawindow within tabpage_5
integer width = 3026
integer height = 1180
integer taborder = 100
string title = "none"
string dataobject = "d_whcustupdate_m5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_6 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "작업일보"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_8 dw_8
end type

on tabpage_6.create
this.dw_8=create dw_8
this.Control[]={this.dw_8}
end on

on tabpage_6.destroy
destroy(this.dw_8)
end on

type dw_8 from datawindow within tabpage_6
integer width = 3026
integer height = 1180
integer taborder = 10
string title = "none"
string dataobject = "d_whcustupdate_m6"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_7 from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "반품"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_9 dw_9
end type

on tabpage_7.create
this.dw_9=create dw_9
this.Control[]={this.dw_9}
end on

on tabpage_7.destroy
destroy(this.dw_9)
end on

type dw_9 from datawindow within tabpage_7
integer width = 3026
integer height = 1180
integer taborder = 110
string title = "none"
string dataobject = "d_whcustupdate_m7"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_8 from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "운반비"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_10 dw_10
end type

on tabpage_8.create
this.dw_10=create dw_10
this.Control[]={this.dw_10}
end on

on tabpage_8.destroy
destroy(this.dw_10)
end on

type dw_10 from datawindow within tabpage_8
integer width = 3026
integer height = 1180
integer taborder = 70
string title = "none"
string dataobject = "d_whcustupdate_m8"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_9 from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 100
integer width = 3922
integer height = 2272
long backcolor = 79741120
string text = "샘플"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_11 dw_11
end type

on tabpage_9.create
this.dw_11=create dw_11
this.Control[]={this.dw_11}
end on

on tabpage_9.destroy
destroy(this.dw_11)
end on

type dw_11 from datawindow within tabpage_9
integer width = 3026
integer height = 1180
integer taborder = 90
string title = "none"
string dataobject = "d_whcustupdate_m9"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

