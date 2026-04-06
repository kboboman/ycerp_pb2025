$PBExportHeader$w_cdsupp_m.srw
$PBExportComments$구매거래처관리(1998/02/09,곽용덕)
forward
global type w_cdsupp_m from w_inheritance
end type
type dw_3 from datawindow within w_cdsupp_m
end type
type st_8 from statictext within w_cdsupp_m
end type
type st_4 from statictext within w_cdsupp_m
end type
type dw_4 from datawindow within w_cdsupp_m
end type
type dw_5 from datawindow within w_cdsupp_m
end type
type cb_3 from commandbutton within w_cdsupp_m
end type
type cb_4 from commandbutton within w_cdsupp_m
end type
type cb_5 from commandbutton within w_cdsupp_m
end type
type cb_6 from commandbutton within w_cdsupp_m
end type
type cb_7 from commandbutton within w_cdsupp_m
end type
type pb_7 from picturebutton within w_cdsupp_m
end type
type dw_6 from datawindow within w_cdsupp_m
end type
type st_1 from statictext within w_cdsupp_m
end type
type ddlb_fld from dropdownlistbox within w_cdsupp_m
end type
type ddlb_dwtitles from dropdownlistbox within w_cdsupp_m
end type
type st_9 from statictext within w_cdsupp_m
end type
type sle_value from singlelineedit within w_cdsupp_m
end type
type cb_filteron from commandbutton within w_cdsupp_m
end type
type cb_filteroff from commandbutton within w_cdsupp_m
end type
type cb_1 from commandbutton within w_cdsupp_m
end type
type cb_2 from commandbutton within w_cdsupp_m
end type
type st_vertical from u_splitbar_vertical within w_cdsupp_m
end type
type st_horizontal from u_splitbar_horizontal within w_cdsupp_m
end type
type ddlb_op from dropdownlistbox within w_cdsupp_m
end type
end forward

global type w_cdsupp_m from w_inheritance
integer width = 4498
integer height = 2656
string title = "매입거래처 관리(w_cdsupp_m)"
dw_3 dw_3
st_8 st_8
st_4 st_4
dw_4 dw_4
dw_5 dw_5
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
pb_7 pb_7
dw_6 dw_6
st_1 st_1
ddlb_fld ddlb_fld
ddlb_dwtitles ddlb_dwtitles
st_9 st_9
sle_value sle_value
cb_filteron cb_filteron
cb_filteroff cb_filteroff
cb_1 cb_1
cb_2 cb_2
st_vertical st_vertical
st_horizontal st_horizontal
ddlb_op ddlb_op
end type
global w_cdsupp_m w_cdsupp_m

type variables
public string is_custno,is_custname
st_print i_print
string  is_dw, is_chk = "0", is_chk2 = "0"
datawindow get_dw 

end variables

forward prototypes
public function integer wf_get_data ()
end prototypes

public function integer wf_get_data ();//	초기화
delete	from	#w_cdsupp	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp delete중	error')
	return	-1
end if

//	단가1
insert into #w_cdsupp (	supp_no, item_no, qa, prc1, date1 )
select supp_no, item_no, qa, p.prc,	p.i_date
  from suppprc	p
 where p.i_date = ( select	max(a.i_date)
							 from	suppprc	a
							where	a.supp_no 	= 	p.supp_no
							and	a.item_no	=	p.item_no
							and	a.qa			=	p.qa
							and	isnull(a.i_date,	'3000-01-01')	<=	getdate())	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp insert[prc1]중	error')
	return	-1
end if

//	단가2
update	#w_cdsupp
set	prc2	=	p.prc,
		date2	=	p.i_date
from	suppprc	p,	#w_cdsupp	tt
where	p.item_no	=	tt.item_no
and	p.qa			=	tt.qa
and	p.i_date	=	( select	max(a.i_date)
							 from	suppprc	a,	#w_cdsupp	t
							where	a.supp_no 	= 	p.supp_no
							and	a.item_no	=	t.item_no
							and	a.item_no	=	p.item_no
							and	a.qa			=	t.qa
							and	a.qa			=	p.qa
							and	a.i_date		<	t.date1	)	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp update[prc1]중	error')
	return	-1
end if


//	단가3
update	#w_cdsupp
set	prc3	=	p.prc,
		date3	=	p.i_date
from	suppprc	p,	#w_cdsupp	tt
where	p.item_no	=	tt.item_no
and	p.qa			=	tt.qa
and	p.i_date	=	( select	max(a.i_date)
							 from	suppprc	a,	#w_cdsupp	t
							where	a.supp_no 	= 	p.supp_no
							and	a.item_no	=	t.item_no
							and	a.item_no	=	p.item_no							
							and	a.qa			=	t.qa
							and	a.qa			=	p.qa
							and	a.i_date		<	t.date2	)	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp update[prc2]중	error')
	return	-1
end if


//	단가4
update	#w_cdsupp
set	prc4	=	p.prc,
		date4	=	p.i_date
from	suppprc	p,	#w_cdsupp	tt
where	p.item_no	=	tt.item_no
and	p.qa			=	tt.qa
and	p.i_date	=	( select	max(a.i_date)
							 from	suppprc	a,	#w_cdsupp	t
							where	a.supp_no 	= 	p.supp_no
							and	a.item_no	=	t.item_no
							and	a.item_no	=	p.item_no							
							and	a.qa			=	t.qa
							and	a.qa			=	p.qa
							and	a.i_date		<	t.date3	)	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp update[prc3]중	error')
	return	-1
end if


//	단가5
update	#w_cdsupp
set	prc5	=	p.prc,
		date5	=	p.i_date
from	suppprc	p,	#w_cdsupp	tt
where	p.item_no	=	tt.item_no
and	p.qa			=	tt.qa
and	p.i_date	=	( select	max(a.i_date)
							 from	suppprc	a,	#w_cdsupp	t
							where	a.supp_no 	= 	p.supp_no
							and	a.item_no	=	t.item_no
							and	a.item_no	=	p.item_no							
							and	a.qa			=	t.qa
							and	a.qa			=	p.qa
							and	a.i_date		<	t.date4	)	;
if	sqlca.SQLDBcode < 0 THEN
	messagebox('안내','#w_cdsupp update[prc4]중	error')
	return	-1
end if

return	0

end function

on w_cdsupp_m.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.st_8=create st_8
this.st_4=create st_4
this.dw_4=create dw_4
this.dw_5=create dw_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.pb_7=create pb_7
this.dw_6=create dw_6
this.st_1=create st_1
this.ddlb_fld=create ddlb_fld
this.ddlb_dwtitles=create ddlb_dwtitles
this.st_9=create st_9
this.sle_value=create sle_value
this.cb_filteron=create cb_filteron
this.cb_filteroff=create cb_filteroff
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_vertical=create st_vertical
this.st_horizontal=create st_horizontal
this.ddlb_op=create ddlb_op
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.cb_6
this.Control[iCurrent+10]=this.cb_7
this.Control[iCurrent+11]=this.pb_7
this.Control[iCurrent+12]=this.dw_6
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.ddlb_fld
this.Control[iCurrent+15]=this.ddlb_dwtitles
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.sle_value
this.Control[iCurrent+18]=this.cb_filteron
this.Control[iCurrent+19]=this.cb_filteroff
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.cb_2
this.Control[iCurrent+22]=this.st_vertical
this.Control[iCurrent+23]=this.st_horizontal
this.Control[iCurrent+24]=this.ddlb_op
end on

on w_cdsupp_m.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.st_8)
destroy(this.st_4)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.pb_7)
destroy(this.dw_6)
destroy(this.st_1)
destroy(this.ddlb_fld)
destroy(this.ddlb_dwtitles)
destroy(this.st_9)
destroy(this.sle_value)
destroy(this.cb_filteron)
destroy(this.cb_filteroff)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_vertical)
destroy(this.st_horizontal)
destroy(this.ddlb_op)
end on

event open;call super::open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

////////////////////////////////////////////////////////////////////////////////////////////
st_vertical.of_set_leftobject( dw_1 )
st_vertical.of_set_leftobject( dw_4 )
st_vertical.of_set_rightobject( dw_2 )
st_vertical.of_set_rightobject( dw_5 )
st_vertical.of_set_minsize(250, 250)

st_horizontal.of_set_topobject( dw_1 )
st_horizontal.of_set_topobject( dw_2 )
st_horizontal.of_set_bottomobject( dw_4 )
st_horizontal.of_set_bottomobject( dw_5 )
st_horizontal.of_set_minsize(250, 250)
////////////////////////////////////////////////////////////////////////////////////////////

ddlb_fld.reset()
ddlb_dwtitles.reset()
ddlb_dwtitles.visible = false

if GF_Permission('구매거래처등록관리', gs_userid) = 'Y' then	
else
	pb_delete.enabled = false
	pb_save.enabled = false
end if

dw_3.settransobject(sqlca)
dw_6.settransobject(sqlca)
dw_6.visible = false

dw_1.retrieve()
dw_3.retrieve()

cb_3.enabled = false
cb_4.enabled = false
cb_5.enabled = false
cb_6.enabled = false


end event

event closequery;call super::closequery;if cb_3.enabled = true then
	sqlca.autocommit = true	
	
	Execute immediate "drop table #w_cdsupp" ;
	if sqlca.sqlcode < 0 then
		messagebox('안내', sqlca.SQLErrText)
		return 1
	end if
	
	sqlca.autocommit = false
end if
end event

event resize;call super::resize;//
gb_3.width  = newwidth  - (gb_3.x * 2)

st_vertical.x      = dw_1.x + dw_1.width
st_vertical.height = dw_1.height

dw_2.x      = st_vertical.x + st_vertical.width
dw_2.width  = newwidth - dw_2.x - gb_3.x
dw_2.height = dw_1.height

st_vertical.height  = newheight - dw_1.y - gb_3.x

st_horizontal.y     = dw_1.y + dw_1.height
st_horizontal.width = newwidth  - (gb_3.x * 2)

dw_4.y      = st_horizontal.y + st_horizontal.height
dw_4.height = newheight - dw_4.y - gb_3.x

dw_5.x      = dw_2.x
dw_5.y      = dw_4.y
dw_5.width  = newwidth  - dw_5.x - gb_3.x
dw_5.height = dw_4.height

end event

type pb_save from w_inheritance`pb_save within w_cdsupp_m
integer x = 2523
integer y = 56
end type

event pb_save::clicked;string	ls_register_no, ls_msg
long	ll_row, ll_cnt
integer l_net
dwItemStatus l_status
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"S",string(today(),'yyyy/mm/dd'))
//==========================================================================
/*
	2006.02.01
	모듈라 사용으로 인해 사용자 구분
	<-- 원본소스시작 -->						
	
	<-- 원본소스끝 -->						

	<-- 소스추가시작 -->						
*/					
If gs_userid = 'yonga252' Or gs_userid = 'pjgyo' Then
	If LeftA(dw_2.object.supp_no[1],1) <> 'T' Then
		MESSAGEBOX('확인', "모듈라 거래처코드의 첫자리는 T만 사용가능합니다")
		return
	End If
End If		
//gs_userid = 'ybs'
If gs_userid = 'k0172h' or gs_userid = 'kimkj' or gs_userid = 'bestvic' Then
	If LeftA(dw_2.object.supp_no[1],1) = 'T' Then
		MESSAGEBOX('확인', "모듈라 거래처코드입니다")
		return
	End If
End If	
/*
	<-- 소스추가끝 -->
*/
dw_2.accepttext()
if LenA(trim(dw_2.object.supp_no[1])) < 5 then
	messagebox('경고','구매처 코드는 전체 5자리로 해야 합니다.', stopsign!)
	return
end if

if LeftA(dw_2.object.supp_no[1],1) = 'B' &
   or LeftA(dw_2.object.supp_no[1],1) = 'G' &
   or LeftA(dw_2.object.supp_no[1],1) = 'M' &
   or LeftA(dw_2.object.supp_no[1],1) = 'P' &
   or LeftA(dw_2.object.supp_no[1],1) = 'T' &
   or LeftA(dw_2.object.supp_no[1],1) = 'Z' then
	
ELSE
	beep(1)
	wf_focus(dw_2,'supp_no')
	MESSAGEBOX('확인', "자재코드 첫자리는 B,G,M,P,T,Z 만 사용가능합니다")
	return
end if

l_status = dw_2.GetItemStatus(dw_2.GetRow(), 0 , Primary!)
if l_status = NewModified! then	
	
	if wf_nullchk(dw_2) = false then return
	
	//-- 2012.06.22(이재형) : 신규등록 시 사업자등록번호 중복체크
	ls_register_no	= dw_2.object.register_no[1]	//사업자등록번호
	
	select top 1 isNULL(count(register_no),0)
	into :ll_cnt
	from supp (nolock)
	where register_no = :ls_register_no
	using sqlca;
	
	// -- 2018.09.14 jowonsuk: 사업자등록번호 중복체크 내용은 알리고 계속 진행할지, 중단할지 선택	
	if ll_cnt > 0 then
		ls_msg = "이미 등록된 사업자등록번호가 존재합니다.~n~n"
//		ls_msg += "확인 후 다시 진행하여 주시기 바랍니다.~n"
		ls_msg += "작업을 계속 진행 하시겠습니까?.~n"
//		MessageBox("확인",ls_msg,Exclamation!)

		l_net = MessageBox("확인",ls_msg,Exclamation!, OKCancel!, 2)
		
		IF l_net = 1 THEN 			
		ELSE
			return						
		END IF
		
	end if
	
end if

if wf_update1(dw_2,"Y") = true then
	is_custno   = dw_2.object.supp_no[1]
	is_custname = dw_2.object.supp_name[1]
   if l_status = NewModified! then	
	   ll_row = dw_1.insertrow(0)
	   dw_1.scrolltorow(ll_row)
	else
		dw_1.SetItem(dw_1.GetRow(),'supp_name',	is_custname)
	end if
end if

end event

type dw_1 from w_inheritance`dw_1 within w_cdsupp_m
integer x = 32
integer y = 528
integer width = 1751
integer height = 1276
integer taborder = 50
string dataobject = "d_cdsupp_s"
boolean hscrollbar = false
end type

event dw_1::clicked;//
if isnull( row ) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)

//
string ls_suppno
long   ll_row

ls_suppno = trim(this.object.supp_no[row])
if isnull(ls_suppno) OR ls_suppno = "" then RETURN

dw_2.retrieve( ls_suppno )
if cb_3.enabled = true then	// 조회
	dw_4.retrieve(ls_suppno)
	
	dw_5.setredraw(false)
	dw_5.dataobject = 'd_cdsuppprc_r'
	dw_5.settransobject(sqlca)
	dw_5.retrieve(ls_suppno)
	dw_5.setredraw(true)

	cb_4.enabled = true
	cb_5.enabled = true
	cb_6.enabled = true
end if

end event

type st_title from w_inheritance`st_title within w_cdsupp_m
integer y = 20
integer width = 1070
integer height = 140
string text = "매입거래처 관리"
end type

type st_tips from w_inheritance`st_tips within w_cdsupp_m
end type

type pb_compute from w_inheritance`pb_compute within w_cdsupp_m
boolean visible = false
integer x = 1659
integer taborder = 140
end type

type pb_print_part from w_inheritance`pb_print_part within w_cdsupp_m
boolean visible = false
integer x = 2811
end type

type pb_close from w_inheritance`pb_close within w_cdsupp_m
integer x = 2715
integer y = 56
integer taborder = 150
end type

event pb_close::clicked;call super::clicked;close(parent)
end event

type pb_print from w_inheritance`pb_print within w_cdsupp_m
integer x = 2331
integer y = 56
integer taborder = 160
end type

event pb_print::clicked;w_repsuper w_print
//===============사용자별 프로그램 사용현황=================================
gf_usecount(gs_userid,parent.classname(),"P",string(today(),'yyyy/mm/dd'))
//==========================================================================

i_print.st_datawindow = dw_3
i_print.st_print_sheet = " 프린트용지 : A4"
i_print.st_print_desc = " 이 프로그램은 구매거래처 마스터를 출력합니다." 

gs_print_control  = 'DataWindow.Print.Orientation=1 DataWindow.Print.Paper.Size=9 Datawindow.Zoom=106'
opensheetwithparm(w_print, i_print,parentwindow(), 1, Original!)



end event

type pb_cancel from w_inheritance`pb_cancel within w_cdsupp_m
boolean visible = false
integer x = 2427
integer taborder = 170
end type

type pb_delete from w_inheritance`pb_delete within w_cdsupp_m
integer x = 2139
integer y = 56
integer taborder = 180
end type

event pb_delete::clicked;string ls_suppno
long ll_row

if dw_2.rowcount() < 1 then return	

if MessageBox("확인",'삭제하시겠읍니까?',information!, OKCancel!, 2) = 2 then
	return
end if	

ls_suppno = trim(dw_2.object.supp_no[1])

select count(*) into :ll_row from pur where supp_no = :ls_suppno;

if ll_row > 0 then
	MessageBox("확인", "이거래처는 발주서가 이미 작성되어 사용중입니다. 삭제할 수 없습니다!")
	return
end if

dw_1.accepttext()
dw_2.accepttext()

ls_suppno = dw_1.object.supp_no[dw_1.getrow()]
if ls_suppno = dw_2.object.supp_no[dw_2.getrow()] then
	dw_2.deleterow(0)
	wf_update1(dw_2,"Y")
   dw_1.deleterow(dw_1.getrow())
else
	dw_2.deleterow(0)
	dw_2.retrieve(ls_suppno)
end if	

end event

type pb_insert from w_inheritance`pb_insert within w_cdsupp_m
integer x = 1947
integer y = 56
integer taborder = 200
end type

event pb_insert::clicked;call super::clicked;long ll_row

dw_2.reset()
dw_4.reset()
dw_5.reset()
cb_3.enabled = false
cb_4.enabled = false
cb_5.enabled = false
cb_6.enabled = false

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow(ll_row)
dw_2.setcolumn('supp_no')
dw_2.setfocus()
end event

type pb_retrieve from w_inheritance`pb_retrieve within w_cdsupp_m
integer x = 1755
integer y = 56
integer taborder = 190
end type

event pb_retrieve::clicked;call super::clicked;
dw_1.setredraw(false)
dw_1.reset()
dw_1.retrieve()
dw_3.retrieve()

if cb_3.enabled = true then
	dw_4.reset()	
end if
dw_1.setredraw(true)

end event

type gb_3 from w_inheritance`gb_3 within w_cdsupp_m
integer x = 32
integer y = 328
integer width = 4352
integer height = 172
integer taborder = 70
integer textsize = -8
integer weight = 400
end type

type gb_2 from w_inheritance`gb_2 within w_cdsupp_m
integer x = 1157
integer y = 16
integer width = 535
integer height = 204
integer taborder = 130
integer textsize = -8
integer weight = 400
end type

type gb_1 from w_inheritance`gb_1 within w_cdsupp_m
integer x = 1714
integer y = 16
integer width = 1234
integer taborder = 40
integer weight = 400
end type

type dw_2 from w_inheritance`dw_2 within w_cdsupp_m
integer x = 1829
integer y = 528
integer width = 2555
integer height = 1276
integer taborder = 60
string dataobject = "d_cdsupp_m"
boolean vscrollbar = false
end type

event dw_2::rbuttondown;call super::rbuttondown;//
gs_zipcode ls_zipcode
string   ls_roadzip, ls_zips, ls_addr, ls_zip[], ls_address[]

gs_calendar lstr_calendar

if row < 1 then RETURN

SELECT item_cd INTO :ls_roadzip FROM CodeMST WHERE type = '우편번호' AND use_yn = 'Y';
if isnull(ls_roadzip) OR ls_roadzip = "" then ls_roadzip = "ROAD"

choose case dwo.name
	case "addr1"
		OpenWithParm(w_postcode_daum, ls_zipcode)
		ls_zipcode = Message.PowerObjectParm
		if ls_zipcode.chk <> "N" then
			ls_zips  = ls_zipcode.zipcode
			ls_addr  = ls_zipcode.address
			
			GF_Split(ls_zips, "|", ls_zip)
			GF_Split(ls_addr, "|", ls_address)

			if ls_roadzip = "ROAD" then
				this.object.addr1[1]   = ls_zip[1]
				this.object.addr2[1]   = ls_address[1]
				this.object.addr3[1]   = ""
				this.object.addr[1]    = ls_address[1]
			else
				this.object.addr1[1]   = ls_zip[2]
				this.object.addr2[1]   = ls_address[2]
				this.object.addr3[1]   = ""
				this.object.addr[1]    = ls_address[2]
			end if
		end if		
end choose		

end event

type dw_3 from datawindow within w_cdsupp_m
boolean visible = false
integer x = 1568
integer y = 52
integer width = 137
integer height = 108
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_cdsupp_r"
boolean livescroll = true
end type

type st_8 from statictext within w_cdsupp_m
integer x = 1390
integer y = 260
integer width = 2999
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 8388608
long backcolor = 12632256
boolean enabled = false
string text = "주민등록번호기재분인 사업자의 사업자등록번호는 꼭 ~'999-99-9999~' 로 입력바랍니다.(회계부가세)"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cdsupp_m
integer x = 41
integer y = 264
integer width = 1330
integer height = 44
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "첫자리는 B,G,M,P,Z 만 사용가능.모듈러는 T로시작."
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_cdsupp_m
integer x = 32
integer y = 1860
integer width = 1751
integer height = 556
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdsuppetc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;get_dw = dw_4
end event

event clicked;//
if isnull( row ) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type dw_5 from datawindow within w_cdsupp_m
string tag = "d_cdsuppprc_m"
integer x = 1829
integer y = 1860
integer width = 2555
integer height = 556
integer taborder = 70
boolean bringtotop = true
string title = "d_cdsuppprc_r"
string dataobject = "d_cdsuppprc_m"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;get_dw = dw_5
end event

event clicked;//
if isnull( row ) OR row < 1 then RETURN

is_dw  = this.classname()
GF_DWTitle2ddlb( this, ddlb_fld, ddlb_dwtitles )
GF_DWClick2Info(this, ddlb_fld, ddlb_op, sle_value, row, dwo.name, ddlb_dwtitles)


end event

type cb_3 from commandbutton within w_cdsupp_m
integer x = 3333
integer y = 388
integer width = 155
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "조회"
end type

event clicked;// 단가이력 조회
dw_5.dataobject = 'd_cdsuppprc_r'
dw_5.settransobject(sqlca)

if	wf_get_data()	<	0	then	return -1
dw_4.retrieve( dw_1.object.supp_no[dw_1.getrow()] )
dw_5.retrieve( dw_1.object.supp_no[dw_1.getrow()] )

end event

type cb_4 from commandbutton within w_cdsupp_m
integer x = 3497
integer y = 388
integer width = 155
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "추가"
end type

event clicked;long ll_row, ll_dw1_row
string ls_supp_no, ls_getdate
ll_dw1_row = dw_1.getrow()
ls_supp_no = dw_1.object.supp_no[dw_1.getrow()]

select top 1 convert(varchar(10), getdate(), 111) into :ls_getdate from login;

choose case get_dw
	case dw_4
//			dw_4.retrieve(ls_supp_no)
			ll_row = dw_4.insertrow(0)
			dw_4.scrolltorow(ll_row)
			dw_4.object.supp_no[ll_row] = ls_supp_no
			dw_4.object.i_date[ll_row] = date(ls_getdate)
	case dw_5
		if ls_supp_no = dw_2.object.supp_no[dw_2.getrow()] then
			if dw_5.dataobject <> 'd_cdsuppprc_m' then
				dw_5.dataobject = 'd_cdsuppprc_m'
				dw_5.settransobject(sqlca)
				dw_5.retrieve(ls_supp_no)
			end if
			ll_row = dw_5.insertrow(0)
			dw_5.scrolltorow(ll_row)
			dw_5.object.supp_no[ll_row] = ls_supp_no
			dw_5.object.i_date[ll_row] = date(ls_getdate)
		end if
end choose
get_dw.setfocus()
	


end event

type cb_5 from commandbutton within w_cdsupp_m
integer x = 3662
integer y = 388
integer width = 155
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "삭제"
end type

event clicked;// 특기사항, 단가이력 삭제
long ll_row

choose case get_dw
	case dw_4
			dw_4.deleterow(0)
		
	case dw_5
		if dw_5.dataobject = 'd_cdsuppprc_m' then
			dw_5.deleterow(0)
		else
			messagebox("안내", "단가 이력에서 삭제할 행을 클릭후 삭제를 버튼을 누르세요.")
			dw_5.dataobject = 'd_cdsuppprc_m'
			dw_5.settransobject(sqlca)
			dw_5.retrieve( dw_1.object.supp_no[dw_1.getrow()] )
		end if
end choose
	

end event

type cb_6 from commandbutton within w_cdsupp_m
integer x = 3826
integer y = 388
integer width = 155
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
boolean enabled = false
string text = "저장"
end type

event clicked;if dw_5.dataobject = 'd_cdsuppprc_m' then
	wf_update2(dw_4,dw_5,'Y')
else
	wf_update1(dw_4,'Y')
end if


end event

type cb_7 from commandbutton within w_cdsupp_m
integer x = 2679
integer y = 388
integer width = 640
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "단가 이력 자료생성"
end type

event clicked;// 단가 이력 자료생성

if	MessageBox('확인', '단가 이력 생성 작업은 약 15 ~~ 20분의 시간이 소요됩니다.~n' + &
              '생성 작업중에 다른 작업을 하실수 없습니다. 작업 하시겠습니까?', question!, yesno!, 2) = 2 then
	return
end if

setpointer(hourglass!)
cb_3.enabled = true
cb_4.enabled = true
cb_5.enabled = true
cb_6.enabled = true

dw_4.enabled = true
dw_5.enabled = true


string ls_sql
ls_sql = ' create table #w_cdsupp ( ' + &
			' supp_no		varchar(10)		null,' + &
			' item_no		varchar(10)		null,' + &
			' qa				varchar(19)		null,' + &
			' prc1			decimal(12,3)	null,' + &
			' prc2			decimal(12,3)	null,' + &
			' prc3			decimal(12,3)	null,' + &
			' prc4			decimal(12,3)	null,' + &
			' prc5			decimal(12,3)	null,' + &
			' date1			datetime			null,' + &
			' date2			datetime			null,' + &
			' date3			datetime			null,' + &
			' date4			datetime			null,' + &			
			' date5			datetime			null )'
			
sqlca.autocommit = true			
Execute immediate :ls_sql;
IF sqlca.SQLDBCode < 0 THEN
	ROLLBACK USING sqlca;
	MessageBox('안내', sqlca.SQLErrText)
	return
end if

sqlca.autocommit = false

if	wf_get_data() < 0 then
	cb_3.enabled = false
	cb_4.enabled = false
	cb_5.enabled = false
	cb_6.enabled = false
	
	dw_4.visible = false
	dw_5.visible = false
	MessageBox('확인', '작업중 에러가 발생해서, 단가이력 자료생성이 불가능 합니다.')
	return	-1
end if

dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)

get_dw = dw_5

end event

type pb_7 from picturebutton within w_cdsupp_m
integer x = 1198
integer y = 56
integer width = 457
integer height = 144
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "거래처리스트"
vtextalign vtextalign = vcenter!
end type

event clicked;string  ls_Docname, ls_Named, ls_ExpandName
integer ls_Value, li_Pos, li_value
DataWindow dwxls

if MessageBox("확인","거래처리스트를 엑셀파일로 만들겠습니까?", Exclamation!, OKCancel!, 1) = 2 then
	return
end if

dw_6.Retrieve()
dwxls = dw_6
if dwxls.rowcount() < 1 then
	MessageBox("확인","엑셀 파일을 생성할 데이터가 존재하지 않습니다.")
	return
end if

if dwxls.rowcount() > 0 then
   //===============================================================//
	ls_value = GetFileSaveName("Select File", & 
										ls_Docname, ls_Named, "XLS", &
										"엑셀 (*.XLS), *.XLS," + &
										"CSV(쉽표로 분리), *.CSV,")
	li_Pos = PosA(ls_Named, ".")
	ls_ExpandName = MidA(ls_Named, li_Pos + 1, LenA(ls_Named) - li_Pos)
	if ls_Value = 1 then
			if ls_ExpandName = "xls" OR ls_ExpandName = "XLS" then
					dwxls.SaveAsAscII(ls_DocName)
			elseif ls_ExpandName = "csv" OR ls_ExpandName = "CSV" then
//						dwxls.SaveAs(ls_DocName, CSV!, TRUE)
			end if
	end if
   //===============================================================//
	
end if   

MessageBox("확인","엑셀파일 작업완료.")

end event

type dw_6 from datawindow within w_cdsupp_m
integer x = 55
integer y = 192
integer width = 119
integer height = 64
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_cdsupp_list"
boolean livescroll = true
end type

type st_1 from statictext within w_cdsupp_m
integer x = 78
integer y = 408
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

type ddlb_fld from dropdownlistbox within w_cdsupp_m
integer x = 261
integer y = 388
integer width = 480
integer height = 580
integer taborder = 110
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

type ddlb_dwtitles from dropdownlistbox within w_cdsupp_m
integer x = 320
integer y = 396
integer width = 306
integer height = 92
integer taborder = 120
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

type st_9 from statictext within w_cdsupp_m
integer x = 777
integer y = 408
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
string text = "연산: "
boolean focusrectangle = false
end type

type sle_value from singlelineedit within w_cdsupp_m
integer x = 1225
integer y = 392
integer width = 581
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
end type

type cb_filteron from commandbutton within w_cdsupp_m
integer x = 1819
integer y = 388
integer width = 197
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
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
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Filter(arg_dw, ddlb_fld, ddlb_op, sle_value, ddlb_dwtitles)

end event

event getfocus;//

end event

type cb_filteroff from commandbutton within w_cdsupp_m
integer x = 2021
integer y = 388
integer width = 197
integer height = 84
integer taborder = 140
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
DataWindow arg_dw

ddlb_fld.text  = ""
ddlb_op.text   = ""
sle_value.text = ""

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2UnFilter( arg_dw )

pb_retrieve.triggerevent(clicked!)
arg_dw.scrolltorow(1)

//arg_dw.groupcalc()

end event

type cb_1 from commandbutton within w_cdsupp_m
integer x = 2222
integer y = 388
integer width = 183
integer height = 84
integer taborder = 150
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "A", ddlb_dwtitles )

end event

type cb_2 from commandbutton within w_cdsupp_m
integer x = 2409
integer y = 388
integer width = 183
integer height = 84
integer taborder = 160
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
DataWindow arg_dw

choose case is_dw
	case "dw_1"
		arg_dw  = dw_1
	case "dw_4"
		arg_dw  = dw_4
	case "dw_5"
		arg_dw  = dw_5
	case else
		MessageBox("확인","해당하는 DataWindow를 선택하시기 바랍니다.")
end choose
GF_DW2Sort( arg_dw, ddlb_fld, "D", ddlb_dwtitles )

end event

type st_vertical from u_splitbar_vertical within w_cdsupp_m
integer x = 1797
integer y = 528
integer height = 1896
boolean bringtotop = true
end type

type st_horizontal from u_splitbar_horizontal within w_cdsupp_m
integer x = 32
integer y = 1816
integer width = 4361
boolean bringtotop = true
end type

type ddlb_op from dropdownlistbox within w_cdsupp_m
integer x = 946
integer y = 384
integer width = 270
integer height = 500
integer taborder = 80
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

