$PBExportHeader$u_external_function_win32.sru
$PBExportComments$Cross platform user object for Win32
forward
global type u_external_function_win32 from u_external_function
end type
type str_memorystatus from structure within u_external_function_win32
end type
end forward

type str_memorystatus from structure
    unsignedlong sul_dwlength
    unsignedlong sul_dwmemoryload
    unsignedlong sul_dwtotalphys
    unsignedlong sul_dwavailphys
    unsignedlong sul_dwtotalpagefile
    unsignedlong sul_dwavailpagefile
    unsignedlong sul_dwtotalvirtual
    unsignedlong sul_dwavailvirtual
end type

global type u_external_function_win32 from u_external_function
end type
global u_external_function_win32 u_external_function_win32

type prototypes
Function boolean FlashWindow (long handle, boolean flash) Library "USER32.DLL"
Function boolean GetUserNameA (ref string name, ref ulong len) library "ADVAPI32.DLL" alias for "GetUserNameA;Ansi"

end prototypes

forward prototypes
public function boolean uf_flash_window (long aui_handle, boolean ab_flash)
end prototypes

public function boolean uf_flash_window (long aui_handle, boolean ab_flash);//function not found in descendent
Return FlashWindow(aui_handle, ab_flash)
end function

on u_external_function_win32.create
call super::create
end on

on u_external_function_win32.destroy
call super::destroy
end on

event constructor;call super::constructor;is_Separator = "\"

end event

