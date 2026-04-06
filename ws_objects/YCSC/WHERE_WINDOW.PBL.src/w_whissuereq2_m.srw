$PBExportHeader$w_whissuereq2_m.srw
$PBExportComments$출고의뢰서 복사(2003/10/13,정갑용)
forward
global type w_whissuereq2_m from window
end type
type em_4 from editmask within w_whissuereq2_m
end type
type em_3 from editmask within w_whissuereq2_m
end type
type st_4 from statictext within w_whissuereq2_m
end type
type st_3 from statictext within w_whissuereq2_m
end type
type cb_2 from commandbutton within w_whissuereq2_m
end type
type cb_1 from commandbutton within w_whissuereq2_m
end type
type em_2 from editmask within w_whissuereq2_m
end type
type st_1 from statictext within w_whissuereq2_m
end type
type st_2 from statictext within w_whissuereq2_m
end type
type em_1 from editmask within w_whissuereq2_m
end type
end forward

global type w_whissuereq2_m from window
integer x = 1691
integer y = 372
integer width = 1047
integer height = 488
boolean titlebar = true
string title = "출고일자변경(w_whissuereq2_m)"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
em_4 em_4
em_3 em_3
st_4 st_4
st_3 st_3
cb_2 cb_2
cb_1 cb_1
em_2 em_2
st_1 st_1
st_2 st_2
em_1 em_1
end type
global w_whissuereq2_m w_whissuereq2_m

forward prototypes
public subroutine wf_reqseq ()
end prototypes

public subroutine wf_reqseq ();string ls_req_date
long ll_maxseq

ls_req_date = em_1.text
select isnull(max(req_seq),0) into :ll_maxseq from issuereq
  where req_date = :ls_req_date 
    and salesman = :gs_userid;

if sqlca.sqlcode < 0 then
 messagebox('오류',sqlca.sqlerrtext,exclamation!)
 rollback;
 return
end if

em_3.text = string(ll_maxseq + 1)
end subroutine

on w_whissuereq2_m.create
this.em_4=create em_4
this.em_3=create em_3
this.st_4=create st_4
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_2=create em_2
this.st_1=create st_1
this.st_2=create st_2
this.em_1=create em_1
this.Control[]={this.em_4,&
this.em_3,&
this.st_4,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.em_2,&
this.st_1,&
this.st_2,&
this.em_1}
end on

on w_whissuereq2_m.destroy
destroy(this.em_4)
destroy(this.em_3)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_1)
end on

event open;em_2.text = w_oiissuereq_m.em_1.text
em_4.text = w_oiissuereq_m.em_2.text

em_1.text = string(RelativeDate(today(),1),"yyyy/mm/dd")

wf_reqseq()
end event

type em_4 from editmask within w_whissuereq2_m
integer x = 763
integer y = 36
integer width = 128
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type em_3 from editmask within w_whissuereq2_m
integer x = 768
integer y = 156
integer width = 128
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "##0"
end type

type st_4 from statictext within w_whissuereq2_m
integer x = 928
integer y = 48
integer width = 101
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "차"
boolean focusrectangle = false
end type

type st_3 from statictext within w_whissuereq2_m
integer x = 928
integer y = 168
integer width = 101
integer height = 52
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "차"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_whissuereq2_m
integer x = 681
integer y = 292
integer width = 329
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "취소"
end type

event clicked;close (parent)

end event

type cb_1 from commandbutton within w_whissuereq2_m
integer x = 306
integer y = 292
integer width = 329
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "확인"
end type

event clicked;string ls_req_date, ls_rem, ls_req_text
string ls_old_req_date, ls_old_userid
int li_old_req_seq, li_req_seq


ls_old_req_date = em_2.text
li_old_req_seq = integer(em_4.text)
ls_old_userid = w_oiissuereq_m.dw_3.object.user[1]

ls_req_date = em_1.text
li_req_seq = integer(em_3.text)

If em_1.text <= em_2.text Then 
	messagebox('확인', '변경후 출고일자가 변경전 출고일자보다 커야 됩니다.', exclamation!)
	return
End If

insert into issuereq (req_date, salesman, req_seq, accept_user, rem, req_text, accept_area, confirm_flag)
               select :ls_req_date, :ls_old_userid, :li_req_seq, accept_user, rem, req_text, accept_area, 'N' from issuereq 
                 where req_date = :ls_old_req_date
                   and salesman = :ls_old_userid
                   and req_seq = :li_old_req_seq;
 if sqlca.sqlcode < 0 then
	 messagebox('오류',sqlca.sqlerrtext,exclamation!)
	 rollback;
	 return
 end if

insert into issuereqdet (req_date,     salesman,   req_seq,     req_flag, seq, cust_no, scene_code, add_scene, sale_no, item_name, uom, issue_flag, issue_schedule, ship_flag, ship_case, tel, rem)
                  select :ls_req_date, :ls_old_userid, :li_req_seq, req_flag, seq, cust_no, scene_code, add_scene, sale_no, item_name, uom, issue_flag, issue_schedule, ship_flag, ship_case, tel, rem from issuereqdet
                    where req_date = :ls_old_req_date
                      and salesman = :ls_old_userid
                      and req_seq = :li_old_req_seq
						  order by seq;

if sqlca.sqlcode < 0 then
	messagebox('오류',sqlca.sqlerrtext,exclamation!)
	rollback;
	return
end if

commit;

w_oiissuereq_m.em_1.text = em_1.text
w_oiissuereq_m.em_2.text = em_3.text

w_oiissuereq_m.pb_retrieve.triggerevent(clicked!)

cb_2.triggerevent(clicked!)

end event

type em_2 from editmask within w_whissuereq2_m
integer x = 361
integer y = 36
integer width = 357
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long backcolor = 16777215
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
end type

type st_1 from statictext within w_whissuereq2_m
integer x = 55
integer y = 168
integer width = 279
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "변경후"
boolean focusrectangle = false
end type

type st_2 from statictext within w_whissuereq2_m
integer x = 55
integer y = 48
integer width = 279
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "변경전"
boolean focusrectangle = false
end type

type em_1 from editmask within w_whissuereq2_m
integer x = 361
integer y = 156
integer width = 357
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
boolean autoskip = true
string displaydata = ""
end type

event rbuttondown;
openWithParm(w_calendar, message.stringparm)
if message.stringparm <> 'N' then
	this.text = string(date(message.stringparm))
end if

end event

event modified;
wf_reqseq()
end event

