$PBExportHeader$w_orderno_pic.srw
forward 
global type w_orderno_pic from window
end type
type cb_print from commandbutton within w_orderno_pic
end type
type p_2 from picture within w_orderno_pic
end type
type p_1 from picture within w_orderno_pic
end type
type st_info from statictext within w_orderno_pic
end type
type cbx_resize from checkbox within w_orderno_pic
end type
type cb_exit from commandbutton within w_orderno_pic
end type
end forward

global type w_orderno_pic from window
integer width = 3895
integer height = 2248
boolean titlebar = true
string title = "원본보기(w_orderno_pic)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_print cb_print
p_2 p_2
p_1 p_1
st_info st_info
cbx_resize cbx_resize
cb_exit cb_exit
end type
global w_orderno_pic w_orderno_pic

type prototypes
//
Function Ulong ShellExecuteA (ulong hwnd, String lpOperation, String lpFile, String lpParameters, String lpDirectory, int nShowCmd ) Library "shell32.dll" alias for "ShellExecuteA;Ansi" 


end prototypes

type variables
//
Boolean ib_Resize
long    il_maxWidth, il_maxHeight
string  is_path
end variables

on w_orderno_pic.create
this.cb_print=create cb_print
this.p_2=create p_2
this.p_1=create p_1
this.st_info=create st_info
this.cbx_resize=create cbx_resize
this.cb_exit=create cb_exit
this.Control[]={this.cb_print,&
this.p_2,&
this.p_1,&
this.st_info,&
this.cbx_resize,&
this.cb_exit}
end on

on w_orderno_pic.destroy
destroy(this.cb_print)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_info)
destroy(this.cbx_resize)
destroy(this.cb_exit)
end on

event open;//
Blob    lb_picture, lb_pictemp
string  ls_orderno, ls_filepath, ls_path, ls_file, ls_filename
integer li_rtn, li_loop, i, li_filenum

long    ll_filelen
long    ll_maxWidth, ll_maxHeight
long    ll_org_width, ll_org_height,  ll_resizeWidth, ll_resizeHeight
decimal ld_basisRatio, ld_imgRatio

ls_orderno = Message.StringParm

ll_maxWidth  = p_1.width
ll_maxHeight = p_1.height

p_2.visible = false
p_2.OriginalSize = true

p_1.OriginalSize = true
p_1.PictureName  = ""

p_1.setredraw( false )
SELECT filename    INTO :ls_filename FROM SalePIC WHERE SalePIC.order_no = :ls_orderno;
SELECTBLOB filebin INTO :lb_picture  FROM SalePIC WHERE SalePIC.order_no = :ls_orderno;
if sqlca.sqlcode = 100 then
else
	p_1.SetPicture( lb_picture )
	p_2.SetPicture( lb_picture )
end if
p_1.setredraw( true )

ll_org_width  = UnitsToPixels(p_2.width,  XUnitsToPixels!)
ll_org_height = UnitsToPixels(p_2.height, YUnitsToPixels!)
st_info.text  = "사진: " + string(ll_org_width) + " x " + string(ll_org_height) + "px"

//////////////////////////////////////////////////////////////////////////////
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

is_path    = GetCurrentDirectory() + "\" + ls_filename
li_filenum = FileOpen(is_path, StreamMode!, Write!, Shared!, Append!)

for i = 1 to li_loop
	if i = li_loop then
		lb_pictemp = BlobMid(lb_picture, (i - 1) * 32765 + 1)
	else
		lb_pictemp = BlobMid(lb_picture, (i - 1) * 32765 + 1,32765)
	end if
	FileWrite(li_filenum, lb_pictemp)
next
Fileclose(li_filenum)
//////////////////////////////////////////////////////////////////////////////


//
ib_Resize = true
	
// 원본 리사이징 하기 	
ll_org_width  = UnitsToPixels(p_2.width,  XUnitsToPixels!)
ll_org_height = UnitsToPixels(p_2.height, YUnitsToPixels!)

ld_basisRatio = ll_maxHeight  / ll_maxWidth
ld_imgRatio   = ll_org_height / ll_org_width

if ld_imgRatio > ld_basisRatio then
	// Height가 기준 비율보다 길다.
	if ll_org_height > ll_maxHeight then
		ll_resizeHeight = ll_maxHeight;
		ll_resizeWidth  = (ll_org_width * ll_resizeHeight) / ll_org_height
	else
		ll_resizeWidth  = ll_org_width;
		ll_resizeHeight = ll_org_height;
	end if  
elseif ld_imgRatio < ld_basisRatio then
	// Width가 기준 비율보다 길다.  
	if ll_org_width > ll_maxWidth then
		ll_resizeWidth  = ll_maxWidth
		ll_resizeHeight = (ll_org_height * ll_resizeWidth) / ll_org_width
	else
		ll_resizeWidth  = ll_org_width
		ll_resizeHeight = ll_org_height
	end if	
else
  // 기준 비율과 동일한 경우
  ll_resizeWidth  = ll_org_width
  ll_resizeHeight = ll_org_height
end if

// 리사이즈한 크기로 이미지 크기 다시 지정
p_1.width  = ll_resizeWidth
p_1.height = ll_resizeHeight

end event

event resize;//
cb_exit.x  = newwidth  - cb_exit.width  - 32
cb_print.x = cb_exit.x - cb_print.width - 12

if ib_Resize then
	p_1.width  = newwidth  - (p_1.x * 2)
	p_1.height = newheight - p_1.y - p_1.x
end if

end event

type cb_print from commandbutton within w_orderno_pic
integer x = 3255
integer width = 279
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "프린트"
end type

event clicked;//
integer li_rtn
long    Job

li_rtn = PrintSetup()

if li_rtn = 1 then
	Job = PrintOpen()
	
	// Print the bitmap in its original size.
	PrintBitmap(Job, is_path, 50,100, 0,0)
	PrintClose(Job)
end if

end event

type p_2 from picture within w_orderno_pic
integer x = 37
integer y = 116
integer width = 329
integer height = 176
boolean originalsize = true
boolean focusrectangle = false
end type

type p_1 from picture within w_orderno_pic
integer x = 32
integer y = 116
integer width = 3771
integer height = 1988
boolean originalsize = true
boolean focusrectangle = false
end type

event doubleclicked;//
cbx_resize.checked = Not cbx_resize.checked
cbx_resize.TriggerEvent( clicked! )

if cbx_resize.checked = true then
	MessageBox("확인", "리사이즈 를 설정 합니다.")
else
	MessageBox("확인", "리사이즈 를 해지 합니다.")
end if

end event

type st_info from statictext within w_orderno_pic
integer x = 585
integer y = 20
integer width = 2647
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cbx_resize from checkbox within w_orderno_pic
integer x = 46
integer y = 20
integer width = 402
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "리사이즈"
boolean checked = true
end type

event clicked;//
ib_Resize = cbx_resize.checked

end event

type cb_exit from commandbutton within w_orderno_pic
integer x = 3547
integer width = 261
integer height = 116
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "닫기"
end type

event clicked;// 취소
Close(Parent)  

end event

