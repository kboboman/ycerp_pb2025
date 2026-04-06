$PBExportHeader$uo_google_chart.sru
forward
global type uo_google_chart from olecustomcontrol
end type
end forward

global type uo_google_chart from olecustomcontrol
integer width = 1655
integer height = 1032
borderstyle borderstyle = stylelowered!
string binarykey = "uo_google_chart.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "굴림체"
long textcolor = 33554432
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
event beforescriptexecute ( oleobject pdispwindow )
end type
global uo_google_chart uo_google_chart

type prototypes
Function long ShellExecute ( &
	long hwindow, &
	string lpOperation, &
	string lpFile, &
	string lpParameters, &
	string lpDirectory, &
	long nShowCmd &
	) Library "shell32.dll" Alias for "ShellExecuteW;Ansi"

Function long GetDesktopWindow ( &
	) Library "user32.dll"

Function ulong CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	ulong lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	ulong hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileW"

Function boolean ReadFile ( &
	ulong hFile, &
	Ref blob lpBuffer, &
	ulong nNumberOfBytesToRead, &
	Ref ulong lpNumberOfBytesRead, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean WriteFile ( &
	ulong hFile, &
	blob lpBuffer, &
	ulong nNumberOfBytesToWrite, &
	Ref ulong lpNumberOfBytesWritten, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean CloseHandle ( &
	ulong hObject &
	) Library "kernel32.dll"

end prototypes

type variables
// constants for CreateFile API function
Constant ULong INVALID_HANDLE_VALUE = -1
Constant ULong GENERIC_READ     = 2147483648
Constant ULong GENERIC_WRITE    = 1073741824
Constant ULong FILE_SHARE_READ  = 1
Constant ULong FILE_SHARE_WRITE = 2
Constant ULong CREATE_NEW			= 1
Constant ULong CREATE_ALWAYS		= 2
Constant ULong OPEN_EXISTING		= 3
Constant ULong OPEN_ALWAYS			= 4
Constant ULong TRUNCATE_EXISTING = 5

integer OLECMDEXECOPT_DODEFAULT			= 0
integer OLECMDEXECOPT_PROMPTUSER			= 1
integer OLECMDEXECOPT_DONTPROMPTUSER	= 2
integer OLECMDEXECOPT_SHOWHELP			= 3

integer OLECMDID_OPEN					= 1
integer OLECMDID_NEW						= 2
integer OLECMDID_SAVE					= 3
integer OLECMDID_SAVEAS					= 4
integer OLECMDID_SAVECOPYAS			= 5
integer OLECMDID_PRINT					= 6
integer OLECMDID_PRINTPREVIEW			= 7
integer OLECMDID_PAGESETUP				= 8
integer OLECMDID_SPELL					= 9
integer OLECMDID_PROPERTIES			= 10
integer OLECMDID_CUT						= 11
integer OLECMDID_COPY					= 12
integer OLECMDID_PASTE					= 13
integer OLECMDID_PASTESPECIAL			= 14
integer OLECMDID_UNDO					= 15
integer OLECMDID_REDO					= 16
integer OLECMDID_SELECTALL				= 17
integer OLECMDID_CLEARSELECTION		= 18
integer OLECMDID_ZOOM					= 19
integer OLECMDID_GETZOOMRANGE			= 20
integer OLECMDID_UPDATECOMMANDS		= 21
integer OLECMDID_REFRESH				= 22
integer OLECMDID_STOP					= 23
integer OLECMDID_HIDETOOLBARS			= 24
integer OLECMDID_SETPROGRESSMAX		= 25
integer OLECMDID_SETPROGRESSPOS		= 26
integer OLECMDID_SETPROGRESSTEXT		= 27
integer OLECMDID_SETTITLE				= 28
integer OLECMDID_SETDOWNLOADSTATE	= 29
integer OLECMDID_STOPDOWNLOAD			= 30
integer OLECMDID_ONTOOLBARACTIVATED	= 31
integer OLECMDID_FIND					= 32
integer OLECMDID_DELETE					= 33
integer OLECMDID_HTTPEQUIV				= 34
integer OLECMDID_HTTPEQUIV_DONE		= 35
integer OLECMDID_ENABLE_INTERACTION	= 36
integer OLECMDID_ONUNLOAD				= 37
integer OLECMDID_PROPERTYBAG2			= 38
integer OLECMDID_PREREFRESH			= 39
integer OLECMDID_SHOWSCRIPTERROR        = 40 
integer OLECMDID_SHOWMESSAGE            = 41 
integer OLECMDID_SHOWFIND               = 42 
integer OLECMDID_SHOWPAGESETUP          = 43 
integer OLECMDID_SHOWPRINT              = 44 
integer OLECMDID_CLOSE                  = 45 
integer OLECMDID_ALLOWUILESSSAVEAS      = 46 
integer OLECMDID_DONTDOWNLOADCSS        = 47 
integer OLECMDID_UPDATEPAGESTATUS       = 48 
integer OLECMDID_PRINT2                 = 49 
integer OLECMDID_PRINTPREVIEW2          = 50 
integer OLECMDID_SETPRINTTEMPLATE       = 51 
integer OLECMDID_GETPRINTTEMPLATE       = 52 
integer OLECMDID_PAGEACTIONBLOCKED      = 55
integer OLECMDID_PAGEACTIONUIQUERY      = 56
integer OLECMDID_FOCUSVIEWCONTROLS      = 57
integer OLECMDID_FOCUSVIEWCONTROLSQUERY = 58
integer OLECMDID_SHOWPAGEACTIONMENU     = 59
integer OLECMDID_ADDTRAVELENTRY         = 60
integer OLECMDID_UPDATETRAVELENTRY      = 61
integer OLECMDID_UPDATEBACKFORWARDSTATE = 62
integer OLECMDID_OPTICAL_ZOOM           = 63
integer OLECMDID_OPTICAL_GETZOOMRANGE   = 64
integer OLECMDID_WINDOWSTATECHANGED     = 65
integer OLECMDID_ACTIVEXINSTALLSCOPE    = 66

DataWindow idw_1
string		is_chart
int			ii_width, ii_height


end variables

forward prototypes
public function integer of_gen_datatable (string as_data, datawindow adw_1, string as_colname, string as_valname)
public function integer of_gen_datatable (string as_data, datawindow adw_1, string as_colname, string as_valname1, string as_valname2)
public subroutine of_set_data (datawindow adw_1)
public function string of_replaceall (string as_oldstring, string as_findstr, string as_replace)
public subroutine of_setsource (string as_source)
public subroutine of_refresh ()
public function integer of_gen_c3dpie (ref string as_html)
public function integer of_gen_cpie (ref string as_html)
public function integer of_gen_cpiedonut (ref string as_html)
public function integer of_gen_clinecurve (ref string as_html)
public function integer of_gen_option (ref string as_option, string as_graph)
public function integer of_gen_cline2 (ref string as_html)
public function integer of_gen_cscatter (ref string as_html)
public function integer of_gen_clinecrosshair (ref string as_html)
public function integer of_gen_datacrosshair (ref string as_data, datawindow adw_1, string as_colname1, string as_colname2, string as_valname1, string as_valname2)
public function integer of_gen_cwoterfall (ref string as_html)
public function integer of_gen_ccombo (ref string as_html)
public function integer of_gen_cgauge (ref string as_html)
public subroutine of_silentmode (boolean ab_silent)
public subroutine of_navigate (string as_url)
public function integer of_gen_clinenormal (ref string as_html)
public subroutine of_controlpanel (string as_control_app)
public subroutine of_designmode ()
public subroutine of_documentcommand (string as_command)
public subroutine of_documentcommand (string as_command, boolean ab_userinterface)
public subroutine of_documentcommand (string as_command, string as_value)
public subroutine of_documentcopy ()
public subroutine of_execscript (integer as_script)
public subroutine of_execwb (integer command_id, integer execution_option)
public subroutine of_execwb_pagesetup ()
public subroutine of_execwb_print (boolean ab_prompt)
public subroutine of_execwb_printpreview ()
public subroutine of_execwb_save ()
public subroutine of_execwb_saveas ()
public function integer of_gen_cannotation (string as_html, string as_graphname)
public function STRING of_getsource ()
public function string of_geturl ()
public subroutine of_goback ()
public subroutine of_goforward ()
public subroutine of_gohome ()
public subroutine of_gosearch ()
public subroutine of_inserthtml (string as_html)
public function boolean of_ispropertyset (string as_propname)
public subroutine of_resize (integer ai_newwidth, integer ai_newheight)
public subroutine of_stop ()
public subroutine of_toggle_property (string as_propname)
public function integer of_writefile (string as_filename, string as_filecontents)
public function integer of_gen_head (ref string as_head, string as_package[], string as_callback)
end prototypes

public function integer of_gen_datatable (string as_data, datawindow adw_1, string as_colname, string as_valname);// Create the data table.

int   	li_rtn = 1, li_row
string 	ls_col, ls_val

as_data = ''

Try 
	as_data = 	'      function drawChart() {' + '~r~n' +&
	               	'             var data = google.visualization.DataTable();' + '~r~n' +&
			      	'                  data.addColumn(~'string~', ~'' + as_colname + '~');' + '~r~n' +&
					'                  data.addColumn(~'number~', ~'' + as_valname + '~');' + '~r~n' +&
					'                  data.addRows([' + '~r~n' 
			
	For li_row = 1 to adw_1.Rowcount()
		ls_col = adw_1.GetItemString(li_row, as_colname)
		ls_val = string(adw_1.GetItemNumber(li_row, as_valname))
		If li_row <> adw_1.Rowcount() Then
			as_data += '                  [~'' + ls_col + '~', ' +  ls_val + '],~r~n'
		Else
			as_data += '                  [~'' + ls_col + '~', ' +  ls_val + ']]);~r~n'
		End If
	Next	
	
	as_data += '~r~n' 
	
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn

end function

public function integer of_gen_datatable (string as_data, datawindow adw_1, string as_colname, string as_valname1, string as_valname2);// Create the data table.

int   	li_rtn = 1, li_row
string 	ls_col, ls_val1, ls_val2

as_data = ''

Try 
	If as_valname2 <> '' Then
		as_data = '      function drawChart() {' +'~r~n' +&
					  '      var data = google.visualization.arrayToDataTable([' + '~r~n' +&
							'            [~' ' + as_colname + '~', ~'' + as_valname1 + '~', ~'' +  as_valname2 + '~' ],' +'~r~n' 
		For li_row = 1 to adw_1.Rowcount()
			ls_col = adw_1.GetItemString(li_row, as_colname)
			ls_val1 = string(adw_1.GetItemNumber(li_row, as_valname1))
			ls_val2 = string(adw_1.GetItemNumber(li_row, as_valname2))
			If li_row <> adw_1.Rowcount() Then
				as_data += '            [~'' + ls_col + '~', ' +  ls_val1 + ', ' + ls_val2 + '],~r~n'
			Else
				as_data += '            [~'' + ls_col + '~', ' +  ls_val1 + ', ' + ls_val2 + ']]);~r~n'
			End If
		Next	
		as_data += '~r~n'
	Else
		as_data = '      function drawChart() {' +'~r~n' +&
					  '      var data = google.visualization.arrayToDataTable([' + '~r~n' +&
					  '            [~' ' + as_colname + '~', ~'' + as_valname1 + '~' ],' +'~r~n' 
				
		For li_row = 1 to adw_1.Rowcount()
			ls_col = adw_1.GetItemString(li_row, as_colname)
			ls_val1 = string(adw_1.GetItemNumber(li_row, as_valname1))
			If li_row <> adw_1.Rowcount() Then
				as_data += '            [~'' + ls_col + '~', ' +  ls_val1 +  '],~r~n'
			Else
				as_data += '            [~'' + ls_col + '~', ' +  ls_val1 +  ']]);~r~n'
			End If
		Next	
		as_data += '~r~n'
	End If
	
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn

end function

public subroutine of_set_data (datawindow adw_1);idw_1 = adw_1
end subroutine

public function string of_replaceall (string as_oldstring, string as_findstr, string as_replace);// -----------------------------------------------------------------------------
// SCRIPT:     u_web_browser.of_ReplaceAll
//
// PURPOSE:    This function all of the occurrences of a string within
//					another string.
//
// ARGUMENTS:  as_oldstring	- The string to be updated
//					as_findstr		- The string to look for
//					as_replace		- The replacement string
//
//	RETURN:		The updated string
//
// DATE        CHANGED BY	DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 02/17/2010  RolandS		Initial creation
// -----------------------------------------------------------------------------

String ls_newstring
Long ll_findstr, ll_replace, ll_pos

// get length of strings
ll_findstr = LenA(as_findstr)
ll_replace = LenA(as_replace)

// find first occurrence
ls_newstring = as_oldstring
ll_pos = PosA(ls_newstring, as_findstr)

Do While ll_pos > 0
	// replace old with new
	ls_newstring = ReplaceA(ls_newstring, ll_pos, ll_findstr, as_replace)
	// find next occurrence
	ll_pos = PosA(ls_newstring, as_findstr, (ll_pos + ll_replace))
Loop

Return ls_newstring

end function

public subroutine of_setsource (string as_source);// set the webpage HTML source
this.Object.Document.Open()
this.Object.Document.Write(as_source)
this.Object.Document.Close()
end subroutine

public subroutine of_refresh ();// refresh current page
this.object.Refresh()

end subroutine

public function integer of_gen_c3dpie (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_c3dpie( ref string as_html )
//  chart : Pie
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_data, ls_head, ls_option, ls_package[]

as_html = ''
ls_data = ''
is_chart = '3dpie'

//$$title
//$$header
//$$width
//$$height

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
//of_gen_datatable(ls_data, idw_1, "year","sales", '')

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data			
	as_html += '  ~r~n' +&
			'        // Set chart options' + '~r~n' +&
			'        var options = {~'title~':~'$$title' + '~',~r~n'  +&
			'                       ~'is3D~':true' + '};~r~n'  +&
			'  ~r~n' +&
			'        // Instantiate and draw our chart, passing in some options.' + '~r~n' +&
			'        var chart = new google.visualization.PieChart(document.getElementById(~'piechart_3d~'));' + '~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' +&
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  ~r~n' +&
			'  <body>' + '~r~n' +&
			'    <!--Div that will hold the pie chart-->' + '~r~n' +&
			'    <div id="piechart_3d" style=~"width: ' + string(ii_width) + 'px; height:' + string(ii_height) + 'px;~"></div>' + '~r~n' +&
			'  </body>' + '~r~n' +&
			'</html>'  + '~r~n'
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn


end function

public function integer of_gen_cpie (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cpie( ref string as_html )
//  chart : Pie
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_data, ls_head, ls_option, ls_package[]

as_html = ''
ls_data = ''

//$$title
//$$header
//$$width
//$$height

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales", '')

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data			
	as_html += '  ~r~n' +&
			'        // Set chart options' + '~r~n' +&
			'        var options = {~'title~':~'$$title' + '~'};~r~n'  +&
			'  ~r~n' +&
			'        // Instantiate and draw our chart, passing in some options.' + '~r~n' +&
			'        var chart = new google.visualization.PieChart(document.getElementById(~'chart_div~'));' + '~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' +&
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  ~r~n' +&
			'  <body>' + '~r~n' +&
			'    <!--Div that will hold the pie chart-->' + '~r~n' +&
			'    <div id="chart_div" style="width: ' + string(ii_width) + 'px; height:' + string(ii_height) + 'px; "></div>' + '~r~n' +&
			'  </body>' + '~r~n' +&
			'</html>'  + '~r~n'
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_cpiedonut (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cpiedonut( ref string as_html )
//  chart : Pie Donut
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_data, ls_head, ls_option, ls_package[]

as_html = ''
ls_data = ''

//$$title
//$$header
//$$width
//$$height

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales", '')

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data			
	
	
	as_html += '  ~r~n' +&
			'        // Set chart options' + '~r~n' +&
			'        var options = {~'title~':~'$$title' + '~',~r~n'  +&
			'                       ~'pieHole~': 0.4' + '};~r~n'  +&
			'  ~r~n' +&
			'        // Instantiate and draw our chart, passing in some options.' + '~r~n' +&
			'        var chart = new google.visualization.PieChart(document.getElementById(~'chart_div~'));' + '~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' +&
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  ~r~n' +&
			'  <body>' + '~r~n' +&
			'    <!--Div that will hold the pie chart-->' + '~r~n' +&
			'    <div id="chart_div" style=~"width: ' + string(ii_width) + 'px; height:' + string(ii_height) + 'px;~"></div>' + '~r~n' +&
			'  </body>' + '~r~n' +&
			'</html>'  + '~r~n'
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_clinecurve (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_clinecurve( ref string as_html )
//  chart : line curve
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_head, ls_data, ls_option, ls_package[]

as_html = ''
ls_data = ''
is_chart = "curve_chart"

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales", "series_explode")
of_gen_option(ls_option, is_chart)

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data 
	as_html += ls_option 
	                
	as_html = as_html + '        var chart = new google.visualization.LineChart(document.getElementById(~'curve_chart~'));' +'~r~n' +&
			'  ~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' + &
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  <body>' + '~r~n' +&
			'    <div id="curve_chart" style="width: ' + string(ii_width) + '; ' + 'height: ' + string(ii_height) + '"></div>' + '~r~n' +&
			'  </body>' +'~r~n' +&
			'</html>' +'~r~n'

catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_option (ref string as_option, string as_graph);integer 	li_rtn 

as_option = ''
li_rtn = 1

Try 
	Choose Case lower(as_graph)
		Case 'curve_chart'
		 	as_option = '        var options = {' +'~r~n' + &
			'          title: ~'$$title~',' +'~r~n' + &
			'          curveType: ~'function~',' +'~r~n' + &
			'          legend: { position: ~'bottom~' }' +'~r~n' + &
			'        };' +'~r~n' + &
			'  ~r~n' 
		Case 'line_chart'			
		 	as_option = '        var options = {' +'~r~n' + &
			'          title: ~'$$title~',' +'~r~n' + &
			'          legend: { position: ~'bottom~' }' +'~r~n' + &
			'        };' +'~r~n' + &
			'  ~r~n' 			
		Case 'annotationchart'
			as_option = '        var options = {' + '~r~n' +&
			'          displayAnnotations: true' + '~r~n' +&
			'        };' + '~r~n' +&
			'  ~r~n'
		Case 'gauge'
			as_option = '    var options = {' + '~r~n' +&
			'          width: 400, height: 120,' + '~r~n' +&
			'          redFrom: 90, redTo: 100,' + '~r~n' +&
			'          yellowFrom:75, yellowTo: 90,' + '~r~n' +&
			'          minorTicks: 5' + '~r~n' +&
			'        };' + '~r~n' +&
			'  ~r~n'
		Case 'scatter'
			as_option = '    var options = {' + '~r~n' +&
			'          title: ~'$$title~',' +'~r~n' + &
			'          hAxis: {title: ~'Sale1~', minValue: 0, maxValue: 15},' +'~r~n' + &
			'          vAxis: {title: ~'Sale2~', minValue: 0, maxValue: 15},' +'~r~n' + &
			'          legend: ~'none~'' +'~r~n' + &
			'        };' +'~r~n' + &
			'  ~r~n'
		Case Else

	End Choose
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_cline2 (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cline2( ref string as_html )
//  chart : line sample
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
as_html = ''

//$$title
//$$header
Try 
	as_html = '<!DOCTYPE html>' 																				+'~r~n' + &
			'<html>' 																									+'~r~n' + &
			'  <head>' 																								+'~r~n' + &
			'    <meta charset="utf-8">' 																			+'~r~n' + &
 			'    <meta http-equiv="X-UA-Compatible" content="IE=edge">' 								+ '~r~n' + &			
			'    <title>$$title</title>' 																				+'~r~n' + &
			'  ~r~n' +&
			'    <!-- jQuery -->' 																					+'~r~n' + &
			'    <script src="https://code.jquery.com/jquery.min.js"></script>' 						+'~r~n' + &
			'    <!-- google charts -->' 																			+'~r~n' + &
			'       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>' +'~r~n' + &
			'  </head>' 																								+'~r~n' + &
			'  <body>' 																								+'~r~n' + &
			' ~r~n' +&
			'    <h4>$$header</h4>' 																				+'~r~n' + &
			'  ~r~n' +&
			'    <div id="Line_Controls_Chart">' 																+'~r~n' + &
			'      <!-- 라인 차트 생성할 영역 -->' 															+'~r~n' + &
			'          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>' 			+'~r~n' + &
			'      <!-- Area for create control bar  -->' 														+'~r~n' + &
			'          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>' 				+'~r~n' + &
			'        </div>' 																							+'~r~n' + &
			'  ~r~n' +&
			'  </body>' 																								+'~r~n' + &
			'  ~r~n' +&
			'  <script>' 																								+'~r~n' + &
			'  ~r~n' +&
			'  var chartDrowFun = {' 																				+'~r~n' + &
			'  ~r~n' +&
			'    chartDrow : function(){' 																			+'~r~n' + &
			'        var chartData = ~'~';' 																		+'~r~n' + &
			'  ~r~n' + &
			'        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.' 							+'~r~n' + &
			'        var chartDateformat     = ~'yyyy-MM-dd~';' 										+'~r~n' + &
			'        //라인차트의 라인 수' 																	+'~r~n' + &
			'        var chartLineCount    = 10;' 																	+'~r~n' + &
			'        //컨트롤러 바 차트의 라인 수' 															+'~r~n' + &
			'        var controlLineCount    = 10;' 																+'~r~n' + &
			'  ~r~n' +&
			'        function drawDashboard() {' 																+'~r~n' + &
			'  ~r~n' +&
			'          var data = new google.visualization.DataTable();' 									+'~r~n' + &
			'          //그래프에 표시할 컬럼 추가' 														+'~r~n' + &
			'          data.addColumn(~'datetime~' , ~'Date~');' 											+'~r~n' + &
			'          data.addColumn(~'number~'   , ~'Man~');' 											+'~r~n' + &
			'          data.addColumn(~'number~'   , ~'Wom~');' 											+'~r~n' + &
			'          data.addColumn(~'number~'   , ~'Tot~');' 											+'~r~n' + &
			'  ~r~n' +&
			'          //그래프에 표시할 데이터' 															+'~r~n' + &
			'          var dataRow = [];' 																			+'~r~n' + &
			'  ~r~n' +&
			'          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성' 									+'~r~n' + &
			'            var total   = Math.floor(Math.random() * 300) + 1;' 								+'~r~n' + &
			'            var man     = Math.floor(Math.random() * total) + 1;' 							+'~r~n' + &
			'            var woman   = total - man;' 																+'~r~n' + &
			'  ~r~n' +&
			'            dataRow = [new Date(2017, 09, i, 10), man, woman , total];' +'~r~n' + &
			'            data.addRow(dataRow);' 																+'~r~n' + &
			'          }'																									+'~r~n' + &
			'  ~r~n' +&
			'            var chart = new google.visualization.ChartWrapper({'								+'~r~n' + &
			'              chartType   : ~'LineChart~','															+'~r~n' + &
			'              containerId : ~'lineChartArea~', //drawing area'									+'~r~n' + &
			'              options     : {'																				+'~r~n' + &
			'                              isStacked   : ~'percent~','												+'~r~n' + &
			'                              focusTarget : ~'category~','												+'~r~n' + &
			'                              height          : 500,'														+'~r~n' + &
			'                              width              : ~'100%~','												+'~r~n' + &
			'                              legend          : { position: ~'top~', textStyle: {fontSize: 13}},'		+'~r~n' + &
			'                              pointSize        : 5,'												+'~r~n' + &
			'                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: ~'both~'},'		+'~r~n' + &
			'                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {'		+'~r~n' + &
			'                                                                  years : {format: [~'yyyy~']},'										+'~r~n' + &
			'                                                                  months: {format: [~'MM~']},'										+'~r~n' + &
			'                                                                  days  : {format: [~'dd~']},'											+'~r~n' + &
			'                                                                  hours : {format: [~'HH~']}}'											+'~r~n' + &
			'                                                                },textStyle: {fontSize:12}},'												+'~r~n' + &
			'                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},'		+'~r~n' + &
			'                animation        : {startup: true,duration: 1000,easing: ~'in~' },'												+'~r~n' + &
			'                annotations    : {pattern: chartDateformat,'																		+'~r~n' + &
			'                                textStyle: {'																								+'~r~n' + &
			'                                fontSize: 15,'																								+'~r~n' + &
			'                                bold: true,'																									+'~r~n' + &
			'                                italic: true,'																									+'~r~n' + &
			'                                color: ~'#871b47~','																						+'~r~n' + &
			'                                auraColor: ~'#d799ae~','																				+'~r~n' + &
			'                                opacity: 0.8,'																								+'~r~n' + &
			'                                pattern: chartDateformat'																				+'~r~n' + &
			'                              }'																												+'~r~n' + &
			'                            }'																													+'~r~n' + &
			'              }'																																+'~r~n' + &
			'            });'																																+'~r~n' + &
			'  ~r~n' +&
			'            var control = new google.visualization.ControlWrapper({'															+'~r~n' + &
			'              controlType: ~'ChartRangeFilter~','																					+'~r~n' + &
			'              containerId: ~'controlsArea~',  //control bar를 생성할 영역'													+'~r~n' + &
			'              options: {'																													+'~r~n' + &
			'                  ui:{'																														+'~r~n' + &
			'                        chartType: ~'LineChart~','																						+'~r~n' + &
			'                        chartOptions: {'																									+'~r~n' + &
			'                        chartArea: {width: ~'80%~',height : 80},'														+'~r~n' + &
			'                          hAxis: {~'baselineColor~': ~'none~', format: chartDateformat, textStyle: {fontSize:12},'	+'~r~n' + &
			'                            gridlines:{count:controlLineCount,units: {'																+'~r~n' + &
			'                                  years : {format: [~'yyyy~']},'																		+'~r~n' + &
			'                                  months: {format: [~'MM~']},'																	+'~r~n' + &
			'                                  days  : {format: [~'dd~']},'																		+'~r~n' + &
			'                                  hours : {format: [~'HH~']}}'																		+'~r~n' + &
			'                            }}'																												+'~r~n' + &
			'                        }'																													+'~r~n' + &
			'                  },'																															+'~r~n' + &
			'                    filterColumnIndex: 0'																								+'~r~n' + &
			'                }'																															+'~r~n' + &
			'            });'																																+'~r~n' + &
			'  ~r~n' +&
			'            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});'				+'~r~n' + &
			'            date_formatter.format(data, 0);'																						+'~r~n' + &
			'  ~r~n' +&
			'            var dashboard = new google.visualization.Dashboard(document.getElementById(~'Line_Controls_Chart~'));'		+'~r~n' + &
			'            window.addEventListener(~'resize~', function() { dashboard.draw(data); }, false); //graph size'						+'~r~n' + &
			'            dashboard.bind([control], [chart]);'																					+'~r~n' + &
			'            dashboard.draw(data);'																									+'~r~n' + &
			'  ~r~n' +&
			'        }'																																	+'~r~n' + &
			'          google.charts.setOnLoadCallback(drawDashboard);'																	+'~r~n' + &
			'  ~r~n' +&
			'      }'																																	+'~r~n' + &
			'    }'																																		+'~r~n' + &
			'  ~r~n' +&
			'  $(document).ready(function(){'																									+'~r~n' + &
			'    google.charts.load(~'50~', {packages:[~'line~',~'controls~']});'												+'~r~n' + &
			'    chartDrowFun.chartDrow(); //chartDrow() run'																				+'~r~n' + &
			'});'																																		+'~r~n' + &
			'  </script>'																																+'~r~n' + &
			'</html>'																																+'~r~n' 
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_cscatter (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cscatter( ref string as_html )
//  chart : Scatter
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_head, ls_data, ls_option, ls_package[]

as_html = ''
ls_data = ''
is_chart = "scatter"

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales", "series_explode")
of_gen_option(ls_option, is_chart)

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data 
	as_html += ls_option 

	as_html = as_html + '        var chart = new google.visualization.ScatterChart(document.getElementById(~'chart_div~'));' +'~r~n' +&
			'  ~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' + &
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  <body>' + '~r~n' +&
			'    <div id="chart_div" style="width: ' + string(ii_width) + '; ' + 'height: ' + string(ii_height) + '"></div>' + '~r~n' +&
			'  </body>' +'~r~n' +&
			'</html>' +'~r~n'

catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn

//  <head>
//    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
//    <script type="text/javascript">
//      google.charts.load('current', {'packages':['corechart']});
//      google.charts.setOnLoadCallback(drawChart);
//
//      function drawChart() {
//        var data = google.visualization.arrayToDataTable([
//          ['Age', 'Weight'],
//          [ 8,      12],
//          [ 4,      5.5],
//          [ 11,     14],
//          [ 4,      5],
//          [ 3,      3.5],
//          [ 6.5,    7]
//        ]);
//
//        var options = {
//          title: 'Age vs. Weight comparison',
//          hAxis: {title: 'Age', minValue: 0, maxValue: 15},
//          vAxis: {title: 'Weight', minValue: 0, maxValue: 15},
//          legend: 'none'
//        };
//
//        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));
//
//        chart.draw(data, options);
//      }
//    </script>
//  </head>
//  <body>
//    <div id="chart_div" style="width: 900px; height: 500px;"></div>
//  </body>
//</html>
end function

public function integer of_gen_clinecrosshair (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_clinecrosshair( ref string as_html )
//  chart : Line Cross Hair
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_data, ls_head, ls_option, ls_package[]

as_html = ''
ls_data = ''

is_chart = "line"
ls_package[1] = "corechart"
ls_package[2] = "line"

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datacrosshair(ls_data, idw_1, "sales", "series explode", "sales", "series_explode")

Try 
	as_html = '<!DOCTYPE html>' 																				+'~r~n' + &
			'  <head>' 																								+'~r~n' + &
			'    <meta charset="utf-8">' 																		+'~r~n' + &
    			'  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>' + '~r~n' + &
			'  <script type="text/javascript">' + '~r~n' +&
			'  ~r~n' +&
			'   google.charts.load(~'current~', {packages: [~'corechart~', ~'line~']});' + '~r~n' + &
			'   google.charts.setOnLoadCallback(drawCrosshairs);' + '~r~n' + &
			'  ~r~n' 

	as_html += ls_data			

	as_html = as_html + '      var options = {' + '~r~n' + &
			'        hAxis: {' + '~r~n' +&
			'          title: ~'$$haxis~'' + '~r~n' +&
			'        },' + '~r~n' +&
			'        vAxis: {' + '~r~n' +&
			'          title: ~'$$vaxis~'' + '~r~n' +&
			'        },' + '~r~n' +&
			'        colors: [~'#a52714~', ~'#097138~'],' + '~r~n' +&
			'        crosshair: {' + '~r~n' +&
			'          color: ~'#000~',' + '~r~n' +&
			'          trigger: ~'selection~'' + '~r~n' +&
			'        }' + '~r~n' +&
			'      };' + '~r~n' +&
			'  ~r~n' +&
			'      var chart = new google.visualization.LineChart(document.getElementById(~'chart_div~'));' + '~r~n' +&
			'  ~r~n' +&
			'      chart.draw(data, options);' + '~r~n' +&
			'      chart.setSelection([{row: 2, column: 1}]);' + '~r~n' +&
			'  ~r~n' +&
			'    }' + '~r~n' +&
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  <body>' + '~r~n' +&
			'    <div id="chart_div" style="width: ' + string(ii_width) + '; ' + 'height: ' + string(ii_height) + '"></div>' + '~r~n' +&
			'  </body>' +'~r~n' +&
			'</html>' +'~r~n'
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn

end function

public function integer of_gen_datacrosshair (ref string as_data, datawindow adw_1, string as_colname1, string as_colname2, string as_valname1, string as_valname2);// Create the data table.

int   	li_rtn = 1, li_row
string 	ls_col, ls_val1, ls_val2

as_data = ''

Try 
	as_data = 'function drawCrosshairs() {' + '~r~n' +&
	               '      var data = new google.visualization.DataTable();' + '~r~n' +&
	               '           data.addColumn(~'number~', ~'X~' );' + '~r~n' +&
	               '           data.addColumn(~'number~', ~'' + as_colname1 + '~');' + '~r~n' +&
	               '           data.addColumn(~'number~', ~'' + as_colname2 + '~');' + '~r~n' +&
	               ' ~r~n' +&
	               '      data.addRows([' + '~r~n' +&
	               '       [0, 0, 0],  ' + '~r~n' 
						
	For li_row = 1 to adw_1.Rowcount()
		ls_val1 = string(adw_1.GetItemNumber(li_row, as_valname1))
		ls_val2 = string(adw_1.GetItemNumber(li_row, as_valname1))
		If li_row <> adw_1.Rowcount() Then
			as_data = as_data + '[' + string(li_row) + ', ' + ls_val1 + ', ' + ls_val2 + '], ~r~n'
		Else
			as_data = as_data + '[' + string(li_row) + ', ' + ls_val1 + ', ' + ls_val2 + ']]);~r~n'
		End If
	Next	
	
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn

end function

public function integer of_gen_cwoterfall (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cline2( ref string as_html )
//  chart : line sample
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
as_html = ''

//$$title
//$$header
Try 
	as_html = '<!DOCTYPE html>' 																				+'~r~n' + &
	'  <head>' + '~r~n' +&
	'    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>' + '~r~n' +&
	'    <script type="text/javascript">' + '~r~n' +&
	'      google.charts.load(~'current~', {~'packages~':[~'corechart~']});' + '~r~n' +&
	'      google.charts.setOnLoadCallback(drawChart);' + '~r~n' +&
	'      function drawChart() {' + '~r~n' +&
	'        var data = google.visualization.arrayToDataTable([' + '~r~n' +&
	'          [~'Mon~', 28, 28, 38, 38],' + '~r~n' +&
	'          [~'Tue~', 38, 38, 55, 55],' + '~r~n' +&
	'          [~'Wed~', 55, 55, 77, 77],' + '~r~n' +&
	'          [~'Thu~', 77, 77, 66, 66],' + '~r~n' +&
	'          [~'Fri~', 66, 66, 22, 22]' + '~r~n' +&
	'          // Treat the first row as data.' + '~r~n' +&
	'        ], true);' + '~r~n' +&
	'~r~n' +&
	'        var options = {' + '~r~n' +&
	'          legend: ~'none~',' + '~r~n' +&
	'          bar: { groupWidth: ~'100%~' }, // Remove space between bars.' + '~r~n' +&
	'          candlestick: {' + '~r~n' +&
	'            fallingColor: { strokeWidth: 0, fill: ~'#a52714~' }, // red' + '~r~n' +&
	'            risingColor: { strokeWidth: 0, fill: ~'#0f9d58~' }   // green' + '~r~n' +&
	'          }' + '~r~n' +&
	'        };' + '~r~n' +&
	'~r~n' +&
	'        var chart = new google.visualization.CandlestickChart(document.getElementById(~'chart_div~'));' + '~r~n' +&
	'        chart.draw(data, options);' + '~r~n' +&
	'      }' + '~r~n' +&
	'    </script>' + '~r~n' +&
	'  </head>' + '~r~n' +&
	'  <body>' + '~r~n' +&
	'    <div id="chart_div" style="width: 900px; height: 500px;"></div>' + '~r~n' +&
	'  </body>' + '~r~n' +&
	'</html>' + '~r~n'
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function integer of_gen_ccombo (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cline2( ref string as_html )
//  chart : line sample
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
as_html = ''

//$$title
//$$header
Try 
	as_html = '<!DOCTYPE html>' 																				+'~r~n' + &
	'  <head>' + '~r~n' +&
	'    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>' + '~r~n' +&
	'    <script type="text/javascript">' + '~r~n' +&
	'      google.charts.load(~'current~', {~'packages~':[~'corechart~']});' + '~r~n' +&
	'      google.charts.setOnLoadCallback(drawVisualization);' + '~r~n' +&
	'~r~n' +&
	'      function drawVisualization() {' + '~r~n' +&
	'        // Some raw data (not necessarily accurate)' + '~r~n' +&
	'        var data = google.visualization.arrayToDataTable([' + '~r~n' +&
	'         [~'Month~', ~'Bolivia~', ~'Ecuador~', ~'Madagascar~', ~'Papua New Guinea~', ~'Rwanda~', ~'Average~'],' + '~r~n' +&
	'         [~'2004/05~',  165,      938,         522,             998,           450,      614.6],' + '~r~n' +&
	'         [~'2005/06~',  135,      1120,        599,             1268,          288,      682],' + '~r~n' +&
	'         [~'2006/07~',  157,      1167,        587,             807,           397,      623],' + '~r~n' +&
	'         [~'2007/08~',  139,      1110,        615,             968,           215,      609.4],' + '~r~n' +&
	'         [~'2008/09~',  136,      691,         629,             1026,          366,      569.6]]);' + '~r~n' +&
	'~r~n' +&
	'        var options = {' + '~r~n' +&
	'      title : ~'Monthly Coffee Production by Country~',' + '~r~n' +&
	'      vAxis: {title: ~'Cups~'},' + '~r~n' +&
	'      hAxis: {title: ~'Month~'},' + '~r~n' +&
	'      seriesType: ~'bars~',' + '~r~n' +&
	'      series: {5: {type: ~'line~'}}' + '~r~n' +&
	'    };' + '~r~n' +&
	'~r~n' +&
	'        var chart = new google.visualization.ComboChart(document.getElementById(~'chart_div~'));' + '~r~n' +&
	'        chart.draw(data, options);' + '~r~n' +&
	'      }' + '~r~n' +&
	'    </script>' + '~r~n' +&
	'  </head>' + '~r~n' +&
	'  <body>' + '~r~n' +&
	'    <div id="chart_div" style="width: 900px; height: 500px;"></div>' + '~r~n' +&
	'  </body>' + '~r~n' +&
	'</html>' + '~r~n'
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn


end function

public function integer of_gen_cgauge (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_cgauge( ref string as_html )
//  chart : gauge
//-----------------------------------------------------------------------------------

int   	li_rtn = 1

string	ls_head, ls_data, ls_option, ls_package[]

as_html = ''
ls_data = ''
is_chart = "gauge"

ls_package[] = {"gauge"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year", "sales", '')
of_gen_option(ls_option, is_chart) 

//$title
//$header

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data 
	as_html += ls_option 

	as_html += '        var chart = new google.visualization.Gauge(document.getElementById(~'chart_div~'));' + '~r~n' +&
			'  ~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'  ~r~n' +&
			'        setInterval(function() {' + '~r~n' + &
			'          data.setValue(0, 1, 40 + Math.round(60 * Math.random()));' + '~r~n' + &
			'          chart.draw(data, options);' + '~r~n' + &
			'        }, 13000);' + '~r~n' + &
			'        setInterval(function() {' + '~r~n' + &
			'          data.setValue(1, 1, 40 + Math.round(60 * Math.random()));' + '~r~n' + &
			'          chart.draw(data, options);' + '~r~n' + &
			'        }, 5000);' + '~r~n' + &
			'        setInterval(function() {' + '~r~n' + &
			'          data.setValue(2, 1, 60 + Math.round(20 * Math.random()));' + '~r~n' + &
			'          chart.draw(data, options);' + '~r~n' + &
			'        }, 26000);' + '~r~n' + &
			'        setInterval(function() {' + '~r~n' + &
			'          data.setValue(3, 1, 40 + Math.round(60 * Math.random()));' + '~r~n' + &
			'          chart.draw(data, options);' + '~r~n' + &
			'        }, 13000);' + '~r~n' + &
			'      }' + '~r~n' + &
			'    </script>' + '~r~n' + &
			'  </head>' + '~r~n' + &
			'  <body>' + '~r~n' + &
			'    <div id=~"chart_div~" style=~"width: 400px; height: 120px;~"></div>' + '~r~n' + &
			'  </body>' + '~r~n' + &
			'</html>' + '~r~n' 
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public subroutine of_silentmode (boolean ab_silent);// This function toggles the Silent property which represents the
// property ScriptErrorsSuppressed of the underlying IE browser.

If ab_silent Then
	this.Object.Silent = True
Else
	this.Object.Silent = False
End If

end subroutine

public subroutine of_navigate (string as_url);// go to specified file\webpage

SetPointer(HourGlass!)

this.object.Navigate(as_url, 0, "", "", "")

end subroutine

public function integer of_gen_clinenormal (ref string as_html);//-----------------------------------------------------------------------------------
//  function name : of_gen_clinecurve( ref string as_html )
//  chart : line curve
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_head, ls_data, ls_option, ls_package[]

as_html = ''
ls_data = ''
is_chart = "line_chart"

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales", "series_explode")
of_gen_option(ls_option, is_chart)

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data 
	as_html += ls_option 
	                
	as_html = as_html + '        var chart = new google.visualization.LineChart(document.getElementById(~'linechart_material~'));' +'~r~n' +&
			'  ~r~n' +&
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' + &
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  <body>' + '~r~n' +&
			'    <div id="linechart_material" style="width: ' + string(ii_width) + '; ' + 'height: ' + string(ii_height) + '"></div>' + '~r~n' +&
			'  </body>' +'~r~n' +&
			'</html>' +'~r~n'

catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public subroutine of_controlpanel (string as_control_app);// this function launches a Control Panel app

String ls_null

SetNull(ls_null)

ShellExecute(GetDesktopWindow(), ls_null, "rundll32.exe", &
	"shell32.dll,Control_RunDLL " + as_control_app + ",", ls_null, 0)
end subroutine

public subroutine of_designmode ();// turn on design mode
this.Object.Document.designMode = "On"
end subroutine

public subroutine of_documentcommand (string as_command);// Execute document command

String ls_Null

SetNull(ls_Null)

this.Object.Document.ExecCommand(as_Command, False, ls_Null)
end subroutine

public subroutine of_documentcommand (string as_command, boolean ab_userinterface);// Execute document command with choice of popup/nopopup

String ls_Null

SetNull(ls_Null)

this.Object.Document.ExecCommand(as_Command, ab_UserInterface, ls_Null)

end subroutine

public subroutine of_documentcommand (string as_command, string as_value);// Execute document command with value

this.Object.Document.ExecCommand(as_Command, False, as_Value)

end subroutine

public subroutine of_documentcopy ();
// Execute document command : copy

String ls_Null

SetNull(ls_Null)

oleobject ldoc

ldoc = This.Object.Document.DomDocument()
//  mshtml.IHTMLBodyElement body = (mshtml.IHTMLBodyElement)doc.body;
//  mshtml.IHTMLTxtRange range = body.createTextRange();
//  range.select();

// mshtml.IHTMLDocument2 doc = (mshtml.IHTMLDocument2)webBrowser1.Document.DomDocument;
//  mshtml.IHTMLBodyElement body = (mshtml.IHTMLBodyElement)doc.body;
//  mshtml.IHTMLTxtRange range = body.createTextRange();
//  range.select();

this.Object.Document.ExecCommand("Copy", False, ls_Null)
this.Object.Document.ExecCommand("Unselect", False, ls_Null)

end subroutine

public subroutine of_execscript (integer as_script);// execute a script within the document
this.Object.Document.ParentWindow.ExecScript(as_script)

end subroutine

public subroutine of_execwb (integer command_id, integer execution_option);// execute web browser command
this.object.ExecWB(command_id, execution_option, AsStatement!)

end subroutine

public subroutine of_execwb_pagesetup ();// Open Page Setup window
this.of_execwb(OLECMDID_PAGESETUP, OLECMDEXECOPT_PROMPTUSER)
end subroutine

public subroutine of_execwb_print (boolean ab_prompt);// open print dialog
If ab_prompt Then
	this.of_execwb(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER)
Else
	this.of_execwb(OLECMDID_PRINT, OLECMDEXECOPT_DODEFAULT)
End If

end subroutine

public subroutine of_execwb_printpreview ();// Open Print Preview window
this.of_execwb(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_PROMPTUSER)

end subroutine

public subroutine of_execwb_save ();// save the current document
this.of_execwb(OLECMDID_SAVE, OLECMDEXECOPT_DODEFAULT)

end subroutine

public subroutine of_execwb_saveas ();// open saveas dialog
//this.of_execwb(OLECMDID_SAVEAS, OLECMDEXECOPT_DODEFAULT)
this.of_execwb(OLECMDID_SAVEAS, OLECMDEXECOPT_PROMPTUSER)

end subroutine

public function integer of_gen_cannotation (string as_html, string as_graphname);//-----------------------------------------------------------------------------------
//  function name : of_gen_cannotation( ref string as_html, string as_graphname )
//  chart : annotation
//-----------------------------------------------------------------------------------

int   	li_rtn = 1
string	ls_data, ls_head, ls_option, ls_package[]

is_chart = "annotationchart"
as_html = ''
ls_data = ''

//$$title
//$$header
//$$width
//$$height

ls_package[] = {"corechart"}

of_gen_head(ls_head, ls_package[], "drawChart")  		//head, package, callback
of_gen_datatable(ls_data, idw_1, "year","sales")
of_gen_option(ls_option, is_chart)

Try 
	as_html = '<!DOCTYPE html>' + '~r~n'
	as_html += ls_head
	as_html += ls_data 

//        var data = new google.visualization.DataTable();
//        data.addColumn('date', 'Date');
//        data.addColumn('number', 'Kepler-22b mission');
//        data.addColumn('string', 'Kepler title');
//        data.addColumn('string', 'Kepler text');
//        data.addColumn('number', 'Gliese 163 mission');
//        data.addColumn('string', 'Gliese title');
//        data.addColumn('string', 'Gliese text');
//        data.addRows([
//          [new Date(2314, 2, 15), 12400, undefined, undefined, 10645, undefined, undefined],
//          [new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter', 12374, undefined, undefined],
//          [new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall', 15766, 'Gallantors', 'First Encounter'],
//          [new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!', 34334, 'Gallantors', 'Statement of shared principles'],
//          [new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties', 66467, 'Gallantors', 'Mysteries revealed'],
//          [new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost', 79463, 'Gallantors', 'Omniscience achieved']]);

	as_html = as_html + '  ~r~n' +&
			'        var chart = new google.visualization.AnnotationChart(document.getElementById(~'chart_div~'));' + '~r~n'
			
	as_html = as_html + ls_option	+&		
			'        chart.draw(data, options);' + '~r~n' +&
			'      }' + '~r~n' +&
			'    </script>' + '~r~n' +&
			'  </head>' + '~r~n' +&
			'  ~r~n' +&
			'  <body>' + '~r~n' +&
			'    <div id=~'chart_div~' style=~'width: ' + string(ii_width) + '; height: ' + string(ii_height) + ';></div>' + '~r~n' +&
			'  </body>' + '~r~n' +&
			'</html>' + '~r~n' 
			
catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

public function STRING of_getsource ();// return the webpage HTML source
Return this.Object.Document.documentElement.InnerHTML

end function

public function string of_geturl ();// return the current URL
Return this.Object.LocationURL
end function

public subroutine of_goback ();// go back one page
this.object.goBack()

end subroutine

public subroutine of_goforward ();// go forward one page
this.object.goForward()

end subroutine

public subroutine of_gohome ();// go to home page
this.object.goHome()

end subroutine

public subroutine of_gosearch ();// go to search page
this.object.goSearch()

end subroutine

public subroutine of_inserthtml (string as_html);// insert passed HTML into the selected range

OleObject range

range = this.Object.Document.selection.createRange()

range.pasteHTML(as_Html)

range.collapse(false)

range.select()

end subroutine

public function boolean of_ispropertyset (string as_propname);// Query a boolean property of the document, e.g. Bold, Italic, or Underline

Return this.Object.Document.queryCommandState(as_PropName)

end function

public subroutine of_resize (integer ai_newwidth, integer ai_newheight);// resize the control
this.Resize(ai_newwidth, ai_newheight)

// adjust object size to match control size
this.SetRedraw(False)
this.Object.Width = UnitsToPixels(ai_newwidth, XUnitsToPixels!)
this.Object.Height = UnitsToPixels(ai_newheight, YUnitsToPixels!)
this.SetRedraw(True)

end subroutine

public subroutine of_stop ();// stop current navigate
this.object.Stop()

end subroutine

public subroutine of_toggle_property (string as_propname);// Toggle a property such as Bold, Italic or Underline

// This is actually done as a command
of_DocumentCommand(as_PropName)

end subroutine

public function integer of_writefile (string as_filename, string as_filecontents);// -----------------------------------------------------------------------------
// SCRIPT:     u_web_browser.of_WriteFile
//
// PURPOSE:    This function writes a file to disk.
//
// ARGUMENTS:  as_filename			- Name of the file to write
//					as_filecontents	- Contents of the file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 9/18/2008	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong lul_file, lul_length, lul_written
Blob lblob_filecontents
Boolean lb_result

lul_file = CreateFile(as_filename, GENERIC_WRITE, &
					FILE_SHARE_WRITE, 0, CREATE_ALWAYS, 0, 0)
If lul_file = INVALID_HANDLE_VALUE Then
	Return -999
End If

lblob_filecontents = Blob(as_filecontents)
lul_length = LenA(lblob_filecontents)

lb_result = WriteFile(lul_file, lblob_filecontents, &
					lul_length, lul_written, 0)

CloseHandle(lul_file)

Return 0

end function

public function integer of_gen_head (ref string as_head, string as_package[], string as_callback);int   	li_rtn = 1

//"curve_chart", "gauge", "annotationchart", "pie"

as_head = ''


Try 
	as_head = '  <head>' + '~r~n' +&
			'    <meta charset="utf-8">'	 + '~r~n' + &
 			' <meta http-equiv="X-UA-Compatible" content="IE=edge">' + '~r~n' + &
			'	<!-- google charts -->' + '~r~n' +&
			'	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>' + '~r~n' +&
			'	<script type="text/javascript">' + '~r~n' +&
			'~r~n' +&
			'      // Load the Visualization API and the corechart package.' +'~r~n' +&
			'      google.charts.load(~'current~', {~'packages~':[~'' + as_package[1] + '~''

	If UpperBound(as_package[]) > 1 Then
		as_head += ', ~'' + as_package[2] + '~']});~r~n' 
	Else	
		as_head += ']});' +'~r~n' 
	End If

	as_head += '~r~n' +&
			'      // Set a callback to run when the Google Visualization API is loaded.' +'~r~n' +&
			'      google.charts.setOnLoadCallback(' + as_callback + ');' + '~r~n' +&
			'~r~n' 

catch ( runtimeerror re)
	messagebox("Error", re.getmessage())
	li_rtn = 0
End Try

return li_rtn
end function

on uo_google_chart.create
end on

on uo_google_chart.destroy
end on

event constructor;
ii_width		= UnitsToPixels(this.width, XUnitsToPixels!)
ii_height		= UnitsToPixels(this.height, YUnitsToPixels!)

This.of_SilentMode(True)
This.of_navigate("about:blank")
end event

event error;action = ExceptionIgnore!
end event

event externalexception;action = ExceptionIgnore!
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
08uo_google_chart.bin 
2800000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000053fbc53001d8294900000003000000c00000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe0000000000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f0000000053fbc53001d8294953fbc53001d82949000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c000000000000000100000002fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000256a00001aaa0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18uo_google_chart.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
