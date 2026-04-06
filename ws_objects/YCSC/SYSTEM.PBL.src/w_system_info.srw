$PBExportHeader$w_system_info.srw
$PBExportComments$시스템정보 2003/03/15 임기천
forward
global type w_system_info from window
end type
type cb_1 from commandbutton within w_system_info
end type
type st_9 from statictext within w_system_info
end type
type st_8 from statictext within w_system_info
end type
type st_7 from statictext within w_system_info
end type
type st_6 from statictext within w_system_info
end type
type st_5 from statictext within w_system_info
end type
type st_4 from statictext within w_system_info
end type
type st_3 from statictext within w_system_info
end type
type st_2 from statictext within w_system_info
end type
type st_width from statictext within w_system_info
end type
type st_height from statictext within w_system_info
end type
type st_colors from statictext within w_system_info
end type
type st_exe from statictext within w_system_info
end type
type st_pbver from statictext within w_system_info
end type
type st_cpu_type from statictext within w_system_info
end type
type st_ostype from statictext within w_system_info
end type
end forward

global type w_system_info from window
integer width = 1280
integer height = 1148
boolean titlebar = true
string title = "시스템정보(w_system_info)"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_width st_width
st_height st_height
st_colors st_colors
st_exe st_exe
st_pbver st_pbver
st_cpu_type st_cpu_type
st_ostype st_ostype
end type
global w_system_info w_system_info

on w_system_info.create
this.cb_1=create cb_1
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_width=create st_width
this.st_height=create st_height
this.st_colors=create st_colors
this.st_exe=create st_exe
this.st_pbver=create st_pbver
this.st_cpu_type=create st_cpu_type
this.st_ostype=create st_ostype
this.Control[]={this.cb_1,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_width,&
this.st_height,&
this.st_colors,&
this.st_exe,&
this.st_pbver,&
this.st_cpu_type,&
this.st_ostype}
end on

on w_system_info.destroy
destroy(this.cb_1)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_width)
destroy(this.st_height)
destroy(this.st_colors)
destroy(this.st_exe)
destroy(this.st_pbver)
destroy(this.st_cpu_type)
destroy(this.st_ostype)
end on

event open;//==GF_USEPROGRAM(프로그램 사용현황)===========================================================
GF_USEPROGRAM( gs_userid, THIS.ClassName(), "O", string(gf_today(),'yyyy/mm/dd'), THIS.Title )
//=============================================================================================

//f_centerwindow(This)

environment env
string  temp
GetEnvironment(env)

choose case env.cputype
	case alpha!
		st_cpu_type.text = 'Alpha'
	case hppa!
		st_cpu_type.text = 'HPPA'
	case i286!
		st_cpu_type.text = '286'
	case i386!
		st_cpu_type.text = '386'
	case i486!
		st_cpu_type.text = '486'
	case m68000!
		st_cpu_type.text = '68000'
	case m68020!
		st_cpu_type.text = '68020'
	case m68030!
		st_cpu_type.text = '68030'
	case m68040!
		st_cpu_type.text = '68040'
	case mips!
		st_cpu_type.text = 'MIPS'
	case pentium!
		st_cpu_type.text = 'Pentium'
	case powerpc!
		st_cpu_type.text = 'PowerPC'
	case sparc!
		st_cpu_type.text = 'Sparc'
end choose

choose case env.ostype
	case aix!
		temp = 'AIX'
	case hpux!
		temp = 'HPUX'
	case macintosh!
		temp = 'MacIntosh'
	case osf1!
		temp = 'OSF1'
	case sol2!
		temp = 'Solaris 2'
	case Windows!
		temp = 'Windows'
	case Windowsnt!
		temp = 'Windows NT'
end choose
st_ostype.text = temp + ' '+string(env.osmajorrevision)+'.'+string(env.osminorrevision)+'.'+string(env.osfixesrevision)

choose case env.pbtype
	case enterprise!
		temp = 'Enterprise'
	case desktop!
		temp = 'Desktop'
end choose

If env.win16 Then
	temp = temp + "/16"
Else
	temp = temp + "/32"
End If

st_pbver.text = temp + ' '+string(env.pbmajorrevision)+'.'+string(env.pbminorrevision)+'.'+string(env.pbfixesrevision)

If env.machinecode Then
	st_exe.text = "Machine Code"
Else
	st_exe.text = "P-Code"
End If

st_colors.text = string(env.numberofcolors)
st_height.text = string(env.screenheight)
st_width.text  = string(env.screenwidth)
end event

type cb_1 from commandbutton within w_system_info
integer x = 535
integer y = 924
integer width = 224
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
string text = "OK"
end type

event clicked;close(parent)
end event

type st_9 from statictext within w_system_info
integer x = 261
integer y = 224
integer width = 402
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "OS Type :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_system_info
integer x = 238
integer y = 224
integer width = 402
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_system_info
integer x = 261
integer y = 108
integer width = 402
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "CPU Type :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_system_info
integer x = 46
integer y = 340
integer width = 617
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "PowerBuilder Version :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_system_info
integer x = 261
integer y = 456
integer width = 402
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Executable :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_system_info
integer x = 155
integer y = 572
integer width = 507
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Number of colors :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_system_info
integer x = 238
integer y = 688
integer width = 425
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Screen Height :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_system_info
integer x = 261
integer y = 804
integer width = 402
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
long backcolor = 67108864
string text = "Screen Width :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_width from statictext within w_system_info
integer x = 699
integer y = 804
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "?"
boolean focusrectangle = false
end type

type st_height from statictext within w_system_info
integer x = 699
integer y = 688
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "?"
boolean focusrectangle = false
end type

type st_colors from statictext within w_system_info
integer x = 699
integer y = 572
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "?"
boolean focusrectangle = false
end type

type st_exe from statictext within w_system_info
integer x = 699
integer y = 456
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "unknown"
boolean focusrectangle = false
end type

type st_pbver from statictext within w_system_info
integer x = 699
integer y = 340
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "version unknown"
boolean focusrectangle = false
end type

type st_cpu_type from statictext within w_system_info
integer x = 699
integer y = 108
integer width = 539
integer height = 48
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "cpu unknown"
boolean focusrectangle = false
end type

type st_ostype from statictext within w_system_info
integer x = 699
integer y = 224
integer width = 539
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 16711680
long backcolor = 67108864
string text = "os type unknown"
boolean focusrectangle = false
end type

