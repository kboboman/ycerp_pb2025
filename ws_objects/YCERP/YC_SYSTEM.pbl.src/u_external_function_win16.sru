$PBExportHeader$u_external_function_win16.sru
$PBExportComments$Cross Platform User Object for Windows 16 bit api
forward
global type u_external_function_win16 from u_external_function
end type
end forward

global type u_external_function_win16 from u_external_function
end type
global u_external_function_win16 u_external_function_win16

type prototypes
Function boolean FlashWindow (uint handle, boolean flash) Library "user.exe"
function int WNetGetUser(ref string User, ref uint UserLength) library "user.exe" alias for "WNetGetUser;Ansi"
end prototypes

forward prototypes
public function boolean uf_flash_window (long aui_handle, boolean ab_flash)
end prototypes

public function boolean uf_flash_window (long aui_handle, boolean ab_flash);//function not found in descendent
Return FlashWindow(aui_handle, ab_flash)
end function

on u_external_function_win16.create
TriggerEvent( this, "constructor" )
end on

on u_external_function_win16.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor;is_Separator = "\"

end event

