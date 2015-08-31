#NoTrayIcon
#pragma compile(Out, Palo_HttpAPI_Tools.exe)
#pragma compile(ExecLevel, highestavailable)
#pragma compile(Compatibility, win7)
#pragma compile(UPX, False)
#pragma compile(FileDescription, Palo Http API Tools)
#pragma compile(ProductName, PaloHttpAPI)
#pragma compile(ProductVersion, 1.4)
#pragma compile(FileVersion, 1.4.0.0, 1.4.0.0)
#pragma compile(LegalCopyright, Silence Unlimited, Inc)
#pragma compile(LegalTrademarks, '')
#pragma compile(CompanyName, 'Silence Unlimited, Inc')

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=Palo_HttpAPI_Tools.exe
#AutoIt3Wrapper_Outfile_x64=Palo_HttpAPI_Tools64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Http API Test Tools for Palo Olap
#AutoIt3Wrapper_Res_Description=Palo Http API Tools
#AutoIt3Wrapper_Res_Fileversion=1.4.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Silence Unlimited, Inc
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/striponly
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <ListViewConstants.au3>
#include <GuiImageList.au3>
#include <GuiButton.au3>

#include "Include\Palo_HttpAPI.au3"
#include "Include\MD5.au3"

Opt("MustDeclareVars", 1)
Opt("TrayIconHide", 1)
Opt("GUIOnEventMode", 1)

Global Const $Title = "Palo Http API Tools", _
			 $Author = "Rchockxm", _
			 $Mail = "rchockxm.silver@gmail.com", _
			 $Web = "http://rchockxm.com", _
			 $Version = "1.4"
Global Const $ConfigIni = @ScriptDir & "\Config.ini", _
			 $APIsDir = @ScriptDir & "\APIs", _
			 $APIsErr = LoadFileToArray(@ScriptDir & "\APIs\ErrorCode.txt"), _
			 $BatsDir = @ScriptDir & "\Example", _
			 $PlugDir = @ScriptDir & "\Lib"
Global Const $Host = IniRead($ConfigIni, "Server", "host", ""), _
			 $User = IniRead($ConfigIni, "Server", "user", ""), _
             $Pass = IniRead($ConfigIni, "Server", "pass", ""), _
             $Port = IniRead($ConfigIni, "Server", "port", "")
Global Const $Lng_Title_Main = IniRead($ConfigIni, "Lang", "title_main", $Title), _
             $Lng_Title_MD5 = IniRead($ConfigIni, "Lang", "title_md5", "MD5 Encrypter"), _
			 $Lng_Title_Str = IniRead($ConfigIni, "Lang", "title_str", "String Spilt Tools"), _
			 $Lng_Title_Api = IniRead($ConfigIni, "Lang", "title_api", "Extra API Function"), _
			 $Lng_Title_Err = IniRead($ConfigIni, "Lang", "title_err", "Error Code"), _
			 $Lng_Title_Bat = IniRead($ConfigIni, "Lang", "title_bat", "Batch Run Test Tools")
Global Const $Lng_Label_Sid = IniRead($ConfigIni, "Lang", "lb_sids", "Please log in first."), _
             $Lng_Label_Sid_Si = IniRead($ConfigIni, "Lang", "lb_sids_si", "Session Identifier (Sid):"), _
			 $Lng_Label_Time = IniRead($ConfigIni, "Lang", "lb_time", "Timeout:"), _
			 $Lng_Label_Url = IniRead($ConfigIni, "Lang", "lb_url", "Rchockxm"), _
			 $Lng_Label_Host = IniRead($ConfigIni, "Lang", "lb_host", "Host:"), _
			 $Lng_Label_User = IniRead($ConfigIni, "Lang", "lb_user", "User:"), _
			 $Lng_Label_Pass = IniRead($ConfigIni, "Lang", "lb_pass", "Pass:"), _
			 $Lng_Label_Port = IniRead($ConfigIni, "Lang", "lb_port", "Port:"), _
			 $Lng_Label_Sl = IniRead($ConfigIni, "Lang", "lb_database", "Database"), _
			 $Lng_Label_S2 = IniRead($ConfigIni, "Lang", "lb_dimensions", "Dimension"), _
			 $Lng_Label_S3 = IniRead($ConfigIni, "Lang", "lb_element", "Element"), _
			 $Lng_Label_S4 = IniRead($ConfigIni, "Lang", "lb_cube", "Cube"), _
			 $Lng_Label_S5 = IniRead($ConfigIni, "Lang", "lb_cell", "Cell"), _
			 $Lng_Label_S6 = IniRead($ConfigIni, "Lang", "lb_rules", "Rules"), _
			 $Lng_Label_Api = IniRead($ConfigIni, "Lang", "lb_api", "API:"), _
			 $Lng_Label_Arg = IniRead($ConfigIni, "Lang", "lb_arg", "Arg:")
Global Const $Lng_Btn_Login = IniRead($ConfigIni, "Lang", "btn_login", "&Login"), _
			 $Lng_Btn_Logout = IniRead($ConfigIni, "Lang", "btn_logout", "Lo&gout"), _
			 $Lng_Btn_Exit = IniRead($ConfigIni, "Lang", "btn_exit", "&Exit"), _
			 $Lng_Btn_ConMD5 = IniRead($ConfigIni, "Lang", "btn_conmd5", "&Convert String to MD5"), _
			 $Lng_Btn_Copy = IniRead($ConfigIni, "Lang", "btn_copy", "Cop&y"), _
			 $Lng_Btn_APIEx = IniRead($ConfigIni, "Lang", "btn_apiert", "ExtraA&PI"), _
			 $Lng_Btn_ErrCode = IniRead($ConfigIni, "Lang", "btn_errcode", "Error C&odes"), _
			 $Lng_Btn_Lib = IniRead($ConfigIni, "Lang", "btn_lib", "Plug&ins"), _
			 $Lng_Btn_Add = IniRead($ConfigIni, "Lang", "btn_add", "Ad&d"), _
			 $Lng_Btn_SpStr = IniRead($ConfigIni, "Lang", "btn_spstr", "Spilt String to &Array"), _
			 $Lng_Btn_About = IniRead($ConfigIni, "Lang", "btn_about", "Abou&t"), _
			 $Lng_Btn_Setting = IniRead($ConfigIni, "Lang", "btn_setting", "Settin&gs"), _
			 $Lng_Btn_BatRun = IniRead($ConfigIni, "Lang", "btn_batrun", "Batc&h Run"), _
			 $Lng_Btn_Run = IniRead($ConfigIni, "Lang", "btn_run", "Exec&ute")
Global Const $Lng_Label_ChSorStr = IniRead($ConfigIni, "Lang", "lb_csorstr", "Source String:"), _
			 $Lng_Label_ChEnStr = IniRead($ConfigIni, "Lang", "lb_censtr", "Encode String:"), _
			 $Lng_Label_ChFilt = IniRead($ConfigIni, "Lang", "lb_cfilt", "Filter String:"), _
			 $Lng_Label_ChTrim = IniRead($ConfigIni, "Lang", "lb_ctrim", "Trim:"), _
			 $Lng_Label_ChLine = IniRead($ConfigIni, "Lang", "lb_cline", "Line:"), _
			 $Lng_Label_ChServ = IniRead($ConfigIni, "Lang", "lb_cserver", "Server"), _
			 $Lng_Label_ChEvent = IniRead($ConfigIni, "Lang", "lb_cevent", "Event"), _
			 $Lng_Label_ChSvs = IniRead($ConfigIni, "Lang", "lb_csvs", "Supervision Server"), _
			 $Lng_Label_ChSorFile = IniRead($ConfigIni, "Lang", "lb_csorfile", "Source File:"), _
			 $Lng_Label_ChSSecName = IniRead($ConfigIni, "Lang", "lb_csecname", "Section Name:"), _
			 $Lng_Label_ChFuncName = IniRead($ConfigIni, "Lang", "lb_cfuncname", "Function:")
Global Const $Lng_Btn_ChGent = IniRead($ConfigIni, "Lang", "btn_cgen", "Genera&te"), _
			 $Lng_Btn_ChSend = IniRead($ConfigIni, "Lang", "btn_csnd", "Sen&d"), _
			 $Lng_Btn_ChCopy = IniRead($ConfigIni, "Lang", "btn_ccpy", "C&opy"), _
			 $Lng_Btn_ChApiEx = IniRead($ConfigIni, "Lang", "btn_capiexample", "API Exam&ple"), _
			 $Lng_Btn_ChAllRun = IniRead($ConfigIni, "Lang", "btn_callrun", "Batc&h Run"), _
			 $Lng_Btn_ChJobRun = IniRead($ConfigIni, "Lang", "btn_cjobrun", "&Jobs Run"), _
			 $Lng_Btn_ChRun = IniRead($ConfigIni, "Lang", "btn_crun", "&Run")
Global Const $Lng_Input_Title_Arg = IniRead($ConfigIni, "Lang", "ipt_tl_arg", "Parameters"), _
             $Lng_Input_Info_Arg = IniRead($ConfigIni, "Lang", "ipt_if_arg", "Please Enter API Parameters Value.")
Global Const $Msg_Title_Login = IniRead($ConfigIni, "Lang", "msg_tl_login", "Login"), _
			 $Msg_Title_Lib = IniRead($ConfigIni, "Lang", "msg_tl_lib", "Plugins Error"), _
			 $Msg_Title_About = IniRead($ConfigIni, "Lang", "msg_tl_about", "About"), _
			 $Msg_Title_RunTest = IniRead($ConfigIni, "Lang", "msg_tl_runtest", "API Test Error"), _
			 $Msg_Info_Login1 = IniRead($ConfigIni, "Lang", "msg_if_login1", "This request is used for user authentication and to get session identifiers (sid)." & @CRLF & @CRLF & "The session identifier (sid) is:"), _
			 $Msg_Info_Login2 = IniRead($ConfigIni, "Lang", "msg_if_login2", "This request is invalid where parameter 'user' or 'password' is not true." & @CRLF & @CRLF & "Error Code is:"), _
			 $Msg_Info_Lib = IniRead($ConfigIni, "Lang", "msg_if_lib", "Plugins has error(s) while initializing dll. Please checkout path or file incorrect." & @CRLF & @CRLF & "Error Code is: "), _
			 $Msg_Info_About = IniRead($ConfigIni, "Lang", "msg_if_about", "Easy to test Palo Olap by HttpAPI, with other tools."), _
			 $Msg_Info_RunTest = IniRead($ConfigIni, "Lang", "msg_if_runtest", "We intercepted a Error while use Http API. It seems not login yet." & @CRLF & @CRLF & "Please login and try again.")
Global $Lib_cURL = IniRead($ConfigIni, "Plugins", "lib_curl", "false")

Global Const $CURLOPTTYPE_LONG = 0, _
			 $CURLOPTTYPE_OBJECTPOINT = 10000, _
			 $CURLOPT_URL = 0x2712, _
			 $CURLOPT_WRITEDATA = 0x2711, _
			 $CURLOPT_WRITEFUNCTION = 0x4E2B, _
			 $CURLOPT_PROGRESSFUNCTION = 0x4E58, _
			 $CURLOPT_NOPROGRESS = 0x2B, _
			 $CURLOPT_ERRORBUFFER = 0x271A, _
			 $CURLOPT_TRANSFERTEXT = 0x35, _
			 $CURL_ERROR_SIZE = 0x100, _
			 $CURLOPT_SSL_VERIFYPEER = 0x40, _
			 $CURLOPT_COOKIEFILE = $CURLOPTTYPE_OBJECTPOINT +31, _
			 $CURLOPT_COOKIEJAR = $CURLOPTTYPE_OBJECTPOINT +82, _
			 $CURLOPT_FOLLOWLOCATION = $CURLOPTTYPE_LONG +52, _ ;/* use Location: Luke!; */
			 $CURLOPT_POSTFIELDS = $CURLOPTTYPE_OBJECTPOINT + 15, _
			 $CURLOPT_POST = $CURLOPTTYPE_LONG +47, _ ;/* HTTP POST method; */
			 $CURLOPT_POSTFIELDSIZE = $CURLOPTTYPE_LONG +60, _
			 $CURLOPT_HTTPHEADER = $CURLOPTTYPE_OBJECTPOINT +23

Global $IsLogin = False, $SidStr, $TimeStr
Global $HwndMD5, $SrcStr1, $SrcStr2, $BtnBtn1, $BtnBtn2
Global $HwndStr, $StrStr1, $StrStr2, $StrStr3, $StrStr4, $StrBtn1, $StrBtn2
Global $HwndErr, $ErrEdit
Global $HwndApi, $Cl_Radio1, $Cl_Radio2, $Cl_Radio3, $Sr_Combo1, $Sr_Combo2, $Sr_Input1, $Ev_Combo1, $Ev_Combo2, $Ev_Input1, $Sv_Combo1, $Sv_Combo2, $Sv_Input1, $ApiBtn1, $ApiBtn2
Global $HwndBat, $BatStr1, $BatStr2, $BatStr3, $BatStr4, $BatBtn1, $BatBtn2, $BatBtn3

Global $HwndForm = GUICreate($Author & " - " & $Lng_Title_Main & " " & $Version, 598, 440, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU))
Global $Label_Sid = GUICtrlCreateLabel($Lng_Label_Sid, 6, 404, 150, 17)
Global $Label_Time = GUICtrlCreateLabel("", 6, 420, 150, 17)
Global $Label_Url = GUICtrlCreateLabel($Lng_Label_Url, 146, 410, 80)

GUICtrlSetFont($Label_Url, 9, 400, 4, "Arial")
GUICtrlSetColor($Label_Url, 0x0000FF)
GUICtrlSetCursor($Label_Url, 0)

GUICtrlCreateLabel($Lng_Label_Host, 6, 7, 50, 17)
GUICtrlCreateLabel($Lng_Label_User, 6, 28, 50, 17)
GUICtrlCreateLabel($Lng_Label_Pass, 170, 28, 50, 17)
GUICtrlCreateLabel($Lng_Label_Port, 348, 7, 50, 17)

Global $Srv_Host = GUICtrlCreateInput($Host, 40, 4, 300, 18)
Global $Srv_User = GUICtrlCreateInput($User, 40, 26, 120, 18)
Global $Srv_Pass = GUICtrlCreateInput($Pass, 204, 26, 220, 18)
Global $Srv_Port = GUICtrlCreateInput($Port, 382, 4, 40, 18)
Global $Srv_Btn1 = GUICtrlCreateButton($Lng_Btn_Login, 428, 3, 80, 20)
Global $Srv_Btn2 = GUICtrlCreateButton($Lng_Btn_Exit, 514, 3, 80, 20)
Global $Srv_Btn3 = GUICtrlCreateButton($Lng_Btn_ConMD5, 428, 25, 165, 20)

_GUICtrlButton_SetImageList($Srv_Btn1, GetImageListHandle("shell32.dll", 44, False))
_GUICtrlButton_SetImageList($Srv_Btn2, GetImageListHandle("shell32.dll", 27, False))
_GUICtrlButton_SetImageList($Srv_Btn3, GetImageListHandle("shell32.dll", 110, False))

GUICtrlCreateGroup("", 6, 48, 190, 105)
Global $Sl_Radio1 = GUICtrlCreateRadio($Lng_Label_Sl, 14, 46)
Global $Db_Combo1 = GUICtrlCreateCombo("", 56, 68, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Db_Combo2 = GUICtrlCreateCombo("", 56, 92, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Db_Input1 = GUICtrlCreateInput("/database/", 16, 120, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 16, 70, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 16, 94, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("", 202, 48, 190, 105)
Global $Sl_Radio2 = GUICtrlCreateRadio($Lng_Label_S2, 210, 46)
Global $Ds_Combo1 = GUICtrlCreateCombo("", 252, 68, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Ds_Combo2 = GUICtrlCreateCombo("", 252, 92, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Ds_Input1 = GUICtrlCreateInput("/dimension/", 212, 120, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 212, 70, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 212, 94, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("", 402, 48, 190, 105)
Global $Sl_Radio3 = GUICtrlCreateRadio($Lng_Label_S3, 410, 46)
Global $En_Combo1 = GUICtrlCreateCombo("", 452, 68, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $En_Combo2 = GUICtrlCreateCombo("", 452, 92, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $En_Input1 = GUICtrlCreateInput("/element/", 412, 120, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 412, 70, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 412, 94, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("", 6, 160, 190, 105)
Global $Sl_Radio4 = GUICtrlCreateRadio($Lng_Label_S4, 14, 158)
Global $Ce_Combo1 = GUICtrlCreateCombo("", 56, 180, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Ce_Combo2 = GUICtrlCreateCombo("", 56, 204, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Ce_Input1 = GUICtrlCreateInput("/cube/", 16, 232, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 16, 182, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 16, 206, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("", 202, 160, 190, 105)
Global $Sl_Radio5 = GUICtrlCreateRadio($Lng_Label_S5, 210, 158)
Global $Cl_Combo1 = GUICtrlCreateCombo("", 252, 180, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Cl_Combo2 = GUICtrlCreateCombo("", 252, 204, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Cl_Input1 = GUICtrlCreateInput("/cell/", 212, 232, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 212, 182, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 212, 206, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateGroup("", 402, 160, 190, 105)
Global $Sl_Radio6 = GUICtrlCreateRadio($Lng_Label_S6, 410, 158)
Global $Re_Combo1 = GUICtrlCreateCombo("", 452, 180, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Re_Combo2 = GUICtrlCreateCombo("", 452, 204, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Global $Re_Input1 = GUICtrlCreateInput("/rules/", 412, 232, 170, 20)
GUICtrlCreateLabel($Lng_Label_Api, 412, 182, 40, 17)
GUICtrlCreateLabel($Lng_Label_Arg, 412, 206, 40, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)

Global $Btn_Cpy = GUICtrlCreateButton($Lng_Btn_Copy, 6, 272, 60, 20)
Global $APIUrl = GUICtrlCreateInput("", 70, 272, 322, 20)
Global $APIRet = GUICtrlCreateEdit("", 6, 296, 386, 76)
Global $Btn_Api = GUICtrlCreateButton($Lng_Btn_APIEx, 6, 376, 90, 20)
Global $Btn_Err = GUICtrlCreateButton($Lng_Btn_ErrCode, 100, 376, 90, 20)
Global $Btn_Lib = GUICtrlCreateButton($Lng_Btn_Lib, 194, 376, 90, 20)

Global $Btn_Add = GUICtrlCreateButton($Lng_Btn_Add, 402, 272, 60, 20)
Global $Btn_Str = GUICtrlCreateButton($Lng_Btn_SpStr, 468, 272, 124, 20)
Global $APIStr = GUICtrlCreateEdit("", 402, 296, 190, 100)

Global $Btn_Abo = GUICtrlCreateButton($Lng_Btn_About, 220, 408, 90, 20)
Global $Btn_Set = GUICtrlCreateButton($Lng_Btn_Setting, 314, 408, 90, 20)
Global $Btn_Bat = GUICtrlCreateButton($Lng_Btn_BatRun, 408, 408, 90, 20)
Global $Btn_Run = GUICtrlCreateButton($Lng_Btn_Run, 502, 408, 90, 20)

Global $PopMenuDummy = GUICtrlCreateDummy()
Global $PopMenuContext = GUICtrlCreateContextMenu($PopMenuDummy)
Global $PopMenu_Lib1 = GUICtrlCreateMenuItem("cURL - libcurl.dll", $PopMenuContext)

_GUICtrlButton_SetImageList($Btn_Cpy, GetImageListHandle("shell32.dll", 43, False))
_GUICtrlButton_SetImageList($Btn_Api, GetImageListHandle("shell32.dll", 223, False))
_GUICtrlButton_SetImageList($Btn_Err, GetImageListHandle("shell32.dll", 210, False))
_GUICtrlButton_SetImageList($Btn_Lib, GetImageListHandle("shell32.dll", 72, False))
_GUICtrlButton_SetImageList($Btn_Add, GetImageListHandle("shell32.dll", 176, False))
_GUICtrlButton_SetImageList($Btn_Str, GetImageListHandle("shell32.dll", 134, False))
_GUICtrlButton_SetImageList($Btn_Abo, GetImageListHandle("shell32.dll", 57, False))
_GUICtrlButton_SetImageList($Btn_Set, GetImageListHandle("shell32.dll", 69, False))
_GUICtrlButton_SetImageList($Btn_Bat, GetImageListHandle("shell32.dll", 71, False))
_GUICtrlButton_SetImageList($Btn_Run, GetImageListHandle("shell32.dll", 166, False))

Ini_LoadFormFile($APIsDir & "\database.ini", $Db_Combo1)
Ini_LoadFormFile($APIsDir & "\dimension.ini", $Ds_Combo1)
Ini_LoadFormFile($APIsDir & "\element.ini", $En_Combo1)
Ini_LoadFormFile($APIsDir & "\cube.ini", $Ce_Combo1)
Ini_LoadFormFile($APIsDir & "\cell.ini", $Cl_Combo1)
Ini_LoadFormFile($APIsDir & "\rules.ini", $Re_Combo1)

Global $hDll_Libcurl, $pWriteFunc, $curlout
If FileExists($PlugDir & "\libcurl.dll") Then
	If $Lib_cURL = "true" Then
		GUICtrlSetState($PopMenu_Lib1, $GUI_CHECKED)
		FileChangeDir($PlugDir)
		$hDll_Libcurl = DllOpen($PlugDir & "\libcurl.dll")
		If $hDll_Libcurl = -1 Then
			$Lib_cURL = "false"
			GUICtrlSetState($PopMenu_Lib1, $GUI_DISABLE)
			Msgbox(4096, $Msg_Title_Lib, $Msg_Info_Lib & $hDll_Libcurl, Default, $HwndForm)
		Else
			$pWriteFunc = DllCallbackRegister("cURL_WriteFunc", "uint", "ptr;uint;uint;ptr")
		EndIf
	EndIf
Else
	$Lib_cURL = "false"
	GUICtrlSetState($PopMenu_Lib1, $GUI_DISABLE)
EndIf
FileChangeDir(@ScriptDir)

GUISetOnEvent($GUI_EVENT_CLOSE, "WindowCallback", $HwndForm)

GUICtrlSetOnEvent($Label_Url, "WindowCallback")

GUICtrlSetOnEvent($Srv_Btn1, "WindowCallback")
GUICtrlSetOnEvent($Srv_Btn2, "WindowCallback")
GUICtrlSetOnEvent($Srv_Btn3, "WindowCallback")

GUICtrlSetOnEvent($Sl_Radio1, "WindowCallback")
GUICtrlSetOnEvent($Sl_Radio2, "WindowCallback")
GUICtrlSetOnEvent($Sl_Radio3, "WindowCallback")
GUICtrlSetOnEvent($Sl_Radio4, "WindowCallback")
GUICtrlSetOnEvent($Sl_Radio5, "WindowCallback")
GUICtrlSetOnEvent($Sl_Radio6, "WindowCallback")

GUICtrlSetOnEvent($Btn_Cpy, "WindowCallback")
GUICtrlSetOnEvent($Btn_Api, "WindowCallback")
GUICtrlSetOnEvent($Btn_Err, "WindowCallback")
GUICtrlSetOnEvent($Btn_Lib, "WindowCallback")
GUICtrlSetOnEvent($Btn_Add, "WindowCallback")
GUICtrlSetOnEvent($Btn_Str, "WindowCallback")
GUICtrlSetOnEvent($Btn_Abo, "WindowCallback")
GUICtrlSetOnEvent($Btn_Set, "WindowCallback")
GUICtrlSetOnEvent($Btn_Bat, "WindowCallback")
GUICtrlSetOnEvent($Btn_Run, "WindowCallback")

GUICtrlSetOnEvent($PopMenu_Lib1, "WindowCallback")

OnAutoItExitRegister("WindowsCallback_Exit")

GUISetState(@SW_SHOW, $HwndForm)
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

While 1
	Sleep(10)
WEnd

Func WindowCallback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Label_Url
			ShellExecute($Web)
		Case $Srv_Btn1
			If Not $IsLogin Then
				Local $SndRet
				If $Lib_cURL = "true" And $hDll_Libcurl Then
					$SndRet = cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & "/server/login?user=" & GUICtrlRead($Srv_User) & "&password=" & GUICtrlRead($Srv_Pass), "")
				Else
					$SndRet = Server_Login(GUICtrlRead($Srv_Host), GUICtrlRead($Srv_Port), GUICtrlRead($Srv_User), GUICtrlRead($Srv_Pass), "")
				EndIf
				Local $Code = StringSplit($SndRet, ";")
				If $Code[0] >= 2 Then
					$SidStr = $Code[1]
					$TimeStr = $Code[2]
				Else
					$SidStr = StringMid($SndRet, 1, 4)
					$TimeStr = StringMid($SndRet, 6, 4)
				EndIf
				GUICtrlSetData($APIRet, $SndRet & @CRLF)
				GUICtrlSetData($Label_Sid, $Lng_Label_Sid_Si & " " & $SidStr)
				If Not Palo_IsError($SndRet) Then
					$IsLogin = True
					GUICtrlSetData($Srv_Btn1, $Lng_Btn_Logout)
					GUICtrlSetData($Label_Time, $Lng_Label_Time & " " & $TimeStr)
					AdlibRegister("PaloTimeOut_Timer", 1000)
					MsgBox(4096, $Msg_Title_Login, $Msg_Info_Login1 & " " & $SidStr, Default, $HwndForm)
				Else
					GUICtrlSetData($Srv_Btn1, $Lng_Btn_Login)
					MsgBox(4096, $Msg_Title_Login, $Msg_Info_Login2 & " " & $SidStr, Default, $HwndForm)
					GUICtrlSendMsg($Btn_Err, $BM_CLICK, 0, 0)
				EndIf
			Else
				$IsLogin = False
				GUICtrlSetData($Srv_Btn1, $Lng_Btn_Login)
				GUICtrlSetData($Label_Sid ,$Lng_Label_Sid)
				GUICtrlSetData($Label_Time, "")
				AdlibUnRegister("PaloTimeOut_Timer")
				If $Lib_cURL = "true" And $hDll_Libcurl Then
					cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & "/server/logout?sid=" & $SidStr, "")
				Else
					Server_Logout(GUICtrlRead($Srv_Host), GUICtrlRead($Srv_Port), $SidStr)
				EndIf
			EndIf
		Case $Srv_Btn2
			Exit
		Case $Srv_Btn3
			If Not IsHWnd($HwndMD5) Then
				_MD5_Startup()
				Local $MD5Str = StringLower(StringTrimLeft(_MD5(GUICtrlRead($Srv_Pass)), 2))
				$HwndMD5 = GUICreate($Lng_Title_MD5, 430, 80, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU), $WS_EX_TOOLWINDOW, $HwndForm)
				$SrcStr1 = GUICtrlCreateInput(GUICtrlRead($Srv_Pass), 80, 8, 344, 18)
				$SrcStr2 = GUICtrlCreateInput($MD5Str, 80, 32, 344, 18)
				$BtnBtn1 = GUICtrlCreateButton($Lng_Btn_ChGent, 270, 55, 75, 18)
				$BtnBtn2 = GUICtrlCreateButton($Lng_Btn_ChSend, 350, 55, 75, 18)
				GUICtrlCreateLabel($Lng_Label_ChSorStr, 4, 11, 75, 17)
				GUICtrlCreateLabel($Lng_Label_ChEnStr, 4, 35, 75, 17)
				GUISetOnEvent($GUI_EVENT_CLOSE, "WindowChdMD5Callback", $HwndMD5)
				GUICtrlSetOnEvent($BtnBtn1, "WindowChdMD5Callback")
				GUICtrlSetOnEvent($BtnBtn2, "WindowChdMD5Callback")
				GUISetState(@SW_SHOW, $HwndMD5)
			EndIf
		Case $Sl_Radio1
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio3, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio4, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio5, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio6, $GUI_UNCHECKED)
		Case $Sl_Radio2
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio3, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio4, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio5, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio6, $GUI_UNCHECKED)
		Case $Sl_Radio3
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio4, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio5, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio6, $GUI_UNCHECKED)
		Case $Sl_Radio4
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio3, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio5, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio6, $GUI_UNCHECKED)
		Case $Sl_Radio5
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio3, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio4, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio6, $GUI_UNCHECKED)
		Case $Sl_Radio6
			GUICtrlSetData($APIUrl, "")
			GUICtrlSetState($Sl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio3, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio4, $GUI_UNCHECKED)
			GUICtrlSetState($Sl_Radio5, $GUI_UNCHECKED)
		Case $Btn_Cpy
			ClipPut(GUICtrlRead($APIUrl))
		Case $Btn_Api
			If Not IsHWnd($HwndApi) Then
				$HwndApi = GUICreate($Lng_Title_Api, 594, 140, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU), $WS_EX_TOOLWINDOW, $HwndForm)
				GUICtrlCreateGroup("", 6, 6, 190, 105)
				$Cl_Radio1 = GUICtrlCreateRadio($Lng_Label_ChServ, 14, 4)
				$Sr_Combo1 = GUICtrlCreateCombo("", 56, 26, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Sr_Combo2 = GUICtrlCreateCombo("", 56, 50, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Sr_Input1 = GUICtrlCreateInput("/server/", 16, 78, 170, 20)
				GUICtrlCreateLabel($Lng_Label_Api, 16, 28, 40, 17)
				GUICtrlCreateLabel($Lng_Label_Arg, 16, 52, 40, 17)
				GUICtrlCreateGroup("", -99, -99, 1, 1)
				GUICtrlCreateGroup("", 202, 6, 190, 105)
				$Cl_Radio2 = GUICtrlCreateRadio($Lng_Label_ChEvent, 210, 4)
				$Ev_Combo1 = GUICtrlCreateCombo("", 252, 26, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Ev_Combo2 = GUICtrlCreateCombo("", 252, 50, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Ev_Input1 = GUICtrlCreateInput("/event/", 212, 78, 170, 20)
				GUICtrlCreateLabel($Lng_Label_Api, 212, 28, 40, 17)
				GUICtrlCreateLabel($Lng_Label_Arg, 212, 52, 40, 17)
				GUICtrlCreateGroup("", -99, -99, 1, 1)
				GUICtrlCreateGroup("", 398, 6, 190, 105)
				$Cl_Radio3 = GUICtrlCreateRadio($Lng_Label_ChSvs, 408, 4)
				$Sv_Combo1 = GUICtrlCreateCombo("", 448, 26, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Sv_Combo2 = GUICtrlCreateCombo("", 448, 50, 130, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$Sv_Input1 = GUICtrlCreateInput("/svs/", 408, 78, 170, 20)
				GUICtrlCreateLabel($Lng_Label_Api, 408, 28, 40, 17)
				GUICtrlCreateLabel($Lng_Label_Arg, 408, 52, 40, 17)
				GUICtrlCreateGroup("", -99, -99, 1, 1)
				$ApiBtn1 = GUICtrlCreateButton($Lng_Btn_ChApiEx, 419, 115, 90, 18)
				$ApiBtn2 = GUICtrlCreateButton($Lng_Btn_ChSend, 514, 115, 75, 18)
				Ini_LoadFormFile($APIsDir & "\server.ini", $Sr_Combo1)
				Ini_LoadFormFile($APIsDir & "\event.ini", $Ev_Combo1)
				Ini_LoadFormFile($APIsDir & "\svs.ini", $Sv_Combo1)
				GUISetOnEvent($GUI_EVENT_CLOSE, "WindowChdApiCallback", $HwndApi)
				GUICtrlSetOnEvent($Cl_Radio1, "WindowChdApiCallback")
				GUICtrlSetOnEvent($Cl_Radio2, "WindowChdApiCallback")
				GUICtrlSetOnEvent($Cl_Radio3, "WindowChdApiCallback")
				GUICtrlSetOnEvent($ApiBtn1, "WindowChdApiCallback")
				GUICtrlSetOnEvent($ApiBtn2, "WindowChdApiCallback")
				GUISetState(@SW_SHOW, $HwndApi)
			EndIf
		Case $Btn_Err
			If Not IsHWnd($HwndErr) Then
				$HwndErr = GUICreate($Lng_Title_Err, 450, 280, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU), $WS_EX_TOOLWINDOW, $HwndForm)
				$ErrEdit = GUICtrlCreateEdit("", 4, 4, 442, 272, BitOR($GUI_SS_DEFAULT_EDIT,$ES_READONLY))
				GUICtrlSetData($ErrEdit, $APIsErr)
				GUISetOnEvent($GUI_EVENT_CLOSE, "WindowChdErrCallback", $HwndErr)
				GUISetState(@SW_SHOW, $HwndErr)
			EndIf
		Case $Btn_Lib
			ShowPopupMenu($HwndForm, @GUI_CtrlID, $PopMenuContext)
		Case $Btn_Add
			Local $StrVar = ""
			Select
				Case GUICtrlRead($Sl_Radio1) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Db_Input1)
				Case GUICtrlRead($Sl_Radio2) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Ds_Input1)
				Case GUICtrlRead($Sl_Radio3) = $GUI_CHECKED
					$StrVar = GUICtrlRead($En_Input1)
				Case GUICtrlRead($Sl_Radio4) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Ce_Input1)
				Case GUICtrlRead($Sl_Radio5) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Cl_Input1)
				Case GUICtrlRead($Sl_Radio6) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Re_Input1)
			EndSelect
			If StringRight($StrVar, 1) = "&" Or StringRight($StrVar, 1) = "?" Then $StrVar = StringTrimRight($StrVar, 1)
			GUICtrlSetData($APIUrl, $StrVar)
		Case $Btn_Str
			If Not IsHWnd($HwndStr) Then
				$HwndStr = GUICreate($Lng_Title_Str, 430, 80, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU), $WS_EX_TOOLWINDOW, $HwndForm)
				$StrStr1 = GUICtrlCreateInput(GUICtrlRead($APIRet), 80, 8, 344, 18)
				$StrStr2 = GUICtrlCreateInput(";", 80, 32, 80, 18)
				$StrStr3 = GUICtrlCreateInput('"', 208, 32, 80, 18)
				$StrStr4 = GUICtrlCreateInput('13,10', 336, 32, 87, 18)
				$StrBtn1 = GUICtrlCreateButton($Lng_Btn_ChCopy, 270, 55, 75, 18)
				$StrBtn2 = GUICtrlCreateButton($Lng_Btn_ChSend, 350, 55, 75, 18)
				GUICtrlCreateLabel($Lng_Label_ChSorStr, 4, 11, 75, 17)
				GUICtrlCreateLabel($Lng_Label_ChFilt, 4, 35, 75, 17)
				GUICtrlCreateLabel($Lng_Label_ChTrim, 166, 35, 40, 17)
				GUICtrlCreateLabel($Lng_Label_ChLine, 294, 35, 40, 17)
				GUISetOnEvent($GUI_EVENT_CLOSE, "WindowChdStrCallback", $HwndStr)
				GUICtrlSetOnEvent($StrBtn1, "WindowChdStrCallback")
				GUICtrlSetOnEvent($StrBtn2, "WindowChdStrCallback")
				GUISetState(@SW_SHOW, $HwndStr)
			EndIf
		Case $Btn_Abo
			Msgbox(32, $Msg_Title_About, $Title & " " & $Version & @CRLF & @CRLF & $Msg_Info_About & @CRLF & @CRLF & _
					"Third-Party Files:" & @CRLF & "cURL - libcurl.dll 7.24.0 <Daniel Stenberg>" & @CRLF & @CRLF & _
					$Author & " (" & $Mail & ")" & @CRLF & $Web, Default, $HwndForm)
		Case $Btn_Set
			ShellExecute($ConfigIni, "", @ScriptDir, "open")
		Case $Btn_Bat
			If Not IsHWnd($HwndBat) Then
				$HwndBat = GUICreate($Lng_Title_Bat, 430, 80, Default, Default, Bitor($WS_CAPTION, $WS_BORDER, $WS_SYSMENU), $WS_EX_TOOLWINDOW, $HwndForm)
				$BatStr1 = GUICtrlCreateCombo("", 80, 8, 140, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$BatStr2 = GUICtrlCreateCombo("", 302, 8, 120, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$BatStr3 = GUICtrlCreateCombo("", 80, 32, 100, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				$BatStr4 = GUICtrlCreateInput("", 186, 33, 235, 18)
				$BatBtn1 = GUICtrlCreateButton($Lng_Btn_ChAllRun, 190, 55, 75, 18)
				$BatBtn2 = GUICtrlCreateButton($Lng_Btn_ChJobRun, 270, 55, 75, 18)
				$BatBtn3 = GUICtrlCreateButton($Lng_Btn_ChRun, 350, 55, 75, 18)
				GUICtrlCreateLabel($Lng_Label_ChSorFile, 4, 11, 75, 17)
				GUICtrlCreateLabel($Lng_Label_ChSSecName, 226, 11, 75, 17)
				GUICtrlCreateLabel($Lng_Label_ChFuncName, 4, 35, 75, 17)
				Ini_LoadFormDir($BatsDir, $BatStr1)
				GUISetOnEvent($GUI_EVENT_CLOSE, "WindowChdBatCallback", $HwndBat)
				GUICtrlSetOnEvent($BatBtn1, "WindowChdBatCallback")
				GUICtrlSetOnEvent($BatBtn2, "WindowChdBatCallback")
				GUICtrlSetOnEvent($BatBtn3, "WindowChdBatCallback")
				GUISetState(@SW_SHOW, $HwndBat)
			EndIf
		Case $Btn_Run
			If Not GUICtrlRead($APIUrl) = "" And $IsLogin Then
				Local $Ret
				If $Lib_cURL = "true" And $hDll_Libcurl Then
					$Ret = cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & GUICtrlRead($APIUrl) & "&sid=" & $SidStr, "")
				Else
					$Ret = PaloAPI(GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & GUICtrlRead($APIUrl) & "&sid=" & $SidStr)
				EndIf
				If Palo_IsError($Ret) Then GUICtrlSendMsg($Btn_Err, $BM_CLICK, 0, 0)
				GUICtrlSetData($APIRet, $Ret & @CRLF)
			Else
				Msgbox(4096, $Msg_Title_RunTest, $Msg_Info_RunTest, Default, $HwndForm)
			EndIf
		Case $PopMenu_Lib1
			If GUICtrlRead($PopMenu_Lib1) = 65 Then
				$Lib_cURL = "fasle"
				GUICtrlSetState($PopMenu_Lib1, $GUI_UNCHECKED)
			Else
				If FileExists($PlugDir & "\libcurl.dll") Then
					$Lib_cURL = "true"
					GUICtrlSetState($PopMenu_Lib1, $GUI_CHECKED)
				EndIf
			EndIf
    EndSwitch
EndFunc

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
    #forceref $hWnd, $iMsg
    Local $iCode = BitShift($iwParam, 16)
    Local $nID = BitAND($iwParam, 0x0000FFFF)
    Local $hCtrl = $ilParam
	Switch $hWnd
		Case $HwndForm
			Switch $hCtrl
				Case GUICtrlGetHandle($Db_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\database.ini", GUICtrlRead($Db_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Db_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Db_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Db_Input1, "/database/" & GUICtrlRead($Db_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Db_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\database.ini", GUICtrlRead($Db_Combo1), GUICtrlRead($Db_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($Db_Input1, GUICtrlRead($Db_Input1) & GUICtrlRead($Db_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Ds_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\dimension.ini", GUICtrlRead($Ds_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Ds_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Ds_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Ds_Input1, "/dimension/" & GUICtrlRead($Ds_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Ds_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\dimension.ini", GUICtrlRead($Ds_Combo1), GUICtrlRead($Ds_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($Ds_Input1, GUICtrlRead($Ds_Input1) & GUICtrlRead($Ds_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($En_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\element.ini", GUICtrlRead($En_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($En_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($En_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($En_Input1, "/element/" & GUICtrlRead($En_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($En_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\element.ini", GUICtrlRead($En_Combo1), GUICtrlRead($En_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($En_Input1, GUICtrlRead($En_Input1) & GUICtrlRead($En_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Ce_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\cube.ini", GUICtrlRead($Ce_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Ce_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Ce_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Ce_Input1, "/cube/" & GUICtrlRead($Ce_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Ce_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\cube.ini", GUICtrlRead($Ce_Combo1), GUICtrlRead($Ce_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($Ce_Input1, GUICtrlRead($Ce_Input1) & GUICtrlRead($Ce_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Cl_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\cell.ini", GUICtrlRead($Cl_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Cl_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Cl_Combo2, $Sec[$i][0])
								Next
								GUICtrlSetData($Cl_Input1, "/cell/" & GUICtrlRead($Cl_Combo1) & "?")
							EndIf
					EndSwitch
				Case GUICtrlGetHandle($Cl_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\cell.ini", GUICtrlRead($Cl_Combo1), GUICtrlRead($Cl_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($Cl_Input1, GUICtrlRead($Cl_Input1) & GUICtrlRead($Cl_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Re_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\rules.ini", GUICtrlRead($Re_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Re_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Re_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Re_Input1, "/rules/" & GUICtrlRead($Re_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Re_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\rules.ini", GUICtrlRead($Re_Combo1), GUICtrlRead($Re_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndForm)
							If $Val Then GUICtrlSetData($Re_Input1, GUICtrlRead($Re_Input1) & GUICtrlRead($Re_Combo2) & "=" & $Val & "&")
					EndSwitch
			EndSwitch
		Case $HwndApi
			Switch $hCtrl
				Case GUICtrlGetHandle($Sr_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\server.ini", GUICtrlRead($Sr_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Sr_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Sr_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Sr_Input1, "/server/" & GUICtrlRead($Sr_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Sr_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\server.ini", GUICtrlRead($Sr_Combo1), GUICtrlRead($Sr_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndApi)
							If $Val Then GUICtrlSetData($Sr_Input1, GUICtrlRead($Sr_Input1) & GUICtrlRead($Sr_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Ev_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\event.ini", GUICtrlRead($Ev_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Ev_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Ev_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Ev_Input1, "/event/" & GUICtrlRead($Ev_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Ev_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\event.ini", GUICtrlRead($Ev_Combo1), GUICtrlRead($Ev_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndApi)
							If $Val Then GUICtrlSetData($Ev_Input1, GUICtrlRead($Ev_Input1) & GUICtrlRead($Ev_Combo2) & "=" & $Val & "&")
					EndSwitch
				Case GUICtrlGetHandle($Sv_Combo1)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Sec = IniReadSection($APIsDir & "\svs.ini", GUICtrlRead($Sv_Combo1))
							If IsArray($Sec) Then
								GUICtrlSetData($Sv_Combo2, "")
								For $i = 1 To $Sec[0][0]
									GUICtrlSetData($Sv_Combo2, $Sec[$i][0])
								Next
							EndIf
							GUICtrlSetData($Sv_Input1, "/svs/" & GUICtrlRead($Sv_Combo1) & "?")
					EndSwitch
				Case GUICtrlGetHandle($Sv_Combo2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Local $Val = InputBox($Lng_Input_Title_Arg, $Lng_Input_Info_Arg, IniRead($APIsDir & "\svs.ini", GUICtrlRead($Sv_Combo1), GUICtrlRead($Sv_Combo2), ""), "", 200, 140, Default, Default, Default, $HwndApi)
							If $Val Then GUICtrlSetData($Sv_Input1, GUICtrlRead($Sv_Input1) & GUICtrlRead($Sv_Combo2) & "=" & $Val & "&")
					EndSwitch
			EndSwitch
		Case $HwndBat
			Switch $hCtrl
				Case GUICtrlGetHandle($BatStr1)
					Switch $iCode
						Case $CBN_SELCHANGE
							GUICtrlSetData($BatStr3, "")
							Ini_LoadFormFile($BatsDir & "\" & GUICtrlRead($BatStr1), $BatStr2)
					EndSwitch
				Case GUICtrlGetHandle($BatStr2)
					Switch $iCode
						Case $CBN_SELCHANGE
							Ini_LoadFormKeyname($BatsDir & "\" & GUICtrlRead($BatStr1), GUICtrlRead($BatStr2), $BatStr3)
					EndSwitch
				Case GUICtrlGetHandle($BatStr3)
					Switch $iCode
						Case $CBN_SELCHANGE
							GUICtrlSetData($BatStr4, IniRead($BatsDir & "\" & GUICtrlRead($BatStr1), GUICtrlRead($BatStr2), GUICtrlRead($BatStr3), ""))
					EndSwitch
			EndSwitch
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc

Func WindowsCallback_Exit()
	If $IsLogin Then
		If $Lib_cURL = "true" And $hDll_Libcurl Then
			cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & "/server/logout?sid=" & $SidStr, "")
		Else
			Server_Logout(GUICtrlRead($Srv_Host), GUICtrlRead($Srv_Port), $SidStr)
		Endif
	EndIf
	If $hDll_Libcurl Then
		DllCallbackFree($pWriteFunc)
		DllClose($hDll_Libcurl)
	EndIf
	GUIDelete()
EndFunc

Func WindowChdMD5Callback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			_MD5_Exit()
			GUIDelete($HwndMD5)
		Case $BtnBtn1
			Local $MD5Str = StringLower(StringTrimLeft(_MD5(GUICtrlRead($SrcStr1)), 2))
			GUICtrlSetData($SrcStr2, $MD5Str)
		Case $BtnBtn2
			_MD5_Exit()
			GUICtrlSetData($Srv_Pass, GUICtrlRead($SrcStr2))
			GUIDelete($HwndMD5)
	EndSwitch
EndFunc

Func WindowChdStrCallback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			GUIDelete($HwndStr)
		Case $StrBtn1
			ClipPut(GUICtrlRead($StrStr1))
		Case $StrBtn2
			Local $NewString, $NewLine, $Linebreak, $StrSt
			Local $StrL = StringSplit(GUICtrlRead($StrStr4), ",")
			If $StrL[0] > 1 Then
				For $i = 1 To $StrL[0]
					$Linebreak = $Linebreak & Chr($StrL[$i])
				Next
			EndIf
			$NewLine = StringSplit(GUICtrlRead($StrStr1), $Linebreak)
			;If $NewLine[0] > 1 Then
				For $i = 1 To $NewLine[0]
					$StrSt = StringSplit($NewLine[$i], GUICtrlRead($StrStr2))
					If $StrSt[0] > 1 Then
						For $j = 1 To $StrSt[0]
							If Not $StrSt[$j] = "" Then
								If StringRight($StrSt[$j], 1) = GUICtrlRead($StrStr3) Then $StrSt[$j] = StringTrimRight($StrSt[$j], 1)
								If StringLeft($StrSt[$j], 1) = GUICtrlRead($StrStr3) Then $StrSt[$j] = StringTrimLeft($StrSt[$j], 1)
								$NewString = $NewString & $j-1 & "=" & $StrSt[$j] & $Linebreak
							EndIf
						Next
					EndIf
					$NewString = $NewString & $Linebreak
				Next
			;EndIf
			GUICtrlSetData($APIStr, $NewString)
			GUIDelete($HwndStr)
	EndSwitch
EndFunc

Func WindowChdErrCallback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			GUIDelete($HwndErr)
	EndSwitch
EndFunc

Func WindowChdApiCallback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			GUIDelete($HwndApi)
		Case $Cl_Radio1
			GUICtrlSetState($Cl_Radio2, $GUI_UNCHECKED)
			GUICtrlSetState($Cl_Radio3, $GUI_UNCHECKED)
		Case $Cl_Radio2
			GUICtrlSetState($Cl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Cl_Radio3, $GUI_UNCHECKED)
		Case $Cl_Radio3
			GUICtrlSetState($Cl_Radio1, $GUI_UNCHECKED)
			GUICtrlSetState($Cl_Radio2, $GUI_UNCHECKED)
		Case $ApiBtn1
			ShellExecute($APIsDir, "", $APIsDir, "open")
		Case $ApiBtn2
			Local $StrVar = ""
			Select
				Case GUICtrlRead($Cl_Radio1) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Sr_Input1)
				Case GUICtrlRead($Cl_Radio2) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Ev_Input1)
				Case GUICtrlRead($Cl_Radio3) = $GUI_CHECKED
					$StrVar = GUICtrlRead($Sv_Input1)
			EndSelect
			If StringRight($StrVar, 1) = "&" Or StringRight($StrVar, 1) = "?" Then $StrVar = StringTrimRight($StrVar, 1)
			GUICtrlSetData($APIUrl, $StrVar)
			GUIDelete($HwndApi)
	EndSwitch
EndFunc

Func WindowChdBatCallback()
    Switch @GUI_CtrlID
		Case $GUI_EVENT_CLOSE
			GUIDelete($HwndBat)
		Case $BatBtn1
			If Not GUICtrlRead($BatStr1) = "" And $IsLogin Then
				Ini_RunFormFile($BatsDir & "\" & GUICtrlRead($BatStr1), "")
			Else
				Msgbox(4096, $Msg_Title_RunTest, $Msg_Info_RunTest, Default, $HwndBat)
			EndIf
		Case $BatBtn2
			If Not (GUICtrlRead($BatStr1) = "" Or GUICtrlRead($BatStr2) = "") And $IsLogin Then
				Ini_RunFormFile($BatsDir & "\" & GUICtrlRead($BatStr1), GUICtrlRead($BatStr2))
			Else
				Msgbox(4096, $Msg_Title_RunTest, $Msg_Info_RunTest, Default, $HwndBat)
			EndIf
		Case $BatBtn3
			If Not GUICtrlRead($BatStr4) = "" And $IsLogin Then
				Local $Ret
				If $Lib_cURL = "true" And $hDll_Libcurl Then
					$Ret = cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & GUICtrlRead($BatStr4) & "&sid=" & $SidStr, "")
				Else
					$Ret = PaloAPI(GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & GUICtrlRead($BatStr4) & "&sid=" & $SidStr)
				EndIf
				If Palo_IsError($Ret) Then GUICtrlSendMsg($Btn_Err, $BM_CLICK, 0, 0)
				GUICtrlSetData($APIRet, $Ret & @CRLF, 1)
			Else
				Msgbox(4096, $Msg_Title_RunTest, $Msg_Info_RunTest, Default, $HwndBat)
			EndIf
	EndSwitch
EndFunc

Func PaloTimeOut_Timer()
	If $TimeStr > 0 Then
		$TimeStr -= 1
		GUICtrlSetData($Label_Time, $Lng_Label_Time & " " & $TimeStr)
	Else
		$IsLogin = False
		GUICtrlSetData($Srv_Btn1, $Lng_Btn_Login)
		GUICtrlSetData($Label_Sid ,$Lng_Label_Sid)
		GUICtrlSetData($Label_Time, "")
		AdlibUnRegister("PaloTimeOut_Timer")
	EndIf
EndFunc

Func Ini_LoadFormFile($Path, $Ctrl)
	GUICtrlSetData($Ctrl, "")
	Local $F = IniReadSectionNames($Path)
	If @error Then Return False
	For $i = 1 To $F[0]
		GUICtrlSetData($Ctrl, $F[$i])
    Next
	Return True
EndFunc

Func Ini_LoadFormDir($Dir, $Ctrl)
	GUICtrlSetData($Ctrl, "")
	Local $H = FileFindFirstFile($Dir & "\*.ini")
	If $H <> -1 Then
		While 1
			Local $File = FileFindNextFile($H)
			If @error Then ExitLoop
			GUICtrlSetData($Ctrl, $File)
		WEnd
		FileClose($H)
	EndIf
	Return True
EndFunc

Func Ini_LoadFormKeyname($Path, $Sec, $Ctrl)
	GUICtrlSetData($Ctrl, "")
	Local $F = IniReadSection($Path, $Sec)
	If $F <> -1 And IsArray($F) Then
		For $i = 1 To $F[0][0]
			GUICtrlSetData($Ctrl, $F[$i][0])
		Next
	EndIf
	Return True
EndFunc

Func Ini_RunFormFile($Path, $Sec)
	Local $Ret = False
	Local $Snname, $Scname, $Cos, $Arr
	If $Sec = "" Then
		$Snname = IniReadSectionNames($Path)
		If $Snname <> -1 And IsArray($Snname) Then
			For $i = 1 To $Snname[0]
				$Scname = IniReadSection($Path, $Snname[$i])
				If $Scname <> -1 And IsArray($Scname) Then
					$Arr = $Scname
					For $j = 1 To $Scname[0][0]
						If Not $Scname[$i][1] = "" Then
							If $Lib_cURL = "true" And $hDll_Libcurl Then
								$Cos = cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & $Scname[$i][1] & "&sid=" & $SidStr, "")
							Else
								$Cos = PaloAPI(GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & $Scname[$i][1] & "&sid=" & $SidStr)
							EndIf
							GUICtrlSetData($APIRet, $Cos & @CRLF, 1)
						EndIf
					Next
					$Ret = True
				EndIf
			Next
		EndIf
	Else
		$Scname = IniReadSection($Path, $Sec)
		If $Scname <> -1 And IsArray($Scname) Then
			$Arr = $Scname
			For $i = 1 To $Scname[0][0]
				If Not $Scname[$i][1] = "" Then
					If $Lib_cURL = "true" And $hDll_Libcurl Then
						$Cos = cURL_easy("cookie.txt", GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & $Scname[$i][1] & "&sid=" & $SidStr, "")
					Else
						$Cos = PaloAPI(GUICtrlRead($Srv_Host) & ":" & GUICtrlRead($Srv_Port) & $Scname[$i][1] & "&sid=" & $SidStr)
					EndIf
					GUICtrlSetData($APIRet, $Cos & @CRLF, 1)
				EndIf
			Next
			$Ret = True
		EndIf
	EndIf
	Return $Ret
EndFunc

Func LoadFileToArray($Path)
	Local $Line, $Str
	Local $File = FileOpen($Path, 0)
	If $File <> -1 Then
		While 1
			$Line = FileReadLine($File)
			If @error = -1 Then ExitLoop
			$Str = $Str & $Line & @CRLF
		WEnd
		FileClose($File)
	EndIf
	Return $Str
EndFunc

Func GetImageListHandle($sFile, $nIconID = 0, $fLarge = False)
    Local $iSize = 14
    If $fLarge Then $iSize = 32
    Local $hImage = _GUIImageList_Create($iSize, $iSize, 5, 3)
    If StringUpper(StringMid($sFile, StringLen($sFile) - 2)) = "BMP" Then
        _GUIImageList_AddBitmap($hImage, $sFile)
    Else
        _GUIImageList_AddIcon($hImage, $sFile, $nIconID, $fLarge)
    EndIf
    Return $hImage
EndFunc

Func Palo_IsError($Str, $Ecode = $APIsErr)
	Local $Cod = StringSplit($Str, ";"), $Kst1 = $Str, $Kst2
	Local $Ret = False
	If $Cod[0] > 1 Then	$Kst1 = $Cod[1]
	If $Cod[0] > 2 Then $Kst2 = $Cod[2]
	If BitOR($Kst1 = 1, $Kst1 = 2, $Kst1 = 3) And IsInt($Kst2) Then
		$Ret = True
	Else
		If StringInStr($Ecode, StringMid($Str, 1, 4)) > 0 Then $Ret = True
	EndIf
	Return $Ret
EndFunc

Func ShowPopupMenu($hWnd, $CtrlID, $nContextID)
    Local $arPos, $x, $y
    Local $hMenu = GUICtrlGetHandle($nContextID)
    $arPos = ControlGetPos($hWnd, "", $CtrlID)
    $x = $arPos[0] + ($arPos[2]/2)
    $y = $arPos[1] + $arPos[3]
    ClientToScreen($hWnd, $x, $y)
    TrackPopupMenu($hWnd, $hMenu, $x, $y)
EndFunc

Func TrackPopupMenu($hWnd, $hMenu, $x, $y)
    DllCall("user32.dll", "int", "TrackPopupMenuEx", "hwnd", $hMenu, "int", 0, "int", $x, "int", $y, "hwnd", $hWnd, "ptr", 0)
EndFunc

Func ClientToScreen($hWnd, ByRef $x, ByRef $y)
    Local $stPoint = DllStructCreate("int;int")
    DllStructSetData($stPoint, 1, $x)
    DllStructSetData($stPoint, 2, $y)
    DllCall("user32.dll", "int", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($stPoint))
    $x = DllStructGetData($stPoint, 1)
    $y = DllStructGetData($stPoint, 2)
    $stPoint = 0
EndFunc

Func cURL_WriteFunc($ptr, $nSize, $nMemb, $pStream)
   Local $vData = DllStructCreate("byte[" & $nSize*$nMemb & "]",$ptr)
   $curlout = $curlout & BinaryToString(DllStructGetData($vData,1))
   Return $nSize*$nMemb
EndFunc

Func cURL_easy($cookie, $url, $postfields, $ssl_verifypeer = 0, $noprogress = 1, $clear_cookie = 0, $read_cookie = 1, $write_cookie = 1, $followlocation = 0)
	Local $hCurlHandle, $cookie_struct, $postfields_struct
	$hCurlHandle = DllCall($hDll_LibCurl, "ptr:cdecl", "curl_easy_init")
	If @error Then Return
	$hCurlHandle = $hCurlHandle[0]
	If $read_cookie = 1 Or $write_cookie = 1 Then
		$cookie_struct = DllStructCreate("char[256]")
		DllStructSetData($cookie_struct, 1, $cookie)
		If $read_cookie = 1 Then
			DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_COOKIEFILE, "ptr", DllStructGetPtr($cookie_struct))
		EndIf
		If $write_cookie = 1 Then
			DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_COOKIEJAR, "ptr", DllStructGetPtr($cookie_struct))
		EndIf
	EndIf
	If StringLen($postfields) > 0 Then
		$postfields_struct = DllStructCreate("char[256]")
		DllStructSetData($postfields_struct, 1, $postfields)
		DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_POSTFIELDS, "ptr", DllStructGetPtr($postfields_struct))
	EndIf
	Local $url_struct = DllStructCreate("char[256]")
	DllStructSetData($url_struct, 1, $url)
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_URL, "ptr", DllStructGetPtr($url_struct))
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_NOPROGRESS, "int", $noprogress)
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_WRITEFUNCTION, "ptr", DllCallbackGetPtr($pWriteFunc))
	Local $CURL_ERROR = DllStructCreate("char[" & $CURL_ERROR_SIZE + 1 & "]")
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_ERRORBUFFER, "ptr", DllStructGetPtr($CURL_ERROR))
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_SSL_VERIFYPEER, "int", $ssl_verifypeer)
	DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_setopt", "ptr", $hCurlHandle, "uint", $CURLOPT_FOLLOWLOCATION, "int", $followlocation)
	$curlout = ""
	If $clear_cookie = 1 Then FileDelete($cookie)
	Local $nPerform = DllCall($hDll_LibCurl, "uint:cdecl", "curl_easy_perform", "ptr", $hCurlHandle)
	$nPerform = $nPerform[0]
	If $nPerform <> 0 Then
		ConsoleWrite("! " & DllStructGetData($CURL_ERROR, 1) & @CRLF)
	EndIf
	DllCall($hDll_LibCurl, "none:cdecl", "curl_easy_cleanup", "ptr", $hCurlHandle)
	Return $curlout
EndFunc

Func cURL_Slist_Append($slist, $append)
	Local $aResult = DllCall($hDll_Libcurl, "ptr:cdecl", "curl_slist_append", 'ptr', $slist, 'str', $append)
	If @error Then Return SetError(1, 0, 0)
	Return $aResult[0]
EndFunc