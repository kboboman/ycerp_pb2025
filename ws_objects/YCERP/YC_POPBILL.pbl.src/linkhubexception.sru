$PBExportHeader$linkhubexception.sru
forward
global type linkhubexception from exception
end type
end forward

global type linkhubexception from exception
end type
global linkhubexception linkhubexception

type variables
long in_code
end variables

forward prototypes
public function long getcode ()
public subroutine setcode (long code)
public function linkhubexception setcodenmessage (long code, string new_message)
end prototypes

public function long getcode ();return in_code
end function

public subroutine setcode (long code);in_code = code
end subroutine

public function linkhubexception setcodenmessage (long code, string new_message);in_code = code
setMessage(new_message)
return this
end function

on linkhubexception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on linkhubexception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

