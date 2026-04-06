$PBExportHeader$w_icprocess.srw
$PBExportComments$진행율표시기(1998/02/28,곽용덕)
forward 
global type w_icprocess from window
end type
type hpb_1 from hprogressbar within w_icprocess
end type
end forward

global type w_icprocess from window
integer x = 832
integer y = 360
integer width = 1970
integer height = 220
boolean titlebar = true
string title = "진행율(w_icprocess)"
windowtype windowtype = child!
long backcolor = 79741120
boolean center = true
hpb_1 hpb_1
end type
global w_icprocess w_icprocess

on w_icprocess.create
this.hpb_1=create hpb_1
this.Control[]={this.hpb_1}
end on

on w_icprocess.destroy
destroy(this.hpb_1)
end on

type hpb_1 from hprogressbar within w_icprocess
integer x = 18
integer y = 24
integer width = 1915
integer height = 84
unsignedinteger maxposition = 100
integer setstep = 1
end type

