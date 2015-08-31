#Include-once

Global $oErrorHandler = ObjEvent("AutoIt.Error", "MyErrFunc")
Global $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
;Global $WshShell = ObjCreate("Wscript.Shell")

Func MyErrFunc()
	Msgbox(0,   "COM Test","We intercepted a COM Error !"               & @CRLF  & @CRLF & _
				"err.description is: "    & @TAB & $oErrorHandler.description    & @CRLF & _
				"err.windescription:"     & @TAB & $oErrorHandler.windescription & @CRLF & _
				"err.number is: "         & @TAB & Hex($oErrorHandler.number, 8) & @CRLF & _
				"err.lastdllerror is: "   & @TAB & $oErrorHandler.lastdllerror   & @CRLF & _
				"err.scriptline is: "     & @TAB & $oErrorHandler.scriptline     & @CRLF & _
				"err.source is: "         & @TAB & $oErrorHandler.source         & @CRLF & _
				"err.helpfile is: "       & @TAB & $oErrorHandler.helpfile       & @CRLF & _
				"err.helpcontext is: "    & @TAB & $oErrorHandler.helpcontext)
	SetError(1)
Endfunc

Func PaloAPI($Url)
	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_License($Server_N, $Port_N)
	Local $Url = $Server_N & ":" & $Port_N & "/server/license"

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_Info($Server_N, $Port_N)
	Local $Url = $Server_N & ":" & $Port_N & "/server/info"

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_Login($Server_N, $Port_N, $User, $Password, $Password_Ext = "")
	Local $Url = $Server_N & ":" & $Port_N & "/server/login?" & _
				"user=" & $User & _
				"&password=" & $Password

	If Not $Password_Ext = "" Then $Url = $Url & "&extern_password=" & $Password_Ext
	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText ; "sid;timeout;"
EndFunc

Func Server_Logout($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/server/logout?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return True
EndFunc

Func Server_Database($Server_N, $Port_N, $Sid, $Show_Normal = 1, $Show_System = 1, $Show_User_Info = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/server/databases?sid=" & $Sid & _
				"&show_normal" & $Show_Normal & _
				"&show_system" & $Show_System & _
				"&show_user_info" & $Show_User_Info

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_Load($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/server/load?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_Save($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/server/save?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Server_Shutdown($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/server/shutdown?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Cubes($Server_N, $Port_N, $Sid, $Database, $Show_Normal = 1, $Show_System = 1, $Show_Attribute = 1, $Show_Info = 1, $Show_Gputype = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/database/cubes?sid=" & $Sid & "&database=" & $Database & _
				"&show_normal=" & $Show_Normal & _
				"&show_system=" & $Show_System & _
				"&show_attribute=" & $Show_Attribute & _
				"&show_info=" & $Show_Info & _
				"&show_gputype=" & $Show_Gputype

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Create($Server_N, $Port_N, $Sid, $New_Name, $Type)
	Local $Url = $Server_N & ":" & $Port_N & "/database/create?sid=" & $Sid & _
				"&new_name=" & $New_Name

	If Not $Type = "" Then $Url = $Url & "&type=" & $Type

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Destroy($Server_N, $Port_N, $Sid, $Database)
	Local $Url = $Server_N & ":" & $Port_N & "/database/destroy?sid=" & $Sid & _
				"&database=" & $Database

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Dimensions($Server_N, $Port_N, $Sid, $Database, $Show_Normal = 1, $Show_System = 1, $Show_Attribute = 1, $Show_Info = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/database/dimensions?sid=" & $Sid & _
				"&database=" & $Database & _
				"&show_normal=" & $Show_Normal & _
				"&show_system=" & $Show_System & _
				"&show_attribute=" & $Show_Attribute & _
				"&show_info=" & $Show_Info

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Info($Server_N, $Port_N, $Sid, $Database)
	Local $Url = $Server_N & ":" & $Port_N & "/database/info?sid=" & $Sid & _
				"&database=" & $Database

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Load($Server_N, $Port_N, $Sid, $Database)
	Local $Url = $Server_N & ":" & $Port_N & "/database/load?sid=" & $Sid & _
				"&database=" & $Database

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Rename($Server_N, $Port_N, $Sid, $Database, $New_Name)
	Local $Url = $Server_N & ":" & $Port_N & "/database/rename?sid=" & $Sid & _
				"&database=" & $Database & _
				"&new_name=" & $New_Name

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Save($Server_N, $Port_N, $Sid, $Database)
	Local $Url = $Server_N & ":" & $Port_N & "/database/save?sid=" & $Sid & _
				"&database=" & $Database

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Database_Unload($Server_N, $Port_N, $Sid, $Database)
	Local $Url = $Server_N & ":" & $Port_N & "/database/unload?sid=" & $Sid & _
				"&database=" & $Database

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Clear($Server_N, $Port_N, $Sid, $Database, $Dimension)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/clear?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Create($Server_N, $Port_N, $Sid, $Database, $New_Name, $Type)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/create?sid=" & $Sid & _
				"&database=" & $Database & _
				"&new_name=" & $New_Name

	If Not $Type = "" Then $Url = $Url & "&type=" & $Type

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Cubes($Server_N, $Port_N, $Sid, $Database, $Dimension, $Show_Normal = 1, $Show_System = 0, $Show_Attribute = 0, $Show_Info = 0, $Show_Gputype = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/cubes?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&show_normal=" & $Show_Normal & _
				"&show_system=" & $Show_System & _
				"&show_attribute=" & $Show_Attribute & _
				"&show_info=" & $Show_Info & _
				"&show_gputype=" & $Show_Gputype

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Destroy($Server_N, $Port_N, $Sid, $Database, $Dimension)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/destroy?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Element($Server_N, $Port_N, $Sid, $Database, $Dimension, $Position)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/element?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&position=" & $Position

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Elements($Server_N, $Port_N, $Sid, $Database, $Dimension, $Parent = "", $Limit = "")
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/elements?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&parent=" & $Parent & _
				"&limit=" & $Limit

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Info($Server_N, $Port_N, $Sid, $Database, $Dimension)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/info?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Rename($Server_N, $Port_N, $Sid, $Database, $Dimension, $New_name)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/rename?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&$new_name=" & $New_name

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Dimension_Dfilter($Server_N, $Port_N, $Sid, $Database, $Dimension, $Cube, $Area, $Mode, $Condition, $Values)
	Local $Url = $Server_N & ":" & $Port_N & "/dimension/dfilter?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&cube=" & $Cube & _
				"&area=" & $Area & _
				"&mode=" & $Mode & _
				"&condition=" & $Condition & _
				"&values=" & $Values

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Append($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element, $Children, $Weights = "")
	Local $Url = $Server_N & ":" & $Port_N & "/element/append?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element & _
				"&children=" & $Children & _
				"&weights=" & $Weights

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Create($Server_N, $Port_N, $Sid, $Database, $Dimension, $New_Name, $Type, $Children, $Weights = "")
	Local $Url = $Server_N & ":" & $Port_N & "/element/create?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&new_name=" & $New_Name & _
				"&type=" & $Type & _
				"&children=" & $Children & _
				"&weights=" & $Weights

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Create_Bulk($Server_N, $Port_N, $Sid, $Database, $Dimension, $Name_Elements, $Type, $Types, $Children, $Name_Children, $Weights = "")
	Local $Url = $Server_N & ":" & $Port_N & "/element/create_bulk?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&name_elements=" & $Name_Elements & _
				"&type=" & $Type & _
				"&types=" & $Types & _
				"&children=" & $Children & _
				"&name_children=" & $Name_Children & _
				"&weights=" & $Weights

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Destroy($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element)
	Local $Url = $Server_N & ":" & $Port_N & "/element/destroy?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Destroy_Bulk($Server_N, $Port_N, $Sid, $Database, $Dimension, $Elements, $Name_Elements)
	Local $Url = $Server_N & ":" & $Port_N & "/element/destroy_bulk?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&elements=" & $Elements & _
				"&name_elements=" & $Name_Elements

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Info($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element)
	Local $Url = $Server_N & ":" & $Port_N & "/element/info?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Move($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element, $Position)
	Local $Url = $Server_N & ":" & $Port_N & "/element/move?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element & _
				"&position=" & $Position

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Rename($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element, $New_Name)
	Local $Url = $Server_N & ":" & $Port_N & "/element/rename?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element  & _
				"&new_name=" & $New_Name

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Replace($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element, $Name_Element, $Type, $Children, $Weights = "")
	Local $Url = $Server_N & ":" & $Port_N & "/element/replace?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element & _
				"&name_element=" & $Name_Element & _
				"&type=" & $Type & _
				"&children=" & $Children & _
				"&weights=" & $Weights

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Element_Replace_Bulk($Server_N, $Port_N, $Sid, $Database, $Dimension, $Element, $Name_Elements, $Type, $Children, $Weights = "")
	Local $Url = $Server_N & ":" & $Port_N & "/element/replace_bulk?sid=" & $Sid & _
				"&database=" & $Database & _
				"&dimension=" & $Dimension & _
				"&element=" & $Element & _
				"&name_elements=" & $Name_Elements & _
				"&type=" & $Type & _
				"&children=" & $Children & _
				"&weights=" & $Weights

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Clear($Server_N, $Port_N, $Sid, $Database, $Cube, $Area, $Complete = "")
	Local $Url = $Server_N & ":" & $Port_N & "/cube/clear?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&area=" & $Area & _
				"&complete=" & $Complete

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Commit($Server_N, $Port_N, $Sid, $Database, $Cube, $Lock)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/commit?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&lock=" & $Lock

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Create($Server_N, $Port_N, $Sid, $Database, $New_Name, $Dimensions, $Type = 0)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/create?sid=" & $Sid & _
				"&database=" & $Database & _
				"&new_name=" & $New_Name & _
				"&dimensions=" & $Dimensions & _
				"&type=" & $Type

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Destroy($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/destroy?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Info($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/info?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Load($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/load?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Lock($Server_N, $Port_N, $Sid, $Database, $Cube, $Area)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/lock?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&area=" & $Area

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Locks($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/locks?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Rename($Server_N, $Port_N, $Sid, $Database, $Cube, $New_name)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/rename?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&new_name=" & $New_name

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Rollback($Server_N, $Port_N, $Sid, $Database, $Cube, $Lock, $Steps)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/rollback?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&lock=" & $Lock & _
				"&steps=" & $Steps

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Rules($Server_N, $Port_N, $Sid, $Database, $Cube, $Use_Identifier)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/rules?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&use_identifier=" & $Use_Identifier

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Save($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/save?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cube_Unload($Server_N, $Port_N, $Sid, $Database, $Cube)
	Local $Url = $Server_N & ":" & $Port_N & "/cube/unload?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Area($Server_N, $Port_N, $Sid, $Database, $Cube, $Area, $Show_Rule, $Show_Lock_Info)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/area?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&area=" & $Area & _
				"&show_rule=" & $Show_Rule & _
				"&show_lock_info=" & $Show_Lock_Info

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Copy($Server_N, $Port_N, $Sid, $Database, $Cube, $Path, $Path_To, $Value)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/copy?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&path=" & $Path & _
				"&path_to=" & $Path_To & _
				"&value=" & $Value

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Drillthrough($Server_N, $Port_N, $Sid, $Database, $Cube, $Path, $Mode)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/drillthrough?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&path=" & $Path & _
				"&mode=" & $Mode

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Export($Server_N, $Port_N, $Sid, $Database, $Cube, $Blocksize = 1000, $Path = "", $Area = "", $Condition = "", $Use_Rules = 0, $Base_Only = 0, $Skip_Empty = 1, $Type = 0)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/export?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&blocksize=" & $Blocksize & _
				"&path=" & $Path & _
				"&area=" & $Area & _
				"&condition=" & $Condition & _
				"&use_rules=" & $Use_Rules & _
				"&base_only=" & $Base_Only & _
				"&skip_empty=" & $Skip_Empty & _
				"&type=" & $Type

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Goalseek($Server_N, $Port_N, $Sid, $Database, $Cube, $Path, $Value)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/goalseek?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&path=" & $Path & _
				"&value=" & $Value

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Replace($Server_N, $Port_N, $Sid, $Database, $Cube, $Path, $Value, $Add = 0, $Splash = 1, $Event_Processor = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/replace?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&path=" & $Path & _
				"&value=" & $Value & _
				"&add=" & $Add & _
				"&splash=" & $Splash & _
				"&event_processor=" & $Event_Processor

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Replace_Bulk($Server_N, $Port_N, $Sid, $Database, $Cube, $Paths, $Values, $Add = 0, $Splash = 1, $Event_Processor = 1)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/replace_bulk?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&paths=" & $Paths & _
				"&values=" & $Values & _
				"&add=" & $Add & _
				"&splash=" & $Splash & _
				"&event_processor=" & $Event_Processor

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Value($Server_N, $Port_N, $Sid, $Database, $Cube, $Path, $Show_Rule, $Show_Lock_Info)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/value?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&path=" & $Path & _
				"&show_rule=" & $Show_Rule & _
				"&show_lock_info=" & $Show_Lock_Info

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Cell_Values($Server_N, $Port_N, $Sid, $Database, $Cube, $Paths, $Show_Rule, $Show_Lock_Info)
	Local $Url = $Server_N & ":" & $Port_N & "/cell/values?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&paths=" & $Paths & _
				"&show_rule=" & $Show_Rule & _
				"&show_lock_info=" & $Show_Lock_Info

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Event_Begin($Server_N, $Port_N, $Sid, $Source, $Event)
	Local $Url = $Server_N & ":" & $Port_N & "/event/begin?sid=" & $Sid & _
				"&source=" & $Source & _
				"&event=" & $Event

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Event_End($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/event/end?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Create($Server_N, $Port_N, $Sid, $Database, $Cube, $Definition, $Activate, $External_Identifier, $Comment, $Use_Identifier)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/create?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&definition=" & $Definition & _
				"&activate=" & $Activate & _
				"&external_identifier=" & $External_Identifier & _
				"&comment=" & $Comment & _
				"&use_identifier=" & $Use_Identifier

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Destroy($Server_N, $Port_N, $Sid, $Database, $Cube, $Rule)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/destroy?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&rule=" & $Rule

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Functions($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/functions?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Info($Server_N, $Port_N, $Sid, $Database, $Cube, $Rule, $Use_Identifier)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/info?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&rule=" & $Rule & _
				"&use_identifier=" & $Use_Identifier

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Modify($Server_N, $Port_N, $Sid, $Database, $Cube, $Definition, $Activate, $External_Identifier, $Comment, $Use_Identifier)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/modify?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&definition=" & $Definition & _
				"&activate=" & $Activate & _
				"&external_identifier=" & $External_Identifier & _
				"&comment=" & $Comment & _
				"&use_identifier=" & $Use_Identifier

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Rule_Parse($Server_N, $Port_N, $Sid, $Database, $Cube, $Functions, $Definition)
	Local $Url = $Server_N & ":" & $Port_N & "/rule/parse?sid=" & $Sid & _
				"&database=" & $Database & _
				"&cube=" & $Cube & _
				"&functions=" & $Functions & _
				"&definition=" & $Definition

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc

Func Svs_Info($Server_N, $Port_N, $Sid)
	Local $Url = $Server_N & ":" & $Port_N & "/svs/info?sid=" & $Sid

	$WinHttpReq.open("GET", $Url, False)
	$WinHttpReq.send()

	Return $WinHttpReq.responseText
EndFunc