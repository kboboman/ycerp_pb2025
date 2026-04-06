$PBExportHeader$w_cdgetpost.srw
$PBExportComments$우정국 검색서비스
forward 
global type w_cdgetpost from window
end type
type cb_import from commandbutton within w_cdgetpost
end type
type cbx_browser from checkbox within w_cdgetpost
end type
type ole_browser from u_web_browser within w_cdgetpost
end type
type mle_response from multilineedit within w_cdgetpost
end type
type cbx_source from checkbox within w_cdgetpost
end type
type cb_more from commandbutton within w_cdgetpost
end type
type cb_close from commandbutton within w_cdgetpost
end type
type cb_ok from commandbutton within w_cdgetpost
end type
type cb_retrieve from commandbutton within w_cdgetpost
end type
type sle_addr from singlelineedit within w_cdgetpost
end type
type dw_list from datawindow within w_cdgetpost
end type
type ln_h from line within w_cdgetpost
end type
type r_h from statictext within w_cdgetpost
end type
end forward

global type w_cdgetpost from window
integer width = 4736
integer height = 2260
boolean titlebar = true
string title = "우체국 검색서비스"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_import cb_import
cbx_browser cbx_browser
ole_browser ole_browser
mle_response mle_response
cbx_source cbx_source
cb_more cb_more
cb_close cb_close
cb_ok cb_ok
cb_retrieve cb_retrieve
sle_addr sle_addr
dw_list dw_list
ln_h ln_h
r_h r_h
end type
global w_cdgetpost w_cdgetpost

type variables
gs_where istr_where
string is_col  ='1', is_FilePathName, is_FileName
long   il_page = 1

end variables

forward prototypes
public function string wf_replace (string s, string s1, string s2)
public subroutine wf_getpost (integer ai_page)
public function integer wf_split (readonly string sstring, readonly string sseparator, ref string soutputarray[])
end prototypes

public function string wf_replace (string s, string s1, string s2);// wf_replace return string
// s		string
// s1		string
// s2		string 

Integer	iPos

iPos = PosA(s, s1)

Do While(iPos > 0)
	s = ReplaceA(s, iPos, LenA(s1), s2)
	iPos = PosA(s, s1)
Loop

Return s

	
end function

public subroutine wf_getpost (integer ai_page);////////////////////////////////////////////////////////////////////////
// wf_getpost return none
// argument integer ai_page (몇번째 page 를 호출할 것인지 기재)
////////////////////////////////////////////////////////////////////////
blob    lb_args
boolean lb_return
string  ls_url, ls_args, ls_result, ls_value
string  ls_tr_split[], ls_td_split[], ls_juso_split[]
long    ll_length, li_rtn  
long    ll_pos, ll_row, ll_rowcount, ll_col, ll_colcount, lY, lX, ll_cnt = 50

string  ls_addr  

OleObject    XMLHTTP

ls_addr =  Trim(sle_addr.Text)  
setpointer(hourglass!)

// 주소정보 요청 페이지 및 페이지당 row 수, 검색어 
ls_url  = 'http://www.juso.go.kr/support/AddressMainSearch.do?'
ls_args = 'currentPage=' + string(ai_page) + '&countPerPage='+string(ll_cnt)+'&searchType=location_newaddr&searchKeyword=' + ls_addr

try
	XMLHTTP = CREATE OleObject
	XMLHTTP.ConnectToNewObject("MSXML2.XMLHTTP")

	//XMLHTTP.open("GET", ls_url + ls_args, false)
	//XMLHTTP.send()
	XMLHTTP.open ("POST", ls_url, false)
	XMLHTTP.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	XMLHTTP.send(ls_args)
	
	ls_result = XMLHTTP.StatusText
	li_rtn    = XMLHTTP.Status
	if li_rtn >= 300 then
		MessageBox("POST Request Failed", ls_result)
	else
		ls_result  = XMLHTTP.ResponseText
		mle_Response.text = ls_result
	end if
	XMLHTTP.DisconnectObject()		// 종료

catch (RuntimeError rte)
	MessageBox("Error", "RuntimeError - " + rte.getMessage())
end try 

if LenA(ls_result) = 0 then
	MessageBox("확인", "검색된 내용이 없습니다.")
	RETURN
end if

//////////////////////////////////////////////////////
ls_result = WF_Replace(ls_result, '<TR>' ,  '<tr>')
ls_result = WF_Replace(ls_result, '</TR>', '</tr>')
ls_result = WF_Replace(ls_result, '<TD>' ,  '<td>')
ls_result = WF_Replace(ls_result, '</TD>', '</td>')
ls_result = WF_Replace(ls_result, '< td>',  '<td>')
ls_result = WF_Replace(ls_result, '<td >',  '<td>')
ls_result = WF_Replace(ls_result, '<BODY',  '<body')
ls_result = WF_Replace(ls_result, 'BODY>',  'body>')

ll_pos    = PosA(ls_result, '<body') 	// <body>
if ll_pos = 0 then RETURN             	// 검색결과 없음 

ls_result = MidA(ls_result, ll_pos)
ls_result = MidA(ls_result, 1, PosA(ls_result, '</html>') -1 )  // </body>

ll_pos    = PosA(ls_result, '<table class="mainSearch">') // 대상시작 위치
if ll_pos = 0 then RETURN             // 검색결과 없음 

ls_result = MidA(ls_result, ll_pos)
ls_result = MidA(ls_result, 1, PosA(ls_result, '</table>') + 8 )   // 대상종료 위치

mle_Response.text = ls_result


ls_tr_split = {""}
WF_Split( ls_result, "<tr", ls_tr_split )		// TR 나누기

for ll_row = 1 to UpperBound(ls_tr_split)
	if ll_row = 1 then
		ls_value = ls_tr_split[ll_row]
	else
		ls_value = "<tr" + ls_tr_split[ll_row]
	end if

	if PosA(ls_value, "<tr") > 0 then
		if PosA(ls_value, "</tr>") > 0 then	
			ls_td_split = {""}
			WF_Split( ls_value, "<td", ls_td_split )
		
			for ll_col = 1 to UpperBound(ls_td_split)
				if ll_col = 1 then
					ls_value = ls_td_split[ll_col]
				else
					ls_value = "<td" + ls_td_split[ll_col]
				end if
			
				if PosA(ls_value, "<td") > 0 then	
					if PosA(ls_value, "</td>") > 0 then					
						ls_value = WF_Replace(ls_value, '<img src="/images/support/line.gif"/>' , '')
						ls_value = WF_Replace(ls_value, '<img src="/images/support/line2.gif"/>', '')
						ls_value = WF_Replace(ls_value, '<img src="/images/support/line3.gif"/>', '')
						ls_value = WF_Replace(ls_value, '<img src="/images/support/line4.gif"/>', '')
						ls_value = WF_Replace(ls_value, '<img src="/images/support/line5.gif"/>', '')
		
						ls_value = WF_Replace(ls_value, '<td style="border-left: 2px">'     , '<td>')
						ls_value = WF_Replace(ls_value, '<tr style="height: 5px;">'         , '<tr>')
						
						ls_value = WF_Replace(ls_value, CharA(20), '')
						ls_value = WF_Replace(ls_value, CharA(13), '')
						ls_value = WF_Replace(ls_value, CharA(09), '')
						ls_value = WF_Replace(ls_value, CharA(10), '')
						ls_value = WF_Replace(ls_value, CharA(14), '')
		
						ls_value = WF_Replace(ls_value, '<b>'   , '')
						ls_value = WF_Replace(ls_value, '</b>'  , '')
						ls_value = WF_Replace(ls_value, '</a>'  , '')
						ls_value = WF_Replace(ls_value, '<br/>' , '')
						ls_value = WF_Replace(ls_value, '<br />', '')
						ls_value = WF_Replace(ls_value, '&nbsp;', '')
						ls_value = WF_Replace(ls_value, '  '    ,' ')
						
						ls_value = WF_Replace(ls_value, '<td></td>', '')		// 공난줄 삭제
					end if
				end if

				if PosA(ls_value, "<td") > 0 then	
					if PosA(ls_value, "</td>") > 0 then					
						if ll_col = 2 then
							lY++
							dw_list.insertrow( lY )
						end if
											
						ls_value = WF_Replace(ls_value, '</td>' , '')
						ls_value = WF_Replace(ls_value, '<td>'  , '')
						ls_value = WF_Replace(ls_value, '<td align="center">', '')
						ls_value = WF_Replace(ls_value, '<img src="/images/support/rel_jibun.gif" alt="관련지번" style="display: inline"/>','')

						//dw_list.setitem(lY, ll_col, ls_value)
						choose case ll_col
							case 2
								ls_value = trim(WF_Replace(ls_value, '.', ''))
								dw_list.setitem(lY, "seq", ls_value)
								
							case 3
								if PosA(ls_value, "<") > 0 then
									dw_list.setitem(lY, "onclick", ls_value)

									ls_juso_split = {""}						
									WF_Split( ls_value, "<", ls_juso_split )		// <
	
									
									for lX = 1 to UpperBound(ls_juso_split)
										ls_value = ls_juso_split[lX]
										ls_value = WF_Replace(ls_value, '/span>' ,'')
										dw_list.setitem(lY, "onclick", trim(ls_value))
	
										ll_pos   = PosA(ls_value, '>') + 1
										if ll_pos > 0 then									
											ls_value = MidA(ls_value, ll_pos)
										end if
									
										ls_juso_split[lX] = trim(ls_value)
									next
	
									ls_value = ""
									for lX = 1 to UpperBound(ls_juso_split)
										ls_value = ls_value + " " + ls_juso_split[lX]
									next
									/////////////////////////////////////////////////
									if PosA(ls_value, '상세주소(동ㆍ층ㆍ호)보기') > 0 then
										dw_list.setitem(lY, "onclick", '상세주소(동ㆍ층ㆍ호)보기')
									end if
									
									ls_value = trim(WF_Replace(ls_value, '상세주소(동ㆍ층ㆍ호)보기', ''))
									dw_list.setitem(lY, "st_juso", ls_value)
									/////////////////////////////////////////////////
									
									if PosA(ls_value, "<span onclick") > 0 then
										ls_value = MidA(ls_value, ll_pos)
										ls_value = MidA(ls_value, 1, PosA(ls_value, '</span>') )
										
										dw_list.setitem(lY, "onclick", trim(ls_value))
									end if
								else
									ls_value = trim(WF_Replace(ls_value, '상세주소(동ㆍ층ㆍ호)보기', ''))
									dw_list.setitem(lY, "st_juso", ls_value)
								end if

							case 4
								ls_value = WF_Replace(ls_value, '<span>' ,'')
								ls_value = WF_Replace(ls_value, '</span>','')
								
								dw_list.setitem(lY, "jibun_juso", trim(ls_value))
								
							case 5
								dw_list.setitem(lY, "post_no",    trim(ls_value))
						end choose
					end if
				end if
			next
		end if
	end if
next


if Mod(lY, ll_cnt) <> 0 then  // ll_cnt row 기준으로 미만 row가 검색되면 
	cb_more.enabled = false 	// 더보기 버튼 비활성화 
else
	cb_more.enabled = true
end if
   
setpointer(arrow!)  

end subroutine

public function integer wf_split (readonly string sstring, readonly string sseparator, ref string soutputarray[]);/**************************************************************
Powerbuilder 6.5 / 7.0

long WF_Split( readonly string sString, readonly string sSeparator, reference string sOutputArray[] )

This function parses string to array depending on the string separator. 
The count of items parsed is returned.
****************************************************************/
long lPosEnd, lPosStart = 1, lSeparatorLen, lCounter = 1

IF UpperBound(sOutputArray) > 0 THEN sOutputArray = {""}
lSeparatorLen = LenA(sSeparator)

lPosEnd = PosA(sString, sSeparator, 1)

DO WHILE lPosEnd > 0
     sOutputArray[lCounter] = MidA(sString, lPosStart, lPosEnd - lPosStart)
   //sOutputArray[lCounter] = Mid(sString, lPosStart - lSeparatorLen, lPosEnd - lPosStart)
     lPosStart = lPosEnd + lSeparatorLen
     lPosEnd   = PosA(sString, sSeparator, lPosStart)
     lCounter++
LOOP

sOutputArray[lCounter] = RightA(sString, LenA(sString) - lPosStart + 1)
RETURN lCounter
end function

on w_cdgetpost.create
this.cb_import=create cb_import
this.cbx_browser=create cbx_browser
this.ole_browser=create ole_browser
this.mle_response=create mle_response
this.cbx_source=create cbx_source
this.cb_more=create cb_more
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.cb_retrieve=create cb_retrieve
this.sle_addr=create sle_addr
this.dw_list=create dw_list
this.ln_h=create ln_h
this.r_h=create r_h
this.Control[]={this.cb_import,&
this.cbx_browser,&
this.ole_browser,&
this.mle_response,&
this.cbx_source,&
this.cb_more,&
this.cb_close,&
this.cb_ok,&
this.cb_retrieve,&
this.sle_addr,&
this.dw_list,&
this.ln_h,&
this.r_h}
end on

on w_cdgetpost.destroy
destroy(this.cb_import)
destroy(this.cbx_browser)
destroy(this.ole_browser)
destroy(this.mle_response)
destroy(this.cbx_source)
destroy(this.cb_more)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.cb_retrieve)
destroy(this.sle_addr)
destroy(this.dw_list)
destroy(this.ln_h)
destroy(this.r_h)
end on

event resize;// 
r_h.Width = This.Width

ln_h.BeginX = 0
ln_h.EndX   = This.Width + 5
ln_h.BeginY = r_h.Y + r_h.Height
ln_h.EndY   = r_h.Y + r_h.Height

//dw_list.X   = 4
//dw_list.Resize( This.Width - 35,  dw_list.height )
dw_list.Resize( newWidth - 55, newheight - dw_list.y - 55 )


mle_Response.x      = dw_list.x
mle_Response.y      = dw_list.y
mle_Response.width  = dw_list.width
mle_Response.height = dw_list.height

ole_browser.x = dw_list.x
ole_browser.y = dw_list.y
ole_browser.width  = dw_list.width
ole_browser.height = dw_list.height

end event

event open;//
string ls_value

sle_addr.Text = Message.StringParm

ole_browser.visible  = false
mle_Response.visible = false
cb_more.enabled      = false

end event

type cb_import from commandbutton within w_cdgetpost
integer x = 18
integer y = 64
integer width = 329
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "불러오기"
end type

event clicked;//
integer li_rtn

li_rtn = GetFileOpenName("Select File", is_FilePathName, is_FileName, "XML", " XML Files (*.xml),*.xml" )
if li_rtn = -1 then
	MessageBox("GetFileOpenName Error!", "해당 파일이 존재하지 않습니다.")
	Return
end if

sle_addr.text = "file:///" + is_FilePathName

ole_browser.of_readfile( "file:///" + is_FilePathName, is_FileName )
 



end event

type cbx_browser from checkbox within w_cdgetpost
integer x = 3003
integer y = 116
integer width = 398
integer height = 84
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "브라우즈"
end type

event clicked;//
string ls_url, ls_args, ls_addr

ls_addr =  Trim(sle_addr.Text)  
setpointer(hourglass!)

// 주소정보  
ls_url  = 'http://www.juso.go.kr/support/AddressMainSearch.do?'

//요청 페이지 및 페이지당 row 수 ,검색어 
ls_args = 'currentPage=1&countPerPage=100&searchType=location_newaddr&searchKeyword=' + ls_addr


if this.checked = true then
	ole_browser.visible = true
// ole_browser.of_GoBack() 
// ole_browser.of_GoForward()
// ole_browser.of_Refresh()
// ole_browser.of_Stop()
// ole_browser.of_GoHome()
// ole_browser.of_GoSearch()
	ole_browser.of_Navigate(ls_url + ls_args)

	dw_list.visible      = false
	mle_Response.visible = false
else
	ole_browser.visible = false
	cbx_source.triggerevent( clicked! )
end if

end event

type ole_browser from u_web_browser within w_cdgetpost
integer x = 1280
integer y = 888
integer width = 2199
integer height = 780
integer taborder = 20
string binarykey = "w_cdgetpost.win"
end type

event navigatecomplete2;call super::navigatecomplete2;//
sle_addr.text = this.of_geturl()

end event

type mle_response from multilineedit within w_cdgetpost
integer x = 585
integer y = 688
integer width = 3525
integer height = 748
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cbx_source from checkbox within w_cdgetpost
integer x = 3003
integer y = 40
integer width = 398
integer height = 84
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "소스보기"
end type

event clicked;// 소스보기
if this.checked = true then
	mle_Response.visible   = true
	dw_list.visible = false
else
	mle_Response.visible   = false
	dw_list.visible = true
end if

end event

type cb_more from commandbutton within w_cdgetpost
integer x = 3730
integer y = 64
integer width = 306
integer height = 104
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "더보기"
end type

event clicked;//
il_page = il_page + 1
wf_getpost( il_page )

end event

type cb_close from commandbutton within w_cdgetpost
integer x = 4343
integer y = 64
integer width = 306
integer height = 104
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "닫기"
end type

event clicked;// 
istr_where.chk = "N"
CloseWithReturn(parent, istr_where)


end event

type cb_ok from commandbutton within w_cdgetpost
integer x = 4037
integer y = 64
integer width = 306
integer height = 104
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "확인"
end type

event clicked;//
long	 ll_row
string ls_return, ls_zip

ll_row = dw_list.GetRow()
		
If ll_row = 0 Then
	MessageBox('확인', '우편번호를 선택하십시오!')
	Return
End If

ls_zip  = dw_list.GetItemString(ll_row, 'post_no')

If is_col = '2' Then 
	ls_return = ls_return + dw_list.GetItemString(ll_row, 'jibun_juso')
Else
	ls_return = ls_return + dw_list.GetItemString(ll_row, 'st_juso')
End If 
		
istr_where.chk = "Y"
istr_where.str1 = ls_zip
istr_where.name = ls_return
CloseWithReturn(Parent, istr_where)

end event

type cb_retrieve from commandbutton within w_cdgetpost
integer x = 3424
integer y = 64
integer width = 306
integer height = 104
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "조회"
boolean default = true
end type

event clicked;//
if Trim(sle_addr.Text) = "" then 
	MessageBox("확인", "주소를 입력하십시오!")
	Return
end if

il_page = 1
dw_list.reset()

wf_getpost(il_page)

end event

type sle_addr from singlelineedit within w_cdgetpost
integer x = 366
integer y = 72
integer width = 2615
integer height = 92
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "민락"
borderstyle borderstyle = stylelowered!
end type

type dw_list from datawindow within w_cdgetpost
integer x = 18
integer y = 252
integer width = 4654
integer height = 1880
integer taborder = 10
string title = "none"
string dataobject = "d_cdgetpost"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ln_h from line within w_cdgetpost
long linecolor = 33554432
integer linethickness = 5
integer beginx = 41
integer beginy = 232
integer endx = 361
integer endy = 232
end type

type r_h from statictext within w_cdgetpost
integer x = 18
integer y = 32
integer width = 4654
integer height = 176
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Aw_cdgetpost.bin 
2300000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000009cf05ee001cf9c0200000003000000c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f000000009cf05ee001cf9c029cf05ee001cf9c02000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c000000000000000100000002fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c000031b6000014270000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c04600000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000480040adf80059d53db7980000004d00590048c11cad810000004200480040ad8100590042c11c00480000acac0059b515ace00040000000590048ace0acac0000b51500590048ba85acac0000c87000480040acac0059c870ba8500480000d5e40059b77cb4dc004dc7780040000000590048b4dcd5e4c778b77c0000004d00590048ace0c9110000b51500480040c9110059b515ace000480000baa90059d30cac010042c7840040000000590048ac01baa9c784d30c0000004200590048ba85c2e00000c87000480040c2e00059c870ba8500480000c5950059c0d8c740004dbb3c0040000000590048c740c595bb3cc0d80000004d00590048c11cc5fd0000004c00480040c5fd0059004cc11c00480000c5fd0059004dc11c0040000000590048c11cc5fd0000004dad74c0c80000b9bcc0c80040b9bcad74d7340000d3b8ba3cccb4c9c000400000ba3cd734c9c0d3b80000ccb4005d00720000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Aw_cdgetpost.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
