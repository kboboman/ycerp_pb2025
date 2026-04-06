$PBExportHeader$u_external_function.sru
$PBExportComments$Cross platform user object ancestor
forward
global type u_external_function from nonvisualobject
end type
end forward

global type u_external_function from nonvisualobject
end type
global u_external_function u_external_function

type prototypes

end prototypes

type variables
Protected String	is_Separator
end variables

forward prototypes
public function boolean uf_flash_window (long aui_handle, boolean ab_flash)
end prototypes

public function boolean uf_flash_window (long aui_handle, boolean ab_flash);//function not found in descendent
return false
end function

on u_external_function.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_external_function.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

