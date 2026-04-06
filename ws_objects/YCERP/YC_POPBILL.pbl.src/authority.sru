$PBExportHeader$authority.sru
forward
global type authority from nonvisualobject
end type
type hmac_info from structure within authority
end type
type systemtime from structure within authority
end type
type blobheader from structure within authority
end type
type keyblob from structure within authority
end type
end forward

type hmac_info from structure
	ulong HashAlgId
	ulong pbInnerString
	ulong cbInnerString
	ulong pbOuterString
	ulong cbOuterString
end type

type systemtime from structure
	uint year
	uint month
	uint dayofweek
	uint day
	uint hour
	uint minute
	uint second
	uint millisecond
end type

type blobheader from structure
	char bType
	char bVersion
	uint reserved
	ulong aiKeyAlg
end type

type keyblob from structure
	blobheader hdr
	ulong cbKeySize
end type

global type authority from nonvisualobject
end type
global authority authority

type prototypes
SUBROUTINE GetSystemTime(ref systemtime systimeptr) Library "Kernel32.dll" alias for "GetSystemTime;Ansi"

Function ulong GetLastError ( &
	) Library "kernel32.dll"

Function ulong FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageA;Ansi"

Function boolean CryptAcquireContext ( &
	Ref ulong phProv, &
	string pszContainer, &
	string pszProvider, &
	ulong dwProvType, &
	ulong dwFlags &
	) Library "advapi32.dll" Alias For "CryptAcquireContextA;Ansi"

Function boolean CryptReleaseContext ( &
	ulong hProv, &
	ulong dwFlags &
	) Library "advapi32.dll"

Function boolean CryptCreateHash ( &
	ulong hProv, &
	uint Algid, &
	ulong hKey, &
	ulong dwFlags, &
	Ref ulong phHash &
	) Library "advapi32.dll"

Function boolean CryptHashData ( &
	ulong hHash, &
	blob pbData, &
	ulong dwDataLen, &
	ulong dwFlags &
	) Library "advapi32.dll"

Function boolean CryptDestroyHash ( &
	ulong hHash &
	) Library "advapi32.dll"

Function boolean CryptDestroyKey ( &
	ulong hKey &
	) Library "advapi32.dll" Alias For "CryptDestroyKey"

Function boolean CryptGetHashParam ( &
	ulong hHash, &
	ulong dwParam, &
	ref blob pbData, &
	ref ulong pdwDataLen, &
	ulong dwFlags &
	) Library "advapi32.dll"
	
Function boolean CryptSetHashParam ( &
	ulong hHash, &
	ulong dwParam, &
	ref hmac_info pbData, &
	ulong dwFlags &
	) Library "advapi32.dll" alias for "CryptSetHashParam;Ansi"

Function boolean CryptBinaryToString ( &
	Blob pbBinary, &
	ulong cbBinary, &
	ulong dwFlags, &
	Ref string pszString, &
	Ref ulong pcchString &
	) Library "crypt32.dll" Alias For "CryptBinaryToStringA;Ansi"

Function boolean CryptStringToBinary ( &
	string pszString, &
	ulong cchString, &
	ulong dwFlags, &
	Ref blob pbBinary, &
	Ref ulong pcbBinary, &
	Ref ulong pdwSkip, &
	Ref ulong pdwFlags &
	) Library "crypt32.dll" Alias For "CryptStringToBinaryA;Ansi"
	

Function boolean CryptImportKey(ulong hProv, ref blob pbData, long dwDataLen, ulong hPubKey, long dwFlags, ref ulong phKey) library "Advapi32.dll"

SUBROUTINE CopyMemory (ref blob pDesc, ref KEYBLOB pSrc, ulong size) LIBRARY "kernel32" ALIAS FOR "RtlMoveMemory;Ansi" 
end prototypes

type variables
Private:
// Crypto constants
Constant ULong CRYPT_VERIFYCONTEXT	= 4026531840
Constant ULong CRYPT_STRING_BASE64		= 1
Constant String MS_DEF_PROV					= "Microsoft Base Cryptographic Provider v1.0" 
Constant ULong PROV_RSA_FULL				= 1
Constant ULong CALG_RC2						= 26114
Constant ULong CALG_HMAC					= 32777
Constant ULong CALG_MD5						= 32771
Constant ULong CALG_SHA1						= 32772
Constant ULong CRYPT_IPSEC_HMAC_KEY 	= 256
Constant char PLAINTEXTKEYBLOB 			= CharA(8)
Constant char CUR_BLOB_VERSION 			= CharA(2)

string in_ServiceURL = "https://auth.linkhub.co.kr"
linkhubException exception

public:
string linkID
string secretKey
end variables

forward prototypes
private function string of_encode64 (blob ablob_data)
private function string of_replaceall (string as_oldstring, string as_findstr, string as_replace)
private function blob of_decode64 (string as_encoded)
private subroutine of_getlasterror (ref unsignedlong aul_error, ref string as_msgtext)
private function string of_md5 (blob ablob_data)
private function blob of_hmacsha1 (ref blob target, ref blob key)
private subroutine skipchar (ref string inputjson, ref long index)
private function oleobject parseobject (ref string inputjson, ref long index) throws linkhubexception
private function string parsekey (ref string inputjson, ref long index) throws linkhubexception
public function any parsejson (string inputjson) throws linkhubexception

private function any parsearray (ref string str, ref long index) throws linkhubexception

private function boolean parseboolean (ref string str, ref long index) throws linkhubexception
public function token gettoken (readonly string serviceid, readonly string access_id, readonly string scope[], readonly string forwardip) throws linkhubexception
public function double getbalance (readonly string bearertoken, readonly string serviceid) throws linkhubexception
public function double getpartnerbalance (readonly string bearertoken, readonly string serviceid) throws linkhubexception
public function string getpartnerurl (readonly string bearertoken, readonly string serviceid, string togo) throws linkhubexception
private function decimal parsenumber (ref string str, ref long index) throws linkhubexception
private function string parsestring (ref string str, ref long index)
private function any parsevalue (ref string str, ref long index) throws linkhubexception
private function string parseNull (ref string str, ref long index) throws linkhubexception
public function int lengthArr() throws linkhubexception
public function any getTime() throws linkhubexception
end prototypes

private function string of_encode64 (blob ablob_data);String ls_encoded
ULong lul_len, lul_buflen
Boolean lb_rtn

lul_len = LenA(ablob_data)

lul_buflen = lul_len * 2

ls_encoded = Space(lul_buflen)

lb_rtn = CryptBinaryToString(ablob_data, &
				lul_len, CRYPT_STRING_BASE64, &
				ls_encoded, lul_buflen)

If lb_rtn Then
	ls_encoded = of_ReplaceAll(ls_encoded, "~r~n", "")
Else
	ls_encoded = ""
End If

Return ls_encoded

end function

private function string of_replaceall (string as_oldstring, string as_findstr, string as_replace);String ls_newstring
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

private function blob of_decode64 (string as_encoded);Blob lblob_data
ULong lul_len, lul_buflen, lul_skip, lul_pflags
Boolean lb_rtn

lul_len = LenA(as_encoded)
lul_buflen = lul_len
lblob_data = Blob(Space(lul_len))

lb_rtn = CryptStringToBinary(as_encoded, &
					lul_len, CRYPT_STRING_BASE64, lblob_data, &
					lul_buflen, lul_skip, lul_pflags)

Return BlobMid(lblob_data, 1, lul_buflen)

end function

private subroutine of_getlasterror (ref unsignedlong aul_error, ref string as_msgtext);Constant ULong FORMAT_MESSAGE_FROM_SYSTEM = 4096
Constant ULong LANG_NEUTRAL = 0
ULong lul_rtn, lul_Size = 255

aul_error = GetLastError()

as_msgtext = Space(lul_Size)

lul_rtn = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, 0, &
					aul_error, LANG_NEUTRAL, as_msgtext, lul_Size, 0)

end subroutine

private function string of_md5 (blob ablob_data);Constant ulong HP_ALGID		= 1
Constant ulong HP_HASHVAL	= 2
Constant ulong HP_HASHSIZE = 4
ULong lul_hProv, lul_hHash, lul_error, lul_DataLen
Blob{20} lblob_hash
Blob lblob_result
String ls_msgtext, ls_null

// Get handle to a key container
SetNull(ls_null)
If Not CryptAcquireContext(lul_hProv, ls_null, MS_DEF_PROV, &
			PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, "CryptAcquireContext:~r~n~r~n" + ls_msgtext)
End If

// Create the hash object
If Not CryptCreateHash(lul_hProv, CALG_MD5, 0, 0, lul_hHash) Then
	of_GetLastError(lul_error, ls_msgtext)
   CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptCreateHash:~r~n~r~n" + ls_msgtext)
End If

// Add data to the hash object
If Not CryptHashData(lul_hHash, ablob_data, LenA(ablob_data), 0) Then
	of_GetLastError(lul_error, ls_msgtext)
   CryptDestroyHash(lul_hHash)
   CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptHashData:~r~n~r~n" + ls_msgtext)
End If

// Get the hash value
lul_DataLen = LenA(lblob_hash)
If Not CryptGetHashParam(lul_hHash, HP_HASHVAL, lblob_hash, lul_DataLen, 0) Then
	of_GetLastError(lul_error, ls_msgtext)
   CryptDestroyHash(lul_hHash)
   CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptGetHashParam:~r~n~r~n" + ls_msgtext)
End If
lblob_result = BlobMid(lblob_hash, 1, lul_DataLen)

// Release crypto objects
CryptDestroyHash(lul_hHash)
CryptReleaseContext(lul_hProv, 0)

// return the result in hex
Return of_encode64(lblob_result)

end function

private function blob of_hmacsha1 (ref blob target, ref blob key);Constant ulong HP_HASHVAL	= 2
Constant ulong HP_HASHSIZE = 4
Constant ulong HP_HMAC_INFO = 5

ULong lul_hProv, lul_hHash, lul_error, lul_DataLen,hKey
String ls_msgtext, ls_null
Blob{20} lblob_hash

// Get handle to a key container
SetNull(ls_null)
If Not CryptAcquireContext(lul_hProv, ls_null, MS_DEF_PROV, &
			PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, "CryptAcquireContext:~r~n~r~n" + ls_msgtext)
End If

//Initialize key
keyblob kbkey

kbkey.hdr.bType = PLAINTEXTKEYBLOB
kbkey.hdr.bVersion = CUR_BLOB_VERSION
kbkey.hdr.aiKeyAlg = CALG_RC2
kbkey.cbKeySize = LenA(key)

blob{12} blbKey
CopyMemory(blbKey,kbKey,12)
blob keyblob
keyblob = blbkey + key

if not CryptImportKey(lul_hProv,keyblob,44,0,CRYPT_IPSEC_HMAC_KEY,hKey)  then
	of_GetLastError(lul_error, ls_msgtext)
	CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptImportKey:~r~n~r~n" + ls_msgtext)
end if


// Create the hash object
If Not CryptCreateHash(lul_hProv, CALG_HMAC, hKey, 0, lul_hHash) Then
	of_GetLastError(lul_error, ls_msgtext)
	CryptDestroyKey(hKey)
   	CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptCreateHash:~r~n~r~n" + ls_msgtext)
End If

hmac_info macInfo
macInfo.HashAlgId = CALG_SHA1

If Not CryptSetHashParam(lul_hHash, HP_HMAC_INFO, macInfo, 0) Then
	of_GetLastError(lul_error, ls_msgtext)
	CryptDestroyHash(lul_hHash)
	CryptDestroyKey(hKey)
   	CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptCreateHash:~r~n~r~n" + ls_msgtext)
End If


// Add data to the hash object
If Not CryptHashData(lul_hHash, target, LenA(target), 0) Then
	of_GetLastError(lul_error, ls_msgtext)
   	CryptDestroyHash(lul_hHash)
	CryptDestroyKey(hKey)
   	CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptHashData:~r~n~r~n" + ls_msgtext)
End If


// Get the hash value
lul_DataLen = LenA(lblob_hash)
If Not CryptGetHashParam(lul_hHash, HP_HASHVAL, lblob_hash, lul_DataLen, 0) Then
	of_GetLastError(lul_error, ls_msgtext)
   CryptDestroyHash(lul_hHash)
   CryptReleaseContext(lul_hProv, 0)
	SignalError(lul_error, "CryptGetHashParam:~r~n~r~n" + ls_msgtext)
End If
blob result 

result = BlobMid(lblob_hash, 1, lul_DataLen)

//release handle.
CryptDestroyHash(lul_hHash)
CryptDestroyKey(hKey)
CryptReleaseContext(lul_hProv, 0)
return result
end function

private subroutine skipchar (ref string inputjson, ref long index);boolean bComment
boolean bStartComment
boolean bLOngComment

do while index > 0 and index <= LenA(inputJson)
	
	CHOOSE CASE MidA(inputJson,index,1)

	case '~r','~n'
		if not bLongComment then
			bStartComment = false
			bComment = false
		end if

	case '~t' , ' ', '(',')'
		
	case '/'
	
		if not blongcomment then
			if bstartComment then
				bstartcomment = false
				bcomment = true
			else
				bstartcomment = true
				bcomment = false
				blongComment = false
			end if
		else
			if bStartcomment then
				blongComment = false
				bStartcomment = false
				bcomment = false
			end if
		end if
	
	case '*'
		if bStartcomment then
			bStartcomment = false
			bComment = true
			blongComment = true
		else
			bStartcomment = true
		end if
	case else
		if not bComment then EXIT
	end CHOOSE
	
	index = index + 1
loop
end subroutine

private function oleobject parseobject (ref string inputjson, ref long index) throws linkhubexception;
OLEObject resultDic
resultDic = create OLEObject

if resultDic.ConnectToNewObject("Scripting.Dictionary") <> 0 then throw exception.setCodeNMessage(-99999999,"Dictionary Create Fail.")

string key

skipChar(inputjson,index)

if MidA(inputJson,index,1) <> '{' then	throw exception.setCodeNMessage(-99999999,"Invaild JSON")

index = index + 1

do
	skipchar(inputjson,index)
	if MidA(inputjson,index,1) = '}' then
		index = index +1
		exit
	elseif MidA(inputjson,index,1) = ',' then
		index = index +1
		skipchar(inputjson,index)
	elseif index > LenA(inputjson) then
		throw exception.setCodeNMessage(-99999999,"Invaild JSON:missing '}'")
	end if
	
	key = parseKey(inputjson,index)
	any value
	value = parseValue(inputjson,index)
	
	if ClassName(value) = 'tarray' then
		tarray t
		t = value
		if t.getLength() = 0 then 
			oleobject tmpList[]
			resultDic.add(key, tmpList)
		elseif t.getLength() > 0 then
			resultDic.add(key,t.list)
		end if
	else
		resultDic.add(key,value)
	end if
	
	
loop while true

return resultDic
end function

private function string parsekey (ref string inputjson, ref long index) throws linkhubexception;
boolean dquote
boolean squote
char chars
string result
result = ""
skipChar(inputjson,index)

do while index > 0 and index <= LenA(inputjson)
	chars = MidA(inputjson,index,1)
	
	choose case chars
			
		case '"'
			dquote = not dquote
			index = index + 1
			if not dquote then
				skipchar(inputjson,index)
				if MidA(inputjson,index,1) <> ':' then
					throw exception.setCodeNMessage(-99999999,"invaild json key position")
				end if
			end if
		case "'"
			squote = not squote
			index = index + 1
			if not squote then
				skipchar(inputjson,index)
				if MidA(inputjson,index,1) <> ':' then
					throw exception.setCodeNMessage(-99999999,"invaild json key position")
				end if
			end if
		case ':'
			index = index + 1
			if not dquote and not squote then
				exit
			else
				result = result + chars
			end if
		case '~r','~n','~t',' '
			index = index + 1
		case else
			result = result + chars
			index = index + 1
	end choose
loop

return result
end function

public function any parsejson (string inputjson) throws linkhubexception;long index
index = 1
OLEObject result

skipchar(inputJson,index)

choose case MidA(inputJson,index,1)
	case '{'
		return parseObject(inputJson,index)
	case '['
		return parseArray(inputJson,index)
	case Else
		throw exception.setCodeNMessage(-99999999,"Invalid JSON")
end choose

return result
end function

private function tarray parsearray (ref string str, ref long index) throws linkhubexception;
tarray tarrayList
skipchar(str,index)
tarrayList = create tarray
if MidA(str,index,1) <> '[' then throw exception.setCodeNMessage(-99999999,"invalid json")

index = index + 1

long i = 1

do
	skipchar(str,index)
	if MidA(str,index,1) = ']' then 
		index = index + 1
		exit
	elseif MidA(str,index,1) = ',' then
		index = index + 1
		skipchar(str,index)
	elseif index > LenA(str) then
		throw exception.setCodeNMessage(-99999999,"Missing ']' in json")
	end if
	tarrayList.setObject(i,parseValue(str,index))
	i = i + 1
loop while true

return tarrayList
end function

private function boolean parseboolean (ref string str, ref long index) throws linkhubexception;
skipchar(str,index)
if MidA(str,index,4) = "true" then
	index = index + 4
	return true
elseif MidA(str,index,5) = "false" then
	index = index + 5
	return false
else
	throw exception.setCodeNMessage(-99999999,"Invalid json boolean value")
end if

end function

public function token gettoken (readonly string serviceid, readonly string access_id, readonly string scope[], readonly string forwardip) throws linkhubexception;OLEObject lo_httpRequest, dic
string ls_result, ls_url, ls_xDate, ls_postData,ls_signature
blob lbl_target, lbl_Key
Integer i
token resultToken

ls_xDate = gettime()
ls_url = "/" + serviceid + "/Token"

ls_postData = '{"access_id":"'+access_id+'"'
if UpperBound(scope) > 0 then
	ls_postData += ' , "scope":['
	for i = 1 to UpperBound(scope) Step 1
		ls_postData +=  '"' + scope[i] + '"' 
		if i < UpperBound(scope) then ls_postData += " , "
	next
	ls_postData += ']'
end if
ls_postData += '}'
string target
target = ""
target += "POST" + '~n' 
target += of_md5(blob(ls_postData)) + '~n' 
target += ls_xDate + '~n'
if (isnull(forwardIP) or forwardIP = "") = false then 
	target += forwardIP + '~n'
end if
target += "1.0" + '~n' 
target += ls_url
		
lbl_target = blob(target)
		
lbl_Key = of_decode64(secretKey)
ls_signature = of_encode64(of_hmacsha1(lbl_target,lbl_Key))

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("WinHttp.WinHttpRequest.5.1") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("POST",in_ServiceURL + ls_url,false)
lo_httpRequest.setRequestHeader("x-lh-date",ls_xDate)
lo_httpRequest.setRequestHeader("x-lh-vesion","1.0")
if (isnull(forwardIP) or forwardIP = "") = false then lo_httpRequest.setRequestHeader("x-lh-forwarded",forwardIP)
lo_httpRequest.setRequestHeader("Authorization","LINKHUB " + linkID + " " + ls_signature)

lo_httpRequest.send(ls_postData)
lo_httpRequest.waitForResponse()

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

dic = parsejson(ls_result)

resultToken.session_token = dic.Item("session_token")
resultToken.serviceid = dic.Item("serviceID")
resultToken.expiration = dic.Item("expiration")
resultToken.linkid = dic.Item("linkID")
if isnull(dic.Item("usercode")) = False then resultToken.usercode = dic.Item("usercode")
resultToken.ipaddress = dic.Item("ipaddress")

any tmpVal
tmpVal = dic.Item("scope")

resultToken.scope = dic.Item("scope")

dic.DisconnectObject()
destroy dic

return resultToken
end function

public function double getbalance (readonly string bearertoken, readonly string serviceid) throws linkhubexception;OLEObject lo_httpRequest, dic
string ls_result, ls_url
double result

ls_url = "/" + serviceID + "/Point"

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("WinHttp.WinHttpRequest.5.1") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("GET",in_ServiceURL + ls_url,false)
lo_httpRequest.setRequestHeader("Authorization","Bearer " + bearerToken)
lo_httpRequest.send()
lo_httpRequest.waitForResponse()

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

dic = parsejson(ls_result)

result = double(dic.Item("remainPoint"))

dic.DisconnectObject()
destroy dic

return result
end function

public function double getpartnerbalance (readonly string bearertoken, readonly string serviceid) throws linkhubexception;OLEObject lo_httpRequest, dic
string ls_result, ls_url
double result

ls_url = "/" + serviceID + "/PartnerPoint"

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("WinHttp.WinHttpRequest.5.1") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("GET",in_ServiceURL + ls_url,false)
lo_httpRequest.setRequestHeader("Authorization","Bearer " + bearerToken)
lo_httpRequest.send()
lo_httpRequest.waitForResponse()

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

dic = parsejson(ls_result)

result = double(dic.Item("remainPoint"))

dic.DisconnectObject()
destroy dic

return result
end function

public function string getpartnerurl (readonly string bearertoken, readonly string serviceid, string togo) throws linkhubexception;OLEObject lo_httpRequest, dic
string ls_result, ls_url, result

ls_url = "/" + serviceID + "/URL?TG=" + togo

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("WinHttp.WinHttpRequest.5.1") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("GET",in_ServiceURL + ls_url,false)
lo_httpRequest.setRequestHeader("Authorization","Bearer " + bearerToken)
lo_httpRequest.send()
lo_httpRequest.waitForResponse()

ls_result = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

dic = parsejson(ls_result)

result = dic.Item("url")

dic.DisconnectObject()
destroy dic

return result
end function

private function decimal parsenumber (ref string str, ref long index) throws linkhubexception;string value
string chars

skipchar(str,index)

do while index > 0 and index <= LenA(str)
	chars = MidA(str,index,1)
	choose case chars
		case '1','2','3','4','5','6','7','8','9','0','+','-','.','e','E'
			value = value + chars
			index = index + 1
		case else
			return dec(value)
	end choose
loop

end function

private function string parsestring (ref string str, ref long index);string quote
string chars
string code

String result

skipchar(str,index)
quote = MidA(str,index,1)
index = index + 1

do while index > 0 and index < LenA(str)
	chars = MidA(str,index,1)
	choose case chars
		case '\'
			index = index + 1
			chars = MidA(str,index,1)
			choose case chars
				case '"','\','/',"'"
					result = result + chars
					index = index + 1
				case 'b'
					result = result + '~b'
					index = index + 1
				case 'f'
					result = result + '~f'
					index = index + 1
				case 'n'
					result = result + '~n'
					index = index + 1
				case 'r'
					result = result + '~r'
					index =index + 1
				case 't'
					result = result + '~t'
					index = index + 1
				case 'u'
					index = index + 1
					code = MidA(str,index,4)
					result = result + CharA(long("&h" + code))
					index = index + 4
			end choose
		case quote
			index = index + 1
			return result
		case else
			result = result + chars
			index = index + 1
	end choose
	
loop

return result
end function

private function any parsevalue (ref string str, ref long index) throws linkhubexception;skipchar(str,index)

choose case MidA(str,index,1)
	case '{'
		return parseObject(str,index)
	case '['
		return parseArray(str,index)
	case '"',"'"
		return parseString(str,index)
	case 't','f'
		return parseBoolean(str,index)
	case 'n'
		return parseNull(str,index)
	case else
		return parseNumber(str,index)
end choose
end function

private function string parseNull (ref string str, ref long index) throws linkhubexception;skipchar(str,index)
if MidA(str,index,4) = "null" then
	index = index + 4
	return ""
end if
end function

public function any getTime() throws linkhubexception;
OLEObject lo_httpRequest,dic
string ls_result, utcTime

lo_httpRequest = CREATE OLEObject
if lo_httpRequest.ConnectToNewObject("WinHttp.WinHttpRequest.5.1") <> 0 then throw exception.setCodeNMessage(-99999999,"HttpRequest Create Fail.")
lo_httpRequest.open("GET",in_ServiceURL + "/Time",false)
lo_httpRequest.send()
lo_httpRequest.waitForResponse()

utcTime = string(lo_httpRequest.ResponseText)

if lo_httpRequest.Status <> 200 then 
	dic = parsejson(ls_result)
	exception.setCodeNMessage(dic.Item("code"),dic.Item("message"))
	lo_httpRequest.DisconnectObject()
	destroy lo_httpRequest
	dic.DisconnectObject()
	destroy dic
	throw exception
end if

lo_httpRequest.DisconnectObject()
destroy lo_httpRequest

return utcTime
end function

on authority.create
call super::create
TriggerEvent( this, "constructor" )
end on

on authority.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;exception = create linkhubexception
end event

