$PBExportHeader$tarray.sru
forward
global type tarray from oleobject
end type
end forward

global type tarray from oleobject
end type
global tarray tarray

type variables
public:
any list[]
end variables

forward prototypes
	public function any getObject(integer pos) throws linkhubexception
	public subroutine setObject(integer pos, any value) throws linkhubexception
	public function integer getlength() throws linkhubexception
end prototypes

public function any getObject (integer pos) throws linkhubexception;
	return list[pos]
end function

public subroutine setObject(integer pos, any value) throws linkhubexception;
	list[pos] = value
end subroutine

public function integer getlength() throws linkhubexception;
	return upperbound(list)
end function

on tarray.create
call super::create
TriggerEvent( this, "constructor" )
end on

on tarray.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

