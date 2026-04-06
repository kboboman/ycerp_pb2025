$PBExportHeader$n_filesys.sru
forward
global type n_filesys from nonvisualobject
end type
type filetime from structure within n_filesys
end type
type win32_find_data from structure within n_filesys
end type
type systemtime from structure within n_filesys
end type
type shfileopstruct from structure within n_filesys
end type
end forward

type filetime from structure
	unsignedlong		dwlowdatetime
	unsignedlong		dwhighdatetime
end type

type win32_find_data from structure
	unsignedlong		dwfileattributes
	filetime		ftcreationtime
	filetime		ftlastaccesstime
	filetime		ftlastwritetime
	unsignedlong		nfilesizehigh
	unsignedlong		nfilesizelow
	unsignedlong		dwreserved0
	unsignedlong		dwreserved1
	character		cfilename[260]
	character		calternatefilename[14]
end type

type systemtime from structure
	unsignedinteger		wyear
	unsignedinteger		wmonth
	unsignedinteger		wdayofweek
	unsignedinteger		wday
	unsignedinteger		whour
	unsignedinteger		wminute
	unsignedinteger		wsecond
	unsignedinteger		wmilliseconds
end type

type shfileopstruct from structure
	long		hwnd
	unsignedlong		wfunc
	long		pfrom
	string		pto
	unsignedinteger		fflags
	boolean		banyoperationsaborted
	long		hnamemappings
	string		lpszprogresstitle
end type

global type n_filesys from nonvisualobject
end type
global n_filesys n_filesys

type prototypes
Function ulong GetLogicalDrives ( &
	) Library "kernel32.dll" Alias For "GetLogicalDrives"

Function ulong GetDriveType ( &
	string lpRootPathName &
	) Library "kernel32.dll" Alias For "GetDriveTypeA;Ansi"

Function ulong WNetGetConnection ( &
	string lpLocalName, &
	Ref string lpRemoteName, &
	Ref ulong lpnLength &
	) Library "mpr.dll" Alias For "WNetGetConnectionA;Ansi"

Function ulong GetVolumeInformation( &
	string lpRootPathName, &
   Ref string lpVolumeNameBuffer, &
	ulong nVolumeNameSize, &
	Ref string lpVolumeSerialNumber, &
   Ref ulong lpMaximumComponentLength, &
	Ref ulong lpFileSystemFlags, &
	Ref string lpFileSystemNameBuffer, &
   ulong nFileSystemNameSize &
	) Library "kernel32.dll" Alias For "GetVolumeInformationA;Ansi"

Function long FindFirstFile ( &
	string lpFileName, &
	Ref win32_find_data lpFindFileData &
	) Library "kernel32.dll" Alias For "FindFirstFileA;Ansi"

Function boolean FindNextFile ( &
	long hFindFile, &
	Ref win32_find_data lpFindFileData &
	) Library "kernel32.dll" Alias For "FindNextFileA;Ansi"

Function boolean FindClose ( &
	long hFindFile &
	) Library "kernel32.dll" Alias For "FindClose"

Function boolean FileTimeToLocalFileTime ( &
	Ref filetime lpFileTime, &
	Ref filetime lpLocalFileTime &
	) Library "kernel32.dll" Alias For "FileTimeToLocalFileTime;Ansi"

Function boolean FileTimeToSystemTime ( &
	Ref filetime lpFileTime, &
	Ref systemtime lpSystemTime &
	) Library "kernel32.dll" Alias For "FileTimeToSystemTime;Ansi"

Function boolean GetDiskFreeSpaceEx ( &
	string lpDirectoryName, &
	Ref long lpFreeBytesAvailable, &
	Ref long lpTotalNumberOfBytes, &
	Ref long lpTotalNumberOfFreeBytes &
	) Library "kernel32.dll" Alias For "GetDiskFreeSpaceExA;Ansi"

Function ulong GetTempPath ( &
	ulong nBufferLength, &
	Ref string lpBuffer &
	) Library "kernel32.dll" Alias For "GetTempPathA;Ansi"

Function boolean SetFileAttributes ( &
	string lpFileName, &
	ulong dwFileAttributes &
	) Library "kernel32.dll" Alias For "SetFileAttributesA;Ansi"

Function long SHGetFolderPath ( &
	long hwnd, &
	ulong csidl, &
	long hToken, &
	ulong dwFlags, &
	Ref string pszPath &
	) Library "shell32.dll" Alias For "SHGetFolderPathA;Ansi"

Function ulong SHFileOperation ( &
	shfileopstruct lpFileOp &
	) Library "SHELL32.DLL" Alias For "SHFileOperationA;Ansi"

Function long RtlMoveMemory ( &
	long Destination, &
	Ref char Source[], &
	long Size &
	) Library "kernel32.dll" Alias For "RtlMoveMemory;Ansi"

Function long LocalAlloc ( &
	ulong uFlags, &
	long uBytes &
	) Library "kernel32.dll"

Function long LocalFree ( &
	long hMem &
	) Library "kernel32.dll"

Function boolean SystemTimeToFileTime ( &
	SYSTEMTIME lpSystemTime, &
	Ref FILETIME lpFileTime &
	) Library "kernel32.dll" alias for "SystemTimeToFileTime;Ansi"

Function boolean LocalFileTimeToFileTime ( &
	FILETIME lpLocalFileTime, &
	Ref FILETIME lpFileTime &
	) Library "kernel32.dll" alias for "LocalFileTimeToFileTime;Ansi"

Function boolean SetFileTime ( &
	long hFile, &
	FILETIME lpCreationTime, &
	FILETIME lpLastAccessTime, &
	FILETIME lpLastWriteTime &
	) Library "kernel32.dll" alias for "SetFileTime;Ansi"

Function long CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	long lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	long hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileA;Ansi"

Function boolean CloseHandle ( &
	long hObject &
	) Library "kernel32.dll"

Function ulong GetSecurityInfo ( &
	long handle, &
	integer ObjectType, &
	ulong SecurityInfo, &
	Ref long ppsidOwner, &
	Ref long ppsidGroup, &
	Ref long ppDacl, &
	Ref long ppSacl, &
	Ref long ppSecurityDescriptor &
	) Library "advapi32.dll"

Function Boolean LookupAccountSid ( &
	long lpSystemName, &
	long Sid, &
	Ref String Name, &
	Ref ulong cchName, &
	Ref String ReferencedDomainName, &
	Ref ulong cchReferencedDomainName, &
	Ref integer peUse &
	) Library "advapi32.dll" Alias For "LookupAccountSidA;Ansi"

end prototypes

type variables
Constant ULong ERROR_SUCCESS	= 0
Constant Long NULL				= 0

// Constants for of_GetDrives
Constant ULong DRIVE_UNKNOWN		= 0
Constant ULong DRIVE_NO_ROOT_DIR	= 1
Constant ULong DRIVE_REMOVABLE	= 2
Constant ULong DRIVE_FIXED			= 3
Constant ULong DRIVE_REMOTE		= 4
Constant ULong DRIVE_CDROM			= 5
Constant ULong DRIVE_RAMDISK		= 6

// Constants for SHGetFolderPath
Constant Long CSIDL_DESKTOP					= 0
Constant Long CSIDL_INTERNET					= 1
Constant Long CSIDL_PROGRAMS					= 2
Constant Long CSIDL_CONTROLS					= 3
Constant Long CSIDL_PRINTERS					= 4
Constant Long CSIDL_PERSONAL					= 5
Constant Long CSIDL_FAVORITES					= 6
Constant Long CSIDL_STARTUP					= 7
Constant Long CSIDL_RECENT						= 8
Constant Long CSIDL_SENDTO						= 9
Constant Long CSIDL_BITBUCKET					= 10
Constant Long CSIDL_STARTMENU					= 11
Constant Long CSIDL_MYDOCUMENTS				= CSIDL_PERSONAL
Constant Long CSIDL_MYMUSIC					= 13
Constant Long CSIDL_MYVIDEO					= 14
Constant Long CSIDL_DESKTOPDIRECTORY		= 16
Constant Long CSIDL_DRIVES						= 17
Constant Long CSIDL_NETWORK					= 18
Constant Long CSIDL_NETHOOD					= 19
Constant Long CSIDL_FONTS						= 20
Constant Long CSIDL_TEMPLATES					= 21
Constant Long CSIDL_COMMON_STARTMENU		= 22
Constant Long CSIDL_COMMON_PROGRAMS			= 23
Constant Long CSIDL_COMMON_STARTUP			= 24
Constant Long CSIDL_COMMON_DESKTOPDIRECTORY	= 25
Constant Long CSIDL_APPDATA					= 26
Constant Long CSIDL_PRINTHOOD					= 27
Constant Long CSIDL_LOCAL_APPDATA			= 28
Constant Long CSIDL_ALTSTARTUP				= 29
Constant Long CSIDL_COMMON_ALTSTARTUP		= 30
Constant Long CSIDL_COMMON_FAVORITES		= 31
Constant Long CSIDL_INTERNET_CACHE			= 32
Constant Long CSIDL_COOKIES					= 33
Constant Long CSIDL_HISTORY					= 34
Constant Long CSIDL_COMMON_APPDATA			= 35
Constant Long CSIDL_WINDOWS					= 36
Constant Long CSIDL_SYSTEM						= 37
Constant Long CSIDL_PROGRAM_FILES			= 38
Constant Long CSIDL_MYPICTURES				= 39
Constant Long CSIDL_PROFILE					= 40
Constant Long CSIDL_SYSTEMX86					= 41
Constant Long CSIDL_PROGRAM_FILESX86		= 42
Constant Long CSIDL_PROGRAM_FILES_COMMON	= 43
Constant Long CSIDL_PROGRAM_FILES_COMMONX86	= 44
Constant Long CSIDL_COMMON_TEMPLATES		= 45
Constant Long CSIDL_COMMON_DOCUMENTS		= 46
Constant Long CSIDL_COMMON_ADMINTOOLS		= 47
Constant Long CSIDL_ADMINTOOLS				= 48
Constant Long CSIDL_CONNECTIONS				= 49
Constant Long CSIDL_COMMON_MUSIC				= 53
Constant Long CSIDL_COMMON_PICTURES			= 54
Constant Long CSIDL_COMMON_VIDEO				= 55
Constant Long CSIDL_RESOURCES					= 56
Constant Long CSIDL_RESOURCES_LOCALIZED	= 57
Constant Long CSIDL_COMMON_OEM_LINKS		= 58
Constant Long CSIDL_CDBURN_AREA				= 59

// File operation types
Constant ULong FO_MOVE = 1
Constant ULong FO_COPY = 2
Constant ULong FO_DELETE = 3
Constant ULong FO_RENAME = 4

// File operation flags
Constant ULong FOF_MULTIDESTFILES 		= 1
Constant ULong FOF_CONFIRMMOUSE 			= 2
Constant ULong FOF_SILENT					= 4
Constant ULong FOF_RENAMEONCOLLISION	= 8
Constant ULong FOF_NOCONFIRMATION 		= 16
Constant ULong FOF_WANTMAPPINGHANDLE	= 32
Constant ULong FOF_ALLOWUNDO 				= 64
Constant ULong FOF_FILESONLY 				= 128
Constant ULong FOF_SIMPLEPROGRESS		= 256
Constant ULong FOF_NOCONFIRMMKDIR 		= 512
Constant ULong FOF_NOERRORUI				= 1024
Constant ULong FOF_NOCOPYSECURITYATTRIBS = 2048

// Constants for CreateFile
Constant Long INVALID_HANDLE_VALUE		= -1
Constant ULong GENERIC_READ				= 2147483648
Constant ULong GENERIC_WRITE				= 1073741824
Constant ULong FILE_ATTRIBUTE_NORMAL	= 128
Constant ULong FILE_SHARE_READ			= 1
Constant ULong FILE_SHARE_WRITE			= 2
Constant ULong CREATE_NEW					= 1
Constant ULong CREATE_ALWAYS				= 2
Constant ULong OPEN_EXISTING				= 3
Constant ULong OPEN_ALWAYS					= 4
Constant ULong TRUNCATE_EXISTING			= 5

// Constants for LookupAccountSid
Constant Integer SE_FILE_OBJECT				= 1
Constant ULong OWNER_SECURITY_INFORMATION	= 1

end variables

forward prototypes
public function integer of_getfiles (string as_filespec, boolean ab_hidden, ref string as_name[], ref double ad_size[], ref datetime adt_writedate[], ref boolean ab_subdir[])
public function boolean of_checkbit (long al_number, unsignedinteger ai_bit)
public function datetime of_filedatetimetopb (filetime astr_filetime, boolean ab_msecs)
public function integer of_getfiles (string as_filespec, ref string as_name[], ref boolean ab_subdir[])
end prototypes

public function integer of_getfiles (string as_filespec, boolean ab_hidden, ref string as_name[], ref double ad_size[], ref datetime adt_writedate[], ref boolean ab_subdir[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFiles
//
// PURPOSE:    This function returns a list of files with their size,
//					last write datetime and subdirectory flag.
//
// ARGUMENTS:  as_filespec		- File path
//             ab_hidden		- Whether hidden/system files are reported
//             as_name			- File Name array (By Ref)
//             ad_size			- File Size array (By Ref)
//             adt_writedate	- LastWrite Datetime array (By Ref)
//             ab_subdir		- Subdirectory flag (By Ref)
//
// RETURN:		Number of files found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Integer li_file
Long ll_Handle
Boolean lb_found, lb_hidden, lb_system
String ls_filename
win32_find_data lstr_fd

// append filename pattern
If RightA(as_filespec, 1) = "\" Then
	as_filespec += "*.*"
Else
	as_filespec += "\*.*"
End If

// find first file
ll_Handle = FindFirstFile(as_filespec, lstr_fd)
If ll_Handle < 1 Then Return -1

// loop through each file
Do
	// add file to array
	ls_filename = String(lstr_fd.cFilename)
	If ls_filename = "." Or ls_filename = ".." Then
	Else
		// check for hidden attrib
		lb_hidden = of_checkbit(lstr_fd.dwFileAttributes, 2)
		lb_system = of_checkbit(lstr_fd.dwFileAttributes, 3)
		If ( lb_hidden Or lb_system ) And &
			( ab_hidden = False ) Then
		Else
			// get file properties
			li_file++
			as_name[li_file]  = ls_filename
			ad_size[li_file] = (lstr_fd.nFileSizeHigh * (2.0 ^ 32)) + lstr_fd.nFileSizeLow
			adt_writedate[li_file] = of_filedatetimetopb(lstr_fd.ftlastwritetime, True)
			ab_subdir[li_file] = of_checkbit(lstr_fd.dwFileAttributes, 5)
		End If
	End If
	// find next file
	lb_Found = FindNextFile(ll_Handle, lstr_fd)
Loop Until Not lb_Found

// close find handle
FindClose(ll_Handle)

Return li_file

end function

public function boolean of_checkbit (long al_number, unsignedinteger ai_bit);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_Checkbit
//
// PURPOSE:    This function determines if a certain bit is on or off within
//					the number.
//
// ARGUMENTS:  al_number	- Number to check bits
//             ai_bit		- Bit number ( starting at 1 )
//
// RETURN:		True = On, False = Off
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

If Int(Mod(al_number / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False

end function

public function datetime of_filedatetimetopb (filetime astr_filetime, boolean ab_msecs);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_FileDateTimeToPB
//
// PURPOSE:    This function converts file system datetimes to a PB datetime.
//
// ARGUMENTS:  astr_filetime	- FILETIME structure
//					ab_msecs			- Option to includes milliseconds
//
// RETURN:		Datetime for the file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

DateTime ldt_filedate
FILETIME	lstr_localtime
SYSTEMTIME lstr_systime
String ls_time
Date ld_fdate
Time lt_ftime

SetNull(ldt_filedate)

If Not FileTimeToLocalFileTime(astr_FileTime, &
			lstr_localtime) Then Return ldt_filedate

If Not FileTimeToSystemTime(lstr_localtime, &
			lstr_systime) Then Return ldt_filedate

ld_fdate = Date(lstr_systime.wYear, &
					lstr_systime.wMonth, lstr_systime.wDay)

ls_time = String(lstr_systime.wHour) + ":" + &
			 String(lstr_systime.wMinute) + ":" + &
			 String(lstr_systime.wSecond)
If ab_msecs Then
	ls_time += ":" + String(lstr_systime.wMilliseconds)
End If

lt_ftime = Time(ls_Time)

ldt_filedate = DateTime(ld_fdate, lt_ftime)

Return ldt_filedate

end function

public function integer of_getfiles (string as_filespec, ref string as_name[], ref boolean ab_subdir[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFiles
//
// PURPOSE:    This function is a simplified version that only returns
//					filename and subdirectory flag.
//
// ARGUMENTS:  as_filespec		- File path
//             as_name			- File Name array (By Ref)
//             ab_subdir		- Subdirectory flag (By Ref)
//
// RETURN:		Number of files found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/17/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Double ld_size[]
DateTime ldt_writedate[]

Return of_GetFiles(as_filespec, False, &
					as_name, ld_size, ldt_writedate, ab_subdir)

end function

on n_filesys.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_filesys.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

